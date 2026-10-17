#!/usr/bin/env python3
"""Bounded proposal-based synthesis of positive sums on frozen Sachs queries.

Theory contributes proposed supports, not free arithmetic. Every selected sum
is built from disjoint available terms and all active additions are charged.
"""
import sys
sys.dont_write_bytecode=True
from collections import Counter
import itertools
import json
from pathlib import Path
import sachs_hypergraph_screen as base

ROOT=base.ROOT
OUT=ROOT/'results/sachs-hybrid-screen'
PREV=ROOT/'results/sachs-hypergraph-screen'
CAP=256
ROUND_CAP=256

def supports(program):
    vals={0:0,**{i+1:1<<i for i in range(program['inputs'])}}
    for v,a,b in program['nodes']:
        assert not vals[a]&vals[b];vals[v]=vals[a]|vals[b]
    return {vals[v] for v,a,b in program['nodes']}

def proposal_pools(record):
    ts=base.targets(record['parent_masks'],record['queries']);unique=set(ts)-{0}
    ordinary=set()
    for name,p in record['results'].items():
        if not name.startswith(('carried_','separate_')):ordinary|=supports(p)
    def useful(s):return s.bit_count()>=2 and sum(t&s==s for t in unique)>=2
    def rank(s):
        return (-(sum(t&s==s for t in unique)-1)*(s.bit_count()-1),-s.bit_count(),s)
    frontier=unique
    # Two bounded rounds of ordinary intersections; no theory information.
    for _ in range(2):
        current=sorted(frontier)
        ordinary|={a&b for a,b in itertools.combinations(current,2) if useful(a&b)}
        frontier=set(sorted(ordinary|unique,key=rank)[:512])
    ordinary={s for s in ordinary if useful(s)}
    carried=set().union(*(supports(p) for k,p in record['results'].items() if k.startswith('carried_')))
    ablated=set().union(*(supports(p) for k,p in record['results'].items() if k.startswith('separate_')))
    carried={s for s in carried if useful(s)};ablated={s for s in ablated if useful(s)}
    return dict(ordinary=ordinary,carried=carried,ablated=ablated)

def synthesize(m,ts,pool,policy,reverse):
    g=base.Graph(m)
    forms={t:set(i+1 for i in range(m) if t>>i&1) for t in ts}
    targets=sorted(forms)
    containers={s:[t for t in targets if s&t==s] for s in pool}
    # Rank once without numeric weights. The same fixed cap applies to all families.
    ranked=sorted(pool,key=lambda s:(-(len(containers[s])-1)*(s.bit_count()-1),-s.bit_count(),-s if reverse else s))[:CAP]
    choices=[]
    for iteration in range(ROUND_CAP):
        pairs=Counter(p for terms in forms.values() for p in itertools.combinations(sorted(terms),2))
        best=None
        def offer(s,cover,build,source):
            nonlocal best
            cost=0 if s in g.lookup else len(build)-1
            saved=sum(len(terms)-1 for t,terms in cover)-cost
            if saved<=0:return
            # Rational ordering without floats: denominator only matters for ratio policy.
            denominator=max(1,cost) if policy=='ratio' else 1
            candidate=(saved,denominator,s,cover,build,source,cost)
            if best is None:
                best=candidate;return
            left=saved*best[1];right=best[0]*denominator
            tie=(-s if reverse else s)
            oldtie=(-best[2] if reverse else best[2])
            if left>right or (left==right and (saved,-cost,-tie)>(best[0],-best[6],-oldtie)):
                best=candidate
        for (a,b),count in pairs.items():
            if count<2:continue
            s=g.support[a]|g.support[b]
            cover=[(t,(a,b)) for t in targets if a in forms[t] and b in forms[t]]
            offer(s,cover,(a,b),'dynamic_pair')
        for s in ranked:
            cover=[]
            for t in containers[s]:
                terms=tuple(sorted(v for v in forms[t] if g.support[v]&s==g.support[v]))
                if len(terms)<2:continue
                union=0
                for v in terms:union|=g.support[v]
                if union==s:cover.append((t,terms))
            if len(cover)<2 and s not in g.lookup:continue
            if not cover:continue
            build=min((terms for t,terms in cover),key=lambda a:(len(a),a))
            offer(s,cover,build,'static_pool')
        if best is None:break
        gain,den,s,cover,build,source,cost=best
        before=len(g.args)
        v=g.lookup[s] if s in g.lookup else g.total(list(build))
        assert g.support[v]==s
        for t,terms in cover:
            assert set(terms)<=forms[t]
            forms[t].difference_update(terms);forms[t].add(v)
        choices.append(dict(support=s,source=source,expression_gain=gain,estimated_build_cost=cost,
                            generated_additions=len(g.args)-before,uses=len(cover)))
    result=g.finish([g.total(sorted(forms[t])) for t in ts],ts)
    result.update(choices=choices,round_cap_reached=len(choices)==ROUND_CAP,
                  static_proposals_considered=len(ranked),ranked_pool=ranked)
    return result

def lower_bound(ts,m):
    parent=list(range(m));active=set()
    def find(a):
        if parent[a]!=a:parent[a]=find(parent[a])
        return parent[a]
    for t in ts:
        ids=[i for i in range(m) if t>>i&1];active.update(ids)
        for i in ids[1:]:parent[find(i)]=find(ids[0])
    components=len({find(i) for i in active})
    return dict(active_inputs=len(active),components=components,additions=len(active)-components)

def main():
    OUT.mkdir(exist_ok=False)
    source_paths=sorted(PREV.glob('table-*.json'))
    parent=PREV/'completion.json'
    base.save(OUT/'plan.json',dict(inherited_manifest=str(parent),inherited_manifest_sha256=base.sha(parent),
        sha256={str(p):base.sha(p) for p in [Path(__file__),Path(base.__file__),parent,*source_paths]},
        corpus='All 11 original pruned Sachs tables and 299 distinct queries. No truncation or query/table selection.',
        proposals='Ordinary: existing conventional intermediates plus two capped rounds of output-support intersections. Theory: actual active intermediate supports in all three carried circuits. Ablation: supports in all three separate-singleton circuits. Only supports contained in >=2 distinct output forms are retained.',
        synthesis='Dynamic ordinary common pairs always available. Up to 256 static proposals per run, 256 sharing rounds, four fixed policies: gain or gain/build-cost, ascending or descending support tie break. Same caps and policies across families. All selected sums built from disjoint available terms; exact active gate cost checked after synthesis.',
        arms=['ordinary','ordinary+carried','ordinary+ablated'],
        selection='Each arm retains all previous conventional circuits as fallbacks. Hybrids also retain the new ordinary runs, so worse proposals cannot force regression. Compare best additions, then live computed values, then name.',
        gate='At least 5% fewer additions than strengthened ordinary; strictly fewer than equally budgeted ablated proposals; no greater peak live computed values than the selected ordinary comparator. A passing table requires held-out queries and native accuracy/runtime work before any application claim.',
        budget='Four identical capped synthesis passes per proposal family. Pool generation and per-proposal compatibility work differ; equal structural limits do not imply identical wall time. No numeric performance benchmark.',
        limits='Offline future-query knowledge and full retained sums; rounded diagnostic weights never used. Native early cutoff, preparation runtime, online cache learning and logarithm/base conversions remain unqualified. Proposal support provenance is weaker than executing the original theory circuit.'))
    rows=[]
    for source in source_paths:
        record=json.loads(source.read_text());m=len(record['parent_masks'])
        ts=base.targets(record['parent_masks'],record['queries']);pools=proposal_pools(record)
        runs={}
        for arm,extra in [('ordinary',set()),('carried',pools['carried']),('ablated',pools['ablated'])]:
            for policy,reverse in itertools.product(['gain','ratio'],[False,True]):
                name=f'{arm}_{policy}_{int(reverse)}'
                runs[name]=synthesize(m,ts,pools['ordinary']|extra,policy,reverse)
        old={f'previous_{k}':p for k,p in record['results'].items() if not k.startswith(('carried_','separate_'))}
        candidates={**old,**runs}
        ordinary=list(old)+[k for k in runs if k.startswith('ordinary_')]
        best=lambda names:min(names,key=lambda k:(candidates[k]['additions'],candidates[k]['peak_live_computed_values'],k))
        control=best(ordinary)
        carry=best(ordinary+[k for k in runs if k.startswith('carried_')])
        ablate=best(ordinary+[k for k in runs if k.startswith('ablated_')])
        c,p,a=[candidates[k] for k in [control,carry,ablate]]
        qualifies=(20*p['additions']<=19*c['additions'] and p['additions']<a['additions'] and p['peak_live_computed_values']<=c['peak_live_computed_values'])
        metrics={k:{f:v[f] for f in ['additions','peak_live_computed_values','depth','generated_additions']} for k,v in candidates.items()}
        counts=dict(ordinary=len(pools['ordinary']),carried=len(pools['carried']),ablated=len(pools['ablated']),
                    carried_not_ordinary=len(pools['carried']-pools['ordinary']),
                    carried_not_ordinary_or_ablated=len(pools['carried']-pools['ordinary']-pools['ablated']))
        row=dict(table=record['table'],node=record['node'],previous_best=record['best_control'],
                 previous_additions=record['results'][record['best_control']]['additions'],
                 best_control=control,best_carried=carry,best_ablation=ablate,qualifies=qualifies,
                 pool_counts=counts,lower_bound=lower_bound(ts,m),metrics=metrics)
        packet=dict(**row,parent_masks=record['parent_masks'],queries=record['queries'],
                    pools={k:sorted(v) for k,v in pools.items()},results=candidates)
        base.save(OUT/f"table-{record['table']}.json",packet)
        rows.append(row)
        print(json.dumps(dict(node=record['node'],old=row['previous_additions'],ordinary=c['additions'],
                              hybrid=p['additions'],ablation=a['additions'],qualifies=qualifies)),flush=True)
    base.save(OUT/'summary.json',dict(tables=rows,qualified=sum(r['qualifies'] for r in rows)))
if __name__=='__main__':main()
