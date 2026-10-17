#!/usr/bin/env python3
"""Independent all-program coefficient and forward-liveness audit."""
import argparse
from collections import Counter
from functools import reduce
import gzip
import hashlib
import json
from operator import xor
from pathlib import Path

def dominates(a,b,strict=False):
    fields=('scratch','xors','accesses','copies','input_reads','zero_writes')
    return all(a[k]<=b[k] for k in fields) and (not strict or any(a[k]<b[k] for k in fields))

def main():
    ap=argparse.ArgumentParser();ap.add_argument('directory');args=ap.parse_args()
    out=Path(args.directory); root=Path(__file__).resolve().parents[1]
    plan=json.loads((out/'plan.json').read_text())
    assert hashlib.sha256(Path(plan['source']).read_bytes()).hexdigest()==plan['source_sha256']
    assert hashlib.sha256((root/'scripts/erasure_basis_screen.py').read_bytes()).hexdigest()==plan['script_sha256']
    source=[json.loads(x) for x in Path(plan['source']).read_text().splitlines()]
    expected={r['op']:[sum(1<<i for i in x) for x in r['matrix']] for r in source if r['k']==10}
    rows=[json.loads(x) for x in (out/'rows.jsonl').read_text().splitlines()]
    count=0; coefficient_equalities=0; max_fanin=0
    with gzip.open(out/'programs.jsonl.gz','rt') as f:
        for line,r in zip(f,rows,strict=True):
            p=json.loads(line);assert p['id']==r['id']==count
            vals={-i-1:1<<i for i in range(p['inputs'])}
            dag=p['dag']; final=set(p['outputs']); assert len(final)==32
            uses=Counter(a for _,aa in dag for a in aa if a>=0)
            live=set(); peak=32
            for t,aa in dag:
                assert t not in vals and t>=0 and len(aa)==len(set(aa))
                assert all(a<t for a in aa)
                v=reduce(xor,(vals[a] for a in aa),0)
                for a in aa:
                    if a>=0:
                        assert a in live
                        uses[a]-=1
                        if not uses[a] and a not in final: live.remove(a)
                vals[t]=v;live.add(t);peak=max(peak,len(live))
                assert uses[t] or t in final, 'Dead statement was not pruned'
            assert live==final
            assert [vals[t] for t in p['outputs']]==expected[r['op']]==p['expected']
            assert peak==r['slots'] and peak-32==r['scratch']
            assert sum(max(0,len(a)-1) for _,a in dag)==r['xors']
            assert sum(len(a)+1 for _,a in dag)==r['accesses']
            assert sum(len(a)==1 for _,a in dag)==r['copies']
            assert sum(not a for _,a in dag)==r['zero_writes']
            assert sum(a<0 for _,aa in dag for a in aa)==r['input_reads']
            assert len(dag)==r['statements']
            max_fanin=max(max_fanin,max(map(lambda x:len(x[1]),dag)))
            coefficient_equalities+=p['inputs']*32;count+=1
    summary=json.loads((out/'summary.json').read_text())
    assert count==len(rows)==summary['programs']
    assert coefficient_equalities==summary['coefficient_equalities']
    by_ablation={(r['op'],r['schedule'],r['cut'],tuple(r['retained'] or []),r['mode']):r for r in rows}
    qualified=[]; uncovered=[]
    for r in rows:
        if r['mode']!='basis':continue
        ordinary=summary['ordinary_frontiers'][r['op']]
        if any(dominates(b,r) for b in ordinary):continue
        uncovered.append(r['id'])
        b=summary['original_scheduled'][r['op']]
        a=by_ablation[(r['op'],r['schedule'],r['cut'],tuple(r['retained']), 'sparse')]
        gain=r['scratch']*10<=b['scratch']*9 or r['xors']*20<=b['xors']*19 or r['accesses']*20<=b['accesses']*19
        if dominates(r,b) and dominates(r,a,True) and gain: qualified.append(r['id'])
    # Summary lists nondominated representatives; require exact resource-vector
    # agreement rather than all the identical programs' IDs.
    fields=('scratch','xors','accesses','copies','input_reads','zero_writes')
    vector=lambda r:tuple(r[k] for k in fields)
    got={vector(rows[i]) for i in qualified}
    reported={vector(r) for r in summary['qualified']}
    # Qualified rows can themselves be dominated by another basis candidate.
    assert reported<=got
    assert all(any(dominates(r,rows[i]) for r in summary['qualified']) for i in qualified)
    # Every baseline program must be covered by its reported frontier.
    for r in rows:
        group='candidate_frontiers' if r['mode']=='basis' else 'ordinary_frontiers'
        assert any(dominates(b,r) for b in summary[group][r['op']])
    receipt=dict(status='PASS',programs=count,coefficient_equalities=coefficient_equalities,
                 max_fanin=max_fanin,qualified_programs_including_duplicates=len(qualified),
                 uncovered_basis_programs_including_duplicates=len(uncovered),
                 scope='Independent coefficients vs pinned matrices, source immutability by SSA syntax, forward live-value peaks vs backward allocation, every charged operation/resource, frontier coverage and gate. Not hardware traffic/timing or a global optimization proof.')
    with (out/'audit.json').open('x') as f:json.dump(receipt,f,indent=2);f.write('\n')
    print(json.dumps(receipt,indent=2))

if __name__=='__main__':main()
