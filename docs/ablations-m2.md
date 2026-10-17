# Reconstruction ablations and a pi workload on M2

This phase follows the [first three experiments](experiments-m2.md). It keeps
the retained C3 patch and pinned FLINT build unchanged, asks which parts of the
patch matter, and tests the full uncached Chudnovsky pi computation used beneath
Arb's constant interface.

## Results

**Fusion and carry specialization both contribute materially to the retained
gain.** In the two ablation sessions, retaining fusion reduces complete
squaring CPU time by 2.10% and 2.00%; retaining the specialized carry update
reduces it by 1.47% and 1.50%. The explicit-conversion contrast is smaller and
closer to the practical sensitivity of the controls.

All entries below are whole-operation CPU-time reductions with 95% bootstrap
intervals, comparing each ablation against the unchanged retained patch:

| Feature retained | Shape | Session 1 | Session 2 |
| --- | --- | ---: | ---: |
| Fusion | Squaring | **2.10% [1.86, 2.36]** | **2.00% [1.74, 2.25]** |
| Fusion | Balanced multiplication | 1.28% [1.08, 1.46] | 1.34% [1.06, 1.67] |
| Fusion | 2:1 multiplication | 1.38% [1.24, 1.53] | 1.32% [1.09, 1.55] |
| Explicit conversion intrinsics | Squaring | 0.75% [0.57, 0.93] | 0.50% [0.34, 0.68] |
| Explicit conversion intrinsics | Balanced multiplication | 0.36% [0.14, 0.56] | 0.47% [0.28, 0.63] |
| Explicit conversion intrinsics | 2:1 multiplication | 0.49% [0.29, 0.67] | 0.49% [0.32, 0.67] |
| Specialized carry update | Squaring | 1.47% [1.32, 1.64] | 1.50% [1.34, 1.66] |
| Specialized carry update | Balanced multiplication | 0.92% [0.75, 1.10] | 0.90% [0.73, 1.08] |
| Specialized carry update | 2:1 multiplication | 0.92% [0.73, 1.08] | 1.12% [0.94, 1.31] |

The point estimates are positive with intervals excluding zero in both sessions
for all nine contrasts. No individual case interval lies wholly below zero
in any ablation run, for either clock. Wall-time results generally agree, but
fusion's squaring aggregate in session 2 is inconclusive: 1.16% [-0.09, 2.08],
versus 2.13% [1.86, 2.43] in session 1. Full wall/CPU summaries and all outer
neighbors are retained in [ablation-analysis.json](../results/ablation-analysis.json)
and each run's `wall-summary.csv` / `cpu-summary.csv`.

### Fresh controls

The original retained patch still beats unmodified FLINT at the three control
sizes: squaring CPU time falls 3.56% [3.29, 3.80] and wall time 3.58%
[3.29, 3.84]. Balanced and 2:1 CPU reductions are 2.32% and 2.68%.

The fresh unchanged-versus-unchanged CPU control is +0.24% [-0.002, +0.48]
for squaring, +0.17% [-0.11, +0.44] for balanced products, and +0.39%
[+0.05, +0.69] for 2:1 products. The latter is a false positive on unchanged
code. Consequently the approximately half-percent conversion contrast should
be treated as tentative attribution at this measurement resolution. The larger,
repeated fusion and carry contrasts provide stronger evidence. We do not
subtract the control estimate from the measured effects.

### Pi: smaller gains, with mixed repeatability

| Precision, bits | CPU reduction, session 1 | CPU reduction, session 2 | Wall reduction, session 1 | Wall reduction, session 2 |
| --- | ---: | ---: | ---: | ---: |
| 262,144 | 0.21% [-0.38, 0.80] | -0.18% [-1.05, 0.57] | 0.14% [-0.49, 0.78] | -0.18% [-1.12, 0.62] |
| 524,288 | 1.10% [0.36, 1.73] | 1.05% [0.51, 1.57] | 1.07% [0.25, 1.74] | 1.11% [0.45, 1.79] |
| 1,048,576 | 0.81% [0.32, 1.28] | 0.39% [-0.58, 1.36] | 0.77% [0.25, 1.24] | -0.03% [-2.00, 1.62] |

Equally weighted across the three predefined precisions, the CPU reductions
are **0.71% [0.36, 1.06]** and **0.42% [-0.06, 0.89]**. Wall reductions are
0.66% [0.28, 1.03] and 0.30% [-0.49, 0.98]. The middle precision is positive
in both runs, but the overall interval in session 2 includes zero. These data
do not establish a repeatable overall pi improvement, or a minimum 1% gain.
Per-case intervals are not simultaneous guarantees across precisions.

The pi A/A aggregate is -0.13% [-0.29, +0.04] CPU and -0.10%
[-0.28, +0.07] wall, with every individual interval including zero. All exact
ball comparisons, MPFR containment checks, and accuracy checks passed in both
sessions and the control. Full results:
[control](../results/pi-control/analysis.json),
[session 1](../results/pi-confirm-1/analysis.json),
[session 2](../results/pi-confirm-2/analysis.json).

## Experiment design

The [plan](../experiments/ablation-plan.json) was recorded before timing.
Each ablation is independently built against the pinned original source:

| Ablation | Restored behavior | Features retained |
| --- | --- | --- |
| [No fusion](../patches/ablation-no-fusion.patch) | Whole-array writeback and reload of normalized components | Explicit SIMD conversion, specialized carry update |
| [Scalar conversion](../patches/ablation-scalar-conversion.patch) | Ordinary C casts from normalized doubles to limbs | Fusion, specialized carry update |
| [General carry](../patches/ablation-general-carry.patch) | Loop over coefficients and general while-based carry drain | Fusion, explicit SIMD conversion |

In every contrast, A is the ablation and B is the retained patch. Positive
runtime reduction measures the feature's benefit in the presence of the other
two features. These are conditional effects; they do not add up to the original
improvement. Loop changes also affect scheduling, spills, code size, and
instruction selection. We have not measured hardware memory traffic directly.

Each of two sessions measures eleven sizes and all three shapes, for 33 cases:
4,095, 4,096, 4,097, 6,144, 8,191, 8,192, 8,193, 12,288, 16,383, 16,384, and
16,385 limbs; balanced multiplication, squaring, and 2:1 multiplication.
The aggregates equally weight the nine sizes in the original 4,096–16,384-limb
interval. Each case uses 21 ABBA/BAAB quartets and a 10 ms batch calibration
target. Both CPU and wall clocks are recorded. The summary uses the original
log-ratio estimator and circular block bootstrap (4,000 draws).

The same compiler flags, single-thread setting, warm buffers, QoS, and isolated
library procedure are used as before. No benchmark runs concurrently with our
compilation or profiling. Background system services were active, so this is
not a measurement on a completely idle machine; A/A controls and CPU time are
especially relevant for effects below one percent.

Generated assembly is retained in [ablation-checks](../results/ablation-checks/).
The ordinary-cast variant still has some compiler-generated SIMD conversions;
the contrast measures explicit conversion intrinsics versus the compiler's
cast lowering. The carry variant removes both constant-index unrolling and
the while-to-if specialization. The [contracts](ablation-contracts.md) describe
the preserved invariants and exact interpretation of each comparison.

## Application workload

At 262,144, 524,288, and 1,048,576 bits, the harness recomputes pi from scratch
using FLINT's Chudnovsky series, reciprocal square root, and final arithmetic.
It explicitly bypasses the pi result cache. Timing includes internal
allocation/free work and output-ball rounding/scaling. It excludes decimal
printing and validation. FFT contexts and allocator state are warm.

Two sessions each use 31 quartets per precision with a 20 ms calibration
target; an unchanged-versus-unchanged control precedes them. Both engines
must return exactly equal Arb balls, containing both MPFR directed-rounding
bounds for pi computed at 128 extra bits, with at least requested precision
minus four bits of relative accuracy. These checks run before and after timing.
This is a complete numerical workload, not a GUI application's startup or
output latency.

A separate counter-instrumented build confirms that the modified branch is
actually reached, with 9, 23, and 57 fused reconstruction calls per computation
at the three precisions (out of 17, 33, and 68 two-prime window calls). It
consumes 35,663, 134,664, and 440,511 coefficients respectively. These are call
counts, not time fractions; the instrumented library was never used for timing.
The [trace](../results/pi-trace/counts.jsonl),
[instrumentation patch](../results/pi-trace/instrumentation.patch), and build
manifest are preserved. A separate sampling attempt produced only two stacks;
it confirms the broader call path but cannot support quantitative attribution.
Its [raw output](../results/pi-profile/sample.txt) is retained as well.

## Correctness and evidence

Each ablation passed 338 whole-operation cases and 4,056 exact GMP comparisons
per library, plus all four relevant FLINT tests. Across the three variants that
is 12,168 exact comparisons for the modified libraries, with matching reference
checks. The original patch also retains its previous correctness evidence.

- Validation: [no fusion](../results/ablation-no-fusion-validation.json),
  [ordinary casts](../results/ablation-scalar-conversion-validation.json),
  [general carry](../results/ablation-general-carry-validation.json).
- Build commands, hashes, test logs, assembly:
  [ablation-checks](../results/ablation-checks/).
- Raw measurements: `results/ablation-{no-fusion,scalar-conversion,general-carry}-{1,2}`.
- Fresh baseline controls: `results/ablation-control` and `results/ablation-retained-check`.
- Application checks and raw batches: `results/pi-control`, `results/pi-confirm-1`,
  and `results/pi-confirm-2`.

Every run directory retains its arguments, environment, binary hashes, and raw
timing rows. No earlier evidence was overwritten. The
[audit](../results/ablation-audit.json) passed for all eleven runs, covering
19,260 timed batches and all expected case combinations.

## Reproduce

On a fresh local build, prepare the baseline and retained patch as described in
the [first report](experiments-m2.md). The following build names must be new:

```sh
make
sh scripts/build_harness.sh
sh scripts/build_pi.sh
python3 scripts/build_experiment.py control
python3 scripts/build_experiment.py c3-register-reconstruction \
  --patch patches/c3-register-reconstruction.patch --test
python3 scripts/make_ablations.py
for name in no-fusion scalar-conversion general-carry; do
  python3 scripts/build_experiment.py "ablation-$name" \
    --patch "patches/ablation-$name.patch" --test
  python3 scripts/validate.py \
    --candidate ".deps/experiments/ablation-$name/libflint-experiment.dylib" \
    --output "results/repro-ablation-$name-validation.json"
done
```

Existing local builds can be reused after their hashes are checked. To repeat
the full timing series into fresh result directories:

```sh
python3 scripts/run_ablations.py --prefix repro-ablation --pi-prefix repro-pi \
  --validation-prefix repro-ablation
python3 scripts/analyze_experiments.py \
  --runs repro-ablation-control repro-ablation-retained-check \
    repro-ablation-no-fusion-1 repro-ablation-no-fusion-2 \
    repro-ablation-scalar-conversion-1 repro-ablation-scalar-conversion-2 \
    repro-ablation-general-carry-1 repro-ablation-general-carry-2 \
  --output results/repro-ablation-analysis.json
```

Each application run writes its own `analysis.json`. The original data's
provenance, quartet structure, full case coverage, and correctness results can
be checked with `python3 scripts/audit_ablations.py`.
On a fresh setup, `python3 scripts/trace_pi.py` reproduces the separate
branch-count experiment; its `c3-pi-trace` build name and output directory must
also be new.

## Next step

**Prepare the fusion/carry change for a portable implementation review, while
keeping the current measured patch as the reference.** Preserve the NEON fast
path, provide a correct fallback for other vector representations, and rerun
the same whole-operation checks before proposing it upstream. The evidence now
supports retaining fusion independently of the explicit conversion intrinsics.

For application performance, repeat the same three pi precisions on an idle
machine with longer batches, and include a second workload dominated by large
products. The immediate uncertainty is whether the sub-percent application
effect repeats under better conditions. Extending the original 3% kernel claim
to complete applications would be premature.
