#!/usr/bin/env python3
"""One fixed confirmation of every construction comparison and control."""
import json
import random
import subprocess
import sys
from theta_replay import ROOT,OUT,verify,key,sha,save,summarize
DEST=OUT/'confirmation'
def prepare():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    plan['comparisons']=[c for c in plan['comparisons'] if c['group'] in ('construction','same_control')]
    random.Random(810013).shuffle(plan['comparisons']);plan['trials']=31
    plan['protocol']='31 ABBA/BAAB quartets; otherwise initial protocol unchanged. Every construction comparison and control repeated once; no selection or code changes.'
    for p in [ROOT/'scripts/confirm_theta_replay.py',*[OUT/f for f in ('plan.json','raw.jsonl','summary.json','audit.json')]]:plan['sha256'][str(p)]=sha(p)
    DEST.mkdir(exist_ok=False);save(DEST/'plan.json',plan);verify(plan)
def measure():
    plan=json.loads((DEST/'plan.json').read_text());verify(plan)
    with (DEST/'raw.jsonl').open('x') as f:
        for i,c in enumerate(plan['comparisons']):
            path=OUT/('-'.join(map(str,key(c['case'])))+'.arb')
            cmd=[OUT/'replay','measure',path,c['base'],c['base_mode'],c['candidate'],c['candidate_mode'],plan['trials']]
            rows=[json.loads(x) for x in subprocess.check_output(list(map(str,cmd)),text=True,timeout=180).splitlines()]
            assert len(rows)==4*plan['trials'];f.write(json.dumps(dict(**c,rows=rows))+'\n');f.flush()
            print(i+1,'/',len(plan['comparisons']),c['group'],key(c['case']),flush=True)
    verify(plan)
def analyze():
    plan=json.loads((DEST/'plan.json').read_text());verify(plan)
    raw=[json.loads(x) for x in (DEST/'raw.jsonl').read_text().splitlines()]
    assert [{k:v for k,v in r.items() if k!='rows'} for r in raw]==plan['comparisons']
    rows=[dict(**{k:v for k,v in r.items() if k!='rows'},cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in raw]
    save(DEST/'summary.json',dict(results=rows,raw_sha256=sha(DEST/'raw.jsonl')))
    for r in rows:print(r['group'],key(r['case']),r['base'],r['candidate'],round(r['cpu']['reduction_pct'],3),[round(r['cpu'][k],3) for k in ('ci95_low_pct','ci95_high_pct')], 'wall', [round(r['wall'][k],3) for k in ('ci95_low_pct','ci95_high_pct')])
    save(DEST/'audit.json',dict(status='PASS',fingerprints=len(plan['sha256']),timed_batches=len(raw)*plan['trials']*4))
if __name__=='__main__':{'prepare':prepare,'measure':measure,'analyze':analyze}[sys.argv[1]]()
