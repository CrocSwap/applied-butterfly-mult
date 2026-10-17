#!/usr/bin/env python3
"""Generate and compile a radix-8 inverse with three rather than five even-branch reductions."""
from collections import Counter
import difflib
import hashlib
import json
import re
import subprocess
from build_experiment import ROOT, BASE, FLAGS, INCLUDES


def modified(source):
    start = source.index('#define LENGTH8INV_ANY_J(')
    end = source.index('#define LENGTH8INV_ZERO_J(', start)
    declaration = source[start:source.index('\n', start)+1]
    lines = ['{',
        '    T A0=x0, A1=x1, A2=x2, A3=x3, A4=x4, A5=x5, A6=x6, A7=x7;']
    for i in range(4):
        a, b = 2*i, 2*i+1
        lines += ['    {', f'        T S = CAT(T, add)(A{a}, A{b});',
            f'        A{b} = CAT(T, mulmod_fast)(CAT(T, sub)(A{b}, A{a}), www{i}, n, ninv);',
            f'        A{a} = S;', '    }']
    lines += ['    {',
        '        T B0 = CAT(T, add)(A0, A2);',
        '        T B1 = CAT(T, add)(A4, A6);',
        '        T B2 = CAT(T, sub)(A0, A2);',
        '        T B3 = CAT(T, sub)(A6, A4);',
        '        B0 = CAT(T, reduce_to_pm1n)(B0, n, ninv);',
        '        B1 = CAT(T, reduce_to_pm1n)(B1, n, ninv);',
        '        /* |B2|, |B3| < 8p: use full mulmod, not mulmod_fast. */',
        '        B2 = CAT(T, mulmod)(B2, ww0, n, ninv);',
        '        B3 = CAT(T, mulmod)(B3, ww1, n, ninv);',
        '        A0 = CAT(T, add)(B0, B1);',
        '        A2 = CAT(T, reduce_to_pm1n)(CAT(T, sub)(B3, B2), n, ninv);',
        '        A4 = CAT(T, mulmod_fast)(CAT(T, sub)(B1, B0), w0, n, ninv);',
        '        A6 = CAT(T, mulmod_fast)(CAT(T, add)(B3, B2), w0, n, ninv);',
        '    }',
        '    LENGTH4INV_ANY_J(T, A1,A3,A5,A7, n,ninv, w0,ww0,ww1)']
    lines += [f'    x{i} = A{i};' for i in range(8)]
    lines += ['}']
    comment = '''/* Delayed reductions in the even branch; see docs/delayed-reductions-m2.md.
   Inputs and outputs remain strictly inside (-2p, 2p). All additions have
   magnitude < 8p < 2^53. The two enlarged products stay below 4p^2.
   The zero-twiddle macro and physical layout are unchanged. */
'''
    macro = declaration + ' \\\n'.join(lines) + '\n\n'
    return source[:start] + comment + macro + source[end:]


def main():
    dest = ROOT/'build/delayed-reduction-screen'
    dest.mkdir(parents=True, exist_ok=False)
    evidence = ROOT/'results/delayed-reduction-checks'
    evidence.mkdir(parents=True, exist_ok=False)
    path = 'src/fft_small/sd_ifft.c'
    original = (BASE/path).read_text()
    candidate = modified(original)
    patch = ROOT/'patches/delayed-reduction.patch'
    patch_text = ''.join(difflib.unified_diff(original.splitlines(True), candidate.splitlines(True),
                                            fromfile='a/'+path, tofile='b/'+path))
    if patch.exists():
        assert patch.read_text() == patch_text
    else:
        patch.write_text(patch_text)
    entries, commands = [], []
    for name, source in [('control', original), ('delayed', candidate)]:
        cfile = dest/f'{name}.c'
        cfile.write_text(source)
        asm = dest/f'{name}.s'
        cmd = ['clang', *FLAGS, *INCLUDES, '-DBUILDING_FLINT', '-DFLINT_NOSTDIO',
               '-DFLINT_NOSTDARG', '-S', str(cfile), '-o', str(asm)]
        subprocess.run(cmd, check=True)
        commands.append(cmd)
        assembly = asm.read_text()
        for exponent in [4, 5]:
            symbol = f'_sd_ifft_basecase_{exponent}_0'
            start = assembly.index('\n'+symbol+':')+1
            region = assembly[start:assembly.index('\nLfunc_end', start)]+'\n'
            artifact = evidence/f'{name}-ifft-{exponent}.asm'
            artifact.write_text(region)
            instructions = []
            for line in region.splitlines():
                match = re.match(r'^\s+([a-z][a-z0-9.]*)(?:\s|$)', line)
                if match:
                    instructions.append((match[1], line.strip()))
            entries.append({'variant': name, 'function': symbol, 'instructions': len(instructions),
                'opcode_counts': dict(sorted(Counter(op for op, _ in instructions).items())),
                'stack_address_references': sum('[sp' in line for _, line in instructions),
                'calls_or_tail_branches': [line for op, line in instructions if op in ['bl', 'b']],
                'artifact': str(artifact.relative_to(ROOT)),
                'sha256': hashlib.sha256(artifact.read_bytes()).hexdigest()})
    report = {'functions': entries, 'commands': commands,
        'scope': 'Static instructions in complete named bodies; stack references include ABI saves. '
                 'Counts do not predict runtime.'}
    (ROOT/'results/delayed-reduction-assembly.json').write_text(json.dumps(report, indent=2)+'\n')
    for r in entries:
        print(r['variant'], r['function'], r['instructions'], 'stack refs', r['stack_address_references'])


if __name__ == '__main__':
    main()
