#!/usr/bin/env python3
"""Bounded single-cut live-basis retention screen, with conventional controls.

All payloads are exact GF(2) linear forms. An instruction is a fused elementwise
XOR into an array, permitting its destination to alias a consumed source.
No hardware timing, frame constraint, or dirty-restoration requirement is imposed.
"""
import argparse
from collections import Counter
from functools import reduce
import gzip
import hashlib
import json
from operator import xor
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'results/joint-workload-survey/programs.jsonl'
ORDERS = ('uses', 'next', 'weight', 'recent')

def parity(items):
    out = set()
    for x in items:
        if x in out: out.remove(x)
        else: out.add(x)
    return frozenset(out)

def source_dag(row):
    ids = {f'C{i}': -i-1 for i in range(row['inputs'])}
    dag = {}
    for t, args in row['program']:
        args = parity(ids[a] for a in args)
        idx = len(dag)
        dag[idx] = args
        ids[t] = idx
    outputs = [ids[f'V{i}'] for i in range(row['outputs'])]
    return dag, outputs

def values(dag, n):
    vals = {-i-1: 1 << i for i in range(n)}
    for t, args in dag.items():
        assert all(a < t for a in args)
        vals[t] = reduce(xor, (vals[a] for a in args), 0)
    return vals

def prune(dag, outputs):
    needed = set(outputs)
    for t in reversed(dag):
        if t in needed: needed.update(a for a in dag[t] if a >= 0)
    return {t: args for t,args in dag.items() if t in needed}

def metrics(dag, outputs, serialize=False):
    # Backward interval coloring. Required output buffers are precolored;
    # their slots become available before their final definitions. This permits
    # use of not-yet-produced output arrays as scratch, without final copies.
    live = {t:i for i,t in enumerate(outputs)}
    assert len(live) == len(outputs)
    free = set()
    allocated = len(outputs)
    assigned = {}
    physical = []
    for t,args in reversed(list(dag.items())):
        assert t in live
        target = live.pop(t)
        assigned[t] = target
        free.add(target)
        for a in sorted(args):
            if a >= 0 and a not in live:
                if free:
                    slot = min(free); free.remove(slot)
                else:
                    slot = allocated; allocated += 1
                live[a] = slot
        physical.append((target, [a if a < 0 else live[a] for a in sorted(args)]))
    assert not live
    score = dict(xors=sum(max(0,len(a)-1) for a in dag.values()),
                 accesses=sum(len(a)+1 for a in dag.values()),
                 input_reads=sum(a<0 for args in dag.values() for a in args),
                 copies=sum(len(a)==1 for a in dag.values()),
                 zero_writes=sum(not a for a in dag.values()),
                 statements=len(dag), slots=allocated,
                 scratch=allocated-len(outputs))
    if serialize: score['physical'] = list(reversed(physical))
    return score

class Basis:
    def __init__(self): self.pivots = {}
    def reduce(self, v):
        combo = set()
        while v:
            pivot = v.bit_length()-1
            if pivot not in self.pivots: break
            u, expr = self.pivots[pivot]
            v ^= u; combo.symmetric_difference_update(expr)
        return v, frozenset(combo)
    def add(self, v, name):
        residual, combo = self.reduce(v)
        if not residual: return False
        self.pivots[residual.bit_length()-1] = (residual, combo ^ {name})
        return True
    def solve(self,v):
        residual, combo = self.reduce(v)
        return None if residual else combo

def at_cut(dag, outputs, cut):
    counts = Counter(a for t,args in dag.items() if t >= cut for a in args if 0 <= a < cut)
    mandatory = set(t for t in outputs if t < cut)
    live = set(counts) | mandatory
    next_use = {a:min(t for t,args in dag.items() if t>=cut and a in args)
                for a in counts}
    return live, mandatory, counts, next_use

def priority(names, order, vals, counts, next_use):
    if order == 'uses': key=lambda a:(-counts[a],next_use.get(a,10**9),a)
    elif order == 'next': key=lambda a:(next_use.get(a,10**9),-counts[a],a)
    elif order == 'weight': key=lambda a:(-vals[a].bit_count()*counts[a],a)
    else: key=lambda a:(-a,)
    return sorted(names, key=key)

def reconstruct(dag, vals, live, retained, mode):
    dropped = live-retained
    memo = {}
    def remat(a):
        if a < 0 or a in retained: return frozenset([a])
        if a not in memo:
            memo[a] = parity(z for b in dag[a] for z in remat(b))
        return memo[a]
    # Original-DAG rematerialization may re-read any immutable input.
    recipes = {a:remat(a) for a in dropped}
    if mode == 'remat': return recipes
    bank = sorted(retained) + sorted(a for a in vals if a < 0)
    reverse = {}
    for a in bank: reverse.setdefault(vals[a],a)
    def prefer(expr, old): return (len(expr),sum(a<0 for a in expr),tuple(sorted(expr))) < (len(old),sum(a<0 for a in old),tuple(sorted(old)))
    for a in dropped:
        if vals[a] in reverse:
            expr=frozenset([reverse[vals[a]]])
            if prefer(expr,recipes[a]): recipes[a]=expr
        for b in bank:
            c=reverse.get(vals[a]^vals[b])
            if c is not None:
                expr=parity([b,c])
                if prefer(expr,recipes[a]): recipes[a]=expr
    if mode == 'sparse': return recipes
    # General basis solves: retained arrays first, then immutable inputs.
    # Two deterministic pivot orders avoid relying on one arbitrary basis.
    for order in (bank, list(reversed(sorted(retained)))+sorted(a for a in vals if a<0)):
        basis=Basis()
        for b in order: basis.add(vals[b],b)
        for a in dropped:
            expr=basis.solve(vals[a]); assert expr is not None
            if prefer(expr,recipes[a]): recipes[a]=expr
    return recipes

def rewrite(dag, outputs, cut, recipes):
    updated={}
    for t,args in dag.items():
        updated[t]=args if t<cut else parity(z for a in args for z in recipes.get(a,(a,)))
    return prune(updated,outputs)

def dominates(a,b,strict=False):
    keys=('scratch','xors','accesses','copies','input_reads','zero_writes')
    return all(a[k]<=b[k] for k in keys) and (not strict or any(a[k]<b[k] for k in keys))

def checks():
    # Independent-row retention can replace a costly original definition.
    # a=x+y, b=x+z, c=y+z; c=a+b. Later consumers need all three.
    d={0:frozenset([-1,-2]),1:frozenset([-1,-3]),2:frozenset([-2,-3]),
       3:frozenset([0,-4]),4:frozenset([1,-4]),5:frozenset([2,-4])}
    v=values(d,4); b=Basis()
    assert b.add(v[0],0) and b.add(v[1],1) and not b.add(v[2],2)
    assert b.solve(v[2])==frozenset([0,1])
    # Full rank solve beyond pair search, to ensure this ablation is active.
    b=Basis()
    for i in range(4): assert b.add(1<<i,i)
    assert b.solve(15)==frozenset(range(4))
    # Allocator output placement, last-read aliasing and copies.
    for outputs in ([3,4,5],[5,4,3]):
        for cut in range(1,6):
            live,mandatory,_,_=at_cut(d,outputs,cut)
            for mode in ('remat','sparse','basis'):
                rec=reconstruct(d,v,live,mandatory,mode)
                nd=rewrite(d,outputs,cut,rec)
                nv=values(nd,4)
                assert all(nv[o]==v[o] for o in outputs)
                score=metrics(nd,outputs,True)
                slots=[None]*score['slots']
                for target,args in score['physical']:
                    z=reduce(xor,((1<<(-a-1)) if a<0 else slots[a] for a in args),0)
                    slots[target]=z
                assert slots[:len(outputs)]==[v[o] for o in outputs]
    return dict(status='PASS',small_rewrite_allocator_cases=30,basis_positive_controls=2)

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--out',required=True); args=ap.parse_args()
    out=Path(args.out); out.mkdir(parents=True,exist_ok=False)
    selected=[r for r in map(json.loads,SOURCE.read_text().splitlines()) if r['k']==10 and r['variant'] in ('fused','scheduled')]
    validation=checks(); (out/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
    plan=dict(source=str(SOURCE),source_sha256=hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
              script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              cases=['10+4 encode','10+4 decode'],schedules=['fused','scheduled'],
              cuts='Every internal instruction boundary',priorities=list(ORDERS),
              retention='Greedy independent live values after mandatory outputs; ordinary top-q with same q and q=0, floor(m/4), floor(m/2), floor(3m/4), m',
              modes=['original-DAG rematerialization','same plus one/two-array identities','same plus general GF(2) basis reconstruction'],
              gate='Not weakly dominated by any ordinary candidate; dominates matched sparse ablation strictly; versus original scheduled program at least 10% less scratch OR 5% fewer XORs OR 5% fewer accesses, with no increase in all six charged resources.',
              scope='Single cut, existing retained rows, fixed suffix order, fused reconstruction; no global optimality or novelty claim')
    (out/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
    allrows=[]; frontiers={}; matched={}; serial=0; correctness=0
    with gzip.open(out/'programs.jsonl.gz','wt') as programs, (out/'rows.jsonl').open('w') as rows:
        def emit(r,dag,outputs,original_vals,spec):
            nonlocal serial,correctness
            vals=values(dag,r['inputs'])
            assert all(vals[o]==original_vals[o] for o in outputs)
            correctness+=r['inputs']*len(outputs)
            score=metrics(dag,outputs)
            rec=dict(id=serial,op=r['op'],schedule=r['variant'],**spec,**score)
            serial+=1; allrows.append(rec)
            rows.write(json.dumps(rec)+'\n')
            programs.write(json.dumps(dict(id=rec['id'],inputs=r['inputs'],outputs=outputs,
                expected=[original_vals[o] for o in outputs],dag=[[t,sorted(a)] for t,a in dag.items()]))+'\n')
            key=(r['op'],'candidate' if spec['mode']=='basis' else 'ordinary')
            frontier=frontiers.setdefault(key,[])
            if not any(dominates(x,rec) for x in frontier):
                frontiers[key]=[x for x in frontier if not dominates(rec,x)]+[rec]
            return rec
        for r in selected:
            dag,outputs=source_dag(r); vals=values(dag,r['inputs'])
            assert [vals[o] for o in outputs]==[sum(1<<i for i in row) for row in r['matrix']]
            emit(r,dag,outputs,vals,dict(mode='original',cut=None,retention='all',priority=None,retained=None))
            for cut in range(1,len(dag)):
                live,mandatory,counts,next_use=at_cut(dag,outputs,cut)
                optional=live-mandatory
                if not optional: continue
                # Cache repeated subsets at this cut. Matched ablations use
                # exactly the same retained set, even when selected by rank.
                subsets={}
                for order in ORDERS:
                    sorted_live=priority(optional,order,vals,counts,next_use)
                    basis=Basis()
                    for a in sorted(mandatory): basis.add(vals[a],a)
                    keep=set(mandatory)
                    for a in sorted_live:
                        if basis.add(vals[a],a): keep.add(a)
                    subsets.setdefault(frozenset(keep),('independent',order))
                    q=len(keep-mandatory)
                    for count in sorted({0,len(optional)//4,len(optional)//2,3*len(optional)//4,q,len(optional)}):
                        retained=frozenset(mandatory|set(sorted_live[:count]))
                        subsets.setdefault(retained,('top-q',order))
                for retained,(kind,order) in subsets.items():
                    if retained==live: continue
                    ids={}
                    for mode in ('remat','sparse','basis'):
                        recipes=reconstruct(dag,vals,live,set(retained),mode)
                        nd=rewrite(dag,outputs,cut,recipes)
                        rec=emit(r,nd,outputs,vals,dict(mode=mode,cut=cut,retention=kind,priority=order,retained=sorted(retained),dropped=len(live-retained)))
                        ids[mode]=rec['id']
                    matched[ids['basis']]=ids['sparse']
                if cut%40==0:
                    print(json.dumps(dict(op=r['op'],schedule=r['variant'],cut=cut,programs=serial)),flush=True)
    bases={r['op']:r for r in allrows if r['mode']=='original' and r['schedule']=='scheduled'}
    qualified=[]; unique=[]
    for op in bases:
        ordinary=frontiers[(op,'ordinary')]
        for c in frontiers[(op,'candidate')]:
            if any(dominates(b,c) for b in ordinary): continue
            unique.append(c)
            b=bases[op]; ablation=allrows[matched[c['id']]]
            gain=c['scratch']*10<=b['scratch']*9 or c['xors']*20<=b['xors']*19 or c['accesses']*20<=b['accesses']*19
            if dominates(c,b) and dominates(c,ablation,True) and gain: qualified.append(c)
    summary=dict(programs=serial,coefficient_equalities=correctness,qualified=qualified,
                 basis_frontier_points_not_covered_by_ordinary=unique,
                 ordinary_frontiers={op:frontiers[(op,'ordinary')] for op in bases},
                 candidate_frontiers={op:frontiers[(op,'candidate')] for op in bases},
                 original_scheduled=bases)
    (out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    print(json.dumps(dict(programs=serial,coefficient_equalities=correctness,qualified=len(qualified),unique_basis_points=len(unique))),flush=True)

if __name__=='__main__': main()
