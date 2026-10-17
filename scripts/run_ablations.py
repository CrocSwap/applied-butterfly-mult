#!/usr/bin/env python3
"""Run the prespecified ablation and application series sequentially."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[1]


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prefix',default='ablation',help='new results directory prefix')
    parser.add_argument('--pi-prefix',default='pi',help='new application results directory prefix')
    parser.add_argument('--validation-prefix',default='ablation',help='prefix of existing validation JSON files')
    args=parser.parse_args()
    for prefix in [args.prefix,args.pi_prefix,args.validation_prefix]:
        if not prefix.replace('-','').replace('_','').isalnum(): parser.error('invalid prefix')
    plan=json.loads((ROOT/'experiments/ablation-plan.json').read_text())
    winner=ROOT/'.deps/experiments/c3-register-reconstruction/libflint-experiment.dylib'
    control=ROOT/'.deps/experiments/control/libflint-experiment.dylib'
    for name in plan['ablations']:
        validation=json.loads((ROOT/f'results/{args.validation_prefix}-{name}-validation.json').read_text())
        assert validation['case_count']==338 and all(c['passed'] for c in validation['cases'])
        library=ROOT/f'.deps/experiments/ablation-{name}/libflint-experiment.dylib'
        assert hashlib.sha256(library.read_bytes()).hexdigest()==validation['sha256']
    def run(script,*args):
        command=[sys.executable,str(ROOT/'scripts'/script),*map(str,args)]
        print('RUN',json.dumps(command),flush=True)
        subprocess.run(command,cwd=ROOT,check=True)
    common=['--binary','build/compare-dual','--metric','cpu',
            '--trials',plan['trials'],'--batch-ms',plan['batch_ms']]
    for name,candidate in [('control',control),('retained-check',winner)]:
        run('compare.py',*common,'--candidate',candidate,'--sizes',4096,8192,16384,
            '--output',f'results/{args.prefix}-{name}')
    for session,seed in enumerate(plan['seeds'],1):
        order=list(plan['ablations']);random.Random(seed).shuffle(order)
        for name in order:
            run('compare.py',*common,'--baseline',
                ROOT/f'.deps/experiments/ablation-{name}/libflint-experiment.dylib',
                '--candidate',winner,'--sizes',*plan['sizes'],'--seed',seed,
                '--output',f'results/{args.prefix}-{name}-{session}')
    app=plan['application']
    for name,candidate,seed in [('control',control,71391),('confirm-1',winner,71391),('confirm-2',winner,31917)]:
        run('compare_pi.py','--candidate',candidate,'--precisions',*app['precisions_bits'],
            '--trials',app['trials'],'--batch-ms',app['batch_ms'],'--seed',seed,
            '--output',f'results/{args.pi_prefix}-{name}')


if __name__=='__main__':main()
