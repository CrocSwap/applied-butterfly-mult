#!/usr/bin/env python3
"""Exact finite identities and limitations; these inputs are algebraic checks only."""
import itertools
import json
from pathlib import Path

OUT=Path(__file__).resolve().parents[1]/'results/encrypted-probability-survey'
rows=[]; coordinates=0
for k in range(1,11):
    n=1<<k; counts=[]
    for j in range(k):
        d=1<<j
        offsets={( (b^d)-b )%n for b in range(n)}
        assert offsets=={d%n,(-d)%n}
        for b in range(n):
            assert (b+(-d if b&d else d))%n == b^d
            coordinates+=1
        counts.append(len(offsets))
    reverse=lambda b:int(f'{b:0{k}b}'[::-1],2)
    diagonals={(reverse(b)-b)%n for b in range(n)}
    rows.append(dict(slots=n,xor_axis_nonzero_cyclic_diagonals=counts,
                     bit_reversal_cyclic_diagonals=len(diagonals),
                     caveat='Direct masked-diagonal representation, not a rotation lower bound over composed/BSGS algorithms. Full packing only.'))

# Each original summand appears in exactly one first-hit branch.
recurrence_checks=0; pair_checks=0
for k in range(1,8):
    allmask=(1<<k)-1
    for U in range(1<<k):
        T=U
        while T:
            j=T&-T
            for P in range(1<<k):
                actual=int(P&~U==0 and bool(P&T))
                first=int(P&~U==0 and bool(P&j))
                remaining=int(P&~(U&~j)==0 and bool(P&(T&~j)))
                assert actual==first+remaining
                recurrence_checks+=1
            T=(T-1)&U
    for a,b in itertools.combinations(range(k),2):
        F=(1<<a)|(1<<b);U=allmask^F
        for T in range(1<<k):
            for i,j in itertools.combinations(range(k),2):
                P=(1<<i)|(1<<j)
                # Gate weights by required intersection first, then exclude F.
                lhs=int(P&~U==0 and (not T or bool(P&T)))
                rhs=int(not P&F)*int(not T or bool(P&T))
                assert lhs==rhs;pair_checks+=1

# Higher-cardinality parents cannot simply be dropped.
P=0b111;U=0b111;T=1
assert P&~U==0 and P&T and P.bit_count()>2

result=dict(status='PASS',xor_coordinate_checks=coordinates,cyclic_diagonal_profiles=rows,
            first_hit_coefficient_checks=recurrence_checks,pair_mapping_coefficient_checks=pair_checks,
            higher_arity_counterexample=dict(parent=P,allowed=U,required=T,weight=1,
                                            true_sum=1,pair_only_sum=0),
            scope='Exact index/support checks; no cryptographic execution, error certification, runtime speedup, or empirical query frequency follows from these fixtures.')
with (OUT/'contract-checks.json').open('x') as f:json.dump(result,f,indent=2);f.write('\n')
print(json.dumps({k:v for k,v in result.items() if k!='cyclic_diagonal_profiles'},indent=2))
