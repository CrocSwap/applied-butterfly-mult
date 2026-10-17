#!/usr/bin/env python3
"""Validate provenance, correctness evidence, and coverage for phase two."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
from benchmark import ROOT
from analyze_experiments import logs


def read(path):
    return json.loads((ROOT/path).read_text())


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    plan=read('experiments/ablation-plan.json')
    comparisons={}
    for name in plan['ablations']:
        manifest=read(f'results/ablation-checks/ablation-{name}-build.json')
        assert digest(ROOT/f'patches/ablation-{name}.patch')==manifest['patch_sha256']
        assert digest(manifest['library'])==manifest['sha256']
        test=(ROOT/f'results/ablation-checks/ablation-{name}-tests.txt').read_text()
        assert test.count('(PASS)')==4
        validation=read(f'results/ablation-{name}-validation.json')
        assert validation['sha256']==manifest['sha256']
        assert validation['case_count']==len(validation['cases'])==338
        assert all(c['passed'] and c['patterns_per_library']==12 for c in validation['cases'])
        assert validation['comparisons_per_library']==4056
    names=[f'ablation-{name}-{session}' for name in plan['ablations'] for session in [1,2]]
    names+=['ablation-control','ablation-retained-check','pi-control','pi-confirm-1','pi-confirm-2']
    for name in names:
        metadata=read(f'results/{name}/metadata.json')
        for path,sha in metadata['comparison_sha256'].items(): assert digest(path)==sha
        groups=defaultdict(list)
        rows=[json.loads(line) for line in (ROOT/f'results/{name}/raw.jsonl').read_text().splitlines()]
        app=name.startswith('pi-')
        for row in rows:
            key=row['precision_bits'] if app else (row['an'],row['bn'],row['operation'])
            groups[key].append(row)
        if app:
            assert set(groups)==set(plan['application']['precisions_bits'])
            checks=[json.loads(line) for line in (ROOT/f'results/{name}/checks.jsonl').read_text().splitlines()]
            assert len(checks)==3
            for check in checks:
                assert check['exact_ball_equality'] and check['mpfr_directed_bounds_contained']
                assert check['verified_before_and_after']
                assert min(check['accuracy_bits'])>=check['precision_bits']-4
        else:
            sizes=[4096,8192,16384] if name in ['ablation-control','ablation-retained-check'] else plan['sizes']
            expected={(n,n,'mul') for n in sizes}|{(n,n,'sqr') for n in sizes}|{(n,n//2,'mul') for n in sizes}
            assert set(groups)==expected
        for case in groups.values():
            for metric in ['ns_per_op','cpu_ns_per_op']:
                assert len(logs(case,metric))==metadata['arguments']['trials']
        comparisons[name]={'cases':len(groups),'batches':len(rows)}
    report={'status':'PASS','ablation_GMP_comparisons_per_library':3*4056,
            'upstream_tests_per_ablation':4,'runs':comparisons,
            'note':'This validates evidence integrity and coverage, not a required performance outcome.'}
    trace=read('results/pi-trace/build.json')
    assert digest(trace['library'])==trace['sha256']
    assert digest(ROOT/'results/pi-trace/instrumentation.patch')==trace['patch_sha256']
    counts=[json.loads(line) for line in (ROOT/'results/pi-trace/counts.jsonl').read_text().splitlines()]
    assert [c['precision_bits'] for c in counts]==plan['application']['precisions_bits']
    assert all(0<c['fused_calls']<=c['np2_window_calls'] and c['fused_coefficients']>0 for c in counts)
    report['application_branch_reachability']=counts
    (ROOT/'results/ablation-audit.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__=='__main__':main()
