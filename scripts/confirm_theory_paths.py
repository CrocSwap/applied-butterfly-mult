#!/usr/bin/env python3
"""Confirm the bounded lead on fresh graphs and isolate retained vertex weights.

Five preselected sizes, three held-out graph seeds, three controls, two runs.
Separate AA comparisons pass exactly the same plan to both engines.
"""
import hashlib
import json
import os
from pathlib import Path
import random
import subprocess
from compare import summarize
from screen_theory_transfer import ROOT, PairedExclusionCircuit, SergeevPairCircuit
from benchmark_theory_paths import plan
from check_theory_paths_control import SeparateWeightsCircuit


def main():
    dest=ROOT/'results/theory-paths-confirm'
    dest.mkdir(exist_ok=False)
    previous=ROOT/'results/theory-paths-control'
    binary=previous/'theory-paths'
    for directory in (previous,ROOT/'results/theory-paths-screen'):
        report=json.loads((directory/'summary.json').read_text())
        for name,digest in report['sha256'].items():
            assert hashlib.sha256(Path(name).read_bytes()).hexdigest()==digest,name
    plans={};counts=[]
    for n in (8,12,16,20,24):
        for name,cls in [('paired',PairedExclusionCircuit),('sergeev',SergeevPairCircuit),
                         ('separate_weights',SeparateWeightsCircuit)]:
            c=cls(n); counts.append({'name':name,**c.verify()})
            plans[n,name]=plan(c,dest/f'{name}-{n}.bin')
    cases=[(n,seed,baseline) for n in (8,12,16,20,24)
           for seed in (8100011,9400033,10100039)
           for baseline in ('sergeev','separate_weights','failure_tree')]
    cases += [(n,seed,'paired_aa') for n in (8,16) for seed in (8100011,9400033,10100039)]
    (dest/'plan.json').write_text(json.dumps({'cases':cases,'runs':2,'quartets':31,
        'batch_ms':5,'kind':1,'weights':'dense directed integers uniformly sampled from [-1000,1000]',
        'seeds_are_new':True,'aa_control':'same paired plan passed twice at n=8 and n=16'},indent=2)+'\n')
    checks=[]
    for seed in (8100011,9400033,10100039):
        for kind in range(5):
            subprocess.run([str(binary),str(plans[8,'separate_weights']),str(plans[8,'paired']),
                            str(kind),'0','1','1'],check=True,stdout=subprocess.DEVNULL,
                           env={**os.environ,'BF_PATH_SEED':str(seed)})
            checks.append([8,seed,kind])
    summaries=[]
    raw=dest/'raw.jsonl'
    with raw.open('w') as out:
        for repeat in range(2):
            order=cases[:]; random.Random(7211101+repeat).shuffle(order)
            for n,seed,baseline in order:
                control='sergeev' if baseline=='failure_tree' else 'paired' if baseline=='paired_aa' else baseline
                cmd=[str(binary),str(plans[n,control]),str(plans[n,'paired']),
                     '1',str(int(baseline=='failure_tree')),'31','5']
                run=subprocess.run(cmd,check=True,capture_output=True,text=True,
                                   env={**os.environ,'BF_PATH_SEED':str(seed)})
                rows=[json.loads(s) for s in run.stdout.splitlines()]; assert len(rows)==124
                case={'repeat':repeat,'vertices':n+3,'pair_universe':n,'seed':seed,'baseline':baseline}
                for row in rows:out.write(json.dumps({**case,**row})+'\n')
                out.flush()
                r={**case,'cpu':summarize(rows,metric='cpu_ns_per_op'),
                   'wall':summarize(rows,metric='ns_per_op')}
                summaries.append(r)
                print(case,round(r['cpu']['reduction_pct'],2),flush=True)
            (dest/f'summary-{repeat}.json').write_text(json.dumps(
                [r for r in summaries if r['repeat']==repeat],indent=2)+'\n')
    files=[Path(__file__).resolve(),binary,ROOT/'bench/theory_paths_control.c',
           ROOT/'scripts/check_theory_paths_control.py',ROOT/'scripts/screen_theory_transfer.py',
           ROOT/'scripts/benchmark_theory_paths.py',ROOT/'scripts/compare.py',
           previous/'summary.json',dest/'plan.json',raw,*plans.values()]
    report={'status':'PASS','scope':'Warm synthetic complete path solves, dense broad-weight held-out graphs only',
            'counts':counts,'checks':checks,'summaries':summaries,
            'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    (dest/'summary.json').write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':main()
