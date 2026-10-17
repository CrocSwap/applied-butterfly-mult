#!/usr/bin/env python3
"""Exhaustive interval screen of cuts in the even branch of an inverse radix-8.

Bounds are strict multiples of p. The contract is p < 2**50, exact integer
inputs |x| < 2p, centered twiddles |w| < p/2, and FLINT's checked mulmod bounds.
This checks one fixed arithmetic graph, not all inverse FFT algorithms.
"""
from collections import Counter
from fractions import Fraction as F
from itertools import combinations
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NODES = tuple([f'A{i}' for i in range(4)] + [f'Y{i}' for i in range(4)] +
              [f'Z{i}' for i in range(4)])
ORIGINAL = frozenset(['A0', 'A1', 'A2', 'A3', 'Z0'])
SELECTED = frozenset(['Y0', 'Y1', 'Z1'])


def evaluate(cuts):
    trace = {}

    def add(name, a, b):
        raw = a+b  # Addition and subtraction have the same absolute bound.
        if raw > 8:
            raise ValueError('integer addition may exceed 2**53')
        result = F(1) if name in cuts else raw
        trace[name] = {'before': str(raw), 'after': str(result)}
        return result

    def mul(a):
        # |w| < p/2. A full mulmod is required above the smaller product bound.
        if a <= 4:
            return F(1)
        if a <= 8:
            return F(3, 2)
        raise ValueError('product exceeds checked mulmod bound')

    try:
        a = [add(f'A{i}', F(2), F(2)) for i in range(4)]
        y0, y1 = add('Y0', a[0], a[1]), add('Y1', a[2], a[3])
        y2, y3 = mul(add('Y2', a[0], a[1])), mul(add('Y3', a[3], a[2]))
        z = [add('Z0', y0, y1), add('Z1', y3, y2),
             mul(add('Z2', y1, y0)), mul(add('Z3', y3, y2))]
        if max(z) > 2:
            raise ValueError('output exceeds inverse interface bound')
        return {'valid': True, 'cuts': sorted(cuts), 'output_bounds': list(map(str, z)), 'trace': trace}
    except ValueError as error:
        return {'valid': False, 'reason': str(error)}


def search():
    valid, invalid = [], Counter()
    for count in range(len(NODES)+1):
        for cuts in combinations(NODES, count):
            result = evaluate(frozenset(cuts))
            if result['valid']:
                valid.append(result)
            else:
                invalid[result['reason']] += 1
    minimum = min(len(r['cuts']) for r in valid)
    return {'schedules_checked': 2**len(NODES), 'valid_schedules': len(valid),
            'invalid_reasons': dict(invalid), 'minimum_reductions': minimum,
            'minimum_schedules': [r for r in valid if len(r['cuts']) == minimum],
            'original': evaluate(ORIGINAL), 'selected': evaluate(SELECTED),
            'scope': __doc__}


def main():
    report = search()
    (ROOT/'results/reduction-schedule-search.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps({k: v for k, v in report.items() if k not in ['minimum_schedules', 'scope']}, indent=2))
    print('Minimum cuts:', [r['cuts'] for r in report['minimum_schedules']])


if __name__ == '__main__':
    main()
