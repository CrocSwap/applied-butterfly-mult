#!/usr/bin/env python3
"""Generate three independent ablation patches from the retained C3 patch."""
import difflib
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
REL=Path('src/fft_small/mpn_mul_np2.c')


def replace_once(source, old, new):
    assert source.count(old)==1, old
    return source.replace(old,new,1)


def main():
    original=(ROOT/'.deps/flint'/REL).read_text()
    with tempfile.TemporaryDirectory() as work:
        target=Path(work)/REL
        target.parent.mkdir(parents=True)
        target.write_text(original)
        subprocess.run(['patch','-p1','-i',str(ROOT/'patches/c3-register-reconstruction.patch')],
                       cwd=work,check=True,capture_output=True)
        retained=target.read_text()
    begin=retained.index('    for (ulong start=0;start<jtop;start+=8)')
    conversion=retained.index('        ulong rr[8],ttv[8];',begin)
    producer=retained[begin:conversion]
    no_fusion=retained[:begin]+producer+'''        vec8d_store(d0+start,r1);
        vec8d_store(d1+start,t);
    }
    for (ulong start=0;start<jtop;start+=8)
    {
        vec8d r1=vec8d_load(d0+start),t=vec8d_load(d1+start);
'''+retained[conversion:]
    old='''        vec4n_store_unaligned(rr,vec4d_convert_limited_vec4n(r1.e1));
        vec4n_store_unaligned(rr+4,vec4d_convert_limited_vec4n(r1.e2));
        vec4n_store_unaligned(ttv,vec4d_convert_limited_vec4n(t.e1));
        vec4n_store_unaligned(ttv+4,vec4d_convert_limited_vec4n(t.e2));'''
    new='''        double rd[8],td[8];
        vec8d_store(rd,r1);vec8d_store(td,t);
'''+ '\n'.join(f'        rr[{k}]=(ulong)rd[{k}];ttv[{k}]=(ulong)td[{k}];' for k in range(8))
    scalar=replace_once(retained,old,new)
    carry=replace_once(retained,'if (w0<w) {','while (w0<w) {')
    old='''        if (start+8<=jtop)
        {
            BF_EMIT(0);BF_EMIT(1);BF_EMIT(2);BF_EMIT(3);
            BF_EMIT(4);BF_EMIT(5);BF_EMIT(6);BF_EMIT(7);
        }
        else
        {
            for (ulong k=0;k<jtop-start;k++) { BF_EMIT(k); }
            break;
        }'''
    carry=replace_once(carry,old,'''        for (ulong k=0;k<FLINT_MIN(8,jtop-start);k++) { BF_EMIT(k); }''')
    for name,source in [('no-fusion',no_fusion),('scalar-conversion',scalar),('general-carry',carry)]:
        source=source.replace('/* Full/low-product reconstruction from private transform scratch.',
                              f'/* Ablation: {name}. Full/low-product reconstruction from private transform scratch.')
        patch=''.join(difflib.unified_diff(original.splitlines(True),source.splitlines(True),
                                         fromfile='a/'+str(REL),tofile='b/'+str(REL)))
        (ROOT/f'patches/ablation-{name}.patch').write_text(patch)


if __name__=='__main__':main()
