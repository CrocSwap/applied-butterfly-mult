#!/usr/bin/env python3
"""Summarize prespecified confirmation cases, retaining CPU and wall metrics."""
from collections import defaultdict
import argparse
import csv
import json
import math
from pathlib import Path
import random
import statistics
from compare import summarize
from benchmark import ROOT


def logs(rows, metric):
    trials=defaultdict(list)
    for r in rows: trials[r['trial']].append(r)
    values=[]
    for trial, quartet in sorted(trials.items()):
        quartet.sort(key=lambda r:r['position'])
        first=trial%2
        assert [r['engine'] for r in quartet]==[first,1-first,1-first,first]
        assert len({r['iterations'] for r in quartet})==1
        a=statistics.mean(r[metric] for r in quartet if r['engine']==0)
        b=statistics.mean(r[metric] for r in quartet if r['engine']==1)
        values.append(math.log(a/b))
    return values


def aggregate(series):
    # Equal weight across fixed cases; resample temporal blocks within each case.
    rng=random.Random(87319)
    means=[statistics.mean(s) for s in series]
    boot=[]
    for _ in range(4000):
        sample_means=[]
        for s in series:
            block=min(5,max(1,len(s)//4))
            draw=[]
            while len(draw)<len(s):
                start=rng.randrange(len(s))
                draw.extend(s[(start+j)%len(s)] for j in range(block))
            sample_means.append(statistics.mean(draw[:len(s)]))
        boot.append(statistics.mean(sample_means))
    boot.sort()
    effect=lambda x:100*(1-math.exp(-x))
    return {'cases':len(series),'reduction_pct':effect(statistics.mean(means)),
            'ci95_low_pct':effect(boot[100]),'ci95_high_pct':effect(boot[3900])}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--runs', nargs='+', default=[
        'control-aa-dual','c3-register-confirm-1','c3-register-confirm-2'])
    parser.add_argument('--output', type=Path, default=ROOT/'results/confirmation-analysis.json')
    args=parser.parse_args()
    names=args.runs
    plan=json.loads((ROOT/'experiments/c3-confirmation-plan.json').read_text())
    lo,hi=plan['primary_interval_limbs']
    reports=[]
    for name in names:
        directory=ROOT/'results'/name
        rows=[json.loads(x) for x in (directory/'raw.jsonl').read_text().splitlines()]
        groups=defaultdict(list)
        for r in rows: groups[(r['an'],r['bn'],r['operation'])].append(r)
        report={'run':name,'metrics':{}}
        for metric in ('ns_per_op','cpu_ns_per_op'):
            per_case=[]
            series={}
            for (an,bn,op),case in sorted(groups.items()):
                series[(an,bn,op)]=logs(case,metric)
                per_case.append({'an':an,'bn':bn,'operation':op,**summarize(case,metric=metric)})
            label='wall' if metric=='ns_per_op' else 'cpu'
            with (directory/(label+'-summary.csv')).open('w') as f:
                w=csv.DictWriter(f,fieldnames=list(per_case[0]));w.writeheader();w.writerows(per_case)
            stats={}
            for shape in ('sqr','mul','unbalanced'):
                subset=[s for (an,bn,op),s in series.items() if lo<=an<=hi and
                        (op=='sqr' if shape=='sqr' else op=='mul' and ((an==bn) if shape=='mul' else (an!=bn)))]
                if subset: stats[shape]=aggregate(subset)
            report['metrics'][label]=stats
        reports.append(report)
        print(json.dumps(report),flush=True)
    args.output.write_text(json.dumps(reports,indent=2)+'\n')


if __name__=='__main__':main()
