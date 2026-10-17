#!/usr/bin/env python3
"""Exact application matching for the newer weighted phase-frame construction.

No performance claim. Imports the actual sister constructors without changing
them. An ordinary identity is a control, not evidence of construction transfer.
"""
from fractions import Fraction as Q
from itertools import combinations
import json
from pathlib import Path
import subprocess
import sys
import urllib.request

from qualify_theory_paths_hard import ROOT, SISTER, sha, save

sys.path.insert(0,str(SISTER/'scripts'))
from complex_compression import scalar_program, counts, phase_controls
from audit_sparse_fusion import signature, phase_value

DEST=ROOT/'results/weighted-phase-application'


def hadamard(x,p):
    out=x[:];width=1
    while width<len(out):
        for base in range(0,len(out),2*width):
            for i in range(base,base+width):
                a,b=out[i],out[i+width]
                out[i],out[i+width]=(a+b)%p,(a-b)%p
        width*=2
    return out


def theta_checks():
    checked=0
    for g in range(1,7):
        n=1<<g;p=257;i=16;assert i*i%p==p-1
        for a in range(n):
            sig=signature(g,[(a,2)])
            for b in range(n):
                x=[int(t==b) for t in range(n)]
                hx=hadamard(x,p)
                modulated=[v*(-1 if (a&t).bit_count()%2 else 1)%p for t,v in enumerate(x)]
                lhs=hadamard(modulated,p)
                assert lhs==[hx[t^a] for t in range(n)]
                assert all(pow(i,phase_value(g,sig,t),p)==(-1 if (a&t).bit_count()%2 else 1)%p
                           for t in range(n))
                # Full source expression H((Hx)*(H D_a y))/n.
                checked+=n
    # Independent direct-product vs hoisted-transform vs source formulations,
    # on every bilinear basis pair through genus four, including output layout.
    tensor_entries=0
    for g in range(5):
        n=1<<g;p=257;inv=pow(n,-1,p)
        for left in range(n):
            x=[int(b==left) for b in range(n)];hx=hadamard(x,p)
            for right in range(n):
                y=[int(b==right) for b in range(n)];hy=hadamard(y,p)
                for a in range(n):
                    mod=[v*(-1 if (a&b).bit_count()%2 else 1)%p for b,v in enumerate(y)]
                    hm=hadamard(mod,p)
                    original=[v*inv%p for v in hadamard([u*v%p for u,v in zip(hx,hm)],p)]
                    shared=[v*inv%p for v in hadamard([hx[t]*hy[t^a]%p for t in range(n)],p)]
                    for k in range(n):
                        direct=sum((-1 if (a&b).bit_count()%2 else 1)*x[b^k]*y[b] for b in range(n))%p
                        assert original[k]==shared[k]==direct
                        tensor_entries+=1
    return dict(modulation_matrix_entries=checked,bilinear_tensor_entries=tensor_entries,
                ordinary_identity='H D_a = X_a H; C_a squared = X_a',
                source_output='res[k*n+a] = sum_b (-1)^popcount(a&b) x[b XOR k] y[b]',
                attribution='No new weighted phase-frame capability is necessary for either conventional control.')


def weighted_scalar_check():
    checked=0
    for h in (8,10):
        code=scalar_program(h);ts=code['triples'];n=len(ts)
        for col,S in enumerate(ts):
            z=[0]*code['roles']
            for i,slot in code['sources']:z[slot]+=int(i==col)
            for ins,outs in code['gates']:
                for k in ins[1:]:z[ins[0]]+=z[k]
                for k in outs[1:]:z[k]+=z[ins[0]]
            out=[0]*n
            for i,slot,w in code['outputs']:out[i]+=w*z[slot]
            for row,T in enumerate(ts):
                overlap=len(set(S)&set(T))
                direct=Q(1 if overlap==0 else -1 if overlap==2 else 0,2)
                simplified=int(row==col)+Q(1-overlap,2)
                assert out[row]==direct==simplified
                checked+=1
    return dict(coefficients=checked,
                identity='side_T = x_T + (total - sum_{i in T} incident_i)/2',
                limit='Scalar simplification need not satisfy the theoretical binary phase-frame constraints.')


def main():
    output=DEST/'matching.json';assert not output.exists()
    source_dir=DEST/'sources';source_dir.mkdir(exist_ok=False)
    urls={
        'flint-theta.html':'https://flintlib.org/doc/acb_theta.html',
        'quest-pauli.html':'https://quest-kit.github.io/QuEST/group__op__pauligadget.html',
        'quadratic-stabilizer.html':'https://quantum-journal.org/papers/q-2022-09-15-803/'}
    sources=[]
    for name,url in urls.items():
        request=urllib.request.Request(url,headers={'User-Agent':'research-prototype/1.0'})
        data=urllib.request.urlopen(request,timeout=45).read()
        path=source_dir/name;path.write_bytes(data)
        sources.append(dict(url=url,file=str(path),sha256=sha(path)))
    suites=[]
    for pattern in ('test_complex_compression.py','test_compact_controls.py'):
        command=[sys.executable,'-B','-m','unittest','discover','-s','tests','-p',pattern,'-v']
        proc=subprocess.run(command,cwd=SISTER,capture_output=True,text=True)
        path=DEST/(pattern+'.log');path.write_text(proc.stdout+proc.stderr);proc.check_returncode()
        suites.append(dict(command=command,log=str(path),sha256=sha(path)))
    theta=theta_checks();scalar=weighted_scalar_check();frames=phase_controls(8)
    files=[Path(__file__).resolve(),SISTER/'scripts/complex_compression.py',
           SISTER/'scripts/binary_phase_frames.py',SISTER/'scripts/audit_sparse_fusion.py',
           SISTER/'notes/complex-compression.tex',SISTER/'notes/compact-control-movement.tex']
    result=dict(status='PASS',sister_commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=SISTER,text=True).strip(),
        theta=theta,weighted_scalar=scalar,frame_controls=frames,sources=sources,test_suites=suites,
        matches=[
            dict(operation='FLINT acb_theta_agm_mul(all=1)',actual_caller='acb_theta_jet_notransform and ql_exact via agm_mul_tight',
                 decision='Real repeated phase/transform computation; ordinary controls capture identified reuse; benchmark controls separately'),
            dict(operation='FLINT acb_theta_char_shuffle',decision='Already a direct permutation and per-entry root multiplication; no repeated shared-sum phase network identified'),
            dict(operation='QuEST Pauli gadget',decision='C_v equals exp(i*pi/4) R_Xv(pi/2); existing API directly applies the rotation. No actual mixed-bank weighted-frame workload identified'),
            dict(operation='Stabilizer simulation',decision='Existing quadratic-form representations are a necessary control; no new matching application identified'),
            dict(operation='Compact-control selected-bit permutation',decision='Tape bound does not establish RAM saving; four early swaps plus four rotations, or twelve late swaps plus ten rotations, plus repair. No whole-record traffic saving against a direct RAM permutation established')],
        theory_transfer_candidates=0,sha256={str(p):sha(p) for p in files})
    save(output,result)
    print(json.dumps({k:v for k,v in result.items() if k not in ('sha256','sources','test_suites')},indent=2))


if __name__=='__main__':main()
