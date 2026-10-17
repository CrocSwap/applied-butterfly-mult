#!/usr/bin/env python3
"""Screen SIMD reduction placements in the actually hot 4x4 inverse16 graph.

Each optional reduction acts on all four logical SIMD lanes. Bounds use half-p
units, with the same strict integer/mulmod contract as reduction_schedule.py.
Only reduction placement varies; factorization, arithmetic and transpose stay fixed.
"""
from collections import Counter
from itertools import combinations
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NODES = tuple(f'{stage}.{kind}{i}' for stage in range(2) for kind in ['Y', 'Z'] for i in range(4))
ORIGINAL = frozenset(['0.Z0', '1.Z0'])


def evaluate(cuts):
    def butterfly(x, stage):
        def add(name, a, b):
            bounds = [u+v for u, v in zip(a, b)]
            if max(bounds) > 16:
                raise ValueError('integer addition may exceed 2**53')
            return [2]*4 if f'{stage}.{name}' in cuts else bounds

        def mul(bounds):
            if max(bounds) > 16:
                raise ValueError('product exceeds checked mulmod bound')
            return [2 if u <= 8 else 3 for u in bounds]

        y0, y1 = add('Y0', x[0], x[1]), add('Y1', x[2], x[3])
        y2, y3 = mul(add('Y2', x[0], x[1])), mul(add('Y3', x[3], x[2]))
        return [add('Z0', y0, y1), add('Z1', y3, y2),
                mul(add('Z2', y1, y0)), mul(add('Z3', y3, y2))]

    try:
        first = butterfly([[4]*4 for _ in range(4)], 0)
        transposed = [list(lanes) for lanes in zip(*first)]
        output = butterfly(transposed, 1)
        if max(max(row) for row in output) > 4:
            raise ValueError('output exceeds inverse interface bound')
        return {'valid': True, 'cuts': sorted(cuts), 'output_bounds_in_half_p_units': output}
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
            'invalid_reasons': dict(invalid), 'minimum_simd_reductions': minimum,
            'minimum_schedules': [r for r in valid if len(r['cuts']) == minimum],
            'original': evaluate(ORIGINAL), 'scope': __doc__}


def main():
    report = search()
    (ROOT/'results/reduction-schedule16-search.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
