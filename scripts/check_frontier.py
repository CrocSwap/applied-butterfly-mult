#!/usr/bin/env python3
"""Recompute the project plan's three lead results from committed raw samples.

Needs no build, no .deps/ and no sibling repository; writes no files.
Prints one JSON object and exits nonzero unless every check passes.
"""
import sys;sys.dont_write_bytecode=True
from collections import defaultdict
import hashlib
import json
import math
from pathlib import Path
import re
import statistics
# Pure estimators: the confirmation analysis and per-case bootstrap actually used.
from analyze_experiments import logs,aggregate
from compare import summarize

ROOT=Path(__file__).resolve().parents[1]
checks=[]


def text(p):return re.sub(r'\s+',' ',(ROOT/p).read_text())
def read(p):return json.loads((ROOT/p).read_text())
def jsonl(p):return [json.loads(s) for s in (ROOT/p).read_text().splitlines() if s.strip()]
def sha(p):return hashlib.sha256((ROOT/p).read_bytes()).hexdigest()
def f2(x):return f'{x:.2f}'


def recorded(path,manifests):
    """Digests that committed manifests record for path (keys may be absolute)."""
    found={}
    for m in manifests:
        def walk(v):
            if isinstance(v,dict):
                for k,x in v.items():
                    if isinstance(x,str) and (k==path or k.endswith('/'+path)):found[m]=x
                    else:walk(x)
            elif isinstance(v,list):
                for x in v:walk(x)
        walk(read(m))
    return found


def verify_hash(path,manifests):
    found=recorded(path,manifests);digest=sha(path)
    assert found and set(found.values())=={digest},(path,found,digest)
    return f'{path} sha256 {digest[:12]} matches {len(found)} manifests'


def check(id,documented,recomputed,source,docs,extra=True):
    # The documented string must still appear in the cited docs (whitespace-normalized).
    quoted=all(s in text(d) for d,s in docs)
    checks.append(dict(id=id,documented=documented,recomputed=recomputed,
        ok=bool(quoted and extra and documented==recomputed),source=source))


def section(name,fn):
    try:fn()
    except Exception as e:
        checks.append(dict(id=name,documented=None,recomputed=f'{type(e).__name__}: {e}',ok=False,source='exception'))


def estimate(rows,metric):
    """Point estimate of compare.summarize without its bootstrap."""
    q=defaultdict(lambda:{0:[],1:[]})
    for r in rows:q[r['trial']][r['engine']].append(r[metric])
    x=[math.log(statistics.mean(v[0])/statistics.mean(v[1])) for _,v in sorted(q.items())]
    return 100*(1-math.exp(-statistics.mean(x)))


def c3():
    plan=read('experiments/c3-confirmation-plan.json');lo,hi=plan['primary_interval_limbs']
    committed={r['run']:r for r in read('results/confirmation-analysis.json')}
    for run,doc in [(1,'2.99% [1.94, 4.11]'),(2,'2.91% [2.02, 3.74]')]:
        name=f'c3-register-confirm-{run}';path=f'results/{name}/raw.jsonl'
        groups=defaultdict(list)
        for r in jsonl(path):groups[(r['an'],r['bn'],r['operation'])].append(r)
        series=[logs(c,'ns_per_op') for (an,bn,op),c in sorted(groups.items()) if op=='sqr' and lo<=an<=hi]
        a=aggregate(series);old=committed[name]['metrics']['wall']['sqr']
        same=a['cases']==9 and all(abs(a[k]-old[k])<1e-9 for k in ('reduction_pct','ci95_low_pct','ci95_high_pct'))
        got=f"{f2(a['reduction_pct'])}% [{f2(a['ci95_low_pct'])}, {f2(a['ci95_high_pct'])}]"
        check(f'c3_sqr_wall_run{run}',doc,got,
            f'{path} ({len(series)} sqr sizes in [{lo},{hi}] limbs, analyze_experiments.aggregate seed 87319); '
            f'equals results/confirmation-analysis.json to 1e-9: {same}',
            [('docs/experiments-m2.md',f"**{doc}**"),('docs/project-plan.md','Approximately 3% complete squaring wall-time reduction in two confirmation runs')],same)


def poly():
    runs={}
    notes=[]
    for name in ('poly-prepared-confirm','poly-prepared-repeat'):
        path=f'results/{name}/raw.jsonl'
        notes.append(verify_hash(path,['results/poly-prepared-audit.json']))
        cases=defaultdict(list)
        for r in jsonl(path):
            if r['phase']=='warm':cases[(r['dim'],r['length'],r['modulus'],r['window'])].append(r)
        assert len(cases)==32
        runs[name]={k:dict(cpu=summarize(v,metric='cpu_ns_per_op'),wall=summarize(v)) for k,v in cases.items()}
    a,b=runs.values();assert set(a)==set(b)
    active=[k for k in a if k[0]>=4]
    cpu=[r[k]['cpu']['reduction_pct'] for r in (a,b) for k in active]
    pos=lambda m:sum(min(a[k][m]['ci95_low_pct'],b[k][m]['ci95_low_pct'])>0 for k in active)
    src='; '.join(notes)+'; compare.summarize seed 67341 on warm quartets'
    docs=[('docs/prepared-inputs-m2.md','reductions ranged from **4.34% to 15.09%**'),
          ('docs/project-plan.md','CPU reductions 4.34–15.09% across all 30 eligible tested cases')]
    check('poly_prepared_cpu_range_active','4.34–15.09% over 30 active cases',
          f'{f2(min(cpu))}–{f2(max(cpu))}% over {len(active)} active cases',src,docs)
    docs=[('docs/prepared-inputs-m2.md','All 30 active workloads had positive CPU and wall-time confidence intervals in both confirmation runs')]
    check('poly_prepared_positive_intervals_both_runs','cpu 30/30, wall 30/30',
          f"cpu {pos('cpu')}/{len(active)}, wall {pos('wall')}/{len(active)}",src,docs)


def theta_raw(dest,manifests):
    raw=jsonl(f'{dest}/raw.jsonl');summary=read(f'{dest}/summary.json')
    assert summary['raw_sha256']==sha(f'{dest}/raw.jsonl'),dest
    note=verify_hash(f'{dest}/summary.json',manifests)
    assert len(raw)==len(summary['results'])
    for r,s in zip(raw,summary['results']):
        assert {k:r[k] for k in ('case','base','candidate')}=={k:s[k] for k in ('case','base','candidate')}
        r['cpu']=estimate(r['rows'],'cpu_ns_per_op')
        assert abs(r['cpu']-s['cpu']['reduction_pct'])<1e-9
    return raw,f'{dest}/raw.jsonl (sha256 = summary raw_sha256); {note}; point estimates equal summary to 1e-9'


def theta_batch():
    raw,src=theta_raw('results/theta-batch/confirmation',['results/theta-batch/audit.json','results/theta-batch/completion.json','results/theta-replay/plan.json'])
    got=[];doc=[]
    for nb,d in [(1,'3.65'),(4,'4.92'),(16,'5.84')]:
        sel=[r['cpu'] for r in raw if r['base']=='original' and r['case']['g']>1 and not r['case'].get('same') and r['case']['nb']==nb]
        assert len(sel)==8,(nb,len(sel))
        got.append(f2(statistics.median(sel)));doc.append(d)
    check('theta_batch_median_cpu_vs_original_nb1_4_16','/'.join(doc)+'%','/'.join(got)+'%',
          src+'; median over 8 genus-2/3 cases per batch size, base=original',
          [('docs/theta-batch.md','| 1 | 1.80% | 3.65% |'),('docs/theta-batch.md','| 4 | 2.65% | 4.92% |'),
           ('docs/theta-batch.md','| 16 | 3.05% | 5.84% |'),('docs/project-plan.md','median CPU reductions 3.65–5.84%')])


def theta_equal():
    raw,src=theta_raw('results/theta-equal/confirmation',['results/theta-equal/audit.json','results/hadamag-native/completion.json','results/theta-replay/plan.json'])
    got=[];doc=[];docs=[('docs/project-plan.md','genus-group medians 4.38–9.13% versus original FLINT')]
    for g,d in [(2,'4.38'),(3,'5.27'),(4,'6.60'),(6,'9.13')]:
        sel=[r['cpu'] for r in raw if r['base']=='original' and r['case']['group']=='squared_constants' and r['case']['g']==g]
        assert len(sel)==2,(g,len(sel))
        got.append(f'g{g} {f2(statistics.median(sel))}%');doc.append(f'g{g} {d}%')
        docs.append(('docs/theta-equal.md',f'% | {d}% |'))
    check('theta_equal_squared_constants_median_cpu_vs_original_by_genus',', '.join(doc),', '.join(got),
          src+'; median over 2 fixtures per genus, base=original, group=squared_constants',docs)


def main():
    for name,fn in [('c3',c3),('poly',poly),('theta_batch',theta_batch),('theta_equal',theta_equal)]:section(name,fn)
    ok=bool(checks) and all(c['ok'] for c in checks)
    print(json.dumps(dict(status='PASS' if ok else 'FAIL',checks=checks,not_checked=[
        'Re-derives statistics from committed raw timing samples only; nothing is re-timed or re-run.',
        'Does not check build fingerprints, patches, libraries or binaries (.deps/, build/ are not used).',
        'Does not establish the results on other hardware, OS or compiler versions; all samples come from one Apple M2.',
        'Does not re-run correctness/validation tests or FLINT upstream tests.',
        'C3 raw.jsonl hashes are recorded in no committed manifest; their integrity rests on git history (recomputation does match results/confirmation-analysis.json).',
        'Theta checks recompute point estimates and medians only, not per-case bootstrap intervals or the documented incremental (versus current patch) figures.',
        'Sample provenance (that raw files were produced by the described protocol) is assumed, not verified.']),indent=1))
    sys.exit(0 if ok else 1)


if __name__=='__main__':main()
