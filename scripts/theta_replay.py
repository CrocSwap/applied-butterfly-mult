#!/usr/bin/env python3
"""Bounded actual-intermediate replay; no full-application timing sweep."""
import argparse
import json
from pathlib import Path
import random
import subprocess
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS,make_var
from theta_nonrigidity import SOURCES,CURRENT,run,source,command,key
from qualify_theory_paths_hard import sha,save
from compare import summarize

OUT=ROOT/'results/theta-replay'
BUILD=ROOT/'.deps/experiments/theta-replay'
def cases():
    return [dict(g=g,prec=p,fixture=f,nb=nb,group=group) for g,p,nb,group in
            [(3,512,1,'constants'),(6,512,1,'constants'),(4,2048,1,'constants'),(3,512,4,'mixed')]
            for f in (0,1)]
def capture_source(unit):
    src=source(unit,None,False)
    fn='acb_theta_agm_hadamard' if unit=='agm_mul' else 'bf_hadamard'
    a=src.index('static void\n'+fn+'(');b=src.index('\nstatic void\n',a+1)
    end=src[a:b].rfind('\n}')+2
    inner=src[a:a+end].replace(fn,fn+'_inner')
    src=src[:a]+inner+f'''
static void
{fn}(acb_ptr y,acb_srcptr x,slong g,slong p)
{{
    tr_capture({int(unit=='ql_exact')},x,g,p);
    {fn}_inner(y,x,g,p);
}}
'''+src[a+end:]
    src='#include <stdio.h>\n#include <stdlib.h>\n#include "acb.h"\nvoid tr_capture(int,acb_srcptr,slong,slong);\n'+src
    if unit=='agm_mul':src+='''
static FILE *tr_file;
void tr_capture_open(const char *path) {tr_file=fopen(path,"wx");if(!tr_file)abort();}
void tr_capture_close(void) {if(fclose(tr_file))abort();tr_file=NULL;}
void tr_capture(int kind,acb_srcptr x,slong g,slong p) {
    if(!tr_file)return;
    if(fprintf(tr_file,"%d %ld %ld\\n",kind,g,p)<0)abort();
    for(slong i=0;i<(1L<<g);i++) {
        if(arb_dump_file(tr_file,acb_realref(x+i)))abort();fputc('\\n',tr_file);
        if(arb_dump_file(tr_file,acb_imagref(x+i)))abort();fputc('\\n',tr_file);
    }
}
'''
    return src
def historical():
    frozen={}
    for file in ['plan.json','confirmation/plan.json','completion.json']:
        p=ROOT/'results/theta-nonrigidity'/file
        frozen.update(json.loads(p.read_text()).get('sha256',{}));frozen[str(p)]=sha(p)
    return frozen
def verify(plan):
    for p,h in plan['sha256'].items():assert sha(ROOT/p)==h,p
def build():
    OUT.mkdir(exist_ok=False);BUILD.mkdir(exist_ok=False)
    frozen=historical();verify(dict(sha256=frozen))
    replacements={}
    for unit in SOURCES:
        path=BUILD/(unit+'.c');path.write_text(capture_source(unit));obj=BUILD/(unit+'.lo')
        run(['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',path,'-o',obj],BUILD/(unit+'-compile.log'))
        replacements['build/acb_theta/'+unit+'.lo']=obj
    module=BUILD/'acb_theta_merged.lo'
    run(['ld','-r',*[replacements.get(p,BASE/p) for p in make_var('acb_theta_LOBJS')],'-o',module],BUILD/'merge.log')
    lib=BUILD/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',lib,'-compatibility_version','25.0','-current_version','25.0.0',
         *[module if Path(p).name=='acb_theta_merged.lo' else BASE/p for p in make_var('SHARED_LIB_DEPS')],'-o',lib,*LIBS],BUILD/'link.log')
    # Reuse the exact fixture and accuracy/retry code from the frozen full-call harness.
    text=(ROOT/'bench/theta_nonrigidity.c').read_text()
    a=text.index('        void (*reset)(void)');b=text.index('\n    } else {',a)
    text=text[:a]+'''        ((void(*)(const char*))sym(h1,"tr_capture_open"))(argv[13]);
        batch(fn[1],out,z,tau,all,sqr,prec,1);
        ((void(*)(void))sym(h1,"tr_capture_close"))();
        assert(_acb_vec_equal(ref,out,len));
        printf("{\\"status\\":\\"PASS\\",\\"bitwise_equal_outputs\\":%ld,\\"working_precision\\":%ld,\\"attempts\\":%d}\\n",len,used,attempts);
'''+text[b:]
    harness=BUILD/'capture.c';harness.write_text(text)
    run(['clang',*FLAGS,*INCLUDES,harness,CURRENT,*LIBS,'-o',OUT/'capture'],OUT/'capture-compile.log')
    for name,flags in [('replay',[]),('replay-sanitize',['-fsanitize=address,undefined'])]:
        run(['clang',*FLAGS,*INCLUDES,*flags,ROOT/'bench/theta_replay.c',CURRENT,*LIBS,'-o',OUT/name],OUT/(name+'-compile.log'))
    validations=[]
    for c in cases():
        ident='-'.join(map(str,key(c)));path=OUT/(ident+'.arb')
        cmd=command(c,'trace',{'current':str(CURRENT),'capture':str(lib)},'current','capture')
        cmd[0]=str(OUT/'capture');cmd[-1]=str(path)
        capture=json.loads(run(cmd,OUT/(ident+'-capture.json')))
        replay=json.loads(run([OUT/'replay-sanitize','validate',path],OUT/(ident+'-validate.json')))
        validations.append(dict(case=c,path=str(path),capture=capture,replay=replay))
        print('Captured and checked',ident,replay['transforms'],'transforms',flush=True)
    save(OUT/'validation.json',validations)
    comparisons=[]
    # Fixed, unselected comparisons: both ordinary baselines receive identical reuse.
    pairs=[(e,0,e,1,'scratch') for e in range(4)]
    pairs += [(0,1,1,1,'ordinary')]
    pairs += [(b,1,e,1,'construction') for b in (0,1) for e in (2,3)]
    for c in cases():
        for b,bm,e,em,group in pairs:comparisons.append(dict(case=c,base=b,base_mode=bm,candidate=e,candidate_mode=em,group=group))
    for c in (cases()[0],cases()[2]):
        for e in (0,2):comparisons.append(dict(case=c,base=e,base_mode=1,candidate=e,candidate_mode=1,group='same_control'))
    random.Random(810012).shuffle(comparisons)
    for p in [Path(__file__).resolve(),ROOT/'bench/theta_replay.c',ROOT/'scripts/theta_nonrigidity.py',ROOT/'scripts/compare.py',
              *[p for parent in (OUT,BUILD) for p in parent.rglob('*') if p.is_file()]]:frozen[str(p)]=sha(p)
    plan=dict(comparisons=comparisons,sha256=frozen,trials=19,
        protocol='200ms warmup; equal reps calibrated to 10ms; 19 alternating ABBA/BAAB quartets; isolated timing; 4000 moving-block bootstrap draws.',
        scope='Captured actual intermediate balls from eight synthetic complete theta calls. Fixed inputs and original precision/order. No end-to-end speedup claim.',
        scratch='0: per-transform allocation; 1: per-sequence allocation, reused through all transforms; both include allocation/destruction in timing. Output buffer reused outside timing in BOTH modes; no cross-sequence scratch reuse.',
        decision='Construction evidence requires beating BOTH persistent ordinary kernels, with positive CPU and wall intervals and clean controls. Otherwise stop this theta integration route.')
    verify(plan);save(OUT/'plan.json',plan)
def measure():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    with (OUT/'raw.jsonl').open('x') as f:
        for i,c in enumerate(plan['comparisons']):
            path=OUT/('-'.join(map(str,key(c['case'])))+'.arb')
            cmd=[OUT/'replay','measure',path,c['base'],c['base_mode'],c['candidate'],c['candidate_mode'],plan['trials']]
            rows=[json.loads(x) for x in subprocess.check_output(list(map(str,cmd)),text=True,timeout=180).splitlines()]
            assert len(rows)==plan['trials']*4
            f.write(json.dumps(dict(**c,rows=rows))+'\n');f.flush();print(i+1,'/',len(plan['comparisons']),c['group'],key(c['case']),flush=True)
    verify(plan)
def analyze():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    raw=[json.loads(x) for x in (OUT/'raw.jsonl').read_text().splitlines()]
    assert [{k:v for k,v in r.items() if k!='rows'} for r in raw]==plan['comparisons']
    rows=[dict(**{k:v for k,v in r.items() if k!='rows'},cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in raw]
    save(OUT/'summary.json',dict(results=rows,raw_sha256=sha(OUT/'raw.jsonl')))
    for r in rows:print(r['group'],key(r['case']),r['base'],r['candidate'],round(r['cpu']['reduction_pct'],3),[round(r['cpu'][k],3) for k in ('ci95_low_pct','ci95_high_pct')])
    save(OUT/'audit.json',dict(status='PASS',fingerprints=len(plan['sha256']),timed_batches=len(raw)*plan['trials']*4,
        checks=sum(v['replay']['component_box_checks'] for v in json.loads((OUT/'validation.json').read_text()))))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','measure','analyze']);a=p.parse_args()
    {'build':build,'measure':measure,'analyze':analyze}[a.stage]()
