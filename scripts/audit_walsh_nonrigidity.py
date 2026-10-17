#!/usr/bin/env python3
"""Recount frozen WHT measurements and baseline selection without rerunning timing."""
import json
import math
import statistics
from walsh_nonrigidity import ROOT, OUT, sha, save, verify

pilot=json.loads((OUT/'summary.json').read_text())
best={}
for r in pilot['results']:
    c=r['case']
    if not c['control'] and c['candidate']==1:
        best[c['logn'],c['target'],c['fixture']]=int(r['cpu']['reduction_pct']>0)
fingerprints={};batches=0;retry_batches=0
for dest in (OUT,OUT/'confirmation'):
    plan=json.loads((dest/'plan.json').read_text());verify(plan);fingerprints.update(plan['sha256'])
    summary=json.loads((dest/'summary.json').read_text())
    raw=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
    assert summary['raw_sha256']==sha(dest/'raw.jsonl')
    assert [r['case'] for r in raw]==plan['comparisons']==[r['case'] for r in summary['results']]
    if dest.name=='confirmation':
        expected={(l,p,f,e) for l in (3,6,9,12) for p in (512,4096,32768) for f in (0,1) for e in (2,3)}
        actual={(c['logn'],c['target'],c['fixture'],c['candidate']) for c in plan['comparisons'] if not c['control']}
        assert actual==expected
    for r,s in zip(raw,summary['results']):
        c=r['case'];assert len(r['rows'])==4*c['trials'];batches+=len(r['rows'])
        if dest.name=='confirmation' and not c['control']:
            assert c['base']==best[c['logn'],c['target'],c['fixture']]
        for v in r['rows']:
            assert v['precision']>=c['target']+c['logn']+8 and v['attempts']>=1
            retry_batches+=v['attempts']>1
        for field,label in [('cpu_ns_per_op','cpu'),('ns_per_op','wall')]:
            logs=[]
            for t in range(c['trials']):
                q=r['rows'][4*t:4*t+4]
                assert [v['engine'] for v in q]==[int((i in (1,2))^bool(t&1)) for i in range(4)]
                assert [v['step'] for v in q]==list(range(4))
                assert all(v['trial']==t and v[field]>0 for v in q)
                assert len({v['reps'] for v in q})==1
                base=statistics.mean(v[field] for v in q if v['engine']==0)
                cand=statistics.mean(v[field] for v in q if v['engine']==1)
                logs.append(math.log(base/cand))
            estimate=100*(1-math.exp(-math.fsum(logs)/len(logs)))
            assert abs(estimate-s[label]['reduction_pct'])<1e-10
validation=json.loads((OUT/'validation.json').read_text())
assert len(validation)==204 and all(v['status']=='PASS' for v in validation)
assert all(min(v['accuracy'])>=v['case']['target'] for v in validation)
rows=json.loads((OUT/'confirmation/summary.json').read_text())['results']
grouped=[]
for p in (512,4096,32768):
    for e in (2,3):
        subset=[r for r in rows if not r['case']['control'] and r['case']['target']==p and r['case']['candidate']==e]
        grouped.append(dict(target=p,candidate=e,cases=len(subset),
            median_cpu=statistics.median(r['cpu']['reduction_pct'] for r in subset),
            min_cpu=min(r['cpu']['reduction_pct'] for r in subset),max_cpu=max(r['cpu']['reduction_pct'] for r in subset),
            positive_cpu=sum(r['cpu']['ci95_low_pct']>0 for r in subset),
            positive_both=sum(min(r['cpu']['ci95_low_pct'],r['wall']['ci95_low_pct'])>0 for r in subset)))
result=dict(status='PASS',verified_fingerprints=len(fingerprints),timed_batches=batches,retry_batches=retry_batches,
    numerical_comparisons=len(validation),output_enclosures_checked=sum(v['outputs_checked'] for v in validation),
    confirmation_groups=grouped,controls=[r for r in rows if r['case']['control']],
    note='Integrity and numerical audit; marginal timing intervals are not simultaneous confidence bounds. No complete application is benchmarked.',
    sha256={str(p):sha(p) for p in [ROOT/'scripts/audit_walsh_nonrigidity.py',OUT/'plan.json',OUT/'raw.jsonl',OUT/'summary.json',
        OUT/'confirmation/plan.json',OUT/'confirmation/raw.jsonl',OUT/'confirmation/summary.json',OUT/'validation.json']})
assert not (OUT/'audit.json').exists();save(OUT/'audit.json',result)
print(json.dumps({k:v for k,v in result.items() if k not in ('controls','sha256')},indent=2))
