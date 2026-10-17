#!/usr/bin/env python3
"""Recompute reductions from raw quartets and check the complete evidence chain."""
import json
import math
from pathlib import Path
import re
import statistics
from qualify_theory_paths_hard import ROOT, sha, save

OUT=ROOT/'results/theta-batch'

def summary(rows):
    return dict(cases=len(rows),median_cpu_reduction_pct=statistics.median(r['cpu']['reduction_pct'] for r in rows),
        minimum_cpu_reduction_pct=min(r['cpu']['reduction_pct'] for r in rows),maximum_cpu_reduction_pct=max(r['cpu']['reduction_pct'] for r in rows),
        positive_cpu_intervals=sum(r['cpu']['ci95_low_pct']>0 for r in rows),
        positive_cpu_and_wall_intervals=sum(min(r['cpu']['ci95_low_pct'],r['wall']['ci95_low_pct'])>0 for r in rows))

def main():
    fingerprints={};campaigns={};batches=0
    for name in ('retained','confirmation','control-diagnostic'):
        dest=OUT/name;plan=json.loads((dest/'plan.json').read_text());fingerprints.update(plan['frozen_sha256'])
        raw=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
        report=json.loads((dest/'summary.json').read_text());assert report['raw_sha256']==sha(dest/'raw.jsonl')
        assert len(raw)==len(plan['comparisons'])==len(report['results'])
        for r,p,s in zip(raw,plan['comparisons'],report['results']):
            assert {k:r[k] for k in ('case','base','candidate')}==p
            assert {k:s[k] for k in ('case','base','candidate')}==p
            trials=r['case'].get('trials',21);assert len(r['rows'])==4*trials
            batches+=len(r['rows'])
            for metric,label in [('cpu_ns_per_op','cpu'),('ns_per_op','wall')]:
                logs=[]
                for t in range(trials):
                    group=r['rows'][4*t:4*t+4];assert [x['step'] for x in group]==list(range(4))
                    assert all(x['trial']==t and x['reps']>0 and x[metric]>0 for x in group)
                    assert [x['engine'] for x in group]==[int((step in (1,2)) ^ bool(t&1)) for step in range(4)]
                    assert len({x['reps'] for x in group})==1
                    a=statistics.mean(x[metric] for x in group if x['engine']==0)
                    b=statistics.mean(x[metric] for x in group if x['engine']==1)
                    logs.append(math.log(a/b))
                estimate=100*(1-math.exp(-math.fsum(logs)/trials))
                assert abs(estimate-s[label]['reduction_pct'])<1e-10
        groups={}
        for base in ('leading','original','prepared','shared'):
            for nb in (0,1,4,16):
                rows=[r for r in report['results'] if r['base']==base and r['case']['g']>1 and not r['case'].get('same') and (not nb or r['case']['nb']==nb)]
                if rows:groups[f'{base}_nb{nb}']=summary(rows)
        campaigns[name]=dict(comparisons=len(raw),groups=groups)
    for p,h in fingerprints.items():assert sha(ROOT/p)==h,p
    validation=json.loads((OUT/'retained/validation.json').read_text())
    assert len(validation)==48 and all(r['status']=='PASS' for r in validation)
    assert all(r['minimum_accuracy_candidate']>=r['minimum_accuracy_baseline'] for r in validation)
    for file in ('cache-check.json','retained/cache-check.json','retained/precision-check.json'):
        assert json.loads((OUT/file).read_text())['status']=='PASS'
    for file in ('upstream-tests.log','retained/upstream-tests.log'):
        assert (OUT/file).read_text().count('PASS')==5
    build=ROOT/'.deps/experiments/theta-batch'
    exact=(build/'shared/ql_exact.c').read_text();retained=(build/'retained/ql_exact.c').read_text()
    strip=lambda s:re.sub(r'\s+','',re.sub(r'/\*.*?\*/','',s,flags=re.S))
    assert strip(exact)==strip(retained.replace('if(s->hat_prec<hprec)','if(s->hat_prec!=hprec)'))
    assert (build/'unchanged-ql/ql_exact.c').read_bytes()==(ROOT/'.deps/flint/src/acb_theta/ql_exact.c').read_bytes()
    result=dict(status='PASS',preserved_fingerprints=len(fingerprints),timed_batches=batches,campaigns=campaigns,
        exact_precision_and_retained_variants_differ_only_in_cache_precision_condition=True,
        full_call_retained_validation_outputs=sum(r['outputs'] for r in validation),
        note='PASS certifies evidence integrity and numerical checks. Performance scope and control anomalies are reported in docs/theta-batch.md.',
        sha256={str(p):sha(p) for p in [Path(__file__).resolve(),OUT/'retained/summary.json',OUT/'confirmation/summary.json',OUT/'control-diagnostic/summary.json']})
    save(OUT/'audit.json',result)
    print(json.dumps(result,indent=2))

if __name__=='__main__':main()
