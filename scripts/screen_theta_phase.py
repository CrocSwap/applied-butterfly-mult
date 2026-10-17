#!/usr/bin/env python3
"""Prepare and measure conventional controls at a real FLINT phase call site.

This is an application screen for the new theory; candidates are explicitly
ordinary Walsh identities, not uses of the new weighted phase-frame compiler.
Preparation, validation and timing are separate stages. Fresh directories only.
"""
import argparse
import json
from pathlib import Path
import random
import subprocess
import sys

from qualify_theory_paths_hard import ROOT, SISTER, frozen_hashes, sha, save
from compare import summarize


def previous():
    frozen=frozen_hashes()
    for file in ('results/theory-paths-hard/run/validation.json',
                 'results/theory-paths-hard/run/summary.json',
                 'results/theory-paths-hard/fallback-checks/summary.json',
                 'results/theory-paths-hard/completion.json',
                 'results/kernel-construction-screen/summary.json',
                 'results/kernel-construction-screen/audit.json',
                 'results/kernel-construction-screen/completion.json'):
        p=ROOT/file;frozen[str(p)]=sha(p)
        data=json.loads(p.read_text())
        frozen.update(data.get('sha256',{}));frozen.update(data.get('frozen_sha256',{}))
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    return frozen


def prepare(dest):
    dest.mkdir(parents=True,exist_ok=False)
    frozen=previous()
    baseline=ROOT/'.deps/flint/libflint.25.0.dylib'
    files=[Path(__file__).resolve(),ROOT/'bench/theta_phase_candidates.c',
           ROOT/'bench/theta_phase_screen.c',baseline,ROOT/'scripts/compare.py']
    files += [ROOT/'.deps/flint/src/acb_theta'/s for s in
              ('agm_mul.c','agm_mul_tight.c','char_dot.c','char_shuffle.c','ql_exact.c','jet_notransform.c')]
    files += [SISTER/'scripts'/s for s in ('complex_compression.py','binary_phase_frames.py')]
    files += [SISTER/'notes/complex-compression.tex',SISTER/'notes/compact-control-movement.tex']
    fingerprints={str(p):sha(p) for p in files}
    command=['clang','-std=gnu23','-O3','-g','-mcpu=apple-m2','-fno-omit-frame-pointer',
             '-I'+str(ROOT/'.deps/flint/src'),'-I/opt/homebrew/opt/gmp/include',
             '-I/opt/homebrew/opt/mpfr/include',str(ROOT/'bench/theta_phase_screen.c'),
             str(ROOT/'bench/theta_phase_candidates.c'),str(baseline),
             '-L/opt/homebrew/opt/gmp/lib','-L/opt/homebrew/opt/mpfr/lib','-lgmp','-lmpfr',
             '-o',str(dest/'theta-phase-screen')]
    cases=[dict(g=g,prec=p,square=sq,all=1) for g in range(1,6) for p in (128,512) for sq in (0,1)]
    comparisons=[]
    for run,seed in enumerate((8300129,9700153),1):
        for c in cases:
            for base,candidate in ((0,2),(0,3),(2,3)):
                comparisons.append(dict(**c,run=run,seed=seed,base=base,candidate=candidate,trials=21))
    # Same-function, unchanged-source, and inactive-all=0 controls.
    for g in (2,4):
        for base,candidate,all_ in ((0,0,1),(0,1,1),(0,3,0)):
            comparisons.append(dict(g=g,prec=128,square=0,all=all_,run=0,seed=8300129,
                                    base=base,candidate=candidate,trials=21))
    random.Random(1091031).shuffle(comparisons)
    plan=dict(scope='Complete public-operation-sized calls on warm synthetic complex balls; no downstream theta-function timing',
        methods={0:'pinned_library',1:'unchanged_source_copy',2:'shared_input_Walsh',3:'direct_product_Walsh'},
        theory_attribution='Both new implementations are conventional controls. No weighted phase-frame construction is used.',
        operation='res[k*n+a] = sum_b (-1)^popcount(a&b) x[b XOR k] y[b]; source signs the second input',
        all_zero='Unchanged original implementation',
        aliasing='Equal input pointers tested; output/input aliasing for all=1 is not promised by this experiment',
        timing='21 ABBA/BAAB quartets, 5ms calibration on slower member, equal reps, 20ms joint warmup, CPU+wall; all per-call allocation and transforms included',
        promotion='An implementation must show >5% CPU saving with positive CPU and wall intervals in both seeds in a case; all cases retained. No speedup attributed to theory without a construction-specific ablation.',
        compile_command=command,comparisons=comparisons,sha256=fingerprints)
    save(dest/'plan.json',plan)
    proc=subprocess.run(command,capture_output=True,text=True)
    (dest/'compile.log').write_text(proc.stdout+proc.stderr);proc.check_returncode()
    validation=json.loads(subprocess.check_output([str(dest/'theta-phase-screen'),'validate'],text=True))
    for p,h in {**frozen,**fingerprints}.items():assert sha(ROOT/p)==h,p
    fingerprints.update({str(p):sha(p) for p in (dest/'theta-phase-screen',dest/'plan.json',dest/'compile.log')})
    save(dest/'validation.json',dict(**validation,frozen_sha256=frozen,sha256=fingerprints))
    print(json.dumps(validation,indent=2))


def measure(dest):
    assert not (dest/'raw.jsonl').exists()
    validation=json.loads((dest/'validation.json').read_text())
    for p,h in {**validation['sha256'],**validation['frozen_sha256']}.items():assert sha(ROOT/p)==h,p
    plan=json.loads((dest/'plan.json').read_text())
    summaries=[];accuracies=[]
    with (dest/'raw.jsonl').open('x') as output:
        for index,c in enumerate(plan['comparisons']):
            command=[str(dest/'theta-phase-screen'),*[str(c[k]) for k in
                     ('g','prec','square','base','candidate','trials','seed','all')]]
            raw=subprocess.check_output(command,text=True)
            parsed=[json.loads(line) for line in raw.splitlines()]
            assert parsed[0]['kind']=='accuracy'
            accuracies.append(dict(index=index,**c,**parsed[0]))
            rows=parsed[1:]
            assert len(rows)==4*c['trials']
            for row in rows:output.write(json.dumps(dict(index=index,**c,**row))+'\n')
            output.flush()
            summaries.append(dict(index=index,**c,cpu=summarize(rows,metric='cpu_ns_per_op'),
                                  wall=summarize(rows)))
            print(index+1,'/',len(plan['comparisons']),c,'cpu',round(summaries[-1]['cpu']['reduction_pct'],2),flush=True)
    for p,h in {**validation['sha256'],**validation['frozen_sha256']}.items():assert sha(ROOT/p)==h,p
    save(dest/'summary.json',dict(status='PASS',summaries=summaries,accuracies=accuracies,
        sha256={str(p):sha(p) for p in (dest/'validation.json',dest/'plan.json',dest/'raw.jsonl',Path(__file__).resolve())}))


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--stage',choices=['prepare','measure'],required=True)
    parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args()
    (prepare if args.stage=='prepare' else measure)(args.output.resolve())
