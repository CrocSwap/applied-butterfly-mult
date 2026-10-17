#!/usr/bin/env python3
"""Bounded Arb test of explicit Alman--Rao WHT circuits; no FLINT patch."""
import argparse
import importlib.util
import json
from pathlib import Path
import random
import statistics
import subprocess

from build_experiment import ROOT, BASE
from qualify_theory_paths_hard import sha, save
from compare import summarize

OUT=ROOT/'results/walsh-nonrigidity'
NAMES=['iterative_butterfly','recursive_butterfly','alman_rao_h4','alman_rao_h8']

def call(c,mode,sanitize=False):
    return list(map(str,[OUT/('walsh-sanitize' if sanitize else 'walsh'),mode,
                        c['logn'],c['target'],c['fixture'],c['base'],c['candidate'],c.get('trials',19)]))

def count(l,radix):
    n=1<<l;q,r=divmod(l,radix);size=1<<radix
    return dict(add_sub=(7 if radix==2 else 22)*(n//size)*q+n*r,
                halves=(n//size)*q,leaf_scales=n-(1<<r) if q else 0)

def operation_check():
    path=OUT/'sources/hadamard.py'
    spec=importlib.util.spec_from_file_location('published_wht',path)
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
    tests=0
    for l in range(8):
        n=1<<l
        for j in range(n):
            x=[(int(i==j),0) for i in range(n)]
            mod.general_ops_count=mod.p2_ops_count=0
            y=mod.fast_WHT(x,0)
            assert [v[0] for v in y]==[(-1)**((i&j).bit_count()%2) for i in range(n)]
            assert all(v[1]==0 for v in y)
            expected=count(l,3)
            assert mod.general_ops_count==2*expected['add_sub']
            assert mod.p2_ops_count==2*(expected['halves']+expected['leaf_scales'])
            tests+=1
    rows=[]
    for l in range(25):
        n=1<<l
        rows.append(dict(logn=l,n=n,butterfly_add_sub=n*l,h4=count(l,2),h8=count(l,3)))
    return dict(published_basis_vectors_checked=tests,rows=rows,
                note='Exact finite-size counts verified against the authors code; half/power-of-two scalings are reported separately. They are not additions.')

def verify(plan):
    for p,h in plan['sha256'].items():assert sha(ROOT/p)==h,p

def prepare():
    assert not (OUT/'plan.json').exists()
    save(OUT/'operation-counts.json',operation_check())
    validation=[]
    cases=[dict(logn=l,target=p,fixture=f) for l in (3,6,9,12)
           for p in (512,4096,32768) for f in (0,1)]
    # Exact dyadic centers; the oracle encloses the full independent input box.
    checks=[dict(logn=l,target=128,fixture=f) for l in range(11) for f in range(4)]+cases
    for i,c in enumerate(checks):
        for e in (1,2,3):
            spec=dict(**c,base=0,candidate=e,trials=1)
            proc=subprocess.run(call(spec,'validate',True),text=True,capture_output=True,timeout=180)
            if proc.returncode:
                save(OUT/f'validation-failure-{i}-{e}.json',dict(case=spec,stdout=proc.stdout,stderr=proc.stderr,returncode=proc.returncode))
                proc.check_returncode()
            validation.append(dict(case=spec,**json.loads(proc.stdout)))
        if i%8==0:print('Validated',i+1,'/',len(checks),flush=True)
    save(OUT/'validation.json',validation)
    comparisons=[dict(**c,base=0,candidate=e,trials=19,control=False) for c in cases for e in (1,2,3)]
    for l in (6,12):
        for e in (0,2):comparisons.append(dict(logn=l,target=4096,fixture=0,base=e,candidate=e,trials=19,control=True))
    random.Random(710077).shuffle(comparisons)
    fingerprints={}
    for path in ('results/theta-equal/plan.json','results/theta-equal/confirmation/plan.json',
                 'results/theta-equal/completion.json','results/theta-e4/status.json'):
        d=json.loads((ROOT/path).read_text())
        fingerprints.update(d.get('frozen_sha256',{}));fingerprints.update(d.get('sha256',{}))
        fingerprints[str(ROOT/path)]=sha(ROOT/path)
    for p in [Path(__file__).resolve(),ROOT/'bench/walsh_nonrigidity.c',ROOT/'bench/walsh_nonrigidity.h',
              ROOT/'scripts/compare.py',BASE/'libflint.25.0.dylib',*[p for p in OUT.rglob('*') if p.is_file()]]:
        fingerprints[str(p)]=sha(p)
    plan=dict(comparisons=comparisons,names=NAMES,sha256=fingerprints,
        protocol='19 ABBA/BAAB screening quartets; 200ms warmup; 20ms equal-repetition calibration; warm reusable output/scratch; input copy/scaling and achieved-accuracy scan included; time alone.',
        accuracy='Each output arb_rel_one_accuracy_bits >= target. Common initial precision target+logn+8, increase 16 bits on failure, cap +256. All retries included.',
        confirmation='Carry ALL H4/H8 cases into 31-quartet confirmation against the faster conventional baseline in each screening cell. Repeat four same-function controls. No selection by candidate success.',
        attribution='Alman--Rao 2023 explicit non-rigidity algorithms. Motivated here by the integer multiplication investigation and external review; no new OpenAI construction is implemented.',
        scope='Synthetic high-precision real-ball WHT kernels; not complete theta/FLINT application calls.')
    verify(plan);save(OUT/'plan.json',plan)
    print('Prepared',len(comparisons),'comparisons',flush=True)

def measure(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    with (dest/'raw.jsonl').open('x') as out:
        for i,c in enumerate(plan['comparisons']):
            proc=subprocess.run(call(c,'measure'),text=True,capture_output=True,timeout=180)
            if proc.returncode:
                save(dest/f'timing-failure-{i}.json',dict(case=c,stdout=proc.stdout,stderr=proc.stderr,returncode=proc.returncode))
                proc.check_returncode()
            rows=[json.loads(s) for s in proc.stdout.splitlines()]
            assert len(rows)==4*c['trials']
            out.write(json.dumps(dict(case=c,rows=rows))+'\n');out.flush()
            print(i+1,'/',len(plan['comparisons']),c,flush=True)
    verify(plan)

def analyze(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    raw=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
    assert [r['case'] for r in raw]==plan['comparisons']
    rows=[]
    for r in raw:
        for t in range(r['case']['trials']):
            q=r['rows'][4*t:4*t+4]
            assert [v['engine'] for v in q]==[int((i in (1,2))^bool(t&1)) for i in range(4)]
            assert len({v['reps'] for v in q})==1
        rows.append(dict(case=r['case'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])))
    groups={}
    for e in (1,2,3):
        rr=[r for r in rows if r['case']['candidate']==e and not r['case']['control']]
        if rr:groups[NAMES[e]]=dict(cases=len(rr),median_cpu=statistics.median(r['cpu']['reduction_pct'] for r in rr),
            positive_cpu=sum(r['cpu']['ci95_low_pct']>0 for r in rr),positive_both=sum(min(r['cpu']['ci95_low_pct'],r['wall']['ci95_low_pct'])>0 for r in rr))
    save(dest/'summary.json',dict(results=rows,groups=groups,raw_sha256=sha(dest/'raw.jsonl')))
    print(json.dumps(groups,indent=2))

def confirm():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    pilot=json.loads((OUT/'summary.json').read_text())
    best={}
    for r in pilot['results']:
        c=r['case']
        if c['candidate']==1 and not c['control']:
            best[(c['logn'],c['target'],c['fixture'])]=int(r['cpu']['reduction_pct']>0)
    comps=[]
    for c in plan['comparisons']:
        if c['control']:comps.append(dict(c,trials=31))
        elif c['candidate'] in (2,3):
            comps.append(dict(c,base=best[c['logn'],c['target'],c['fixture']],trials=31))
    random.Random(710078).shuffle(comps)
    dest=OUT/'confirmation';dest.mkdir(exist_ok=False)
    plan['comparisons']=comps
    plan['protocol']='31 ABBA/BAAB quartets, otherwise screening protocol unchanged. Baseline per cell selected on screening CPU point estimate; no candidate cases dropped.'
    for name in ('plan.json','raw.jsonl','summary.json'):plan['sha256'][str(OUT/name)]=sha(OUT/name)
    save(dest/'plan.json',plan);print('Prepared confirmation:',len(comps))

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('action',choices=['prepare','measure','analyze','confirm']);p.add_argument('--confirmation',action='store_true')
    a=p.parse_args();dest=OUT/'confirmation' if a.confirmation else OUT
    if a.action=='prepare':prepare()
    elif a.action=='measure':measure(dest)
    elif a.action=='analyze':analyze(dest)
    else:confirm()
