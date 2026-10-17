#!/usr/bin/env python3
"""Frozen prime-field RS fixtures and fresh-process paired comparisons."""
import argparse
import json
from pathlib import Path
import platform
import random
import shutil
import statistics
import struct
import subprocess
from compare import summarize
from optimization_campaign import ROOT, BASE, BUILDS, FLAGS, INCLUDES, LIBS, sha, check_baseline

BINARY = ROOT / 'build/rs-recovery'
SOURCE = ROOT / 'bench/rs_recovery.c'
LIBRARIES = {name: BUILDS / name / 'libflint-experiment.dylib'
             for name in ('control', 'combined-v1')}
LIBRARIES['original'] = BASE / 'libflint.25.0.dylib'
MODES = ['changing', 'batch16', 'cached']


def write_json(path, value):
    with path.open('x') as f:
        json.dump(value, f, indent=2)
        f.write('\n')


def build():
    check_baseline()
    if BINARY.exists():
        raise RuntimeError('Preserve existing benchmark binary')
    command = ['clang', *FLAGS, '-Wall', '-Wextra', *INCLUDES, str(SOURCE),
               *LIBS, '-o', str(BINARY)]
    subprocess.run(command, check=True)
    write_json(BINARY.with_suffix('.json'), dict(command=command,
        source_sha256=sha(SOURCE), binary_sha256=sha(BINARY)))


def fixture(path, k, p, width, seed):
    rng = random.Random(seed)
    n, blocks = 2*k, 16
    payloads, codewords, masks = [], [], []
    for j in range(blocks):
        payload = bytearray(rng.getrandbits(8) for _ in range(k*width))
        # Include zero/low-degree/all-byte-max payloads, not only dense random input.
        if j == 1: payload[:] = bytes(len(payload))
        if j == 2: payload[k*width//2:] = bytes(k*width-k*width//2)
        if j == 3: payload[:] = bytes([255])*len(payload)
        coeffs = [int.from_bytes(payload[i*width:(i+1)*width], 'little') for i in range(k)]
        assert max(coeffs) < p
        values = []
        for x in range(1, n+1):
            y = 0
            for c in reversed(coeffs): y = (y*x+c) % p
            values.append(y)
        mask = sorted(rng.sample(range(n), k))
        if j == 4: mask = list(range(k))
        if j == 5: mask = list(range(k, n))
        if j == 6: mask = list(range(0, n, 2))
        if j == 7: mask = list(range(1, n, 2))
        payloads.append(payload); codewords.extend(values); masks.extend(mask)
    with path.open('xb') as f:
        f.write(b'RSERASE1'+struct.pack('<5Q', k, n, width, blocks, p))
        for payload in payloads: f.write(payload)
        f.write(struct.pack(f'<{len(codewords)}Q', *codewords))
        f.write(struct.pack(f'<{len(masks)}Q', *masks))


def verify(plan):
    for path, digest in plan['sha256'].items():
        assert sha(path) == digest, path


def prepare(args):
    check_baseline()
    out = args.output.resolve(); out.mkdir(parents=True, exist_ok=False)
    sources = out/'sources'; sources.mkdir()
    paths = [BINARY, BINARY.with_suffix('.json'), *LIBRARIES.values()]
    for path in [SOURCE, Path(__file__), ROOT/'scripts/compare.py', ROOT/'scripts/optimization_campaign.py']:
        dest = sources/path.name; shutil.copyfile(path, dest); paths.append(dest)
    for name in ('control', 'combined-v1'):
        manifest = BUILDS/name/'build.json'; paths.append(manifest)
        for path, digest in json.loads(manifest.read_text())['sha256'].items():
            assert sha(path) == digest, path
            paths.append(Path(path))
    cases = []
    for k, p, width in [(64, 1000000007, 3), (256, 1000000007, 3),
                         (512, 1000000007, 3), (256, 18446744073709551557, 7)]:
        data = out/f'k{k}-p{p}.bin'; fixture(data, k, p, width, args.seed+k+p)
        paths.append(data)
        for mode in MODES:
            base = dict(k=k, n=2*k, modulus=p, bytes_per_symbol=width, mode=mode, fixture=str(data))
            cases.append(dict(base, candidate='combined-v1', group='active'))
            if k == 256 and width == 3:
                cases.append(dict(base, candidate='original', group='unchanged_control'))
    random.Random(args.seed).shuffle(cases)
    plan = dict(seed=args.seed, quartets=args.quartets, batch_ms=20, cases=cases,
                binary=str(BINARY), libraries={k:str(v) for k,v in LIBRARIES.items()},
                method='Fresh selected-library processes; alternating ABBA/BAAB; 100ms CPU warmup; four calibrated >=20ms CPU batches per process; uncertainty across process quartets.',
                scope='Nonsystematic rate-1/2 prime-field RS erasure-only recovery; byte payload as polynomial coefficients; independent Python encoding; 16 deterministic blocks and survivor sets; no disk/network/encoding time. Modes: changing includes all setup per block; batch16 includes one plan setup/clear per 16 blocks sharing survivors; cached excludes reusable plan setup/clear.',
                platform=platform.platform(), machine=platform.machine(),
                sha256={str(p.resolve()):sha(p) for p in paths})
    write_json(out/'plan.json', plan)
    print(f'Prepared {len(cases)} cases, {4*args.quartets*len(cases)} processes', flush=True)


def command(plan, case, library, milliseconds):
    return [plan['binary'], library, case['fixture'], str(MODES.index(case['mode'])), str(milliseconds)]


def validate_rows(rows, library, timed):
    bindings = [r for r in rows if r['phase'] == 'binding']
    assert len(bindings) == 11
    assert all(Path(r['image']).resolve() == Path(library).resolve() for r in bindings)
    checks = [r for r in rows if r['phase'] == 'check']
    assert len(checks) == 2 and all(r['passed'] and r['blocks'] == 16 for r in checks)
    batches = [r for r in rows if r['phase'] == 'timing']
    assert len(batches) == (4 if timed else 0)
    return batches


def run_checked(cmd, library, timed):
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(f'{cmd}: {result.returncode}\n{result.stdout}\n{result.stderr}')
    rows = [json.loads(s) for s in result.stdout.splitlines()]
    validate_rows(rows, library, timed)
    return dict(command=cmd, rows=rows, stderr=result.stderr, returncode=result.returncode)


def qualify(out):
    plan = json.loads((out/'plan.json').read_text()); verify(plan)
    records = []
    for case in plan['cases']:
        if case['group'] != 'active': continue
        for name in ('control', 'combined-v1', 'original'):
            lib = plan['libraries'][name]
            records.append(dict(case=case, library=lib,
                **run_checked(command(plan, case, lib, 0), lib, False)))
    write_json(out/'qualification.json', records)
    print(f'PASS: {len(records)} library/workload checks, {len(records)*32} exact block recoveries', flush=True)


def measure(out):
    plan = json.loads((out/'plan.json').read_text()); verify(plan)
    assert (out/'qualification.json').exists()
    with (out/'raw.jsonl').open('x') as log:
        for i, case in enumerate(plan['cases']):
            for trial in range(plan['quartets']):
                first = trial % 2
                for position, engine in enumerate([first, 1-first, 1-first, first]):
                    name = 'control' if engine == 0 else case['candidate']
                    lib = plan['libraries'][name]
                    cmd = command(plan, case, lib, plan['batch_ms'])
                    record = dict(case_index=i, trial=trial, position=position, engine=engine,
                                  library=lib, **run_checked(cmd, lib, True))
                    log.write(json.dumps(record)+'\n'); log.flush()
            print(f"{i+1}/{len(plan['cases'])}: {case['candidate']} k={case['k']} p={case['modulus']} {case['mode']}", flush=True)
    verify(plan)


def analyze(out):
    plan = json.loads((out/'plan.json').read_text()); verify(plan)
    raw = [json.loads(s) for s in (out/'raw.jsonl').read_text().splitlines()]
    assert len(raw) == len(plan['cases'])*plan['quartets']*4
    results = []
    for i, case in enumerate(plan['cases']):
        records = [r for r in raw if r['case_index'] == i]; observations = []
        for trial in range(plan['quartets']):
            quartet = [r for r in records if r['trial'] == trial]
            assert [r['position'] for r in quartet] == [0,1,2,3]
            first = trial % 2
            assert [r['engine'] for r in quartet] == [first,1-first,1-first,first]
        for r in records:
            batches = validate_rows(r['rows'], r['library'], True)
            observations.append(dict(trial=r['trial'], engine=r['engine'],
                cpu_ns_per_op=statistics.mean(b['cpu_ns_per_block'] for b in batches),
                ns_per_op=statistics.mean(b['wall_ns_per_block'] for b in batches)))
        cpu = summarize(observations, metric='cpu_ns_per_op'); wall = summarize(observations)
        results.append(dict(case=case, cpu=cpu, wall=wall))
        print(f"{case['candidate']:12} k={case['k']:3} {case['bytes_per_symbol']}B {case['mode']:8}: CPU {cpu['reduction_pct']:+.2f}% [{cpu['ci95_low_pct']:+.2f}, {cpu['ci95_high_pct']:+.2f}], wall {wall['reduction_pct']:+.2f}%")
    write_json(out/'summary.json', dict(raw_sha256=sha(out/'raw.jsonl'), results=results))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest='action', required=True)
    sub.add_parser('build')
    p = sub.add_parser('prepare'); p.add_argument('output', type=Path)
    p.add_argument('--seed', type=int, required=True); p.add_argument('--quartets', type=int, default=15)
    for name in ('qualify', 'measure', 'analyze'):
        sub.add_parser(name).add_argument('output', type=Path)
    args = parser.parse_args()
    if args.action == 'build': build()
    elif args.action == 'prepare': prepare(args)
    else: globals()[args.action](args.output.resolve())


if __name__ == '__main__': main()
