# Reconstruction ablation contracts

These three patches each start from the retained C3 reconstruction patch, then
remove one feature. Each patch applies independently to the pinned original
FLINT source. The generation script is `scripts/make_ablations.py`; all source
replacements are checked for uniqueness. The original retained patch is unchanged.

## No fusion

The first pass computes normalized Garner components into the original private
double arrays. The second pass reloads eight normalized coefficients, performs
the retained SIMD conversion, and executes the retained unrolled carry update.
Both passes visit the same `jtop` extent as the retained patch. The rounded
last vector is within the asserted padded extent. Each component is independent
of other indices, so moving its production earlier changes neither the input
to the carry update nor the chronological carry sequence.

This restores whole-array writeback/reload and separates the producer and
consumer. Its timing contrast also includes compiler scheduling/register
allocation changes from splitting the loops. It is not a direct measurement
of memory traffic alone.

## Scalar conversion

Keep the fused eight-coefficient tile and retained carry update. Store the
normalized double vectors into local arrays and explicitly cast each of the
eight components to `ulong`, as opposed to calling FLINT's NEON conversion.
Each component is an exact nonnegative integer below its approximately
50-bit modulus, so truncation toward zero and rounding to nearest produce
identical unsigned integers. The compiler may optimize the local stores away.

The generated assembly confirms that this change survives optimization:
the retained function region has eight vector `fcvtnu` instructions, whereas
this version has none and uses `fcvtzu` conversion instructions. Some of the
casts are still auto-vectorized (`fcvtzu.2d`), while others are scalar. Thus this
compares explicit SIMD intrinsics with the compiler's cast lowering, and cannot
isolate the value of all SIMD execution. We measure the resulting code without
adding volatile operations or artificial compiler barriers to penalize it.

## General carry loop

Keep fusion and SIMD conversion, but replace the eight constant-index carry
updates with a loop over the actual coefficients in the tile. Restore the
`while (w0 < w)` carry drain. Since `bits < 64`, consecutive coefficient
positions advance by at most one output limb; the while executes at most once,
just as the retained conditional does. The accumulator and coefficient order
are unchanged. This ablates the unrolling and while-to-if specialization
together; the experiment does not distinguish those two contributions.

## Interpretation and checks

Each version passes the four relevant upstream FLINT tests and the same 338
whole-operation cases (4,056 GMP comparisons per library). Test logs, isolated
build manifests, and generated assembly are in `results/ablation-checks`.

In the timing contrasts, the ablation is library A and the retained patch is
library B. A positive reported reduction is the benefit of retaining that
feature while the other two features are present. The three contrasts are
context-dependent and must not be added to decompose the original percentage.
The fixed sizes, operations, controls, sessions, and interpretation rule were
recorded before measurement in `experiments/ablation-plan.json`.

## Application contract

`bench/pi.c` loads both FLINT dylibs and resolves each engine's functions from
its own handle. It calls `_mp_real_const_arb` with that engine's
`mp_real_const_pi4`, then scales the result by four. In the pinned source,
`_mp_real_const_arb` calls the constant function with `cache=0`; that path
calls the Chudnovsky computation from scratch. This is the computation used
underneath Arb's cached pi interface, with the result cache bypassed explicitly.

The timed region includes the complete series evaluation, reciprocal square
root, final arithmetic, internal allocation/free work, and rounding/scaling to
the output ball. It excludes decimal formatting and correctness verification.
FFT contexts, allocator state, and the output object are warmed. No cached pi
result is used in a timed call. This is a numerical application workload, not
an interactive application's startup or output latency.

At each precision, both engines must produce exactly equal Arb balls and at
least `precision - 4` bits of relative accuracy. Each ball must contain both
MPFR directed-rounding bounds for pi computed at 128 extra bits. Checks run
before and after timing. All benchmarks use one FLINT thread, and application
results retain both wall and thread CPU times with A/A controls.
