#!/usr/bin/env python3
"""Isolated shared-preparation theta experiments; never change baseline artifacts."""
import argparse
import difflib
import json
from pathlib import Path
import random
import subprocess
from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS, make_var
from qualify_theory_paths_hard import sha, save
from compare import summarize

OUT=ROOT/'results/theta-batch'
BUILD=ROOT/'.deps/experiments/theta-batch'
ORIGINAL=BASE/'libflint.25.0.dylib'
LEADING=ROOT/'.deps/experiments/theta-direct-walsh/libflint-experiment.dylib'
LIBRARIES={'original':ORIGINAL,'leading':LEADING}
TRACE='''#include <stdint.h>
#include <time.h>
static uint64_t bf_counters[5];
void bf_trace_reset(void) {for(int i=0;i<5;i++) bf_counters[i]=0;}
uint64_t bf_trace_get(int i) {return bf_counters[i];}
static uint64_t bf_ticks(void) {struct timespec t;clock_gettime(CLOCK_THREAD_CPUTIME_ID,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
'''

def command(c,mode,base,candidate):
    return [str(OUT/'theta-batch'),mode,str(base),str(candidate),
            *map(str,[c['g'],c['prec'],c.get('constant',0),c['square'],c['fixture'],c.get('all',1),c.get('trials',21),c.get('same',0),c['nb']])]

def run(cmd,log):
    r=subprocess.run(cmd,capture_output=True,text=True);log.write_text(r.stdout+r.stderr);r.check_returncode()

def build(name,replacement_sources,flags=()):
    dest=BUILD/name;dest.mkdir(parents=True,exist_ok=False)
    replacements={'build/acb_theta/agm_mul.lo':ROOT/'.deps/experiments/theta-direct-walsh/agm_mul.lo'}
    for stem,source in replacement_sources.items():
        file=dest/(stem+'.c');file.write_text(source);obj=dest/(stem+'.lo')
        run(['clang',*FLAGS,*flags,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',str(file),'-o',str(obj)],dest/(stem+'-compile.log'))
        replacements[f'build/acb_theta/{stem}.lo']=obj
    module=dest/'acb_theta_merged.lo'
    run(['ld','-r',*[str(replacements.get(p,BASE/p)) for p in make_var('acb_theta_LOBJS')],'-o',str(module)],dest/'merge.log')
    lib=dest/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',str(lib),'-compatibility_version','25.0','-current_version','25.0.0',
         *[str(module if Path(p).name=='acb_theta_merged.lo' else BASE/p) for p in make_var('SHARED_LIB_DEPS')],'-o',str(lib),*LIBS],dest/'link.log')
    return lib

def profile():
    OUT.mkdir(exist_ok=False);BUILD.mkdir(exist_ok=False)
    frozen={}
    for file in ('results/theta-context/plan.json','results/theta-context/confirmation/plan.json','results/theta-context/completion.json'):
        d=json.loads((ROOT/file).read_text());frozen.update(d.get('frozen_sha256',{}));frozen.update(d.get('sha256',{}));frozen[str(ROOT/file)]=sha(ROOT/file)
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    save(OUT/'historical.json',frozen)
    run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/theta_batch.c'),str(ORIGINAL),*LIBS,'-o',str(OUT/'theta-batch')],OUT/'compile.log')
    old=(BASE/'src/acb_theta/agm_mul_tight.c').read_text()
    line='    acb_theta_agm_rel_mag_err(m0, eps0, a0, d0, n, lp);'
    assert old.count(line)==1
    source=TRACE+old.replace(line,'    uint64_t tick=bf_ticks(); bf_counters[0]++;\n'+line+'\n    bf_counters[1]+=bf_ticks()-tick;')
    lib=build('profile',{'agm_mul_tight':source})
    cases=[dict(g=g,prec=p,nb=nb,square=s,fixture=0) for g in (2,3) for p in (512,2048) for nb in (1,4,16) for s in (0,1)]
    data=[]
    for c in cases:
        d=json.loads(subprocess.check_output(command(c,'trace',LEADING,lib),text=True,timeout=120));data.append(dict(case=c,**d))
    save(OUT/'profile.json',data)
    print('Profiled',len(cases),'cases; first-operand bound preparation fractions:',[round(100*r['first_preparation_ns']/r['total_ns'],2) for r in data],flush=True)

def candidate_source():
    original=(BASE/'src/acb_theta/ql_exact.c').read_text()
    mul=(BASE/'src/acb_theta/agm_mul.c').read_text()
    tight=(BASE/'src/acb_theta/agm_mul_tight.c').read_text()
    had=mul[mul.index('static void\nacb_theta_agm_hadamard'):mul.index('static void\nacb_theta_agm_mul_one')].replace('acb_theta_agm_hadamard','bf_hadamard')
    mag=tight[tight.index('static void\nacb_theta_agm_rel_mag_err'):tight.index('/* This is assuming')].replace('acb_theta_agm_rel_mag_err','bf_rel_mag_err')
    helpers=(ROOT/'bench/theta_batch_internal.h').read_text()
    insertion=original.index('static void\nacb_theta_ql_step_1(')
    source=original[:insertion]+had+mag+helpers+'\n'+original[insertion:]
    # Only the two static step helpers are changed; public interfaces are untouched.
    start=source.index('static void\nacb_theta_ql_step_1(')
    end=source.index('static void\nacb_theta_ql_exact_steps(',start)
    section=source[start:end]
    section=section.replace('arb_srcptr d0, arb_srcptr d, slong g, slong prec)\n{','arb_srcptr d0, arb_srcptr d, slong g, slong prec, bf_batch_cache *cache)\n{',1)
    section=section.replace('acb_theta_agm_mul_tight(res, th0, th, d0, d, g, 0, prec);','bf_batch_mul(cache, res, th0, th, d0, d, g, 0, prec);')
    section=section.replace('    FLINT_ASSERT(nb_steps >= 1);','    bf_batch_cache cache;\n    bf_batch_init(&cache, n);\n    FLINT_ASSERT(nb_steps >= 1);')
    section=section.replace('        _arb_vec_scalar_mul_2exp_si(d0, distances, n, k + 1);','        bf_batch_reset(&cache);\n        _arb_vec_scalar_mul_2exp_si(d0, distances, n, k + 1);')
    section=section.replace('acb_theta_agm_mul_tight(', 'bf_batch_mul(&cache, ')
    # All three invocations of step_1 end with this exact argument sequence.
    assert section.count('d0, d, g, prec);')==3
    section=section.replace('d0, d, g, prec);','d0, d, g, prec, &cache);')
    section=section.replace('    _arb_vec_clear(d, n);','    bf_batch_clear(&cache);\n    _arb_vec_clear(d, n);')
    return source[:start]+section+source[end:]

def prepare():
    source=candidate_source()
    libs={}
    for name,flags in [('prepared',('-DBF_BATCH_TRANSFORMS=0',)),('shared',()),('trace',('-DBF_BATCH_TRACE=1',))]:
        libs[name]=build(name,{'ql_exact':source},flags)
    patch=ROOT/'patches/theta-batch-shared.patch'
    old=(BASE/'src/acb_theta/ql_exact.c').read_text()
    with patch.open('x') as f:f.write(''.join(difflib.unified_diff(old.splitlines(True),source.splitlines(True),fromfile='a/src/acb_theta/ql_exact.c',tofile='b/src/acb_theta/ql_exact.c')))
    test=OUT/'test-theta'
    run(['clang',*FLAGS,*INCLUDES,str(BASE/'src/acb_theta/test/main.c'),str(libs['shared']),*LIBS,'-o',str(test)],OUT/'test-compile.log')
    run([str(test),'acb_theta_agm_mul','acb_theta_agm_mul_tight','acb_theta_ql_exact','acb_theta_jet_notransform','acb_theta_jet'],OUT/'upstream-tests.log')
    cases=[dict(g=g,prec=p,nb=nb,square=s,fixture=f,all=1,trials=21) for g in (2,3) for p in (512,2048) for nb in (1,4,16) for s in (0,1) for f in (0,1)]
    validations=[];traces=[]
    for c in cases:
        for name in ('shared','prepared'):
            d=json.loads(subprocess.check_output(command(c,'validate',LEADING,libs[name]),text=True,timeout=120));validations.append(dict(case=c,variant=name,**d))
        d=json.loads(subprocess.check_output(command(c,'trace',LEADING,libs['trace']),text=True,timeout=120));traces.append(dict(case=c,**d))
    save(OUT/'validation.json',validations);save(OUT/'trace.json',traces)
    comparisons=[]
    for c in cases:
        for base,candidate in [('leading','shared'),('original','shared')]:comparisons.append(dict(case=c,base=base,candidate=candidate))
        if c['nb']==16:comparisons.append(dict(case=c,base='prepared',candidate='shared'))
    for f in (0,1):
        c=dict(g=2,prec=512,nb=4,square=0,fixture=f,all=1,trials=21,same=1)
        comparisons.append(dict(case=c,base='leading',candidate='shared'))
    random.Random(552103).shuffle(comparisons)
    frozen=json.loads((OUT/'historical.json').read_text())
    files=[Path(__file__).resolve(),ROOT/'bench/theta_batch.c',ROOT/'bench/theta_batch_internal.h',patch,OUT/'theta-batch',OUT/'validation.json',OUT/'trace.json',OUT/'upstream-tests.log']
    files += [p for p in BUILD.rglob('*') if p.is_file()]
    for p in files:frozen[str(p)]=sha(p)
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    save(OUT/'plan.json',dict(comparisons=comparisons,libraries={**{k:str(v) for k,v in LIBRARIES.items()},**{k:str(v) for k,v in libs.items()}},frozen_sha256=frozen,
         protocol='21 alternating ABBA/BAAB quartets, equal repetitions, 5ms calibration, 20ms joint warmup; complete public jet calls; analysis after timing.'))
    print('Prepared',len(comparisons),'comparisons and',len(validations),'direct-series validation fixtures',flush=True)

def measure():
    p=json.loads((OUT/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    with (OUT/'raw.jsonl').open('x') as out:
        for i,c in enumerate(p['comparisons']):
            raw=subprocess.check_output(command(c['case'],'measure',p['libraries'][c['base']],p['libraries'][c['candidate']]),text=True,timeout=180)
            rows=[json.loads(s) for s in raw.splitlines()];assert len(rows)==84
            out.write(json.dumps(dict(**c,rows=rows))+'\n');out.flush();print(i+1,'/',len(p['comparisons']),flush=True)

def analyze():
    p=json.loads((OUT/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    data=[json.loads(s) for s in (OUT/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in data]==p['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in data]
    save(OUT/'summary.json',dict(results=rows,preserved_hashes=len(p['frozen_sha256']),raw_sha256=sha(OUT/'raw.jsonl')))
    print('Analyzed',len(rows),'comparisons',flush=True)

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['profile','prepare','measure','analyze']);a=ap.parse_args();globals()[a.stage]()
