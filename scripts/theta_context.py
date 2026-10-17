#!/usr/bin/env python3
"""Prepare, measure, then analyze complete theta evaluations; preserve prior work."""
import argparse
import json
from pathlib import Path
import random
import subprocess
from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS, make_var
from qualify_theory_paths_hard import sha, save
from compare import summarize

DEST=ROOT/'results/theta-context'
BUILD=ROOT/'.deps/experiments/theta-context-trace'
BASELINE=BASE/'libflint.25.0.dylib'
CANDIDATE=ROOT/'.deps/experiments/theta-direct-walsh/libflint-experiment.dylib'

def args(c,mode,lib=CANDIDATE):
    return [str(DEST/'theta-context'),mode,str(BASELINE),str(lib),
            *[str(c[k]) for k in ('g','prec','constant','square','fixture','all','trials','same')]]

def prepare():
    DEST.mkdir(exist_ok=False);BUILD.mkdir(exist_ok=False)
    # Preserve every file in the immediately preceding experiment, plus its transitive fingerprints.
    frozen={}
    for p in (ROOT/'results/weighted-phase-application').rglob('*'):
        if p.is_file():
            frozen[str(p)]=sha(p)
            if p.suffix=='.json':
                d=json.loads(p.read_text())
                if isinstance(d,dict):
                    frozen.update(d.get('sha256',{}));frozen.update(d.get('frozen_sha256',{}))
    for p in [BASELINE,CANDIDATE,ROOT/'bench/theta_context.c',Path(__file__).resolve(),ROOT/'scripts/compare.py']:
        frozen[str(p)]=sha(p)
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    commands=[]
    def run(cmd,name):
        commands.append(cmd);r=subprocess.run(cmd,capture_output=True,text=True)
        (DEST/name).write_text(r.stdout+r.stderr);r.check_returncode()
    # Instrumented baseline is used ONLY in separate coverage diagnostics, never timing comparisons.
    source=BUILD/'agm_mul.c'
    source.write_text('''#include <stdint.h>
#include <time.h>
#include "acb.h"
#include "acb_theta.h"
#define acb_theta_agm_mul bf_uninstrumented_agm_mul
#include "'''+str(BASE/'src/acb_theta/agm_mul.c')+'''"
#undef acb_theta_agm_mul
static uint64_t count,elapsed;
static uint64_t ticks(void) {struct timespec t;clock_gettime(CLOCK_THREAD_CPUTIME_ID,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
void bf_trace_reset(void) {count=elapsed=0;}
uint64_t bf_trace_calls(void) {return count;}
uint64_t bf_trace_ns(void) {return elapsed;}
void acb_theta_agm_mul(acb_ptr res,acb_srcptr a,acb_srcptr b,slong g,int all,slong p) {
 if(all) {uint64_t t=ticks();bf_uninstrumented_agm_mul(res,a,b,g,all,p);elapsed+=ticks()-t;count++;}
 else bf_uninstrumented_agm_mul(res,a,b,g,all,p);
}
''')
    obj=BUILD/'agm_mul.lo';module=BUILD/'acb_theta_merged.lo';lib=BUILD/'libflint-trace.dylib'
    run(['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',str(source),'-o',str(obj)],'trace-compile.log')
    run(['ld','-r',*[str(obj if p=='build/acb_theta/agm_mul.lo' else BASE/p) for p in make_var('acb_theta_LOBJS')],'-o',str(module)],'trace-merge.log')
    run(['clang',*FLAGS,'-shared','-install_name',str(lib),'-compatibility_version','25.0','-current_version','25.0.0',
         *[str(module if Path(p).name=='acb_theta_merged.lo' else BASE/p) for p in make_var('SHARED_LIB_DEPS')],'-o',str(lib),*LIBS],'trace-link.log')
    run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/theta_context.c'),str(BASELINE),*LIBS,'-o',str(DEST/'theta-context')],'compile.log')
    cases=[dict(g=g,prec=p,constant=c,square=s,fixture=f,all=1,trials=21,same=0)
           for g in (1,2,3) for p in (128,512,2048) for c in (0,1) for s in (0,1) for f in (0,1)]
    controls=[dict(g=2,prec=512,constant=0,square=0,fixture=f,all=a,trials=21,same=s)
              for f in (0,1) for a,s in ((0,0),(1,1))]
    comparisons=cases+controls;random.Random(770019).shuffle(comparisons)
    validations=[];traces=[]
    for c in cases+controls:
        validations.append(dict(case=c,**json.loads(subprocess.check_output(args(c,'validate'),text=True,timeout=120))))
        if not c['same']:
            traces.append(dict(case=c,**json.loads(subprocess.check_output(args(c,'trace',lib),text=True,timeout=120))))
    save(DEST/'validation.json',validations);save(DEST/'trace.json',traces)
    for p in [source,obj,module,lib,DEST/'theta-context']:
        frozen[str(p)]=sha(p)
    save(DEST/'plan.json',dict(cases=comparisons,commands=commands,frozen_sha256=frozen,
         scope='Public acb_theta_jet, nb=1, ord=0, ab=0; deterministic well-conditioned coupled matrices; two fixtures per configuration. No derivative or application-level benchmark.',
         protocol='21 alternating ABBA/BAAB quartets; 5ms equal-repetition calibration; 20ms joint warmup; two resident uninstrumented dylibs; analysis after all timing.'))
    print('Prepared',len(comparisons),'comparisons;',len(validations),'independent direct-series validation fixtures',flush=True)

def measure():
    plan=json.loads((DEST/'plan.json').read_text())
    for p,h in plan['frozen_sha256'].items():assert sha(ROOT/p)==h,p
    with (DEST/'raw.jsonl').open('x') as out:
        for i,c in enumerate(plan['cases']):
            raw=subprocess.check_output(args(c,'measure'),text=True,timeout=120)
            rows=[json.loads(s) for s in raw.splitlines()];assert len(rows)==84
            out.write(json.dumps(dict(case=c,rows=rows))+'\n');out.flush()
            print(f'{i+1}/{len(plan["cases"])} {c}',flush=True)

def analyze():
    plan=json.loads((DEST/'plan.json').read_text());raw=[json.loads(s) for s in (DEST/'raw.jsonl').read_text().splitlines()]
    assert [x['case'] for x in raw]==plan['cases']
    for p,h in plan['frozen_sha256'].items():assert sha(ROOT/p)==h,p
    rows=[]
    for r in raw:
        assert len(r['rows'])==84
        rows.append(dict(case=r['case'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])))
    save(DEST/'summary.json',dict(results=rows,preserved_hashes=len(plan['frozen_sha256']),
        raw_sha256=sha(DEST/'raw.jsonl'),validation_sha256=sha(DEST/'validation.json'),trace_sha256=sha(DEST/'trace.json')))
    for r in sorted(rows,key=lambda r:tuple(r['case'].values())):
        print(r['case'], {k:round(r['cpu'][k],3) for k in ('reduction_pct','ci95_low_pct','ci95_high_pct')})

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['prepare','measure','analyze']);a=ap.parse_args()
    globals()[a.stage]()
