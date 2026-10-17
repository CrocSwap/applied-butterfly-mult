#!/usr/bin/env python3
"""Audit the bounded application screen, timing records and isolated patch."""
import json
import math
from pathlib import Path
import statistics
import sys

from qualify_theory_paths_hard import ROOT, SISTER, sha, save


def read(path):return json.loads(Path(path).read_text())


def main():
    dest=ROOT/'results/weighted-phase-application';run=dest/'theta'
    output=dest/'audit.json';assert not output.exists()
    validation=read(run/'validation.json');summary=read(run/'summary.json')
    plan=read(run/'plan.json');matching=read(dest/'matching.json')
    integration=read(dest/'integration/build.json')
    frozen={**validation['frozen_sha256'],**validation['sha256']}
    for doc in (summary,matching,integration):frozen.update(doc['sha256'])
    for row in matching['sources']+matching['test_suites']:
        path=row.get('file',row.get('log'));frozen[path]=row['sha256']
    for path,h in frozen.items():assert sha(ROOT/path)==h,path
    groups={}
    for line in (run/'raw.jsonl').read_text().splitlines():
        row=json.loads(line);groups.setdefault(row['index'],[]).append(row)
    assert set(groups)==set(range(len(plan['comparisons'])))
    assert len(groups)==len(summary['summaries'])==126
    for s in summary['summaries']:
        c=plan['comparisons'][s['index']];rows=groups[s['index']]
        assert all(s[k]==v for k,v in c.items())
        assert len(rows)==84 and len({r['reps'] for r in rows})==1
        assert all(all(r[k]==v for k,v in c.items()) for r in rows)
        for m,field in (('cpu','cpu_ns_per_op'),('wall','ns_per_op')):
            logs=[]
            for trial in range(21):
                q=[r for r in rows if r['trial']==trial]
                assert [r['step'] for r in q]==[0,1,2,3]
                assert [r['engine'] for r in q]==([0,1,1,0] if trial%2==0 else [1,0,0,1])
                a,b=[statistics.mean(r[field] for r in q if r['engine']==e) for e in (0,1)]
                assert a>0 and b>0;logs.append(math.log(a/b))
            estimate=100*(1-math.exp(-statistics.mean(logs)))
            assert abs(estimate-s[m]['reduction_pct'])<1e-8
    direct=[s for s in summary['summaries'] if s['run'] and (s['base'],s['candidate'])==(0,3)]
    assert len(direct)==40
    assert all(s['cpu']['reduction_pct']>5 and all(s[m]['ci95_low_pct']>0 for m in ('cpu','wall')) for s in direct)
    assert len({(s['g'],s['prec'],s['square']) for s in direct})==20
    controls=[s for s in summary['summaries'] if not s['run']]
    assert len(controls)==6
    assert all(s['cpu']['ci95_low_pct']<=0<=s['cpu']['ci95_high_pct'] for s in controls)
    assert all(s['wall']['ci95_low_pct']<=0<=s['wall']['ci95_high_pct'] for s in controls)
    shared=[s for s in summary['summaries'] if s['run'] and (s['base'],s['candidate'])==(0,2)]
    versus_shared=[s for s in summary['summaries'] if s['run'] and (s['base'],s['candidate'])==(2,3)]
    assert len(shared)==len(versus_shared)==40
    accuracies=[r for r in summary['accuracies'] if r['run'] and (r['base'],r['candidate'])==(0,3)]
    assert len(accuracies)==40 and all(r['radius_sum_ratio']<1 for r in accuracies)
    assert validation['coefficient_checks']==137088 and validation['exact_containment_checks']==102816
    integrated_validation=read(dest/'integration/validation.json')
    assert all(integrated_validation[k]==validation[k] for k in integrated_validation)
    tests=(dest/'integration/tests.log').read_text()
    assert tests.count('PASS')==5 and 'FAIL' not in tests
    # Confirm extraction of exactly the already measured direct-loop body.
    proto=(ROOT/'bench/theta_phase_candidates.c').read_text().split('void bf_theta_direct(',1)[1]
    body=proto[proto.index('    slong n ='):proto.rfind('}')]
    body=body.replace('x+(b^k)','a1+(b^k)').replace('y+b','a2+b')
    body=''.join('    '+line+'\n' for line in body.splitlines())
    assert body in (ROOT/'.deps/experiments/theta-direct-walsh/agm_mul.c').read_text()
    assert sha(ROOT/'.deps/flint/libflint.25.0.dylib')=='31b9d75a502a408098b37990830d1f033a55fc5957e22ebf12cdaeb2a0fafe58'
    sys.path.insert(0,str(SISTER/'scripts'))
    from complex_compression import counts
    sizes=[dict(h=h,m=counts(h)['m'],positive_deficit=counts(h)['deficit']>0) for h in range(8,41,2)]
    assert next(r['h'] for r in sizes if r['positive_deficit'])==22
    files=[Path(__file__).resolve(),run/'summary.json',run/'validation.json',run/'plan.json',run/'raw.jsonl',
           dest/'matching.json',dest/'integration/build.json']
    result=dict(status='PASS',decision='No direct weighted-frame transfer identified; retain conventional theta primitive patch as a practical research byproduct',
        timing_comparisons=126,timed_batches=sum(map(len,groups.values())),direct_cases=20,direct_case_runs=40,
        direct_cpu_reduction_range=[min(s['cpu']['reduction_pct'] for s in direct),max(s['cpu']['reduction_pct'] for s in direct)],
        direct_cpu_and_wall_positive=40,
        shared_cpu_reduction_range=[min(s['cpu']['reduction_pct'] for s in shared),max(s['cpu']['reduction_pct'] for s in shared)],
        direct_vs_shared_positive=sum(all(s[m]['ci95_low_pct']>0 for m in ('cpu','wall')) for s in versus_shared),
        controls_include_zero_cpu_and_wall=6,
        prototype_coefficient_checks=137088,integrated_coefficient_checks=137088,
        exact_containment_checks_per_build=102816,upstream_tests=5,
        radius_sum_ratio_range=[min(r['radius_sum_ratio'] for r in accuracies),max(r['radius_sum_ratio'] for r in accuracies)],
        wider_individual_outputs=sum(r['wider_outputs'] for r in accuracies),
        fingerprints_checked=len(frozen),full_construction_even_h_screen=sizes,
        full_construction_limit='For the current count formulas, positive deficit first occurs at h=22 (m=10648); this is not an exclusion of small local transfers.',
        timing_limit='Screened prototype versus pinned library; rebuilt candidate library correctness-tested but not separately timed; no full theta-evaluation performance claim.',
        sha256={str(p):sha(p) for p in files})
    save(output,result)
    print(json.dumps({k:v for k,v in result.items() if k not in ('sha256','full_construction_even_h_screen')},indent=2))


if __name__=='__main__':main()
