#!/usr/bin/env python3
"""Audit the fixed hard-instance campaign and its no-confirmation decision."""
import json
import math
from pathlib import Path
import statistics

from qualify_theory_paths_hard import ROOT, FAMILIES, SEEDS, sha, save
from audit_theory_transfer import check_plan


def main():
    dest=ROOT/'results/theory-paths-hard';run=dest/'run'
    output=dest/'audit.json';assert not output.exists()
    spec=json.loads((run/'plan.json').read_text())
    validation=json.loads((run/'validation.json').read_text())
    report=json.loads((run/'summary.json').read_text())
    fallback=json.loads((dest/'fallback-checks/summary.json').read_text())
    fingerprints={**validation['frozen_sha256']}
    for r in (validation,report,fallback):
        assert r['status']=='PASS';fingerprints.update(r['sha256'])
    manifest=json.loads((dest/'data/manifest.json').read_text())
    for r in manifest['files']:fingerprints[r['file']]=r['sha256']
    for p,h in fingerprints.items():assert sha(ROOT/p)==h,p
    plans=[check_plan(p) for p in sorted(run.glob('*.bin'))]
    answers={c['case']:(c['engines'][0]['weight'],c['engines'][0]['count']) for c in validation['checks']}
    for c in validation['checks']:
        assert all((e['weight'],e['count'])==answers[c['case']] for e in c['engines'])
        if 'oracle' in c:assert answers[c['case']]==(c['oracle']['weight'],c['oracle']['count'])
    groups={}
    for line in (run/'raw.jsonl').read_text().splitlines():
        row=json.loads(line);groups.setdefault((row['id'],row['baseline_engine']),[]).append(row)
    assert set(groups)=={(j['case'],j['engine']) for j in spec['schedule']}
    assert len(groups)==len(report['summaries'])==259
    for s in report['summaries']:
        rows=groups[s['id'],s['baseline_engine']]
        assert len(rows)==60 and len({r['reps'] for r in rows})==1 and rows[0]['reps']>0
        assert all((r['weight'],r['count'])==answers[s['id']] for r in rows)
        quartets=[]
        for trial in range(15):
            q=[r for r in rows if r['trial']==trial]
            assert [r['step'] for r in q]==[0,1,2,3]
            assert [r['engine'] for r in q]==([0,1,1,0] if trial%2==0 else [1,0,0,1])
            quartets.append(q)
        for metric,field in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
            logs=[]
            for q in quartets:
                means=[statistics.mean(r[field] for r in q if r['engine']==e) for e in (0,1)]
                assert min(means)>0;logs.append(math.log(means[0]/means[1]))
            estimate=100*(1-math.exp(-statistics.mean(logs)))
            assert abs(estimate-s[metric]['reduction_pct'])<1e-9
    strong=[s for s in report['summaries'] if s['baseline_engine']==5]
    assert len(strong)==48
    assert all(s[m]['ci95_high_pct']<0 for s in strong for m in ('cpu','wall'))
    qualified=[]
    for family in FAMILIES:
        for N in (19,27):
            rows=[s for s in report['summaries'] if s['family']==family and s['vertices']==N
                  and s['baseline_engine'] in (3,4,5)]
            assert len(rows)==len(SEEDS)*3
            if all(s[m]['ci95_low_pct']>0 for s in rows for m in ('cpu','wall')):qualified.append([family,N])
    assert not qualified
    table=[]
    for family in (*FAMILIES,'public_wnt'):
        rows=[s for s in strong if s['family']==family]
        table.append(dict(family=family,cases=len(rows),
            paired_over_nonbacktracking_cpu_min=min(1-s['cpu']['reduction_pct']/100 for s in rows),
            paired_over_nonbacktracking_cpu_max=max(1-s['cpu']['reduction_pct']/100 for s in rows)))
    aa=[s for s in report['summaries'] if s['baseline_engine']==0]
    small_signal=[s for s in aa if s['cpu']['ci95_low_pct']>0 and s['wall']['ci95_low_pct']>0]
    oracle=[c['oracle'] for c in validation['checks'] if 'oracle' in c]
    baseline=ROOT/'.deps/flint/libflint.25.0.dylib'
    assert sha(baseline)=='31b9d75a502a408098b37990830d1f033a55fc5957e22ebf12cdaeb2a0fafe58'
    paths=[Path(__file__).resolve(),run/'plan.json',run/'validation.json',run/'summary.json',
           dest/'fallback-checks/summary.json',ROOT/'scripts/audit_theory_transfer.py']
    result=dict(status='PASS',decision='No family qualifies for held-out confirmation; no practical paired-circuit win',
        comparisons=len(groups),timed_batches=sum(map(len,groups.values())),graphs=len(validation['checks']),
        engine_correctness_checks=sum(len(c['engines']) for c in validation['checks'])+21,
        networkx_graphs=len(oracle)+3,networkx_enumerated_six_edge_paths=sum(r['enumerated_paths'] for r in oracle)+15121,
        fingerprints_checked=len(fingerprints),plans=plans,nonbacktracking_wins_cpu_and_wall=48,
        confirmation_families=qualified,table=table,aa_comparisons=len(aa),
        aa_positive_small_signals=[dict(case=s['id'],cpu_reduction_pct=s['cpu']['reduction_pct']) for s in small_signal],
        baseline_flint_unchanged=True,sha256={str(p):sha(p) for p in paths})
    save(output,result)
    print(json.dumps({k:v for k,v in result.items() if k not in ('plans','sha256')},indent=2))


if __name__=='__main__':main()
