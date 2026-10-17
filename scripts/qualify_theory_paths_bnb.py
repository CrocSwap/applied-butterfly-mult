#!/usr/bin/env python3
"""Stronger exact controls for the frozen direct-transfer candidate."""
import hashlib
import json
import os
from pathlib import Path
import random
import subprocess
from compare import summarize

ROOT=Path(__file__).resolve().parents[1]


def main():
    dest=ROOT/'results/theory-paths-bnb';dest.mkdir(exist_ok=False)
    previous=ROOT/'results/theory-paths-confirm'
    for path,digest in json.loads((previous/'summary.json').read_text())['sha256'].items():
        assert hashlib.sha256(Path(path).read_bytes()).hexdigest()==digest
    source=ROOT/'bench/theory_paths_bnb.c';binary=dest/'theory-paths-bnb'
    command=['clang','-std=gnu23','-O3','-g','-mcpu=apple-m2',str(source),'-o',str(binary)]
    subprocess.run(command,check=True)
    def run(n,seed,kind,method,trials,ms):
        folder=previous if n in (8,12,16,20,24) else ROOT/'results/theory-paths-screen'
        plan=folder/f'paired-{n}.bin'
        return subprocess.run([str(binary),str(plan),str(plan),str(kind),str(method),str(trials),str(ms)],
            env={**os.environ,'BF_PATH_SEED':str(seed)},check=True,text=True,capture_output=True)
    checks=[]
    for n in (4,5,6,7,8,16,32,64):
        for kind in range(5):
            for method in (1,2):
                run(n,2700019,kind,method,1,1);checks.append([n,kind,method])
    # Fixed before timing. Old held-out graphs facilitate comparison; a new seed
    # checks that the method was not specialized to the earlier graph instances.
    cases=[(n,seed,method) for n in (8,12,16,20,24)
           for seed in (8100011,9400033,10100039,2700019) for method in (1,2)]
    (dest/'plan.json').write_text(json.dumps({'cases':cases,'kind':1,'quartets':15,'batch_ms':3,
        'budget':'4*N*N search nodes, then exact failure-tree fallback',
        'method_1':'best relaxed successor first, others in vertex order',
        'method_2':'eligible successors ordered by relaxed continuation bound'},indent=2)+'\n')
    random.Random(4100029).shuffle(cases);summaries=[]
    raw=dest/'raw.jsonl'
    with raw.open('w') as out:
        for n,seed,method in cases:
            result=run(n,seed,1,method,15,3)
            rows=[json.loads(line) for line in result.stdout.splitlines()];assert len(rows)==60
            case={'vertices':n+3,'seed':seed,'baseline':f'bnb_{method}'}
            for row in rows:out.write(json.dumps({**case,**row})+'\n')
            out.flush()
            r={**case,'cpu':summarize(rows,metric='cpu_ns_per_op'),'wall':summarize(rows,metric='ns_per_op')}
            summaries.append(r)
            print(case,round(r['cpu']['reduction_pct'],2),flush=True)
    files=[source,ROOT/'bench/theory_paths_control.c',Path(__file__).resolve(),binary,raw,dest/'plan.json',previous/'summary.json']
    report={'status':'PASS','checks':checks,'summaries':summaries,'compile':command,
        'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files},
        'scope':'Exact full optimum/count solves including bound preparation and search; warm circuits'}
    (dest/'summary.json').write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':main()
