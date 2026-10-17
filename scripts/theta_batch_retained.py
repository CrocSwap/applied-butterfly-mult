#!/usr/bin/env python3
"""Test retaining a rigorous shared transform computed at higher precision."""
import difflib
import json
from pathlib import Path
import random
import subprocess
import sys
from theta_batch import ROOT, BASE, OUT, BUILD, FLAGS, INCLUDES, LIBS, LEADING, ORIGINAL, build, run, command
from qualify_theory_paths_hard import sha, save
from compare import summarize

DEST=OUT/'retained'

def prepare():
    DEST.mkdir(exist_ok=False)
    old=(BUILD/'shared/ql_exact.c').read_text()
    assert old.count('if(s->hat_prec!=hprec)')==1
    source=old.replace('/* Exact precision key: never substitute a transform rounded at another precision. */',
        '/* A cached rigorous enclosure at higher precision remains valid.\n           Recompute whenever a caller requires MORE precision. */').replace('if(s->hat_prec!=hprec)','if(s->hat_prec<hprec)')
    lib=build('retained',{'ql_exact':source});trace=build('retained-trace',{'ql_exact':source},('-DBF_BATCH_TRACE=1',))
    patch=ROOT/'patches/theta-batch-retained.patch';original=(BASE/'src/acb_theta/ql_exact.c').read_text()
    with patch.open('x') as f:f.write(''.join(difflib.unified_diff(original.splitlines(True),source.splitlines(True),fromfile='a/src/acb_theta/ql_exact.c',tofile='b/src/acb_theta/ql_exact.c')))
    test=DEST/'test-theta'
    run(['clang',*FLAGS,*INCLUDES,str(BASE/'src/acb_theta/test/main.c'),str(lib),*LIBS,'-o',str(test)],DEST/'test-compile.log')
    run([str(test),'acb_theta_agm_mul','acb_theta_agm_mul_tight','acb_theta_ql_exact','acb_theta_jet_notransform','acb_theta_jet'],DEST/'upstream-tests.log')
    # Exercise actual private helpers with sanitizers and higher-precision reuse.
    check=(ROOT/'bench/theta_batch_cache_check.c').read_text().replace('../.deps/experiments/theta-batch/shared/ql_exact.c',str(BUILD/'retained/ql_exact.c'))
    check=check.replace('assert(_acb_vec_equal(ref,out,len));','assert(_acb_vec_overlaps(ref,out,len));\n                assert(_acb_vec_is_finite(out,len));')
    check=check.replace('bit_identical_coefficients','overlapping_coefficients')
    file=DEST/'cache-check.c';file.write_text(check)
    run(['clang',*FLAGS,*INCLUDES,'-fsanitize=address,undefined',str(file),str(LEADING),*LIBS,'-o',str(DEST/'cache-check')],DEST/'cache-check-compile.log')
    run([str(DEST/'cache-check')],DEST/'cache-check.json')
    oldplan=json.loads((OUT/'plan.json').read_text())
    cases=[c['case'] for c in oldplan['comparisons'] if c['base']=='leading' and not c['case'].get('same')]
    validations=[];traces=[]
    for c in cases:
        validations.append(dict(case=c,**json.loads(subprocess.check_output(command(c,'validate',LEADING,lib),text=True,timeout=120))))
        traces.append(dict(case=c,**json.loads(subprocess.check_output(command(c,'trace',LEADING,trace),text=True,timeout=120))))
    save(DEST/'validation.json',validations);save(DEST/'trace.json',traces)
    comparisons=[]
    for c in cases:
        for b in ('leading','original'):comparisons.append(dict(case=c,base=b,candidate='retained'))
        if c['nb']==16:
            for b in ('prepared','shared'):comparisons.append(dict(case=c,base=b,candidate='retained'))
    for f in (0,1):
        comparisons.append(dict(case=dict(g=2,prec=512,nb=4,square=0,fixture=f,all=1,trials=21,same=1),base='leading',candidate='retained'))
        comparisons.append(dict(case=dict(g=1,prec=128,nb=1,square=0,fixture=f,all=1,trials=21),base='leading',candidate='retained'))
    random.Random(550203).shuffle(comparisons)
    frozen=oldplan['frozen_sha256'].copy()
    for p in [Path(__file__).resolve(),ROOT/'bench/theta_batch_cache_check.c',OUT/'cache-check.json',OUT/'plan.json',patch,*[p for p in DEST.rglob('*') if p.is_file()],*[p for p in (BUILD/'retained').rglob('*') if p.is_file()],*[p for p in (BUILD/'retained-trace').rglob('*') if p.is_file()]]:
        frozen[str(p)]=sha(p)
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    save(DEST/'plan.json',dict(comparisons=comparisons,libraries={**oldplan['libraries'],'retained':str(lib)},frozen_sha256=frozen,
        protocol=oldplan['protocol'],note='Initial exact-precision variant was validated but not timed. This campaign tests higher-precision retention, with exact-precision and preparation-only ablations.'))
    print('Prepared retained variant:',len(comparisons),'comparisons',flush=True)

def measure():
    p=json.loads((DEST/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    with (DEST/'raw.jsonl').open('x') as out:
        for i,c in enumerate(p['comparisons']):
            raw=subprocess.check_output(command(c['case'],'measure',p['libraries'][c['base']],p['libraries'][c['candidate']]),text=True,timeout=180)
            rows=[json.loads(s) for s in raw.splitlines()];assert len(rows)==84
            out.write(json.dumps(dict(**c,rows=rows))+'\n');out.flush();print(i+1,'/',len(p['comparisons']),flush=True)

def analyze():
    p=json.loads((DEST/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    data=[json.loads(s) for s in (DEST/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in data]==p['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in data]
    save(DEST/'summary.json',dict(results=rows,preserved_hashes=len(p['frozen_sha256']),raw_sha256=sha(DEST/'raw.jsonl')))
    print('Analyzed',len(rows),'comparisons',flush=True)

if __name__=='__main__':
    assert len(sys.argv)==2 and sys.argv[1] in ('prepare','measure','analyze');globals()[sys.argv[1]]()
