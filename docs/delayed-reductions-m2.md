# Scheduling modular reductions across inverse butterfly stages

## Outcome

Moving reductions across inverse butterfly stages produces a correct, smaller
kernel and a repeatable **1.6–1.8% CPU-time reduction for a 128-point inverse
transform** on this M2. It supplies **no improvement to the sampled large
integer multiplications**, whose dispatch never calls the changed kernel.
The 512-point inverse result remains inconclusive.

## What the multiplication measurements establish

**The 32-point kernel is smaller and passes exactness checks, but the target
multiplication workloads do not call it.** I initially selected this candidate
from its arithmetic and assembly improvement, before checking dispatch coverage.
That was a targeting error. The untimed coverage check below corrects the
interpretation: the whole-operation timings do not measure the benefit of
the changed arithmetic.

CPU-time reduction, positive meaning faster; brackets are 95% intervals:

| Run | Squaring | Balanced multiply | 2:1 multiply |
|---|---:|---:|---:|
| Unchanged relink control | +0.19% [−0.28, +0.70] | +0.98% [+0.15, +1.76] | +0.08% [−0.26, +0.40] |
| Candidate, pass 1 | +0.18% [−0.12, +0.49] | −0.21% [−0.71, +0.25] | +0.35% [+0.06, +0.67] |
| Candidate, pass 2 | −0.30% [−0.54, −0.06] | +0.08% [−0.13, +0.28] | −0.01% [−0.22, +0.20] |

The unchanged relink's apparent gain is another reason not to read these
small differences as arithmetic improvements. No new integer-multiplication
speedup is established; the candidate remains isolated. CPU and wall results
are retained in the [analysis](../results/delayed-reduction-analysis.json),
with all 6,300 raw batches under `results/delayed-reduction-{aa,screen,repeat}`.
Existing reconstruction-fusion results and libraries remain unchanged.

## Dispatch coverage and the hot kernel

The [untimed trace](../scripts/trace_delayed_reduction.py) uses a separate
instrumented library; none of its counters enter the timed binaries. It checks
each multiplication against GMP and counts all four 16/32-point inverse leaves.
All **33 multiplication cases execute zero 32-point inverse leaves**. Depending
on size and shape, they call the nonzero 16-point leaf 1,150–6,270 times per
operation. The trace's positive controls are full inverse transforms of size
128 and 512, which call the changed leaf 3 and 15 times, respectively. Sizes
256 and 1024 call it zero times.

This follows the source dispatch: for block exponent `k > 2`, the row recursion
uses `ceil(k/2)`. Starting at `k >= 2`, it reaches `k=2`, whose 256-point kernels
terminate in 16-point leaves. The 512-point special case uses 32-point leaves,
but is not reached by that recursion. Counts are preserved in
[leaf-calls.jsonl](../results/delayed-reduction-checks/leaf-calls.jsonl).

To check whether this reduction-placement idea transfers directly, I then
screened all **65,536 SIMD reduction placements** in the actual nonzero
16-point kernel: two radix-4 stages separated by the existing transpose.
The [model](../scripts/reduction_schedule16.py) tracks all four lane bounds
through that transpose. It certifies 25,600 schedules; **the current two-cut
placement is its unique minimum**. This is a restricted interval-model result,
not a proof that every possible 16-point implementation is optimal.

The current larger-workload target therefore needs a change to the arithmetic
graph, grouping, or instruction implementation to obtain a saving beyond what
this placement search certifies. Future candidates should pass an untimed call
coverage check before full-operation timing.

## Direct public inverse-transform timing

After discovering the dispatch gap, the separate inverse-only plan measures
128, 256, 512, and 1024 points. Each case uses 41 ABBA/BAAB quartets, a 10 ms
batch calibration target, equal iteration counts, user-initiated QoS, and both
thread CPU and wall clocks. The same context and buffer are used for both
resident libraries. Input is reset outside each timed batch; a batch repeatedly
applies the inverse to bounded residues. The context is warmed before timing.
This is a warm-buffer benchmark with one prime, `0x3f00000000001`.

CPU-time reduction, positive meaning faster; brackets are 95% intervals:

| Points | Changed-leaf calls per transform | Pass 1 | Pass 2 |
|---|---:|---:|---:|
| 128 | 3 | +1.83% [+1.53, +2.10] | +1.56% [+1.09, +2.00] |
| 256 | 0 | +0.01% [−0.22, +0.23] | +0.35% [−0.09, +0.78] |
| 512 | 15 | +1.13% [+0.83, +1.45] | +1.00% [−1.17, +2.64] |
| 1024 | 0 | +0.14% [−0.43, +0.62] | +0.09% [−0.24, +0.40] |

The unchanged-relink control has intervals including zero at all four sizes;
its 128-point estimate is +0.004% [−0.42, +0.41]. Thus the 128-point result
passes this exploratory plan's local-repeat criterion. The 512-point repeat
does not. No application effect or performance on other primes/hardware is
inferred from these measurements. The machine also runs other user/system
work; the bootstrap intervals capture within-run variability, not all possible
sources of uncertainty.

The [inverse-only analysis](../results/inverse-only-analysis.json) includes both
clocks and all controls. Raw measurements, build hashes, and environment
metadata are retained in `results/inverse-only-{aa,screen,repeat}`.

## Research question

The retained-layout and fused-load experiments did not yield a repeatable
whole-operation gain. This experiment searches for a larger reduction in work
by moving modular reductions across adjacent inverse FFT stages. It preserves
the existing data layout and Fourier operator.

This is a finite search over arithmetic schedules in a conventional butterfly.
It does not instantiate the sister project's shared-sum construction or establish
a new asymptotic multiplication result. No earlier experimental patch is included.

## Range contract and search

The existing FLINT contract provides:

- Integer inputs of magnitude strictly below `2p` for the inverse transform.
- `p < 2^50`, and centered twiddles of magnitude below `p/2`.
- For primes passing `fft_small_mulmod_satisfies_bounds`, full `mulmod` maps
  products below `2p²` in magnitude to values below `p`, and products below
  `4p²` to values below `3p/2`.
- `reduce_to_pm1n` returns a congruent integer of magnitude below `p`.

These are the bounds documented and checked in pinned FLINT's
`src/fft_small/mulmod_satisfies_bounds.c` and `src/machine_vectors.h`.
The prime predicate's `B >= 2` gate limits admitted primes to 50 bits.
For the small values being reduced here (`|x| < 8p`), multiplying by the rounded
reciprocal and rounding to the nearest integer approximates `x/p` with error
less than one; the fused remainder is an exactly representable integer below
`p` in magnitude. Round-to-nearest is the existing library requirement.

The first layer of an eight-input inverse butterfly produces four sums
`A_i = x_(2i) + x_(2i+1)` and four twiddle-scaled differences. The existing
implementation immediately reduces all four sums. Its next two layers reduce
their all-sum output once more: **five reductions in this even branch**.

The [search](../scripts/reduction_schedule.py) enumerates all 4,096 subsets of
12 possible reduction locations in this fixed branch. It checks every addition
*before* an optional reduction, enforces the modular-product bounds, and requires
all outputs to fit the inverse interface. It certifies 1,384 schedules. Its
unique three-reduction minimum places cuts at `Y0`, `Y1`, and `Z1` below.
The original five-cut schedule passes the same checker.

This minimum is restricted to the enumerated locations and conservative
interval rules. Rejected schedules may have exploitable value correlations;
this is not a lower bound over all valid butterfly algorithms.

### Selected schedule

Let `a,b,c,d` be the four **unreduced** initial sums, each of magnitude below
`4p`. The branch is:

```text
u = reduce(a+b)                  v = reduce(c+d)
s = mulmod(a-b, ww0)             t = mulmod(d-c, ww1)

out0 = u+v                      out1 = reduce(t-s)
out2 = mulmod(v-u, w0)           out3 = mulmod(t+s, w0)
```

| Quantity | Strict magnitude bound |
|---|---:|
| `a,b,c,d` | `4p` |
| Each four-input sum or difference before reduction/multiplication | `8p` |
| `u,v` | `p` |
| `s,t` | `3p/2` |
| `out0` | `2p` |
| `out1,out2,out3` | `p` |

Every integer addition stays below `8p < 2^53`, so binary64 represents it
exactly. The enlarged products `(a-b)*ww0` and `(d-c)*ww1` stay below `4p²`;
they explicitly use **full `mulmod`**, not the more restricted `mulmod_fast`.
The final products have magnitudes below `p²` and `3p²/2`, respectively.
The odd branch is unchanged and receives values below `p`, so its original
range argument applies. Modular reductions commute with the later linear
operations, proving the same residues at all eight outputs.

The branch now returns bounds `(2p,p,p,p)` instead of `(p,2p,p,p)`, both within
the caller's symmetric `2p` contract. This is why simply deleting reductions
without examining the next stage would have been unsafe.

## Implementation and assembly

The [patch](../patches/delayed-reduction.patch) replaces only
`LENGTH8INV_ANY_J` in `sd_ifft.c`. Its sole call is the nonzero 32-point inverse
leaf. The 16-point leaf, zero-twiddle leaf, truncation logic, spectral layout,
forward transform, pointwise multiplication, and reconstruction retain their
original implementations.

The [generator](../scripts/make_delayed_reduction.py) emits the patch and compiles
both original and modified sources with the established M2 flags.

| Nonzero inverse leaf | Original | Candidate |
|---|---:|---:|
| 16-point instructions | 195 | 195 |
| 32-point instructions | 504 | 490 |
| 32-point stack-address instruction references | 22 | 20 |

The 32-point leaf has four fewer `FMUL`, four fewer `FRINTN`, and four fewer
`FMLS` instructions. Two fewer load/store instructions account for the remaining
change. Paired loads/stores complicate interpreting this as a byte-traffic
reduction; stack references also include ABI saves. There are no child calls
in these named leaf bodies. Static counts alone do not establish a speedup.
The [assembly report](../results/delayed-reduction-assembly.json) retains all
opcode counts, commands, and function-region hashes.

## Correctness checks

- **211,072 eight-input cases** against an independent unsigned-128-bit modular
  reference, across four primes. These include every combination of eight
  extreme input signs and seven extreme twiddle signs, plus randomized cases.
- **55,296 direct 32-point leaf cases** compared with the original leaf across
  real twiddle indices and depths, including inputs near both `±2p` bounds.
- In total, **3,458,048 coefficient checks** verify integrality, finite values,
  modular equality, and output magnitudes strictly below `2p` for both versions.
- The interval-model tests verify the unique minimum within the selected graph
  and reject missing cuts that would violate exactness or output bounds.

The direct [test](../bench/test_delayed_reduction.c) uses wrappers compiled from
the exact original and modified screened sources. Its
[build record and results](../results/delayed-reduction-checks/) are preserved.
The candidate also passes the four relevant upstream FLINT tests and 338
complete multiplication cases comprising 4,056 exact GMP comparisons per
library. Those multiplication checks verify integration; the direct kernel
checks and upstream small-transform cases exercise the changed arithmetic.
All 11 repository tests pass. The [audit](../results/delayed-reduction-audit.json)
checks coverage, source/binary hashes, both finite searches, direct tests,
6,300 multiplication batches, and 1,968 inverse-only batches. The baseline
checkout and library hash are unchanged.

## Measurement protocol

The [plan](../experiments/delayed-reduction-plan.json) was recorded before timing.
It specifies two candidate passes across the same eleven established sizes
and all three shapes, plus an unchanged-relink control at three sizes. Each
case uses 21 interleaved ABBA/BAAB quartets, a 10 ms batch calibration target,
equal iteration counts, and the unchanged resident-library harness.

CPU time is primary. Aggregates equally weight the nine sizes inside
4096–16384 limbs for each shape. Wall time and neighboring cases are retained.
Both candidate passes run irrespective of the first result. A practical win
requires at least 1% reduction with positive intervals in both passes, exceeding
the relink control; a subset chosen after timing is not a confirmation.

The later dispatch finding limits interpretation as explained above. An
additional [inverse-only plan](../experiments/inverse-only-plan.json) was then
recorded for an exploratory measurement of public inverse transforms. This
is a separate kernel experiment, not a confirmation of multiplication gains.

## Reproduce

Use the existing pinned FLINT/M2 setup. Build and result destinations must be
fresh; existing matching patches are verified rather than replaced.

```sh
python3 scripts/reduction_schedule.py
python3 scripts/reduction_schedule16.py
python3 -m unittest discover -s tests
python3 scripts/make_delayed_reduction.py
python3 scripts/check_delayed_reduction.py
python3 scripts/build_experiment.py delayed-reduction \
  --patch patches/delayed-reduction.patch --test
python3 scripts/validate.py \
  --candidate .deps/experiments/delayed-reduction/libflint-experiment.dylib \
  --output results/repro-delayed-reduction-validation.json
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/control/libflint-experiment.dylib \
  --sizes 4096 8192 16384 --trials 21 --batch-ms 10 --seed 71539 \
  --output results/repro-delayed-reduction-aa
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/delayed-reduction/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 21 --batch-ms 10 --seed 93173 --output results/repro-delayed-reduction-screen
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/delayed-reduction/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 21 --batch-ms 10 --seed 34719 --output results/repro-delayed-reduction-repeat
python3 scripts/analyze_experiments.py \
  --runs repro-delayed-reduction-aa repro-delayed-reduction-screen repro-delayed-reduction-repeat \
  --output results/repro-delayed-reduction-analysis.json
python3 scripts/trace_delayed_reduction.py
python3 scripts/compare_inverse.py
python3 scripts/audit_delayed_reduction.py
```

Build the unchanged relink control with `python3 scripts/build_experiment.py control`
if it is absent. The trace and inverse-only scripts use fresh fixed destinations;
the audit checks the original retained evidence rather than the `repro-*` runs.
The raw timing data, correctness evidence, patch,
assembly, and range-search report are retained.
