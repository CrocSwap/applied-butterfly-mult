#!/usr/bin/env python3
"""Whole theta calls: memory optimization versus explicit non-rigidity gadgets."""
import argparse
import difflib
import json
from pathlib import Path
import random
import statistics
import subprocess

from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS,make_var
from qualify_theory_paths_hard import sha,save
from compare import summarize

OUT=ROOT/'results/theta-nonrigidity'
BUILD=ROOT/'.deps/experiments/theta-nonrigidity'
CURRENT=ROOT/'.deps/experiments/theta-equal/candidate/libflint-experiment.dylib'
SOURCES={'agm_mul':ROOT/'.deps/experiments/theta-equal/candidate/agm_mul.c',
         'ql_exact':ROOT/'.deps/experiments/theta-batch/retained/ql_exact.c'}

def run(cmd,log,timeout=600):
    proc=subprocess.run(list(map(str,cmd)),text=True,capture_output=True,timeout=timeout)
    log.write_text(proc.stdout+proc.stderr);proc.check_returncode()
    return proc.stdout

def replace_function(src,name,body):
    a=src.index('static void\n'+name+'(');b=src.index('\nstatic void\n',a+1)
    # agm_mul's next static function has a preceding explanatory comment.
    old=src[a:b];end=old.rfind('\n}')+2
    return src[:a]+body+src[a+end:]

def source(name,engine,trace):
    src=SOURCES[name].read_text();fn='acb_theta_agm_hadamard' if name=='agm_mul' else 'bf_hadamard'
    if engine is not None:
        helper=(ROOT/'bench/theta_nonrigidity_kernel.h').read_text()
        # One allocation per transform, instead of one at every recursive node.
        # Non-rigidity is restricted to <=4096 working bits and its natural base size.
        wrapper=f'''static void
{fn}(acb_ptr y, acb_srcptr x, slong g, slong p)
{{
    if(g==0) {{acb_set(y,x);return;}}
    int e={engine};
    if(e>=2 && (p>4096 || g<(e==2?2:3))) e=1;
    acb_ptr s=_acb_vec_init(tn_scratch[e]);
    tn_functions[e](y,x,g,p,s);
    _acb_vec_clear(s,tn_scratch[e]);
}}
'''
        src=replace_function(src,fn,helper+'\n'+wrapper)
    if trace:
        a=src.index('static void\n'+fn+'(');b=src.index('\nstatic void\n',a+1)
        end=src[a:b].rfind('\n}')+2
        # Rename only this function and its recursion, then wrap the public-to-file entry.
        inner=src[a:a+end].replace(fn,fn+'_inner')
        kind=int(name=='ql_exact')
        wrapper=f'''
static void
{fn}(acb_ptr y,acb_srcptr x,slong g,slong p)
{{
    struct timespec t;clock_gettime(CLOCK_THREAD_CPUTIME_ID,&t);
    uint64_t begin=(uint64_t)t.tv_sec*1000000000+t.tv_nsec;
    {fn}_inner(y,x,g,p);
    clock_gettime(CLOCK_THREAD_CPUTIME_ID,&t);
    tn_record({kind},g,p,(uint64_t)t.tv_sec*1000000000+t.tv_nsec-begin);
}}
'''
        src=src[:a]+inner+wrapper+src[a+end:]
        prefix='''#include <stdint.h>
#include <time.h>
#include "flint.h"
void tn_record(int,slong,slong,uint64_t);
'''
        src=prefix+src
        if name=='agm_mul':src+='''
static uint64_t tn_counts[24];
void tn_trace_reset(void) {for(int i=0;i<24;i++)tn_counts[i]=0;}
uint64_t tn_trace_get(int i) {return tn_counts[i];}
void tn_record(int kind,slong g,slong p,uint64_t ns) {
    tn_counts[4*kind]++;tn_counts[4*kind+1]+=ns;
    if(p<=4096 && g>=2)tn_counts[4*kind+2]+=ns;
    if(p<=4096 && g>=3)tn_counts[4*kind+3]+=ns;
    if(g<16)tn_counts[8+g]++;
}
'''
    return src

def build(name,engine=None,trace=False):
    dest=BUILD/name;dest.mkdir(exist_ok=False)
    replacements={}
    for unit in SOURCES:
        path=dest/(unit+'.c');path.write_text(source(unit,engine,trace));obj=dest/(unit+'.lo')
        run(['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',path,'-o',obj],dest/(unit+'-compile.log'))
        replacements['build/acb_theta/'+unit+'.lo']=obj
    module=dest/'acb_theta_merged.lo'
    run(['ld','-r',*[replacements.get(p,BASE/p) for p in make_var('acb_theta_LOBJS')],'-o',module],dest/'merge.log')
    lib=dest/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',lib,'-compatibility_version','25.0','-current_version','25.0.0',
         *[module if Path(p).name=='acb_theta_merged.lo' else BASE/p for p in make_var('SHARED_LIB_DEPS')],'-o',lib,*LIBS],dest/'link.log')
    return str(lib)

def cases():
    primary=[dict(g=g,prec=p,fixture=f,group='constants') for g in (2,3,4,6)
             for p in (512,2048) if g!=6 or p==512 for f in (0,1)]
    nonzero=[dict(g=g,prec=512,fixture=f,constant=0,group='nonzero') for g in (2,3) for f in (0,1)]
    mixed=[dict(g=3,prec=512,fixture=f,nb=4,group='mixed') for f in (0,1)]
    inactive=[dict(g=1,prec=512,fixture=f,group='inactive') for f in (0,1)]
    return primary+nonzero+mixed+inactive

def key(c):return (c['g'],c['prec'],c['fixture'],c.get('constant',1),c.get('nb',1))

def command(c,mode,libraries,base,candidate):
    cache=OUT/'oracles'/('-'.join(map(str,key(c)))+'.arb')
    return list(map(str,[OUT/'theta',mode,libraries[base],libraries[candidate],c['g'],c['prec'],c.get('constant',1),1,
           c['fixture'],1,c.get('trials',19),c.get('same',0),c.get('nb',1),cache]))

def prepare_build():
    OUT.mkdir(exist_ok=False);BUILD.mkdir(exist_ok=False);(OUT/'oracles').mkdir()
    libraries={'current':str(CURRENT)}
    for name,engine in [('iterative',0),('recursive',1),('h4',2),('h8',3),('rebuild',None)]:
        libraries[name]=build(name,engine);print('Built',name,flush=True)
        if engine is not None:
            exact=OUT/(name+'-exact')
            run(['clang',*FLAGS,*INCLUDES,'-fsanitize=address,undefined',
                 '-DTN_SOURCE="'+str(BUILD/name/'agm_mul.c')+'"',ROOT/'bench/theta_nonrigidity_check.c',CURRENT,*LIBS,'-o',exact],OUT/(name+'-exact-compile.log'))
            run([exact],OUT/(name+'-exact.json'))
            test=OUT/(name+'-test-theta')
            run(['clang',*FLAGS,*INCLUDES,BASE/'src/acb_theta/test/main.c',libraries[name],*LIBS,'-o',test],OUT/(name+'-test-compile.log'))
            run([test,'acb_theta_agm_mul','acb_theta_agm_mul_tight','acb_theta_ql_exact','acb_theta_jet_notransform','acb_theta_jet'],OUT/(name+'-tests.log'))
            print('Exact and upstream tests passed',name,flush=True)
    for name,engine in [('current',None),('recursive',1),('h4',2),('h8',3)]:
        libraries[name+'_trace']=build(name+'-trace',engine,True)
    run(['clang',*FLAGS,*INCLUDES,ROOT/'bench/theta_nonrigidity.c',CURRENT,*LIBS,'-o',OUT/'theta'],OUT/'compile.log')
    save(OUT/'libraries.json',libraries)

def qualify():
    libs=json.loads((OUT/'libraries.json').read_text());validation=[];traces=[]
    for i,c in enumerate(cases()):
        for name in ('iterative','recursive','h4','h8'):
            log=OUT/(f'validate-{i}-{name}.json')
            r=json.loads(run(command(c,'validate',libs,'current',name),log,900))
            validation.append(dict(case=c,variant=name,**r))
        if c['prec']==512 and c['group'] in ('constants','mixed','inactive'):
            for name in ('current','recursive','h4','h8'):
                log=OUT/(f'trace-{i}-{name}.json')
                r=json.loads(run(command(c,'trace',libs,'current',name+'_trace'),log))
                traces.append(dict(case=c,variant=name,**r))
        print('Qualified',i+1,'/',len(cases()),c,flush=True)
    save(OUT/'validation.json',validation);save(OUT/'trace.json',traces)
    comparisons=[]
    for c in cases():
        for base,cand in [('current','recursive'),('iterative','recursive'),('iterative','h4'),('iterative','h8')]:
            comparisons.append(dict(case=dict(c,trials=19),base=base,candidate=cand))
    for g in (2,3):
        for f in (0,1):comparisons.append(dict(case=dict(g=g,prec=512,fixture=f,trials=19,group='rebuild_control'),base='current',candidate='rebuild'))
    for f in (0,1):comparisons.append(dict(case=dict(g=3,prec=512,fixture=f,trials=19,group='same_control',same=1),base='iterative',candidate='h4'))
    random.Random(710088).shuffle(comparisons)
    frozen={}
    for file in ('results/walsh-nonrigidity/plan.json','results/walsh-nonrigidity/confirmation/plan.json','results/walsh-nonrigidity/completion.json'):
        d=json.loads((ROOT/file).read_text());frozen.update(d.get('sha256',{}));frozen[str(ROOT/file)]=sha(ROOT/file)
    for p in [Path(__file__).resolve(),ROOT/'bench/theta_nonrigidity.c',ROOT/'bench/theta_nonrigidity_check.c',
              ROOT/'bench/theta_nonrigidity_kernel.h',ROOT/'scripts/compare.py',*[p for parent in (OUT,BUILD) for p in parent.rglob('*') if p.is_file()]]:
        frozen[str(p)]=sha(p)
    plan=dict(libraries=libs,comparisons=comparisons,sha256=frozen,
        protocol='19 ABBA/BAAB quartets, 200ms joint warmup, 20ms equal repetitions; complete acb_theta_jet and accuracy scans/retries. Isolated timing.',
        accuracy='Every output rel_one accuracy >= initial prec-32; increase prec by 64, up to +256; all attempts timed.',
        dispatch='H4 for g>=2, H8 for g>=3; working precision <=4096; otherwise ordinary recursive transform.',
        confirmation='ALL cases: compare H4/H8 against faster optimized conventional variant selected per case by screening CPU; repeat current versus that variant and all controls; 31 quartets.',
        scope='Synthetic period matrices, full squared all-characteristic calls. No real E4 inputs or derivative orders.')
    verify(plan);save(OUT/'plan.json',plan);print('Prepared',len(comparisons),'comparisons',flush=True)

def verify(plan):
    for p,h in plan['sha256'].items():assert sha(ROOT/p)==h,p

def measure(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    with (dest/'raw.jsonl').open('x') as f:
        for i,c in enumerate(plan['comparisons']):
            raw=subprocess.check_output(command(c['case'],'measure',plan['libraries'],c['base'],c['candidate']),text=True,timeout=600)
            rows=[json.loads(s) for s in raw.splitlines()];assert len(rows)==4*c['case']['trials']
            f.write(json.dumps(dict(**c,rows=rows))+'\n');f.flush();print(i+1,'/',len(plan['comparisons']),c,flush=True)
    verify(plan)

def analyze(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    raw=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in raw]==plan['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in raw]
    groups={}
    for candidate in ('recursive','iterative','h4','h8','rebuild'):
        for group in sorted({r['case']['group'] for r in rows}):
            for old in (True,False):
                rr=[r for r in rows if r['candidate']==candidate and r['case']['group']==group and (r['base']=='current')==old]
                if rr:groups[f'{"current" if old else "optimized"}/{candidate}/{group}']=dict(cases=len(rr),median_cpu=statistics.median(r['cpu']['reduction_pct'] for r in rr),positive_cpu=sum(r['cpu']['ci95_low_pct']>0 for r in rr),positive_both=sum(min(r['cpu']['ci95_low_pct'],r['wall']['ci95_low_pct'])>0 for r in rr))
    save(dest/'summary.json',dict(results=rows,groups=groups,raw_sha256=sha(dest/'raw.jsonl')));print(json.dumps(groups,indent=2))

def confirm():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    rows=json.loads((OUT/'summary.json').read_text())['results'];best={}
    for r in rows:
        if r['base']=='iterative' and r['candidate']=='recursive':best[key(r['case'])]='recursive' if r['cpu']['reduction_pct']>0 else 'iterative'
    comparisons=[]
    for c in cases():
        b=best[key(c)]
        comparisons.extend(dict(case=dict(c,trials=31),base=base,candidate=cand) for base,cand in [(b,'h4'),(b,'h8'),('current',b)])
    for r in plan['comparisons']:
        if r['case']['group'].endswith('_control'):comparisons.append(dict(r,case=dict(r['case'],trials=31)))
    random.Random(710089).shuffle(comparisons)
    plan['comparisons']=comparisons;plan['protocol']='31 ABBA/BAAB quartets; otherwise screening protocol unchanged; optimized baseline chosen per case on screening CPU.'
    for f in ('plan.json','raw.jsonl','summary.json'):plan['sha256'][str(OUT/f)]=sha(OUT/f)
    dest=OUT/'confirmation';dest.mkdir(exist_ok=False);save(dest/'plan.json',plan);print('Confirmation',len(comparisons))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','qualify','measure','analyze','confirm']);p.add_argument('--confirmation',action='store_true');a=p.parse_args()
    dest=OUT/'confirmation' if a.confirmation else OUT
    if a.stage=='build':prepare_build()
    elif a.stage=='qualify':qualify()
    elif a.stage=='measure':measure(dest)
    elif a.stage=='analyze':analyze(dest)
    else:confirm()
