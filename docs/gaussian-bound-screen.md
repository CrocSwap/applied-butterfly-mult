# Gaussian correction bound: finite-matrix feasibility screen

## Result

**No iteration-saving advantage survived the stronger conventional certificate
in the predeclared 77 cases.** The new sister-project lemma matched the ordinary
method in 30 cases and required more terms in 47. A direct finite-matrix certificate
was at least as good at every individual parameter choice, not just after choosing
favorable parameters for the baseline.

This closes the bounded screening gate from
[the theory refresh](theory-refresh-20261008.md). No numerical solver, DFT prototype,
or runtime benchmark was needed after the failed gate. This is not evidence that
the theorem is wrong, or that its constant-cost formula is useless for very large
implicit operators. It is evidence that the earlier term-count comparison did not
establish a distinctive practical improvement on these finite matrices.

## What changed from the survey

The survey compared a simplified theorem corollary with a one-step norm bound.
This experiment strengthened **both** sides:

1. Use the full Gaussian power lemma, with its tighter exponential rate and
   prefactor, as well as the old and simplified bounds; select the best.
2. Propagate an upper bound through the actual finite positive matrix, rather
   than repeatedly applying its worst one-step row norm. Also retain ordinary
   one-step and 2/4/8-step block certificates.
3. Account for an entire inverse solve's error: series truncation, omitted
   Gaussian tails, and a reserved numerical-arithmetic budget.
4. Screen a fixed grid of admissible alpha values, preserving all cases and
   recording resampling-width/correction-work tradeoffs.

The earlier illustrative s=1031, t=1280 cases now give:

| Requested absolute accuracy | alpha | Best theorem count | Ordinary one-step count | Finite-matrix count |
|---:|---:|---:|---:|---:|
| 512 bits | 8 | 3 | 4 | **3** |
| 4,096 bits | 16 | 5 | 8 | **4** |
| 16,384 bits | 24 | 7 | 13 | **6** |
| 65,536 bits | 32 | 13 | 30 | **13** |

Counts are terms in a Neumann series, hence one fewer matrix application. They
are sufficient certified counts, not the true minimum iterations for a particular
right-hand side. The previous 12-vs-14 and 21-vs-30 comparisons remain correct
within their recorded, weaker bound comparison. The table above supersedes their
use as evidence for proceeding to an implementation.

## Matrix family and parameter coverage

The operator is the one in the sister project's Gaussian resampling analysis:

    (E u)_j = sum_{h != 0} exp(-pi alpha^2 X[j,h]) u[(j+h) mod s],
    X[j,h] = (sigma*h + beta[j])^2 - beta[(j+h) mod s]^2,
    sigma=t/s=1+theta,
    beta[j]=sigma*j-floor(sigma*j+1/2).

Four coprime pairs were fixed before running:
`(31,36)`, `(127,144)`, `(1031,1152)`, `(1031,1280)`.
The precision grid is 512, 4096, 16384 and 65536 bits.

For each pair/precision, find the smallest integer alpha>=2 satisfying
`theta > p/alpha^4`. Include that value, its rounded-up 1.5 multiple, and its
2, 3 and 4 multiples, rejecting values with alpha^2>=p. Add the prior four
illustrative alphas where applicable. All cases have `0<theta<=1/4` and
`alpha^2 theta>1`. This produces 77 distinct cases.

| Precision | Cases | Tied counts | Ordinary strictly fewer terms |
|---:|---:|---:|---:|
| 512 | 14 | 5 | 9 |
| 4,096 | 21 | 6 | 15 |
| 16,384 | 21 | 6 | 15 |
| 65,536 | 21 | 13 | 8 |

This is a finite parameter screen, not global parameter optimization. Larger
alpha can reduce correction work while widening the initial Gaussian resampling
window. We retain nondominated points in the pair of proxies
`2 ceil(sqrt(p))*alpha+1` and `2 H s * (terms-1)`. These are not measured runtime
or a complete DFT cost model. Pointwise baseline dominance means that selecting
another alpha within this grid cannot restore a theorem-specific iteration win
under any common cost model that rewards fewer correction applications.

## Matched inverse-error contract

For any real or complex right-hand side with `||b||_infinity<=1`, target

    ||computed x - (I+E)^(-1)b||_infinity <= 2^-p.

The inherited hypotheses give `||E||<2^(-alpha^2 theta)<1/2`.
Let A retain shifts `1<=|h|<=H`. All entries are nonnegative, so `0<=A<=E` and
`||A||<1/2`. Choose H so the omitted operator T=E-A has
`||T||<=2^(-p-4)`. The screen needed H between one and four.

For |h|>=H+1,

    X[j,h] >= sigma^2 h^2 - sigma |h|.

Consecutive positive-tail exponents differ by at least
`sigma^2*(2H+3)-sigma`. With `pi/log(2)>4.531`, floor the base-two initial exponent
and this gap. The gap is at least one, so both tails together are bounded by
`2^(2-initial_exponent)`. H is increased until that bound meets the tail budget.
This includes shifts that wrap around or contribute to the diagonal; no omitted
Gaussian coefficient is assumed to be zero.

The resolvent identity gives

    ||(I+E)^(-1) - (I+A)^(-1)|| <= 4||T|| <= 2^(-p-2).

For `x_n=sum_{k=0}^{n-1}(-A)^k b`, require
`||A^n||<=2^(-p-3)`. The remaining Neumann tail is then at most
`||A^n||/(1-||A||)<=2^(-p-2)`. Reserve `2^(-p-1)` for numerical arithmetic.
The three budgets sum to `2^-p`.

No numerical implementation was run, so the arithmetic budget is a requirement
for a future implementation, not an achieved rounding-error claim. The two
analytic budget components and all term comparisons are certified here.

## The full theorem comparator

The sister lemma proves

    ||E^n|| <= exp(pi alpha^2 B) * (2.01 exp(-pi alpha^2 sigma))^n,
    B=1/(4 theta)+1/2.

Using its stated inequalities `4.531 < pi/log(2) < 4.534` and
`log2(2.01)<1.01`, with q=p+3, a sufficient count is

    ceil((q + 4.534 alpha^2 B) / (4.531 alpha^2 sigma - 1.01)).

The comparator takes the minimum of this count, the simplified corollary count,
and the older theorem count. Since A<=E entrywise and both are nonnegative, any
bound on E^n also bounds A^n. Every reported threshold was recomputed with exact
rational arithmetic, including the failure of the preceding integer for the
full-lemma inequality.

## Stronger conventional certificate

This method does not use the theorem's telescoping potential or path lemma.
It applies the generic inequality `A^n <= U^n` for nonnegative matrices, with

    U[j,j+h] contribution = 2^(-floor(4.531 alpha^2 X[j,h])).

The Gaussian exponents are rational; their floors are computed from integer
numerators and denominators. Thus no high-precision exponential is needed to
construct this upper matrix. Multiple contributions to the same entry are
summed, not overwritten.

Start with a row-sum vector of ones. Apply U repeatedly, rounding each component
**up** to a power of two. To sum terms `2^-e`, subtract the least exponent, sum
with a 32-bit fractional accumulator, and round every smaller discarded term up
to one accumulator unit. Taking the next containing power of two gives an upper
bound. All operations are integer shifts, additions, and bit lengths. Induction
therefore bounds every component of `U^n * 1`; its maximum bounds `||A^n||_infinity`.

This uses the actual variation between rows and propagates it through successive
steps. Repeating a single worst-row bound loses that information. The same
certificate sequence can also supply ordinary block-norm bounds. All retained
methods and certificate bits are recorded per case.

The finite certificate has setup work proportional to the retained band and
number of steps, while the theorem formula is constant-cost once parameters are
known. We have not established a total planning-time advantage for either method.
The stopping gate concerned removal of correction work. Ties do not by themselves
prove a runtime improvement, and no timing claim is attached to Python screen
execution times retained for diagnostics.

## Validation, provenance and disposition

The plan and implementation were frozen before the case screen. The numerical
bound code passed **923 exact checks**, covering:

- outward-rounded positive sums versus exact Fraction sums;
- integer exponent construction versus an independent Fraction formula;
- rounded matrix-power bounds versus exact dyadic matrix powers on small cases;
- explicit finite tails versus the geometric tail bound.

The infinite tail also relies on the written geometric argument above, not just
finite tests. The separate audit checks source hashes, case coverage, rational
lemma thresholds, tail thresholds, certificate stopping decisions and the full
inverse-error allocation. It does not claim an independent second implementation
of all 77 matrix-power sequences or a full audit of the multiplication theorem.

Attribution: the new analytic lemma is from eumemic's Gaussian-resampling work,
with the retained chirp-error correction credited to icekylinx. The finite
positive-matrix norm certificate is a conventional competing approach. This pass
establishes no new construction-specific application speedup.

**Stop this iteration-saving experiment.** No case passed the predeclared gate
for a numerical solve. A constant-cost theorem may still matter for much larger
implicit operators, and the separate chirped Gaussian-map algorithm has not been
benchmarked here. Neither possibility is promoted to an application result.
The earlier positive theta/kernel measurements and all historical artifacts are
preserved.

Artifacts:

- `scripts/gaussian_bound_screen.py`: exact screen, validation, frozen plan and
  parameter tradeoff summary.
- `scripts/audit_gaussian_bound_screen.py`: decision and error-budget audit.
- `results/gaussian-bound-screen/`: plan, 77 raw case records, diagnostics,
  validation, summary, audit and completion hashes.

Run new experiments in a fresh destination; existing records reject overwrite.
