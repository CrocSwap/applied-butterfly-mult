#!/usr/bin/env python3
"""Check that retained evidence matches the tested binaries and goal gates."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import subprocess
from analyze_experiments import logs
from benchmark import ROOT


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    expected=json.loads((ROOT/'deps.json').read_text())['flint']['commit']
    base=ROOT/'.deps/flint'
    assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=base,text=True).strip()==expected
    assert not subprocess.check_output(['git','diff','HEAD','--stat'],cwd=base,text=True).strip()
    original=json.loads((ROOT/'results/build-manifest.json').read_text())
    assert digest(base/'libflint.25.0.dylib')==original['sha256']['.deps/flint/libflint.25.0.dylib']
    candidates={}
    for name in ['control','c1-native-lanes','c2-fused-inverse',
                 'c3-tiled-reconstruction','c3-register-reconstruction']:
        manifest=json.loads((ROOT/f'results/candidate-checks/{name}-build.json').read_text())
        assert manifest['flint_commit']==expected
        assert digest(Path(manifest['library']))==manifest['sha256']
        if name!='control':
            assert digest(ROOT/f'patches/{name}.patch')==manifest['patch_sha256']
            output=(ROOT/f'results/candidate-checks/{name}-tests.txt').read_text()
            assert output.count('(PASS)')==(3 if name.startswith('c1') else 4)
        candidates[name]=manifest['sha256']
    validation=json.loads((ROOT/'results/c3-register-validation.json').read_text())
    assert validation['sha256']==candidates['c3-register-reconstruction']
    assert validation['case_count']==len(validation['cases'])==338
    assert validation['comparisons_per_library']==4056
    assert all(c['passed'] and c['patterns_per_library']==12 for c in validation['cases'])
    assert digest(ROOT/'build/validate')==validation['validator_sha256']
    plan=json.loads((ROOT/'experiments/c3-confirmation-plan.json').read_text())
    run_counts={}
    for name in ['c3-register-confirm-1','c3-register-confirm-2',
                 'c3-register-boundaries','control-aa-dual','control-aa-post']:
        directory=ROOT/'results'/name
        metadata=json.loads((directory/'metadata.json').read_text())
        for path,sha in metadata['comparison_sha256'].items():
            assert digest(Path(path))==sha
        groups=defaultdict(list)
        rows=[json.loads(line) for line in (directory/'raw.jsonl').read_text().splitlines()]
        for row in rows: groups[(row['an'],row['bn'],row['operation'])].append(row)
        for case in groups.values():
            assert len(logs(case,'ns_per_op'))==metadata['arguments']['trials']
            assert len(logs(case,'cpu_ns_per_op'))==metadata['arguments']['trials']
        if 'confirm' in name:
            cases={(n,n,'sqr') for n in plan['sizes']}
            cases|={(n,n,'mul') for n in plan['sizes']}
            cases|={(n,n//2,'mul') for n in plan['sizes']}
            assert set(groups)==cases
            assert len(rows)==5412
        run_counts[name]={'cases':len(groups),'batches':len(rows)}
    reports=json.loads((ROOT/'results/confirmation-analysis.json').read_text())
    for report in reports:
        if 'confirm' in report['run']:
            for metric in ['cpu','wall']:
                stat=report['metrics'][metric]['sqr']
                assert stat['cases']==9 and stat['ci95_low_pct']>1
    report={'status':'PASS','flint_commit':expected,'baseline_unchanged':True,
            'candidate_library_sha256':candidates,'runs':run_counts,
            'exact_comparisons_per_library':4056,
            'confirmation_gate':'Both runs: squaring aggregate lower 95% bound exceeds 1% for CPU and wall time'}
    (ROOT/'results/completion-audit.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__=='__main__':main()
