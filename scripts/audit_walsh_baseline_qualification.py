#!/usr/bin/env python3
"""Audit numerical coverage, baseline choice, paired timing and reported estimates."""
import hashlib
import json
import math
from pathlib import Path
import statistics

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'results/walsh-baseline-qualification'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
initial=json.loads((OUT/'plan.json').read_text())
confirmation=json.loads((OUT/'confirmation/plan.json').read_text())
for plan in (initial,confirmation):
    for name,h in plan['sha256'].items():assert sha(name)==h,name
assert len(initial['cases'])==18
assert len(initial['comparisons'])==134 and len(confirmation['comparisons'])==44
cell=lambda c:(c['logn'],c['target'],c['fixture'])
ordinary={0,1,4,5,6,7}
for c in initial['cases']:
    assert {r['candidate'] for r in initial['comparisons'] if not r['control'] and cell(r)==cell(c)}==set(range(1,8))
    assert {r['candidate'] for r in confirmation['comparisons'] if not r['control'] and cell(r)==cell(c)}=={2,3}
validation=json.loads((OUT/'validation.json').read_text())
assert len(validation)==434
for r in validation:
    c=r['case']; assert r['status']=='PASS'
    assert r['outputs_checked']==2*(1<<c['logn'])
    assert min(r['accuracy'])>=c['target']
    assert all(p==c['target']+c['logn']+8+16*(a-1) for p,a in zip(r['precision'],r['attempts']))
screen=json.loads((OUT/'summary.json').read_text())
for select in confirmation['selection']:
    scores={0:0.0}
    for r in screen['results']:
        c=r['case']
        if not c['control'] and cell(c)==cell(select) and c['candidate'] in ordinary:
            scores[c['candidate']]=r['cpu']['reduction_pct']
    assert set(scores)==ordinary and select['baseline']==max(scores,key=scores.get)
    for c in confirmation['comparisons']:
        if not c['control'] and cell(c)==cell(select):assert c['base']==select['baseline']
batches=0;retry_batches=0;controls=[]
for dest,plan in [(OUT,initial),(OUT/'confirmation',confirmation)]:
    raw=[json.loads(x) for x in (dest/'raw.jsonl').read_text().splitlines()]
    summary=json.loads((dest/'summary.json').read_text())
    assert [x['case'] for x in raw]==plan['comparisons']
    assert summary['raw_sha256']==sha(dest/'raw.jsonl')
    assert len(raw)==len(summary['results'])
    for packet,result in zip(raw,summary['results']):
        c=packet['case'];assert c==result['case'];rows=packet['rows']
        assert len(rows)==4*c['trials']
        for t in range(c['trials']):
            q=rows[4*t:4*t+4]
            assert [r['engine'] for r in q]==[int((j in (1,2))^bool(t&1)) for j in range(4)]
            assert [r['step'] for r in q]==list(range(4))
            assert all(r['trial']==t for r in q) and len({r['reps'] for r in q})==1
            assert min(r['reps'] for r in q)>0
            for r in q:
                assert r['precision']==c['target']+c['logn']+8+16*(r['attempts']-1)
                assert 1<=r['attempts']<=17
        for field,metric in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
            ratios=[]
            for t in range(c['trials']):
                q=rows[4*t:4*t+4]
                a=statistics.mean(r[metric] for r in q if r['engine']==0)
                b=statistics.mean(r[metric] for r in q if r['engine']==1)
                ratios.append(math.log(a/b))
            point=100*(1-math.exp(-statistics.mean(ratios)))
            assert abs(point-result[field]['reduction_pct'])<1e-10
        batches+=len(rows);retry_batches+=sum(r['attempts']>1 for r in rows)
        if c['control']:
            assert c['base']==c['candidate']
            if dest.name=='confirmation':controls.append(result)
assert len(controls)==8
receipt=dict(status='PASS',validation_comparisons=len(validation),enclosure_checks=sum(r['outputs_checked'] for r in validation),
             timed_batches=batches,retry_batches=retry_batches,confirmation_controls=8,
             controls_both_include_zero=sum(all(r[m]['ci95_low_pct']<=0<=r[m]['ci95_high_pct'] for m in ('cpu','wall')) for r in controls),
             scope='Frozen file hashes, full cell/confirmation coverage, fastest ordinary selection, exact-enclosure validation records, ABBA/BAAB ordering, equal repetitions, precision retries, independent raw CPU/wall point estimates and controls. Bootstrap algorithm is the existing frozen shared method.')
with (OUT/'audit.json').open('x') as f:json.dump(receipt,f,indent=2);f.write('\n')
print(json.dumps(receipt,indent=2))
