#!/usr/bin/env python3
"""Diagnostic: remove conventional fallbacks to isolate the contraction's domain."""
import sys
sys.dont_write_bytecode=True
import json
from pathlib import Path
import sachs_hypergraph_screen as s

OUT=s.ROOT/'results/sachs-hypergraph-eligible'
OUT.mkdir(exist_ok=False)
s.save(OUT/'plan.json',dict(scope='All original tables, but only observed queries excluding zero, one or two supported labels. Removes the balanced fallback as an explanation of the initial comparison. No new tuning, gate relaxation or timing.',
    sha256={str(p):s.sha(p) for p in [Path(__file__).resolve(),Path(s.__file__),s.OUT/'plan.json',s.OUT/'summary.json',s.TRACE]}))
rows=[]
for tid,t,raw in s.load_trace():
    masks=[P for P,w in t['weights']];union=0
    for P in masks:union|=P
    queries=[q for q in dict.fromkeys(raw) if (union&~q[1]).bit_count()<=2]
    natural=[a for a in range(union.bit_length()) if union>>a&1]
    orders={'natural':natural,'reverse':natural[::-1],
            'incidence':sorted(natural,key=lambda a:(-sum(bool(P>>a&1) for P in masks),a))}
    rr={'memo_balanced':s.direct(masks,queries),'greedy_common_pairs':s.greedy(masks,queries)}
    for name,order in orders.items():
        rr['trie_'+name]=s.trie(masks,queries,order)
        rr['carried_'+name]=s.paired(masks,queries,order,False)
        rr['separate_'+name]=s.paired(masks,queries,order,True)
    best=lambda prefix:min((k for k in rr if prefix(k)),key=lambda k:(rr[k]['additions'],rr[k]['peak_live_computed_values'],k))
    c=best(lambda k:not k.startswith(('carried_','separate_')))
    p=best(lambda k:k.startswith('carried_'));a=best(lambda k:k.startswith('separate_'))
    record=dict(table=tid,node=t['node'],parent_masks=masks,queries=queries,results=rr,best_control=c,best_carried=p,best_ablation=a)
    s.save(OUT/f'table-{tid}.json',record)
    row=dict(table=tid,node=t['node'],unique_queries=len(queries),control=rr[c]['additions'],carried=rr[p]['additions'],ablation=rr[a]['additions'])
    rows.append(row);print(json.dumps(row),flush=True)
s.save(OUT/'summary.json',dict(tables=rows,strict_carried_wins=sum(r['carried']<r['control'] for r in rows),
                              ties=sum(r['carried']==r['control'] for r in rows)))
