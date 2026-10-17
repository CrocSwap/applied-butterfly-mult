#!/usr/bin/env python3
"""Bounded workload-first construction screen; exact arithmetic, no timings.

Adapt the sister's actual support-interning add/total methods to weighted input
atoms. Compare structural CSE under identical construction policies, and the
existing FFT factorization. This does NOT adapt the paired-exclusion recursion.
"""
import argparse
from collections import Counter
from itertools import combinations
import json
from pathlib import Path
import sys

from qualify_theory_paths_hard import ROOT, SISTER, frozen_hashes, sha, save
from screen_phase_fusion import model_column

sys.path.insert(0, str(SISTER/'scripts'))
from exclusion_circuit import ExclusionCircuit


class Sums(ExclusionCircuit):
    """Only initialization changes; add and total are the actual sister methods."""
    def __init__(self, atoms):
        self.atoms = atoms
        self.support = [0]+[1 << i for i in range(len(atoms))]
        self.args = [None]*len(self.support)
        self.lookup = {s:i for i,s in enumerate(self.support)}


class Structural(Sums):
    """Ordinary commutative expression CSE, without reassociation."""
    def __init__(self, atoms):
        super().__init__(atoms)
        self.expressions = {}

    def add(self, a, b):
        if not a: return b
        if not b: return a
        assert not self.support[a] & self.support[b]
        key = tuple(sorted((a,b)))
        if key in self.expressions: return self.expressions[key]
        n = len(self.args)
        self.expressions[key] = n
        self.args.append((a,b))
        self.support.append(self.support[a] | self.support[b])
        return n


def construct(matrix, policy, cls):
    atoms = sorted({(col,c) for row in matrix for col,c in enumerate(row) if c})
    ids = {a:i+1 for i,a in enumerate(atoms)}
    circuit = cls(atoms)
    expressions = [[ids[col,c] for col,c in enumerate(row) if c] for row in matrix]
    if policy == 'coefficient':
        expressions = [sorted(row,key=lambda x:(atoms[x-1][1],atoms[x-1][0]))
                       for row in expressions]
    elif policy == 'greedy':
        # Conventional global repeated-pair factoring, no theory-specific rule.
        expressions = [set(row) for row in expressions]
        while True:
            counts = Counter(pair for row in expressions for pair in combinations(sorted(row),2))
            if not counts: break
            pair, uses = min(counts.items(),key=lambda item:(-item[1],item[0]))
            if uses < 2: break
            node = circuit.add(*pair)
            for row in expressions:
                if set(pair) <= row:
                    row.difference_update(pair)
                    row.add(node)
        expressions = [sorted(row) for row in expressions]
    else:
        assert policy == 'column'
    outputs = [circuit.total(row) for row in expressions]
    active = set()
    stack = outputs[:]
    while stack:
        node = stack.pop()
        if node in active or node == 0: continue
        active.add(node)
        if circuit.args[node]: stack.extend(circuit.args[node])
    return circuit, outputs, active


def verify_and_count(circuit, outputs, active, matrix, p):
    """Evaluate every live node as a full coefficient vector in the prime field."""
    n = len(matrix)
    values = {0:[0]*n}
    for node in sorted(active):
        if circuit.args[node]:
            a,b = circuit.args[node]
            assert not circuit.support[a] & circuit.support[b]
            assert circuit.support[node] == circuit.support[a] | circuit.support[b]
            values[node] = [(x+y)%p for x,y in zip(values[a],values[b])]
        else:
            col,c = circuit.atoms[node-1]
            values[node] = [c if i == col else 0 for i in range(n)]
    assert [values[x] for x in outputs] == matrix
    scalars = [circuit.atoms[node-1][1] for node in active if not circuit.args[node]]
    return dict(add_sub=sum(circuit.args[x] is not None for x in active),
                nontrivial_mul=sum(c not in (1,p-1) for c in scalars),
                neg=sum(c == p-1 for c in scalars), matrix_entries=n*n)


def butterfly_count(k,j,inverse,tw,p):
    n = 1 << k
    mul = neg = 0
    for level in range(k):
        half = 1 << (k-level-1)
        for block in range(1 << level):
            w = tw[(j << level)+block]
            if inverse: w = pow(w,-1,p)
            mul += half*(w not in (1,p-1))
            neg += half*(w == p-1)
    return dict(add_sub=n*k,nontrivial_mul=mul,neg=neg)


def controls():
    result = {}
    for cls in (Structural,Sums):
        c = cls([(i,1) for i in range(4)])
        a = c.add(c.add(1,2),3)
        b = c.add(1,c.add(2,3))
        result[cls.__name__] = dict(equal_support=c.support[a]==c.support[b],same_node=a==b)
        assert (a == b) == (cls is Sums)
        try: c.add(1,a)
        except AssertionError: pass
        else: raise AssertionError('Overlapping support accepted')
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--output',type=Path,required=True)
    args = parser.parse_args()
    dest = args.output.resolve()
    dest.mkdir(parents=True,exist_ok=False)
    frozen = frozen_hashes()
    for name in ('completion.json','audit.json'):
        path = ROOT/'results/theory-paths-hard'/name
        frozen[str(path)] = sha(path)
        frozen.update(json.loads(path.read_text()).get('sha256',{}))
    for path,h in frozen.items(): assert sha(ROOT/path) == h,path
    source = ROOT/'results/phase-fusion-screen/raw.jsonl'
    tracked = [Path(__file__).resolve(),source,ROOT/'scripts/screen_phase_fusion.py',
               ROOT/'scripts/qualify_theory_paths_hard.py']
    audited = ['search_network','search_network_variants','research_networks','reuse_network',
               'dag_network','incidence_network','paired_network','shared_point_network',
               'exclusion_circuit','paired_exclusion_circuit','shared_point_circuit',
               'audit_sparse_fusion','audit_fused_block']
    tracked += [SISTER/'scripts'/f'{name}.py' for name in audited]
    tracked += [SISTER/'scripts/experiments'/f'{name}.py' for name in
                ('exclusion_greedy','intersection_greedy','block_completion')]
    fingerprints = {str(path):sha(path) for path in tracked}
    save(dest/'plan.json',dict(lengths=[16,32],twiddle_indices=list(range(8)),
        directions=['forward','unnormalized_inverse'],primes=[257,1108307720798209],
        policies=['column','coefficient','greedy'],interners=['Structural','Sums'],
        mechanism='Actual ExclusionCircuit.add/total, on preweighted input atoms; paired recursion not used',
        reference='Logical radix-2 factorization validated against actual pinned FLINT basis probes',
        costs='Scalar field add/sub, nontrivial constant multiplication, negation. Optimistic: constants, reductions, movement, register pressure and preparation uncharged.',
        promotion_gate='Require componentwise no-worse arithmetic counts and at least one strict saving against butterfly factorization before machine-code qualification; conservative, not a performance lower bound',
        attribution_gate='Must beat ordinary controls and demonstrate a specific construction dependence before claiming theory transfer',
        sha256=fingerprints))
    raw = [json.loads(line) for line in source.read_text().splitlines()]
    tables = {r['p']:r['values'] for r in raw if r['kind']=='twiddles'}
    cases = [r for r in raw if r['kind']=='matrix' and r['k'] in (4,5)]
    results = []
    for case in cases:
        p,k,j,inv = [case[key] for key in ('p','k','j','inverse')]
        n = 1 << k
        columns = case['columns']
        for col in range(n):
            assert columns[col] == model_column(k,j,col,tables[p],p,inv)
        matrix = [list(row) for row in zip(*columns)]
        base = butterfly_count(k,j,inv,tables[p],p)
        for policy in ('column','coefficient','greedy'):
            for cls in (Structural,Sums):
                c,outputs,active = construct(matrix,policy,cls)
                counts = verify_and_count(c,outputs,active,matrix,p)
                keys = ('add_sub','nontrivial_mul','neg')
                promoted = all(counts[key] <= base[key] for key in keys) and any(
                    counts[key] < base[key] for key in keys)
                record = dict(p=p,length=n,j=j,inverse=inv,policy=policy,
                              interner=cls.__name__,counts=counts,baseline=base,promoted=promoted)
                results.append(record)
                artifact = dict(**record,atoms=c.atoms,
                    gates=[[node,*c.args[node]] for node in sorted(active) if c.args[node]],outputs=outputs)
                save(dest/f'circuit-{p}-{n}-{j}-{inv}-{policy}-{cls.__name__}.json',artifact)
        print('checked',p,n,j,inv,flush=True)
    ablations = []
    for a,b in zip(results[::2],results[1::2]):
        assert a['interner']=='Structural' and b['interner']=='Sums'
        ablations.append(dict(p=a['p'],length=a['length'],j=a['j'],inverse=a['inverse'],
            policy=a['policy'],additions_saved=a['counts']['add_sub']-b['counts']['add_sub']))
    for path,h in {**frozen,**fingerprints}.items(): assert sha(ROOT/path)==h,path
    result = dict(status='PASS',operators=len(cases),circuits=len(results),
        matrix_entries_checked=sum(r['counts']['matrix_entries'] for r in results),
        controls=controls(),rows=results,ablations=ablations,
        promotion_candidates=sum(r['promoted'] for r in results),
        frozen_fingerprints_checked=len(frozen),frozen_sha256=frozen,sha256=fingerprints)
    save(dest/'summary.json',result)
    print(json.dumps({key:value for key,value in result.items() if key not in
                     ('rows','ablations','frozen_sha256','sha256')},indent=2))


if __name__ == '__main__': main()
