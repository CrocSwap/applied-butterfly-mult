# Theta optimization prior art and practical scope

The conventional product-first Walsh reformulation produces a useful improvement
in a specialized FLINT interface. Complete theta evaluations show approximately
2% median CPU savings in the sampled workloads. The earlier 49–64% reduction
applies to the inner `acb_theta_agm_mul(all=1)` operation. Attribution remains a
theory-directed discovery of a conventional optimization.

## Prior art

Jean Kieffer's [May 23, 2024 NuSCAP talk](https://members.loria.fr/JKieffer/files/nuscap.pdf),
slide 18/25 (PDF page 20), explicitly writes the theta-constant duplication
formula as a signed sum of shifted products. It attributes the formula to
Koizumi or Cosset's thesis. For a fixed shift, evaluating all signs is a Walsh
transform of that product vector: the structure used by our optimization is
already visible in this older formula. The talk also discusses Hadamard
transforms in theta evaluation. This is strong prior art for the mathematical
ingredients, rather than evidence for mathematical novelty here.

The [current FLINT implementation](https://github.com/flintlib/flint/blob/14794ad2a8358406e884b71b3db0f4c6c4b122b5/src/acb_theta/agm_mul.c)
still uses the repeated convolution formulation. The downloaded `main` file
matches our pinned source byte for byte. The ten revisions returned by the
GitHub history API for this file were inspected; the current `all` branch appears
in the February 2025 interface refactor. Earlier revisions expose the single
convolution operation without this branch. A bounded issue/PR search found no
matching optimization: `agm_mul` returned zero issues and `theta hadamard`
returned three unrelated results. These checks do not establish that nobody has
implemented the reformulation elsewhere, including under older interfaces.

Source snapshots, URLs, hashes, and historical revisions are archived under
`results/theta-context/prior-art`. No authors or maintainers have been contacted.

## What was measured

The complete `acb_theta_jet` public call, with one point, derivative order zero,
and all characteristics, through two resident uninstrumented FLINT dylibs:

- Genus 1, 2, and 3: respectively 4, 16, and 64 output values.
- Working precision 128, 512, and 2048 bits.
- Constants (`z=0`) and values at a nonzero complex point.
- Ordinary values and squared values.
- Two deterministic, coupled, well-conditioned period matrices per configuration.

This gives 72 sampled evaluations. Four controls cover same-function comparisons
and the unchanged single-characteristic path. Inputs are exact dyadic values;
both libraries use the same inputs and precision. Argument reduction, setup,
theta computation, and output transformations are included in each timed call.
Object initialization and fixture construction are outside timing.

The initial run used 21 alternating ABBA/BAAB quartets, equal repetition counts,
5 ms batch calibration, and 20 ms combined warmup. CPU time uses the current
thread clock; wall time is recorded separately. Block-bootstrap intervals use
4,000 draws. All timings ran without concurrent compilation, validation,
analysis, or research tool activity by this agent.

| Measurement | Result |
| --- | --- |
| Initial 72-case CPU median reduction | 1.99% |
| Initial positive CPU 95% intervals | 56/72 |
| Initial positive CPU and wall intervals | 36/72 |
| Confirmation 24-case CPU median reduction | 2.08% |
| Confirmation positive CPU 95% intervals | 20/24 |
| Confirmation positive CPU and wall intervals | 18/24 |
| Confirmation genus-2 CPU point estimates | 1.44–2.53% |
| Confirmation genus-3 CPU point estimates | 1.42–3.69% |
| Confirmation genus-1 squared constants, two fixtures | 5.21%, 6.74% |

The initial inactive-path control for one fixture showed a -0.46% CPU difference
with an interval excluding zero. Consequently the **entire 512-bit slice** was
repeated, including all four controls, using 63 quartets. All four confirmation
controls have CPU and wall intervals including zero. All 16 genus-2 and genus-3
confirmation cases have positive CPU intervals. The four ordinary genus-1 cases
in this slice skip the changed branch and have inconclusive CPU differences.
Confirmation CPU intervals for the two squared-constant cases are [4.85, 5.56]%
and [6.44, 7.06]%. Intervals are per case, without a multiple-comparison adjustment.

A separately instrumented baseline shows the affected kernel consuming roughly
2–11% of whole-call CPU in sampled calls that use it. Some genus-1 low-precision
calls skip it. This diagnostic includes timing overhead and is only an
approximate cost decomposition; the reported improvements come from the
uninstrumented libraries.

## Correctness and precision

All 76 initial fixtures passed comparisons against an independent higher-
precision direct theta-series evaluation, checking 2,050 output values for
finite enclosures and overlap. The earlier integrated-library tests and exact
kernel checks remain preserved.

An additional accuracy diagnostic for all 28 confirmation fixtures checks 706
outputs. Candidate minimum `rel_one` accuracy is equal to or one bit above the
baseline in every fixture. The ratio of summed component radii is between
0.1674 and 1.0. Twenty-five individual output enclosures are wider, so uniformly
tighter enclosures are not claimed. Working precision is an input setting, not
a promise that every result has that many relative accuracy bits.

## Applied interpretation

Theta evaluation supports computations involving complex curves, modular forms,
and Abel–Jacobi maps. These uses are described in
[Labrande and Thomé, 2016](https://doi.org/10.1112/S1461157016000309).
The measured interface is an actual numerical-library operation with meaningful
mathematical uses. A small source change that consistently removes a few percent
of its CPU cost is a credible library optimization and a candidate for upstream
review.

The scope is specialized. These tests cover one M2 machine, two well-conditioned
fixtures per configuration, and no derivatives, multi-point batching, singular
limits, or larger genera at the complete-call level. Genus 1 has other specialized
FLINT interfaces whose performance was not compared here. Neither complete
class-polynomial computations nor other end-user applications were timed.
An application's total benefit depends on its time spent in the affected theta
evaluations. No broad FLINT, integer multiplication, or cryptographic throughput
claim follows from these measurements.

The specific new weighted-phase constructions are not required by this patch.
The defensible attribution is that investigating those constructions led to
finding and measuring an optimization in existing software; mathematical and
implementation novelty should remain separate questions.

## Reproduction and evidence

- `bench/theta_context.c`: public-call fixtures, timing, independent reference,
  and separate instrumentation diagnostics.
- `scripts/theta_context.py`: prepare, measure, analyze initial campaign.
- `scripts/confirm_theta_context.py`: full 512-bit slice confirmation and accuracy
  diagnostics.
- `results/theta-context/{plan,validation,trace,summary}.json` and `raw.jsonl`.
- `results/theta-context/confirmation/{plan,accuracy,summary}.json` and `raw.jsonl`.
- The initial analysis verifies 712 preserved fingerprints; confirmation verifies
  718. Prior artifacts and the baseline FLINT library remain unchanged.

Preparation and timing use distinct commands. Run `prepare`, then `measure`
without competing work, then `analyze`. Output directories must be fresh;
historical evidence is not overwritten.
