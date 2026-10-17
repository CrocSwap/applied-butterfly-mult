# Polynomial workload survey: select a shared spectral matrix kernel

**Follow-up:** [The kernel experiment and its measured gains and regressions](shared-matrix-kernel-m2.md).

October 7, 2026. This is a baseline survey and experiment selection, **not a new
speedup result**. The previous reconstruction and inverse-kernel experiments
remain separate.

## Decision

The next implementation target is the spectral matrix product inside
`nmod_poly_mat_mul` and `nmod_poly_mat_mulmid_fft_small`, starting with dense 8×8
matrices and retaining 4×4 and 2×2 cases as coverage and regression checks.

There are two concrete costs to attack together in a small output tile:

1. Each left input spectrum is range-reduced again for every output column.
   Compute that same intermediate once and share it across columns.
2. Each term of an output dot product sweeps the whole spectrum, loading and
   storing the accumulator again. Keep a short spectral tile in registers
   through the dot product.

The first has an arithmetic saving independent of any cache assumption. The
second has a load/store saving, whose actual benefit depends on register
pressure and cache behavior. Neither is implemented or timed yet.

This is a useful practical control for the more direct retained-frame research
direction. Sharing an intermediate is a connection to the sister project's
finite computation graphs; it does **not** instantiate its particular
pair-exclusion network. A stronger theoretical claim still requires an actual
mapping and a demonstrated movement saving.

## Measured scope and correctness

Pinned FLINT revision: `657a2839cf0125164859ff102b1f124abcb87ce0`.
Apple M2, one FLINT thread, Apple Clang 21, the existing baseline library and
compiler flags. The baseline library was not rebuilt or modified.

The initial plan covered 96 cases:

- Matrix dimensions 1, 2, 4, 8; dimension 1 uses the scalar polynomial API.
- Input polynomial lengths 32, 64, 256, 1024.
- Moduli 65537, 1000000007, and the FFT prime `0x3f00000000001`.
- Full product and middle interval `[length/2, 3*length/2)`.

The 32-case follow-up covered dimensions 4 and 8, lengths 240, 272, 1008, 1040,
the latter two moduli, and both windows. It was selected after inspecting the
initial dispatch counts, to test a transform-size boundary described below.

Across both plans:

| Check | Result |
| --- | ---: |
| Requested cases | 128 |
| Supported cases | 119 |
| Matrix cases reaching the transformed-polynomial context | 83 |
| Independent pattern comparisons across baseline and tracer | 714 |
| Warm baseline timing batches | 833 |

Each supported case checks dense deterministic random coefficients, coefficients
all equal to modulus minus one, and sparse endpoints. The reference computes
each matrix dot product with `nmod_poly_mul_KS` and polynomial addition, then
extracts the requested window. These comparisons all passed. This validates
the survey and tracer against the existing library; it is not a candidate
kernel validation suite.

Full matrix multiplication uses FLINT's automatic dispatch, including fallback.
Matrix middle multiplication explicitly calls the FFT API and records rejection
without adding a fallback. The nine rejected cases were:

- 2×2, lengths 32 and 64, all three moduli;
- 2×2, lengths 256 and 1024, modulus 65537;
- 4×4, length 32, modulus 65537.

Thus the survey's middle-product coverage is not a claim that an automatic
general-purpose matrix middle API accepts all these workloads.

## Where the time goes

The table uses median thread CPU time for the **complete warm public call**,
including per-call planning, allocation, input conversion, transforms,
spectral products, inverse transforms, and output reconstruction. Output
capacity and library caches are warm; input generation and reference checks
are outside timing. Seven batches target at least 10 ms each.

Profile percentages come from separate processes, using exclusive top-of-stack
samples. They include pointwise wrapper overhead and are approximate, not
hardware-counter measurements. The scalar profile produced only 63 samples
and is excluded from attribution. All eight accepted matrix profiles have at
least 1000 samples.

| Matrix | Length | Modulus | Window | CPU time | Pointwise share |
| --- | ---: | --- | --- | ---: | ---: |
| 2×2 | 1024 | 1000000007 | full | 168 µs | 19.5% |
| 4×4 | 256 | 1000000007 | full | 196 µs | 36.9% |
| 8×8 | 256 | 1000000007 | full | 1066 µs | 52.6% |
| 8×8 | 1008 | 1000000007 | full | 3366 µs | 36.0% |
| 8×8 | 1024 | 1000000007 | full | 4648 µs | 51.0% |
| 8×8 | 1040 | 1000000007 | full | 5003 µs | 46.0% |
| 8×8 | 1024 | FFT prime | full | 2090 µs | 53.7% |
| 8×8 | 1024 | 1000000007 | middle | 4431 µs | 54.1% |

For the 8×8, length-1024, general-modulus full product, the other major shares
are forward transforms 25.2%, inverse transforms 11.9%, and export/CRT/output
normalization 10.2%. Setup and allocation do not dominate these warm samples;
small or first-call workloads may behave differently.

At a 36% pointwise share, a 15% reduction in that phase's time would reduce
the complete call by about 5.4%, assuming other costs stayed fixed. This is
an experiment-sizing calculation, not a predicted or measured gain.

Raw wall and CPU batches, median absolute deviations, and single first-call
observations are retained. First calls are diagnostics, not a cold-start
distribution. Comparisons between different input lengths or windows here are
not paired optimization trials.

### A transform-size boundary matters

For an input length of 1024 the product capacity is 2047, but the generic plan's
no-wrap branch uses `ceil(log2(zn + 4))` to reserve headroom for signed bias.
This gives depth 12, or 4096 spectral slots. At length 1008 the capacity is
2015 and the plan uses depth 11, or 2048 slots. Similarly, lengths 240 and 256
use 512 and 1024 slots respectively.

The pointwise loops process every slot, whereas the transforms can be
truncated. This helps explain why pointwise work is especially prominent at
the original power-of-two lengths. The nearby-length profiles still put it
at 36–46% of total time. Future candidate plans must include both sides of
these boundaries. Removing the generic signed-bias headroom would require a
separate correctness argument; this survey does not propose deleting it.

## Dispatch and removable work

The existing matrix driver already transforms each input once. For a square
dimension `d`, distinct inputs A and B, `q` FFT primes, and spectral length `L`,
the observed counters agree exactly with:

```
forward transforms       2 d² q
inverse transforms         d² q
spectral multiplies        d²
spectral add-multiplies     d² (d - 1)
scalar spectral products   d³ q L
output exports             d²
```

The driver also already exports its accumulator destructively, avoiding an
extra spectrum copy. Neither shared input transforms nor that eliminated copy
can be counted as a new contribution.

For 8×8, length 1024, modulus 1000000007, the plan has two primes and 4096
slots. There are 64 multiply and 448 add-multiply calls: 4,194,304 scalar
spectral products per complete matrix product.

In the transformed ring, normalizers are deferred and the pointwise kernels
use `m == 1`. Each product currently computes a containment reduction of
`A[i,k][frequency]`, even though that same value is reused for all eight
columns. Sharing across the complete row would change the count of these
reductions from `d³ q L` to `d² q L`: here, 4,194,304 to 524,288, an **87.5%
reduction in this particular operation count**. A smaller column tile shares
less. Product mulmods and accumulator reductions remain necessary.

For one output dot product, the current loops perform `4d - 1` logical double
loads/stores per frequency: three for the first product and four per later
add-multiply. A register-held dot product needs `2d + 1` before any sharing of
inputs across outputs: 31 versus 17 at d=8. These are source-level access
counts, not DRAM traffic or a promised time reduction. Spills can erase them.

The range argument for sharing is simple: compute the **same** existing
reduction once, preserving its result in `[-p,p]`, and multiply by the unchanged
right input in `(-4p,4p)`. The product stays inside the existing mulmod contract
`(-4p²,4p²)`. Keep the existing accumulator reductions, addition order, and
CRT/length/depth metadata rules. An implementation must still validate these
conditions and its handling of zeros, aliasing, squaring, and partial tiles.

## Relationship to the theory

Two mechanisms from the sister repository are relevant:

1. **Shared finite computations.** The paired-network construction retains
   internal weighted sums across recursive calls. The practical analogue here
   is identifying the same intermediate in multiple output computations and
   evaluating it once. The operator and construction differ: no FLINT operator
   in this survey has been shown to equal the sister project's pair-exclusion
   map. Its rank costs and exponent gains do not quantify this kernel's cost.
2. **Compatible retained address frames.** The packed-movement audit uses
   `P_M X_v P_M^-1 = X_(Mv)` and requires all operands of a pointwise gate to
   align. For this workload, a common spectral permutation `P` obeys

   `P(sum_k a_ik ⊙ b_kj) = sum_k (P a_ik) ⊙ (P b_kj)`.

   Therefore a common frame can persist through the entire spectral matrix
   product. Any changed FFT children and twiddles must be conjugated
   consistently, and the inverse/export boundary must consume that frame.
   Arbitrary linear mixing of values does not have this property.

The second identity licenses a retained-layout experiment; it does not by
itself save an instruction. The current pipeline already keeps FLINT's native
FFT order. A more direct network candidate must identify existing shuffles,
transposes, or passes that its joint schedule actually eliminates. Adding and
then cancelling new permutations is not a baseline saving.

References in the sibling checkout:

- `../integerMult/docs/packed-movement-audit.md`
- `../integerMult/docs/research/shared-computation.md`
- `../integerMult/docs/research/paired-network.md`

## Next implementation and decision gates

Implement a small output-row/frequency tile in an isolated library, sharing
left-input normalization and retaining accumulators across the inner matrix
dimension. Keep its entry point specific to the matrix workload so the generic
transformed-ring contracts remain explicit. Additional output accumulators
must be included in allocation and profitability accounting.

Use separate controls for (a) tiled dot products with the original repeated
reductions and (b) the same tile with shared reductions. This separates memory
scheduling from shared arithmetic. Check assembly for spills before pursuing
more tile sizes. Do not search a large parameter grid first.

Then evaluate whether a matched forward/pointwise/inverse address frame can
remove further, named movement. Only a candidate with that derivation and an
exact finite permutation/operator check earns the stronger retained-network
description. If no such movement is found, report the shared-work improvement
under its narrower description and leave the direct-network question open.

Measure complete public calls with interleaved resident-library comparisons,
an unchanged-versus-unchanged control, a confirmation run, and both sides of
the observed size boundaries. Initial success target: at least 5% complete-call
time reduction across several nearby 8×8 cases, with supported 4×4/2×2 paths
and scalar controls checked for regressions. This is a target, not a stopping
rule that turns noisy or isolated wins into success. Broaden dimensions,
moduli, windows, and threading only after that screen.

## Evidence and reproduction

- Harness: [`bench/poly_survey.c`](../bench/poly_survey.c)
- Isolated tracer: [`scripts/build_poly_survey.py`](../scripts/build_poly_survey.py),
  [`patches/poly-survey-trace.patch`](../patches/poly-survey-trace.patch)
- Plans: [`polynomial-survey-plan.json`](../experiments/polynomial-survey-plan.json),
  [`polynomial-neighbors-plan.json`](../experiments/polynomial-neighbors-plan.json)
- Timing and counts: [`results/polynomial-survey`](../results/polynomial-survey),
  [`results/polynomial-neighbors`](../results/polynomial-neighbors)
- Profiles: [`results/polynomial-profiles`](../results/polynomial-profiles),
  [`polynomial-profile-1008`](../results/polynomial-profile-1008),
  [`polynomial-profile-1040`](../results/polynomial-profile-1040)
- Audit and attribution: [`polynomial-survey-analysis.json`](../results/polynomial-survey-analysis.json)

On a fresh checkout with the pinned dependency built:

```sh
python3 scripts/build_poly_survey.py
python3 scripts/survey_polynomials.py --output results/polynomial-survey
python3 scripts/survey_polynomials.py --plan experiments/polynomial-neighbors-plan.json --output results/polynomial-neighbors
python3 scripts/profile_polynomials.py --output results/polynomial-profiles
python3 scripts/profile_polynomial_case.py 8 1008 1000000007 full --output results/polynomial-profile-1008
python3 scripts/profile_polynomial_case.py 8 1040 1000000007 full --output results/polynomial-profile-1040
python3 scripts/analyze_polynomial_survey.py
```

Output directories must be new. Timing and profiling are sequential. The timing
harness rejects the instrumented library; trace mode rejects the baseline.
The audit checks dispatch formulas, artifact hashes, and all hashes in the
previous delayed-reduction audit. The earlier measured artifacts are unchanged.
