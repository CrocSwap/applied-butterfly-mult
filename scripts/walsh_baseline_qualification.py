#!/usr/bin/env python3
"""Requalify frozen Alman--Rao Arb kernels against stronger ordinary schedules."""
import sys
sys.dont_write_bytecode=True
import argparse
import hashlib
import json
from pathlib import Path
import random
import statistics
import subprocess
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS
from compare import summarize

OUT=ROOT/'results/walsh-baseline-qualification'
NAMES=['iterative_copy','recursive_copy','alman_rao_h4','alman_rao_h8',
       'direct_iterative','direct_recursive','direct_radix4','direct_radix8']
ORDINARY=(0,1,4,5,6,7)
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,d):
    with Path(p).open('x') as f:json.dump(d,f,indent=2);f.write('\n')
def verify(p):
    for name,h in p['sha256'].items():assert sha(name)==h,name
def call(c,mode,sanitized=False):
    return list(map(str,[OUT/('walsh-sanitize' if sanitized else 'walsh'),mode,
        c['logn'],c['target'],c['fixture'],c['base'],c['candidate'],c.get('trials',1)]))
def prepare():
    OUT.mkdir(parents=True,exist_ok=False)
    original=(ROOT/'bench/walsh_nonrigidity.c').read_text()
    assert original.count('#include "walsh_nonrigidity.h"')==1
    source=original.replace('#include "walsh_nonrigidity.h"','#include "walsh_baseline_qualification.h"')
    source=source.replace('e0<4&&e1>=0&&e1<4','e0<8&&e1>=0&&e1<8')
    marker='    mag_t radii[2],ratio;'
    assert source.count(marker)==1
    source=source.replace(marker,'''    /* Qualification-only checks, outside all timed batches. */
    for(slong i=0;i<n;i++) {
        arb_t copy;arb_init(copy);arb_set_fmpz_2exp(copy,exact+i,exp);
        if(fixture<2)arb_add_error_2exp_si(copy,-target-l-32);
        assert(arb_equal(copy,in+i));arb_clear(copy);
        if(e0==0&&(e1==1||e1>=4)) assert(arb_equal(out[0]+i,out[1]+i));
    }
'''+marker)
    (OUT/'harness.c').write_text(source)
    commands=[]
    for suffix,extra in [('',[]),('-sanitize',['-fsanitize=address,undefined'])]:
        cmd=['clang',*FLAGS,*extra,*INCLUDES,'-I'+str(ROOT/'bench'),str(OUT/'harness.c'),
             str(BASE/'libflint.25.0.dylib'),*LIBS,'-o',str(OUT/('walsh'+suffix))]
        commands.append(cmd)
        with (OUT/('build'+suffix+'.log')).open('x') as log:
            subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True)
    cases=[dict(logn=l,target=p,fixture=f) for l in (3,6,9,12) for p in (512,4096) for f in (0,1)]
    cases += [dict(logn=l,target=32768,fixture=0) for l in (6,12)]
    checks=[dict(logn=l,target=128,fixture=f) for l in range(11) for f in range(4)]+cases
    validations=[]
    for c in checks:
        for e in range(1,8):
            spec=dict(c,base=0,candidate=e)
            p=subprocess.run(call(spec,'validate',True),text=True,capture_output=True,timeout=180)
            if p.returncode:
                save(OUT/'validation-failure.json',dict(case=spec,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr));p.check_returncode()
            validations.append(dict(case=spec,**json.loads(p.stdout)))
    save(OUT/'validation.json',validations)
    comparisons=[dict(c,base=0,candidate=e,trials=11,control=False) for c in cases for e in range(1,8)]
    for l in (6,12):
        for e in (0,2,4,6):comparisons.append(dict(logn=l,target=4096,fixture=0,base=e,candidate=e,trials=11,control=True))
    random.Random(810081).shuffle(comparisons)
    files=[ROOT/'bench/walsh_nonrigidity.c',ROOT/'bench/walsh_nonrigidity.h',ROOT/'bench/walsh_baseline_qualification.h',
           Path(__file__).resolve(),ROOT/'scripts/compare.py',ROOT/'scripts/build_experiment.py',BASE/'libflint.25.0.dylib']
    files += [p for p in OUT.rglob('*') if p.is_file()]
    plan=dict(names=NAMES,ordinary=list(ORDINARY),cases=cases,comparisons=comparisons,commands=commands,
        sha256={str(p):sha(p) for p in files},
        inherited_manifest=str(ROOT/'results/erasure-basis-short-controls/completion.json'),
        inherited_manifest_sha256=sha(ROOT/'results/erasure-basis-short-controls/completion.json'),
        protocol='11 alternating ABBA/BAAB screening quartets, 200ms warmup, equal repetitions calibrated to >=20ms for slower variant. Separate timing from build, validation and analysis.',
        accuracy='Same frozen full-box dyadic oracle and target-relative-to-one contract. Start target+logn+8, retry +16 up to +256; copy/scaling/accuracy scan/retries timed; reusable output and scratch allocation outside timing.',
        confirmation='Select fastest of six ordinary methods in each cell by screening CPU reduction versus method 0 (zero for method 0). Carry ALL 36 H4/H8 comparisons and all eight controls to 31-quartet confirmation, no candidate selection or source edits.',
        gate='Report marginal CPU and wall intervals per case. A retained win must clear both in confirmation against selected ordinary baseline; inspect all controls and retain failures. No additional rerun to clean controls.',
        scope='Qualification of existing synthetic real-ball kernel gains on the same M2, not cross-hardware or a new full application gain.',
        attribution='Frozen older Alman--Rao non-rigidity constructions; new comparators are conventional butterflies with direct initial output and stage fusion.')
    verify(plan);save(OUT/'plan.json',plan)
    print(json.dumps(dict(validation_comparisons=len(validations),enclosure_checks=sum(x['outputs_checked'] for x in validations),screen_comparisons=len(comparisons))))
def measure(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    with (dest/'raw.jsonl').open('x') as f:
        for i,c in enumerate(plan['comparisons']):
            p=subprocess.run(call(c,'measure'),text=True,capture_output=True,timeout=240)
            if p.returncode:
                save(dest/f'failure-{i}.json',dict(case=c,stdout=p.stdout,stderr=p.stderr,returncode=p.returncode));p.check_returncode()
            rows=[json.loads(x) for x in p.stdout.splitlines()]
            assert len(rows)==4*c['trials']
            f.write(json.dumps(dict(case=c,rows=rows))+'\n');f.flush()
            print(json.dumps(dict(completed=i+1,total=len(plan['comparisons']),case=c)),flush=True)
    verify(plan)
def analyze(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    raw=[json.loads(x) for x in (dest/'raw.jsonl').read_text().splitlines()]
    assert [r['case'] for r in raw]==plan['comparisons']
    results=[]
    for r in raw:
        for t in range(r['case']['trials']):
            quartet=r['rows'][t*4:t*4+4]
            assert [x['engine'] for x in quartet]==[int((j in (1,2))^bool(t&1)) for j in range(4)]
            assert len({x['reps'] for x in quartet})==1
        results.append(dict(case=r['case'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])))
    groups=[]
    for p in (512,4096,32768):
        for e in (2,3):
            rr=[r for r in results if r['case']['target']==p and r['case']['candidate']==e and not r['case']['control']]
            groups.append(dict(target=p,engine=NAMES[e],cases=len(rr),median_cpu=statistics.median(x['cpu']['reduction_pct'] for x in rr),
                               positive_cpu=sum(x['cpu']['ci95_low_pct']>0 for x in rr),
                               positive_both=sum(min(x['cpu']['ci95_low_pct'],x['wall']['ci95_low_pct'])>0 for x in rr)))
    controls=[r for r in results if r['case']['control']]
    save(dest/'summary.json',dict(results=results,groups=groups,controls=controls,raw_sha256=sha(dest/'raw.jsonl')))
    print(json.dumps(groups,indent=2))
def confirm():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    summary=json.loads((OUT/'summary.json').read_text())
    best={};scores={}
    for c in plan['cases']:scores[(c['logn'],c['target'],c['fixture'])]={0:0.0}
    for r in summary['results']:
        c=r['case']
        if not c['control'] and c['candidate'] in ORDINARY:
            scores[(c['logn'],c['target'],c['fixture'])][c['candidate']]=r['cpu']['reduction_pct']
    for key,vals in scores.items():
        assert set(vals)==set(ORDINARY)
        best[key]=max(vals,key=vals.get)
    comps=[]
    for c in plan['comparisons']:
        if c['control']:comps.append(dict(c,trials=31))
        elif c['candidate'] in (2,3):comps.append(dict(c,base=best[(c['logn'],c['target'],c['fixture'])],trials=31))
    random.Random(810082).shuffle(comps)
    dest=OUT/'confirmation';dest.mkdir(exist_ok=False)
    plan['comparisons']=comps
    plan['selection']=[dict(logn=k[0],target=k[1],fixture=k[2],baseline=best[k],screen_cpu_reductions=scores[k]) for k in sorted(best)]
    plan['protocol']='31 ABBA/BAAB quartets; other numerical and timing contracts unchanged. All H4/H8 cases and controls retained.'
    for name in ('plan.json','raw.jsonl','summary.json'):plan['sha256'][str(OUT/name)]=sha(OUT/name)
    save(dest/'plan.json',plan);print(json.dumps(dict(confirmation_comparisons=len(comps),selection=plan['selection'])))

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('action',choices=('prepare','measure','analyze','confirm'));ap.add_argument('--confirmation',action='store_true');a=ap.parse_args()
    dest=OUT/'confirmation' if a.confirmation else OUT
    if a.action=='prepare':prepare()
    elif a.action=='measure':measure(dest)
    elif a.action=='analyze':analyze(dest)
    else:confirm()
