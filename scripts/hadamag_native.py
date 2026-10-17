#!/usr/bin/env python3
"""Freeze, measure and audit native-double non-rigidity WHT application replay."""
import json,os,random,subprocess,sys
from pathlib import Path
from qualify_theory_paths_hard import ROOT,sha,save
from compare import summarize
OUT=ROOT/'results/hadamag-native'
DEP=ROOT/'.deps/application-survey'
JULIA=DEP/'julia-1.10.10/bin/julia'
BASELINES=('julia','iter','r2','r4','r8','i4','i8')
def verify(p):
    for name,h in p['sha256'].items():assert sha(ROOT/name)==h,name
def freeze():
    assert not (OUT/'plan.json').exists()
    cs=json.loads((OUT/'captures.json').read_text())
    jobs=[dict(case=c['id'],baseline=b,candidate=v) for c in cs for b in BASELINES for v in ('h4','h8','h4i','h8i')]
    jobs += [dict(case=c['id'],baseline='r8',candidate='r8') for c in cs]
    random.Random(78123).shuffle(jobs)
    hashes={}
    for name in ('plan.json','completion.json'):
        p=ROOT/'results/application-survey'/name;d=json.loads(p.read_text());hashes.update(d['sha256']);hashes[str(p)]=sha(p)
    paths=[ROOT/'bench/hadamag_native.c',ROOT/'bench/hadamag_native.jl',ROOT/'bench/hadamag_native_check.c',Path(__file__).resolve()]
    paths += [p for p in OUT.rglob('*') if p.is_file()]
    for p in paths:hashes[str(p)]=sha(p)
    plan=dict(sha256=hashes,jobs=jobs,quartets=12,batch_ms=10,
      question='Do native Float64 Alman--Rao H4/H8 circuits beat the existing HadaMAG backend AND ordinary native WHTs on genuine inputs?',
      build='clang -O3 -mcpu=apple-m2 -fno-fast-math -ffp-contract=off -dynamiclib; one thread; no allocation within any native transform',
      method='Eight evenly spaced transform ordinals per immutable public-call state. Recopy original input before each transform; copy and Julia/C ABI included equally. 100ms warmup per variant, common calibrated repetition count, randomized pair order, alternating ABBA/BAAB quartets. GC disabled only in timed replay batches. Process CPU and wall time. Same-function r8 controls for every case.',
      gate='Exploratory kernel advantage requires positive CPU and wall lower 95% block-bootstrap CI against every declared baseline at that case; independently confirm qualifying cases with 24 quartets at 20ms against every baseline before full SRE timing. No claim based only on beating Julia. Stop construction track if none qualifies. No full MC claim from this replay.',
      limits='One Apple M2; finite bounded Float64 inputs, not arbitrary overflow/underflow-equivalent arithmetic; only CPU serial, no FFHT x86/GPU/MPI. Captures are genuine but small cache-resident replay subsets, not complete caller timing. No simultaneous-multiple-comparison correction: exploratory screen, mandatory independent confirmation.',
      ffht=dict(commit='fba727a3ff72c862260460631ae1cc8e3e44e861',url='https://github.com/FALCONN-LIB/FFHT',status='Source inspection: fht_impl.h selects AVX or SSE; both inline x86 assembly. No native ARM implementation to benchmark unchanged.'),
      attribution='Older Alman--Rao non-rigidity constructions, adapted from frozen theta_nonrigidity_kernel.h. Current theory investigation supplied discovery path, not a new circuit.')
    verify(plan);save(OUT/'plan.json',plan);print('Frozen',len(hashes),'fingerprints;',len(jobs),'pairs')
def measure(stage=''):
    folder=OUT/stage;plan=json.loads((folder/'plan.json').read_text());verify(plan)
    env=dict(os.environ,JULIA_DEPOT_PATH=str(DEP/'depot'),JULIA_NUM_THREADS='1',OPENBLAS_NUM_THREADS='1')
    with (folder/'measure.log').open('x') as f:
        subprocess.run([str(JULIA),'--startup-file=no','--project='+str(DEP/'env'),str(ROOT/'bench/hadamag_native.jl'),'measure',str(folder/'plan.json'),str(folder/'raw.jsonl')],cwd=ROOT,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
    verify(plan)
def analyze(stage=''):
    folder=OUT/stage;plan=json.loads((folder/'plan.json').read_text());verify(plan)
    rows=[json.loads(s) for s in (folder/'raw.jsonl').read_text().splitlines()];summaries=[]
    for job in plan['jobs']:
        rs=[r for r in rows if all(r[k]==v for k,v in job.items())]
        assert len(rs)==4*plan['quartets']
        for t in range(plan['quartets']):
            q=rs[4*t:4*t+4]
            assert [r['engine'] for r in q]==[int((i in (1,2))^bool(t&1)) for i in range(4)]
            assert all(r['trial']==t and r['step']==i for i,r in enumerate(q))
            assert len({r['reps'] for r in q})==1
        summaries.append(dict(**job,wall=summarize(rs),cpu=summarize(rs,metric='cpu_ns_per_op')))
    assert len(rows)==len(plan['jobs'])*plan['quartets']*4
    eligible=[]
    for case in sorted({r['case'] for r in summaries}):
        for v in ('h4','h8','h4i','h8i'):
            ss=[r for r in summaries if r['case']==case and r['candidate']==v]
            if len(ss)==len(BASELINES) and all(r[m]['ci95_low_pct']>0 for r in ss for m in ('cpu','wall')):
                eligible.append(dict(case=case,candidate=v))
    save(folder/'summary.json',dict(results=summaries,eligible=eligible))
    save(folder/'audit.json',dict(status='PASS',fingerprints=len(plan['sha256']),timed_batches=len(rows),pairs=len(plan['jobs']),quartets=plan['quartets'],raw_sha256=sha(folder/'raw.jsonl')))
    for r in sorted(summaries,key=lambda r:(r['case'],r['candidate'],r['baseline'])):
        w=r['wall'];print(r['case'],r['baseline'],'->',r['candidate'],f"{w['reduction_pct']:+.2f}% [{w['ci95_low_pct']:+.2f}, {w['ci95_high_pct']:+.2f}]")
    print('ELIGIBLE',eligible)
def confirm():
    d=json.loads((OUT/'summary.json').read_text());assert d['eligible']
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    jobs=[dict(**e,baseline=b) for e in d['eligible'] for b in BASELINES]
    jobs += [dict(case=c,baseline='r8',candidate='r8') for c in sorted({e['case'] for e in d['eligible']})]
    random.Random(78124).shuffle(jobs)
    plan.update(jobs=jobs,quartets=24,batch_ms=20)
    for p in OUT.iterdir():
        if p.is_file():plan['sha256'][str(p)]=sha(p)
    folder=OUT/'confirmation';folder.mkdir(exist_ok=False);save(folder/'plan.json',plan)
if __name__=='__main__':
    cmd=sys.argv[1];stage=sys.argv[2] if len(sys.argv)>2 else ''
    if cmd=='freeze':freeze()
    elif cmd=='measure':measure(stage)
    elif cmd=='analyze':analyze(stage)
    elif cmd=='confirm':confirm()
    else:raise ValueError(cmd)
