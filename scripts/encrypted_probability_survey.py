#!/usr/bin/env python3
"""Bounded source/contract screen; query tracing is not a performance benchmark."""
import sys
sys.dont_write_bytecode = True
import argparse
from collections import Counter, defaultdict
import hashlib
import itertools
import json
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'results/encrypted-probability-survey'
SRC = OUT / 'sources/gibby'
def save(p, obj):
    with p.open('x') as f:
        json.dump(obj, f, indent=2); f.write('\n')
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def blobs():
    specs = json.loads((OUT/'source-blobs.json').read_text())
    specs += json.loads((OUT/'gibby-sources.json').read_text())['files']
    specs += json.loads((OUT/'gibby-runtime-sources.json').read_text())
    last = json.loads((OUT/'post-counts-blob.json').read_text())
    specs += [dict(id='gibby', path=last['path'], git_blob_sha=last['sha'])]
    for s in specs:
        p = OUT/'sources'/s['id']/s['path']; b = p.read_bytes()
        h = hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()
        assert h == s['git_blob_sha'], str(p)
    return len(specs)

TRACE = r'''
// Diagnostic only: writes immutable inputs, consumes no RNG, changes no arithmetic.
template<class T>
void survey_trace(const void* key, int id, int n, int m, const vsw<T>& s,
                  const vint& Lv, const vint& Uv, bool with_base) {
    static std::map<const void*, int> ids;
    static std::ofstream out("queries.tsv");
    auto p = ids.emplace(key, ids.size());
    int tid = p.first->second;
    if (p.second) {
        out << "T\t" << tid << '\t' << id << '\t' << n << '\t' << m << '\n';
        for (int j=0; j<m; ++j) {
            auto weight = s[j].weight;
            out << "W\t" << tid << '\t' << s[j].set.to_ullong() << '\t'
                << std::setprecision(17) << weight.get_log() << '\n';
        }
    }
    auto L=make_bitset<T>(Lv), U=make_bitset<T>(Uv);
    out << "Q\t" << tid << '\t' << L.to_ullong() << '\t' << U.to_ullong()
        << '\t' << with_base << '\n';
}
'''
def prepare():
    count = blobs()
    work = OUT/'instrumented'; shutil.copytree(SRC, work)
    p=work/'src/RangeSums.hpp'; s=p.read_text()
    marker='class RangeSums {'; assert s.count(marker)==1
    s=s.replace(marker,TRACE+'\n'+marker)
    for base in (False,True):
        sig='template<class T> double RangeSums::scansum(const vsw<T>& s, const vint& Lv, const vint& Uv'+(', double bsum' if base else '')+'){' 
        assert s.count(sig)==1
        s=s.replace(sig,sig+'\n\tsurvey_trace(this, id, n, nsorted, s, Lv, Uv, '+('true' if base else 'false')+');')
    p.write_text(s)
    commands=[]
    for name,source in [('original',SRC),('trace',work)]:
        cmd=['clang++','-std=c++17','-O2',str(source/'gibby.cpp'),'-o',str(OUT/name)]
        commands.append(cmd)
        with (OUT/f'build-{name}.log').open('x') as f:
            subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
    freeze()
def freeze():
    count=blobs()
    commands=[['clang++','-std=c++17','-O2',str(source/'gibby.cpp'),'-o',str(OUT/name)]
              for name,source in [('original',SRC),('trace',OUT/'instrumented')]]
    assert (OUT/'original').exists() and (OUT/'trace').exists()
    plan=dict(source_blobs=count,commands=commands,
              cases=[dict(data=d,pruning=p,seed=81009) for d in ['asia1k','sachs1k'] for p in [0,2]],
              args=['-iter','20','-burnin','2','-FBM','100','-REV','20','-MBR','10','-a','15'],
              contract='Unrestricted indegree, all parents eligible; explicit fair prior inherited from source default. Native pruning 0/2; no two-parent truncation. Public benchmark data; short traces not posterior convergence or timing measurements.',
              sha256={str(p):sha(p) for p in OUT.rglob('*') if p.is_file()})
    save(OUT/'trace-plan.json',plan)
    print(json.dumps(dict(prepared=True,blobs=count)))
def run():
    plan=json.loads((OUT/'trace-plan.json').read_text())
    for p,h in plan['sha256'].items(): assert sha(p)==h,p
    for c in plan['cases']:
        for engine in ['original','trace']:
            dest=OUT/'runs'/f"{c['data']}-p{c['pruning']}"/engine
            dest.mkdir(parents=True,exist_ok=False)
            cmd=[str(OUT/engine),str(SRC/'data'/f"{c['data']}.dat"),*plan['args'],
                 '-P',str(c['pruning']),'-R',str(c['seed'])]
            with (dest/'run.log').open('x') as f:
                r=subprocess.run(cmd,cwd=dest,stdout=f,stderr=subprocess.STDOUT,timeout=120)
            assert r.returncode==0,(c,engine,r.returncode)
            print(json.dumps(dict(case=c,engine=engine,status='done')),flush=True)
def analyze():
    results=[]
    for case in json.loads((OUT/'trace-plan.json').read_text())['cases']:
        dest=OUT/'runs'/f"{case['data']}-p{case['pruning']}"
        # Trace logging must preserve the sampled path and reported scores literally.
        identical=[]
        for p in (dest/'original/results').glob('*'):
            other=dest/'trace/results'/p.name
            if '_dags_' in p.name or '_scores_' in p.name:
                assert p.read_bytes()==other.read_bytes(),p.name
                identical.append(p.name)
        assert len(identical)==2
        tables={};queries=[]
        for line in (dest/'trace/queries.tsv').read_text().splitlines():
            fields=line.split('\t'); tag=fields.pop(0)
            if tag=='T':
                tid,node,n,m=map(int,fields);tables[tid]=dict(node=node,n=n,m=m,weights=[])
            elif tag=='W':
                tid,mask=int(fields[0]),int(fields[1]);tables[tid]['weights'].append((mask,float(fields[2])))
            else:
                assert tag=='Q';queries.append(tuple(map(int,fields)))
        hist=Counter();candidate=0;nonempty=0;large_queries=0;bygroup=defaultdict(set)
        total_queries=len(queries)
        for tid,L,U,base in queries:
            t=tables[tid]
            if not t['m']:continue
            nonempty+=1
            support=0
            for mask,_ in t['weights']:support|=mask
            excluded=(support & ~U).bit_count()
            accepted=[m for m,w in t['weights'] if m & ~U==0 and (not L or m&L)]
            large=any(m.bit_count()>2 for m in accepted)
            large_queries+=large
            hist[(excluded,L.bit_count())]+=1
            # Conservative whole-table condition: includes all retained nonzero weights.
            pair_table=all(m.bit_count()<=2 for m,w in t['weights'])
            if excluded==2 and pair_table:
                candidate+=1;bygroup[(tid,L)].add(support&~U)
        results.append(dict(case=case,output_files_identical=identical,total_queries=total_queries,
             nonempty_table_queries=nonempty,queries_accepting_higher_than_pairs=large_queries,
             exact_pair_table_two_exclusion_queries=candidate,
             candidate_distinct_queries_by_fixed_table_and_L=[dict(table=k[0],L=k[1],distinct=len(v)) for k,v in bygroup.items()],
             tables=[dict(id=k,node=t['node'],n=t['n'],rows=t['m'],max_arity=max((m.bit_count() for m,w in t['weights']),default=0)) for k,t in tables.items()],
             query_shape_histogram=[dict(excluded=e,required_size=l,count=v) for (e,l),v in sorted(hist.items())]))
    save(OUT/'trace-summary.json',results)
    print(json.dumps([{k:v for k,v in r.items() if k not in ('tables','query_shape_histogram','candidate_distinct_queries_by_fixed_table_and_L')} for r in results],indent=2))

if __name__=='__main__':
    a=argparse.ArgumentParser();a.add_argument('stage',choices=['prepare','freeze','run','analyze']);args=a.parse_args()
    globals()[args.stage]()
