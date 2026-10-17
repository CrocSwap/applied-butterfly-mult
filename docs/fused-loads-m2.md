# Loading FFT twiddles into their required lane order

## Outcome

**Fewer compiled instructions, but no repeatable whole-operation speedup.**
All six candidate CPU-time aggregate intervals include zero. This concrete
forward-load patch fails the prespecified 1% continuation threshold and remains
an experiment; no application benchmark or integration with C3 was pursued.
The earlier reconstruction-fusion result and measured libraries are unchanged.

CPU-time reduction, positive meaning faster; brackets are 95% intervals:

| Run | Squaring | Balanced multiply | 2:1 multiply |
|---|---:|---:|---:|
| Unchanged relink control | +0.21% [−0.23, +0.66] | −0.10% [−0.51, +0.28] | +0.24% [−0.17, +0.63] |
| Forward candidate, pass 1 | +0.14% [−0.13, +0.41] | +0.09% [−0.13, +0.31] | +0.22% [−0.01, +0.47] |
| Forward candidate, pass 2 | −0.24% [−0.60, +0.12] | +0.13% [−0.11, +0.38] | −0.17% [−0.46, +0.13] |

Wall measurements were substantially noisier. The first pass's apparent 2:1
gain, +5.51% [1.31, 9.65], did not repeat: +0.29% [−4.68, 5.61]. Squaring in
the second pass regressed by 3.64% [0.21, 7.05] in wall time. These measurements
do not support a wall-time speedup either. All CPU and wall aggregates are in
the [analysis](../results/fused-load-analysis.json); raw batches and per-case
summaries are in `results/fused-load-aa`, `results/fused-load-screen`, and
`results/fused-load-repeat`.

## Question and scope

The [first retained-frame experiment](network-research-m2.md) reduced data
shuffles but increased total instructions and slowed multiplication. This
follow-up checks one narrower mechanism: combine twiddle deinterleaving with
memory loads while preserving the original FFT factorization and spectral order.

This is a hardware implementation experiment within an ordinary FFT. It does
not implement the sister project's shared-sum network or establish a new
arithmetic-rank or asymptotic saving. It is measured without the earlier C3
reconstruction-fusion patch.

## Candidate and assembly screen

For a contiguous twiddle array `[0,1,2,3,4,5,6,7]`, the forward butterfly needs
the logical four-lane operands `[0,2,4,6]` and `[1,3,5,7]`. On NEON each logical
four-lane operand consists of two native two-lane registers. Two `vld2q_f64`
loads construct those operands directly. The original source expresses
contiguous loads followed by unpack operations; Clang already combines some,
but not all, of these into interleaved loads.

The [forward patch](../patches/fused-load-fft.patch) applies this to the nonzero
16- and 32-point leaves. It keeps the original implementation under the
non-NEON/generic fallback. Arithmetic, data transposes, output stores, inverse
transform, and reconstruction remain unchanged. The zero-twiddle leaves reuse
some contiguous twiddle operands elsewhere and were left unchanged.

Static counts from Apple Clang 21, `-O3 -mcpu=apple-m2`:

| Function | Original instructions | Explicit loads | Original / new ZIP | Original / new LD2 | Stack references |
|---|---:|---:|---:|---:|---:|
| Forward 16, nonzero | 191 | 188 | 10 / 8 | 1 / 2 | 0 / 0 |
| Forward 32, nonzero | 487 | 479 | 20 / 16 | 2 / 4 | 10 / 10 |
| Inverse 16, nonzero | 195 | 194 | 12 / 8 | 0 / 2 | 0 / 0 |

All floating arithmetic opcode counts are unchanged. The forward reductions
also include simpler address calculations. The inverse variant needs four
additional lane reversals (`EXT`), so its four fewer ZIPs translate to only one
fewer total instruction. It was retained as an assembly experiment and deferred
from runtime testing in favor of the larger forward reduction. The inverse
32-point body is unchanged at 504 instructions.

These are complete named leaf bodies, including returns, with no child calls.
Stack references include ABI saves, not just spills. An `LD2` does more work
than an ordinary load, so instruction counts alone cannot establish a speedup.
The [assembly report](../results/fused-load-assembly.json) includes opcode
counts, commands, and hashes; the complete function regions are preserved in
[fused-load-checks](../results/fused-load-checks/).

## Measurement protocol

The [plan](../experiments/fused-load-plan.json) was recorded before timing.
Two candidate passes each use all eleven established sizes and three shapes:
balanced multiplication, squaring, and 2:1 multiplication. Each case uses 21
alternating ABBA/BAAB quartets with equal iteration counts and a 10 ms batch
calibration target. The candidate is compared to pinned, unmodified FLINT.
A separate unchanged-relink control covers 4096, 8192, and 16384 limbs.

Thread CPU time is primary; wall time and all boundary cases are retained.
Aggregates equally weight the nine sizes inside 4096–16384 limbs, per shape.
Intervals use the existing moving-block bootstrap within each case. Both
candidate passes run regardless of the first result. The practical continuation
threshold is a repeatable 1% whole-operation reduction exceeding controls.

Compilation, validation, and analysis do not overlap our timing runs. Other
user/system processes were active; a process snapshot is retained. The controls,
interleaving, and CPU metric reduce confounding but do not make this a dedicated
benchmark machine. Bootstrap intervals describe variation within these runs,
not uncertainty across machines or workloads.

## Correctness

- The modified public transform passes FLINT's `sd_fft` test, including modular
  polynomial evaluation and truncated forward/inverse checks.
- The three other relevant FLINT tests pass: `mpn_ctx_mpn_mul`,
  `mpn_ctx_to_from_ffts`, and `_mpn_ctx_mpn_mul_range`.
- **338 complete multiplication cases, with 4,056 exact GMP comparisons per
  library**, cover dispatch neighbors, carries, squaring, and unbalanced ratios.
- All seven existing repository analysis/model tests pass.

See [validation](../results/fused-load-validation.json) and the preserved
[test results and build manifest](../results/fused-load-checks/). The inverse
assembly-only patch has not been runtime validated.

The [audit](../results/fused-load-audit.json) checks source and binary provenance,
the unchanged arithmetic opcode counts, correctness coverage, and all 6,300
timed batches. The baseline source is clean and its library hash is unchanged.

## Implication for the network research

The next [reduction-scheduling experiment](delayed-reductions-m2.md) is complete:
it finds a small-transform gain and an important dispatch-coverage limitation.

This probe shows that explicit load/rearrangement fusion can reduce compiled
work without introducing a new spectral frame. The measured reduction is too
small, or its instruction mix insufficiently beneficial, to establish a useful
whole-operation gain. These data do not identify which microarchitectural cost
dominates; no cycle-level model or direct leaf benchmark was measured.

The larger question remains open: can a joint choice of stage layout and
butterfly arithmetic save more total work? A further bounded search should
include interleaved loads as one implementation option and evaluate all
arithmetic, twiddle preparation, register pressure, and boundary conversions.
Neither this result nor the previous fixed-frame enumeration rules out such
schedules. Merely reducing a few more shuffle instructions is not yet a
supported path to a practical gain.

## Reproduce

Use the established Apple Silicon prerequisites and pinned FLINT checkout.
Build and result destinations must be fresh; the generator refuses to replace
its existing output directories and verifies any existing patches byte for byte.

```sh
python3 scripts/screen_fused_loads.py
python3 scripts/build_experiment.py fused-load-fft \
  --patch patches/fused-load-fft.patch --test
python3 scripts/validate.py \
  --candidate .deps/experiments/fused-load-fft/libflint-experiment.dylib \
  --output results/repro-fused-load-validation.json
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/control/libflint-experiment.dylib \
  --sizes 4096 8192 16384 --trials 21 --batch-ms 10 --seed 93471 \
  --output results/repro-fused-load-aa
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/fused-load-fft/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 21 --batch-ms 10 --seed 76491 --output results/repro-fused-load-screen
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/fused-load-fft/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 21 --batch-ms 10 --seed 18493 --output results/repro-fused-load-repeat
python3 scripts/analyze_experiments.py \
  --runs repro-fused-load-aa repro-fused-load-screen repro-fused-load-repeat \
  --output results/repro-fused-load-analysis.json
```

The relink control is built with `python3 scripts/build_experiment.py control`
if it is not already present. `scripts/audit_fused_loads.py` checks the original
preserved evidence against the current local binaries.
