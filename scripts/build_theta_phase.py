#!/usr/bin/env python3
"""Isolate the screened conventional all-characteristic theta implementation."""
import difflib
import json
from pathlib import Path
import subprocess

from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS, make_var
from qualify_theory_paths_hard import sha, save


def main():
    dest=ROOT/'.deps/experiments/theta-direct-walsh'
    evidence=ROOT/'results/weighted-phase-application/integration'
    dest.mkdir(parents=True,exist_ok=False);evidence.mkdir(exist_ok=False)
    assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=BASE,text=True).strip()==json.loads((ROOT/'deps.json').read_text())['flint']['commit']
    assert not subprocess.check_output(['git','diff','--stat'],cwd=BASE,text=True).strip()
    baseline=BASE/'libflint.25.0.dylib';before=sha(baseline)
    original=BASE/'src/acb_theta/agm_mul.c';old=original.read_text()
    prototype=ROOT/'bench/theta_phase_candidates.c'
    text=prototype.read_text().split('void bf_theta_direct(',1)[1]
    body=text[text.index('    slong n ='):text.rfind('}')]
    body=body.replace('x+(b^k)','a1+(b^k)').replace('y+b','a2+b')
    start=old.index('    if (all)\n')
    end=old.index('    else\n    {\n        acb_theta_agm_mul_one',start)
    note='''        /* The signs in this interface multiply a2. For each k, take the
           Hadamard transform in b of a1[b XOR k] * a2[b]. This computes
           every res[k*n+a] with n transforms instead of 3*n and needs
           no inverse scaling. This is a conventional Walsh identity. */
'''
    new=old[:start]+'    if (all)\n    {\n'+note+''.join('    '+line+'\n' for line in body.splitlines())+'    }\n'+old[end:]
    path=dest/'agm_mul.c';path.write_text(new)
    patch=ROOT/'patches/theta-direct-walsh.patch'
    with patch.open('x') as out:out.write(''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='a/src/acb_theta/agm_mul.c',tofile='b/src/acb_theta/agm_mul.c')))
    commands=[]
    def run(cmd,name):
        commands.append(cmd)
        proc=subprocess.run(cmd,capture_output=True,text=True)
        (evidence/name).write_text(proc.stdout+proc.stderr);proc.check_returncode()
    obj=dest/'agm_mul.lo'
    run(['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG','-c',str(path),'-o',str(obj)],'compile.log')
    module=dest/'acb_theta_merged.lo'
    objects=make_var('acb_theta_LOBJS');assert 'build/acb_theta/agm_mul.lo' in objects
    run(['ld','-r',*[str(obj if p=='build/acb_theta/agm_mul.lo' else BASE/p) for p in objects],'-o',str(module)],'merge.log')
    full=[BASE/p for p in make_var('SHARED_LIB_DEPS')]
    assert any(p.name=='acb_theta_merged.lo' for p in full)
    lib=dest/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',str(lib),'-compatibility_version','25.0','-current_version','25.0.0',
         *[str(module if p.name=='acb_theta_merged.lo' else p) for p in full],'-o',str(lib),*LIBS],'link.log')
    test=dest/'test-theta'
    run(['clang',*FLAGS,*INCLUDES,str(BASE/'src/acb_theta/test/main.c'),str(lib),*LIBS,'-o',str(test)],'test-compile.log')
    selected=['acb_theta_agm_mul','acb_theta_agm_mul_tight','acb_theta_jet_notransform','acb_theta_ql_exact','acb_theta_jet']
    run([str(test),*selected],'tests.log')
    checker=dest/'theta-phase-check'
    run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/theta_phase_screen.c'),str(prototype),str(lib),*LIBS,'-o',str(checker)],'checker-compile.log')
    run([str(checker),'validate'],'validation.json')
    assert sha(baseline)==before and original.read_text()==old
    files=[Path(__file__).resolve(),path,patch,obj,module,lib,test,checker,prototype,original,baseline,
           ROOT/'bench/theta_phase_screen.c',*sorted(evidence.iterdir())]
    result=dict(status='PASS',library=str(lib),patch=str(patch),tests=selected,commands=commands,
                note='Library integration is correctness-tested. The timing screen measured the identical extracted prototype body, not this rebuilt dylib.',
                baseline_unchanged=True,sha256={str(p):sha(p) for p in files})
    save(evidence/'build.json',result)
    print(json.dumps({k:v for k,v in result.items() if k not in ('sha256','commands')},indent=2))


if __name__=='__main__':main()
