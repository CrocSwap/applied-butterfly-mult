#!/usr/bin/env python3
"""Exact screen of a theory-derived circuit against independent alternatives.

No FLINT changes or timing claims. Imports the actual sister-project circuit;
records its hashes. The Sergeev circuit specializes Section 2 of
https://igorssergeev.github.io/papers/1209.1645e.pdf to p=q=2.
"""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
import sys

ROOT = Path(__file__).resolve().parents[1]
SISTER = ROOT.parent / "integerMult"
sys.path.insert(0, str(SISTER / "scripts"))
from exclusion_circuit import ExclusionCircuit
from paired_exclusion_circuit import PairedExclusionCircuit


class SergeevPairCircuit(ExclusionCircuit):
    """Merge first/last vertices, then repair the affected exclusions.

    The first coarse edge additionally carries the edge between the merged
    vertices. This is the p=2 specialization of Sergeev's input substitution.
    """
    def pair(self, points):
        out = self.rec(points, self.variables)
        return None, None, out

    def rec(self, points, edges):
        if len(points) <= 4:
            return {(a, b): self.total([x for (u, v), x in edges.items()
                                       if a not in (u, v) and b not in (u, v)])
                    for a, b in itertools.combinations(points, 2)}
        a, b, z = points[0], points[1], points[-1]
        e = lambda u, v: edges[tuple(sorted((u, v)))]
        coarse = {(u, v): e(u, v)
                  for u, v in itertools.combinations(points[:-1], 2)}
        for v in points[1:-1]:
            coarse[a, v] = self.add(e(a, v), e(v, z))
        coarse[a, b] = self.add(coarse[a, b], e(a, z))
        h = self.rec(points[:-1], coarse)
        middle = points[1:-1]
        _, from_a, _ = self.vector([e(a, v) for v in middle], False)
        _, from_z, _ = self.vector([e(v, z) for v in middle], False)
        out = {}
        for u, v in itertools.combinations(middle, 2):
            out[u, v] = self.add(h[u, v], e(a, z)) if b in (u, v) else h[u, v]
        for i, v in enumerate(middle):
            out[a, v] = self.add(h[a, v], from_z[i])
            out[v, z] = self.add(h[a, v], from_a[i])
        out[a, z] = self.add(h[a, b], self.total([e(b, v) for v in points[2:-1]]))
        return out


class IntervalPairCircuit(ExclusionCircuit):
    """Conventional baseline: split around c<d into three ordered intervals.

    Six disjoint edge regions (three triangles and three rectangles) are
    precomputed using row/column prefix/suffix sums. No subtraction.
    """
    def pair(self, points):
        n = len(points)
        e = self.variables
        row = {}; col = {}; tri = {}
        for a in points:
            row[a, n] = 0
            for b in range(n - 1, a, -1):
                row[a, b] = self.add(e[a, b], row[a, b + 1])
        for b in points:
            col[0, b] = 0
            for a in range(b):
                col[a + 1, b] = self.add(col[a, b], e[a, b])
        for r in range(n + 1):
            tri[r, r] = 0
            for l in range(r - 1, -1, -1):
                # Precompute each row prefix once, below.
                tri[l, r] = 0
        rp = {}
        for l in points:
            rp[l, l + 1] = 0
            for r in range(l + 2, n + 1):
                rp[l, r] = self.add(rp[l, r - 1], e[l, r - 1])
        for r in range(1, n + 1):
            for l in range(r - 1, -1, -1):
                tri[l, r] = self.add(tri[l + 1, r], rp[l, r])
        left = {}; right = {}; outer = {}
        for c in points:
            left[c, c + 1] = 0
            for d in range(c + 2, n):
                left[c, d] = self.add(left[c, d - 1], col[c, d - 1])
        for d in points:
            right[d - 1, d] = 0
            for c in range(d - 2, -1, -1):
                right[c, d] = self.add(right[c + 1, d], row[c + 1, d + 1])
            outer[0, d] = 0
            for c in range(1, d):
                outer[c, d] = self.add(outer[c - 1, d], row[c - 1, d + 1])
        out = {(c, d): self.total([tri[0, c], tri[c + 1, d], tri[d + 1, n],
                                  left[c, d], right[c, d], outer[c, d]])
               for c, d in itertools.combinations(points, 2)}
        return None, None, out


ZERO = (None, 0)  # (best weight, number attaining it); no paths


def plus(a, b):
    if a[0] is None:
        return b
    if b[0] is None:
        return a
    if a[0] == b[0]:
        return a[0], a[1] + b[1]
    return a if a[0] > b[0] else b


def times(a, b):
    if a[0] is None or b[0] is None:
        return ZERO
    return a[0] + b[0], a[1] * b[1]


def evaluate(circuit, inputs):
    v = [ZERO] * len(circuit.args)
    for pair, i in circuit.variables.items():
        v[i] = inputs[pair]
    for i in sorted(circuit.active):
        if circuit.args[i]:
            a, b = circuit.args[i]
            v[i] = plus(v[a], v[b])
    return {p: v[i] for p, i in circuit.outputs.items()}


def path_value(w, vertices):
    ans = (0, 1)
    for a, b in zip(vertices, vertices[1:]):
        ans = times(ans, ZERO if w[a][b] is None else (w[a][b], 1))
    return ans


def paths_via_circuit(w, cls):
    """Maximum weight/count of simple 6-edge paths from 0 to N-1.

    Each path has a unique middle vertex v. Each half has two other
    interior vertices; these two pairs must be disjoint.
    """
    n = len(w)
    ans = ZERO
    circuit = cls(n - 3)
    for v in range(1, n - 1):
        pool = [a for a in range(1, n - 1) if a != v]
        left = {}; right = {}
        for a, b in circuit.inputs:
            x, y = pool[a], pool[b]
            left[a, b] = plus(path_value(w, [0, x, y, v]),
                              path_value(w, [0, y, x, v]))
            right[a, b] = plus(path_value(w, [v, x, y, n - 1]),
                               path_value(w, [v, y, x, n - 1]))
        out = evaluate(circuit, left)
        for pair in circuit.inputs:
            ans = plus(ans, times(out[pair], right[pair]))
    return ans


def brute_paths(w):
    ans = ZERO
    for inside in itertools.permutations(range(1, len(w) - 1), 5):
        ans = plus(ans, path_value(w, [0, *inside, len(w) - 1]))
    return ans


def ring_check(n, rng):
    x = {p: rng.randrange(-10000, 10001) for p in itertools.combinations(range(n), 2)}
    total = sum(x.values())
    degree = [sum(v for p, v in x.items() if a in p) for a in range(n)]
    for a, b in x:
        direct = sum(v for p, v in x.items() if a not in p and b not in p)
        assert direct == total - degree[a] - degree[b] + x[a, b]
    return len(x)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.output.exists():
        raise SystemExit("Output must be new")
    classes = {"paired": PairedExclusionCircuit, "sergeev_2012_p2q2": SergeevPairCircuit,
               "interval_regions": IntervalPairCircuit, "sister_split": ExclusionCircuit}
    rows = []
    for n in (4, 5, 6, 7, 8, 12, 16, 24, 32, 49, 64, 96, 128):
        row = {"n": n, "circuits": {}}
        for name, cls in classes.items():
            c = cls(n)
            row["circuits"][name] = c.verify()
        rows.append(row)
        print(n, {name: v["additions"] for name, v in row["circuits"].items()}, flush=True)
    rng = random.Random(20261007)
    checks = []
    for n in (7, 8, 9, 10):
        for kind in ("equal", "distinct", "ties", "sparse", "empty", "negative"):
            w = [[None if a == b else
                  (0 if kind == "equal" else None if kind == "empty" else
                   -(1 << (a * n + b)) if kind == "distinct" else
                   rng.randrange(-20, 0) if kind == "negative" else
                   None if kind == "sparse" and rng.randrange(3) else rng.randrange(-2, 3))
                  for b in range(n)] for a in range(n)]
            expected = brute_paths(w)
            for name, cls in classes.items():
                actual = paths_via_circuit(w, cls)
                assert actual == expected, (n, kind, name, actual, expected)
            checks.append({"vertices": n, "kind": kind, "result": expected,
                           "circuits_checked": list(classes)})
    sources = [Path(__file__), SISTER / "scripts/exclusion_circuit.py",
               SISTER / "scripts/paired_exclusion_circuit.py",
               SISTER / "docs/research/paired-network.md"]
    result = {"status": "PASS", "scope": "Exact circuit counts and application mapping; no timing",
              "rows": rows, "path_checks": checks,
              "ring_outputs_checked": sum(ring_check(n, rng) for n in range(4, 33)),
              "sources": {str(p.resolve()): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources},
              "prior_art": ["https://arxiv.org/abs/1208.0554",
                            "https://igorssergeev.github.io/papers/1209.1645e.pdf",
                            "https://doi.org/10.1016/j.ipl.2013.12.003"]}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print("PASS", len(checks) * len(classes), "application comparisons")


if __name__ == "__main__":
    main()
