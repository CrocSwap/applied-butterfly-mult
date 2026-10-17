#!/usr/bin/env python3
"""Independent semantic replay, provenance and resource audit of the hybrid screen."""
import sys
sys.dont_write_bytecode=True
from collections import Counter
import hashlib
import json
from pathlib import Path
from audit_encrypted_probability_survey import collect_manifest

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'results/sachs-hybrid-screen'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):
    with p.open('x') as f:json.dump(x,f,indent=2);f.write('\n')
def replay(program,m,expected):
    vals={0:set(),**{i+1:{i} for i in range(m)}};depth=dict.fromkeys(vals,0)
    uses=Counter(program['outputs']);live=set();peak=0
    for v,a,b in program['nodes']:uses.update([a,b])
    for v,a,b in program['nodes']:
        assert a<v and b<v and v not in vals
        assert not vals[a]&vals[b]
        vals[v]=vals[a]|vals[b];depth[v]=1+max(depth[a],depth[b])
        live.add(v);peak=max(peak,len(live))
        for x in [a,b]:
            uses[x]-=1
            if not uses[x]:live.discard(x)
    assert len(program['nodes'])==program['additions']
    assert peak==program['peak_live_computed_values']
    assert program['depth']==max((depth[v] for v in program['outputs']),default=0)
    assert len(program['outputs'])==len(expected)
    for v,want,support in zip(program['outputs'],expected,program['output_supports']):
        assert vals[v]==want
        assert support==sum(1<<i for i in want)
    return {sum(1<<i for i in vals[v]) for v,a,b in program['nodes']}

plan=json.loads((OUT/'plan.json').read_text())
parent=Path(plan['inherited_manifest']);assert sha(parent)==plan['inherited_manifest_sha256']
prior=collect_manifest(parent,{})
for name,h in prior.items():assert sha(name)==h,name
for name,h in plan['sha256'].items():assert sha(name)==h,name
summary=json.loads((OUT/'summary.json').read_text());assert len(summary['tables'])==11
programs=outputs=coefficients=0;considered=selected=0;caps=0;stats=[]
totals=Counter();qualified=0
for row in summary['tables']:
    r=json.loads((OUT/f"table-{row['table']}.json").read_text())
    prev=json.loads((ROOT/f"results/sachs-hypergraph-screen/table-{row['table']}.json").read_text())
    assert r['parent_masks']==prev['parent_masks'] and r['queries']==prev['queries']
    m=len(r['parent_masks'])
    expected=[{i for i,P in enumerate(r['parent_masks']) if P|U==U and (L==0 or bool(P&L))} for L,U in r['queries']]
    target_masks={sum(1<<i for i in s) for s in expected}
    pools={k:set(v) for k,v in r['pools'].items()}
    for pool in pools.values():
        for s in pool:
            assert s.bit_count()>=2 and sum(s&t==s for t in target_masks)>=2
    source_supports={}
    for name,p in prev['results'].items():source_supports[name]=replay(p,m,expected)
    for family,prefix in [('carried','carried_'),('ablated','separate_')]:
        source=set().union(*(v for k,v in source_supports.items() if k.startswith(prefix)))
        assert pools[family]<=source
    for name,p in r['results'].items():
        replay(p,m,expected);programs+=1;outputs+=len(expected);coefficients+=m*len(expected)
        if name.startswith('previous_'):continue
        family=name.split('_')[0];valid=pools['ordinary']|(pools[family] if family!='ordinary' else set())
        assert len(p['ranked_pool'])<=256 and set(p['ranked_pool'])<=valid
        assert len(p['choices'])<=256
        caps+=p['round_cap_reached']
        for c in p['choices']:
            assert c['expression_gain']>0 and c['generated_additions']>=0
            if c['source']=='static_pool':assert c['support'] in p['ranked_pool']
    rr=r['results'];ordinary=[k for k in rr if k.startswith(('ordinary_','previous_'))]
    best=lambda names:min(names,key=lambda k:(rr[k]['additions'],rr[k]['peak_live_computed_values'],k))
    assert r['best_control']==best(ordinary)
    assert r['best_carried']==best(ordinary+[k for k in rr if k.startswith('carried_')])
    assert r['best_ablation']==best(ordinary+[k for k in rr if k.startswith('ablated_')])
    c,p,a=[rr[r[k]] for k in ['best_control','best_carried','best_ablation']]
    gate=20*p['additions']<=19*c['additions'] and p['additions']<a['additions'] and p['peak_live_computed_values']<=c['peak_live_computed_values']
    assert r['qualifies']==gate;qualified+=gate
    for key in ['best_control','best_carried','best_ablation']:totals[key]+=rr[r[key]]['additions']
    extra=pools['carried']-pools['ordinary'];runs=[p for k,p in rr.items() if k.startswith('carried_')]
    seen=set().union(*(set(p['ranked_pool'])&extra for p in runs))
    used=set().union(*({c['support'] for c in p['choices'] if c['source']=='static_pool'}&extra for p in runs))
    considered+=len(seen);selected+=len(used)
    # Independent connected-component lower bound from requested output supports.
    components=[]
    for support in expected:
        if not support:continue
        merged=set(support);keep=[]
        for comp in components:
            if comp&merged:merged|=comp
            else:keep.append(comp)
        # Existing components are disjoint, so a single pass suffices.
        components=keep+[merged]
    lb=sum(len(c)-1 for c in components)
    assert r['lower_bound']['additions']==lb and all(v['additions']>=lb for v in rr.values())
    stats.append(dict(node=r['node'],extra_theory_considered=len(seen),extra_theory_selected=len(used)))
assert qualified==summary['qualified']==0
receipt=dict(status='PASS',historical_fingerprints_verified=len(prior),serialized_programs=programs,
    output_forms=outputs,coefficient_equalities=coefficients,synthesis_runs=11*12,
    round_cap_hits=caps,extra_theory_supports_considered=considered,
    extra_theory_supports_selected=selected,addition_totals=dict(totals),by_table=stats,
    scope='Independent exact positive-circuit replay, resource counts, frozen corpus, theory proposal provenance, budgets, winner/gate selection, lower bounds and preservation chain. Not an optimality or runtime claim.')
save(OUT/'audit.json',receipt)
files=[p for p in OUT.rglob('*') if p.is_file()]
files += [ROOT/'scripts/sachs_hybrid_screen.py',Path(__file__).resolve(),ROOT/'docs/sachs-hybrid-screen.md']
save(OUT/'completion.json',dict(status='complete',decision='No theory-specific hybrid improvement; ordinary synthesis saves two additions, 972 to 970. Park Sachs construction transfer; no timing or held-out runtime stage warranted.',
    inherited_manifest=str(parent),inherited_manifest_sha256=sha(parent),historical_fingerprints_verified=len(prior),
    qualified_for_timing=0,sha256={str(p):sha(p) for p in files}))
print(json.dumps({k:v for k,v in receipt.items() if k!='by_table'},indent=2))
