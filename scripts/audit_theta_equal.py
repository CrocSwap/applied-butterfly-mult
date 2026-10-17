#!/usr/bin/env python3
"""Independently recount paired estimates, coverage and preserved artifacts."""
import json
import math
from pathlib import Path
import statistics
from theta_equal import ROOT, OUT, BUILD, CURRENT, ORIGINAL, DIRECT, QL
from qualify_theory_paths_hard import sha, save


def main():
    gate=json.loads((OUT/'resource-gate.json').read_text())
    before=json.loads((OUT/'plan-before-resource-gate.json').read_text())
    initial=json.loads((OUT/'plan.json').read_text())
    confirmation=json.loads((OUT/'confirmation/plan.json').read_text())
    assert initial['comparisons']==[c for c in before['comparisons'] if c not in gate['removed']]
    encode=lambda c:json.dumps(c,sort_keys=True)
    expected=[c for c in initial['comparisons'] if c['case']['prec']==512 and
        c['case']['group'] not in ('ordinary_constants','mixed_batch')]
    assert sorted(map(encode,expected))==sorted(map(encode,confirmation['comparisons']))
    for r in gate['profiles']:
        assert r['variant']=='trace' and r['total_ns']/r['evaluations']>1e9
        assert r['equal_ns']/r['total_ns']<0.001
    fingerprints = {}
    batches = 0
    campaigns = {}
    for name in ('initial', 'confirmation'):
        dest = OUT if name == 'initial' else OUT / name
        plan = json.loads((dest / 'plan.json').read_text())
        fingerprints.update(plan['frozen_sha256'])
        raw = [json.loads(line) for line in (dest / 'raw.jsonl').read_text().splitlines()]
        summary = json.loads((dest / 'summary.json').read_text())
        assert summary['raw_sha256'] == sha(dest / 'raw.jsonl')
        assert len(raw) == len(plan['comparisons']) == len(summary['results'])
        for r, c, s in zip(raw, plan['comparisons'], summary['results']):
            assert {k: r[k] for k in ('case', 'base', 'candidate')} == c
            assert {k: s[k] for k in ('case', 'base', 'candidate')} == c
            trials = c['case'].get('trials', 31)
            assert len(r['rows']) == trials * 4
            batches += len(r['rows'])
            for field, label in [('cpu_ns_per_op', 'cpu'), ('ns_per_op', 'wall')]:
                logs = []
                for t in range(trials):
                    q = r['rows'][4*t:4*t+4]
                    assert [x['step'] for x in q] == list(range(4))
                    assert all(x['trial'] == t and x['reps'] > 0 and x[field] > 0 for x in q)
                    assert len({x['reps'] for x in q}) == 1
                    assert [x['engine'] for x in q] == [int((i in (1, 2)) ^ bool(t & 1)) for i in range(4)]
                    a = statistics.mean(x[field] for x in q if x['engine'] == 0)
                    b = statistics.mean(x[field] for x in q if x['engine'] == 1)
                    logs.append(math.log(a / b))
                estimate = 100 * (1 - math.exp(-math.fsum(logs) / trials))
                assert abs(estimate - s[label]['reduction_pct']) < 1e-10
        campaigns[name] = summary['groups']
    for p, h in fingerprints.items():
        assert sha(ROOT / p) == h, p
    assert (BUILD / 'rebuild/agm_mul.c').read_bytes() == DIRECT.read_bytes()
    assert json.loads((OUT / 'exact-check.json').read_text())['status'] == 'PASS'
    assert (OUT / 'upstream-tests.log').read_text().count('PASS') == 5
    validations = json.loads((OUT / 'validation.json').read_text())
    assert len(validations) == 34 and all(r['status'] == 'PASS' for r in validations)
    traces = json.loads((OUT / 'trace.json').read_text())
    assert len(traces) == 68
    for r in traces:
        assert r['all_calls'] >= r['equal_calls'] >= 0
        if r['case']['group'] in ('nonzero_control', 'single_control'):
            assert r['equal_calls'] == 0
        if r['case']['group'] in ('squared_constants', 'mixed_batch'):
            assert r['equal_calls'] > 0
    result = dict(status='PASS', preserved_fingerprints=len(fingerprints), timed_batches=batches,
        public_validation_outputs=sum(r['outputs'] for r in validations),
        minimum_accuracy_decreases=[r for r in validations if r['minimum_accuracy_candidate'] < r['minimum_accuracy_baseline']],
        exact_check=json.loads((OUT / 'exact-check.json').read_text()), campaigns=campaigns,
        note='PASS verifies integrity, numerical checks and raw point estimates. It is not a claim of clean timing controls or general performance.',
        sha256={str(p):sha(p) for p in [Path(__file__).resolve(), OUT/'summary.json', OUT/'confirmation/summary.json',
            OUT/'plan.json', OUT/'confirmation/plan.json', OUT/'validation.json', OUT/'trace.json',
            CURRENT, ORIGINAL, QL, ROOT/'patches/theta-equal-bank.patch']})
    save(OUT / 'audit.json', result)
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
