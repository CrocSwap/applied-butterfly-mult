#!/usr/bin/env python3
"""Record the remaining mechanism attribution and illustrative resource points."""
import sys
sys.dont_write_bytecode=True
from collections import Counter
import json
from pathlib import Path
import erasure_basis_screen as s

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'results/erasure-basis-short-controls'
initial=json.loads((ROOT/'results/erasure-basis-screen/summary.json').read_text())
follow=json.loads((OUT/'summary.json').read_text())
source={(r['op'],r['variant']):r for r in map(json.loads,s.SOURCE.read_text().splitlines()) if r['k']==10}
details=[]; sizes=Counter()
for c in follow['surviving_basis_points']:
    r=source[(c['op'],c['schedule'])]
    dag,outputs=s.source_dag(r);vals=s.values(dag,r['inputs'])
    live,mandatory,_,_=s.at_cut(dag,outputs,c['cut'])
    retained=set(c['retained'])
    short=s.reconstruct(dag,vals,live,retained,'sparse')
    general=s.reconstruct(dag,vals,live,retained,'basis')
    changed=[]
    for t in short:
        if short[t]!=general[t]:
            changed.append(dict(target=t,old=sorted(short[t]),new=sorted(general[t])))
            sizes[len(general[t])]+=1
    details.append(dict(candidate_id=c['id'],op=c['op'],retention=c['retention'],
                        all_changed_recipes_at_most_four=all(len(x['new'])<=4 for x in changed),
                        changes=changed))
table=[]
for op,budget in [('encode',8),('decode',32)]:
    old=[r for r in initial['ordinary_frontiers'][op] if r['scratch']<=budget]
    new=old+[r for r in follow['rows'] if r['op']==op and r['scratch']<=budget]
    cand=[r for r in initial['candidate_frontiers'][op] if r['scratch']<=budget]
    choose=lambda rs:min(rs,key=lambda r:(r['xors'],r['accesses'],r['input_reads'],r['scratch']))
    c=choose(cand)
    matched=next(r for r in follow['rows'] if r['candidate_id']==c['id'])
    table.append(dict(op=op,budget=budget,initial_control=choose(old),stronger_control=choose(new),basis=c,
                      matched_four_term_rewrite=matched))
receipt=dict(survivors=len(details),all_changes_short=sum(x['all_changed_recipes_at_most_four'] for x in details),
             long_change_cases=sum(not x['all_changed_recipes_at_most_four'] for x in details),
             changed_recipe_lengths=dict(sizes),retention_counts=dict(Counter(x['retention'] for x in details)),
             caveat='Short identity expressibility is a certificate about available rewrites, not proof that an independently optimized short-identity solver automatically selects the same program. No novel-identity or practical speedup claim.',
             illustrative_points=table,details=details)
with (OUT/'mechanism.json').open('x') as f:json.dump(receipt,f,indent=2);f.write('\n')
print(json.dumps({k:v for k,v in receipt.items() if k not in ('details','illustrative_points')},indent=2))
