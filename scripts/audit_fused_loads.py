#!/usr/bin/env python3
"""Check coverage and provenance for the fused-load screen, regardless of speed."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
from analyze_experiments import logs
from benchmark import ROOT
from screen_fused_loads import forward, inverse


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    return json.loads((ROOT/path).read_text())


def main():
    plan = read('experiments/fused-load-plan.json')
    assembly = read('results/fused-load-assembly.json')
    for path, digest in assembly['sha256'].items():
        assert sha(ROOT/path) == digest, path
    for exponent, counts in [(4, (191, 188)), (5, (487, 479))]:
        entries = [r for r in assembly['functions']
                   if r['function'] == f'_sd_fft_basecase_{exponent}_0']
        a, b = entries
        assert tuple(r['instructions'] for r in entries) == counts
        assert a['stack_address_references'] == b['stack_address_references']
        assert not a['calls_or_tail_branches'] and not b['calls_or_tail_branches']
        # Every floating arithmetic opcode keeps its count.
        assert {k: v for k, v in a['opcode_counts'].items() if k.startswith('f')} == {
            k: v for k, v in b['opcode_counts'].items() if k.startswith('f')}
    manifest = read('results/fused-load-checks/build.json')
    assert sha(manifest['library']) == manifest['sha256']
    assert sha(ROOT/'patches/fused-load-fft.patch') == manifest['patch_sha256']
    assert manifest['changed'] == ['src/fft_small/sd_fft.c']
    original = (ROOT/'.deps/flint/src/fft_small/sd_fft.c').read_text()
    assert forward(original) == (ROOT/'.deps/experiments/fused-load-fft/src/fft_small/sd_fft.c').read_text()
    for kind, transform in [('fft', forward), ('ifft', inverse)]:
        source = (ROOT/f'.deps/flint/src/fft_small/sd_{kind}.c').read_text()
        assert source == (ROOT/f'build/fused-load-screen/control-{kind}.c').read_text()
        assert transform(source) == (ROOT/f'build/fused-load-screen/fused-{kind}.c').read_text()
    assert (ROOT/'results/fused-load-checks/tests.txt').read_text().count('(PASS)') == 4
    validation = read('results/fused-load-validation.json')
    assert validation['sha256'] == manifest['sha256']
    assert validation['case_count'] == len(validation['cases']) == 338
    assert all(c['passed'] and c['patterns_per_library'] == 12 for c in validation['cases'])
    assert sha(ROOT/'build/validate') == validation['validator_sha256']
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
    paths = ['scripts/screen_fused_loads.py', 'scripts/audit_fused_loads.py',
             'scripts/build_experiment.py', 'experiments/fused-load-plan.json',
             'results/fused-load-assembly.json', 'results/fused-load-validation.json',
             'results/fused-load-analysis.json']
    for run in plan['runs']:
        paths += [f"results/{run['name']}/{file}" for file in ['raw.jsonl', 'metadata.json']]
    report = {'status': 'PASS', 'runs': counts, 'GMP_comparisons_per_library': 4056,
              'sha256': {path: sha(ROOT/path) for path in paths},
              'scope': 'Evidence integrity and coverage; no speedup is required.'}
    (ROOT/'results/fused-load-audit.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
