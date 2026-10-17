#!/usr/bin/env python3
"""Audit and combine the two frozen RS recovery confirmations; no new timing."""
import json
from pathlib import Path
import statistics
from benchmark_rs_recovery import ROOT, SOURCE, BINARY, verify, validate_rows, write_json, sha
from optimization_campaign import check_baseline


def main():
    root = ROOT/'results/rs-recovery'
    check_baseline()
    build = json.loads(BINARY.with_suffix('.json').read_text())
    assert sha(SOURCE) == build['source_sha256']
    assert sha(BINARY) == build['binary_sha256']
    cases, controls, checked_blocks, processes, batches = {}, [], 0, 0, 0
    files = [SOURCE, BINARY, BINARY.with_suffix('.json'), Path(__file__)]
    for run in ('confirmation-1', 'confirmation-2'):
        directory = root/run
        plan = json.loads((directory/'plan.json').read_text()); verify(plan)
        summary = json.loads((directory/'summary.json').read_text())
        assert sha(directory/'raw.jsonl') == summary['raw_sha256']
        files.extend(directory/p for p in ('plan.json','summary.json','raw.jsonl','qualification.json'))
        raw = [json.loads(s) for s in (directory/'raw.jsonl').read_text().splitlines()]
        assert len(raw) == len(plan['cases'])*plan['quartets']*4 == 900
        for i, result in enumerate(summary['results']):
            case = result['case']; assert case == plan['cases'][i]
            records = [r for r in raw if r['case_index'] == i]
            assert len(records) == 4*plan['quartets']
            for trial in range(plan['quartets']):
                quartet = [r for r in records if r['trial'] == trial]
                first = trial % 2
                assert [r['position'] for r in quartet] == [0,1,2,3]
                assert [r['engine'] for r in quartet] == [first,1-first,1-first,first]
            for record in records:
                expected = plan['libraries']['control' if record['engine'] == 0 else case['candidate']]
                assert record['library'] == expected
                assert record['returncode'] == 0 and not record['stderr']
                assert record['command'][0] == plan['binary']
                assert record['command'][1] == expected and record['command'][2] == case['fixture']
                timed = validate_rows(record['rows'], expected, True)
                assert all(b['blocks'] > 0 and b['cpu_ns_per_block'] > 0 and b['wall_ns_per_block'] > 0 for b in timed)
                batches += len(timed); processes += 1; checked_blocks += 32
            row = dict(run=run, cpu=result['cpu'], wall=result['wall'])
            if case['group'] == 'active':
                key = (case['k'],case['modulus'],case['bytes_per_symbol'],case['mode'])
                cases.setdefault(key, []).append(row)
            else: controls.append(dict(mode=case['mode'], **row))
        qualification = json.loads((directory/'qualification.json').read_text())
        assert len(qualification) == 36
        for record in qualification:
            assert record['returncode'] == 0 and not record['stderr']
            validate_rows(record['rows'], record['library'], False); checked_blocks += 32
    sanitizers = json.loads((root/'sanitizers.json').read_text())
    assert len(sanitizers['records']) == 48
    for record in sanitizers['records']:
        assert record['returncode'] == 0 and not record['stderr']
        validate_rows(record['rows'], record['library'], False); checked_blocks += 32
    negative = json.loads((root/'negative-check.json').read_text())
    assert negative['returncode'] != 0 and 'incorrect recovery' in negative['stderr']
    assert sha(root/'negative-payload.bin') == negative['fixture_sha256']
    assert checked_blocks == 61440 and processes == 1800 and batches == 7200
    files.extend(root/p for p in ('sanitizers.json','negative-check.json','negative-payload.bin'))
    results = []
    for (k, p, width, mode), runs in sorted(cases.items()):
        assert len(runs) == 2
        cpu_range = [min(r['cpu']['reduction_pct'] for r in runs), max(r['cpu']['reduction_pct'] for r in runs)]
        both_cpu = all(r['cpu']['ci95_low_pct'] > 0 for r in runs)
        both_wall = all(r['wall']['ci95_low_pct'] > 0 for r in runs)
        results.append(dict(k=k,n=2*k,modulus=p,bytes_per_symbol=width,payload_bytes=k*width,
            mode=mode,cpu_reduction_range_pct=cpu_range,positive_cpu_intervals_both_runs=both_cpu,
            positive_wall_intervals_both_runs=both_wall,runs=runs))
        print(f'k={k:3} width={width} {mode:8} CPU {cpu_range[0]:.2f}–{cpu_range[1]:.2f}% repeated positive intervals CPU={both_cpu} wall={both_wall}')
    report = dict(status='PASS',processes=processes,timed_batches=batches,
        exact_block_recoveries=checked_blocks,results=results,controls=controls,
        qualifications=[
            'CPU time is primary; wall timing was noisier.',
            'Confirmation 2 cached unchanged-code CPU control: +1.58%, CI [0.13%,2.83%]; limits small-effect attribution. All other CPU control intervals include zero.',
            'Prime-field nonsystematic Reed–Solomon erasure recovery, deterministic generated byte payloads. Not an external production application or a comparison with specialized GF(256) decoders.',
            'Includes allocations, survivor gathering, interpolation, payload range checks, byte serialization and an output checksum. Encoding, file/network I/O and correctness comparison are outside timing.',
            'Changing mode reconstructs each plan per block. Batch16 builds and clears one plan per 16 blocks. Cached mode retains a plan across blocks and excludes its setup/clear.',
            'One Apple M2, one FLINT thread, warm process/allocator state, two independently seeded frozen input sets.',
            'Candidate is the existing combined-v1 library; only its two interpolation changes are exercised by this workload.',
            sanitizers['scope']],
        reproduce=[
            'python3 scripts/benchmark_rs_recovery.py prepare results/rs-recovery/repro-1 --seed 824173 --quartets 15',
            'python3 scripts/benchmark_rs_recovery.py qualify results/rs-recovery/repro-1',
            'python3 scripts/benchmark_rs_recovery.py measure results/rs-recovery/repro-1',
            'python3 scripts/benchmark_rs_recovery.py analyze results/rs-recovery/repro-1',
            'Repeat in a fresh directory with --seed 507931. Build command and library hashes are preserved in the manifests.'],
        artifact_sha256={str(p):sha(p) for p in files})
    write_json(root/'report.json', report)
    print(f'PASS: {processes} processes, {batches} batches, {checked_blocks} exact recovered blocks')
    for c in controls:
        if c['cpu']['ci95_low_pct'] > 0 or c['cpu']['ci95_high_pct'] < 0:
            print('Control limitation:', c['run'], c['mode'], c['cpu'])


if __name__ == '__main__': main()
