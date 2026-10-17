#!/usr/bin/env python3
"""Adaptive stronger conventional control for all uncovered basis frontier points."""
import sys
sys.dont_write_bytecode=True
import argparse
from collections import Counter
from functools import reduce
import gzip
import hashlib
from itertools import combinations
import json
from operator import xor
from pathlib import Path
import erasure_basis_screen as screen

def key(expr):return (len(expr),sum(x<0 for x in expr),tuple(sorted(expr)))

def short_recipes(vals, retained, recipes):
    bank=sorted(retained)+sorted(a for a in vals if a<0)
    pairs={}
    for a,b in combinations(bank,2):
        v=vals[a]^vals[b];expr=frozenset([a,b])
        if v not in pairs or key(expr)<key(pairs[v]):pairs[v]=expr
    new={}; sizes=Counter()
    for target,original in recipes.items():
        best=original
        for a in bank:
            pair=pairs.get(vals[target]^vals[a])
            if pair is not None:
                expr=pair ^ {a}
                if key(expr)<key(best):best=expr
        for v,left in pairs.items():
            right=pairs.get(vals[target]^v)
            if right is not None:
                expr=left ^ right
                if key(expr)<key(best):best=expr
        assert reduce(xor,(vals[a] for a in best),0)==vals[target]
        new[target]=best
        if best!=original:sizes[len(best)]+=1
    return new,dict(sizes)

def validate(dag,outputs,n,expected,score):
    # Replay literal physical operations, including arbitrary dirty buffer
    # values as extra symbolic input bits. Uninitialized reads cannot cancel
    # unnoticed unless the program really is independent of those values.
    memory=[1<<(n+i) for i in range(score['slots'])]
    for t,args in score['physical']:
        memory[t]=reduce(xor,((1<<(-a-1)) if a<0 else memory[a] for a in args),0)
    assert memory[:len(outputs)]==expected
    remaining=Counter(a for aa in dag.values() for a in aa if a>=0)
    live=set(); peak=len(outputs);final=set(outputs)
    for t,aa in dag.items():
        for a in aa:
            if a>=0:
                assert a in live
                remaining[a]-=1
                if not remaining[a] and a not in final:live.remove(a)
        live.add(t);peak=max(peak,len(live))
    assert live==final and peak==score['slots']

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--out',required=True);a=ap.parse_args()
    out=Path(a.out);out.mkdir(parents=True,exist_ok=False)
    parent=screen.ROOT/'results/erasure-basis-screen'
    summary=json.loads((parent/'summary.json').read_text())
    selected=summary['basis_frontier_points_not_covered_by_ordinary']
    source={(r['op'],r['variant']):r for r in map(json.loads,screen.SOURCE.read_text().splitlines()) if r['k']==10}
    plan=dict(scope='All basis frontier points uncovered by initial ordinary controls; add ordinary three/four-array identities at identical retention sets and cuts. Adaptive follow-up, not part of initial frozen grid.',
              parent_summary_sha256=hashlib.sha256((parent/'summary.json').read_bytes()).hexdigest(),
              script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              screen_script_sha256=hashlib.sha256(Path(screen.__file__).read_bytes()).hexdigest(),
              selected_ids=[r['id'] for r in selected],technique='Pair hash table; one+pair and pair+pair lookup; no general linear basis solve',
              choice='Retain old rematerialization/one-two identity options and prefer shorter recipes, then fewer input reads; keep previous ordinary frontier as competitors')
    (out/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
    records=[];allchanges=Counter()
    with gzip.open(out/'programs.jsonl.gz','wt') as f:
        for i,c in enumerate(selected):
            r=source[(c['op'],c['schedule'])]
            dag,outputs=screen.source_dag(r);vals=screen.values(dag,r['inputs'])
            live,mandatory,_,_=screen.at_cut(dag,outputs,c['cut'])
            retained=set(c['retained']); assert mandatory<=retained<=live
            recipes=screen.reconstruct(dag,vals,live,retained,'sparse')
            recipes,changes=short_recipes(vals,retained,recipes);allchanges.update(changes)
            nd=screen.rewrite(dag,outputs,c['cut'],recipes)
            m=screen.metrics(nd,outputs,True)
            expected=[vals[o] for o in outputs]
            validate(nd,outputs,r['inputs'],expected,m)
            f.write(json.dumps(dict(id=i,candidate_id=c['id'],inputs=r['inputs'],outputs=outputs,expected=expected,dag=[[t,sorted(aa)] for t,aa in nd.items()],physical=m.pop('physical')))+'\n')
            records.append(dict(id=i,candidate_id=c['id'],op=c['op'],schedule=c['schedule'],cut=c['cut'],changes=changes,**m))
            if (i+1)%20==0:print(json.dumps(dict(completed=i+1,total=len(selected))),flush=True)
    survivors=[];covered=[]
    for c in selected:
        competitors=summary['ordinary_frontiers'][c['op']]+[r for r in records if r['op']==c['op']]
        cover=next((r for r in competitors if screen.dominates(r,c)),None)
        if cover is None:survivors.append(c)
        else:covered.append(dict(candidate_id=c['id'],control=cover))
    result=dict(controls=len(records),coefficient_equalities=len(records)*80*32,
                physical_and_liveness_checks='PASS',recipe_changes_by_size=dict(allchanges),
                covered=len(covered),surviving_basis_points=survivors,coverage=covered,rows=records)
    (out/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(dict(controls=len(records),covered=len(covered),survivors=len(survivors))),flush=True)

if __name__=='__main__':main()
