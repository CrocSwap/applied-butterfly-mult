#!/usr/bin/env python3
"""Check source provenance, frozen inputs, trace coverage and inherited artifacts."""
import sys
sys.dont_write_bytecode=True
import hashlib
import json
from pathlib import Path
import encrypted_probability_survey as s

def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def collect_manifest(p, hashes):
    d=json.loads(p.read_text())
    for key in ['sha256','source_sha256','artifact_sha256','theory_source_sha256']:
        for name,h in d.get(key,{}).items():
            if name in hashes: assert hashes[name]==h,name
            hashes[name]=h
    if d.get('inherited_manifest'):
        parent=Path(d['inherited_manifest'])
        assert sha(parent)==d['inherited_manifest_sha256'],str(parent)
        collect_manifest(parent,hashes)
    return hashes

def preservation():
    parent=s.ROOT/'results/walsh-baseline-qualification/completion.json'
    hashes=collect_manifest(parent,{})
    for name,h in hashes.items(): assert sha(name)==h,name
    return dict(inherited_manifest=str(parent),inherited_manifest_sha256=sha(parent),
                historical_fingerprints_verified=len(hashes))

if __name__=='__main__':
    inherited=preservation()
    if '--preservation-only' in sys.argv:
        s.save(s.OUT/'preservation.json',inherited);print(json.dumps(inherited,indent=2));sys.exit()
    sources=s.blobs()
    plan=json.loads((s.OUT/'trace-plan.json').read_text())
    for name,h in plan['sha256'].items():assert sha(name)==h,name
    algebra=json.loads((s.OUT/'contract-checks.json').read_text());assert algebra['status']=='PASS'
    summary=json.loads((s.OUT/'trace-summary.json').read_text())
    assert [r['case'] for r in summary]==plan['cases']
    query_total=0
    for r in summary:
        c=r['case'];dest=s.OUT/'runs'/f"{c['data']}-p{c['pruning']}"
        lines=(dest/'trace/queries.tsv').read_text().splitlines()
        assert sum(x.startswith('Q\t') for x in lines)==r['total_queries']
        query_total+=r['total_queries']
        for name in r['output_files_identical']:
            assert (dest/'trace/results'/name).read_bytes()==(dest/'original/results'/name).read_bytes()
        # Independently count complete-table arity and pair exclusion eligibility.
        tables={};queries=[]
        for line in lines:
            f=line.split('\t')
            if f[0]=='T':tables[int(f[1])]=[]
            elif f[0]=='W':tables[int(f[1])].append(int(f[2]))
            else:queries.append(tuple(map(int,f[1:])))
        eligible=0
        for tid,L,U,base in queries:
            masks=tables[tid]
            union=0
            for m in masks:union|=m
            if masks and (union&~U).bit_count()==2 and all(m.bit_count()<=2 for m in masks):eligible+=1
        assert eligible==r['exact_pair_table_two_exclusion_queries']
    receipt=dict(status='PASS',**inherited,upstream_git_blobs_verified=sources,
                 trace_queries=query_total,trace_cases=len(summary),
                 sampled_paths_and_scores_identical=True,
                 scope='Source Git blobs, plan hashes, independent pair eligibility and query counts, literal sampled-output identity, inherited SHA chain. No performance or posterior-convergence qualification.')
    s.save(s.OUT/'audit.json',receipt)
    files=[p for p in s.OUT.rglob('*') if p.is_file()]
    files += [s.ROOT/'scripts/encrypted_probability_survey.py',Path(__file__).resolve(),
              s.ROOT/'scripts/check_encrypted_probability_contracts.py',s.ROOT/'docs/encrypted-probability-survey.md']
    s.save(s.OUT/'completion.json',dict(status='complete',**inherited,
           decision='No new speedup. Encrypted transform transfer lacks an exact cost-saving mapping; Bayesian positive sums have a concrete caller and stronger native baseline. See trace summary for compatibility.',
           upstream_git_blobs_verified=sources,trace_queries=query_total,
           sha256={str(p):sha(p) for p in files}))
    print(json.dumps(receipt,indent=2))
