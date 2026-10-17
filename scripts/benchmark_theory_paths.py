#!/usr/bin/env python3
"""Bounded exploratory screen; same evaluator for both circuit constructions."""
import argparse
import hashlib
import json
import platform
from pathlib import Path
import random
import struct
import subprocess
import sys

from screen_theory_transfer import ROOT, SISTER, PairedExclusionCircuit, SergeevPairCircuit, IntervalPairCircuit
from compare import summarize


def plan(c, path):
    # Preserve all original inputs, compact only the reachable arithmetic DAG.
    order = [0, *range(1, len(c.inputs)+1),
             *(i for i in sorted(c.active) if c.args[i] is not None)]
    index = {i:j for j,i in enumerate(order)}
    words = [0x42544631,c.n,len(c.inputs),len(order)]
    for i in order[len(c.inputs)+1:]:
        words.extend(index[a] for a in c.args[i])
    words.extend(index[c.outputs[p]] for p in c.inputs)
    path.write_bytes(struct.pack('<'+'I'*len(words),*words))
    return path


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--output',required=True,type=Path)
    ap.add_argument('--trials',type=int,default=15)
    args=ap.parse_args()
    dest=args.output.resolve();dest.mkdir(parents=True,exist_ok=False)
    assert sys.byteorder=='little' and platform.system()=='Darwin'
    plans={};counts=[]
    for n in (4,5,6,7,8,16,32,49,64):
        for name,cls in [('paired',PairedExclusionCircuit),('sergeev',SergeevPairCircuit),('interval',IntervalPairCircuit)]:
            c=cls(n); counts.append({'name':name,**c.verify()})
            plans[n,name]=plan(c,dest/f'{name}-{n}.bin')
    binary=dest/'theory-paths'
    command=['clang','-std=gnu23','-O3','-g','-mcpu=apple-m2',str(ROOT/'bench/theory_paths.c'),'-o',str(binary)]
    subprocess.run(command,check=True)
    # All compilation / exact plan verification finishes before any measurements.
    checks=[]
    for n in (4,5,6,7,8):
        for kind in range(5):
            for baseline,fault in [('sergeev',0),('interval',0),('sergeev',1)]:
                subprocess.run([str(binary),str(plans[n,baseline]),str(plans[n,'paired']),str(kind),str(fault),'1','1'],
                               check=True,stdout=subprocess.DEVNULL)
                checks.append([n,kind,baseline,fault])
    cases=[(n,kind,baseline,fault) for n in (16,32,49,64) for kind in (0,1,2,3)
           for baseline,fault in [('sergeev',0),('interval',0),('sergeev',1)]]
    random.Random(731091).shuffle(cases)
    raw=dest/'raw.jsonl';summaries=[]
    with raw.open('w') as out:
        for n,kind,baseline,fault in cases:
            cmd=[str(binary),str(plans[n,baseline]),str(plans[n,'paired']),str(kind),str(fault),str(args.trials),'3']
            run=subprocess.run(cmd,check=True,text=True,capture_output=True)
            rows=[json.loads(line) for line in run.stdout.splitlines()]
            assert len(rows)==4*args.trials
            case={'vertices':n+3,'pair_universe':n,'kind':kind,'baseline':'failure_tree' if fault else baseline}
            for row in rows:out.write(json.dumps({**case,**row})+'\n')
            out.flush()
            result={**case,'cpu':summarize(rows,metric='cpu_ns_per_op'),
                    'wall':summarize(rows,metric='ns_per_op')}
            summaries.append(result)
            print(case,'CPU',round(result['cpu']['reduction_pct'],2),flush=True)
    files=[ROOT/'bench/theory_paths.c',Path(__file__).resolve(),ROOT/'scripts/screen_theory_transfer.py',
           ROOT/'scripts/compare.py',SISTER/'scripts/exclusion_circuit.py',
           SISTER/'scripts/paired_exclusion_circuit.py',binary,raw,*plans.values()]
    info={'status':'PASS','scope':'exploratory warm complete synthetic path solves; no FLINT or application deployment claim',
          'platform':platform.platform(),'compile':command,
          'compiler':subprocess.check_output(['clang','--version'],text=True),
          'checks':checks,'counts':counts,'summaries':summaries,
          'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    (dest/'summary.json').write_text(json.dumps(info,indent=2)+'\n')


if __name__=='__main__':main()
