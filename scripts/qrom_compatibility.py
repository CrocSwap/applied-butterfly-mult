#!/usr/bin/env python3
"""Bounded QROM contract checks; no quantum-library benchmark or new construction.

Models use ideal permutation gates, plus exact signed Pauli gates. They check
whole operators on every basis column, not sampled probabilities. We do not
validate Qualtran's approximate-CSWAP decomposition or hardware gate costs.
"""
import sys
sys.dont_write_bytecode = True
import argparse
import ast
import hashlib
import itertools
import json
from pathlib import Path
from audit_encrypted_probability_survey import collect_manifest

ROOT = Path(__file__).resolve().parents[1]
SOURCES = ROOT / 'results/qrom-compatibility/sources'
PARENT = ROOT / 'results/sachs-hybrid-screen/completion.json'
THEORY = ROOT.parent / 'integerMult'


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def save(p, obj):
    with p.open('x') as f:
        json.dump(obj, f, indent=2)
        f.write('\n')


def provenance():
    prior = collect_manifest(PARENT, {})
    for name, h in prior.items():
        assert sha(Path(name)) == h, name
    metadata = json.loads((SOURCES / 'qualtran.json').read_text())
    for entry in metadata['sources']:
        data = (SOURCES / 'qualtran' / entry['path']).read_bytes()
        blob = hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
        assert blob == entry['git_blob'], entry['path']
    return dict(inherited_manifest=str(PARENT), inherited_manifest_sha256=sha(PARENT),
                historical_fingerprints_verified=len(prior),
                upstream_git_blobs_verified=len(metadata['sources']))


def source_schedule():
    """Read the top-level block order without importing third-party dependencies."""
    p = SOURCES / 'qualtran/qualtran/bloqs/data_loading/select_swap_qrom.py'
    tree = ast.parse(p.read_text())
    fun = next(n for n in ast.walk(tree) if isinstance(n, ast.FunctionDef)
               and n.name == '_build_composite_bloq_with_swz')
    calls = sorted((n for n in ast.walk(fun) if isinstance(n, ast.Call)
                    and isinstance(n.func, ast.Attribute)
                    and n.func.attr in {'_add_qrom_bloq', '_add_swap_with_zero_bloq', '_add_cnot'}),
                   key=lambda n: n.lineno)
    seq = []
    for n in calls:
        inv = any(k.arg == 'uncompute' and isinstance(k.value, ast.Constant)
                  and k.value.value is True for k in n.keywords)
        seq.append({'_add_qrom_bloq': 'L', '_add_swap_with_zero_bloq': 'S',
                    '_add_cnot': 'C'}[n.func.attr] + ('^-1' if inv else ''))
    assert seq == ['L', 'S', 'C', 'S^-1', 'L^-1', 'S', 'C', 'S^-1']
    return dict(file=str(p.relative_to(ROOT)), line=fun.lineno, dirty_branch_schedule=seq,
                scope='AST block order, not decomposition execution')


def check_lookup():
    count = 0
    fixtures = []
    for n, b, block in [(4, 1, 2), (4, 2, 2), (8, 1, 4)]:
        start = count
        for table in itertools.product(range(1 << b), repeat=n):
            for x, y, dirty in itertools.product(range(n), range(1 << b),
                                                itertools.product(range(1 << b), repeat=block)):
                q, r = divmod(x, block)
                bank = list(dirty)
                out = y
                # Qualtran's high-level L,S,C,S^-1,L^-1,S,C,S^-1.
                for op in ('L', 'S', 'C', 'S', 'L', 'S', 'C', 'S'):
                    if op == 'L':
                        bank = [v ^ table[q * block + j] for j, v in enumerate(bank)]
                    elif op == 'S':
                        bank[0], bank[r] = bank[r], bank[0]
                    else:
                        out ^= bank[0]
                assert out == y ^ table[x] and tuple(bank) == dirty
                # Selected copy removes the four surrounding ideal swaps.
                bank = [v ^ table[q * block + j] for j, v in enumerate(dirty)]
                copy_out = y ^ bank[r]
                bank = [v ^ table[q * block + j] for j, v in enumerate(bank)]
                copy_out ^= bank[r]
                assert copy_out == out and tuple(bank) == dirty
                count += 1
        fixtures.append(dict(entries=n, output_bits=b, rows=block, basis_columns=count-start))
    return dict(fixtures=fixtures, basis_columns=count, variants_per_column=2,
                exact_phase='All modeled gates are phase-free permutations')


def check_packets():
    count = 0
    cases = []
    for m in range(1, 5):
        start = count
        for fs in itertools.product(range(4), repeat=m):
            # Each f is the two-bit table-bank mask for one packet at a fixed q.
            for r, dirty, outputs in itertools.product(range(2), range(4), range(1 << m)):
                bank = dirty
                y = [(outputs >> j) & 1 for j in range(m)]
                # Copy the same initial dirty mask to all outputs with one
                # selected read, surrounded by 2(m-1) ordinary CNOTs.
                for j in range(1, m):
                    y[j] ^= y[0]
                y[0] ^= (bank >> r) & 1
                for j in range(1, m):
                    y[j] ^= y[0]
                previous = 0
                for j, f in enumerate(fs):
                    bank ^= previous ^ f
                    y[j] ^= (bank >> r) & 1
                    previous = f
                bank ^= previous
                assert bank == dirty
                assert y == [((outputs >> j) ^ (f >> r)) & 1 for j, f in enumerate(fs)]
                count += 1
        cases.append(dict(packets=m, basis_columns=count-start,
                          independent_load_passes=2*m, shared_load_passes=m+1,
                          shared_selected_reads=m+1, extra_output_cnots=2*(m-1)))
    return dict(cases=cases, basis_columns=count,
                attribution='Existing sequential-QROM sharing; not a sister-project result')


def check_dense_primitive():
    good = 0
    wrong_inverse_failures = 0
    for a, z, p, v, d in itertools.product(range(2), repeat=5):
        def run(inverse):
            value, sign = d, 1
            # Chronological R, P, R, P-dagger, with P = X^a Z^z.
            for op in ('R', 'Z', 'X', 'R', *('XZ' if inverse else 'ZX')):
                if op == 'R' and v:
                    if p:
                        value ^= 1
                    else:
                        sign *= (-1) ** value
                elif op == 'Z' and z:
                    sign *= (-1) ** value
                elif op == 'X' and a:
                    value ^= 1
            return value, sign
        want = (d, (-1) ** (v * (z if p else a)))
        assert run(True) == want
        wrong_inverse_failures += run(False) != want
        good += 1
    assert wrong_inverse_failures == 8
    return dict(signed_basis_columns=good, wrong_inverse_negative_control_failures=wrong_inverse_failures,
                scope='Single-qubit read commutator only; no full dense-encoding QROM validation')


def check_linear_boundary():
    # ANF of d_r for two dirty bits. Variables: r, d0, d1.
    values = [((x >> 1) & 1) if not (x & 1) else ((x >> 2) & 1) for x in range(8)]
    coeffs = values.copy()
    for bit in range(3):
        for x in range(8):
            if x & (1 << bit):
                coeffs[x] ^= coeffs[x ^ (1 << bit)]
    assert [i for i, c in enumerate(coeffs) if c] == [2, 3, 5]
    # Every invertible binary change of coordinates of the two-bit bank
    # leaves a nonlinear selector. This finite check illustrates, not proves,
    # the general obstruction.
    invertible = 0
    for row0, row1 in itertools.product(range(1, 4), repeat=2):
        if row0 == row1:
            continue
        invertible += 1
        # Original d is expressed in the new variables by these inverse rows.
        f = []
        for x in range(8):
            r, bank = x & 1, x >> 1
            f.append(((row1 if r else row0) & bank).bit_count() & 1)
        for bit in range(3):
            for x in range(8):
                if x & (1 << bit):
                    f[x] ^= f[x ^ (1 << bit)]
        assert max(i.bit_count() for i, c in enumerate(f) if c) == 2
    return dict(selector_anf='d0 XOR (r AND d0) XOR (r AND d1)', degree=2,
                invertible_two_bit_bases_checked=invertible,
                conclusion='A fixed CNOT/X network cannot implement the coherent selected read')


def main():
    if not __debug__:
        raise RuntimeError('Assertions must be enabled')
    parser = argparse.ArgumentParser()
    parser.add_argument('--out', type=Path, default=ROOT/'results/qrom-compatibility/checks.json')
    args = parser.parse_args()
    if args.out.exists():
        raise FileExistsError(args.out)
    result = dict(status='PASS', **provenance(), source_schedule=source_schedule(),
                  lookup=check_lookup(), packet_sharing=check_packets(),
                  dense_primitive=check_dense_primitive(), linear_boundary=check_linear_boundary(),
                  theory_sources={str(THEORY/p): sha(THEORY/p) for p in [
                      'research/joint-dual/PROOF.md',
                      'scripts/experiments/binary_frame_compiler.py',
                      'scripts/experiments/joint_dual_reclaim_compiler.py']},
                  limitations=['No library execution or timing', 'No new theory-derived circuit',
                               'No full dense-QROM implementation audit',
                               'No impossibility claim for future quantum adaptations'])
    save(args.out, result)
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
