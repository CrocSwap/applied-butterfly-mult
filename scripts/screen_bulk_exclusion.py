#!/usr/bin/env python3
"""Check conventional shortcuts before proposing another circuit application.

This is an exact algebra/combinatorics screen, not a performance benchmark.
No downloaded application code is executed. Output must be a new file.
"""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random

ROOT = Path(__file__).resolve().parents[1]


def representatives(edges, weights):
    """At most seven edges preserve max + a canonical witness after <=2 failures.

    At each node, select a best surviving edge. If that edge is unavailable to
    a query, at least one endpoint failed; descend into the corresponding child.
    Each descent accounts for a distinct failed vertex, so depth two suffices.
    Missing edges have weight None. Equal weights prefer the smaller edge index.
    This does NOT preserve the number of tied witnesses.
    """
    chosen = set()

    def visit(removed):
        candidates = [i for i, e in enumerate(edges)
                      if weights[i] is not None and not (e & removed)]
        if not candidates:
            return
        best = max(candidates, key=lambda i: (weights[i], -i))
        chosen.add(best)
        if removed.bit_count() < 2:
            e = edges[best]
            while e:
                bit = e & -e
                visit(removed | bit)
                e -= bit

    visit(0)
    assert len(chosen) <= 7
    return chosen


def check_family(n, alphabet):
    pairs = list(itertools.combinations(range(n), 2))
    edges = [(1 << a) | (1 << b) for a, b in pairs]
    # Include zero and one failures as well as all two-failure outputs.
    queries = [0] + [1 << a for a in range(n)] + edges
    surviving = [[i for i, e in enumerate(edges) if not (q & e)] for q in queries]
    cases = queries_checked = largest = 0
    for weights in itertools.product(alphabet, repeat=len(edges)):
        selected = representatives(edges, weights)
        largest = max(largest, len(selected))
        for ids in surviving:
            key = lambda i: (weights[i], -i)
            truth = max((i for i in ids if weights[i] is not None),
                        key=key, default=None)
            got = max((i for i in ids if i in selected), key=key, default=None)
            assert got == truth, (n, weights, ids, selected, truth, got)
            queries_checked += 1
        cases += 1
    return dict(n=n, alphabet=alphabet, cases=cases,
                queries_checked=queries_checked, largest_certificate=largest)


def ring_checks():
    rng = random.Random(2026100703)
    checked = 0
    for n in range(3, 33):
        pairs = list(itertools.combinations(range(n), 2))
        families = [dict(zip(pairs, (1 << i for i in range(len(pairs))))),
                    {p: rng.randrange(-10**30, 10**30) for p in pairs}]
        for x in families:
            total = sum(x.values())
            degree = [0] * n
            for (a, b), v in x.items():
                degree[a] += v
                degree[b] += v
            for a, b in pairs:
                truth = sum(v for (u, vtx), v in x.items()
                            if a not in (u, vtx) and b not in (u, vtx))
                assert truth == total - degree[a] - degree[b] + x[a, b]
                checked += 1
    return checked


def tie_count_boundary():
    pairs = list(itertools.combinations(range(6), 2))
    edges = [(1 << a) | (1 << b) for a, b in pairs]
    selected = representatives(edges, [1] * len(edges))
    for pair, q in zip(pairs, edges):
        truth = sum(not (q & e) for e in edges)
        got = sum(not (q & edges[i]) for i in selected)
        if truth != got:
            return dict(n=6, excluded=pair, all_weights=1,
                        selected=[pairs[i] for i in sorted(selected)],
                        actual_tie_count=truth, representative_tie_count=got)
    raise AssertionError("Expected a counterexample to preserving all tied witnesses")


def verify_frozen_evidence():
    reports = [
        'results/theory-transfer-completion.json',
        'results/theory-transfer-audit.json',
        'results/theory-paths-screen/summary.json',
        'results/theory-paths-control/summary.json',
        'results/theory-paths-confirm/summary.json',
        'results/theory-paths-bnb-completion.json',
        'results/theory-paths-bnb-audit.json',
        'results/theory-paths-bnb/summary.json',
        'results/theory-paths-bnb-validation/validation.json',
        'results/poly-prepared-completion.json',
    ]
    checked = {}
    for name in reports:
        p = ROOT / name
        report = json.loads(p.read_text())
        for filename, expected in report['sha256'].items():
            f = Path(filename)
            actual = hashlib.sha256(f.read_bytes()).hexdigest()
            assert actual == expected, filename
            checked[str(f)] = actual
        checked[str(p)] = hashlib.sha256(p.read_bytes()).hexdigest()
    return checked


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.output.exists():
        raise SystemExit('Output must be new')
    frozen = verify_frozen_evidence()
    source_manifest = ROOT / 'results/bulk-exclusion-screen/sources/manifest.json'
    sources = json.loads(source_manifest.read_text())
    for row in sources:
        assert hashlib.sha256((ROOT / row['file']).read_bytes()).hexdigest() == row['sha256']
    families = [check_family(5, [None, -1, 2]), check_family(6, [None, 1])]
    result = dict(status='PASS', scope='Exact shortcut verification; no timing or application win',
                  certificate_checks=families, ring_output_checks=ring_checks(),
                  tie_count_counterexample=tie_count_boundary(),
                  old_fingerprints_checked=len(frozen), frozen_sha256=frozen,
                  sources=sources,
                  sha256={str(p): hashlib.sha256(p.read_bytes()).hexdigest()
                          for p in [Path(__file__).resolve(), source_manifest]})
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k: v for k, v in result.items()
                      if k not in ('frozen_sha256', 'sources', 'sha256')}, indent=2))


if __name__ == '__main__':
    main()
