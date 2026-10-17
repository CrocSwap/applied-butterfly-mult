#!/usr/bin/env python3
"""Check actual kernel source, complete matrix APIs, and an isolated coverage build."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS,make_var


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('name');a=ap.parse_args()
    source=ROOT/'.deps/experiments'/a.name
    evidence=ROOT/'results'/(a.name+'-checks');evidence.mkdir(exist_ok=False)
    trace=ROOT/'.deps/experiments'/(a.name+'-trace');trace.mkdir(exist_ok=False)
    commands=[]
    def run(cmd,output=None):
        commands.append(cmd)
        if output:
            with (evidence/output).open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True)
        else:subprocess.run(cmd,check=True)
    gr=(source/'src/gr/nmod_transformed_poly.c').read_text()
    kernel=gr[gr.index('#define BF_SHARE '):gr.index('/* Internal matrix-only helper.')]
    (trace/'kernel.inc').write_text(kernel)
    candidate=source/'libflint-experiment.dylib'
    for stem in ['test_poly_dot','test_poly_matrix']:
        binary=trace/stem
        run(['clang',*FLAGS,*INCLUDES,'-I'+str(trace),str(ROOT/'bench'/(stem+'.c')),str(candidate),*LIBS,'-o',str(binary)])
        run([str(binary)],stem+'.json')
    # Relaxed atomic counters are isolated from all timed libraries.
    gr=gr.replace('#define BF_SHARE ','ulong bf_tile_calls, bf_tile_successes;\n#define BF_SHARE ',1)
    needle='    tpoly_ctx_struct *T=TPOLY_CTX(ctx);'
    assert gr.count(needle)==1
    gr=gr.replace(needle,'    __atomic_fetch_add(&bf_tile_calls,1,__ATOMIC_RELAXED);\n'+needle)
    needle='    for (ulong pi=0;pi<T->P->np;pi++)'
    assert gr.count(needle)==1
    gr=gr.replace(needle,'    __atomic_fetch_add(&bf_tile_successes,1,__ATOMIC_RELAXED);\n'+needle)
    cfile=trace/'gr.c';cfile.write_text(gr);obj=trace/'gr.lo';merged=trace/'gr_merged.lo'
    run(['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',str(cfile),'-o',str(obj)])
    run(['ld','-r',*[str(obj if p=='build/gr/nmod_transformed_poly.lo' else BASE/p) for p in make_var('gr_LOBJS')],'-o',str(merged)])
    objects=[BASE/p for p in make_var('SHARED_LIB_DEPS')]
    objects=[merged if p.name=='gr_merged.lo' else source/'nmod_poly_mat_merged.lo' if p.name=='nmod_poly_mat_merged.lo' else p for p in objects]
    library=trace/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',str(library),'-compatibility_version','25.0','-current_version','25.0.0',*map(str,objects),'-o',str(library),*LIBS])
    binary=trace/'test_matrix_trace'
    run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/test_poly_matrix.c'),str(library),*LIBS,'-o',str(binary)])
    run([str(binary)],'matrix-trace.json')
    binary=trace/'test_upstream'
    run(['clang',*FLAGS,*INCLUDES,str(BASE/'src/nmod_poly_mat/test/main.c'),str(candidate),*LIBS,'-o',str(binary)])
    run([str(binary),'nmod_poly_mat_mul','nmod_poly_mat_mulmid_fft_small','nmod_poly_mat_sqr'],'upstream.txt')
    files=[Path(__file__).resolve(),ROOT/'bench/test_poly_dot.c',ROOT/'bench/test_poly_matrix.c',ROOT/'bench/poly_survey.c',candidate,library,trace/'kernel.inc',cfile,*[p for p in evidence.iterdir() if p.is_file()]]
    report={'status':'PASS','name':a.name,'commands':commands,'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    (evidence/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(a.name,'PASS',flush=True)


if __name__=='__main__':main()
