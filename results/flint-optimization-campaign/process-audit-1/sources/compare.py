#!/usr/bin/env python3
"""Interleaved FLINT-vs-FLINT quartets with block-bootstrap uncertainty."""
import argparse
import csv
import hashlib
import json
import math
from pathlib import Path
import random
import statistics
import subprocess
from benchmark import ROOT, metadata


def summarize(rows, bootstrap=4000, metric='ns_per_op'):
    groups = {}
    for r in rows:
        groups.setdefault(r['trial'], {0: [], 1: []})[r['engine']].append(r[metric])
    logs = []
    for t, x in sorted(groups.items()):
        assert len(x[0]) == len(x[1]) == 2
        logs.append(math.log(statistics.mean(x[0]) / statistics.mean(x[1])))
    # Circular moving blocks retain short-range correlations across quartets.
    block = min(5, max(1, len(logs)//4))
    rng = random.Random(67341)
    draws = []
    for _ in range(bootstrap):
        resampled = []
        while len(resampled) < len(logs):
            start = rng.randrange(len(logs))
            resampled.extend(logs[(start+j) % len(logs)] for j in range(block))
        draws.append(statistics.mean(resampled[:len(logs)]))
    draws.sort()
    saving = lambda x: 100 * (1-math.exp(-x))
    return {'reduction_pct': saving(statistics.mean(logs)),
            'ci95_low_pct': saving(draws[int(bootstrap*.025)]),
            'ci95_high_pct': saving(draws[int(bootstrap*.975)]),
            'baseline_median_ns': statistics.median(r[metric] for r in rows if r['engine']==0),
            'candidate_median_ns': statistics.median(r[metric] for r in rows if r['engine']==1),
            'quartets': len(logs), 'bootstrap_block': block}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--baseline', type=Path, default=ROOT/'.deps/flint/libflint.25.0.dylib')
    ap.add_argument('--candidate', type=Path, required=True)
    ap.add_argument('--binary', type=Path, default=ROOT/'build/compare')
    ap.add_argument('--metric', choices=['wall','cpu'], default='wall')
    ap.add_argument('--output', type=Path, required=True)
    ap.add_argument('--sizes', nargs='+', type=int, required=True)
    ap.add_argument('--operations', nargs='+', choices=['mul','sqr','unbalanced'], default=['mul','sqr','unbalanced'])
    ap.add_argument('--trials', type=int, default=31)
    ap.add_argument('--batch-ms', type=int, default=20)
    ap.add_argument('--seed', type=int, default=71983)
    args = ap.parse_args()
    if min(args.sizes)<1 or args.trials<8 or args.batch_ms<1:
        ap.error('positive sizes/batch-ms and at least eight trials required')
    args.output.mkdir(parents=True, exist_ok=False)
    info = metadata()
    info['method'] = 'Two resident dylibs; 200ms combined warmup; equal iteration counts; alternating ABBA/BAAB quartets; 12 exact patterns per library per case'
    info['arguments'] = {k:str(v) if isinstance(v,Path) else v for k,v in vars(args).items()}
    info['comparison_sha256'] = {str(p):hashlib.sha256(p.read_bytes()).hexdigest()
                                for p in (args.baseline,args.candidate,args.binary,ROOT/'bench/compare.c')}
    (args.output/'metadata.json').write_text(json.dumps(info,indent=2)+'\n')
    cases = [(n,n if op!='unbalanced' else max(1,n//2),'sqr' if op=='sqr' else 'mul')
             for n in args.sizes for op in args.operations]
    random.Random(args.seed).shuffle(cases)
    summaries=[]
    with (args.output/'raw.jsonl').open('w') as output:
        for an,bn,op in cases:
            cmd=[str(args.binary.resolve()),str(args.baseline.resolve()),str(args.candidate.resolve()),
                 str(an),str(bn),op,str(args.trials),str(args.batch_ms)]
            raw=subprocess.check_output(cmd,text=True,cwd=ROOT)
            output.write(raw); output.flush()
            rows=[json.loads(line) for line in raw.splitlines()]
            summary={'an':an,'bn':bn,'operation':op,**summarize(rows,metric='cpu_ns_per_op' if args.metric=='cpu' else 'ns_per_op')}
            summaries.append(summary)
            print(f"{op} {an}x{bn}: {summary['reduction_pct']:+.2f}% "
                  f"[95% {summary['ci95_low_pct']:+.2f}, {summary['ci95_high_pct']:+.2f}]",flush=True)
            with (args.output/'summary.csv').open('w') as f:
                w=csv.DictWriter(f,fieldnames=list(summary));w.writeheader()
                w.writerows(sorted(summaries,key=lambda x:(x['operation'],x['an'],x['bn'])))


if __name__=='__main__': main()
