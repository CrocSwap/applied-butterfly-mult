#!/usr/bin/env python3
"""Build untimed counter instrumentation; never benchmark this library."""
import difflib
import hashlib
import json
import subprocess
from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS
from make_delayed_reduction import modified


def main():
    path = 'src/fft_small/sd_ifft.c'
    original = (BASE/path).read_text()
    source = modified(original)
    source = source.replace('#include "fft_small.h"',
                            '#include "fft_small.h"\nulong bf_inverse_leaf_calls[4];')
    for i, suffix in enumerate(['4_1', '4_0', '5_1', '5_0']):
        start = source.index('static void sd_ifft_basecase_'+suffix+'(')
        brace = source.index('{', start)+1
        source = source[:brace]+f'\n    bf_inverse_leaf_calls[{i}]++;'+source[brace:]
    patch = ROOT/'patches/delayed-reduction-trace.patch'
    patch.write_text(''.join(difflib.unified_diff(original.splitlines(True),source.splitlines(True),
                                                fromfile='a/'+path,tofile='b/'+path)))
    subprocess.run(['python3',str(ROOT/'scripts/build_experiment.py'),'delayed-reduction-trace',
                    '--patch',str(patch)],check=True,stdout=subprocess.DEVNULL)
    library = ROOT/'.deps/experiments/delayed-reduction-trace/libflint-experiment.dylib'
    binary = ROOT/'build/trace-inverse-leaves'
    command = ['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/trace_inverse_leaves.c'),str(library),
               *LIBS,'-o',str(binary)]
    subprocess.run(command,check=True)
    output = subprocess.check_output([str(binary)],text=True)
    evidence = ROOT/'results/delayed-reduction-checks'
    (evidence/'leaf-calls.jsonl').write_text(output)
    (evidence/'trace-build.json').write_text(json.dumps({
        'build':json.loads((library.parent/'build.json').read_text()),'harness_command':command,
        'harness_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),
        'scope':'Untimed call coverage only; instrumented multiplication checked against GMP.'},indent=2)+'\n')
    print(output,end='')


if __name__ == '__main__':
    main()
