#!/usr/bin/env python3
"""Isolated shared-input reduction candidate and matched contiguous control."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS,make_var


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('name');ap.add_argument('--prepare',type=int,choices=[0,1],required=True)
    ap.add_argument('--kernel',type=Path,default=ROOT/'bench/poly_prepared.inc')
    a=ap.parse_args();a.kernel=a.kernel.resolve();assert a.name.replace('-','').isalnum()
    assert not subprocess.check_output(['git','diff','--stat'],cwd=BASE,text=True).strip()
    assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=BASE,text=True).strip()==json.loads((ROOT/'deps.json').read_text())['flint']['commit']
    dest=ROOT/'.deps/experiments'/a.name;dest.mkdir(parents=True,exist_ok=False)
    evidence=ROOT/'results'/(a.name+'-build');evidence.mkdir(exist_ok=False)
    sources={};patch=[]
    for path in ['gr/nmod_transformed_poly.c','nmod_poly_mat/mulmid_fft_small.c']:
        old=(BASE/'src'/path).read_text();s=old
        if path.startswith('gr/'):
            code='\n#define BF_PREPARE '+str(a.prepare)+'\n'+a.kernel.read_text()
            needle='static gr_funcptr __tpoly_methods[GR_METHOD_TAB_SIZE];'
            assert s.count(needle)==1;s=s.replace(needle,code+'\n'+needle)
        else:
            s=s.replace('#if FLINT_HAVE_FFT_SMALL','#if FLINT_HAVE_FFT_SMALL\n\n#define BF_PREPARE '+str(a.prepare)+'''\nvoid _bf_tpoly_prepare(gr_ptr,gr_ctx_t);
int _bf_tpoly_contiguous(gr_ptr,gr_srcptr,gr_srcptr,slong,slong,gr_ctx_t);
''',1)
            start=s.index('        a->status |= _gr_set_gr_poly(')
            end=s.index('    }\n}',start)
            s=s[:start]+'''        int status = _gr_set_gr_poly(_MM_TE(a, t), e->coeffs, e->length,
                                          a->ctx, a->tctx);
        a->status |= status;
#if BF_PREPARE
        if (status==GR_SUCCESS && t<a->nA && a->bc>=4 && a->k>=4 && a->k<=16)
            _bf_tpoly_prepare(_MM_TE(a,t),a->tctx);
#endif
'''+s[end:]
            start=s.index('        a->status |= gr_mul(acc,')
            end=s.index('        nmod_poly_fit_length(entry,',start)
            original=s[start:end]
            s=s[:start]+'''        int fast=GR_UNABLE;
        if (a->bc>=4 && a->k>=4 && a->k<=16)
            fast=_bf_tpoly_contiguous(acc,_MM_TE(a,i*a->k),
                    a->share?_MM_TE(a,j):_MM_TE(a,a->nA+j),a->k,a->bc,a->tctx);
        if (fast!=GR_SUCCESS)
        {
'''+original+'''        }

'''+s[end:]
        sources[path]=s
        patch.append(''.join(difflib.unified_diff(old.splitlines(True),s.splitlines(True),fromfile='a/src/'+path,tofile='b/src/'+path)))
    patchfile=ROOT/'patches'/(a.name+'.patch')
    with patchfile.open('x') as f:f.write(''.join(patch))
    commands=[];objects=[BASE/p for p in make_var('SHARED_LIB_DEPS')]
    def run(cmd):commands.append(cmd);subprocess.run(cmd,check=True)
    for path,s in sources.items():
        cfile=dest/'src'/path;cfile.parent.mkdir(parents=True,exist_ok=True);cfile.write_text(s)
        obj=dest/(Path(path).stem+'.lo')
        common=['clang',*FLAGS,*INCLUDES,'-DBUILDING_FLINT','-DFLINT_NOSTDIO','-DFLINT_NOSTDARG']
        run([*common,'-c',str(cfile),'-o',str(obj)])
        if path.startswith('gr/'):run([*common,'-S',str(cfile),'-o',str(evidence/'gr.s')])
        module=path.split('/')[0];merged=dest/(module+'_merged.lo')
        replaced='build/'+str(Path(path).with_suffix('.lo'))
        run(['ld','-r',*[str(obj if p==replaced else BASE/p) for p in make_var(module+'_LOBJS')],'-o',str(merged)])
        objects=[merged if p.name==merged.name else p for p in objects]
    lib=dest/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',str(lib),'-compatibility_version','25.0','-current_version','25.0.0',*map(str,objects),'-o',str(lib),*LIBS])
    binary=dest/'poly-survey'
    run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/poly_survey.c'),str(lib),*LIBS,'-o',str(binary)])
    files=[Path(__file__).resolve(),a.kernel,ROOT/'bench/poly_survey.c',patchfile,lib,binary,BASE/'libflint.25.0.dylib',evidence/'gr.s',*[dest/'src'/p for p in sources]]
    report={'name':a.name,'prepare':a.prepare,'kernel':str(a.kernel.relative_to(ROOT)),'commands':commands,'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    for p in [dest/'build.json',evidence/'build.json']:p.write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':main()
