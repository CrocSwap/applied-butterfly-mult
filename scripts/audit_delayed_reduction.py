#!/usr/bin/env python3
"""Audit range-search, exact checks, assembly, and timing coverage without requiring a win."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
from analyze_experiments import logs
from benchmark import ROOT
from make_delayed_reduction import modified
from reduction_schedule import search, SELECTED
import reduction_schedule16


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    return json.loads((ROOT/path).read_text())


def main():
    plan = read('experiments/delayed-reduction-plan.json')
    screen = read('results/reduction-schedule-search.json')
    assert screen == search()
    assert screen['schedules_checked'] == 4096 and screen['minimum_reductions'] == 3
    assert [r['cuts'] for r in screen['minimum_schedules']] == [sorted(SELECTED)]
    assert read('results/reduction-schedule16-search.json') == reduction_schedule16.search()
    source = (ROOT/'.deps/flint/src/fft_small/sd_ifft.c').read_text()
    assert (ROOT/'build/delayed-reduction-screen/control.c').read_text() == source
    candidate = modified(source)
    assert (ROOT/'build/delayed-reduction-screen/delayed.c').read_text() == candidate
    assert (ROOT/'.deps/experiments/delayed-reduction/src/fft_small/sd_ifft.c').read_text() == candidate
    manifest = read('results/delayed-reduction-checks/build.json')
    assert sha(manifest['library']) == manifest['sha256']
    assert sha(ROOT/'patches/delayed-reduction.patch') == manifest['patch_sha256']
    assert manifest['changed'] == ['src/fft_small/sd_ifft.c']
    assert (ROOT/'results/delayed-reduction-checks/tests.txt').read_text().count('(PASS)') == 4
    direct = read('results/delayed-reduction-checks/direct-build.json')
    for path, digest in direct['sha256'].items():
        assert sha(ROOT/path) == digest, path
    assert (ROOT/'results/delayed-reduction-checks/direct-tests.txt').read_text().strip() == (
        'PASS 211072 radix8 integer-reference cases, 55296 leaf32 differential cases, '
        '3458048 coefficient and range checks')
    assembly = read('results/delayed-reduction-assembly.json')
    for row in assembly['functions']:
        assert sha(ROOT/row['artifact']) == row['sha256']
        assert not row['calls_or_tail_branches']
    original, new = [r for r in assembly['functions'] if r['function'] == '_sd_ifft_basecase_5_0']
    assert (original['instructions'], new['instructions']) == (504, 490)
    assert (original['stack_address_references'], new['stack_address_references']) == (22, 20)
    for opcode in ['fmul.2d', 'frintn.2d', 'fmls.2d']:
        assert original['opcode_counts'][opcode]-new['opcode_counts'][opcode] == 4
    validation = read('results/delayed-reduction-validation.json')
    assert validation['sha256'] == manifest['sha256']
    assert validation['case_count'] == len(validation['cases']) == 338
    assert validation['comparisons_per_library'] == 4056
    assert sha(ROOT/'build/validate') == validation['validator_sha256']
    assert all(c['passed'] and c['patterns_per_library'] == 12 for c in validation['cases'])
    counts = {}
    for run in plan['runs']:
        name = run['name']
        metadata = read(f'results/{name}/metadata.json')
        for path, digest in metadata['comparison_sha256'].items():
            assert sha(path) == digest, path
        arguments = metadata['arguments']
        assert Path(arguments['baseline']).resolve() == ROOT/'.deps/flint/libflint.25.0.dylib'
        assert Path(arguments['candidate']).resolve() == ROOT/f".deps/experiments/{run['candidate']}/libflint-experiment.dylib"
        assert arguments['trials'] == plan['trials']
        assert arguments['batch_ms'] == plan['batch_ms']
        assert arguments['seed'] == run['seed']
        rows = [json.loads(line) for line in (ROOT/f'results/{name}/raw.jsonl').read_text().splitlines()]
        groups = defaultdict(list)
        for row in rows:
            groups[(row['an'], row['bn'], row['operation'])].append(row)
        sizes = plan['sizes'] if run['sizes'] == 'all' else run['sizes']
        expected = {(n, n, 'sqr') for n in sizes} | {(n, n, 'mul') for n in sizes} | {
            (n, n//2, 'mul') for n in sizes}
        assert set(groups) == expected
        for case in groups.values():
            for metric in ['cpu_ns_per_op', 'ns_per_op']:
                assert len(logs(case, metric)) == plan['trials']
        counts[name] = {'cases': len(groups), 'batches': len(rows)}
    trace = [json.loads(line) for line in (ROOT/'results/delayed-reduction-checks/leaf-calls.jsonl').read_text().splitlines()]
    products = [r for r in trace if r['operation'] != 'ifft']
    assert len(products) == 33
    assert {(r['an'],r['bn'],r['operation']) for r in products} == expected
    assert all(r['leaf32_nonzero'] == r['leaf32_zero'] == 0 and r['leaf16_nonzero'] > 0 for r in products)
    inverse = {r['an']: r for r in trace if r['operation'] == 'ifft'}
    assert inverse[128]['leaf32_nonzero'] == 3 and inverse[512]['leaf32_nonzero'] == 15
    assert inverse[256]['leaf32_nonzero'] == inverse[1024]['leaf32_nonzero'] == 0
    trace_build = read('results/delayed-reduction-checks/trace-build.json')
    assert sha(trace_build['build']['library']) == trace_build['build']['sha256']
    assert sha(ROOT/'patches/delayed-reduction-trace.patch') == trace_build['build']['patch_sha256']
    assert sha(ROOT/'build/trace-inverse-leaves') == trace_build['harness_sha256']
    inverse_plan = read('experiments/inverse-only-plan.json')
    for run in inverse_plan['runs']:
        name = run['name']
        meta = read(f'results/{name}/metadata.json')
        assert meta['run'] == run and meta['plan'] == inverse_plan
        for path,digest in meta['sha256'].items():
            assert sha(ROOT/path) == digest
        rows = [json.loads(line) for line in (ROOT/f'results/{name}/raw.jsonl').read_text().splitlines()]
        assert {r['an'] for r in rows} == set(inverse_plan['sizes'])
        for n in inverse_plan['sizes']:
            case = [r for r in rows if r['an'] == n]
            for metric in ['cpu_ns_per_op','ns_per_op']:
                assert len(logs(case,metric)) == inverse_plan['trials']
        counts[name] = {'cases': 4, 'batches': len(rows)}
    paths = ['scripts/reduction_schedule.py', 'scripts/make_delayed_reduction.py',
             'scripts/check_delayed_reduction.py', 'scripts/audit_delayed_reduction.py',
             'tests/test_reduction_schedule.py', 'bench/test_delayed_reduction.c',
             'experiments/delayed-reduction-plan.json', 'results/reduction-schedule-search.json',
             'results/delayed-reduction-assembly.json', 'results/delayed-reduction-validation.json',
             'results/delayed-reduction-analysis.json', 'results/delayed-reduction-checks/tests.txt',
             'results/delayed-reduction-checks/direct-tests.txt']
    paths += ['scripts/reduction_schedule16.py', 'results/reduction-schedule16-search.json',
              'bench/trace_inverse_leaves.c', 'scripts/trace_delayed_reduction.py',
              'results/delayed-reduction-checks/leaf-calls.jsonl',
              'bench/compare_inverse.c', 'scripts/compare_inverse.py',
              'experiments/inverse-only-plan.json', 'results/inverse-only-analysis.json']
    for run in plan['runs']:
        paths += [f"results/{run['name']}/{file}" for file in ['raw.jsonl', 'metadata.json']]
    for run in inverse_plan['runs']:
        paths += [f"results/{run['name']}/{file}" for file in ['raw.jsonl', 'metadata.json']]
    report = {'status': 'PASS', 'runs': counts, 'GMP_comparisons_per_library': 4056,
              'direct_coefficient_and_range_checks': 3458048,
              'multiplication_cases_executing_changed_leaf': 0,
              'sha256': {path: sha(ROOT/path) for path in paths},
              'scope': 'Evidence integrity and coverage only; no speedup is required.'}
    (ROOT/'results/delayed-reduction-audit.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
