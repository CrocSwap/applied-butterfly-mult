#!/usr/bin/env python3
"""Build isolated four-column matrix tiles, with or without shared reductions."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS,make_var

PHASE2=r'''
static void _mm_phase2(void * varg)
{
    _mm_arg *a=(_mm_arg *)varg;
    slong nin=a->nA+a->nB, width=a->tile_width;
    slong groups=(a->bc+width-1)/width;
    for (slong t=a->tid;t<a->ar*groups;t+=a->nthreads)
    {
        slong i=t/groups, j=(t%groups)*width;
        slong count=FLINT_MIN(width,a->bc-j);
        gr_ptr acc=_MM_TE(a,nin+width*a->tid);
        int fast=GR_UNABLE;
        if (count==4)
            fast=_bf_tpoly_dot4(acc,_MM_TE(a,i*a->k),
                    a->share?_MM_TE(a,j):_MM_TE(a,a->nA+j),
                    a->k,a->bc,a->tctx);
        for (slong c=0;c<count;c++)
        {
            gr_ptr z=_MM_TE(a,nin+width*a->tid+c);
            nmod_poly_struct *entry=nmod_poly_mat_entry(a->C,i,j+c);
            if (fast!=GR_SUCCESS)
            {
                a->status|=gr_mul(z,_MM_TE(a,i*a->k),
                        a->share?_MM_TE(a,j+c):_MM_TE(a,a->nA+j+c),a->tctx);
                for (slong l=1;l<a->k;l++)
                    a->status|=gr_addmul(z,_MM_TE(a,i*a->k+l),
                        a->share?_MM_TE(a,l*a->k+j+c):_MM_TE(a,a->nA+l*a->bc+j+c),a->tctx);
            }
            nmod_poly_fit_length(entry,a->wlen);
            a->status|=_gr_nmod_tpoly_get_gr_poly_window_destructive(
                        entry->coeffs,z,a->zl,a->hi,a->tctx);
            if (a->wlen>a->hi-a->zl)
                _nmod_vec_zero(entry->coeffs+a->hi-a->zl,a->wlen-(a->hi-a->zl));
            _nmod_poly_set_length(entry,a->wlen);_nmod_poly_normalise(entry);
        }
    }
}
'''


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('name');ap.add_argument('--share',type=int,choices=[0,1],required=True)
    a=ap.parse_args()
    assert a.name.replace('-','').isalnum()
    assert not subprocess.check_output(['git','diff','--stat'],cwd=BASE,text=True).strip()
    assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=BASE,text=True).strip()==json.loads((ROOT/'deps.json').read_text())['flint']['commit']
    dest=ROOT/'.deps/experiments'/a.name;dest.mkdir(parents=True,exist_ok=False)
    evidence=ROOT/'results'/(a.name+'-build');evidence.mkdir(exist_ok=False)
    sources={};patch=[]
    for path in ['gr/nmod_transformed_poly.c','nmod_poly_mat/mulmid_fft_small.c']:
        old=(BASE/'src'/path).read_text();s=old
        if path.startswith('gr/'):
            code='\n#define BF_SHARE '+str(a.share)+'\n'+(ROOT/'bench/poly_dot4.inc').read_text()+'\n'+(ROOT/'bench/poly_dot4_dispatch.inc').read_text()
            needle='static gr_funcptr __tpoly_methods[GR_METHOD_TAB_SIZE];'
            assert s.count(needle)==1;s=s.replace(needle,code+'\n'+needle)
        else:
            s=s.replace('#if FLINT_HAVE_FFT_SMALL','#if FLINT_HAVE_FFT_SMALL\n\nint _bf_tpoly_dot4(gr_ptr,gr_srcptr,gr_srcptr,slong,slong,gr_ctx_t);',1)
            s=s.replace('    int share;','    int share;\n    slong tile_width;',1)
            start=s.index('static void _mm_phase2(');end=s.index('static int _mulmid_fft_small_direct(',start)
            s=s[:start]+PHASE2+'\n'+s[end:]
            s=s.replace('    slong nB;','    slong nB;\n    slong tile_width=(bc>=4 && k<=16)?4:1;',1)
            s=s.replace('nB + flint_get_num_available_threads()', 'nB + tile_width*flint_get_num_available_threads()')
            s=s.replace('ar * k + nB + nthreads, tctx','ar * k + nB + tile_width*nthreads, tctx')
            s=s.replace('        args[i].share = share;','        args[i].share = share;\n        args[i].tile_width = tile_width;')
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
        if path.startswith('gr/'):
            run([*common,'-S',str(cfile),'-o',str(evidence/'gr.s')])
        module=path.split('/')[0];merged=dest/(module+'_merged.lo')
        replaced='build/'+str(Path(path).with_suffix('.lo'))
        run(['ld','-r',*[str(obj if p==replaced else BASE/p) for p in make_var(module+'_LOBJS')],'-o',str(merged)])
        objects=[merged if p.name==merged.name else p for p in objects]
    lib=dest/'libflint-experiment.dylib'
    run(['clang',*FLAGS,'-shared','-install_name',str(lib),'-compatibility_version','25.0','-current_version','25.0.0',*map(str,objects),'-o',str(lib),*LIBS])
    binary=dest/'poly-survey'
    run(['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/poly_survey.c'),str(lib),*LIBS,'-o',str(binary)])
    files=[Path(__file__).resolve(),ROOT/'bench/poly_dot4.inc',ROOT/'bench/poly_dot4_dispatch.inc',ROOT/'bench/poly_survey.c',patchfile,lib,binary,BASE/'libflint.25.0.dylib',evidence/'gr.s']
    report={'name':a.name,'share':a.share,'commands':commands,'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    for p in [dest/'build.json',evidence/'build.json']:p.write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':main()
