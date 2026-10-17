#!/usr/bin/env python3
"""Exercise exact fallback and degenerate cases independently of timing."""
import json
from pathlib import Path
import subprocess

from qualify_theory_paths_hard import ROOT, sha, save, write_graph, oracle


def main():
    dest=ROOT/'results/theory-paths-hard/fallback-checks';dest.mkdir(exist_ok=False)
    run=ROOT/'results/theory-paths-hard/run'
    validation=json.loads((run/'validation.json').read_text())
    for p,h in validation['sha256'].items():assert sha(p)==h,p
    checks=[]
    for kind in ('complete_equal','empty','one_six_edge_path'):
        N=11;w=[[None]*N for _ in range(N)]
        if kind=='complete_equal':
            w=[[None if a==b else 0 for b in range(N)] for a in range(N)]
        elif kind=='one_six_edge_path':
            for a,b in zip((0,1,2,3,4,5),(1,2,3,4,5,10)):w[a][b]=-7
        graph=dest/f'{kind}.txt';write_graph(graph,w)
        plans=ROOT/'results/theory-paths-confirm'
        cmd=[str(run/'theory-paths-hard'),
             *[str(plans/f'{name}-8.bin') for name in ('paired','separate_weights','sergeev')],
             str(graph),'0','0','1','1']
        engines=[json.loads(l) for l in subprocess.check_output(cmd,text=True).splitlines()]
        truth=oracle(w)
        assert all((e['weight'],e['count'])==(truth['weight'],truth['count']) for e in engines)
        if kind=='complete_equal':
            assert truth['count']==15120
            assert all(e['fallback']==1 and e['visits']==4*N*N+1 for e in engines if e['engine'] in (4,5))
        else:assert all(not e['fallback'] for e in engines)
        checks.append(dict(kind=kind,oracle=truth,engines=engines))
    paths=[Path(__file__).resolve(),run/'validation.json',run/'theory-paths-hard',*dest.glob('*.txt')]
    result=dict(status='PASS',checks=checks,sha256={str(p):sha(p) for p in paths})
    save(dest/'summary.json',result)
    print(json.dumps({'status':'PASS','cases':len(checks),'engine_comparisons':sum(len(c['engines']) for c in checks),'fallback_paths_exercised':2}))


if __name__=='__main__':main()
