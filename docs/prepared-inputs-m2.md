# Shared input reductions with contiguous spectral products

October 7, 2026. Follow-up to the [four-column matrix kernel](shared-matrix-kernel-m2.md).

## Result

**Preparing each reusable left input once preserves the shared-reduction gain
and removes the previous regressions on the tested grid.** All 30 active
workloads had positive CPU and wall-time confidence intervals in both
confirmation runs. Complete-call CPU time reductions ranged from **4.34% to
15.09%**. The two inactive scalar/2×2 cases are reported separately below.

The new patch is the preferred experimental matrix implementation for these
measured M2 workloads. It replaces the tiled candidate; the two improvements
are not stacked. The baseline remains unchanged, and this result does not
establish performance across all FLINT workloads or hardware.

| Complete operation | CPU reduction, run 1 | CPU reduction, run 2 | Wall reduction, runs 1 / 2 |
| --- | ---: | ---: | ---: |
| 8×8, length 256, FFT prime, full | 14.61% [14.29, 14.98] | 14.48% [14.29, 14.64] | 14.58% / 14.44% |
| 8×8, length 256, 1000000007, middle | 13.97% [13.45, 14.39] | 13.60% [13.29, 13.86] | 13.94% / 13.60% |
| 8×8, length 1024, 1000000007, middle | 13.60% [13.06, 14.02] | 14.13% [13.80, 14.46] | 13.57% / 14.15% |
| 8×8, length 1024, FFT prime, full | 13.84% [13.13, 14.47] | 14.82% [14.61, 15.05] | 13.73% / 14.83% |
| 4×4, length 256, 1000000007, full | 7.39% | 7.50% | 7.39% / 7.46% |

The FFT prime is `0x3f00000000001` = 1108307720798209. Middle products return
coefficients in `[length/2, 3*length/2)`. Brackets are marginal 95% circular
block-bootstrap intervals; all intervals, including wall time, are retained
in the raw-result summaries and audit.

For scale, the first run's median CPU times for the length-256 FFT-prime full
product were approximately **503 µs → 430 µs**. For the length-1024 middle
product modulo 1000000007 they were **4.40 ms → 3.80 ms**. The reported percentage
estimates use paired quartets, rather than ratios of these overall medians.

## Implementation

Patch: [`poly-prepared.patch`](../patches/poly-prepared.patch).

The input-owning worker now reduces each eligible left spectrum in place
immediately after its forward transform. The existing barrier completes all
input preparation before any output work begins. Each output is then computed
with contiguous, 16-frequency pointwise loops over the inner matrix dimension.

The matrix driver keeps its existing one accumulator per worker, output-task
distribution, transform order, prime selection, storage model, and destructive
inverse/export path. There is no additional spectrum buffer. The helper uses
small local pointer arrays, and both arithmetic kernels have **zero
stack-referencing instructions** in the measured assembly.

The fast path requires at least four output columns and an inner dimension
between 4 and 16. The matrix helper checks lengths, term bounds, domains, and
multiplicative depths before writing output. Zero operands and unsupported
metadata fall back to the original generic dot product. Preparation of a
nonzero left input remains safe even if a later dot product falls back: the
reduced spectrum represents the same polynomial and remains valid for the
original operations.

When A and B are the same matrix, the shared input pool is prepared once. This
also narrows the right operand's numerical range, which stays within the
existing multiplication contract. Aliased output matrices continue to use
the original driver's temporary-matrix handling.

### What is shared

For each row `i`, inner index `k`, FFT prime `p`, and frequency `f`, compute

```
r[i,k,f] = reduce_to_pm1n(A_hat[i,k,f], p)
```

once, then reuse that value in every output column. The prepared values occupy
the original left-input spectrum storage. This extends sharing across the
whole row instead of limiting it to a four-column tile.

For square dimension `d`, `q` primes and `L` spectral slots, left-input
reductions decrease from `d³ q L` to `d² q L`: **87.5% fewer at d=8**, and 75%
fewer at d=4. For d=8, q=2, L=4096, the count is 4,194,304 → 524,288. Product
mulmods and accumulator reductions remain.

The price is a preparation pass reading and writing `d² q L` doubles. At the
example size that is 8 MiB of source-level reads plus writes. This is not a
measured DRAM-traffic count. The pass, including its traversal and calls, is
inside every complete-operation timing.

### Range argument

Preparation uses the existing reduction, preserving the residue modulo each
FFT prime and placing the left operand in `[-p,p]`. Multiplication by a right
operand in `(-4p,4p)` therefore satisfies the existing `(-4p²,4p²)` mulmod
contract. The first product and the subsequent accumulator reductions retain
the original dot-product order and bounds. There is no accumulation of an
unbounded unreduced sum.

This is a private matrix interface: it relies on the driver preparing left
inputs before selecting the fast path. The generic transformed-polynomial
API acquires no new implicit input-range requirement. Length, growth, and CRT
normalizer bookkeeping retain their existing meaning.

## Attribution

The matched `poly-contiguous-control` build uses the same dot-product helper
and contiguous access pattern, but skips input preparation and retains the
per-product reductions. This needs no compiler barriers. The candidate's
contiguous kernel has 126 assembly instructions and 16 `FRINTN` instructions;
the matched control has 150 and 24. Both have zero stack references. The
separate preparation kernel has 39 instructions, including eight `FRINTN`,
and zero stack references. These are static code counts, not dynamic totals.

| Full product | Contiguous control vs original baseline | Prepared vs contiguous control |
| --- | ---: | ---: |
| 8×8, 240, 1000000007 | +3.26% | +6.57% [6.19, 6.95] |
| 8×8, 256, 1000000007 | +3.95% | +9.60% [8.85, 10.35] |
| 8×8, 1008, 1000000007 | +2.95% | +6.06% [5.83, 6.26] |
| 8×8, 1024, 1000000007 | +4.62% | +9.64% [9.42, 9.88] |
| 8×8, 1024, FFT prime | +5.13% | +10.38% [10.03, 10.78] |
| 4×4, 256, 1000000007 | +2.70% | +5.57% [5.25, 5.79] |

All six CPU intervals were positive in each comparison. The helper itself
provides a gain relative to the original per-operation dispatch. Moving the
reductions into the shared preparation pass supplies an additional, measured
benefit. These are conditional effects from separate runs; adding their
percentages would be incorrect, and the entire baseline gain cannot be
attributed solely to fewer reductions.

## Direct comparison with the tiled kernel

The new implementation beat `poly-shared4-wide` in all ten paired cases, with
positive CPU and wall intervals. Representative CPU time reductions **relative
to the tiled kernel**, not relative to the original baseline:

| Operation | Additional time reduction |
| --- | ---: |
| 8×8, 256, FFT prime, full | 7.31% [6.73, 7.99] |
| 8×8, 1024, 1000000007, full | 17.51% [16.98, 18.07] |
| 8×8, 1024, 1000000007, middle | 17.75% [16.23, 19.40] |
| 8×8, 1040, 1000000007, middle | 14.90% [13.62, 16.44] |
| 8×8, 272, 1000000007, middle | 5.43% [4.65, 6.35] |

The complete comparison is in
[`poly-prepared-versus-tile`](../results/poly-prepared-versus-tile). These
results support replacing the earlier tiled experiment on the measured cases.

## Verification

Both the candidate and matched control passed:

- **1,294,080 exact output-coefficient and range checks each**, over four FFT
  primes, five inner dimensions, boundary inputs and random signed inputs.
  The oracle uses signed 128-bit arithmetic. Candidate tests additionally
  check the range and residue of every prepared input value.
- **188 complete-matrix comparisons each**, including rectangular matrices,
  zero entries, unequal lengths, aliases, squaring, partial/past-end/empty
  windows, constrained memory, and 1/2/4 threads.
- The same fixture in separate instrumented libraries, with **3112 helper
  attempts and 3020 successes** per library. The candidate prepared 3935
  nonzero inputs comprising 12,869,120 prime-frequency slots; the matched
  control performed no preparation.
- FLINT's multiplication, middle-product, and squaring tests.

A separate coverage sweep checked **all 32 performance cases in both
instrumented libraries**, with an independent KS reference. Every active case
used the new dot-product helper. In the candidate, each left matrix entry was
prepared exactly once; the control performed zero preparation passes. Scalar
and 2×2 cases executed neither new arithmetic path. Instrumented libraries
were not used for timing.

Across the screen, controls, confirmations and comparisons, the resident-library
harness also passed 600 KS-reference comparisons and retained 11,888 timed
batches. The original FLINT source and all 97 fingerprints in the preceding
matrix-kernel audit remain unchanged.

## Measurement scope and limits

The dependency remains FLINT commit
`657a2839cf0125164859ff102b1f124abcb87ce0`, on Apple M2 with the existing Apple
Clang 21 optimization flags. Performance uses one FLINT thread. Correctness
at several thread counts is not a multi-thread performance result.

The confirmation plan reuses the prior 32-case grid: dimensions 4 and 8,
lengths 240/256/272/1008/1024/1040, full and middle products modulo 1000000007;
selected 8×8 cases modulo the FFT prime; and scalar/2×2 controls. This includes
both sides of the previously observed transform-size boundaries. Full products
use FLINT automatic dispatch; matrix middle products use its explicit FFT API.

Each case uses deterministic dense inputs, independent KS checks, a shared
warmup, and 31 alternating ABBA/BAAB quartets with equal iteration counts and
at least approximately 10 ms per calibrated batch. All public-call allocation,
preparation, transforms, arithmetic, and reconstruction are timed. Case order
changes between confirmation runs. Compilation, validation, and instrumented
coverage were separate from timing.

All six unchanged-library CPU control intervals included zero. The inactive
scalar case showed a −0.63% CPU change in the first confirmation and −0.08%
in the second; the inactive 2×2 case showed +0.10% and +0.51%. Some small
inactive intervals excluded zero. They cannot be assigned to shared
reductions, and show the remaining code-placement/system sensitivity. The
active gains are larger and repeat.

Intervals are marginal rather than adjusted for multiple comparisons. The
results concern warm synthetic matrix operations on this machine. Untested
sizes, moduli, sparse workloads, cold calls, larger inner dimensions, other
hardware, and downstream applications remain outside the performance claim.
There is no claim of a FLINT-wide average speedup.

## Connection to the theoretical direction

The transferred principle is to compute a reusable intermediate once and
retain its representation across consumers. This implementation stores a
shared normalized spectrum in the existing input buffer and uses its range
contract to remove later arithmetic. It demonstrates a practical benefit from
sharing work across the complete operation.

It does not instantiate the sister project's pair-exclusion circuit, change
butterfly networks, or implement a new retained address frame. The stronger
direct-network objective remains open. This faster contiguous implementation
is now the appropriate practical comparison for future layout/network work.

## Reproduction and artifacts

```sh
python3 scripts/build_poly_prepared.py poly-prepared --prepare 1
python3 scripts/build_poly_prepared.py poly-contiguous-control --prepare 0
python3 scripts/validate_poly_prepared.py poly-prepared
python3 scripts/validate_poly_prepared.py poly-contiguous-control
python3 scripts/compare_poly.py --candidate .deps/experiments/poly-prepared/libflint-experiment.dylib --plan experiments/poly-prepared-confirm-plan.json --output results/poly-prepared-confirm
python3 scripts/compare_poly.py --candidate .deps/experiments/poly-prepared/libflint-experiment.dylib --plan experiments/poly-prepared-confirm-plan.json --seed 505093 --output results/poly-prepared-repeat
python3 scripts/trace_poly_prepared.py
python3 scripts/audit_poly_prepared.py
```

Destinations must be new. These commands use the existing comparison harness;
its exact compile command is recorded in
[`poly-kernel-harness-build.json`](../results/poly-kernel-harness-build.json).
The final audit also expects the retained screen/control/comparison runs:

- [`poly-prepared-screen`](../results/poly-prepared-screen)
- [`poly-prepared-aa`](../results/poly-prepared-aa)
- [`poly-prepared-confirm`](../results/poly-prepared-confirm)
- [`poly-prepared-repeat`](../results/poly-prepared-repeat)
- [`poly-contiguous-ablation`](../results/poly-contiguous-ablation)
- [`poly-preparation-ablation`](../results/poly-preparation-ablation)
- [`poly-prepared-versus-tile`](../results/poly-prepared-versus-tile)
- [`poly-prepared-coverage`](../results/poly-prepared-coverage)

Build/check directories retain commands, assembly, logs and source/library
fingerprints. [`poly-prepared-audit.json`](../results/poly-prepared-audit.json)
checks those fingerprints, patch applicability, numerical results, per-case
coverage, quartet ordering, and agreement between raw samples and reported
time reductions. The prior README is archived in
[`README-before.md`](../results/poly-prepared-doc-snapshots/README-before.md)
to preserve the preceding completion record's documentation fingerprint.

## Every confirmation case

CPU time reductions and 95% intervals follow. `g` means 1000000007 and `p`
means the FFT prime. The scalar and 2×2 rows are inactive controls. Complete
wall-time intervals are retained in the linked audit and summaries.

| Matrix | Length | Modulus | Window | Run 1 CPU reduction | Run 2 CPU reduction |
| --- | ---: | --- | --- | ---: | ---: |
| 1×1 | 1024 | g | full | -0.63% [-1.18, -0.13] | -0.08% [-0.52, +0.35] |
| 2×2 | 1024 | g | full | +0.10% [-0.51, +0.63] | +0.51% [-0.03, +1.06] |
| 4×4 | 240 | g | full | +5.32% [+4.87, +5.76] | +4.96% [+4.55, +5.30] |
| 4×4 | 240 | g | mid | +5.57% [+5.07, +5.98] | +5.53% [+5.13, +5.95] |
| 4×4 | 256 | g | full | +7.39% [+6.71, +8.01] | +7.50% [+7.09, +7.98] |
| 4×4 | 256 | g | mid | +8.09% [+7.79, +8.36] | +8.43% [+8.02, +8.90] |
| 4×4 | 272 | g | full | +5.61% [+5.12, +6.12] | +6.13% [+5.85, +6.40] |
| 4×4 | 272 | g | mid | +6.47% [+6.08, +6.83] | +6.44% [+6.06, +6.85] |
| 4×4 | 1008 | g | full | +4.70% [+4.14, +5.35] | +4.34% [+3.83, +4.86] |
| 4×4 | 1008 | g | mid | +5.00% [+4.61, +5.37] | +5.08% [+4.71, +5.35] |
| 4×4 | 1024 | g | full | +8.07% [+7.36, +8.86] | +7.73% [+7.17, +8.33] |
| 4×4 | 1024 | g | mid | +7.75% [+6.98, +8.32] | +7.99% [+7.42, +8.50] |
| 4×4 | 1040 | g | full | +7.12% [+6.46, +7.75] | +7.41% [+7.04, +7.84] |
| 4×4 | 1040 | g | mid | +7.76% [+7.29, +8.26] | +7.77% [+7.54, +8.03] |
| 8×8 | 240 | g | full | +9.50% [+9.01, +10.01] | +9.57% [+9.29, +9.86] |
| 8×8 | 240 | g | mid | +10.05% [+9.24, +10.77] | +10.04% [+9.75, +10.42] |
| 8×8 | 240 | p | full | +10.50% [+10.18, +10.81] | +10.85% [+10.50, +11.19] |
| 8×8 | 240 | p | mid | +10.72% [+10.31, +11.08] | +10.82% [+10.42, +11.30] |
| 8×8 | 256 | g | full | +13.93% [+13.45, +14.55] | +13.21% [+12.79, +13.60] |
| 8×8 | 256 | g | mid | +13.97% [+13.45, +14.39] | +13.60% [+13.29, +13.86] |
| 8×8 | 256 | p | full | +14.61% [+14.29, +14.98] | +14.48% [+14.29, +14.64] |
| 8×8 | 256 | p | mid | +14.94% [+14.54, +15.34] | +14.75% [+14.06, +15.34] |
| 8×8 | 272 | g | full | +9.86% [+7.34, +11.42] | +10.89% [+10.70, +11.06] |
| 8×8 | 272 | g | mid | +11.45% [+11.04, +11.83] | +10.83% [+10.48, +11.16] |
| 8×8 | 1008 | g | full | +8.36% [+8.06, +8.68] | +8.29% [+7.87, +8.70] |
| 8×8 | 1008 | g | mid | +9.09% [+8.28, +9.77] | +9.73% [+8.98, +10.63] |
| 8×8 | 1024 | g | full | +14.00% [+13.58, +14.45] | +13.51% [+12.93, +14.02] |
| 8×8 | 1024 | g | mid | +13.60% [+13.06, +14.02] | +14.13% [+13.80, +14.46] |
| 8×8 | 1024 | p | full | +13.84% [+13.13, +14.47] | +14.82% [+14.61, +15.05] |
| 8×8 | 1024 | p | mid | +14.79% [+14.49, +15.09] | +15.09% [+14.81, +15.39] |
| 8×8 | 1040 | g | full | +12.00% [+11.46, +12.45] | +12.84% [+11.94, +13.50] |
| 8×8 | 1040 | g | mid | +12.48% [+12.02, +12.92] | +13.67% [+13.05, +14.22] |
