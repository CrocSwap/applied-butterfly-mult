# Lead results against current FLINT main (`54d1439`)

October 18, 2026. Re-measures two frontier patches, C3 squaring and poly-prepared,
against FLINT main `54d1439be0247173c743f1300a1e0144d24e25dd` (2026-10-17), 37 commits
after the frontier's pin `657a2839`. Same protocols, plans and seeds as the original
confirmations; fresh build; new output names. Evidence level: **author-checked**.
Same account (@Mister-Meeseeks) and same model of machine as the original work, so this
is a build-and-revision repeatability check, **not** independent replication.

## Result

- **C3 squaring survives and is slightly larger.** The complete-squaring CPU reduction
  is **3.65% [3.33, 3.98]** and **3.44% [3.21, 3.68]** in two confirmations (originally
  3.26% [2.99, 3.54] and 3.10% [2.85, 3.34]). All 11 squaring sizes have positive
  intervals in both runs. Multiply: 2.40% [2.06, 2.74] and 2.38% [2.09, 2.68].
- **Poly-prepared does not carry over.** 22 of 30 active cases have positive intervals
  in both runs (originally 30/30). Across both runs the per-case range is **-9.79% to
  +11.45%** (originally +4.34% to +15.09%). The case-level mean reduction fell by about
  5 points.
  - Lengths 272 and 1040, just past a power of two, now **regress**: down to -9.8%
    at 8x8 length 1040 and -7.8% at 4x4 length 1040. Around zero at length 272.
  - Lengths 256 and 1024 still gain, but less: about 9-10% at 8x8 (was about 14%) and
    about 5% at 4x4 (was about 8%).
  - Lengths 240 and 1008 are unchanged within noise.
  - Over the same revisions the unmodified baseline got faster: up to 29% at 256/1024
    and 7-20% at 272/1040 (median ns, run 1). Those runs were weeks apart under
    different load, so treat these baseline shifts as indicative only.

The frontier record is scoped to `657a2839` and stays as stated. This affects any
upstream proposal: poly-prepared needed rework against current FLINT (below), while
C3 appears to rebase cleanly.

## Follow-up: truncating the poly-prepared kernels restores the gain

**Cause.** Upstream `fft_small` pointwise operations on main cover only
`_op_npts(P) = min(_fft_small_op_trunc(P->ztrunc, P), 2^depth)` points
(`src/fft_small/op.c`, FLINT `54d1439`): "not the whole 2^depth, up to twice as
many". The candidate's prepared and contiguous kernels still covered all `2^depth`
slots (`bench/poly_prepared.inc:51,87`). So just past a power of two it did up to
twice the baseline's pointwise work.

**Change.** `bench/poly_prepared_trunc.inc` is the original kernel with one helper,
`_bf_npts`, which returns upstream's point count, used at those two call sites. It
uses `_fft_small_op_trunc` from `fft_small.h`, which exists only on newer FLINT, so
it is a main-only variant. `scripts/build_poly_prepared.py` gained `--kernel`; the
default is still the original kernel. Build: `m54-poly-trunc`.

**Correctness.** `scripts/validate_poly_prepared.py m54-poly-trunc` passes
(`results/m54-poly-trunc-checks/`): 188 matrix comparisons against an independent
reference, covering lengths 64-1040 including 272 and 1040, five moduli and 1/2/4
threads, plus 80 accepted and 4 refused middle products, 24 alias comparisons and
FLINT's `nmod_poly_mat` tests.

**Timing** (same plan and seeds, same session baseline and poly control):

| Kernel on FLINT main | Eligible cases with positive intervals in both runs | Eligible-case CPU range |
|---|---:|---|
| Original (`m54-poly-prepared-*`) | 22 / 30 | -9.79% to +11.45% |
| Truncated (`m54-poly-trunc-*`) | **29 / 30** | **+2.02% to +11.70%** |

- Lengths 272 and 1040 go from regressions back to gains: 8x8 length 1040 +6.6 to
  +7.8%, 8x8 length 272 +8.4 to +9.9%, 4x4 length 1040 +3.4 to +5.3%.
- The exception is 4x4 length 272 middle: +4.14% [2.81, 5.38] and +2.02%
  [-2.74, 6.00]. The second interval is unusually wide; it was not rerun after the
  fact.
- The inactive 1x1/2x2 controls stay near zero (-0.77% to +1.01%).
- At 256/1024 the gain is still about 9-10% at 8x8, not the original about 14%. That
  smaller margin reflects the faster upstream baseline and is not addressed by this
  change.

So the prepared-input idea still gives roughly **2-12%** across all 30 eligible cases
on FLINT main, provided the kernel follows upstream's truncation. That is a single
author-checked session on a loaded machine, not a confirmation under the original
standard.

## Checks

- All five frontier patches apply cleanly to `54d1439`; `theta-equal-bank` needs
  `theta-direct-walsh` applied first (as `docs/theta-equal.md:107` says). The theta
  patches were not built or measured. No upstream commit since the pin touches
  `src/acb_theta`. Three touch code that theta could call into: `967af7a` (faster
  complex polynomial multiplication), `bbaa693` (an `arb_pow` fix) and `d532428` (zeta
  power sums). Whether theta's baseline moved is unmeasured.
- `scripts/build_poly_prepared.py` regenerated a patch whose changed lines are
  identical to `patches/poly-prepared.patch`.
- C3: FLINT `fft_small` tests pass with the candidate; `scripts/validate.py` passes,
  with 338 cases and 4,056 GMP comparisons per library (`results/m54-c3-validation.json`).
- Poly-prepared: `scripts/validate_poly_prepared.py` passes (`results/m54-poly-prepared-checks/`).
- Unchanged-versus-unchanged controls:
  - Integer: aggregate CPU intervals include zero (sqr -0.20% [-0.83, 0.42];
    mul -0.41% [-0.87, 0.06]). One of six per-case intervals excludes zero
    (mul 8192: -0.86% [-1.40, -0.30]), and so does the aggregate *wall* mul interval
    (-0.56% [-1.14, -0.03]).
  - Poly: all six per-case CPU intervals include zero.

## Environment and limits

- Apple M2, 24 GiB, macOS 26, Apple clang 21.0.0, GMP 6.3.0, MPFR 4.2.2, one FLINT
  thread, same build flags as `scripts/bootstrap.sh`.
- **The machine was not idle.** Load averages ran from 9.4 (at the start of the
  integer control) down to about 3-4 (during the poly runs) on 8 cores. ABBA/BAAB
  interleaving and the controls bound the effect, but the integer control is not
  perfectly clean.
- `deps.json` was repinned to `54d1439` **locally only** to satisfy the scripts'
  revision check. It must not be committed as part of this package.
- `build/compare-poly` has no build command in the repository. It was rebuilt as
  `clang <FLAGS> <INCLUDES> bench/compare_poly.c .deps/flint/libflint.dylib <LIBS> -o build/compare-poly`,
  using `FLAGS`, `INCLUDES` and `LIBS` from `scripts/build_experiment.py`. Its hash is in
  each run's `metadata.json`. The original binary's build command is unknown.
- The theta results and the five-patch campaign were not measured.

## Open next questions

- Can poly-prepared be expressed as a change to upstream's own `fft_small` op layer
  (a prepared-operand dot product next to `fft_small_op_addmul`), rather than a
  private kernel? That is the form an upstream reviewer would expect.
- Does the C3 gain hold on other Apple Silicon (`replicate-c3-on-apple-silicon`)?
- Do the theta patches still give their gains on FLINT main?

## Files

| Directory | Contents |
|---|---|
| `results/m54-control-aa/` | Integer unchanged-versus-unchanged control |
| `results/m54-c3-confirm-1/`, `m54-c3-confirm-2/` | C3 confirmations (seeds 55117, 98231) |
| `results/m54-c3-analysis.json` | `analyze_experiments.py` aggregate for the three runs above |
| `results/m54-c3-validation.json` | Exact validation of the C3 candidate |
| `results/m54-poly-aa/` | Poly unchanged-versus-unchanged control (`poly-kernel-control-plan.json`) |
| `results/m54-poly-prepared-confirm/`, `m54-poly-prepared-repeat/` | Poly confirmations (plan seed 503917; 505093) |
| `results/m54-poly-prepared-build/`, `m54-poly-prepared-checks/` | Build manifest, generated assembly, validation |
| `patches/m54-poly-prepared.patch` | Regenerated by the build script; same changes as `poly-prepared.patch` |
| `bench/poly_prepared_trunc.inc`, `patches/m54-poly-trunc.patch` | Truncated kernel and its generated patch |
| `results/m54-poly-trunc-build/`, `m54-poly-trunc-checks/` | Truncated build manifest and validation |
| `results/m54-poly-trunc-confirm/`, `m54-poly-trunc-repeat/` | Truncated confirmations (seeds 503917, 505093) |

## Replay

With `deps.json` locally repinned to `54d1439`:

```sh
make && sh scripts/build_harness.sh
python3 scripts/build_experiment.py NEW-control
python3 scripts/build_experiment.py NEW-c3 --patch patches/c3-register-reconstruction.patch --test
python3 scripts/validate.py --candidate .deps/experiments/NEW-c3/libflint-experiment.dylib --output results/NEW-c3-validation.json
python3 scripts/compare.py --binary build/compare-dual --metric cpu --candidate .deps/experiments/NEW-control/libflint-experiment.dylib --sizes 4096 8192 16384 --operations mul sqr --trials 41 --batch-ms 20 --output results/NEW-control-aa
python3 scripts/compare.py --binary build/compare-dual --metric cpu --candidate .deps/experiments/NEW-c3/libflint-experiment.dylib --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 --trials 41 --batch-ms 20 --seed 55117 --output results/NEW-c3-confirm-1
#   ...and again with --seed 98231 --output results/NEW-c3-confirm-2
python3 scripts/analyze_experiments.py --runs NEW-control-aa NEW-c3-confirm-1 NEW-c3-confirm-2 --output results/NEW-c3-analysis.json
python3 scripts/build_poly_prepared.py NEW-poly-prepared --prepare 1
python3 scripts/validate_poly_prepared.py NEW-poly-prepared
# build/compare-poly: see "Environment and limits"
python3 scripts/compare_poly.py --baseline .deps/flint/libflint.25.0.dylib --candidate .deps/experiments/NEW-control/libflint-experiment.dylib --plan experiments/poly-kernel-control-plan.json --output results/NEW-poly-aa
python3 scripts/compare_poly.py --baseline .deps/flint/libflint.25.0.dylib --candidate .deps/experiments/NEW-poly-prepared/libflint-experiment.dylib --plan experiments/poly-prepared-confirm-plan.json --output results/NEW-poly-prepared-confirm
#   ...and again with --seed 505093 --output results/NEW-poly-prepared-repeat
# Truncated variant:
python3 scripts/build_poly_prepared.py NEW-poly-trunc --prepare 1 --kernel bench/poly_prepared_trunc.inc
python3 scripts/validate_poly_prepared.py NEW-poly-trunc
#   ...then the two compare_poly.py runs above with NEW-poly-trunc as the candidate
```

AI assistance: run and drafted by Claude (Opus 5.5) in a session steered by
@Mister-Meeseeks.
