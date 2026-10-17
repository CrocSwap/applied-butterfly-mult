# Non-rigidity circuits inside complete theta calls

## Decision — 8 October 2026

**Do not promote this non-rigidity integration.** Neither circuit produced a
convincing additional speedup in an active case against the optimized ordinary
butterfly baseline. Preserve the standalone kernel result and this negative
application result separately.

Removing recursive temporary-array allocation gives a useful conventional
optimization candidate. Its confirmed complete-call signal is around 1–1.4%,
with timing-control limitations described below. No default FLINT library or
previous patch was changed.

| Confirmation comparison | Cases | Median CPU time reduction | Positive CPU / CPU-and-wall intervals |
|---|---:|---:|---:|
| Ordinary memory cleanup, squared constants | 14 | 1.01% | 9 / 9 |
| Ordinary memory cleanup, nonzero points | 4 | 1.40% | 4 / 4 |
| Ordinary memory cleanup, mixed four-point batches | 2 | 1.20% | 2 / 2 |
| H4 versus optimized ordinary, **active** cases | 20 | **−0.43%** | 0 / 0 |
| H8 versus optimized ordinary, **active** cases | 14 | **−0.64%** | 0 / 0 |

Positive means less CPU time. Seven H4 and eight H8 active cases had entirely
negative CPU intervals; the others were inconclusive. These medians are over
the stated synthetic workloads, not a general FLINT workload distribution.

The ordinary comparator was chosen separately for each case from iterative
and recursive implementations using the first timing pass. These aggregate
results describe that experimental comparison; they are not measurements of
a newly installed universal dispatch policy. Both implementations remain
available as isolated builds and patches.

## What was changed

Starting point: the latest combined theta candidate, containing product-first
Walsh evaluation, retained batch preparation and the equal-bank specialization.
This is `.deps/experiments/theta-equal/candidate/libflint-experiment.dylib`, not
original upstream FLINT.

Both remaining recursive transform helpers were replaced:

- `acb_theta_agm_hadamard` in `agm_mul.c`;
- `bf_hadamard` in the retained-preparation portion of `ql_exact.c`.

The old helpers allocate a vector at every recursive node. The new ordinary
implementations use one temporary complex ball per transform, with iterative
or recursive butterflies. H4 and H8 use six and sixteen temporary complex
balls, respectively. All allocate scratch once per transform and clear it
afterwards. **Scratch is not retained across separate transforms in this
integration.**

The complex kernels follow the same formulas as the real-ball experiment in
[the non-rigidity kernel report](walsh-nonrigidity.md), implementing the
published [Alman–Rao constructions](https://arxiv.org/html/2211.06459v2).
H4 is enabled for transform logarithm at least two; H8 for at least three.
Both fall back to ordinary recursive butterflies above 4,096 working bits.
The threshold was fixed before application timing, following the poor
high-precision results in the preceding kernel experiment.

Input/output order, mathematical normalization, equal-bank dispatch and the
retained-preparation/error-bound logic remain unchanged. There is no global
or cross-call cache. All changes live in isolated experimental sources.

### Why the earlier kernel percentages do not carry over

The standalone experiment used real balls and already initialized, reusable
scratch. This application uses complex balls and pays scratch setup/cleanup
for each transform. The non-rigidity circuits need more live temporaries.
Theta's intermediate values and actual working precisions also differ from
the standalone fixtures.

These are concrete differences between the experiments. They make temporary
management a plausible explanation, but the present measurements do **not**
isolate it as the sole cause. A capture/replay experiment is needed before
claiming that persistent scratch would recover the earlier gain.

The measured opportunity is also small. For the 512-bit constants fixtures,
the two affected helpers occupy approximately 2.2–4.0% of the prior complete
call, and 1.4–3.4% after ordinary recursive memory cleanup. At genus six, the
optimized fraction is 1.41% and 1.54%. A 10% saving in that remaining fraction
would contribute only about 0.14–0.15% to the whole call, assuming surrounding
work and precision requirements were unchanged. Instrumented fractions are
approximate; they are not timing estimates for the uninstrumented variants.

## Scope and accuracy contract

There are 22 deterministic fixtures/configurations:

- All squared constants at genera 2, 3 and 4, initial working precision 512
  and 2,048 bits, two period matrices each.
- All squared constants at genus 6, 512 bits, two matrices.
- Nonzero points at genera 2 and 3, 512 bits, two matrices each.
- Mixed four-point batches at genus 3, 512 bits, two matrices.
- Two genus-one cases where neither construction can activate.

The coupled, positive-definite, exact dyadic period matrices are the existing
theta experiment's synthetic fixtures. This is not the published genus-six E4
application, whose period input remains unavailable, and it does not qualify
derivatives.

Every complete operation calls public `acb_theta_jet` with derivative order
zero, all characteristics and squared output. It requires every output to have
`acb_rel_one_accuracy_bits >= initial_precision - 32`. This means relative
accuracy for large values and an absolute-error condition near zero.

If the target is missed, the harness increases working precision by 64 bits,
up to 256 extra bits. Evaluation, output checks and any retries are timed.
Library loading, input construction and the caller-owned output vector are
outside timing; all temporary allocation and cleanup inside the public call
are included. **No qualification or timed call needed a retry.**

## Numerical evidence

All four new implementations passed the independent exact signed-product AGM
oracle under ASan/UBSan: **4,243,200 exact containment checks** in total.
This includes equal and distinct banks, sparse and cancellation inputs,
input radii, both output modes, genera 0–7 and precisions 64–2,048. The included
new AGM source and harness are instrumented; the linked FLINT library is not
fully sanitizer-instrumented.

Each implementation also passed five upstream tests: `agm_mul`,
`agm_mul_tight`, `ql_exact`, `jet_notransform`, and `jet`—20 test results.

For complete calls, all **88 variant/input comparisons** passed against
independent direct theta-series summation, checking **40,864 output balls**.
The expensive genus-six references were computed once per input, saved with
input-parameter headers, and reused across variants. The reference files are
included in the frozen fingerprints.

No variant reduced the minimum output accuracy on any tested input. H4's
sum-of-component-radii ratio versus the prior patch ranged from 0.976 to
1.111; H8's ranged from 1.000 to 1.224. Some individual outputs widen; there
is no uniformly tighter-enclosure claim. The result here is that all outputs
still met the common requested accuracy.

## Timing design, controls and attribution

Apple M2, native project compiler flags, pinned FLINT revision. Compilation,
validation, profiling, timing and analysis ran in separate phases.

The first pass had 94 comparisons, each with 19 ABBA/BAAB quartets. It measured
ordinary recursive cleanup against the prior patch, iterative versus recursive
ordinary transforms, both circuits against iterative transforms, and controls.
Confirmation had 72 comparisons with 31 quartets. It retained **all** input
cases, selected the faster ordinary baseline per case from screening CPU time,
and repeated both construction comparisons, ordinary-versus-prior comparisons
and controls. No winning-only subset was selected.

Both passes use a 200 ms joint warmup, equal repetitions with 20 ms calibration,
CPU and wall clocks, and the existing 4,000-replicate paired moving-block
bootstrap. There were **16,072 timed batches**. Intervals are marginal, not
family-wise confidence statements for the whole sweep.

### Active constructions versus inactive comparisons

H4 cannot activate at genus one. H8 cannot activate at genera one or two.
The final active-case table excludes all such comparisons. In confirmation,
one H8 genus-two nonzero-point comparison showed +0.46% CPU with a positive
interval. **That path never executes the H8 construction**, so it is evidence
of the interpretation limits, not a mathematical speedup.

### Control limitations

Both same-function confirmation controls included zero for CPU and wall time.
Three of the four unchanged-source rebuild CPU intervals included zero. The
fourth, genus 3 / fixture 0, showed +1.27% CPU with interval [0.02%, 2.51%]; its
wall interval included zero. The initial rebuild controls all had CPU intervals
including zero.

This variability matters for small effects. Ordinary cleanup remains a useful
candidate: all 20 active ordinary-versus-prior point estimates are positive,
15 have positive CPU and wall intervals, and the general signal was present in
both passes. It is not a uniform-regression-free or fully qualified upstream
performance claim. Do not combine its percentages arithmetically with older
reported gains.

For non-rigidity, the narrower conclusion is firm: **this integration did not
demonstrate a construction-specific complete-call improvement**. It does not
disprove the earlier warm-workspace kernel results or rule out a different
caller/workspace design.

The mathematical attribution remains to Alman–Rao's older constructions. The
ordinary cleanup gain is conventional memory management. Neither is a new
OpenAI or sister-project construction being required for a winning application.

## Artifacts and next step

- Implementation: `bench/theta_nonrigidity_kernel.h`.
- Complete-call harness: `bench/theta_nonrigidity.c`.
- Exact check: `bench/theta_nonrigidity_check.c`.
- Build/experiment driver: `scripts/theta_nonrigidity.py`.
- Audit: `scripts/audit_theta_nonrigidity.py`.
- Libraries/sources: `.deps/experiments/theta-nonrigidity/`.
- Plans, references, profiles, raw data and summaries:
  `results/theta-nonrigidity/`, including `confirmation/`.
- Incremental, experimental patches: `patches/theta-transform-iterative.patch`,
  `theta-transform-recursive.patch`, `theta-transform-h4.patch`,
  `theta-transform-h8.patch`. These apply on top of the previous combined
  candidate, not directly to unmodified FLINT. They preserve the measured
  generated sources and have not been cleaned into an upstream submission.

Audit: PASS. It independently recounts point estimates, checks baseline choices
and active/inactive conditions, verifies all requested accuracy records and
confirms **1,288 fingerprints**, including historical artifacts. Nothing was
installed, submitted or promoted over the previous candidate.

The next bounded diagnostic should capture actual theta transform inputs and
replay them with per-transform versus persistent scratch. If the circuits win
on those inputs with persistent scratch, carry workspace through the relevant
AGM/batch context and repeat only the preselected application cases. If they
still lose, stop this theta integration route instead of repeating full sweeps
or changing fixtures in search of a favorable result. Any remaining gain must
also be judged against the small measured opportunity and control noise.
