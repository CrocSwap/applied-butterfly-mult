#!/usr/bin/env python3
"""Bounded complete theta calls with explicitly owned transform workspace."""
import argparse
import difflib
import json
import math
from pathlib import Path
import random
import statistics
import subprocess
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS,make_var
from theta_nonrigidity import SOURCES,CURRENT,run,replace_function,command
from theta_replay import historical,verify
from qualify_theory_paths_hard import sha,save
from compare import summarize

OUT=ROOT/'results/theta-workspace'
BUILD=ROOT/'.deps/experiments/theta-workspace'
NAMES=('iterative','recursive','h4','h8')
def cases():return [dict(g=g,prec=512,fixture=f,group='constants') for g in (3,6) for f in (0,1)]

def sources(engine):
    kernel=(ROOT/'bench/theta_nonrigidity_kernel.h').read_text()
    common=kernel+f'''
/* Private workspace, explicitly owned by the calling AGM or batch context.
   It retains allocation across precision changes, never mathematical inputs. */
#define TW_ENGINE {engine}
#define TW_SCRATCH {([1,1,6,16][engine])}
static void tw_hadamard(acb_ptr y,acb_srcptr x,slong g,slong p,acb_ptr scratch)
{{
    int e=TW_ENGINE;
    if(e>=2 && (p>4096 || g<(e==2?2:3))) e=1;
    tn_functions[e](y,x,g,p,scratch);
}}
void bf_theta_agm_mul_ws(acb_ptr,acb_srcptr,acb_srcptr,slong,int,slong,acb_ptr);
'''
    agm=SOURCES['agm_mul'].read_text()
    agm=replace_function(agm,'acb_theta_agm_hadamard',common)
    agm=agm.replace('slong g, slong prec)\n{','slong g, slong prec, acb_ptr scratch)\n{')
    agm=agm.replace('acb_theta_agm_hadamard(', 'tw_hadamard(')
    # All transform calls are single-line; preserve the surrounding arithmetic.
    lines=[]
    for line in agm.splitlines():
        if 'tw_hadamard(' in line and line.rstrip().endswith(');'):
            line=line.replace(');',', scratch);')
        if ('acb_theta_agm_mul_equal(res,' in line or 'acb_theta_agm_mul_one(res,' in line):
            line=line.replace(');',', scratch);')
        lines.append(line)
    agm='\n'.join(lines)+'\n'
    agm=agm.replace('acb_theta_agm_mul(acb_ptr res, acb_srcptr a1, acb_srcptr a2, slong g, int all, slong prec)',
                    'bf_theta_agm_mul_ws(acb_ptr res, acb_srcptr a1, acb_srcptr a2, slong g, int all, slong prec, acb_ptr scratch)')
    agm+='''
void
acb_theta_agm_mul(acb_ptr res,acb_srcptr a1,acb_srcptr a2,slong g,int all,slong prec)
{
    acb_ptr scratch=_acb_vec_init(TW_SCRATCH);
    bf_theta_agm_mul_ws(res,a1,a2,g,all,prec,scratch);
    _acb_vec_clear(scratch,TW_SCRATCH);
}
'''
    ql=SOURCES['ql_exact'].read_text()
    ql=replace_function(ql,'bf_hadamard',common)
    ql=ql.replace('    acb_ptr work;','    acb_ptr work;\n    acb_ptr transform_scratch;')
    ql=ql.replace('    c->work=_acb_vec_init(2*n);','    c->work=_acb_vec_init(2*n);\n    c->transform_scratch=_acb_vec_init(TW_SCRATCH);')
    ql=ql.replace('    _acb_vec_clear(c->work,2*c->n);','    _acb_vec_clear(c->work,2*c->n);\n    _acb_vec_clear(c->transform_scratch,TW_SCRATCH);')
    ql=ql.replace('bf_hadamard(s->hat,s->mid,g,hprec)','tw_hadamard(s->hat,s->mid,g,hprec,c->transform_scratch)')
    ql=ql.replace('bf_hadamard(v,c->work,g,hprec)','tw_hadamard(v,c->work,g,hprec,c->transform_scratch)')
    ql=ql.replace('bf_hadamard(res,v,g,hprec)','tw_hadamard(res,v,g,hprec,c->transform_scratch)')
    ql=ql.replace('acb_theta_agm_mul(res,s->mid,a0==a?s->mid:c->work,g,all,hprec);',
                  'bf_theta_agm_mul_ws(res,s->mid,a0==a?s->mid:c->work,g,all,hprec,c->transform_scratch);')
    assert 'bf_hadamard(' not in ql
    assert agm.count('tw_hadamard(')==7
    assert ql.count('c->transform_scratch')==6
    return dict(agm_mul=agm,ql_exact=ql)

def build_library(name,engine,sanitize=False):
    dest=BUILD/name;dest.mkdir(exist_ok=False);replacements={}
    flags=FLAGS+(['-fsanitize=address,undefined'] if sanitize else [])
    src=sources(engine)
    for unit in SOURCES:
        path=dest/(unit+'.c');path.write_text(src[unit]);obj=dest/(unit+'.lo')
        run(['clang',*flags,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',path,'-o',obj],dest/(unit+'-compile.log'))
        replacements['build/acb_theta/'+unit+'.lo']=obj
    module=dest/'acb_theta_merged.lo'
    run(['ld','-r',*[replacements.get(p,BASE/p) for p in make_var('acb_theta_LOBJS')],'-o',module],dest/'merge.log')
    lib=dest/'libflint-experiment.dylib'
    run(['clang',*flags,'-shared','-install_name',lib,'-compatibility_version','25.0','-current_version','25.0.0',
         *[module if Path(p).name=='acb_theta_merged.lo' else BASE/p for p in make_var('SHARED_LIB_DEPS')],'-o',lib,*LIBS],dest/'link.log')
    return str(lib)

def build():
    OUT.mkdir(exist_ok=False);BUILD.mkdir(exist_ok=False)
    libs={'current':str(CURRENT)}
    prior=json.loads((ROOT/'results/theta-nonrigidity/libraries.json').read_text())
    libs.update({name+'_per_transform':prior[name] for name in ('iterative','recursive')})
    for engine,name in enumerate(NAMES):
        libs[name]=build_library(name,engine)
        patch=''.join(''.join(difflib.unified_diff(SOURCES[u].read_text().splitlines(True),(BUILD/name/(u+'.c')).read_text().splitlines(True),
                     fromfile='a/src/acb_theta/'+u+'.c',tofile='b/src/acb_theta/'+u+'.c')) for u in SOURCES)
        (ROOT/'patches'/('theta-workspace-'+name+'.patch')).write_text(patch)
        exact=OUT/(name+'-exact')
        run(['clang',*FLAGS,*INCLUDES,'-fsanitize=address,undefined','-DTN_SOURCE="'+str(BUILD/name/'agm_mul.c')+'"',
             ROOT/'bench/theta_nonrigidity_check.c',CURRENT,*LIBS,'-o',exact],OUT/(name+'-exact-compile.log'))
        run([exact],OUT/(name+'-exact.json'))
        test=OUT/(name+'-test')
        run(['clang',*FLAGS,*INCLUDES,BASE/'src/acb_theta/test/main.c',libs[name],*LIBS,'-o',test],OUT/(name+'-test-compile.log'))
        run([test,'acb_theta_agm_mul','acb_theta_agm_mul_tight','acb_theta_ql_exact','acb_theta_jet_notransform','acb_theta_jet'],OUT/(name+'-tests.log'))
        print('Built and tested',name,flush=True)
    libs['iterative_rebuild']=build_library('iterative-rebuild',0)
    # Existing full-call harness uses the existing independent direct-series caches.
    run(['clang',*FLAGS,*INCLUDES,ROOT/'bench/theta_nonrigidity.c',CURRENT,*LIBS,'-o',OUT/'theta'],OUT/'compile.log')
    save(OUT/'libraries.json',libs)

def cmd(c,mode,libs,b,e):
    args=command(c,mode,libs,b,e);args[0]=str(OUT/'theta');return args

def qualify():
    libs=json.loads((OUT/'libraries.json').read_text());validation=[]
    for name,engine in [('h4',2),('h8',3)]:
        libs[name+'_sanitize']=build_library(name+'-sanitize',engine,True)
    run(['clang',*FLAGS,*INCLUDES,'-fsanitize=address,undefined',ROOT/'bench/theta_nonrigidity.c',CURRENT,*LIBS,'-o',OUT/'theta-sanitize'],OUT/'sanitize-compile.log')
    save(OUT/'libraries-qualified.json',libs)
    # Timing is bounded to four fixtures. Extra correctness cases cover cache reset,
    # mixed points, small dimensions, and precision fallback.
    checks=cases()+[dict(g=3,prec=512,fixture=0,nb=4),dict(g=1,prec=512,fixture=0),dict(g=4,prec=2048,fixture=0)]
    for i,c in enumerate(checks):
        for name in NAMES:
            v=json.loads(run(cmd(c,'validate',libs,'current',name),OUT/(f'validate-{i}-{name}.json'),900))
            validation.append(dict(case=c,variant=name,**v))
        for name in ('h4_sanitize','h8_sanitize'):
            args=cmd(c,'validate',libs,'current',name);args[0]=str(OUT/'theta-sanitize')
            v=json.loads(run(args,OUT/(f'validate-{i}-{name}.json'),900))
            validation.append(dict(case=c,variant=name,**v))
        print('Public-call validation',i+1,'/',len(checks),flush=True)
    save(OUT/'validation.json',validation)
    comparisons=[]
    for c in cases():
        gadget='h8' if c['g']==3 else 'h4'
        for b in ('iterative','recursive'):
            comparisons.append(dict(case=dict(c,trials=19,group='construction'),base=b,candidate=gadget))
            comparisons.append(dict(case=dict(c,trials=19,group='reuse'),base=b+'_per_transform',candidate=b))
    for g in (3,6):
        c=dict(g=g,prec=512,fixture=0,trials=19)
        comparisons.append(dict(case=dict(c,group='rebuild_control'),base='iterative',candidate='iterative_rebuild'))
        comparisons.append(dict(case=dict(c,group='same_control',same=1),base='iterative',candidate='h8' if g==3 else 'h4'))
    random.Random(910004).shuffle(comparisons)
    frozen=historical()
    for file in ('plan.json','confirmation/plan.json','completion.json'):
        p=ROOT/'results/theta-replay'/file;d=json.loads(p.read_text());frozen.update(d.get('sha256',{}));frozen[str(p)]=sha(p)
    for p in [Path(__file__).resolve(),*[ROOT/'patches'/('theta-workspace-'+n+'.patch') for n in NAMES],
              *[p for parent in (OUT,BUILD) for p in parent.rglob('*') if p.is_file()]]:frozen[str(p)]=sha(p)
    plan=dict(libraries=libs,comparisons=comparisons,sha256=frozen,
        protocol='19 ABBA/BAAB quartets; 200ms warmup; equal reps calibrated to 20ms. Complete calls, allocations, accuracy scans and retries timed. Isolated timing.',
        accuracy='Every output rel_one accuracy >= initial prec-32; +64 precision retries up to +256, included in timing.',
        dispatch='H8 chosen in advance for genus 3; H4 for genus 6; compare each with BOTH persistent ordinary implementations. Gadgets fall back to recursive ordinary for p>4096 or below natural base size.',
        workspace='Owned by existing batch cache, passed explicitly into AGM; standalone AGM owns its scratch. No globals or TLS; allocation and destruction inside public calls.',
        confirmation='Repeat all 20 comparisons once with 31 quartets, no selection or code changes. No broad sweep without a reproducible construction-specific full-call gain.',
        gate='A case must beat BOTH ordinary variants with positive CPU and wall intervals in confirmation; controls must be consistent with zero. Marginal estimates remain unresolved.')
    verify(plan);save(OUT/'plan.json',plan)

def measure(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    with (dest/'raw.jsonl').open('x') as f:
        for i,c in enumerate(plan['comparisons']):
            rows=[json.loads(x) for x in subprocess.check_output(cmd(c['case'],'measure',plan['libraries'],c['base'],c['candidate']),text=True,timeout=600).splitlines()]
            assert len(rows)==4*c['case']['trials'];f.write(json.dumps(dict(**c,rows=rows))+'\n');f.flush()
            print(i+1,'/',len(plan['comparisons']),c,flush=True)
    verify(plan)

def analyze(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    raw=[json.loads(x) for x in (dest/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in raw]==plan['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in raw]
    batches=0;retries=0
    for r,s in zip(raw,rows):
        c=r['case'];assert len(r['rows'])==4*c['trials'];batches+=len(r['rows'])
        for v in r['rows']:
            assert v['accuracy']>=c['prec']-32
            assert v['working_precision']==c['prec']+64*(v['attempts']-1)
            assert 1<=v['attempts']<=5;retries+=v['attempts']>1
        for field,label in [('cpu_ns_per_op','cpu'),('ns_per_op','wall')]:
            logs=[]
            for t in range(c['trials']):
                q=r['rows'][4*t:4*t+4]
                assert [v['engine'] for v in q]==[int((i in (1,2))^bool(t&1)) for i in range(4)]
                assert [v['step'] for v in q]==list(range(4))
                assert all(v['trial']==t and v[field]>0 for v in q)
                assert len({v['reps'] for v in q})==1
                logs.append(math.log(statistics.mean(v[field] for v in q if v['engine']==0)/statistics.mean(v[field] for v in q if v['engine']==1)))
            assert abs(100*(1-math.exp(-math.fsum(logs)/len(logs)))-s[label]['reduction_pct'])<1e-10
    save(dest/'summary.json',dict(results=rows,raw_sha256=sha(dest/'raw.jsonl')))
    save(dest/'audit.json',dict(status='PASS',fingerprints=len(plan['sha256']),timed_batches=batches,retry_batches=retries))
    for r in rows:print(r['case'],r['base'],r['candidate'],'CPU',*[round(r['cpu'][k],3) for k in ('reduction_pct','ci95_low_pct','ci95_high_pct')],'wall',*[round(r['wall'][k],3) for k in ('ci95_low_pct','ci95_high_pct')])

def confirm():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    for c in plan['comparisons']:c['case']['trials']=31
    random.Random(910005).shuffle(plan['comparisons'])
    plan['protocol']='31 ABBA/BAAB quartets; otherwise initial protocol unchanged; all comparisons repeated once.'
    for name in ('plan.json','raw.jsonl','summary.json','audit.json'):plan['sha256'][str(OUT/name)]=sha(OUT/name)
    dest=OUT/'confirmation';dest.mkdir(exist_ok=False);save(dest/'plan.json',plan)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','qualify','measure','analyze','confirm']);p.add_argument('--confirmation',action='store_true');a=p.parse_args()
    if a.stage in ('measure','analyze'):globals()[a.stage](OUT/'confirmation' if a.confirmation else OUT)
    else:globals()[a.stage]()
