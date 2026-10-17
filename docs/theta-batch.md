# Shared preparation for batched theta evaluation

## Result and decision

Retain the combined theta candidate for the sampled genus-2 and genus-3 workloads.
Sharing preparation across duplication steps' evaluation points adds a repeatable
CPU reduction to the existing product-first Walsh patch. This is a conventional
reuse optimization; the new theoretical constructions are not required.

The confirmation run covers the complete 512-bit slice of the original screen:
two genera, ordinary and squared values, two period-matrix/point fixtures, and
one, four, or sixteen points per public call. Medians across the eight cases at
each batch size are:

| Points per call | Additional CPU reduction versus existing theta patch | Combined CPU reduction versus original FLINT |
| ---: | ---: | ---: |
| 1 | 1.80% | 3.65% |
| 4 | 2.65% | 4.92% |
| 16 | 3.05% | 5.84% |

These are independently measured comparisons, not sums of percentage headlines.
All 24 confirmation cases have positive CPU intervals in both comparisons;
23/24 have positive CPU and wall intervals in each comparison. For sixteen
points, all eight cases have positive CPU and wall intervals against both
baselines. Total CPU reductions there range from 3.00% to 7.74%.

Small timing differences in an inactive genus-1 control were not stable under
repeated measurements and reversing library order. Accordingly, this experiment
does not certify subpercent effects or absence of regressions across FLINT.
The combined patch remains experimental; no baseline library was modified and
nothing was submitted upstream.

## What changed

`acb_theta_ql_perform_steps` evaluates several points using the same one or two
input banks within each duplication step. Previously each invocation of
`acb_theta_agm_mul_tight` independently:

1. Estimated the common input's magnitude and radius relative to its distances.
2. Extracted its midpoint vector.
3. For `all=0`, transformed that midpoint vector with a Hadamard transform.
4. Allocated intermediate vectors and computed the result and its error bounds.

The new private cache has two slots and a reusable workspace. It retains the
common magnitude/radius estimates, midpoint vector, and, where applicable, the
Hadamard transform. It is reset at every duplication step, before either the
input values or distances are reused. It is destroyed before returning from
that invocation. It is local to the call and introduces no production global
cache or dependency on previous calls.

The existing product-first `all=1` optimization remains active. The new cache
shares its input preparation too; transform reuse chiefly affects the earlier
`all=0` duplication steps. Every timed public call includes cache setup,
allocation, resetting, and cleanup.

The standalone profile found first-input magnitude/error preparation taking
approximately 0.66–2.09% of complete-call thread CPU time across its 24 cases.
This instrumented fraction includes timer overhead and measures only that
preparation component. It is not itself a speedup estimate.

## Precision handling

Requested internal precision varies across points. An initial exact-precision
cache found few transform hits: 336 hits and 5,376 misses in the sixteen-point
diagnostics. Requiring a matching precision was unnecessarily restrictive.

A transform already computed at higher precision is still a rigorous enclosure
of the same mathematical vector. It can be reused as input to operations at a
lower requested precision. The retained variant recomputes whenever a request
exceeds the cached precision; it never substitutes a lower-precision transform
for a higher-precision request. The original directed-rounding formula for
propagating input errors is preserved operation by operation.

This changes the sixteen-point diagnostic counts to 5,376 transform hits and
336 misses, approximately 94% reuse. Common-input preparation also has about
94% hits. These counts aggregate three diagnostic evaluations per fixture and
are collected in a separate instrumented library, never in the timed libraries.

The exact-precision and retained variants differ only in the precision comparison
and its explanatory comment; the audit checks this after removing comments and
whitespace. The shared inputs are never transformed in place, and neither their
values nor their requested output precision is changed.

## Variants and ablations

All new variants include the previously validated product-first theta patch.

| Variant | Behavior |
| --- | --- |
| Existing theta patch | Original input preparation for every tight multiplication |
| Preparation only | Shares first-input bounds and midpoints, reuses wrapper workspace, calls the existing multiplication routine |
| Exact precision | Also uses reusable transform workspace and caches transforms only at matching precision |
| Retained precision | Reuses a cached transform whenever its precision is sufficient |

In the eight sixteen-point confirmation cases, retained precision improves CPU
time over preparation only by a median 1.30%, with all eight CPU and wall
intervals positive. That comparison includes differences in intermediate
allocation as well as transform reuse.

Against exact-precision caching, its median CPU improvement is 0.91%; six of
eight CPU intervals and five of eight joint CPU/wall intervals are positive.
The improvement is not established for every case, and these small differences
should be read alongside the control variability below.

## Correctness evidence

- Five upstream tests pass against both the exact-precision and retained builds:
  `agm_mul`, `agm_mul_tight`, `ql_exact`, `jet_notransform`, and `jet`.
- The exact-precision and preparation-only variants pass 96 direct theta-series
  reference fixtures, checking 26,880 public-call output values.
- The retained variant passes 48 such fixtures, checking 13,440 values. Its
  minimum `rel_one` accuracy is unchanged in every fixture. Summed component
  radius ratios are 0.999999976–1.000000010; 194 individual outputs are wider.
  Uniformly tighter enclosures are not claimed.
- A private-cache test checks reset after mutation at the same addresses, two
  cached banks, a third-bank fallback, input equality, both output modes, and
  precision changes. Exact-precision caching matches 154,224 coefficient
  enclosures bit for bit over 1,296 calls. The retained variant passes the same
  number of overlap checks.
- An independent exact oracle checks 68,544 containments over 576 retained-cache
  calls. Inputs are exact 600-bit complex dyadics; requests alternate through
  256, 64, 512, 128, 256, and 80 bits. This specifically exercises higher-precision
  reuse, new higher-precision requests, equal/distinct inputs, and reset after
  input mutation.
- The private-cache checks run with AddressSanitizer and UndefinedBehaviorSanitizer.
  This is not a claim that the entire linked FLINT library was sanitizer-built.

Working precision is an API input, not a promise of that many relative accuracy
bits for every theta value. References check finite enclosures and overlap;
the exact dyadic cache test separately checks containment of exact answers.

## Timing protocol and controls

Apple M2, one thread, the existing pinned FLINT revision and compiler settings.
Two resident dylibs, identical inputs, equal repetitions, alternating ABBA/BAAB
quartets, thread CPU and monotonic wall clocks. Raw quartet point estimates are
independently recomputed by the audit. Intervals use the existing 4,000-draw
moving-block bootstrap and are marginal per-case intervals, without adjustment
for multiple comparisons.

The initial screen has 48 input configurations at 512/2048 bits, genera 2/3,
one/four/sixteen nonzero points, ordinary/squared values, and two deterministic
well-conditioned coupled period matrices. It measures 132 comparisons with
21 quartets, 20 ms warmup, and 5 ms batch calibration. Median incremental CPU
reduction is 2.49%; median total reduction is 4.07%. Incremental CPU intervals
are positive in 42/48 cases, and total CPU intervals in 47/48.

One same-function control in that screen showed a -1.54% CPU difference. The
entire 512-bit slice, including both ablations and controls, was therefore
repeated: 68 comparisons, 31 quartets for active cases, 63 for controls, 200 ms
warmup, and 20 ms batch calibration. Both same-function controls then included
zero in CPU and wall intervals. One inactive genus-1 fixture showed -0.70% CPU
[-1.30, -0.16]%, despite instrumentation confirming that it skips the cache.

A final, predeclared eight-comparison diagnostic used both genus-1 fixtures,
both library orders, an unchanged-source rebuild, and same-library controls.
The unchanged rebuild and same-library CPU controls all included zero. For the
previously flagged fixture, retained versus leading showed +0.97% CPU, while
reversing the libraries showed +0.44% in favor of leading. Both intervals
excluded zero; the directions are inconsistent with a stable intrinsic effect.
The other fixture's two directional comparisons both included zero. This
diagnostic was not repeated until a clean control gate appeared. It documents
remaining subpercent timing/order sensitivity; no gain is attributed to the
inactive path.

Timing campaigns ran without concurrent compilation, reference calculations,
analysis, or research tool activity by this agent. Absolute timings vary between
runs, so conclusions use paired comparisons rather than cross-run absolute times.

## Scope and attribution

The evidence supports additional savings on the sampled batched public theta
evaluations, with particularly clear results at sixteen points. It does not
measure complete class-polynomial or other downstream applications. Derivatives,
ill-conditioned period matrices, wider genera at the public-call level, and
other CPUs remain outside the performance claim; some are covered only by
upstream correctness tests.

This extends the leading application candidate. The optimization uses ordinary
shared computation and rigorous higher-precision reuse. Its connection to the
sister theory is the documented research path that led to theta arithmetic,
not a requirement for a new phase-frame construction.

## Artifacts

- Existing prerequisite: `patches/theta-direct-walsh.patch`.
- Combined candidate's additional change: `patches/theta-batch-retained.patch`.
  Apply both patches to reproduce the combined source changes.
- Exact-precision comparison: `patches/theta-batch-shared.patch`.
- Implementation template: `bench/theta_batch_internal.h`; generated sources
  and isolated libraries: `.deps/experiments/theta-batch/`.
- Public-call harness: `bench/theta_batch.c`; private numerical tests:
  `bench/theta_batch_cache_check.c` and `bench/theta_batch_precision_check.c`.
- Build/profile and variant preparation: `scripts/theta_batch.py`.
- Primary retained campaign: `scripts/theta_batch_retained.py`.
- Confirmation and final diagnostic: `scripts/confirm_theta_batch.py` and
  `scripts/check_theta_batch_controls.py`.
- Raw data, validation, plans and summaries: `results/theta-batch/`, including
  `retained/`, `confirmation/`, and `control-diagnostic/`.
- Evidence verification: `scripts/audit_theta_batch.py` and
  `results/theta-batch/audit.json`.

Each preparation command requires fresh artifact destinations. Preparation,
measurement, and analysis are distinct stages; run measurement without competing
work. The exact-precision-only campaign plan was prepared but not timed; it
served as a comparator in the retained campaign. All historical sources,
libraries, and evidence files remain unchanged.
