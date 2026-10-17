#!/usr/bin/env python3
"""Audit the prepared-input experiment without changing earlier evidence."""
import hashlib
import json
import math
from pathlib import Path
import re
import statistics
import subprocess
from build_experiment import ROOT,BASE
from audit_poly_kernel import read,key,check_hashes


def main():
    tracked=[Path(__file__).resolve(),ROOT/'scripts/audit_poly_kernel.py']
    assembly={};validation={}
    for name in ['poly-prepared','poly-contiguous-control']:
        p=Path('results')/(name+'-build');m=read(p/'build.json');check_hashes(m['sha256'])
        tracked.append(ROOT/p/'build.json');tracked.extend(ROOT/f for f in m['sha256'])
        subprocess.run(['git','apply','--check',str(ROOT/'patches'/(name+'.patch'))],cwd=BASE,check=True)
        source=(ROOT/p/'gr.s').read_text(errors='replace');assembly[name]={}
        for symbol in ['_bf_normalize','_bf_contiguous']:
            start=source.index('_'+symbol+':');s=source[start:source.index('.cfi_endproc',start)]
            instructions=[line.strip() for line in s.splitlines() if re.match(r'^\s+[a-z]+(?:\.[a-z0-9]+)?\s',line)]
            assembly[name][symbol]={'instructions':len(instructions),
                'frintn':sum(line.startswith('frintn') for line in instructions),
                'stack_references':sum('[sp' in line for line in instructions)}
            assert assembly[name][symbol]['stack_references']==0
        p=Path('results')/(name+'-checks');m=read(p/'validation.json');check_hashes(m['sha256']);assert m['status']=='PASS'
        tracked.append(ROOT/p/'validation.json');tracked.extend(ROOT/f for f in m['sha256'])
        v={f:read(p/(f+'.json')) for f in ['test_poly_dot','test_poly_matrix','matrix-trace']}
        assert v['test_poly_dot']['direct_coefficient_and_range_checks']==1294080
        assert v['test_poly_matrix']['matrix_comparisons']==188
        assert v['matrix-trace']['tile_calls']==3112 and v['matrix-trace']['tile_successes']==3020
        assert v['matrix-trace']['prepared_inputs']==(3935 if name=='poly-prepared' else 0)
        assert v['matrix-trace']['prepared_slots']==(12869120 if name=='poly-prepared' else 0)
        assert (ROOT/p/'upstream.txt').read_text().count('PASS')==3
        validation[name]=v
    assert assembly['poly-prepared']['_bf_contiguous']['frintn']==16
    assert assembly['poly-contiguous-control']['_bf_contiguous']['frintn']==24
    p=Path('results/poly-prepared-coverage/coverage.json');coverage=read(p)
    assert coverage['status']=='PASS' and len(coverage['cases'])==64
    check_hashes(coverage['sha256']);tracked.append(ROOT/p);tracked.extend(ROOT/f for f in coverage['sha256'])
    for r in coverage['cases']:
        active=r['dim']>=4;prepared=active and r['library']=='poly-prepared'
        assert r['dot_calls']==r['dot_successes']==(r['dim']**2 if active else 0)
        assert r['prepared_inputs']==(r['dim']**2 if prepared else 0)
        np=1 if r['modulus']==0x3f00000000001 else 2
        assert r['prepared_slots']==(r['dim']**2*np*(1<<(2*r['length']+2).bit_length()) if prepared else 0)
    runs=['poly-prepared-screen','poly-prepared-aa','poly-prepared-confirm','poly-prepared-repeat',
          'poly-contiguous-ablation','poly-preparation-ablation','poly-prepared-versus-tile']
    summaries={};counts={}
    for name in runs:
        p=Path('results')/name;m=read(p/'metadata.json');check_hashes(m['sha256'])
        rows=[json.loads(line) for line in (ROOT/p/'raw.jsonl').read_text().splitlines()]
        warm=[r for r in rows if r['phase']=='warm'];checks=[r for r in rows if r['phase']=='correctness']
        bindings=[r for r in rows if r['phase']=='binding']
        assert len(bindings)==2*len(checks)==2*len(m['plan']['cases'])
        assert all(Path(r['image']).resolve()==Path(m['baseline'] if r['engine']==0 else m['candidate']).resolve() for r in bindings)
        assert all(r['comparisons']==6 for r in checks)
        cases={}
        for r in warm:cases.setdefault(key(r),{}).setdefault(r['trial'],[]).append(r)
        assert set(cases)=={(d,n,p,'middle' if w=='mid' else 'full') for d,n,p,w in m['plan']['cases']}
        summaries[name]=read(p/'summary.json')
        for summary in summaries[name]:
            k=key(summary);rawkey=k[:3]+('middle' if k[3]=='mid' else 'full',)
            trials=cases[rawkey];assert set(trials)==set(range(m['plan']['trials']))
            for t,quartet in trials.items():
                assert [r['position'] for r in quartet]==[0,1,2,3]
                assert [r['engine'] for r in quartet]==[t%2,1-t%2,1-t%2,t%2]
                assert len({r['iterations'] for r in quartet})==1
            for field,metric in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
                logs=[math.log(statistics.mean(r[metric] for r in q if r['engine']==0)/statistics.mean(r[metric] for r in q if r['engine']==1)) for q in trials.values()]
                saving=100*(1-math.exp(-statistics.mean(logs)))
                assert abs(saving-summary[field]['reduction_pct'])<1e-9
        counts[name]={'cases':len(cases),'batches':len(warm),'comparisons':6*len(checks)}
        tracked.extend((ROOT/p).iterdir());tracked.extend(ROOT/f for f in m['sha256'])
    a={key(r):r for r in summaries['poly-prepared-confirm']};b={key(r):r for r in summaries['poly-prepared-repeat']}
    assert set(a)==set(b) and len(a)==32
    paired=[]
    for k,x in sorted(a.items()):
        y=b[k];active=k[0]>=4
        paired.append({'case':dict(zip(['dim','length','modulus','window'],k)),'active':active,
            'cpu_positive_both':active and min(x['cpu']['ci95_low_pct'],y['cpu']['ci95_low_pct'])>0,
            'wall_positive_both':active and min(x['wall']['ci95_low_pct'],y['wall']['ci95_low_pct'])>0,
            'cpu_negative_both':active and max(x['cpu']['ci95_high_pct'],y['cpu']['ci95_high_pct'])<0,
            'confirm':{'cpu':x['cpu'],'wall':x['wall']},'repeat':{'cpu':y['cpu'],'wall':y['wall']}})
    old=read('results/poly-kernel-audit.json');check_hashes(old['sha256'])
    assert not subprocess.check_output(['git','diff','--stat'],cwd=BASE,text=True).strip()
    result={'status':'PASS','runs':counts,'validation':validation,'assembly':assembly,
        'coverage_case_library_pairs':64,'confirmation':paired,
        'cpu_positive_both':sum(r['cpu_positive_both'] for r in paired),
        'wall_positive_both':sum(r['wall_positive_both'] for r in paired),
        'cpu_negative_both':sum(r['cpu_negative_both'] for r in paired),
        'prior_kernel_evidence_hashes_unchanged':len(old['sha256']),
        'decision':'Retain as the preferred experimental matrix patch on the measured M2 workloads. Baseline unchanged. No claim of universal FLINT coverage or direct use of the sister finite network.',
        'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(tracked)) if p.is_file()}}
    (ROOT/'results/poly-prepared-audit.json').write_text(json.dumps(result,indent=2)+'\n')
    print({k:result[k] for k in ['status','cpu_positive_both','wall_positive_both','cpu_negative_both','prior_kernel_evidence_hashes_unchanged']})


if __name__=='__main__':main()
