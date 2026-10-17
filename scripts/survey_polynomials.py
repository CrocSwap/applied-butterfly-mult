#!/usr/bin/env python3
"""Baseline polynomial timing and isolated dispatch coverage; no candidate comparison."""
import argparse
import csv
import hashlib
import json
from pathlib import Path
import platform
import random
import statistics
import subprocess
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parents[1]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--plan', type=Path, default=ROOT/'experiments/polynomial-survey-plan.json')
    ap.add_argument('--output', type=Path, required=True)
    args = ap.parse_args()
    plan = json.loads(args.plan.read_text())
    args.output.mkdir(parents=True, exist_ok=False)
    build = json.loads((ROOT/'results/poly-survey-checks/build.json').read_text())
    for name, digest in build['sha256'].items():
        assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest() == digest, name
    cases = [[d,n,p,w] for d in plan['dimensions'] for n in plan['lengths']
             for p in plan['moduli'] for w in plan['windows']]
    random.Random(plan['seed']).shuffle(cases)
    metadata = {
        'started_utc':datetime.now(timezone.utc).isoformat(),
        'platform':platform.platform(),
        'hardware':subprocess.check_output(['sysctl','hw.model','hw.memsize','hw.ncpu'],text=True),
        'plan':plan, 'case_order':cases, 'build':build,
        'source_sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
                         for p in [Path(__file__).resolve(),args.plan.resolve()]},
        'method':'One thread. Baseline only. Three input patterns checked against explicit KS matrix dot products. Seven warm batches per case. Separate instrumented process for dispatch counts; no instrumented timing. First-call observations are diagnostic, not a cold-start distribution.'}
    (args.output/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
    trace = {}
    for mode in ['trace','timing']:
        with (args.output/(mode+'.jsonl')).open('x') as out:
            for index, case in enumerate(cases):
                executable = 'poly-survey-trace' if mode == 'trace' else 'poly-survey'
                samples = -1 if mode == 'trace' else plan['samples']
                cmd = [str(ROOT/'build'/executable),*map(str,case),str(samples),str(plan['batch_ms'])]
                run = subprocess.run(cmd,text=True,capture_output=True,check=True)
                rows = [json.loads(line) for line in run.stdout.splitlines()]
                assert rows and all(row['dim']==case[0] and row['length']==case[1]
                                    and row['modulus']==case[2] for row in rows)
                out.write(run.stdout);out.flush()
                if mode == 'trace':
                    row = rows[0]
                    if row['supported']:
                        row['counts'] = dict(zip(build['count_fields'],row['counts'],strict=True))
                        row['plan'] = dict(zip(build['plan_fields'],row['plan'],strict=True))
                    trace[tuple(case)] = row
                else:
                    row = trace[tuple(case)]
                    assert row['supported'] == rows[0]['supported']
                    if row['supported']:
                        warm = [r for r in rows if r['phase']=='warm']
                        assert len(warm)==plan['samples']
                        row['first_wall_ns'],row['first_cpu_ns'] = rows[0]['wall_ns'],rows[0]['cpu_ns']
                        for metric in ['wall_ns','cpu_ns']:
                            values = [r[metric] for r in warm]
                            median = statistics.median(values)
                            row['median_'+metric] = median
                            row['mad_'+metric] = statistics.median(abs(v-median) for v in values)
                if (index+1)%12==0:print(mode,index+1,'/',len(cases),flush=True)
    results = list(trace.values())
    (args.output/'summary.json').write_text(json.dumps(results,indent=2)+'\n')
    fields = ['dim','length','modulus','window','supported','median_cpu_ns','mad_cpu_ns',
              'median_wall_ns','mad_wall_ns','first_cpu_ns','first_wall_ns']
    with (args.output/'summary.csv').open('w') as out:
        writer=csv.DictWriter(out,fieldnames=fields,extrasaction='ignore');writer.writeheader();writer.writerows(results)


if __name__ == '__main__':
    main()
