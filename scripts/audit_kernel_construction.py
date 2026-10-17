#!/usr/bin/env python3
"""Independently evaluate saved sum circuits against dense DFT formulas."""
import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def read(path): return json.loads(Path(path).read_text())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--screen',type=Path,required=True)
    args = parser.parse_args()
    dest = args.screen.resolve()
    output = dest/'audit.json'
    assert not output.exists()
    summary = read(dest/'summary.json')
    frozen = {**summary['frozen_sha256'],**summary['sha256']}
    # Follow prior hard-instance audit evidence down to measured artifacts.
    for rel in ('run/validation.json','run/summary.json','fallback-checks/summary.json'):
        doc = read(ROOT/'results/theory-paths-hard'/rel)
        frozen.update(doc.get('sha256',{}))
        frozen.update(doc.get('frozen_sha256',{}))
    for path,h in frozen.items(): assert sha(ROOT/path)==h,path
    raw = [json.loads(line) for line in
           (ROOT/'results/phase-fusion-screen/raw.jsonl').read_text().splitlines()]
    twiddles = {r['p']:r['values'] for r in raw if r['kind']=='twiddles'}
    original = {(r['p'],1 << r['k'],r['j'],r['inverse']):r['columns']
                for r in raw if r['kind']=='matrix'}
    expected_rows = {(r['p'],r['length'],r['j'],r['inverse'],r['policy'],r['interner']):r
                     for r in summary['rows']}
    seen = set()
    entries = 0
    artifacts = sorted(dest.glob('circuit-*.json'))
    for path in artifacts:
        c = read(path)
        p,n,j,inv = [c[key] for key in ('p','length','j','inverse')]
        key = (p,n,j,inv,c['policy'],c['interner'])
        assert key not in seen
        seen.add(key)
        assert all(c[k]==expected_rows[key][k] for k in expected_rows[key])
        atoms = c['atoms']
        gates = {node:(a,b) for node,a,b in c['gates']}
        assert len(gates)==len(c['gates'])
        active = set()
        todo = c['outputs'][:]
        while todo:
            node = todo.pop()
            if node in active: continue
            active.add(node)
            if node in gates: todo.extend(gates[node])
            else: assert 1 <= node <= len(atoms)
        assert set(gates) <= active
        points = [((-1 if t&1 else 1)*twiddles[p][(j*n+t)//2]) % p for t in range(n)]
        perm = lambda t: (t & ~15) | ((t & 3) << 2) | ((t & 15) >> 2)
        for column in range(n):
            values = {i+1:(coef if col==column else 0) for i,(col,coef) in enumerate(atoms)}
            for node,a,b in c['gates']:
                assert node > max(len(atoms),a,b) and node not in values
                values[node] = (values[a]+values[b]) % p
            answer = [values[node] for node in c['outputs']]
            if inv:
                expected = [pow(points[perm(column)],-r,p) for r in range(n)]
            else:
                expected = [0]*n
                for r,point in enumerate(points): expected[perm(r)] = pow(point,column,p)
            assert answer == expected == original[p,n,j,inv][column]
            entries += n
        scalars = [atoms[node-1][1] for node in active if node not in gates]
        counts = dict(add_sub=len(gates),nontrivial_mul=sum(x not in (1,p-1) for x in scalars),
                      neg=sum(x==p-1 for x in scalars),matrix_entries=n*n)
        assert counts == c['counts']
        assert counts['add_sub'] > c['baseline']['add_sub']
        assert counts['nontrivial_mul'] > c['baseline']['nontrivial_mul']
        assert not c['promoted']
    assert seen == set(expected_rows)
    assert entries == summary['matrix_entries_checked']
    assert all(r['additions_saved']==0 for r in summary['ablations'])
    for path,h in frozen.items(): assert sha(ROOT/path)==h,path
    paths = [Path(__file__).resolve(),dest/'summary.json',dest/'plan.json',*artifacts]
    report = dict(status='PASS',circuits=len(artifacts),matrix_entries_checked=entries,
        independent_dense_formula=True,original_flint_probe_match=True,
        all_circuits_use_more_additions_and_multiplications=True,
        support_interning_savings=0,frozen_fingerprints_checked=len(frozen),
        sha256={str(path):sha(path) for path in paths})
    output.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='sha256'},indent=2))


if __name__ == '__main__': main()
