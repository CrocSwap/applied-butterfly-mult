#!/usr/bin/env python3
"""Audit fixed artifacts, numerical checks, quartet structure, and both confirmation runs."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import subprocess
from build_experiment import ROOT,BASE


def read(path):return json.loads((ROOT/path).read_text())
def key(r):return (r['dim'],r['length'],r['modulus'],r['window'])
def check_hashes(mapping):
    for name,digest in mapping.items():
        assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest()==digest,name


def main():
    names=['poly-shared4','poly-tile4','poly-shared4-wide','poly-shared4-medium',
           'poly-shared4-ordered','poly-tile4-ordered','poly-tile4-wide-control']
    tracked=[Path(__file__).resolve()];assembly={}
    for name in names:
        p=Path('results')/(name+'-build')/'build.json';manifest=read(p)
        check_hashes(manifest['sha256']);tracked.extend(ROOT/f for f in manifest['sha256']);tracked.append(ROOT/p)
        subprocess.run(['git','apply','--check',str(ROOT/'patches'/(name+'.patch'))],cwd=BASE,check=True)
        s=(ROOT/'results'/(name+'-build')/'gr.s').read_text(errors='replace')
        start=s.index('__bf_dot4:');s=s[start:s.index('.cfi_endproc',start)]
        instructions=[l.strip() for l in s.splitlines() if re.match(r'^\s+[a-z]+(?:\.[a-z0-9]+)?\s',l)]
        assembly[name]={'instructions':len(instructions),
            'frintn_instructions':sum(l.startswith('frintn') for l in instructions),
            'stack_referencing_instructions':sum('[sp' in l for l in instructions)}
    assert assembly['poly-shared4-wide']['frintn_instructions']==36
    assert assembly['poly-tile4-wide-control']['frintn_instructions']==48
    # The earlier nonvolatile wide control was merged by LLVM and is not a valid arithmetic ablation.
    assert assembly['poly-shared4-ordered']['frintn_instructions']==assembly['poly-tile4-ordered']['frintn_instructions']
    validation={}
    for name in ['poly-shared4-wide','poly-tile4-wide-control']:
        p=Path('results')/(name+'-checks');m=read(p/'validation.json');assert m['status']=='PASS'
        check_hashes(m['sha256']);tracked.append(ROOT/p/'validation.json');tracked.extend(ROOT/f for f in m['sha256'])
        validation[name]={f:read(p/(f+'.json')) for f in ['test_poly_dot','test_poly_matrix','matrix-trace']}
        assert validation[name]['test_poly_dot']['direct_coefficient_and_range_checks']==1294080
        assert validation[name]['test_poly_matrix']['matrix_comparisons']==188
        assert validation[name]['matrix-trace']['tile_successes']==828
        assert validation[name]['matrix-trace']['tile_calls']==862
        assert (ROOT/p/'upstream.txt').read_text().count('PASS')==3
    runs=['poly-shared4-wide-screen','poly-shared4-medium-screen','poly-shared4-ordered-screen',
          'poly-kernel-aa','poly-kernel-confirm','poly-kernel-repeat',
          'poly-kernel-tile-ablation','poly-kernel-sharing-ablation']
    summaries={};counts={}
    for name in runs:
        p=Path('results')/name;m=read(p/'metadata.json');check_hashes(m['sha256'])
        rows=[json.loads(line) for line in (ROOT/p/'raw.jsonl').read_text().splitlines()]
        warm=[r for r in rows if r['phase']=='warm'];checks=[r for r in rows if r['phase']=='correctness']
        assert len(checks)==len(m['plan']['cases']) and all(r['comparisons']==6 for r in checks)
        cases={};
        for r in warm:cases.setdefault(key(r),{}).setdefault(r['trial'],[]).append(r)
        expected={(d,n,p,'middle' if w=='mid' else 'full') for d,n,p,w in m['plan']['cases']}
        assert set(cases)==expected
        for case,trials in cases.items():
            assert set(trials)==set(range(m['plan']['trials']))
            for t,quartet in trials.items():
                assert [r['position'] for r in quartet]==[0,1,2,3]
                assert [r['engine'] for r in quartet]==[t%2,1-t%2,1-t%2,t%2]
                assert len({r['iterations'] for r in quartet})==1
                assert all(r['cpu_ns_per_op']>0 and r['ns_per_op']>0 for r in quartet)
        summaries[name]=read(p/'summary.json');counts[name]={'cases':len(cases),'batches':len(warm),'comparisons':6*len(checks)}
        tracked.extend((ROOT/p).iterdir());tracked.extend(ROOT/f for f in m['sha256'])
    a={key(r):r for r in summaries['poly-kernel-confirm']};b={key(r):r for r in summaries['poly-kernel-repeat']}
    assert set(a)==set(b) and len(a)==32
    paired=[]
    for k,x in sorted(a.items()):
        y=b[k];active=k[0]>=4
        paired.append({'case':dict(zip(['dim','length','modulus','window'],k)),
            'active':active,'cpu_positive_both':active and min(x['cpu']['ci95_low_pct'],y['cpu']['ci95_low_pct'])>0,
            'wall_positive_both':active and min(x['wall']['ci95_low_pct'],y['wall']['ci95_low_pct'])>0,
            'cpu_negative_both':active and max(x['cpu']['ci95_high_pct'],y['cpu']['ci95_high_pct'])<0,
            'confirm':{'cpu':x['cpu'],'wall':x['wall']},'repeat':{'cpu':y['cpu'],'wall':y['wall']}})
    for name in ['polynomial-survey-analysis','delayed-reduction-audit']:
        old=read('results/'+name+'.json');check_hashes(old['sha256'])
    assert not subprocess.check_output(['git','diff','--stat'],cwd=BASE,text=True).strip()
    result={'status':'PASS','runs':counts,'validation':validation,'assembly':assembly,
        'confirmation':paired,'cpu_positive_both':sum(r['cpu_positive_both'] for r in paired),
        'wall_positive_both':sum(r['wall_positive_both'] for r in paired),
        'cpu_negative_both':sum(r['cpu_negative_both'] for r in paired),
        'decision':'Experimental only. Repeated complete-operation gains on specified workloads, with large-case regressions. No universal dispatch promotion and no claim of implementing the sister finite network.',
        'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(tracked)) if p.is_file()}}
    (ROOT/'results/poly-kernel-audit.json').write_text(json.dumps(result,indent=2)+'\n')
    print({k:result[k] for k in ['status','cpu_positive_both','wall_positive_both','cpu_negative_both']})
    print('assembly',assembly)


if __name__=='__main__':main()
