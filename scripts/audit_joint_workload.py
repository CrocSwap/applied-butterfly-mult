#!/usr/bin/env python3
"""Independent symbolic replay and fixed-order liveness resource audit."""
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'results/joint-workload-survey'

def audit(r):
    vals = {f'C{i}': 1 << i for i in range(r['inputs'])}
    versions = {k: ('input', i) for i, k in enumerate(vals)}
    ssa = []
    for i, (t, args) in enumerate(r['program']):
        assert t.startswith('V') and args
        value = 0
        for a in args:
            value ^= vals[a]  # rejects reading uninitialized scratch
        vals[t] = value
        ssa.append((i, [versions[a] for a in args]))
        versions[t] = i
    final = {versions[f'V{i}'] for i in range(r['outputs'])}
    for i, row in enumerate(r['matrix']):
        expected = sum(1 << j for j in row)
        assert vals[f'V{i}'] == expected, (r['k'], r['op'], r['variant'], i)
    assert all(vals[f'C{i}'] == 1 << i for i in range(r['inputs']))
    # An ordinary allocator can reuse a slot after all inputs to a statement
    # have been read. Final outputs remain live. No circuit rewriting here.
    uses = Counter(a for _, args in ssa for a in args if isinstance(a, int))
    live = set()
    peak = 0
    for target, args in ssa:
        for a in args:
            if isinstance(a, int):
                uses[a] -= 1
                if uses[a] == 0 and a not in final:
                    live.remove(a)
        live.add(target)
        peak = max(peak, len(live))
        if not uses[target] and target not in final:
            live.remove(target)
    assert live == final
    xor_count = sum(len(args)-1 for _, args in r['program'])
    assert xor_count == r['xors']
    assert sum(len(args)+1 for _, args in r['program']) == r['memory_accesses']
    slots = {t for t, _ in r['program']}
    assert len(slots) == r['variable_slots']
    address_slots = max(int(t[1:]) for t in slots) + 1
    if r['variant'] == 'scheduled':
        assert address_slots == len(slots) == peak
    direct = sum(len(row)-1 for row in r['matrix'])
    return dict(k=r['k'], m=r['m'], op=r['op'], variant=r['variant'],
                inputs=r['inputs'], outputs=r['outputs'], xors=xor_count,
                memory_accesses=r['memory_accesses'], physical_variable_slots=len(slots),
                fixed_order_live_slots=peak,
                address_slots=address_slots,
                distinct_scratch_slots=len(slots)-r['outputs'],
                allocated_scratch_slots=address_slots-r['outputs'],
                allocated_scratch_bytes_2048=2048*(address_slots-r['outputs']),
                direct_xors=direct, direct_extra_array_slots=0,
                direct_initial_input_copies=r['outputs'],
                direct_recomputation_xors=direct-xor_count,
                basis_output_equalities=r['inputs']*r['outputs'])

rows = [json.loads(line) for line in (OUT/'programs.jsonl').read_text().splitlines()]
assert len(rows) == 18
summary = [audit(r) for r in rows]
for k,m in [(4,2),(8,2),(10,4)]:
    for op in ('encode','decode'):
        group = [r for r in summary if (r['k'],r['m'],r['op'])==(k,m,op)]
        assert len(group)==3 and len({r['xors'] for r in group})==1
        assert {r['variant'] for r in group}=={'compressed','fused','scheduled'}
# Cross-check a published uncompressed and compressed example, independently
# of the adapter's extraction of the matrix and optimized graph.
example = next(r for r in summary if (r['k'],r['m'],r['op'],r['variant'])==(10,4,'encode','scheduled'))
assert example['direct_xors']==890 and example['xors']==418
receipt = dict(status='PASS', programs=len(rows), cases=6,
               basis_output_equalities=sum(r['basis_output_equalities'] for r in summary),
               scope='Exact bitset replay of every output coefficient; read-only input preservation; fixed-order liveness; operation/storage counts. No native execution or timing.',
               rows=summary)
with (OUT/'audit-final.json').open('x') as f:
    json.dump(receipt,f,indent=2); f.write('\n')
print(json.dumps(receipt,indent=2))
