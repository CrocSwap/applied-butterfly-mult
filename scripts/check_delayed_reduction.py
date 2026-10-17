#!/usr/bin/env python3
"""Compile direct wrappers from the exact screened sources and stress their ranges."""
import hashlib
import json
import subprocess
from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS


def main():
    dest = ROOT/'build/delayed-reduction-screen'
    objects, commands = [], []
    for name in ['control', 'delayed']:
        source = (dest/f'{name}.c').read_text()
        source = source.replace('void sd_ifft_trunc(', f'void bf_{name}_sd_ifft_trunc(')
        source += f'''
void bf_{name}_8(double *x, const double *w, double n, double ninv) {{
    LENGTH8INV_ANY_J(vec1d,x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7],
                    n,ninv,w[0],w[1],w[2],w[3],w[4],w[5],w[6]);
}}
void bf_{name}_32(const sd_fft_ctx_t Q, double *x, ulong jr, ulong bits) {{
    sd_ifft_basecase_5_0(Q,x,jr,bits);
}}
'''
        cfile, obj = dest/f'test-{name}.c', dest/f'test-{name}.o'
        cfile.write_text(source)
        cmd = ['clang', *FLAGS, *INCLUDES, '-DBUILDING_FLINT', '-DFLINT_NOSTDIO',
               '-DFLINT_NOSTDARG', '-c', str(cfile), '-o', str(obj)]
        subprocess.run(cmd, check=True); commands.append(cmd); objects.append(str(obj))
    binary = dest/'test-delayed-reduction'
    cmd = ['clang', *FLAGS, *INCLUDES, str(ROOT/'bench/test_delayed_reduction.c'), *objects,
           str(BASE/'libflint.25.0.dylib'), *LIBS, '-o', str(binary)]
    subprocess.run(cmd, check=True); commands.append(cmd)
    output = subprocess.check_output([str(binary)], text=True)
    print(output, end='')
    evidence = ROOT/'results/delayed-reduction-checks'
    (evidence/'direct-tests.txt').write_text(output)
    files = [ROOT/'bench/test_delayed_reduction.c', binary, dest/'control.c', dest/'delayed.c']
    (evidence/'direct-build.json').write_text(json.dumps({'commands': commands,
        'sha256': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}, indent=2)+'\n')


if __name__ == '__main__':
    main()
