#!/usr/bin/env python3
"""Build a separate counter-instrumented library; never use it for timings."""
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
import sys
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS


def main():
    name='c3-pi-trace'
    relative='src/fft_small/mpn_mul_np2.c'
    original=(BASE/relative).read_text()
    retained=(ROOT/'.deps/experiments/c3-register-reconstruction'/relative).read_text()
    source=retained.replace('static void bf_np2_crt_tiled',
        'ulong bf_trace_fused_calls, bf_trace_fused_coefficients, bf_trace_window_calls;\nstatic void bf_np2_crt_tiled',1)
    source=source.replace('    ulong acc0=0,acc1=0,acc2=0,acc3=0,w0=0;',
        '    bf_trace_fused_calls++;bf_trace_fused_coefficients+=jtop;\n    ulong acc0=0,acc1=0,acc2=0,acc3=0,w0=0;',1)
    marker='''                        nn_srcptr a, ulong an, nn_srcptr b, ulong bn)
{
    ulong bits, depth;'''
    assert source.count(marker)==1
    source=source.replace(marker,marker+'\n    bf_trace_window_calls++;',1)
    output=ROOT/'results/pi-trace';output.mkdir(exist_ok=False)
    patch=output/'instrumentation.patch'
    patch.write_text(''.join(difflib.unified_diff(original.splitlines(True),source.splitlines(True),
                                              fromfile='a/'+relative,tofile='b/'+relative)))
    subprocess.run([sys.executable,str(ROOT/'scripts/build_experiment.py'),name,'--patch',str(patch)],check=True)
    library=ROOT/f'.deps/experiments/{name}/libflint-experiment.dylib'
    command=['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/trace_pi.c'),'-o',str(ROOT/'build/trace-pi'),*LIBS]
    subprocess.run(command,check=True)
    result=subprocess.check_output([str(ROOT/'build/trace-pi'),str(library)],text=True)
    (output/'counts.jsonl').write_text(result)
    (output/'build.json').write_bytes((library.parent/'build.json').read_bytes())
    info={'purpose':'Branch reachability/counts only, not performance attribution',
          'harness_build':command,'harness_sha256':hashlib.sha256((ROOT/'build/trace-pi').read_bytes()).hexdigest(),
          'harness_source_sha256':hashlib.sha256((ROOT/'bench/trace_pi.c').read_bytes()).hexdigest()}
    (output/'metadata.json').write_text(json.dumps(info,indent=2)+'\n')
    print(result)


if __name__=='__main__':main()
