#!/usr/bin/env python3
"""Check a stronger data-specific control, with fresh graph seeds.

Uses the frozen plans from the exploratory run. Does not replace old evidence.
"""
import hashlib
import json
import os
from pathlib import Path
import random
import subprocess
from compare import summarize
from screen_theory_transfer import ROOT, PairedExclusionCircuit


class SeparateWeightsCircuit(PairedExclusionCircuit):
    """Ablation: same pairing, but process internal vertex weights separately."""
    def block(self, points, edges, weights):
        if not any(weights.values()):
            return super().block(points, edges, weights)
        t, one, two = super().block(points, edges, {p:0 for p in points})
        wt, wo, ww = self.vector([weights[p] for p in points])
        return (self.add(t,wt),
                {p:self.add(one[p],wo[i]) for i,p in enumerate(points)},
                {(points[i],points[j]):self.add(two[points[i],points[j]],z)
                 for (i,j),z in ww.items()})


def main():
    dest=ROOT/'results/theory-paths-control'
    dest.mkdir(exist_ok=False)
    old=ROOT/'results/theory-paths-screen'
    old_info=json.loads((old/'summary.json').read_text())
    for p,digest in old_info['sha256'].items():
        assert hashlib.sha256(Path(p).read_bytes()).hexdigest()==digest,p
    ablation=[]
    for n in (8,16,32,49,64):
        c=SeparateWeightsCircuit(n); result=c.verify()
        ablation.append({'n':n,'paired_additions':PairedExclusionCircuit(n).additions,
                         'separate_weights':result})
    binary=dest/'theory-paths'
    command=['clang','-std=gnu23','-O3','-g','-mcpu=apple-m2',str(ROOT/'bench/theory_paths_control.c'),'-o',str(binary)]
    subprocess.run(command,check=True)
    def run(n,kind,trials,seed,baseline='sergeev',fault=1):
        return subprocess.run([str(binary),str(old/f'{baseline}-{n}.bin'),str(old/f'paired-{n}.bin'),
                               str(kind),str(fault),str(trials),'3'],check=True,text=True,capture_output=True,
                              env={**os.environ,'BF_PATH_SEED':str(seed)})
    checks=[]
    for seed in (904019,1600091,7300021):
        for n in (4,5,6,7,8):
            for kind in range(5):
                run(n,kind,1,seed);checks.append([seed,n,kind])
    cases=[(n,kind,seed) for n in (16,32,49,64) for kind in range(4)
           for seed in (904019,1600091,7300021)]
    random.Random(4500123).shuffle(cases)
    summaries=[]
    raw=dest/'raw.jsonl'
    with raw.open('w') as out:
        for n,kind,seed in cases:
            result=run(n,kind,15,seed)
            rows=[json.loads(s) for s in result.stdout.splitlines()]; assert len(rows)==60
            case={'vertices':n+3,'kind':kind,'seed':seed,'baseline':'failure_tree_live_initialization'}
            for row in rows:out.write(json.dumps({**case,**row})+'\n')
            out.flush()
            summary={**case,'cpu':summarize(rows,metric='cpu_ns_per_op'),
                     'wall':summarize(rows,metric='ns_per_op')}
            summaries.append(summary)
            print(case,round(summary['cpu']['reduction_pct'],2),flush=True)
    files=[Path(__file__).resolve(),ROOT/'bench/theory_paths_control.c',binary,raw,old/'summary.json',
           ROOT/'scripts/screen_theory_transfer.py',ROOT/'scripts/compare.py']
    report={'status':'PASS','checks':checks,'ablation':ablation,'summaries':summaries,'compile':command,
            'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files},
            'scope':'Exploratory fresh-instance control; no broad performance or optimality claim'}
    (dest/'summary.json').write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':main()
