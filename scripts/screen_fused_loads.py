#!/usr/bin/env python3
"""Generate and compile two bounded NEON twiddle-load experiments, without timing."""
from collections import Counter
import difflib
import hashlib
import json
from pathlib import Path
import re
import subprocess
from build_experiment import BASE, FLAGS, INCLUDES, ROOT


def guarded(original, replacement):
    return ('#if defined(__ARM_NEON) && !defined(FLINT_MACHINE_VECTORS_GENERIC)\n'
            + replacement + '#else\n' + original + '#endif\n')


def forward(source):
    # Only the nonzero 16- and 32-point leaves. The zero leaf shares its
    # contiguous twiddle load with another operand, so it is left alone.
    old = '''    u  = vec4d_load_aligned(&Q->w2tab[3+j_bits][8*j_r+0]);
    v  = vec4d_load_aligned(&Q->w2tab[3+j_bits][8*j_r+4]);
    w2 = vec4d_load_aligned(&Q->w2tab[2+j_bits][4*j_r+0]);
    w  = vec4d_unpack_lo_permute_0_2_1_3(u, v);
    iw = vec4d_unpack_hi_permute_0_2_1_3(u, v);
'''
    def loads(pointer, lo, hi):
        return f'''    {{
        const double *tw = {pointer};
        float64x2x2_t a = vld2q_f64(tw);
        float64x2x2_t b = vld2q_f64(tw + 4);
        {lo} = vec4d_set_vec2d2(a.val[0], b.val[0]); /* 0 2 4 6 */
        {hi} = vec4d_set_vec2d2(a.val[1], b.val[1]); /* 1 3 5 7 */
    }}
'''
    new = loads('&Q->w2tab[3+j_bits][8*j_r]', 'w', 'iw')
    new += '    w2 = vec4d_load_aligned(&Q->w2tab[2+j_bits][4*j_r+0]);\n'
    assert source.count(old) == 1
    source = source.replace(old, guarded(old, new))
    for offset in [0, 4]:
        old = f'''    u  = vec4d_load_aligned(&Q->w2tab[1+(3+j_bits)][2*(8*j_r+{offset})+0]);
    v  = vec4d_load_aligned(&Q->w2tab[1+(3+j_bits)][2*(8*j_r+{offset})+4]);
    ww0 = vec4d_unpack_lo_permute_0_2_1_3(u, v);
    ww1 = vec4d_unpack_hi_permute_0_2_1_3(u, v);
'''
        assert source.count(old) == 1
        source = source.replace(old, guarded(old, loads(
            f'&Q->w2tab[4+j_bits][16*j_r+{2*offset}]', 'ww0', 'ww1')))
    return source


def inverse(source):
    old = '''    u  = vec4d_load_aligned(&Q->w2tab[3+j_bits][8*j_mr+0]); /* 0 1 2 3 */
    v  = vec4d_load_aligned(&Q->w2tab[3+j_bits][8*j_mr+4]); /* 4 5 6 7 */
    W  = vec4d_unpackhi_permute_3_1_2_0(u, v);              /* 7 5 3 1 */
    IW = vec4d_unpacklo_permute_3_1_2_0(u, v);              /* 6 4 2 0 */
'''
    new = '''    {
        const double *tw = &Q->w2tab[3+j_bits][8*j_mr];
        float64x2x2_t a = vld2q_f64(tw);
        float64x2x2_t b = vld2q_f64(tw + 4);
        W = vec4d_set_vec2d2(vextq_f64(b.val[1], b.val[1], 1),
                            vextq_f64(a.val[1], a.val[1], 1)); /* 7 5 3 1 */
        IW = vec4d_set_vec2d2(vextq_f64(b.val[0], b.val[0], 1),
                             vextq_f64(a.val[0], a.val[0], 1)); /* 6 4 2 0 */
    }
'''
    assert source.count(old) == 1
    return source.replace(old, guarded(old, new))


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    dest = ROOT/'build/fused-load-screen'
    dest.mkdir(parents=True, exist_ok=False)
    evidence = ROOT/'results/fused-load-checks'
    evidence.mkdir(parents=True, exist_ok=False)
    commands, functions, hashes = [], [], {}
    for kind, transform in [('fft', forward), ('ifft', inverse)]:
        path = f'src/fft_small/sd_{kind}.c'
        original = (BASE/path).read_text()
        modified = transform(original)
        patch = ROOT/f'patches/fused-load-{kind}.patch'
        patch_text = ''.join(difflib.unified_diff(
            original.splitlines(True), modified.splitlines(True),
            fromfile='a/'+path, tofile='b/'+path))
        if patch.exists():
            assert patch.read_text() == patch_text, 'Existing patch differs from generated patch'
        else:
            patch.write_text(patch_text)
        hashes[str(patch.relative_to(ROOT))] = sha(patch)
        for name, source in [('control', original), ('fused', modified)]:
            cfile = dest/f'{name}-{kind}.c'
            cfile.write_text(source)
            asm = dest/f'{name}-{kind}.s'
            command = ['clang', *FLAGS, *INCLUDES, '-DBUILDING_FLINT',
                       '-DFLINT_NOSTDIO', '-DFLINT_NOSTDARG', '-S', str(cfile), '-o', str(asm)]
            subprocess.run(command, check=True)
            commands.append(command)
            assembly = asm.read_text()
            for exponent in [4, 5]:
                symbol = f'_sd_{kind}_basecase_{exponent}_0'
                start = assembly.index('\n'+symbol+':')+1
                end = assembly.index('\nLfunc_end', start)
                region = assembly[start:end]
                artifact = evidence/f'{name}-{kind}-{exponent}.asm'
                artifact.write_text(region+'\n')
                hashes[str(artifact.relative_to(ROOT))] = sha(artifact)
                instructions = []
                for line in region.splitlines():
                    match = re.match(r'^\s+([a-z][a-z0-9.]*)(?:\s|$)', line)
                    if match:
                        instructions.append((match[1], line.strip()))
                functions.append({'variant': name, 'function': symbol,
                    'instructions': len(instructions),
                    'opcode_counts': dict(sorted(Counter(op for op, _ in instructions).items())),
                    'stack_address_references': sum('[sp' in line for _, line in instructions),
                    'calls_or_tail_branches': [line for op, line in instructions if op in ['bl', 'b']]})
    report = {'functions': functions, 'commands': commands, 'sha256': hashes,
        'scope': 'Static function bodies including returns, excluding child bodies. '
                 'Stack references include ABI saves. Instruction count is a screen, not a runtime prediction.'}
    (ROOT/'results/fused-load-assembly.json').write_text(json.dumps(report, indent=2)+'\n')
    for entry in functions:
        print(entry['variant'], entry['function'], entry['instructions'],
              'stack refs', entry['stack_address_references'],
              'ld2', entry['opcode_counts'].get('ld2.2d', 0))


if __name__ == '__main__':
    main()
