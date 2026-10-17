# Contracts for the first three experiments

All patches apply independently to the FLINT revision in `deps.json`. Each
experimental dylib replaces only the changed `fft_small` objects, using the
same compiler flags, the same ordering of objects, and all remaining baseline
objects. The baseline checkout is unchanged. The control dylib is relinked from
all original objects, using the same procedure and no patch.

## C1: native two-lane schedule

`sd_fft_basecase_4_0` represents each emulated four-lane vector as two NEON
vectors. The patch completes the radix-4 operation on the low two lanes before
the high two lanes, for both stages surrounding the existing transpose. Each
lane executes the same arithmetic expression with the same twiddles and modular
reductions. The transpose and output address mapping are unchanged. Other
architectures retain the old body.

This is an attempt to improve the scheduling of independent lane groups, not an
arithmetic reduction. Baseline assembly has 191 instructions and no stack access
in this function. The candidate has 190 and no stack access. There is no spill
removal to claim. A timing improvement must therefore be established independently.

## C2: pointwise products immediately before inverse subtrees

The two-prime driver's pointwise operation is elementwise modular multiplication;
its inverse normalization remains in CRT reconstruction. For a full inverse
subtree, the inverse first operates on disjoint contiguous row subtrees, then
performs column operations. Move each row's pointwise multiplication to directly
before its inverse. No column operation begins until all required rows have
finished. Induction on the full subtree gives exactly the original operator.

Stop fusing at 256, 512, or 1024 coefficients. The product still goes to memory,
but the inverse consumes the small tile immediately. This is cache tiling, not
an assertion that all products remain in registers.

For a truncated top-level inverse, the interface has `z=n=trunc/256` and `f=0`.
Complete rows use the fused routine. Multiply all original coefficients in the
partial row **before** the first column operation, then use the original
truncated inverse for that row and the original column schedule. This prevents
mistaking reconstructed values for original spectra. Every supplied spectral
value is multiplied exactly once. The index and twiddle parameters of all
inverse calls match upstream. Squaring (`x == y`) is valid because disjoint
subtrees do not overwrite another subtree before its products are formed.

The new entry point is used only by the two-prime driver with positive,
256-aligned truncation and depth at least eight. Multi-prime multiplication and
the existing public inverse transform retain their original implementation.

The dedicated test compares the fused operation bit-for-bit with pointwise
multiplication followed by upstream's inverse, including signed extreme inputs,
three large primes, full/truncated transforms, and aliasing for squares.

## C3: tiled handoff between Garner reconstruction and carry propagation

The two-prime full/low-product path first computes independent normalized
Garner components for each coefficient. It then visits coefficients in increasing
order, converting components to limb contributions and updating a four-limb
carry accumulator. Move these two loops inside a loop over 128 coefficients.

The Garner expressions and range bounds are unchanged and depend only on the
same index in the two prime arrays. The carry loop processes exactly the same
coefficient sequence and retains all four accumulator limbs across tile
boundaries. Induction on the coefficient index therefore gives identical
accumulators, output limbs, and final carry draining.

The tiled helper is called only from the multiplication driver, when `zl == 0`,
with its private transform scratch and usual inverse normalization. The original
exported reconstruction function and nonzero-lower-bound window path stay intact.
This avoids extending the experiment to other callers' aliasing or normalization
contracts. The chunk extent, rounded vector tail, and output limit are identical
to upstream.

### C3 revision: consume eight coefficients without array writeback

The second C3 patch reduces the tile to eight coefficients and converts the
normalized components to integer vectors immediately. Constant-index consumers
then update the same carry accumulator. The private double arrays are no longer
used for intermediate component storage. Local integer temporaries may still
spill; this is not a claim that generated code eliminates every intermediate
memory access. This prototype uses the NEON representation of `vec8d` and is
evaluated only on the M2 configuration.

The helper additionally requires `bits < 64`. Consecutive coefficient offsets
`floor(j*bits/64)` therefore differ by zero or one. The carry-draining loop before
each coefficient can be a single conditional without changing its effect. The
final carry drain remains a loop. The last, short tile consumes only `jtop`
coefficients; its vector load is permitted by the existing padded extent. All
components are in `[0,p)`, below the vector conversion's exact-integer limit.
The rest of C3's ordering, normalization, and aliasing argument is unchanged.

## Measurement contract

Both dylibs are resident in one process. A case checks twelve input patterns
against GMP independently for each library, warms both for a combined 200 ms,
and chooses equal iteration counts. Timed quartets alternate ABBA and BAAB.
Every measured operation includes the complete production multiplication path.

For each quartet, average the two baseline times and the two candidate times.
The reported runtime reduction is one minus the inverse geometric mean of
baseline/candidate ratios. A circular moving-block bootstrap over consecutive
quartets provides a 95% interval, using blocks of up to five quartets. These are
per-case intervals, not simultaneous guarantees across all cases. Independent
confirmation runs are necessary after candidate/size selection. A/A controls
measure the practical sensitivity and possible bias of this setup.

Wall-time A/A controls became unstable under concurrent machine load. A later
harness variant records both wall time and `CLOCK_THREAD_CPUTIME_ID`, requesting
user-initiated macOS QoS without pinning a core. Thread CPU time excludes periods
when the benchmark thread is descheduled; it includes the CPU execution of the
whole multiplication. It is not an application-latency measurement. The six-case
dual-clock A/A control is retained, as are the earlier failed/noisy wall controls.
The final confirmation plan and metric were recorded before those confirmation
runs in `experiments/c3-confirmation-plan.json`.
