#!/usr/bin/env python3
"""Audit survey coverage and summarize exclusive profiles; make no speedup estimate."""
from collections import Counter
import hashlib
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]


def category(name):
    if name.startswith(('_point_', 'sd_fft_ctx_point_')) or name in {
            'fft_small_op_mul','fft_small_op_addmul','fft_small_op_sqr','fft_small_op_submul'}:
        return 'pointwise'
    if name.startswith('sd_ifft_') or 'moth_inv' in name:return 'inverse_fft'
    if name.startswith('sd_fft_'):return 'forward_fft'
    if name.startswith(('_crt_', '_convert_block', 'fft_small_export_')) or name=='_tpoly_invert_in_place':
        return 'export_crt_normalization'
    if name in {'_mod','_mod_red','_mod_fn','fft_small_fft_nmod'}:return 'input_conversion'
    return 'other_or_inline'


def main():
    rows=[];files=[Path(__file__).resolve()]
    for directory in ['polynomial-survey','polynomial-neighbors']:
        path=ROOT/'results'/directory
        metadata=json.loads((path/'metadata.json').read_text())
        for name,digest in (metadata['build']['sha256'] | metadata['source_sha256']).items():
            assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest()==digest,name
        current=json.loads((path/'summary.json').read_text())
        raw_trace=[json.loads(s) for s in (path/'trace.jsonl').read_text().splitlines()]
        timing=[json.loads(s) for s in (path/'timing.jsonl').read_text().splitlines()]
        assert len(current)==len(raw_trace)==len(metadata['case_order'])
        assert len(timing)==sum(1+metadata['plan']['samples'] if r['supported'] else 1 for r in current)
        for r in current:
            if not r['supported']:continue
            assert r['patterns_passed']==3
            c,p,d=r['counts'],r['plan'],r['dim']
            if c['transformed_context_successes']:
                assert d>1 and c['transformed_context_successes']==1
                assert c['matrix_input_phases']==c['matrix_output_phases']==1
                assert c['forward_calls']==2*d*d*p['np']
                assert c['inverse_calls']==d*d*p['np']
                assert c['op_mul_calls']==d*d
                assert c['op_addmul_calls']==d*d*(d-1)
                assert c['op_product_slots']==d**3*p['np']*(1<<p['depth'])
                assert c['export_calls']==d*d
                outlen=2*r['length']-1 if r['window']=='full' else r['length']
                assert c['export_coefficients']==d*d*outlen
        rows.extend(current);files.extend(path.iterdir())
    profiles=json.loads((ROOT/'results/polynomial-profiles/summary.json').read_text())
    for length in [1008,1040]:
        path=ROOT/f'results/polynomial-profile-{length}'
        profiles.append(json.loads((path/'summary.json').read_text()))
        files.extend(path.iterdir())
    files.extend((ROOT/'results/polynomial-profiles').iterdir())
    profile_manifest=json.loads((ROOT/'results/polynomial-profiles/manifest.json').read_text())
    for manifest in [profile_manifest,*profiles]:
        for name,digest in manifest.get('sha256',{}).items():
            assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest()==digest,name
    for profile in profiles:
        counts=Counter()
        for f in profile['functions']:counts[category(f['function'])]+=f['samples']
        counts['other_or_inline']+=profile['samples']-sum(counts.values())
        profile['accepted_for_attribution']=profile['samples']>=1000
        profile['survey_counts']=dict(counts)
        profile['survey_percent']={k:round(100*v/profile['samples'],2) for k,v in sorted(counts.items())}
        profile.pop('counts');profile.pop('percent')
    old=json.loads((ROOT/'results/delayed-reduction-audit.json').read_text())
    for name,digest in old['sha256'].items():
        assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest()==digest,name
    supported=[r for r in rows if r['supported']]
    result={'status':'PASS','cases':len(rows),'supported':len(supported),
        'unsupported':[{k:r[k] for k in ['dim','length','modulus','window']} for r in rows if not r['supported']],
        'matrix_transformed_contexts':sum(r['counts']['transformed_context_successes'] for r in supported),
        'correctness_pattern_comparisons':2*3*len(supported),
        'warm_batches':7*len(supported),'prior_delayed_reduction_hashes_unchanged':len(old['sha256']),
        'profiles':profiles,
        'scope':'Baseline survey only. Counters establish dispatch, not time or bytes transferred from memory. Profiles use exclusive top-of-stack samples, with wrapper work and inlining limitations. Reject the 63-sample scalar profile for attribution.',
        'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files if p.is_file()}}
    (ROOT/'results/polynomial-survey-analysis.json').write_text(json.dumps(result,indent=2)+'\n')
    print({k:result[k] for k in ['status','cases','supported','matrix_transformed_contexts','correctness_pattern_comparisons','warm_batches']})
    for p in profiles:print(p['case'],p['accepted_for_attribution'],p['survey_percent'])


if __name__=='__main__':main()
