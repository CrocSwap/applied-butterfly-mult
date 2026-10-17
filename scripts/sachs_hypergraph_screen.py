#!/usr/bin/env python3
"""Positive hypergraph contraction on frozen real Bayesian query supports.

Static arithmetic graphs only: no speedup, floating-point accuracy or online
availability claim. Full retained sums give every circuit the same linear map.
"""
import sys
sys.dont_write_bytecode=True
from collections import Counter, defaultdict
import hashlib
import itertools
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SISTER=ROOT.parent/'integerMult'
sys.path.insert(0,str(SISTER/'scripts'))
from exclusion_circuit import ExclusionCircuit
from paired_exclusion_circuit import PairedExclusionCircuit
OUT=ROOT/'results/sachs-hypergraph-screen'
TRACE=ROOT/'results/encrypted-probability-survey/runs/sachs1k-p2/trace/queries.tsv'

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):
    with p.open('x') as f:json.dump(x,f,indent=2);f.write('\n')
def omissions(n,q):
    return [sum(1<<j for j in p) for r in range(min(q,n)+1) for p in itertools.combinations(range(n),r)]

class Graph(ExclusionCircuit):
    # Reuse the actual sister's positive addition interning and vector routines.
    def __init__(self,m):
        self.support=[0]+[1<<i for i in range(m)]
        self.args=[None]*(m+1)
        self.lookup={v:i for i,v in enumerate(self.support)}
        self.m=m
        self.contract_calls=0;self.entry_visits=0
    def subset(self,mask):
        return self.total([i+1 for i in range(self.m) if mask>>i&1])
    def finish(self,outputs,expected):
        assert len(outputs)==len(expected)
        for v,want in zip(outputs,expected):assert self.support[v]==want
        active=set();stack=list(outputs)
        while stack:
            v=stack.pop()
            if not v or v in active:continue
            active.add(v)
            if self.args[v]:stack.extend(self.args[v])
        uses=Counter(outputs)
        for v in active:
            if self.args[v]:uses.update(self.args[v])
        live=set();peak=0;depth=[0]*len(self.args)
        for v in sorted(active):
            if not self.args[v]:continue
            a,b=self.args[v]
            assert a<v and b<v and not self.support[a]&self.support[b]
            assert self.support[v]==self.support[a]|self.support[b]
            depth[v]=1+max(depth[a],depth[b]);live.add(v);peak=max(peak,len(live))
            for x in (a,b):
                uses[x]-=1
                if uses[x]==0:live.discard(x)
        adds=sum(self.args[v] is not None for v in active)
        return dict(additions=adds,scalar_reads=2*adds,scalar_writes=adds,
                    peak_live_computed_values=peak,depth=max((depth[v] for v in outputs),default=0),
                    output_cache_values=len(set(outputs)-{0}),
                    generated_additions=len(self.args)-self.m-1,
                    contraction_calls=self.contract_calls,contraction_entry_visits=self.entry_visits,
                    inputs=self.m,nodes=[[v,*self.args[v]] for v in sorted(active) if self.args[v]],
                    outputs=outputs,output_supports=expected)

def contract(g,n,entries,q,split=False):
    """All omissions of <=q vertices, with hyperedge weights carried together.

    Pairs project a hyperedge to the set of groups it meets. A forbidden pair
    in different groups has four disjoint regions: neither boundary group,
    left only, right only, and both. Strip recursion handles the first two
    one-boundary regions; the last is summed directly.
    """
    g.contract_calls+=1;g.entry_visits+=len(entries)
    keys=omissions(n,q)
    if not entries:return dict.fromkeys(keys,0)
    if q==0:return {0:g.total(list(entries.values()))}
    if n<=4:
        return {F:g.total([v for P,v in entries.items() if not P&F]) for F in keys}
    if split and any(P.bit_count()==1 for P in entries):
        singles=[entries.get(1<<a,0) for a in range(n)]
        total,one,two=g.vector(singles,two=q==2)
        low={0:total,**{1<<a:one[a] for a in range(n)}}
        if q==2:low.update({(1<<a)|(1<<b):v for (a,b),v in two.items()})
        high=contract(g,n,{P:v for P,v in entries.items() if P.bit_count()!=1},q,split)
        return {F:g.add(high[F],low[F]) for F in keys}
    ng=(n+1)//2
    groups=[sum(1<<a for a in range(2*i,min(2*i+2,n))) for i in range(ng)]
    def project(P):return sum(1<<i for i,G in enumerate(groups) if P&G)
    buckets=defaultdict(list)
    for P,v in entries.items():buckets[project(P)].append(v)
    coarse=contract(g,ng,{P:g.total(vs) for P,vs in sorted(buckets.items())},q,split)
    strips={}
    for a in range(n):
        i=a//2;survivor=groups[i]^(1<<a)
        sb=defaultdict(list)
        if survivor:
            for P,v in entries.items():
                g.entry_visits+=1
                if P&groups[i]==survivor:
                    projected=project(P)&~(1<<i)
                    # Remove the absent group from the child's address universe.
                    projected=(projected&((1<<i)-1))|((projected>>(i+1))<<i)
                    sb[projected].append(v)
        strips[a]=contract(g,ng-1,{P:g.total(vs) for P,vs in sorted(sb.items())},q-1,split)
    out={0:coarse[0]}
    for a in range(n):out[1<<a]=g.add(coarse[1<<(a//2)],strips[a][0])
    if q==2:
        for a,b in itertools.combinations(range(n),2):
            i,j=a//2,b//2;F=(1<<a)|(1<<b)
            if i==j:out[F]=coarse[1<<i];continue
            ga,gb=groups[i],groups[j];sa,sb=ga^(1<<a),gb^(1<<b)
            cross=[]
            if sa and sb:
                for P,v in entries.items():
                    g.entry_visits+=1
                    if P&ga==sa and P&gb==sb:cross.append(v)
            # a<b guarantees i<j for cross-group exclusions.
            out[F]=g.total([coarse[(1<<i)|(1<<j)],strips[a][1<<(j-1)],
                            strips[b][1<<i],g.total(cross)])
    return out

def load_trace():
    tables={};queries=defaultdict(list)
    for line in TRACE.read_text().splitlines():
        f=line.split('\t')
        if f[0]=='T':tables[int(f[1])]=dict(node=int(f[2]),weights=[])
        elif f[0]=='W':tables[int(f[1])]['weights'].append((int(f[2]),float(f[3])))
        else:queries[int(f[1])].append(tuple(map(int,f[2:4])))
    return [(tid,t,queries[tid]) for tid,t in tables.items() if t['weights']]
def targets(masks,queries):
    return [sum(1<<i for i,P in enumerate(masks) if not P&~U and (not L or P&L)) for L,U in queries]
def relabel(P,order):return sum(1<<i for i,a in enumerate(order) if P>>a&1)

def paired(masks,queries,order,split):
    g=Graph(len(masks));n=len(order);rm=[relabel(P,order) for P in masks]
    support=(1<<n)-1; grouped=defaultdict(list);outs={}
    for qi,(L,U) in enumerate(queries):
        F=support^relabel(U,order)
        if F.bit_count()<=2:grouped[L].append((qi,F))
    for L,qs in grouped.items():
        entries={P:i+1 for i,P in enumerate(rm) if not L or masks[i]&L}
        batch=contract(g,n,entries,2,split)
        for qi,F in qs:outs[qi]=batch[F]
    expected=targets(masks,queries)
    output=[outs[i] if i in outs else g.subset(t) for i,t in enumerate(expected)]
    return g.finish(output,expected)

def direct(masks,queries):
    g=Graph(len(masks));ts=targets(masks,queries)
    return g.finish([g.subset(t) for t in ts],ts)

def trie(masks,queries,order):
    g=Graph(len(masks));ts=targets(masks,queries)
    def tree(ids,pos):
        support=sum(1<<i for i in ids)
        if len(ids)<=1:return (support,None,None)
        while pos<len(order):
            bit=1<<order[pos];a=[i for i in ids if not masks[i]&bit];b=[i for i in ids if masks[i]&bit]
            pos+=1
            if a and b:return (support,tree(a,pos),tree(b,pos))
        raise AssertionError('duplicate parent set')
    root=tree(list(range(len(masks))),0)
    cache={}
    def full(node):
        S,a,b=node
        if S not in cache:cache[S]=g.subset(S) if a is None else g.add(full(a),full(b))
        return cache[S]
    def visit(node,want):
        S,a,b=node;hit=S&want
        if not hit:return 0
        if hit==S:return full(node)
        return g.add(visit(a,want),visit(b,want))
    return g.finish([visit(root,t) for t in ts],ts)

def greedy(masks,queries):
    g=Graph(len(masks));ts=targets(masks,queries)
    forms={t:set(i+1 for i in range(len(masks)) if t>>i&1) for t in ts}
    while True:
        counts=Counter(p for terms in forms.values() for p in itertools.combinations(sorted(terms),2))
        if not counts:break
        pair,count=min(counts.items(),key=lambda kv:(-kv[1],kv[0]))
        if count<2:break
        a,b=pair;v=g.add(a,b)
        for terms in forms.values():
            if a in terms and b in terms:terms.difference_update(pair);terms.add(v)
    return g.finish([g.total(sorted(forms[t])) for t in ts],ts)

def validate():
    checks=0
    for n in [1,2,3,4,5,6,7,8,10]:
        masks=[P for P in range(1<<n) if P.bit_count()<=min(4,n)]
        for sparse in [False,True]:
            mm=[P for P in masks if not sparse or (P*17+3)%7<3]
            for split in [False,True]:
                for q in [1,2]:
                    g=Graph(len(mm));out=contract(g,n,{P:i+1 for i,P in enumerate(mm)},q,split)
                    want=[sum(1<<i for i,P in enumerate(mm) if not P&F) for F in out]
                    g.finish(list(out.values()),want);checks+=len(want)
    for n in [4,5,6,8,10]:
        masks=[(1<<a)|(1<<b) for a,b in itertools.combinations(range(n),2)]
        old=PairedExclusionCircuit(n);old.verify()
        g=Graph(len(masks));out=contract(g,n,{P:i+1 for i,P in enumerate(masks)},2)
        for (a,b),v in old.outputs.items():
            assert g.support[out[(1<<a)|(1<<b)]]==old.support[v];checks+=1
    return checks

def main():
    OUT.mkdir(exist_ok=False)
    sources=[Path(__file__),TRACE,SISTER/'scripts/exclusion_circuit.py',SISTER/'scripts/paired_exclusion_circuit.py',
             SISTER/'docs/research/paired-network.md']
    parent=ROOT/'results/encrypted-probability-survey/completion.json'
    save(OUT/'plan.json',dict(inherited_manifest=str(parent),inherited_manifest_sha256=sha(parent),
         sha256={str(p):sha(p) for p in sources},
         scope='All 11 nonempty pruned Sachs tables, all observed unique (L,U) queries in first-seen order. Static exact positive full-retained-sum graphs; immutable weights and unbounded result memoization shared by all methods. Offline knowledge of future queries is an optimistic screen, not an online implementation.',
         orders=['natural','reverse','descending parent-set incidence'],
         gate='A table qualifies only if the best carried construction uses >=5% fewer additions than the best conventional comparator, strictly fewer than the best separate-singleton ablation, and no greater peak live computed values than its best-addition conventional comparator. No timing if none qualifies.',
         limits='Native early cutoff and logarithm/base conversions are not reconstructed from rounded diagnostic weights. Conventional full-sum baselines do at least the requested mathematical summation work; beating them would not yet beat the native tolerance-aware scan. Compilation and table/circuit planning have unpriced CPU cost; generated nodes and contraction entry visits are retained.'))
    checks=validate();save(OUT/'validation.json',dict(status='PASS',exact_outputs=checks))
    rows=[]
    for tid,t,raw in load_trace():
        masks=[P for P,w in t['weights']];queries=list(dict.fromkeys(raw))
        union=0
        for P in masks:union|=P
        natural=[a for a in range(union.bit_length()) if union>>a&1]
        orders={'natural':natural,'reverse':natural[::-1],
                'incidence':sorted(natural,key=lambda a:(-sum(bool(P>>a&1) for P in masks),a))}
        allresults={'memo_balanced':direct(masks,queries),'greedy_common_pairs':greedy(masks,queries)}
        for name,order in orders.items():
            allresults['trie_'+name]=trie(masks,queries,order)
            allresults['carried_'+name]=paired(masks,queries,order,False)
            allresults['separate_'+name]=paired(masks,queries,order,True)
        controls=[k for k in allresults if not k.startswith(('carried_','separate_'))]
        best=lambda ks:min(ks,key=lambda k:(allresults[k]['additions'],allresults[k]['peak_live_computed_values'],k))
        c=best(controls);p=best([k for k in allresults if k.startswith('carried_')]);a=best([k for k in allresults if k.startswith('separate_')])
        cr,pr,ar=allresults[c],allresults[p],allresults[a]
        qualifies=(pr['additions']<=.95*cr['additions'] and pr['additions']<ar['additions'] and pr['peak_live_computed_values']<=cr['peak_live_computed_values'])
        record=dict(table=tid,node=t['node'],parent_masks=masks,queries=queries,trace_calls=len(raw),
                    pair_or_fewer_exclusion_unique_queries=sum((union&~U).bit_count()<=2 for L,U in queries),
                    results=allresults,best_control=c,best_carried=p,best_ablation=a,qualifies=qualifies)
        save(OUT/f'table-{tid}.json',record)
        small={k:v for k,v in record.items() if k not in ('results','parent_masks','queries')}
        small['unique_queries']=len(queries);small['rows']=len(masks)
        small['metrics']={k:{f:v[f] for f in ['additions','peak_live_computed_values','depth','generated_additions','contraction_entry_visits']} for k,v in allresults.items()}
        rows.append(small)
        print(json.dumps(dict(table=tid,node=t['node'],control=cr['additions'],carried=pr['additions'],ablation=ar['additions'],qualifies=qualifies)),flush=True)
    save(OUT/'summary.json',dict(status='complete_static_screen',validation_outputs=checks,tables=rows,qualified=sum(r['qualifies'] for r in rows)))
if __name__=='__main__':main()
