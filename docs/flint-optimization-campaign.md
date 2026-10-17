# FLINT optimization campaign

Started October 12, 2026. The objective is five **new**, independently useful
optimizations ready for maintainer review. The earlier multiplication,
polynomial-matrix, and theta results remain separate and do not count toward
this target. A complete FLINT public operation is a sufficient performance
endpoint. No connection to the sister theory is required.

The machine-readable contract is
[`experiments/flint-optimization-campaign.json`](../experiments/flint-optimization-campaign.json).
Upstream HEAD observed at the start is pinned to
`26b9bc9df973206db15616d0849a4c8be9d22059`. Its isolated checkout and build live
under `.deps/flint-optimization-base`; the historical `.deps/flint` is preserved.

## Search approach

Follow complete-call profiles and actual dispatch. Prioritize common-work reuse,
algebraic special cases, allocation/copy removal, representation-stage fusion,
and algorithm selection. Strengthen conventional baselines before retaining a
candidate. Initial source-screening areas are hypotheses, not measured results:

1. Polynomial-matrix squaring dispatch and redundant fallback work.
2. Transform sharing in polynomial-matrix squaring.
3. Small polynomial-matrix squares and commutative scalar identities.
4. Modular polynomial matrix multiplication/reduction reuse beyond the old patch.
5. Repeated polynomial evaluation at one point.
6. Combined value/derivative evaluation and power preparation.
7. Polynomial multipoint evaluation and reusable product trees.
8. Polynomial interpolation preparation.
9. Taylor shifts and factorial/conversion passes.
10. Polynomial composition and allocation lifetimes.
11. Power-series inversion and truncated products.
12. Power-series exponential/logarithm shared work.
13. Polynomial powering and squaring-specific dispatch.
14. Arb/ACB matrix squares and small-dimension formulas.
15. Arb/ACB dot products with repeated or exact operands.
16. Matrix solve/inversion preparation and copying.
17. Ball polynomial arithmetic with real or exact coefficients.
18. Integer/rational polynomial matrix conversion and packing.
19. Multiplication reconstruction and conversion boundaries outside prior changes.
20. Precision-dependent and size-dependent algorithm crossovers.

This is a search queue, not a commitment to implement every item. Five retained
changes is a target, not a reason to weaken evidence or count variants of one
change separately.

## Qualification

Before timing confirmation, freeze the relevant workload family, candidate,
dispatch conditions and controls. Keep setup and allocations inside the timed
public operation unless its API explicitly amortizes preparation. Check useful
neighboring sizes and input shapes, including inactive paths. Run timings alone.
Report both CPU and wall measurements, raw paired samples, uncertainty and
control anomalies. Preserve accuracy and charge any precision retries.

Retained changes need a portable patch or explicitly guarded specialization,
focused upstream-style tests, the relevant upstream tests, a performance report,
and a combined-series correctness/regression check. Second-architecture evidence
will be reported only if actually obtained. No changes are submitted upstream
without a separate instruction to do so.

## Current state

The fresh baseline and unchanged-source relink control are built. Four sampled
complete-call profiles are retained in
`results/flint-optimization-campaign/profiles-initial/`. They confirm the targeted
paths; modular inversion is a substantial interpolation cost, and the matrix
square reaches both interpolation and the redundant fallback.

The first 50-case screen is in `results/flint-optimization-campaign/screen-1/`.
It has 15 ABBA/BAAB quartets per case, two clocks, and separate same-function and
unchanged-relink controls. These are **initial screen results**, not confirmed
performance claims:

| Candidate | Active cases | Complete-call CPU reduction in the screen |
| --- | ---: | ---: |
| Stop polynomial-matrix square after interpolation | 6 | 39.73–64.68% |
| Batch inversions for modular interpolation weights | 12 | 9.85–36.94% |
| Dot products for rectangular derivative evaluation (Arb/ACB) | 16 | 2.60–22.66% |

All active-case CPU intervals are positive. No sampled numerical-evaluation case
has lower minimum output accuracy. Some inactive paths show subpercent timing
differences, and one unchanged-relink control has a slightly negative interval;
these are retained and limit small-effect attribution.

The square fallthrough also causes a correctness bug: aliased interpolation
overwrites the input with A², then the fallback computes A⁴. A focused upstream-
style regression fails against the original library and passes with the one-line
`else if` fix. Evidence is in
`results/flint-optimization-campaign/sqr-regression/`. The patch and regression
are `patches/opt-nmod-matrix-sqr-fallthrough.patch`.

The first three candidates have now completed **two independent confirmation
runs**, with different inputs and case orders, 31 quartets per case, and CPU
batches of at least 20 ms. Each run has 76 cases including controls and dispatch
neighbors. The measured reductions are for complete public calls on Apple M2:

| Candidate | Active cases per run, including neighbors | Run 1 CPU reduction | Run 2 CPU reduction |
| --- | ---: | ---: | ---: |
| Square fallthrough | 8 | 39.70–64.65% | 39.88–64.71% |
| Interpolation batch inversion | 26 | 10.01–36.55% | 10.01–36.99% |
| Rectangular derivative dot products | 24 | 2.08–22.34% | 2.85–23.22% |

All active CPU intervals are positive in both runs. Wall results agree closely;
no sampled numerical case loses minimum accuracy. The first confirmation's
unchanged-relink real-evaluation control shows a 1.40% gain, while the second
shows -0.94% with an interval containing zero. Small effects should therefore
be interpreted more cautiously than the large gains. Full controls, per-case
intervals and raw measurements are in `confirmation-1/` and `confirmation-2/`
under `results/flint-optimization-campaign/`.

Focused tests now cover shuffled affine interpolation points, a composite
modulus with invertible differences, the zero ring, tree boundaries, exact
dyadic evaluation references, high-precision dispatch, and point/output aliases.
The candidate patches and the combined series pass relevant upstream tests.
The changed code and test harnesses also pass AddressSanitizer and
UndefinedBehaviorSanitizer checks; the rest of the baseline library is not
instrumented. Matrix-square checks also pass with four FLINT threads.

Two further candidates are under confirmation:

* Directly combining interpolation-tree scalar leaves saves approximately
  2–5% on small public modular interpolation calls in screening. Larger inputs
  show smaller or inconclusive effects. Version 2 preserves the original
  multiplication operand order in generic contexts.
* Reusing the inverse already computed during Newton exponentiation saves
  approximately 11–19% on screened dense Arb/ACB sinh/cosh series calls. A
  sparse-input regression in version 1 was traced to an extra scan and fixed
  in version 2 with the exact truncated identity exp(±b*x^(n-1)) = 1 ± b*x^(n-1).
  Exact rational, ball-input, boundary and alias tests pass. One unchanged
  complex-series relink control shifted by 6.82% in the screen, so the new
  confirmations use the unchanged relink as their primary comparator and
  retain the original library as another control. Screen numbers alone do
  not qualify this candidate.

The complete five-patch series is built and correctness-tested; its frozen
performance plan is prepared. Independent confirmations for the last two,
combined performance checks, and final review packaging remain outstanding.
**The five-optimization objective is not complete.**

The unused Newton-exponential coefficient cleanup passed correctness but showed
mostly subpercent gains with control anomalies in `screen-2/`; it is set aside.
Small Arb/ACB matrix-square specialization was dropped after inspection found
an existing specialized path. Rejected and superseded artifacts are preserved.
