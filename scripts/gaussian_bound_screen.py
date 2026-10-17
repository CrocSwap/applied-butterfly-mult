#!/usr/bin/env python3
"""Exact finite certificate screen for a Gaussian Neumann solve, no runtime claim.
All arithmetic affecting certification is integer/rational. No matrix coefficients
are rounded with ordinary floating point; exp(-pi*a^2*X)<=2^-floor(4.531*a^2*X).
"""
import sys
sys.dont_write_bytecode=True
import hashlib,json,math,random,time
from fractions import Fraction as Q
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'results/gaussian-bound-screen'
LO=Q(4531,1000);HI=Q(2267,500)

def save(path,data):
    with path.open('x') as f:json.dump(data,f,indent=2);f.write('\n')
def digest(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def dyadic_ceiling(exponents,bits=32):
    """Return f with sum(2^-e)<=2^-f. Positive, outward rounded sum."""
    m=min(exponents)
    total=sum((1<<(bits-(e-m))) if e-m<=bits else 1 for e in exponents)
    # total*2^(-bits-m) <= 2^(ceil(log2(total))-bits-m).
    return m+bits-(total-1).bit_length()
def tails(sigma,a,H):
    h=H+1
    start=math.floor(LO*a*a*(sigma*sigma*h*h-sigma*h))
    gap=math.floor(LO*a*a*(sigma*sigma*(2*h+1)-sigma))
    assert gap>=1
    # Both tails <= 2*2^-start/(1-2^-gap) <= 2^(2-start).
    return start-2

def weights(s,t,a,H):
    # beta_j=B_j/(2s); integer numerator gives exact X/(4s^2).
    B=[2*t*j-2*s*((2*t*j+s)//(2*s)) for j in range(s)]
    assert all(abs(x)<=s for x in B)
    hs=[h for h in range(-H,H+1) if h]
    edges=[]
    for j in range(s):
        row=[]
        for h in hs:
            k=(j+h)%s
            num=(2*t*h+B[j])**2-B[k]**2
            assert num>=0
            w=(4531*a*a*num)//(4000*s*s)
            row.append((k,w))
        edges.append(row)
    return edges

def counts(s,t,p,a):
    sigma=Q(t,s);theta=sigma-1;q=p+3
    assert 0<theta<=Q(1,4) and math.gcd(s,t)==1
    assert a>=2 and a*a<p and theta>Q(p,a**4) and a*a*theta>1
    H=1
    while tails(sigma,a,H)<p+4:H+=1
    E=weights(s,t,a,H)
    old=math.ceil(Q(q,a*a)/theta)
    simple=min(old,math.ceil(Q(q+1,4*a*a)+1/theta))
    B=1/(4*theta)+Q(1,2)
    lemma=math.ceil((q+HI*a*a*B)/(LO*a*a*sigma-Q(101,100)))
    theory=min(old,simple,lemma)
    # Independent, general positive-matrix power propagation on an upper matrix.
    # Each row sum starts at 1; update by outward rounding to one power of two.
    f=[0]*s;cert=[]
    for n in range(1,max(old,theory)+1):
        f=[dyadic_ceiling([w+f[k] for k,w in row]) for row in E]
        cert.append(min(f))
        if min(f)>=q:break
    direct=next((n for n,v in enumerate(cert,1) if v>=q),None)
    assert direct is not None
    # General repeated k-step norm bounds, reusing the same finite certificates.
    one=math.ceil(Q(q,cert[0]));blocks={}
    for k in (2,4,8):
        if len(cert)>=k:
            opts=[]
            for n in range(1,max(old,one)+1):
                m,r=divmod(n,k)
                if m*cert[k-1]+(cert[r-1] if r else 0)>=q:opts.append(n);break
            blocks[str(k)]=opts[0] if opts else None
    # A simple conventional analytic bound uses h=+-1 and the full tail.
    near=weights(s,t,a,1)
    rbits=dyadic_ceiling([min(w for row in near for k,w in row)-1,tails(sigma,a,1)])
    conventional_one=math.ceil(Q(q,rbits))
    conventional=min(direct,one,conventional_one,*[v for v in blocks.values() if v])
    # Proxy only: width of original S Gaussian window, not a runtime selector.
    swidth=2*math.ceil(math.sqrt(p))*a+1
    return dict(s=s,t=t,p=p,alpha=a,H=H,retained_edges=s*2*H,tail_bound_bits=tails(sigma,a,H),
        power_target_bits=q,older_theory_terms=old,simplified_theory_terms=simple,sharp_lemma_terms=lemma,
        theory_terms=theory,ordinary_one_step_terms=conventional_one,rounded_one_step_terms=one,
        block_terms=blocks,finite_power_terms=direct,ordinary_best_terms=conventional,
        strict_term_advantage=theory<conventional,power_certificate_bits=cert,
        resampling_window_width_proxy=swidth,
        correctness='For ||b||inf<=1, ||E||<1/2. Gaussian omission <=2^(-p-4), inverse perturbation <=2^(-p-2), series error <=2^(-p-2). Reserve 2^(-p-1) for numerical arithmetic; no numerical solve performed.')

def test():
    rng=random.Random(81234);checks=0
    for _ in range(500):
        es=[rng.randrange(0,100) for _ in range(rng.randrange(1,16))]
        f=dyadic_ceiling(es)
        actual=sum(Q(1,1<<e) for e in es)
        bound=Q(1,1<<f) if f>=0 else Q(1<<(-f))
        assert actual<=bound;checks+=1
    # Independent direct Fraction Gaussian exponents check integer construction.
    for s,t,a,H in [(5,6,3,2),(9,10,4,3),(31,36,5,2)]:
        sigma=Q(t,s);beta=[sigma*j-math.floor(sigma*j+Q(1,2)) for j in range(s)]
        E=weights(s,t,a,H)
        hs=[h for h in range(-H,H+1) if h]
        for j,row in enumerate(E):
            for h,(k,w) in zip(hs,row):
                X=(sigma*h+beta[j])**2-beta[k]**2
                assert k==(j+h)%s and w==math.floor(LO*a*a*X);checks+=1
        # Full exact positive dyadic matrix powers vs outward-rounded propagation.
        exact=[Q(1)]*s;f=[0]*s
        for n in range(1,5):
            exact=[sum(Q(1,1<<w)*exact[k] for k,w in row) for row in E]
            f=[dyadic_ceiling([w+f[k] for k,w in row]) for row in E]
            assert all(x<=Q(1,1<<e) for x,e in zip(exact,f));checks+=s
        # Bound explicit h=H+1..H+20 tail with exact dyadic exponent floors.
        delta_bits=tails(sigma,a,H)
        for j in range(s):
            sm=Q(0)
            for h in list(range(H+1,H+21))+list(range(-H-20,-H)):
                X=(sigma*h+beta[j])**2-beta[(j+h)%s]**2
                sm+=Q(1,1<<math.floor(LO*a*a*X))
            assert sm<=Q(1,1<<delta_bits);checks+=1
    return dict(status='PASS',exact_checks=checks,
        scope='Outward dyadic sums, independent exponent construction, exact small matrix powers, finite tail checks; infinite tail also requires the geometric proof.')

def freeze():
    checks=test();save(OUT/'validation.json',checks)
    jobs=[]
    for s,t in ((31,36),(127,144),(1031,1152),(1031,1280)):
        for p in (512,4096,16384,65536):
            theta=Q(t-s,s);amin=2
            while Q(p,amin**4)>=theta:amin+=1
            candidates={amin,math.ceil(Q(3*amin,2)),2*amin,3*amin,4*amin}
            if (s,t)==(1031,1280):candidates.add({512:8,4096:16,16384:24,65536:32}[p])
            for a in sorted(candidates):
                if a*a<p:jobs.append(dict(s=s,t=t,p=p,alpha=a))
    prior=ROOT/'results/theory-refresh-20261008/completion.json'
    files=[Path(__file__).resolve(),ROOT.parent/'integerMult/notes/fast-gaussian-resampling.tex',prior,OUT/'validation.json']
    plan=dict(jobs=jobs,sha256={str(p):digest(p) for p in files},
      question='Does the new Gaussian power lemma save correction work against finite-matrix norm certificates at matched complete inverse-error budgets?',
      contract='||b||inf<=1; absolute error <=2^-p in (I+E)^-1 b. Budget 1/4 series, 1/4 omitted Gaussian tails, 1/2 numerical arithmetic.',
      scope='Four rational oversampling pairs; four precisions; predeclared admissible alpha grid plus previous examples. Positive dyadic matrix certificate uses full retained band and analytic infinite tails. No timing or full DFT claim.',
      gate='Any strict theorem term advantage over all conventional certificates triggers numerical-solve investigation at that parameter. No strict advantage closes this bounded iteration-saving route. Ties alone do not establish planning or runtime savings.',
      tuning='Report pointwise comparisons and nondominated alpha choices in (S-window-width proxy, retained-edge-count*(terms-1)); proxy is not measured runtime. No removal of unfavorable alpha values.')
    save(OUT/'plan.json',plan);print('Frozen',len(jobs),'cases;',checks)
def verify(plan):
    for name,h in plan['sha256'].items():assert digest(Path(name))==h,name

def run():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    with (OUT/'rows.jsonl').open('x') as f:
        for j in plan['jobs']:
            tic=time.monotonic();r=counts(j['s'],j['t'],j['p'],j['alpha'])
            r['diagnostic_screen_seconds']=time.monotonic()-tic
            f.write(json.dumps(r)+'\n');f.flush()
            print(j,'theory',r['theory_terms'],'ordinary',r['ordinary_best_terms'],flush=True)
    verify(plan)

def analyze():
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    rows=[json.loads(x) for x in (OUT/'rows.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('s','t','p','alpha')} for r in rows]==plan['jobs']
    wins=[r for r in rows if r['strict_term_advantage']]
    examples=[r for r in rows if (r['s'],r['t'])==(1031,1280) and r['alpha']=={512:8,4096:16,16384:24,65536:32}[r['p']]]
    fronts=[]
    for key in sorted({(r['s'],r['t'],r['p']) for r in rows}):
        group=[r for r in rows if (r['s'],r['t'],r['p'])==key]
        for method in ('theory_terms','ordinary_best_terms'):
            points=[(r['resampling_window_width_proxy'],r['retained_edges']*(r[method]-1),r['alpha']) for r in group]
            pareto=[pt for pt in points if not any(q[0]<=pt[0] and q[1]<=pt[1] and(q[0]<pt[0] or q[1]<pt[1]) for q in points)]
            fronts.append(dict(s=key[0],t=key[1],p=key[2],method=method,points=pareto))
    result=dict(cases=len(rows),strict_wins=len(wins),ties=sum(r['theory_terms']==r['ordinary_best_terms'] for r in rows),
        ordinary_strict_wins=sum(r['theory_terms']>r['ordinary_best_terms'] for r in rows),eligible=wins,previous_examples=examples,pareto_proxies=fronts)
    save(OUT/'summary.json',result);print(json.dumps({k:v for k,v in result.items() if k not in ('previous_examples','pareto_proxies','eligible')},indent=2))
    for r in examples:print(r['p'],r['alpha'],r['theory_terms'],r['ordinary_one_step_terms'],r['finite_power_terms'])
if __name__=='__main__':{'freeze':freeze,'run':run,'analyze':analyze}[sys.argv[1]]()
