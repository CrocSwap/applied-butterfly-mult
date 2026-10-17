#!/usr/bin/env python3
"""Apply a pre-timing resource/opportunity gate from baseline-only profiles."""
import json
from pathlib import Path
from theta_equal import OUT, ROOT
from qualify_theory_paths_hard import sha, save

plan=json.loads((OUT/'plan.json').read_text())
assert not (OUT/'raw.jsonl').exists(), 'Gate must precede all comparative timing'
trace=json.loads((OUT/'trace.json').read_text())
key=lambda c:json.dumps(c,sort_keys=True)
excluded={key(r['case']):r for r in trace if r['variant']=='trace'
    and r['total_ns']/r['evaluations']>1e9
    and r['equal_ns']/r['total_ns']<0.001}
assert len(excluded)==2
assert all(r['case']['group']=='ordinary_constants' and r['case']['g']==6 for r in excluded.values())
save(OUT/'plan-before-resource-gate.json',plan)
removed=[c for c in plan['comparisons'] if key(c['case']) in excluded]
plan['comparisons']=[c for c in plan['comparisons'] if key(c['case']) not in excluded]
save(OUT/'resource-gate.json',dict(reason='Baseline-only profile: >1 second per public call and <0.1% runtime in eligible kernel. Retain numerical qualification; omit costly repeated timing with negligible opportunity.',
    criteria=dict(max_call_ns=1000000000,min_kernel_fraction=0.001),removed=removed,profiles=list(excluded.values()),
    timing_started=False,applies_to='Initial screen; predefined confirmation already excludes ordinary constants.'))
for p in [Path(__file__).resolve(),OUT/'resource-gate.json',OUT/'plan-before-resource-gate.json']:
    plan['frozen_sha256'][str(p)]=sha(p)
plan['resource_gate']='resource-gate.json'
save(OUT/'plan.json',plan)
print('Omitted',len(removed),'comparisons before timing;',len(plan['comparisons']),'remain')
