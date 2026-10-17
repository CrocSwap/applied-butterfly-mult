#!/usr/bin/env python3
"""Exact, bounded match screen of sister C_v identities against fft_small.

Builds only read-only probes. No FLINT patch, timings, or speedup claim.
Run from the repository root, with a fresh --output directory.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SISTER = ROOT.parent / 'integerMult'
sys.path.insert(0, str(SISTER / 'scripts'))
from audit_sparse_fusion import minimum_words, signature, phase_value


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def eye(n):
    return [[int(a == b) for b in range(n)] for a in range(n)]


def c_apply(x, v, sign, i, p):
    root = i if sign == 1 else pow(i, -1, p)
    a, b = (1 + root) * pow(2, -1, p) % p, (1 - root) * pow(2, -1, p) % p
    return [(a*x[t] + b*x[t ^ v]) % p for t in range(len(x))]


def phase_checks(p, i):
    assert pow(i, 2, p) == p - 1
    words = minimum_words(3)  # Actual sister-project construction, unmodified.
    inv8 = pow(8, -1, p)
    for sig, word in words.items():
        for col in range(8):
            x = [int(t == col) for t in range(8)]
            for v, sign in word:
                x = c_apply(x, v, sign, i, p)
            expected = [sum((-1 if ((row ^ col) & z).bit_count() % 2 else 1)
                            * pow(i, phase_value(3, sig, z), p) for z in range(8)) * inv8 % p
                        for row in range(8)]
            assert x == expected
    for missing in range(1, 8):
        assert signature(3, [(v, 1) for v in range(1, 8) if v != missing]) == signature(3, [(missing, -1)])
        for col in range(8):
            x = [int(t == col) for t in range(8)]
            initial = x[:]
            for v in range(1, 8):
                if v != missing:
                    x = c_apply(x, v, 1, i, p)
            assert x == c_apply(initial, missing, -1, i, p)
    # Verify the required basis changes: C = H diag(1,i) H / 2.
    a, b = (1+i)*pow(2,-1,p) % p, (1-i)*pow(2,-1,p) % p
    for x in ([1, 0], [0, 1]):
        h = [x[0]+x[1], x[0]-x[1]]
        d = [h[0], i*h[1]]
        got = [(d[0]+d[1])*pow(2,-1,p) % p, (d[0]-d[1])*pow(2,-1,p) % p]
        assert got == c_apply(x,1,1,i,p)
    # A retained phase is not compatible with ordinary pointwise multiply.
    e0, e1 = [1,0,0,0,0,0,0,0], [0,1,0,0,0,0,0,0]
    left, right = c_apply(e0,1,1,i,p), c_apply(e1,1,1,i,p)
    bad_product = [x*y % p for x,y in zip(left,right)]
    assert bad_product[0] == pow(2,-1,p) and any(bad_product)
    assert [x*x % p for x in left] != left
    return dict(p=p, fourth_root=i, phase_group_size=len(words),
                full_matrix_entries_checked=len(words)*64,
                six_to_one_identities=7, basis_change_verified=True,
                pointwise_product_counterexample=bad_product,
                pointwise_square_counterexample=True)


def stage(x, k, level, j, tw, p, inverse=False):
    """Source's logical radix-2 layers before the final physical permutation."""
    x = x[:]
    half = 1 << (k-level-1)
    for block in range(1 << level):
        w = tw[(j << level) + block]
        if inverse:
            w = pow(w, -1, p)
        base = block * 2 * half
        for t in range(base, base+half):
            a, b = x[t], x[t+half]
            if inverse:
                x[t], x[t+half] = (a+b) % p, (a-b)*w % p
            else:
                x[t], x[t+half] = (a+w*b) % p, (a-w*b) % p
    return x


def physical(k, t):
    return t if k < 4 else (t & ~15) | ((t & 3) << 2) | ((t & 15) >> 2)


def model_column(k, j, col, tw, p, inverse):
    n = 1 << k
    x = [int(t == col) for t in range(n)]
    if inverse:
        x = [x[physical(k,t)] for t in range(n)]
        for level in reversed(range(k)):
            x = stage(x,k,level,j,tw,p,True)
        return x
    for level in range(k):
        x = stage(x,k,level,j,tw,p)
    out = [0]*n
    for t in range(n):
        out[physical(k,t)] = x[t]
    return out


def nonconstant_witness(x):
    other = next((t for t in range(1,len(x)) if x[t] != x[0]), None)
    assert other is not None, 'Unexpected constant-preserving block: inspect before rejecting'
    return dict(rows=[0,other], row_sums=[x[0],x[other]])


def matrix_checks(rows, tables):
    checked = 0
    records = []
    for row in rows:
        if row['kind'] != 'matrix':
            continue
        p,k,j,inv = (row[key] for key in ('p','k','j','inverse'))
        n = 1 << k
        tw = tables[p]
        columns = row['columns']
        assert len(columns) == n
        points = [((-1 if t & 1 else 1)*tw[(j*n+t)//2]) % p for t in range(n)]
        for col, observed in enumerate(columns):
            assert observed == model_column(k,j,col,tw,p,inv), (p,k,j,inv,col,'layers')
            # An independent dense polynomial evaluation / inverse formula.
            if inv:
                point = points[physical(k,col)]  # permutation is its own inverse
                expected = [pow(point, -t, p) for t in range(n)]
            else:
                expected = [0]*n
                for t,point in enumerate(points):
                    expected[physical(k,t)] = pow(point,col,p)
            assert observed == expected, (p,k,j,inv,col,'dense')
            checked += n
        sums = [sum(columns[c][r] for c in range(n)) % p for r in range(n)]
        records.append(dict(p=p,k=k,j=j,inverse=inv,**nonconstant_witness(sums)))
    return dict(matrices=len(records), entries_checked_against_each_model=checked,
                matching_phase_products=0, rejection_witnesses=records)


def window_checks(tables):
    records = []
    for p,tw in tables.items():
        for k in range(1,9):
            for j in (range(8) if k <= 5 else (0,)):
                for lo in range(k):
                    for hi in range(lo+1,k+1):
                        for inverse in (False, True):
                            x = [1]*(1 << k)
                            levels = range(lo,hi)
                            if inverse:
                                levels = reversed(levels)
                            for level in levels:
                                x = stage(x,k,level,j,tw,p,inverse)
                            records.append(dict(p=p,k=k,j=j,lo=lo,hi=hi,inverse=inverse,
                                                **nonconstant_witness(x)))
    return records


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    dest = args.output.resolve()
    dest.mkdir(parents=True,exist_ok=False)
    baseline = ROOT / '.deps/flint/libflint.25.0.dylib'
    baseline_hash = '31b9d75a502a408098b37990830d1f033a55fc5957e22ebf12cdaeb2a0fafe58'
    assert sha(baseline) == baseline_hash
    # Preserve the latest chain of source, report and earlier measurement hashes.
    old = json.loads((ROOT/'results/bulk-exclusion-screen/checks.json').read_text())
    completion = json.loads((ROOT/'results/bulk-exclusion-screen/completion.json').read_text())
    frozen = {**old['frozen_sha256'], **old['sha256'], **completion['sha256']}
    for p,h in frozen.items():
        assert sha(ROOT / p) == h,p
    inputs = [ROOT/'bench'/name for name in ('phase_probe.c','phase_probe_forward.c','phase_probe_inverse.c')]
    flint_files = [ROOT/'.deps/flint/src'/name for name in
                   ('fft_small/sd_fft.c','fft_small/sd_ifft.c','fft_small/sd_fft_ctx.c',
                    'fft_small/mpn_mul.c','fft_small/op.c','fft_small.h','machine_vectors.h')]
    sister_files = [SISTER/'scripts'/name for name in
                    ('audit_sparse_fusion.py','prepare_layers.py','certify.py','search_network.py')]
    sister_files.append(SISTER/'docs/research/sparse-fusion-audit.md')
    tracked = [*inputs,*flint_files,*sister_files,Path(__file__).resolve(),baseline]
    fingerprints = {str(p):sha(p) for p in tracked}
    command = ['clang','-std=gnu23','-O2','-mcpu=apple-m2',
               '-I'+str(ROOT/'.deps/flint/src'),'-I/opt/homebrew/opt/gmp/include',
               '-I/opt/homebrew/opt/mpfr/include',*map(str,inputs),str(baseline),
               '-L/opt/homebrew/opt/gmp/lib','-L/opt/homebrew/opt/mpfr/lib','-lgmp','-lmpfr',
               '-o',str(dest/'phase-probe')]
    (dest/'plan.json').write_text(json.dumps(dict(compile_command=command,
        scope='Full 2..32-point kernels, j=0..7, two primes; constant-vector probes through 256 points; logical contiguous layer windows',
        decision_gate='A legal exact operator match is required before optimization or timing',
        sha256=fingerprints),indent=2)+'\n')
    run = subprocess.run(command,capture_output=True,text=True)
    (dest/'compile.log').write_text(run.stdout+run.stderr)
    run.check_returncode()
    raw = subprocess.check_output([str(dest/'phase-probe')],text=True)
    (dest/'raw.jsonl').write_text(raw)
    rows = [json.loads(line) for line in raw.splitlines()]
    tables = {r['p']:r['values'] for r in rows if r['kind']=='twiddles'}
    phases = [phase_checks(p,tw[1]) for p,tw in tables.items()]
    matrices = matrix_checks(rows,tables)
    windows = window_checks(tables)
    public = [r for r in rows if r['kind']=='public_ones']
    for row in public:
        n = 1 << row['k']
        assert row['values'] == [n] + [0]*(n-1)
    for p,h in {**frozen,**fingerprints}.items():
        assert sha(ROOT/p)==h,p
    for p in (dest/'phase-probe',dest/'raw.jsonl',dest/'plan.json',dest/'compile.log'):
        fingerprints[str(p)] = sha(p)
    result = dict(status='PASS', decision='No direct phase-product match in the audited fft_small blocks',
                  phase_checks=phases, matrix_checks=matrices,
                  window_checks=len(windows), window_rejection_witnesses=windows,
                  public_constant_vector_checks=len(public), baseline_flint_unchanged=True,
                  old_fingerprints_checked=len(frozen), sha256=fingerprints)
    (dest/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in
                     ('matrix_checks','window_rejection_witnesses','sha256')},indent=2))
    print(json.dumps({k:v for k,v in matrices.items() if k!='rejection_witnesses'},indent=2))


if __name__ == '__main__':
    main()
