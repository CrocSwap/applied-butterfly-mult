#!/usr/bin/env python3
"""Audit frozen arithmetic decisions and inverse-error budget; no new benchmark."""
import sys
sys.dont_write_bytecode=True
import hashlib,json,math
from pathlib import Path
from fractions import Fraction as Q
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'results/gaussian-bound-screen'
plan=json.loads((OUT/'plan.json').read_text());summary=json.loads((OUT/'summary.json').read_text())
for name,h in plan['sha256'].items():assert hashlib.sha256(Path(name).read_bytes()).hexdigest()==h,name
rows=[json.loads(s) for s in (OUT/'rows.jsonl').read_text().splitlines()]
assert len(rows)==len(plan['jobs'])==summary['cases']
for job,r in zip(plan['jobs'],rows):
    assert all(r[k]==v for k,v in job.items())
    s,t,p,a,H=(r[k] for k in ('s','t','p','alpha','H'));theta=Q(t-s,s);sigma=1+theta
    assert math.gcd(s,t)==1 and 0<theta<=Q(1,4) and 2<=a and a*a<p and theta>Q(p,a**4)
    q=p+3;assert r['power_target_bits']==q
    # Full lemma: exp(pi*a^2*B)*(2.01*exp(-pi*a^2*sigma))^n.
    burn=Q(2267,500)*a*a*(1/(4*theta)+Q(1,2))
    rate=Q(4531,1000)*a*a*sigma-Q(101,100)
    n=r['sharp_lemma_terms']
    assert burn-n*rate<=-q and burn-(n-1)*rate>-q
    assert r['theory_terms']==min(n,r['older_theory_terms'],r['simplified_theory_terms'])
    coeff=[Q(4531,1000)*a*a*(sigma*sigma*k*k-sigma*k) for k in (H+1,H+2)]
    floor0=math.floor(coeff[0]);gap=math.floor(coeff[1]-coeff[0]);assert gap>=1
    assert floor0-2==r['tail_bound_bits']>=p+4
    cert=r['power_certificate_bits'];assert len(cert)==r['finite_power_terms']
    assert cert[-1]>=q and all(x<q for x in cert[:-1])
    assert r['ordinary_best_terms']<=r['finite_power_terms']<=r['theory_terms']
    # Worst-case ||E||,||A|| < 1/2. Resolvent identity for omitted tails.
    series=2*Q(1,2**q)
    omitted=4*Q(1,2**(p+4))
    round_budget=Q(1,2**(p+1))
    assert series+omitted+round_budget==Q(1,2**p)
assert summary['strict_wins']==0 and summary['ties']==30 and summary['ordinary_strict_wins']==47
receipt=dict(status='PASS',cases=len(rows),
 scope='Source hashes, plan coverage, rational lemma thresholds, analytic tail thresholds, recorded certificate stopping decisions, inverse-error allocation. The 923 pre-screen tests independently check dyadic sums, exponent construction and small exact matrix powers; this audit is not a second implementation of all matrix powers.',
 numerical_solve_performed=False,runtime_speedup_claim=False)
with (OUT/'audit.json').open('x') as f:json.dump(receipt,f,indent=2);f.write('\n')
print(json.dumps(receipt,indent=2))
