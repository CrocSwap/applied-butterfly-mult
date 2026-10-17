#!/usr/bin/env python3
"""Count static instructions in the preserved nonzero-twiddle function regions."""
import json
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[1]
output=[]
for path in sorted((ROOT/'results/network-checks').glob('*.asm')):
    instructions=[]
    for line in path.read_text().splitlines():
        match=re.match(r'^\s+([a-z][a-z0-9.]*)(?:\s|$)',line)
        if match: instructions.append((match[1],line.strip()))
    output.append({'source':str(path.relative_to(ROOT)),'instructions':len(instructions),
        'shuffle_instructions':sum(op.startswith(('zip','uzp','trn')) for op,_ in instructions),
        'stack_address_references':sum('[sp' in line for _,line in instructions),
        'child_calls_or_tail_branches':[line for op,line in instructions if op in ['bl','b'] and '_sd_' in line]})
report={'functions':output,'scope':'Static instructions in named function bodies, excluding child bodies. Stack references include ABI saves, not only spills. These counts do not predict runtime.'}
(ROOT/'results/network-assembly.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
