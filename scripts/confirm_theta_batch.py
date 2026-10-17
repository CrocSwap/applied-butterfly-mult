#!/usr/bin/env python3
"""Confirm complete 512-bit slice after a noisy same-function screen control."""
import json
from pathlib import Path
import random
import subprocess
import sys
from theta_batch import ROOT, OUT, FLAGS, INCLUDES, LIBS, ORIGINAL, command, run
from qualify_theory_paths_hard import sha, save
from compare import summarize

DEST=OUT/'confirmation'

def prepare():
    DEST.mkdir(exist_ok=False)
    # Change only timing durations; preserve fixtures, arithmetic, and comparisons.
    source=(ROOT/'bench/theta_batch.c').read_text()
    assert source.count('<20000000')==1 and source.count('>=5000000')==1
    source=source.replace('<20000000','<200000000').replace('>=5000000','>=20000000')
    file=DEST/'theta-batch-confirm.c';file.write_text(source)
    run(['clang',*FLAGS,*INCLUDES,str(file),str(ORIGINAL),*LIBS,'-o',str(DEST/'theta-batch-confirm')],DEST/'compile.log')
    old=json.loads((OUT/'retained/plan.json').read_text())
    comparisons=[]
    for r in old['comparisons']:
        if r['case']['prec']==512 or r['case']['g']==1:
            c=dict(r['case'],trials=63 if r['case'].get('same') or r['case']['g']==1 else 31)
            comparisons.append(dict(r,case=c))
    random.Random(993053).shuffle(comparisons)
    frozen=old['frozen_sha256'].copy()
    for p in [Path(__file__).resolve(),file,DEST/'theta-batch-confirm',OUT/'retained/plan.json',OUT/'retained/summary.json',OUT/'retained/raw.jsonl',ROOT/'bench/theta_batch_precision_check.c',OUT/'retained/precision-check.json']:
        frozen[str(p)]=sha(p)
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    save(DEST/'plan.json',dict(comparisons=comparisons,libraries=old['libraries'],frozen_sha256=frozen,
        protocol='Entire 512-bit slice, including ablations; 31 ABBA/BAAB quartets for active cases, 63 for controls; 200ms warmup; 20ms equal-repetition calibration.'))
    print('Prepared',len(comparisons),'confirmation comparisons',flush=True)

def measure():
    p=json.loads((DEST/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    with (DEST/'raw.jsonl').open('x') as out:
        for i,r in enumerate(p['comparisons']):
            cmd=command(r['case'],'measure',p['libraries'][r['base']],p['libraries'][r['candidate']]);cmd[0]=str(DEST/'theta-batch-confirm')
            data=subprocess.check_output(cmd,text=True,timeout=240)
            rows=[json.loads(s) for s in data.splitlines()];assert len(rows)==4*r['case']['trials']
            out.write(json.dumps(dict(**r,rows=rows))+'\n');out.flush();print(i+1,'/',len(p['comparisons']),flush=True)

def analyze():
    p=json.loads((DEST/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    data=[json.loads(s) for s in (DEST/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in data]==p['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in data]
    save(DEST/'summary.json',dict(results=rows,preserved_hashes=len(p['frozen_sha256']),raw_sha256=sha(DEST/'raw.jsonl')))
    print('Analyzed',len(rows),'confirmation comparisons',flush=True)

if __name__=='__main__':
    assert len(sys.argv)==2 and sys.argv[1] in ('prepare','measure','analyze');globals()[sys.argv[1]]()
