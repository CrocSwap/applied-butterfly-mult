#!/usr/bin/env python3
"""Audit whole-call ablations, accuracy records, controls and source preservation."""
import json
import math
import statistics
from pathlib import Path
from theta_nonrigidity import ROOT,OUT,BUILD,SOURCES,cases,key,sha,save,verify

pilot=json.loads((OUT/'summary.json').read_text())['results']
best={key(r['case']):('recursive' if r['cpu']['reduction_pct']>0 else 'iterative')
      for r in pilot if r['base']=='iterative' and r['candidate']=='recursive'}
hashes={};batches=0;retries=0
for dest in (OUT,OUT/'confirmation'):
    plan=json.loads((dest/'plan.json').read_text());verify(plan);hashes.update(plan['sha256'])
    raw=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
    summary=json.loads((dest/'summary.json').read_text())
    assert summary['raw_sha256']==sha(dest/'raw.jsonl')
    assert [{k:r[k] for k in ('case','base','candidate')} for r in raw]==plan['comparisons']
    assert len(raw)==len(summary['results'])
    if dest.name=='confirmation':
        for candidate in ('h4','h8'):
            rr=[r for r in raw if r['candidate']==candidate and not r['case']['group'].endswith('_control')]
            assert {key(r['case']) for r in rr}=={key(c) for c in cases()} and len(rr)==len(cases())
            assert all(r['base']==best[key(r['case'])] for r in rr)
        rr=[r for r in raw if r['base']=='current' and r['candidate'] in ('iterative','recursive')]
        assert {key(r['case']) for r in rr}=={key(c) for c in cases()}
        assert all(r['candidate']==best[key(r['case'])] for r in rr)
    for r,s in zip(raw,summary['results']):
        assert all(r[k]==s[k] for k in ('case','base','candidate'))
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
                a=statistics.mean(v[field] for v in q if v['engine']==0)
                b=statistics.mean(v[field] for v in q if v['engine']==1)
                logs.append(math.log(a/b))
            value=100*(1-math.exp(-math.fsum(logs)/len(logs)))
            assert abs(value-s[label]['reduction_pct'])<1e-10
for unit,path in SOURCES.items():assert (BUILD/'rebuild'/(unit+'.c')).read_bytes()==path.read_bytes()
exact=[]
for name in ('iterative','recursive','h4','h8'):
    r=json.loads((OUT/(name+'-exact.json')).read_text());assert r['status']=='PASS';exact.append(r)
    assert (OUT/(name+'-tests.log')).read_text().count('PASS')==5
validation=json.loads((OUT/'validation.json').read_text())
assert len(validation)==4*len(cases()) and all(r['status']=='PASS' for r in validation)
assert all(min(r['minimum_accuracy_baseline'],r['minimum_accuracy_candidate'])>=r['case']['prec']-32 for r in validation)
trace=json.loads((OUT/'trace.json').read_text())
for r in trace:
    c=r['counters'];g=r['case']['g']
    assert len(c)==24
    if g<2:assert c[2]==c[6]==0
    if g<3:assert c[3]==c[7]==0
rows=json.loads((OUT/'confirmation/summary.json').read_text())['results']
def stats(rr):
    return dict(cases=len(rr),median_cpu=statistics.median(r['cpu']['reduction_pct'] for r in rr),
                positive_cpu=sum(r['cpu']['ci95_low_pct']>0 for r in rr),
                positive_both=sum(min(r['cpu']['ci95_low_pct'],r['wall']['ci95_low_pct'])>0 for r in rr),
                negative_cpu=sum(r['cpu']['ci95_high_pct']<0 for r in rr))
groups={}
for group in ('constants','nonzero','mixed'):
    groups['ordinary/'+group]=stats([r for r in rows if r['base']=='current' and r['case']['group']==group])
for candidate,gmin in [('h4',2),('h8',3)]:
    groups[candidate+'/active']=stats([r for r in rows if r['candidate']==candidate and r['case']['g']>=gmin and r['case']['group'] in ('constants','nonzero','mixed')])
controls=[r for r in rows if r['case']['group'].endswith('_control') or
          r['candidate'] in ('h4','h8') and r['case']['g']<(2 if r['candidate']=='h4' else 3)]
result=dict(status='PASS',verified_fingerprints=len(hashes),timed_batches=batches,retry_batches=retries,
    exact_containments=sum(r['exact_containments'] for r in exact),upstream_tests=20,
    public_comparisons=len(validation),public_outputs=sum(r['outputs'] for r in validation),
    minimum_accuracy_decreases=sum(r['minimum_accuracy_candidate']<r['minimum_accuracy_baseline'] for r in validation),
    confirmation_groups=groups,controls=controls,
    note='No active candidate has a positive CPU interval. Inactive H8 genus-two results cannot support a construction-specific claim. Controls limit subpercent interpretation.',
    sha256={str(p):sha(p) for p in [Path(__file__).resolve(),OUT/'plan.json',OUT/'raw.jsonl',OUT/'summary.json',
        OUT/'confirmation/plan.json',OUT/'confirmation/raw.jsonl',OUT/'confirmation/summary.json',OUT/'validation.json',OUT/'trace.json']})
assert not (OUT/'audit.json').exists();save(OUT/'audit.json',result)
print(json.dumps({k:v for k,v in result.items() if k not in ('controls','sha256')},indent=2))
