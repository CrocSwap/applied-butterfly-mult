# First baseline: Apple M2, October 7, 2026

This is the initial baseline record. See the subsequent
[three-candidate experiment report](experiments-m2.md) for the confirmed change.

## Outcome

Built unmodified FLINT, checked the relevant upstream tests, measured 78 cases,
and collected four independent call-stack profiles. The next experiment should
target layouts within the hot FFT basecases. Transform work dominates the sampled
runtime, and the simplest omitted-transpose optimization already exists upstream.

No project speedup has been measured. These results characterize the reference
implementation and select experiments.

## Reference build and checks

- FLINT commit `657a2839cf0125164859ff102b1f124abcb87ce0` (development snapshot).
- Apple M2, 24 GiB RAM, macOS 26.6.2, Apple Clang 21.0.0.
- GMP 6.3.0 and MPFR 4.2.2 from Homebrew.
- `-O3 -g -mcpu=apple-m2 -fno-omit-frame-pointer`, shared FLINT, ARM assembly and
  `FLINT_HAVE_FFT_SMALL` enabled. One FLINT thread.
- Upstream tests `sd_fft`, `mpn_ctx_mpn_mul`, and `mpn_ctx_to_from_ffts` passed.
- All 78 benchmark cases passed four exact comparisons with GMP: all-one limbs,
  alternating bits, a sparse power of two, and deterministic random inputs.

The source checkout has no tracked modifications. Fingerprints and test evidence
are retained in [build-manifest.json](../results/build-manifest.json).

## Timing survey

26 sizes from 999 to 524,288 limbs, with balanced multiplication, squaring, and
2:1 multiplication: 78 cases, 11 samples per engine per case, 1,716 timed batches.
Each size is the first operand's length; limbs contain 64 bits. Calibration
doubles batch counts until at least half the requested 10 ms target is reached.
Large individual calls naturally exceed that target.

Warm operands and contexts are reused. The harness alternates FLINT/GMP order
and shuffles cases. Correctness checks, context initialization, and input
generation are excluded from timing; packing, transforms, reconstruction, and
carries are included. Cold-start and application measurements remain future work.

Selected balanced multiplication medians:

| Bits per operand | FLINT, ms | GMP, ms |
| ---: | ---: | ---: |
| 262,144 | 0.257 | 0.404 |
| 1,048,576 | 1.199 | 1.943 |
| 4,194,304 | 5.560 | 11.967 |
| 16,777,216 | 23.727 | 61.022 |
| 33,554,432 | 48.408 | 192.922 |

These are existing library differences, not improvements from butterflyMult.
The median FLINT relative median absolute deviation across cases is 1.28%; the
worst is 6.51%. The workstation was not isolated, CPU placement was not pinned,
and frequency/thermal state was not controlled. This short survey is insufficient
to certify a 1% effect. Candidate evaluation needs longer paired baseline/candidate
runs, an unchanged/unchanged control, and repeat sessions with uncertainty reported.

[Raw samples](../results/m2-baseline-20261007/raw.jsonl),
[all medians and dispersion](../results/m2-baseline-20261007/summary.csv),
[environment and arguments](../results/m2-baseline-20261007/metadata.json).

## Profiles

Separate warmed FLINT-only processes were sampled for ten seconds with macOS
`sample`, requesting a 1 ms interval. Percentages below aggregate **exclusive
top-of-stack samples**, not recursive inclusive counts. Inlining obscures some
stage boundaries. These samples locate work; they do not distinguish arithmetic,
load/store instructions, cache misses, and memory stalls.

| Operand limbs / operation | Forward FFT | Inverse FFT | Reconstruction | Packing | Pointwise | Other / inline |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 16,384 / multiply | 53.21% | 27.40% | 13.29% | — | — | 6.10% |
| 16,384 / square | 36.64% | 37.89% | 19.93% | — | — | 5.54% |
| 65,536 / multiply | 43.15% | 20.51% | 21.96% | 9.95% | 3.51% | 0.91% |
| 524,288 / multiply | 46.79% | 22.16% | 18.99% | 8.40% | 3.31% | 0.35% |

The dashes mean not separately resolved: two-prime packing and pointwise work
are inlined into the driver. Reconstruction includes CRT arithmetic, conversion,
and recomposition/carries; its whole share is not removable data movement.

[Machine-readable summary](../results/profile-summary.json) links to the four raw
profiles and includes per-function counts. The summarizer leaves entries omitted
by `sample`'s five-sample cutoff in the other/inline category.

## Production paths and existing optimizations

The ARM configuration switches to the small-prime FFT at 1,000 limbs for balanced
multiplication and 1,400 for squaring. The multiplication driver uses two primes
when the longer operand has at most 40,000 limbs, then selects a multi-prime
profile. The survey includes values immediately around all three boundaries.

Forward transforms already retain bit-reversed evaluations and a transposed
4-by-4 ordering inside 16-element blocks. Both input transforms use that order,
the pointwise operation preserves it, and the inverse accepts it. In particular,
`sd_fft_basecase_4_1` explicitly skips its final transpose. Reintroducing a
canonical layout would add work.

Relevant pinned source:

- [Dispatch thresholds](https://github.com/flintlib/flint/blob/657a2839cf0125164859ff102b1f124abcb87ce0/src/mpn_extras/arm64/flint-mparam.h)
- [Forward layouts and basecases](https://github.com/flintlib/flint/blob/657a2839cf0125164859ff102b1f124abcb87ce0/src/fft_small/sd_fft.c)
- [Inverse basecases and recursive schedule](https://github.com/flintlib/flint/blob/657a2839cf0125164859ff102b1f124abcb87ce0/src/fft_small/sd_ifft.c)
- [Two-prime pipeline and reconstruction](https://github.com/flintlib/flint/blob/657a2839cf0125164859ff102b1f124abcb87ce0/src/fft_small/mpn_mul_np2.c)
- [Multi-prime pipeline](https://github.com/flintlib/flint/blob/657a2839cf0125164859ff102b1f124abcb87ce0/src/fft_small/mpn_mul.c)

## Ranked experiments

### 1. Joint lane layouts for 16- and 32-point butterfly basecases

The forward and inverse `basecase_4_0` routines are among the hottest functions.
Search a small set of lane permutations and stage schedules across two radix-4
operations, then extend to the 32-point case. Begin with the existing external
layout so integration is local. A broader variant can change that layout jointly
in forward/inverse kernels and the index contract.

The concrete optimization target is the remaining internal transpose, twiddle
arrangement, and any register spills or repeated loads around these operations.
First inspect generated ARM instructions to establish which costs exist. Score
complete kernels on the M2; a smaller symbolic shuffle count is insufficient.

Correctness requires matching the existing transform for every supported twiddle
case, preserving modular range bounds, and checking the inverse and truncated
wrappers. The theoretical connection is choosing compatible representations
across successive gates with every boundary conversion counted.

### 2. Fuse pointwise multiplication with inverse entry work

Both pipelines write pointwise products to the transform buffers and then call
the inverse transform, which reads those products. Try consuming the two spectra
directly in the first inverse basecase and retaining products in registers or a
small tile. Start with full blocks; use the existing path for unsupported tails.

The multi-prime pointwise pass also applies a normalization/CRT scale. The
two-prime path normalizes later in reconstruction. A shared fused kernel must
respect that distinction. Truncated inverse recursion mixes transformed and
partially recovered data, so multiplying every value on every inverse read would
be incorrect: each original spectral value must be multiplied exactly once.

The separately measured pointwise stage is only about 3.3–3.5% of runtime in the
larger cases. Its arithmetic remains necessary; eliminating its standalone pass
can save only part of that share, with possible additional locality benefits.

### 3. Tile the two-prime reconstruction handoff

`_fft_small_np2_crt_recompose` makes a vectorized sweep that writes normalized
Garner components back to both double arrays, followed by a scalar sweep that
reads them and emits limbs. Test a small tile that completes both sweeps while
the tile is local, carrying the four-limb accumulator continuously across tiles.
After that control, assess retaining the intermediate components in registers.

This is an explicit producer/consumer boundary with a 13–20% sampled stage share
in the two-prime cases. It has a weaker direct connection to the network theorem
than experiment 1. It can serve as a practical data-movement control. Existing
comments report prior packing/reconstruction optimizations, so preserve SIMD
throughput and compare with the current implementation rather than assuming that
fusion wins. Exercise chunk/limb boundaries, long carries, and short final tiles.

## First experiment's acceptance criteria

1. A bounded candidate set and exact description of each layout/interface.
2. Correct transform outputs and integer products, including non-power-of-two
   sizes, squaring, unbalanced products, and threshold neighbors.
3. Faster complete multiplication versus the pinned unmodified FLINT build over
   a contiguous interval, with uncertainty small enough to assess the effect.
4. Report neighboring-size regressions and reject improvements caused solely by
   omitting conversion work or changing benchmark conditions.

The initial milestone remains a robust 1% kernel improvement. An application
demonstration follows a surviving kernel candidate.
