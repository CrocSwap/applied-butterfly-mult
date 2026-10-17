#!/usr/bin/env python3
"""Final bounded diagnostic for the inactive genus-one control signal."""
import json
from pathlib import Path
import random
import subprocess
import sys
from theta_batch import ROOT, BASE, OUT, BUILD, LEADING, build, command
from qualify_theory_paths_hard import sha, save
from compare import summarize

DEST=OUT/'control-diagnostic'

def prepare():
    DEST.mkdir(exist_ok=False)
    lib=build('unchanged-ql',{'ql_exact':(BASE/'src/acb_theta/ql_exact.c').read_text()})
    libs={'leading':str(LEADING),'retained':str(BUILD/'retained/libflint-experiment.dylib'),'rebuilt':str(lib)}
    comparisons=[]
    for f in (0,1):
        for base,candidate in [('leading','retained'),('retained','leading'),('leading','rebuilt'),('leading','leading')]:
            comparisons.append(dict(case=dict(g=1,prec=128,nb=1,square=0,fixture=f,all=1,trials=63),base=base,candidate=candidate))
    random.Random(113203).shuffle(comparisons)
    frozen=json.loads((OUT/'confirmation/plan.json').read_text())['frozen_sha256'].copy()
    for p in [Path(__file__).resolve(),lib,OUT/'confirmation/plan.json',OUT/'confirmation/summary.json',OUT/'confirmation/raw.jsonl']:
        frozen[str(p)]=sha(p)
    save(DEST/'plan.json',dict(comparisons=comparisons,libraries=libs,frozen_sha256=frozen,
        reason='One inactive genus-one control excluded zero in confirmation. Repeat both fixtures in both library orders, alongside unchanged-source rebuild and same-library controls. This is the final diagnostic, not a loop until controls pass.'))
    print('Prepared eight final control comparisons',flush=True)

def measure():
    p=json.loads((DEST/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    with (DEST/'raw.jsonl').open('x') as out:
        for i,r in enumerate(p['comparisons']):
            cmd=command(r['case'],'measure',p['libraries'][r['base']],p['libraries'][r['candidate']]);cmd[0]=str(OUT/'confirmation/theta-batch-confirm')
            data=subprocess.check_output(cmd,text=True,timeout=120)
            rows=[json.loads(s) for s in data.splitlines()];assert len(rows)==252
            out.write(json.dumps(dict(**r,rows=rows))+'\n');out.flush();print(i+1,'/ 8',flush=True)

def analyze():
    p=json.loads((DEST/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    data=[json.loads(s) for s in (DEST/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in data]==p['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in data]
    save(DEST/'summary.json',dict(results=rows,preserved_hashes=len(p['frozen_sha256']),raw_sha256=sha(DEST/'raw.jsonl')))
    for r in rows:print(r['case']['fixture'],r['base'],r['candidate'],r['cpu'])

if __name__=='__main__':
    assert len(sys.argv)==2 and sys.argv[1] in ('prepare','measure','analyze');globals()[sys.argv[1]]()
