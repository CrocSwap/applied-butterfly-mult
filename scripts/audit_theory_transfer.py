#!/usr/bin/env python3
"""Audit exported operators, hashes, raw quartets and reported point estimates."""
import hashlib
import itertools
import json
import math
from pathlib import Path
import statistics
import struct

ROOT=Path(__file__).resolve().parents[1]


def check_plan(path):
    data=path.read_bytes(); w=struct.unpack('<'+'I'*(len(data)//4),data)
    magic,n,m,nodes=w[:4]
    assert magic==0x42544631 and m==n*(n-1)//2
    assert len(w)==4+2*(nodes-m-1)+m
    supports=[0]+[1<<i for i in range(m)]
    pos=4
    for i in range(m+1,nodes):
        a,b=w[pos:pos+2];pos+=2
        assert a<i and b<i and not supports[a]&supports[b]
        supports.append(supports[a]|supports[b])
    pairs=list(itertools.combinations(range(n),2))
    for (a,b),node in zip(pairs,w[pos:]):
        expected=sum(1<<i for i,p in enumerate(pairs) if a not in p and b not in p)
        assert supports[node]==expected
    return {'path':str(path.relative_to(ROOT)),'n':n,'nodes':nodes,'outputs':m}


def main():
    destination=ROOT/'results/theory-transfer-audit.json'
    assert not destination.exists()
    plans=[];fingerprints=0;batches=0;cases=0;reports={}
    for name in ('theory-paths-screen','theory-paths-control','theory-paths-confirm'):
        directory=ROOT/'results'/name
        report=json.loads((directory/'summary.json').read_text());reports[name]=report
        assert report['status']=='PASS'
        for path,digest in report['sha256'].items():
            assert hashlib.sha256(Path(path).read_bytes()).hexdigest()==digest,path
            fingerprints+=1
        groups={}
        for line in (directory/'raw.jsonl').read_text().splitlines():
            row=json.loads(line)
            key=(row.get('repeat',0),row['vertices'],row.get('kind',1),row.get('seed',20261007),row['baseline'])
            groups.setdefault(key,[]).append(row);batches+=1
        assert len(groups)==len(report['summaries'])
        for summary in report['summaries']:
            key=(summary.get('repeat',0),summary['vertices'],summary.get('kind',1),summary.get('seed',20261007),summary['baseline'])
            rows=groups[key];quartets={}
            assert len({(r['weight'],r['count']) for r in rows})==1
            assert len({r['reps'] for r in rows})==1 and rows[0]['reps']>0
            for r in rows:quartets.setdefault(r['trial'],[]).append(r)
            assert len(quartets)==summary['cpu']['quartets']
            for trial,rs in quartets.items():
                assert [r['step'] for r in rs]==list(range(4))
                assert [r['engine'] for r in rs]==([0,1,1,0] if trial%2==0 else [1,0,0,1])
            for metric,field in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
                logs=[]
                for rs in quartets.values():
                    a=statistics.mean(r[field] for r in rs if r['engine']==0)
                    b=statistics.mean(r[field] for r in rs if r['engine']==1)
                    assert a>0 and b>0
                    logs.append(math.log(a/b))
                estimate=100*(1-math.exp(-statistics.mean(logs)))
                assert abs(estimate-summary[metric]['reduction_pct'])<1e-10
            cases+=1
        plans.extend(check_plan(p) for p in directory.glob('*.bin'))
    exact=json.loads((ROOT/'results/theory-transfer-screen.json').read_text())
    for path,digest in exact['sources'].items():
        assert hashlib.sha256(Path(path).read_bytes()).hexdigest()==digest
        fingerprints+=1
    baseline=ROOT/'.deps/flint/libflint.25.0.dylib'
    assert hashlib.sha256(baseline.read_bytes()).hexdigest()=='31b9d75a502a408098b37990830d1f033a55fc5957e22ebf12cdaeb2a0fafe58'
    confirm=reports['theory-paths-confirm']['summaries']
    table=[]
    for n in (11,15,19,23,27):
        for control in ('sergeev','failure_tree','separate_weights','paired_aa'):
            rs=[r for r in confirm if r['vertices']==n and r['baseline']==control]
            if not rs:continue
            table.append({'vertices':n,'control':control,'comparisons':len(rs),
                **{metric:{'min_pct':min(r[metric]['reduction_pct'] for r in rs),
                           'max_pct':max(r[metric]['reduction_pct'] for r in rs),
                           'positive_intervals':sum(r[metric]['ci95_low_pct']>0 for r in rs),
                           'negative_intervals':sum(r[metric]['ci95_high_pct']<0 for r in rs)}
                   for metric in ('cpu','wall')}})
    files=[ROOT/'results/theory-transfer-screen.json',Path(__file__).resolve(),
           *(ROOT/'results'/name/'summary.json' for name in reports)]
    report={'status':'PASS','fingerprints_checked':fingerprints,'exported_plans':plans,
            'case_runs':cases,'timed_batches':batches,'confirmation_table':table,
            'baseline_flint_library_unchanged':True,
            'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    destination.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k not in ('exported_plans','confirmation_table','sha256')}))


if __name__=='__main__':main()
