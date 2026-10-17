#!/usr/bin/env python3
"""Bounded scalar-cost screen of the pinned paired-cube producer, not a CPU benchmark."""
import sys
sys.dont_write_bytecode = True
import argparse
import hashlib
import json
import random
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SISTER = ROOT.parent / 'integerMult'
sys.path.insert(0, str(SISTER / 'scripts'))
from paired_cube.graph import Graph
from paired_cube.modules import restricted_pairs, restricted_triples, all_but_one
from audit_encrypted_probability_survey import collect_manifest


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


class Program:
    def __init__(self, n):
        self.n = n
        self.ops = []
        self.outputs = []

    def add(self, a, b, sign=1):
        out = self.n + len(self.ops)
        self.ops.append((a, b, sign))
        return out

    def total(self, values):
        it = iter(values)
        out = next(it)
        for v in it:
            out = self.add(out, v)
        return out

    def evaluate(self, values):
        work = list(values)
        for a, b, sign in self.ops:
            work.append(work[a] + sign * work[b])
        return [work[x] for x in self.outputs]

    def resources(self):
        # Input bank is immutable/external. All outputs remain live on return.
        # Count distinct temporaries; the result is allocated before dead operands
        # are released. This is a specified schedule, not an optimal-register claim.
        refs = [0] * (self.n + len(self.ops))
        for a, b, _ in self.ops:
            refs[a] += 1
            refs[b] += 1
        for x in self.outputs:
            refs[x] += 1
        live = peak = 0
        for i, (a, b, _) in enumerate(self.ops, self.n):
            live += 1
            peak = max(peak, live)
            for x in (a, b):
                refs[x] -= 1
                if x >= self.n and refs[x] == 0:
                    live -= 1
            if refs[i] == 0:
                live -= 1
        return dict(additions_subtractions=len(self.ops),
                    operand_reads=2 * len(self.ops), result_writes=len(self.ops),
                    peak_live_temporaries=peak, retained_output_values=live,
                    external_input_values=self.n,
                    schedule='listed topological order, eager last-use release; no operand overwrite')


def theory_program(g):
    n = g['v']
    side = [r for r in g['roots'] if r['kind'] == 'side']
    active = set(range(n))
    stack = [r['node'] for r in side]
    while stack:
        x = stack.pop()
        if x in active:
            continue
        active.add(x)
        stack.extend(g['args'][x])
    pr = Program(n)
    image = {i: i for i in range(n)}
    for x in sorted(active - set(range(n))):
        a, b = g['args'][x]
        image[x] = pr.add(image[a], image[b], g['signs'][x])
    producer_ops = len(pr.ops)
    outputs = [None] * n
    for r in side:
        for target, coefficient in zip(r['targets'], r['coefficients']):
            sign = {'1/2': 1, '-1/2': -1}[coefficient]
            x = image[r['node']]
            if outputs[target] is None:
                assert sign == 1
                outputs[target] = x
            else:
                outputs[target] = pr.add(outputs[target], x, sign)
    assert all(x is not None for x in outputs)
    pr.outputs = outputs
    return pr, producer_ops


def conventional_program(g):
    # B=(incidence^T incidence - all-ones)/2; K=(antipode-neighbors)/2.
    # Compute 2H = 2x - 2K - 2B with only ordinary addition/subtraction.
    n = g['v']
    pr = Program(n)
    stars = [pr.total(i for i, t in enumerate(g['labels']) if c in t)
             for c in range(g['h'])]
    total = pr.total(range(n))
    for i, t in enumerate(g['labels']):
        base, bits = divmod(i, 8)
        neighbors = pr.total(8 * base + (bits ^ (1 << j)) for j in range(3))
        k2 = pr.add(8 * base + (bits ^ 7), neighbors, -1)
        b2 = pr.add(pr.total(stars[c] for c in t), total, -1)
        doubled = pr.add(i, i)
        pr.outputs.append(pr.add(pr.add(doubled, k2, -1), b2, -1))
    assert len(pr.ops) == 13 * n - g['h'] - 1
    return pr


def shared_conventional_program(g):
    # Ordinary incidence sums and the identity 2Kx = 2*x_antipode - parity_sum.
    # No frames, borrowed scratch, restricted disjointness DAG or matrix search.
    pr = Program(g['v'])
    halves = [[] for _ in range(g['h'])]
    totals = []
    parity_sums = []
    for base in range(0, g['v'], 8):
        local_halves = {}
        for c in sorted(set(c for t in g['labels'][base:base+8] for c in t)):
            val = pr.total(i for i in range(base, base+8) if c in g['labels'][i])
            local_halves[c] = val
            halves[c].append(val)
        first = min(local_halves)
        totals.append(pr.add(local_halves[first], local_halves[first ^ 1]))
        parity_sums.append([pr.total(base+i for i in range(8) if i.bit_count()%2 == parity)
                            for parity in (0, 1)])
    stars = [pr.total(xs) for xs in halves]
    total = pr.total(totals)
    for i, t in enumerate(g['labels']):
        base, bits = divmod(i, 8)
        b2 = pr.add(pr.total(stars[c] for c in t), total, -1)
        diff = pr.add(i, 8*base + (bits ^ 7), -1)
        local = pr.add(pr.add(diff, diff), parity_sums[base][1-bits.bit_count()%2])
        pr.outputs.append(pr.add(local, b2, -1))
    assert len(pr.ops) == 11 * g['v'] - g['h'] - 1
    return pr


def expected_coefficient(g, i, j):
    if i // 8 == j // 8:
        return 0
    return 1 - len(set(g['labels'][i]).intersection(g['labels'][j]))


def check(g, theory, baseline):
    n = g['v']
    checked = 0
    if g['p'] == 6:
        for j in range(n):
            x = [int(i == j) for i in range(n)]
            expected = [expected_coefficient(g, i, j) for i in range(n)]
            assert theory.evaluate(x) == baseline.evaluate(x) == expected
            checked += n
    rng = random.Random(20261009 + g['p'])
    fixtures = [[0] * n, [1] * n, [(-1)**i for i in range(n)]]
    fixtures += [[rng.randrange(-(1 << 100), 1 << 100) for _ in range(n)] for _ in range(3)]
    # Independent direct dense definition; includes signed and large-integer inputs.
    rows = [[expected_coefficient(g, i, j) for j in range(n)] for i in range(n)]
    for x in fixtures:
        expected = [sum(c * v for c, v in zip(row, x)) for row in rows]
        assert theory.evaluate(x) == baseline.evaluate(x) == expected
        checked += n
    return dict(basis_vectors=n if g['p'] == 6 else 0,
                dense_reference_fixtures=len(fixtures), checked_outputs=checked)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.output.exists():
        raise SystemExit('Output directory must be new')
    parent = ROOT / 'results/pareto-compatibility/completion.json'
    hashes = collect_manifest(parent, {})
    evolved = []
    for name, digest in hashes.items():
        if sha(name) == digest:
            continue
        path = Path(name)
        assert path == SISTER / 'README.md', name
        old_commit = '56b66d58297deca1d7dd130247d720e960f77a37'
        blob = subprocess.check_output(['git', '-C', str(SISTER), 'show', f'{old_commit}:README.md'])
        assert hashlib.sha256(blob).hexdigest() == digest
        evolved.append(dict(path=name, old_commit=old_commit,
                            historical_sha256=digest, current_sha256=sha(path)))
    records = []
    for p in (6, 8, 10, 12):
        g = Graph(p).finish(restricted_triples(p), restricted_pairs(p-1), all_but_one(p-2))
        if p == 12:
            pin = json.loads((SISTER / 'references/paired-cube/selected-module/SOURCE.json').read_text())
            binding = {k: g[k] for k in ('inputs', 'labels', 'args', 'signs', 'roots', 'centers')}
            assert hashlib.sha256(json.dumps(binding, separators=(',', ':')).encode()).hexdigest() == pin['graph_sha256']
        theory, producer_ops = theory_program(g)
        baseline = shared_conventional_program(g)
        records.append(dict(p=p, v=g['v'], sister_counts=g['counts'],
                            side_producer_additions=producer_ops,
                            theory=theory.resources(), baseline=baseline.resources(),
                            checks=check(g, theory, baseline)))
    source_paths = [SISTER / p for p in (
        'scripts/paired_cube/graph.py', 'scripts/paired_cube/modules.py',
        'references/three-stage-cover/pr117/dag.json.gz',
        'references/paired-cube/selected-module/SOURCE.json',
        'notes/paired-cube-construction.tex', 'notes/general-clifford-frames.tex',
        'notes/stopped-product-factorization.tex', 'docs/paired-cube.md',
        'notes/paired-cube-sharing.tex', 'certificates/paired-cube-complex-input.json')]
    cert = json.loads((SISTER / 'certificates/paired-cube-complex-input.json').read_text())
    ranks = sum(int(r)*count for r, count in cert['child_histogram'].items())
    ordinary = cert['m'] * cert['W_per_vertex']
    assert ranks == cert['rank_per_vertex']
    saving = ordinary - ranks
    assert saving == cert['deficit_per_vertex'] == 1936
    # Each of three stages executes its physical M at least once. Do not charge
    # inverse M, old-value echo, scalar normalization, address adapters or routing.
    scalar_lower_bound = 3 * cert['total_M_operations']
    ledger = dict(m=cert['m'], roles_per_vertex=cert['W_per_vertex'],
                  conventional_coordinate_layers_per_address=ordinary,
                  child_coordinate_layers_per_address=ranks,
                  saved_coordinate_layers_per_address=saving,
                  scalar_M_additions_lower_bound_per_address=scalar_lower_bound,
                  max_scalar_cost_over_coordinate_cost_for_break_even=saving/scalar_lower_bound,
                  min_coordinate_cost_over_scalar_cost_for_break_even=scalar_lower_bound/saving,
                  added_fraction_at_equal_unit_cost=(scalar_lower_bound-saving)/ordinary,
                  coefficients_per_vertex_before_group_factor=cert['W_per_vertex']*(1 << cert['m']),
                  bytes_at_16_bytes_per_coefficient_before_group_factor=16*cert['W_per_vertex']*(1 << cert['m']),
                  assumptions='Classical explicit arrays; one coordinate layer costs C per array element; one vector scalar addition costs S per element. No quantum gate or packed implicit representation claim.')
    result = dict(status='PASS',
                  scope='Exact scalar 2H map over integers/rings; no frame, conditioning or runtime claim',
                  theory_commit=subprocess.check_output(['git', '-C', str(SISTER), 'rev-parse', 'HEAD'], text=True).strip(),
                  selected_graph_pin_verified=True, cases=records, full_frame_ledger=ledger,
                  historical_live_fingerprints_verified=len(hashes)-len(evolved),
                  evolved_external_sources=evolved,
                  inherited_manifest=str(parent), inherited_manifest_sha256=sha(parent),
                  source_sha256={str(p): sha(p) for p in source_paths},
                  script_sha256=sha(__file__))
    args.output.mkdir(parents=True)
    (args.output / 'screen.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k: result[k] for k in ('status', 'theory_commit', 'cases')}, indent=2))


if __name__ == '__main__':
    main()
