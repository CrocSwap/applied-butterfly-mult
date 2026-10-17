#!/usr/bin/env python3
"""Exploratory inverse-only timing after the whole-operation coverage audit."""
import hashlib
import json
import random
import subprocess
from build_experiment import ROOT, FLAGS, INCLUDES, LIBS
from benchmark import metadata
from compare import summarize
from analyze_experiments import logs


def main():
    plan = {
        'scope': 'Exploratory complete public inverse transforms, NOT integer multiplication or application confirmation.',
        'sizes': [128,256,512,1024], 'trials': 41, 'batch_ms': 10,
        'baseline': '.deps/flint/libflint.25.0.dylib',
        'runs': [
            {'name': 'inverse-only-aa', 'candidate': 'control', 'seed': 98713},
            {'name': 'inverse-only-screen', 'candidate': 'delayed-reduction', 'seed': 21893},
            {'name': 'inverse-only-repeat', 'candidate': 'delayed-reduction', 'seed': 67139}],
        'decision': 'Report every size. 128 and 512 execute the changed leaf; 256 and 1024 are inactive controls. '
                    'Require a positive CPU interval in both candidate runs for a local speedup; no extrapolation to multiplication.'}
    plan_path = ROOT/'experiments/inverse-only-plan.json'
    if plan_path.exists():
        assert json.loads(plan_path.read_text()) == plan
    else:
        with plan_path.open('x') as f:
            json.dump(plan, f, indent=2); f.write('\n')
    binary = ROOT/'build/compare-inverse'
    command = ['clang', *FLAGS, *INCLUDES, str(ROOT/'bench/compare_inverse.c'), *LIBS, '-o', str(binary)]
    subprocess.run(command, check=True)
    reports = []
    for run in plan['runs']:
        dest = ROOT/'results'/run['name']; dest.mkdir(exist_ok=False)
        baseline = ROOT/plan['baseline']
        candidate = ROOT/f".deps/experiments/{run['candidate']}/libflint-experiment.dylib"
        files = [baseline, candidate, binary, ROOT/'bench/compare_inverse.c']
        info = metadata()
        info.update({'plan':plan,'run':run,'compile_command':command,
                     'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}})
        (dest/'metadata.json').write_text(json.dumps(info,indent=2)+'\n')
        sizes = plan['sizes'].copy(); random.Random(run['seed']).shuffle(sizes)
        summaries = []
        with (dest/'raw.jsonl').open('x') as raw:
            for n in sizes:
                output = subprocess.check_output([str(binary),str(baseline),str(candidate),str(n),
                                                  str(plan['trials']),str(plan['batch_ms'])],text=True)
                raw.write(output);raw.flush()
                rows = [json.loads(line) for line in output.splitlines()]
                for metric in ['cpu_ns_per_op','ns_per_op']:
                    assert len(logs(rows,metric)) == plan['trials']
                result = {'n':n, 'cpu':summarize(rows,metric='cpu_ns_per_op'),
                          'wall':summarize(rows,metric='ns_per_op')}
                summaries.append(result)
                print(run['name'],n,json.dumps(result['cpu']),flush=True)
        reports.append({'run':run['name'],'cases':sorted(summaries,key=lambda x:x['n'])})
        (ROOT/'results/inverse-only-analysis.json').write_text(json.dumps(reports,indent=2)+'\n')


if __name__ == '__main__':
    main()
