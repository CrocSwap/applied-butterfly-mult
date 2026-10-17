#!/usr/bin/env python3
"""Small exact source checks for the 2026-10-08 theory refresh; not a benchmark."""
import sys
sys.dont_write_bytecode = True
import importlib.util, json, math
from fractions import Fraction as Q
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
SISTER=ROOT.parent/'integerMult'
OUT=ROOT/'results/theory-refresh-20261008'
spec=importlib.util.spec_from_file_location('refresh_pair_graph',SISTER/'research/pair-assembly/pair_graph.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class Adder:
    def __init__(self):self.additions=0
    def add(self,a,b):
        if not a:return b
        if not b:return a
        assert not a&b
        self.additions+=1
        return a|b
checks=[]
for k in range(1,14):
    for name,layout in [('prefix_suffix',m.prefix_suffix),('skip_prefix',m.skip_prefix),
                         ('interval',m.interval_layout(m.skip_prefix))]:
        c=Adder();full=(1<<k)-1;total,out=layout(c,[1<<i for i in range(k)])
        assert total==full and out==[full^(1<<i) for i in range(k)]
        checks.append(dict(k=k,layout=name,unpruned_nonzero_add_calls=c.additions))
p=512;alpha=8;s=1031;t=1280;theta=Q(t-s,s)
assert p>100 and math.gcd(s,t)==1 and 2<=s<t<2**p
assert 2<=alpha and alpha**2<p and Q(p,alpha**4)<theta<=Q(1,4)
assert alpha**2*theta>=1
old=math.ceil(Q(p,alpha**2)/theta)
new=min(old,math.ceil(Q(p+1,4*alpha**2)+1/theta))
assert 4*alpha**2/theta-4*alpha**2*new<=-p-1
rows=[]
for h,oldc,newc,oldr,newr,compiled in [(23,40329,62294,32946,28719,27918),(25,53475,86595,43409,37676,36586)]:
    rows.append(dict(h=h,pr53_additions=oldc,pr62_additions=newc,addition_increase_pct=100*(newc/oldc-1),
        pr53_roles=oldr,pr62_roles=newr,role_reduction_pct=100*(1-newr/oldr),joint_compiled_roles=compiled))
result=dict(scope='Source-level algebra and declared resource counts only; no time/memory benchmark or complete theorem audit',
    strip_checks=checks,strip_count_caveat='Raw nonzero add requests before pruning/hash-consing; not a peak-live-memory model',
    reported_network_tradeoffs=rows,
    gaussian_power_bound_example=dict(p=p,alpha=alpha,s=s,t=t,theta=str(theta),old_sufficient_terms=old,new_sufficient_terms=new,
        scope='Sufficient bound for norm(E^n), not observed convergence or complete DFT speedup; stronger conventional norm/residual bounds untested'))
OUT.mkdir(exist_ok=True)
(OUT/'small-checks.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='strip_checks'},indent=2))

# Stronger conventional comparator for the specific Gaussian E operator.
# For |h|>=2, X_{j,h}>=(sigma*|h|-1/2)^2-1/4.
# Consecutive lower bounds grow by at least 5*sigma^2-sigma, so the
# entire tail is dominated by a geometric series. pi/log(2)>4.5 follows
# from the source's explicit 4.531 lower bound. Flooring each exponent
# gives an exact rational upper bound; no floating exp/log is used.
sigma=Q(t,s)
beta=[sigma*j-math.floor(sigma*j+Q(1,2)) for j in range(s)]
assert all(abs(b)<=Q(1,2) for b in beta)
nearest=[min((sigma*h+beta[j])**2-beta[(j+h)%s]**2 for j in range(s)) for h in (-1,1)]
norm_rows=[]
for precision,a in [(512,8),(4096,16),(16384,24),(65536,32)]:
    assert Q(precision,a**4)<theta and a*a<precision and a*a*theta>=1
    K=Q(9,2)*a*a
    m=[math.floor(K*x) for x in nearest]
    tail=math.floor(K*(4*sigma**2-2*sigma))
    gap=math.floor(K*(5*sigma**2-sigma))
    r=sum(Q(1,2**v) for v in m)+2*Q(1,2**tail)/(1-Q(1,2**gap))
    assert 0<r<1
    n=1
    while r**n>Q(1,2**precision):n+=1
    assert r**(n-1)>Q(1,2**precision)
    old=math.ceil(Q(precision,a*a)/theta)
    new=min(old,math.ceil(Q(precision+1,4*a*a)+1/theta))
    assert 4*a*a/theta-4*a*a*new<=-precision-1
    norm_rows.append(dict(p=precision,alpha=a,old_bound_terms=old,new_power_bound_terms=new,
        ordinary_one_step_norm_bound_terms=n,nearest_shift_exponents=m,
        tail_initial_exponent=tail,tail_ratio_exponent=gap))
result['stronger_gaussian_comparator']=dict(rows=norm_rows,
    interpretation='Certified upper bounds for the same E^n, not measured iteration counts, an optimal norm certificate, or an inverse-error/runtime comparison. Each row holds alpha fixed across methods; joint parameter optimization and sharper conventional certificates remain required.')
(OUT/'small-checks.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result['stronger_gaussian_comparator'],indent=2))
