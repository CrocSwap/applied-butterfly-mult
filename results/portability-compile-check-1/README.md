# Portability screen: C3 fused reconstruction/carry on fft_small backends

Card `portable-fusion-fallback` (track `portability`), drawn with seed
`711a97e932757134a101062ddfdb4ffd`. Base commit `cc72641d`, FLINT `657a2839`.
Evidence level: **local-only, author-checked, compile and lane-semantics only.**
No FLINT build, no FLINT test, no timing.

## Question

Does `patches/c3-register-reconstruction.patch` need a portable fallback beside its
NEON fast path, and if so, where?

## Findings

1. **At FLINT 657a2839, fft_small has exactly two backends: AVX2 and NEON.**
   `configure.ac` sets `FLINT_HAVE_FFT_SMALL` only after the ARM (l.482) or x86
   (l.619, l.647) checks pass. The generic tier of `src/machine_vectors.h`
   (l.2517 onward) implements only the gemm/dfloat subset. It has no `_mulmod`,
   `_reduce_to_0n` or `convert_limited` operations, which are macro-generated only in
   the AVX2 (l.891-1021) and NEON (l.1815 onward) sections. So fft_small, patched or
   not, cannot build on the generic tier.
2. **The patch uses no NEON-only interface.** Apart from portable `longlong.h` macros,
   the only backend-specific operations it adds are `vec4d_convert_limited_vec4n` and
   `vec4n_store_unaligned`. Both are defined for AVX2 (`machine_vectors.h` l.633,
   l.653) and NEON (l.2288, l.2293). Pinned upstream fft_small already uses the same
   pair (`src/fft_small/mpn_helpers.c` l.40-44).
3. **Pinned, C3-patched and scalar-conversion-patched `mpn_mul_np2.c` all compile with
   `-O3 -Wall`, with no warnings, for both `arm64 -mcpu=apple-m2` and
   `x86_64 -mavx2 -mfma -mbmi2`** (`compile_check.txt`). `__text` grows from 5443 to
   8131 bytes on x86_64 and from 5192 to 7376 bytes on arm64, so the inlined fused
   routine is present on both targets.
4. **The two backends' conversions agree exactly on the patch's domain.** The patch's
   operands are integer-valued doubles in `[0, p)`, with `p < 2^52`. On
   67,109,124 such values (edges near each power of two plus 2^26 random), the AVX2
   `+2^52`/xor conversion (run under Rosetta 2) and the NEON `vcvtnq_u64_f64`
   conversion both equal the scalar `(ulong)` cast, with 0 mismatches each. The
   out-of-domain failure controls detect mismatches: 5/8 on AVX2 and 2/8 on NEON
   (`lane_check.txt`).

**Conclusion (scoped):** at this FLINT commit no fallback is needed for the patch to
compile on every target where fft_small builds, and its lane extraction has the same
semantics on both backends. `ablation-scalar-conversion.patch` is already a
backend-neutral variant, and it also compiles on both targets. If upstream wants a
fallback for a future generic fft_small, that is the natural candidate. Its measured
cost relative to the NEON path is in `docs/ablations-m2.md`.

## Not checked

- No FLINT build or link, no `fft_small` tests, and no exact multiplication against
  GMP on x86-64. Compiling is not correctness.
- **This does not meet the card's acceptance gate** (exact multiplication against GMP,
  `fft_small` tests and timing), so `portable-fusion-fallback` stays open. It is a compile
  and lane screen only.
- No timing on any architecture. The NEON path is byte-identical to the measured patch,
  so the M2 result should carry over, but this was not re-measured.
- The lane test uses conversion code copied from FLINT `657a2839` `machine_vectors.h`,
  not FLINT's headers themselves; the copies were checked against the source.
- The AVX2 check ran under Rosetta 2 on an M2, not on x86 hardware. Rosetta's AVX2
  emulation was trusted.
- The compile used a hand-written minimal `flint-config.h` (`flint-config.min.h`), a
  generated `flint.h`, and the arm64 Homebrew `gmp.h` for both targets, not a real
  `configure`.
- AVX-512 paths (`__AVX512F__`) and MSVC were not compiled.
- Not independent: same maintainer account and the same M2 as the original work.

## Replay

```sh
# FLINT 657a2839 sparse checkout of src/*.h, src/*.h.in, src/fft_small/ in $B/dl/flint-src;
# $B/build/inc holds flint-config.min.h (as flint-config.h), flint.h generated from
# flint.h.in, and gmpcompat*.h copied from their .h.in; $B/build/inc-{arm64,x86_64}
# hold the flint-mparam.h named in environment.txt; *_mpn_mul_np2.c are the pinned
# file and the two patched copies.
FILES="base c3 scalar" bash compile_check.sh "$B"
clang -O2 -target x86_64-apple-macos13 -mavx2 -mfma lane_convert_check.c -o lane_x86 && arch -x86_64 ./lane_x86
clang -O2 -mcpu=apple-m2 lane_convert_check.c -o lane_arm && ./lane_arm
```

## Open next questions

- Does the C3 patch pass FLINT's `fft_small` tests and the exact GMP checks in
  `bench/compare.c` on real x86-64 AVX2 hardware, and does it gain or regress there?
  This overlaps card `second-architecture-measurement`.
