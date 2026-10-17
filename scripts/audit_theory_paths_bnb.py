#!/usr/bin/env python3
"""Verify the qualification evidence and preserve the earlier result verbatim."""
import hashlib
import json
import math
from pathlib import Path
import statistics

ROOT=Path(__file__).resolve().parents[1]


def hashes(report):
    for p,h in report['sha256'].items():
        assert hashlib.sha256(Path(p).read_bytes()).hexdigest()==h,p
    return len(report['sha256'])


def main():
    output=ROOT/'results/theory-paths-bnb-audit.json';assert not output.exists()
    previous=json.loads((ROOT/'results/theory-transfer-completion.json').read_text())
    count=hashes(previous)
    old_audit=json.loads((ROOT/'results/theory-transfer-audit.json').read_text());count+=hashes(old_audit)
    for folder in ('theory-paths-screen','theory-paths-control','theory-paths-confirm'):
        count+=hashes(json.loads((ROOT/'results'/folder/'summary.json').read_text()))
    report=json.loads((ROOT/'results/theory-paths-bnb/summary.json').read_text());count+=hashes(report)
    validation=json.loads((ROOT/'results/theory-paths-bnb-validation/validation.json').read_text());count+=hashes(validation)
    assert report['status']==validation['status']=='PASS'
    groups={};batches=0
    for line in (ROOT/'results/theory-paths-bnb/raw.jsonl').read_text().splitlines():
        r=json.loads(line);key=(r['vertices'],r['seed'],r['baseline'])
        groups.setdefault(key,[]).append(r);batches+=1
    assert len(groups)==len(report['summaries'])==40
    for s in report['summaries']:
        rows=groups[s['vertices'],s['seed'],s['baseline']]
        assert len(rows)==60 and len({r['reps'] for r in rows})==1
        assert len({(r['weight'],r['count']) for r in rows})==1
        for metric,field in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
            logs=[]
            for trial in range(15):
                rs=[r for r in rows if r['trial']==trial]
                assert [r['step'] for r in rs]==[0,1,2,3]
                assert [r['engine'] for r in rs]==([0,1,1,0] if trial%2==0 else [1,0,0,1])
                means=[statistics.mean(r[field] for r in rs if r['engine']==e) for e in (0,1)]
                assert min(means)>0
                logs.append(math.log(means[0]/means[1]))
            estimate=100*(1-math.exp(-statistics.mean(logs)))
            assert abs(estimate-s[metric]['reduction_pct'])<1e-10
            assert s[metric]['ci95_high_pct']<0
    assert len(validation['oracle_checks'])==100
    assert len(validation['performance_traces'])==40
    assert all(not r['fallback'] for r in validation['performance_traces'])
    for r in validation['performance_traces']:
        rows=groups[r['vertices'],r['seed'],f"bnb_{r['method']}"]
        assert r['answer']==[rows[0]['weight'],rows[0]['count']]
    baseline=ROOT/'.deps/flint/libflint.25.0.dylib'
    assert hashlib.sha256(baseline.read_bytes()).hexdigest()=='31b9d75a502a408098b37990830d1f033a55fc5957e22ebf12cdaeb2a0fafe58'
    table=[]
    for N in (11,15,19,23,27):
        rs=[r for r in report['summaries'] if r['vertices']==N]
        traces=[r for r in validation['performance_traces'] if r['vertices']==N]
        table.append({'vertices':N,'comparisons':len(rs),
            'paired_over_bnb_cpu_ratio_min':min(1-r['cpu']['reduction_pct']/100 for r in rs),
            'paired_over_bnb_cpu_ratio_max':max(1-r['cpu']['reduction_pct']/100 for r in rs),
            'search_visits_min':min(r['visits'] for r in traces),'search_visits_max':max(r['visits'] for r in traces)})
    paths=[Path(__file__).resolve(),ROOT/'results/theory-paths-bnb/summary.json',
        ROOT/'results/theory-paths-bnb-validation/validation.json',ROOT/'results/theory-transfer-completion.json']
    result={'status':'PASS','decision':'Do not promote the six-edge optimum/count application candidate',
        'earlier_artifacts_unchanged':True,'baseline_flint_unchanged':True,'hashes_checked':count,
        'cases':40,'batches':batches,'networkx_checks':100,'table':table,
        'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}
    output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ('table','sha256')}))


if __name__=='__main__':main()
