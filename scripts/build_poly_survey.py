#!/usr/bin/env python3
"""Build baseline survey and an isolated, single-thread-only dispatch tracer."""
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS, make_var

DECL = '\nextern ulong bf_poly_counts[16], bf_poly_forward_depths[32], bf_poly_inverse_depths[32], bf_poly_plan[8];\n'
NAMES = ['forward_calls','forward_slots','inverse_calls','inverse_slots','op_mul_calls',
         'op_addmul_calls','op_product_slots','export_calls','export_coefficients',
         'transformed_context_successes','matrix_fft_attempts','matrix_input_phases',
         'matrix_output_phases','op_sqr_calls','op_submul_calls','reserved']
PLAN_NAMES = ['depth','np','stride','offset','length_capacity','terms_bound','max_multiplicative_depth','cyclic']


def insert_body(source, signature, code):
    start = source.index(signature)
    brace = source.index('{',start)+1
    return source[:brace]+'\n'+code+'\n'+source[brace:]


def main():
    expected = json.loads((ROOT/'deps.json').read_text())['flint']['commit']
    assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=BASE,text=True).strip() == expected
    assert not subprocess.check_output(['git','diff','--stat'],cwd=BASE,text=True).strip()
    dest = ROOT/'.deps/experiments/poly-survey-trace'; dest.mkdir(parents=True,exist_ok=False)
    evidence = ROOT/'results/poly-survey-checks'; evidence.mkdir(parents=True,exist_ok=False)
    paths = ['fft_small/sd_fft.c','fft_small/sd_ifft.c','fft_small/op.c',
             'fft_small/nmod_poly_mul.c','gr/nmod_transformed_poly.c','nmod_poly_mat/mulmid_fft_small.c']
    sources, patches = {}, []
    for path in paths:
        original = (BASE/'src'/path).read_text()
        source = original
        if path.startswith('nmod_poly_mat/'):
            source = source.replace('#include "nmod_poly_mat.h"','#include "nmod_poly_mat.h"'+DECL)
            source = insert_body(source,'static int _mulmid_fft_small_direct(', '    bf_poly_counts[10]++;')
            source = insert_body(source,'static void _mm_phase1(', '    bf_poly_counts[11]++;')
            source = insert_body(source,'static void _mm_phase2(', '    bf_poly_counts[12]++;')
        else:
            source = source.replace('#include "fft_small.h"','#include "fft_small.h"'+DECL)
        if path.endswith('/sd_fft.c'):
            source = insert_body(source,'void sd_fft_trunc(',
                '    bf_poly_counts[0]++; bf_poly_counts[1] += 1UL << L; bf_poly_forward_depths[L]++;')
        elif path.endswith('/sd_ifft.c'):
            source = insert_body(source,'void sd_ifft_trunc(',
                '    bf_poly_counts[2]++; bf_poly_counts[3] += 1UL << L; bf_poly_inverse_depths[L]++;')
        elif path.endswith('/op.c'):
            source += '\nulong bf_poly_counts[16], bf_poly_forward_depths[32], bf_poly_inverse_depths[32], bf_poly_plan[8];\n'
            for op, index in [('mul',4),('addmul',5),('sqr',13),('submul',14)]:
                source = insert_body(source,f'void fft_small_op_{op}(',
                    f'    bf_poly_counts[{index}]++; bf_poly_counts[6] += P->np * (1UL << P->depth);')
        elif path.endswith('/nmod_poly_mul.c'):
            source = insert_body(source,'void fft_small_export_nmod_range(',
                '    bf_poly_counts[7]++; bf_poly_counts[8] += zh-zl;')
        elif path.endswith('/nmod_transformed_poly.c'):
            needle = '    ctx->which_ring = GR_CTX_GR_TRANSFORMED_POLY;'
            assert source.count(needle) == 1
            source = source.replace(needle,'''    bf_poly_counts[9]++;
    bf_poly_plan[0]=T->P->depth; bf_poly_plan[1]=T->P->np;
    bf_poly_plan[2]=T->P->stride; bf_poly_plan[3]=T->P->offset;
    bf_poly_plan[4]=T->N; bf_poly_plan[5]=T->terms_bound;
    bf_poly_plan[6]=T->max_depth; bf_poly_plan[7]=T->cyclic;
'''+needle)
        sources[path] = source
        patches.append(''.join(difflib.unified_diff(original.splitlines(True),source.splitlines(True),
                        fromfile='a/src/'+path,tofile='b/src/'+path)))
    patch = ROOT/'patches/poly-survey-trace.patch'; assert not patch.exists()
    patch.write_text(''.join(patches))
    commands, replacements = [], {}
    def run(cmd):
        commands.append(cmd);subprocess.run(cmd,check=True)
    for path, source in sources.items():
        cfile = dest/'src'/path;cfile.parent.mkdir(parents=True,exist_ok=True);cfile.write_text(source)
        obj = dest/(path.replace('/','_')+'.lo')
        run(['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG',
             '-c',str(cfile),'-o',str(obj)])
        replacements['build/'+str(Path(path).with_suffix('.lo'))] = obj
    objects = [BASE/p for p in make_var('SHARED_LIB_DEPS')]
    for module in ['fft_small','gr','nmod_poly_mat']:
        output = dest/(module+'_merged.lo')
        run(['ld','-r',*[str(replacements.get(p,BASE/p)) for p in make_var(module+'_LOBJS')],'-o',str(output)])
        objects = [output if p.name == output.name else p for p in objects]
    library = dest/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',str(library),'-compatibility_version','25.0',
         '-current_version','25.0.0',*map(str,objects),'-o',str(library),*LIBS])
    for name, lib in [('poly-survey',BASE/'libflint.25.0.dylib'),('poly-survey-trace',library)]:
        run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/poly_survey.c'),str(lib),*LIBS,'-o',str(ROOT/'build'/name)])
    files = [ROOT/'bench/poly_survey.c',ROOT/'scripts/build_poly_survey.py',patch,library,
             ROOT/'build/poly-survey',ROOT/'build/poly-survey-trace',BASE/'libflint.25.0.dylib']
    report = {'commands':commands,'count_fields':NAMES,'plan_fields':PLAN_NAMES,
        'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files},
        'scope':'Counters are for one-thread coverage only. Timing harness rejects the instrumented library.'}
    (dest/'build.json').write_text(json.dumps(report,indent=2)+'\n')
    (evidence/'build.json').write_text(json.dumps(report,indent=2)+'\n')


if __name__ == '__main__':
    main()
