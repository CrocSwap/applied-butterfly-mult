#!/usr/bin/env python3
"""Independent replay of serialized positive circuits and preservation chain."""
import sys
sys.dont_write_bytecode=True
import json
from pathlib import Path
from collections import Counter
import hashlib
from audit_encrypted_probability_survey import collect_manifest

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'results/sachs-hypergraph-screen'
EXTRA=ROOT/'results/sachs-hypergraph-eligible'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):
    with p.open('x') as f:json.dump(x,f,indent=2);f.write('\n')

parent=ROOT/'results/encrypted-probability-survey/completion.json'
prior=collect_manifest(parent,{})
for name,h in prior.items():assert sha(name)==h,name
programs=outputs=coefficients=0
for directory in [OUT,EXTRA]:
    plan=json.loads((directory/'plan.json').read_text())
    for name,h in plan['sha256'].items():assert sha(name)==h,name
    for path in sorted(directory.glob('table-*.json')):
        r=json.loads(path.read_text());masks=r['parent_masks'];m=len(masks)
        assert len(set(masks))==m
        expected=[{i for i,P in enumerate(masks) if P|U==U and (L==0 or P&L)} for L,U in r['queries']]
        for name,program in r['results'].items():
            vals={0:set(),**{i+1:{i} for i in range(m)}}
            depth=dict.fromkeys(vals,0)
            uses=Counter(program['outputs']);live=set();peak=0
            for v,a,b in program['nodes']:uses.update([a,b])
            for v,a,b in program['nodes']:
                assert v not in vals and a<v and b<v
                assert not vals[a].intersection(vals[b])
                vals[v]=vals[a].union(vals[b]);depth[v]=1+max(depth[a],depth[b])
                live.add(v);peak=max(peak,len(live))
                for x in [a,b]:
                    uses[x]-=1
                    if not uses[x]:live.discard(x)
            assert len(program['nodes'])==program['additions']
            assert peak==program['peak_live_computed_values']
            assert len(program['outputs'])==len(expected)
            for v,want,support in zip(program['outputs'],expected,program['output_supports']):
                assert vals[v]==want
                assert {i for i in range(m) if support>>i&1}==want
                coefficients+=m;outputs+=1
            assert max((depth[v] for v in program['outputs']),default=0)==program['depth']
            programs+=1
        rr=r['results']
        best=lambda prefix:min((k for k in rr if prefix(k)),key=lambda k:(rr[k]['additions'],rr[k]['peak_live_computed_values'],k))
        assert r['best_control']==best(lambda k:not k.startswith(('carried_','separate_')))
        assert r['best_carried']==best(lambda k:k.startswith('carried_'))
        assert r['best_ablation']==best(lambda k:k.startswith('separate_'))
        if 'qualifies' in r:
            c,p,a=[rr[r[k]] for k in ['best_control','best_carried','best_ablation']]
            assert r['qualifies']==(20*p['additions']<=19*c['additions'] and p['additions']<a['additions'] and p['peak_live_computed_values']<=c['peak_live_computed_values'])
summary=json.loads((OUT/'summary.json').read_text())
focused=json.loads((EXTRA/'summary.json').read_text())
assert summary['qualified']==0 and focused['strict_carried_wins']==0
receipt=dict(status='PASS',historical_fingerprints_verified=len(prior),
    serialized_programs=programs,output_forms=outputs,coefficient_equalities=coefficients,
    construction_fixture_outputs=json.loads((OUT/'validation.json').read_text())['exact_outputs'],
    scope='Independent set-based replay of all serialized gates and outputs, disjointness, addition counts, depth, fixed-order liveness, selection and gate; frozen inputs/source hashes and predecessor artifacts. No timing, native tolerance replay or online deployment claim.')
save(OUT/'audit.json',receipt)
files=[p for d in [OUT,EXTRA] for p in d.rglob('*') if p.is_file()]
files += [ROOT/'scripts/sachs_hypergraph_screen.py',ROOT/'scripts/sachs_hypergraph_eligible.py',Path(__file__).resolve(),ROOT/'docs/sachs-hypergraph-screen.md']
save(OUT/'completion.json',dict(status='complete',
    decision='Retained-singleton mechanism saves static additions versus its ablation but loses to conventional positive circuits on observed Sachs queries; no runtime prototype warranted.',
    inherited_manifest=str(parent),inherited_manifest_sha256=sha(parent),
    historical_fingerprints_verified=len(prior),qualified_for_timing=0,
    sha256={str(p):sha(p) for p in files}))
print(json.dumps(receipt,indent=2))
