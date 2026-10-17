#!/usr/bin/env python3
"""Pareto payload compatibility of the actual paired-exclusion circuit.

Synthetic exact arithmetic checks, not application performance measurements.
Only nondominated cost vectors are retained, not all solution witnesses/ties.
"""
import sys
sys.dont_write_bytecode = True
import argparse
import hashlib
import itertools
import json
import random
from pathlib import Path
from audit_encrypted_probability_survey import collect_manifest

ROOT = Path(__file__).resolve().parents[1]
SISTER = ROOT.parent / 'integerMult'
sys.path.insert(0, str(SISTER/'scripts'))
from paired_exclusion_circuit import PairedExclusionCircuit


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def front(points):
    """Incremental nondominated set, used for circuit evaluation."""
    result = set()
    for p in points:
        if any(all(a <= b for a, b in zip(q, p)) for q in result):
            continue
        result = {q for q in result if not all(a <= b for a, b in zip(p, q))}
        result.add(p)
    return frozenset(result)


def reference(points):
    """Independent batch pairwise dominance checker."""
    unique = sorted(set(points))
    return frozenset(p for p in unique if not any(
        q != p and max(a-b for a, b in zip(q, p)) <= 0 for q in unique))


def paired_payload_checks():
    records = []
    for n in (4, 5, 6, 7, 8, 10, 12):
        circuit = PairedExclusionCircuit(n)
        certificate = circuit.verify()
        outputs = 0
        for dim, seed in itertools.product((2, 3), range(12)):
            rng = random.Random(100000*n + 1000*dim + seed)
            raw = [tuple(tuple(rng.randrange(13) for _ in range(dim))
                         for _ in range(rng.randrange(5))) for _ in circuit.inputs]
            vals = [frozenset()] + [front(p) for p in raw]
            for node in range(len(vals), len(circuit.args)):
                a, b = circuit.args[node]
                vals.append(front(itertools.chain(vals[a], vals[b])))
            for forbidden, node in circuit.outputs.items():
                expected = reference(p for edge, payload in zip(circuit.inputs, raw)
                                     if not set(edge).intersection(forbidden) for p in payload)
                assert vals[node] == expected
                outputs += 1
        records.append(dict(n=n, dimensions=[2, 3], fixtures=24, checked_outputs=outputs,
                            circuit_sha256=certificate['circuit_sha256']))
    return dict(cases=records, fixtures=sum(r['fixtures'] for r in records),
                checked_outputs=sum(r['checked_outputs'] for r in records),
                scope='Synthetic immutable pair payloads, distinct cost vectors only')


def algebra_checks():
    universe = tuple(itertools.product(range(2), repeat=2))
    sets = [frozenset(p for i,p in enumerate(universe) if mask >> i & 1)
            for mask in range(1 << len(universe))]
    cases = 0
    for a,b,c in itertools.product(sets, repeat=3):
        assert front(front(a | b) | c) == front(a | front(b | c)) == reference(a | b | c)
        cases += 1
    for a,b in itertools.product(sets, repeat=2):
        assert front(a | b) == front(b | a)
        assert front(a | a) == front(a)
    # Pruning before a future eligibility filter can discard the sole survivor.
    records = [(frozenset({0}), (0, 0)), (frozenset({1}), (1, 1))]
    forbidden = {0}
    correct = reference(p for support,p in records if not support & forbidden)
    prepruned = reference(p for _,p in records)
    wrong = reference(p for support,p in records if p in prepruned and not support & forbidden)
    assert correct == {(1,1)} and not wrong
    # Pareto union has no inverse: different hidden dominated points produce
    # identical union summaries but different results after removal of a source.
    a = {(0,0)}
    b, c = {(1,1)}, {(2,2)}
    assert front(a|b) == front(a|c) and front(b) != front(c)
    # The product at a DP join creates vectors absent from either input.
    a, b = {(0,4),(4,0)}, {(1,3),(3,1)}
    product = reference(tuple(x+y for x,y in zip(p,q)) for p in a for q in b)
    union = reference(a|b)
    assert product == {(1,7),(3,5),(5,3),(7,1)} and product.isdisjoint(union)
    # A single forget projection partitions table states, without overlapping
    # source families across distinct output keys.
    partitions = 0
    for width in range(1,9):
        for forgotten in range(1,1 << width):
            groups = {}
            for state in range(1 << width):
                groups.setdefault(state & ~forgotten,set()).add(state)
            assert sum(map(len,groups.values())) == 1 << width
            assert set.union(*groups.values()) == set(range(1 << width))
            partitions += 1
    return dict(associativity_triples=cases, commutativity_pairs=len(sets)**2,
                projection_partitions_checked=partitions,
                exclusion_counterexample=dict(correct=sorted(correct), incorrect=sorted(wrong)),
                no_inverse_counterexample=True, union_is_not_pareto_sum=True,
                pareto_sum_example=sorted(product))


def main():
    if not __debug__:
        raise RuntimeError('Assertions must be enabled')
    ap=argparse.ArgumentParser()
    ap.add_argument('--out',type=Path,default=ROOT/'results/pareto-compatibility/checks.json')
    args=ap.parse_args()
    if args.out.exists():
        raise FileExistsError(args.out)
    parent=ROOT/'results/qrom-compatibility/completion.json'
    prior=collect_manifest(parent,{})
    for p,h in prior.items():
        assert sha(Path(p)) == h,p
    metadata=json.loads((ROOT/'results/pareto-compatibility/sources.json').read_text())
    for r in metadata:
        b=(ROOT/r['local_path']).read_bytes()
        assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()==r['git_blob']
    result=dict(status='PASS',inherited_manifest=str(parent),inherited_manifest_sha256=sha(parent),
                historical_fingerprints_verified=len(prior),upstream_git_blobs_verified=len(metadata),
                theory_source_sha256={str(SISTER/p):sha(SISTER/p) for p in (
                    'scripts/paired_exclusion_circuit.py','scripts/exclusion_circuit.py',
                    'docs/research/paired-network.md')},
                paired_payload=paired_payload_checks(),algebra=algebra_checks(),
                limitations=['No captured application query trace', 'No solver execution or profiling',
                             'No runtime improvement or new construction claimed',
                             'Does not validate multiplicity or all-witness output contracts'])
    with args.out.open('x') as f:
        json.dump(result,f,indent=2)
        f.write('\n')
    print(json.dumps(result,indent=2))


if __name__=='__main__':
    main()
