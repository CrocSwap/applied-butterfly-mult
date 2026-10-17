#!/usr/bin/env python3
"""Independent NetworkX oracle and separate, untimed search-work trace.

Run using .deps/theory-paths-qualification-venv/bin/python with NetworkX 3.4.2.
The trace binary is never used for performance claims.
"""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import networkx as nx
import networkx.algorithms.simple_paths as simple_paths

ROOT=Path(__file__).resolve().parents[1]
MASK=(1<<64)-1
NEG=-(1<<61)  # INT64_MIN / 4, as in the C implementation.


def graph(N,seed,kind):
    state=seed
    def rand():
        nonlocal state
        state^=(state<<13)&MASK;state^=state>>7;state^=(state<<17)&MASK
        return state
    g=nx.DiGraph();g.add_nodes_from(range(N))
    for a in range(N):
        for b in range(N):
            weight=0 if kind==0 else rand()%2001-1000 if kind==1 else rand()%5-2
            absent=a==b or kind==4 or (kind==3 and rand()%3!=0)
            if not absent:g.add_edge(a,b,weight=weight)
    return g


def main():
    assert nx.__version__=='3.4.2'
    dest=ROOT/'results/theory-paths-bnb-validation';dest.mkdir(exist_ok=False)
    source=ROOT/'bench/theory_paths_bnb.c'
    traced=source.read_text().replace('typedef struct {',
        'static uint64_t traced_visits, traced_budget; static int traced_fallback;\ntypedef struct {',1)
    traced=traced.replace('search(&s,0,6,0);',
        'search(&s,0,6,0); traced_visits=s.visits; traced_budget=s.budget; traced_fallback=s.exhausted;')
    traced=traced.replace('int main(int argc,char **argv)', 'int measured_main(int argc,char **argv)')
    traced+='''
int main(int argc,char **argv) {
    int status=measured_main(argc,argv);
    fprintf(stderr,"{\\"visits\\":%" PRIu64 ",\\"budget\\":%" PRIu64 ",\\"fallback\\":%d}\\n",
        traced_visits,traced_budget,traced_fallback);
    return status;
}
'''
    cfile=dest/'trace.c';cfile.write_text(traced);binary=dest/'trace'
    command=['clang','-std=gnu23','-O3','-g','-mcpu=apple-m2','-I',str(ROOT/'bench'),str(cfile),'-o',str(binary)]
    subprocess.run(command,check=True)
    def run(N,seed,kind,method):
        folder=ROOT/'results'/('theory-paths-confirm' if N-3 in (8,12,16,20,24) else 'theory-paths-screen')
        plan=folder/f'paired-{N-3}.bin'
        p=subprocess.run([str(binary),str(plan),str(plan),str(kind),str(method),'1','1'],
            env={**os.environ,'BF_PATH_SEED':str(seed)},check=True,capture_output=True,text=True)
        rows=[json.loads(s) for s in p.stdout.splitlines()]
        assert len(rows)==4 and len({(r['weight'],r['count']) for r in rows})==1
        return (rows[0]['weight'],rows[0]['count']),json.loads(p.stderr)
    checks=[]
    for N in range(7,12):
        for seed in (2700019,4300039):
            for kind in range(5):
                g=graph(N,seed,kind);best=NEG;count=0;paths=0
                for path in nx.all_simple_paths(g,0,N-1,cutoff=6):
                    if len(path)!=7:continue
                    paths+=1
                    weight=sum(g[a][b]['weight'] for a,b in zip(path,path[1:]))
                    if weight>best:best=weight;count=1
                    elif weight==best:count+=1
                for method in (1,2):
                    actual,trace=run(N,seed,kind,method)
                    assert actual==(best,count),(N,seed,kind,method,actual,(best,count))
                    checks.append({'vertices':N,'seed':seed,'kind':kind,'method':method,
                        'six_edge_paths_enumerated':paths,'optimum':best,'count':count,**trace})
    performance=json.loads((ROOT/'results/theory-paths-bnb/summary.json').read_text())
    traces=[]
    for case in performance['summaries']:
        N=case['vertices'];seed=case['seed'];method=int(case['baseline'][-1])
        answer,trace=run(N,seed,1,method)
        traces.append({'vertices':N,'seed':seed,'method':method,'answer':answer,**trace})
    files=[source,ROOT/'bench/theory_paths_control.c',Path(__file__).resolve(),cfile,binary,
           Path(simple_paths.__file__),Path(nx.__file__),ROOT/'results/theory-paths-bnb/summary.json']
    report={'status':'PASS','networkx_version':nx.__version__,'python':sys.version,'compile':command,
        'oracle_checks':checks,'performance_traces':traces,'scope':'Untimed validation and trace only',
        'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    (dest/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print('PASS',len(checks),'NetworkX comparisons;',len(traces),'performance-case traces')


if __name__=='__main__':main()
