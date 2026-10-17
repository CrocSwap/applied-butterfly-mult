#!/usr/bin/env python3
"""Audit the bounded network/layout experiment without imposing a speedup."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
from benchmark import ROOT
from analyze_experiments import logs


def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def read(path): return json.loads((ROOT/path).read_text())


def main():
    plan=read('experiments/network-plan.json')
    for name in ['network-control','network-two-lane']:
        manifest=read(f'results/network-checks/{name}-build.json')
        assert sha(manifest['library'])==manifest['sha256']
        assert sha(ROOT/f'patches/{name}.patch')==manifest['patch_sha256']
        assert (ROOT/f'results/network-checks/{name}-tests.txt').read_text().count('(PASS)')==4
    validation=read('results/network-two-lane-validation.json')
    assert validation['case_count']==len(validation['cases'])==338
    assert all(c['passed'] and c['patterns_per_library']==12 for c in validation['cases'])
    assert validation['sha256']==read('results/network-checks/network-two-lane-build.json')['sha256']
    frame=read('results/network-frame-screen.json')
    assert frame['invertible_binary_frames']==20160
    assert frame['fixed_frame_minimum_crossing_stages']==1
    direct=(ROOT/'results/network-checks/test-network.txt').read_text()
    assert 'PASS 441 transform cases, 7620714 coefficient checks, 24 naive cyclic convolutions' in direct
    counts={}
    for name in ['network-aa','network-screen','network-confirm']:
        metadata=read(f'results/{name}/metadata.json')
        for path,digest in metadata['comparison_sha256'].items(): assert sha(path)==digest
        rows=[json.loads(line) for line in (ROOT/f'results/{name}/raw.jsonl').read_text().splitlines()]
        groups=defaultdict(list)
        for row in rows: groups[(row['an'],row['bn'],row['operation'])].append(row)
        sizes=[4096,8192,16384] if name=='network-aa' else plan['sizes']
        expected={(n,n,'sqr') for n in sizes}|{(n,n,'mul') for n in sizes}|{(n,n//2,'mul') for n in sizes}
        assert set(groups)==expected
        for case in groups.values():
            for metric in ['cpu_ns_per_op','ns_per_op']: assert len(logs(case,metric))==21
        counts[name]={'cases':len(groups),'batches':len(rows)}
    files=['scripts/make_network_patch.py','scripts/network_frames.py','scripts/build_experiment.py',
           'scripts/check_network.sh','scripts/audit_network.py','bench/test_network.c','tests/test_network_frames.py']
    sources=['docs/packed-movement-audit.md','docs/research/shared-computation.md','notes/dag-construction.tex']
    result={'status':'PASS','runs':counts,'GMP_comparisons_per_library':4056,
            'direct_transform_cases':441,'direct_coefficient_checks':7620714,'naive_convolutions':24,
            'sha256':{path:sha(ROOT/path) for path in files},
            'sister_source_sha256':{path:sha(ROOT.parent/'integerMult'/path) for path in sources},
            'note':'Evidence integrity and coverage only; no performance success is required.'}
    (ROOT/'results/network-audit.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))


if __name__=='__main__':main()
