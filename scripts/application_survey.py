#!/usr/bin/env python3
"""Freeze and run a bounded application profile; this does not benchmark a new circuit."""
import json,os,subprocess,statistics,sys,urllib.request
from pathlib import Path
from qualify_theory_paths_hard import ROOT,sha,save
OUT=ROOT/'results/application-survey'
DEP=ROOT/'.deps/application-survey'
JULIA=DEP/'julia-1.10.10/bin/julia'
def verify(plan):
    for p,h in plan['sha256'].items():assert sha(ROOT/p)==h,p
def prepare():
    sources={
      'hadamag-paper.html':'https://arxiv.org/html/2601.07824v3',
      'clustering-paper.pdf':'https://arxiv.org/pdf/1310.1034',
      'subset-fft.html':'https://arxiv.org/html/2404.18522v1',
      'dpconv-paper.html':'https://arxiv.org/html/2409.08013v1'}
    (OUT/'sources').mkdir(exist_ok=False)
    for name,url in sources.items():urllib.request.urlretrieve(url,OUT/'sources'/name)
    commits={name:subprocess.check_output(['git','-C',str(ROOT/'.deps'/name),'rev-parse','HEAD'],text=True).strip() for name in ('hadamag-survey','dpconv-survey')}
    save(OUT/'sources.json',dict(urls=sources,commits=commits))
    frozen={}
    for name in ('plan.json','confirmation/plan.json','completion.json'):
        p=ROOT/'results/theta-workspace'/name;d=json.loads(p.read_text());frozen.update(d['sha256']);frozen[str(p)]=sha(p)
    files=[Path(__file__).resolve(),ROOT/'bench/hadamag_profile.jl',JULIA,DEP/'env/Project.toml',DEP/'env/Manifest.toml']
    files += [p for p in OUT.rglob('*') if p.is_file()]
    for repo in ('hadamag-survey','dpconv-survey'):
        files += [p for part in ('src','docs') for p in (ROOT/'.deps'/repo/part).rglob('*') if p.is_file()]
        files += [ROOT/'.deps'/repo/'README.md',ROOT/'.deps'/repo/'LICENSE']
    for p in files:frozen[str(p)]=sha(p)
    plan=dict(sha256=frozen,commits=commits,cases=json.loads((OUT/'cases.json').read_text()),
       question='Do real application workloads spend a substantial fraction in WHT, and is multiprecision scientifically required?',
       scope='Unmodified pinned HadaMAG CPU serial backend, one Julia and BLAS thread, Apple M2. Six full SRE2 calls at 10/12/14 qubits and two Monte Carlo calls at 16, brick-wall random-circuit depths 2/8. Fixed inputs and MC seed.',
       method='Warm both original and timed-wrapper FHT. Five ABBA/BAAB quartets; exact output identity for every call. Trace all transforms. Cross-check with >=1.5s of uninstrumented Julia sampling at 1ms. State generation and compilation excluded; public API allocation included.',
       limits='Profiling fractions, not speedup estimates. Float64, pure Julia fallback on ARM; x86 FFHT/GPU/MPI not measured. Sampling may include runtime/GC; timer wrappers perturb timing. MC uses Nbeta13/Nsamples256 only to profile, not to validate estimator accuracy.',
       gates='>=20% transform share supports a bounded native-precision kernel experiment; does not justify raising precision. Multiprecision route needs separate application evidence. Reject a candidate at source inspection if its operator or arithmetic contract is unsuitable.')
    verify(plan);save(OUT/'plan.json',plan);print('Prepared profile plan',len(frozen),'fingerprints')
def measure():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    env=dict(os.environ,JULIA_DEPOT_PATH=str(DEP/'depot'),JULIA_NUM_THREADS='1',OPENBLAS_NUM_THREADS='1')
    with (OUT/'measure.log').open('x') as f:
        subprocess.run([str(JULIA),'--startup-file=no','--project='+str(DEP/'env'),str(ROOT/'bench/hadamag_profile.jl'),'measure'],env=env,cwd=ROOT,stdout=f,stderr=subprocess.STDOUT,check=True)
    verify(plan)
def analyze():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    raw=[json.loads(s) for s in (OUT/'profile-raw.jsonl').read_text().splitlines()]
    assert [r['case'] for r in raw]==plan['cases']
    results=[]
    for r in raw:
        rows=r['rows'];assert len(rows)==20
        for t in range(5):
            q=rows[4*t:4*t+4]
            assert [x['instrumented'] for x in q]==[(i in (1,2))^bool(t&1) for i in range(4)]
            assert all(x['answer']==r['answer'] for x in q)
        b=[x for x in rows if not x['instrumented']];v=[x for x in rows if x['instrumented']]
        fractions=[x['fht_ns']/x['wall_ns'] for x in v]
        result=dict(case=r['case'],answer=r['answer'],allocated_bytes=r['allocated_bytes'],
            full_wall_ms=statistics.median(x['wall_ns'] for x in b)/1e6,
            full_cpu_ms=statistics.median(x['cpu_ns'] for x in b)/1e6,
            transform_fraction_median=statistics.median(fractions),transform_fraction_range=[min(fractions),max(fractions)],
            instrumentation_overhead_pct=100*(statistics.median(x['wall_ns'] for x in v)/statistics.median(x['wall_ns'] for x in b)-1),
            transforms_per_call=v[0]['fht_calls'],sampling=r['sampling'])
        results.append(result)
        print(r['case']['id'],round(result['full_wall_ms'],2),'ms; FHT',round(100*result['transform_fraction_median'],2),'%; sampled',round(100*r['sampling']['fht_fraction'],2),'%; overhead',round(result['instrumentation_overhead_pct'],2))
    save(OUT/'summary.json',dict(results=results,raw_sha256=sha(OUT/'profile-raw.jsonl')))
    save(OUT/'audit.json',dict(status='PASS',fingerprints=len(plan['sha256']),cases=len(raw),timed_calls=len(raw)*20,all_instrumented_outputs_identical=True))
if __name__=='__main__':{'prepare':prepare,'measure':measure,'analyze':analyze}[sys.argv[1]]()
