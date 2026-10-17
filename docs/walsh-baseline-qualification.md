# Arb non-rigidity kernels: qualification against stronger ordinary baselines

## Decision

**Retain H4 as a promising kernel result, most clearly at 64 points and moderate
precision.** It survives a stronger conventional comparison, including ordinary
transforms which eliminate the initial full-array copy. In the four 64-point
fixtures at 512 and 4,096 requested bits, CPU reductions are **7.66–12.08%**, with
positive marginal CPU and wall-time confidence intervals in every case.

The complete sweep is **not a clean broad qualification**. Eight-point transforms
at 512 bits lose; H8 has substantially weaker evidence; many wall intervals are
wide; two same-function controls show spurious CPU differences around 1.4–1.5%.
Do not promote the aggregate CPU medians to a blanket speedup or install a default
dispatch from this run. No additional timing was used to seek cleaner controls.

These are synthetic real-ball transform kernels on the existing ARM host. They
add no complete theta/application speedup and no cross-hardware evidence. The
earlier negative full-call result in [theta workspace integration](theta-workspace.md)
is unaffected.

## The baseline gap addressed

The frozen benchmark's iterative and recursive ordinary butterflies first copy
the inputs to output storage. Input preservation does not require those copies:
the first sums and differences can be computed directly from input into output.

Four conventional implementations were added:

- Direct-output iterative butterflies.
- Direct-output recursive butterflies.
- Recursive radix-4 stage fusion with direct-output base cases.
- Recursive radix-8 stage fusion with direct-output base cases.

All still perform `N log2(N)` additions/subtractions, preserve their inputs, and
return natural-order, unnormalized outputs. All use one reusable scratch ball.
For N>1 they avoid the initial N ball copies; for N=1 copying is necessary.
No approximation, precision reduction or non-rigidity identity is involved.
The fused schedules unroll ordinary butterfly stages rather than introduce a
different arithmetic circuit.

The original H4/H8 header and numerical harness are preserved. A derived harness
adds the four methods and qualification checks. Frozen H4/H8 implementations
still include their original copying, leaf scaling and scratch requirements;
no candidate tuning was performed after seeing the new comparisons.

The ordinary pool contains six methods, including both old baselines. Screening
selected a new method in 15/18 cells: direct iterative four times, direct
recursive three, radix-4 four and radix-8 four. Old recursive won the other three.
Those choices were frozen before confirmation.

## Numerical checks and timing contract

ASan/UBSan validation passed **434 comparisons and 434,952 output-enclosure
checks**. Every output encloses the exact Walsh image of the entire independent
input box, using the inherited integer/dyadic oracle. For lengths at most 128,
the oracle also checks direct signed character sums.

The ordinary additions also produced **bitwise-identical balls** to the old
iterative method on every validation fixture. Input preservation was explicitly
checked outside timing. Sizes 1–1,024 at 128 bits include dense signed inputs,
near-one cancellation, exact constants and a single impulse; all measured cells
were separately validated. The harness and kernels are instrumented, while the
linked FLINT library is not rebuilt with sanitizers.

Measured cells:

- 8, 64, 512 and 4,096 points; 512 and 4,096 requested bits; two original fixtures
  per size/precision: 16 moderate-precision cells.
- 64 and 4,096 points at 32,768 bits, dense fixture only: two high-precision checks.

The numerical contract is inherited unchanged: each output's
`arb_rel_one_accuracy_bits` must reach the target. Start at target+log2(N)+8
working bits and retry in steps of 16 up to 256 extra bits. The timed operation
includes copying/scaling, arithmetic, the accuracy scan and any retries. It
excludes reusable output/scratch initialization. There were **zero retries in
all timed batches**. Relative-to-one accuracy is an absolute-error condition
near zero; this does not assert tight relative accuracy for cancelled outputs.

Screening comprises 134 comparisons with 11 alternating ABBA/BAAB quartets each.
For each cell the fastest ordinary method is selected by its screening CPU
point estimate relative to the old iterative method. Confirmation carries **all
36 H4/H8 comparisons plus all eight controls**, with 31 quartets each and an
independently shuffled order. No favorable candidate subset was selected.
Total: **11,352 timed batches**.

Both phases use 200 ms joint warmup and equal repetitions calibrated to at least
20 ms for the slower variant. CPU uses thread CPU time; wall uses monotonic time.
The existing 4,000-draw circular moving-block bootstrap supplies marginal 95%
intervals. They are not simultaneous bounds over the sweep. Build, validation,
measurement and analysis were separate phases.

The environment remains macOS 26.6.2/arm64, with the pinned native FLINT library
and `clang -O3 -mcpu=apple-m2` flags. Prior workspace records identify the host
as Apple M2; the current sandbox denied a fresh CPU-brand query. That failure,
the accessible platform/compiler information and exact build commands are saved.

## Confirmation results

Positive numbers denote less CPU time versus the selected ordinary baseline.
Ranges span the two fixtures, not a confidence interval. Both-positive counts
require the individual CPU **and** wall intervals to be above zero.

| Points | Requested bits | H4 CPU reduction | H4 both-positive | H8 CPU reduction | H8 both-positive |
|---:|---:|---:|---:|---:|---:|
| 8 | 512 | −9.64 to −4.27% | 0/2 | −6.97 to −3.37% | 0/2 |
| 64 | 512 | +7.66 to +7.80% | 2/2 | +5.52 to +6.88% | 0/2 |
| 512 | 512 | +5.87 to +6.39% | 0/2 | +2.03 to +6.14% | 0/2 |
| 4,096 | 512 | +5.51 to +9.00% | 1/2 | +1.61 to +2.11% | 0/2 |
| 8 | 4,096 | +2.58 to +2.94% | 0/2 | −3.57 to +1.59% | 0/2 |
| 64 | 4,096 | +7.80 to +12.08% | 2/2 | +4.83 to +6.38% | 0/2 |
| 512 | 4,096 | +9.38 to +9.40% | 1/2 | +6.44 to +6.68% | 0/2 |
| 4,096 | 4,096 | +9.07 to +10.78% | 1/2 | +4.66 to +6.74% | 1/2 |

Moderate-precision CPU medians are 6.13%/9.22% for H4 at 512/4,096 bits, and
2.07%/5.61% for H8. H4 has positive CPU intervals in 14/16 cells and both metrics
positive in 7/16; H8 has 11/16 and 1/16 respectively. The table and controls are
more informative than these medians alone.

The strongest compact subgroup, 64-point H4, has these individual intervals:

| Bits | Fixture | Ordinary baseline | CPU reduction [95% CI] | Wall reduction 95% CI |
|---:|---:|---|---:|---:|
| 512 | 0 | Direct radix-8 | +7.66% [6.23, 8.95] | [5.17, 21.14] |
| 512 | 1 | Direct radix-8 | +7.80% [5.44, 10.02] | [0.74, 20.17] |
| 4,096 | 0 | Direct recursive | +12.08% [10.96, 13.29] | [5.69, 18.87] |
| 4,096 | 1 | Direct radix-4 | +7.80% [6.86, 8.77] | [6.77, 9.54] |

At 32,768 bits, H8 loses 10.62% and 11.57% CPU at 64 and 4,096 points. H4's CPU
estimates are +6.71% and −1.59%; both wall intervals cross zero. The positive
64-point CPU estimate differs from the earlier uniformly negative high-precision
H4 sweep. This run does not reproduce that uniform sign, but also establishes
no high-precision win under the both-metrics gate. No cause for the cross-run
difference was isolated, and there was no follow-up timing to resolve it.

## Controls and practical limits

Six of eight confirmation controls include zero in both metrics. Two have
spurious positive CPU intervals:

- 64-point direct iterative at 4,096 bits: +1.37%, CI [0.25, 2.26].
- 4,096-point direct radix-4 at 4,096 bits: +1.47%, CI [0.003, 3.21].

Their wall intervals include zero, as do all eight controls' wall intervals.
Some wall intervals are very wide. This limits small-effect interpretation and
prevents calling the complete run a uniformly clean confirmation. The larger H4
CPU signals and seven positive-both cells are retained with these qualifications;
they are not corrected by subtracting a control estimate or reported as a
production acceptance decision.

No theorem predicts the measured percentages. H4 saves expensive additions while
paying for cheap powers-of-two scaling and extra live balls; its enclosure radii
can be wider than ordinary butterflies. Those earlier numerical limitations
remain, even though every measured case met the common accuracy target.

Attribution stays precise: H4/H8 directly implement the older Alman–Rao
non-rigidity constructions described in [the original kernel report](walsh-nonrigidity.md).
The current integer-multiplication investigation supplied the discovery route.
This is not a distinctive new OpenAI/sister-project construction or an additional
complete FLINT theta-call improvement. The ordinary direct-output optimization
is conventional and is now included in the comparison pool.

## Artifacts and next qualification

- `bench/walsh_baseline_qualification.h`: four conventional comparators.
- `scripts/walsh_baseline_qualification.py`: isolated build, qualification, frozen
  screen/confirmation plans and analysis.
- `scripts/audit_walsh_baseline_qualification.py`: independent raw-point, selection,
  numerical-coverage and timing-order audit.
- `results/walsh-baseline-qualification/`: derived harness, binaries, build logs,
  validation, raw timings, by-size results, controls, environment and audit.

Audit: PASS. All 1,764 inherited fingerprints were preserved. No prior source,
measurement, report or default FLINT library was changed. Stages are `prepare`,
`measure`, `analyze`, `confirm`, then `measure --confirmation` and
`analyze --confirmation`. Existing plans and raw outputs reject overwrite.

The next meaningful qualification would be an independent environment using this
stronger ordinary pool, or a real expensive-arithmetic caller with a substantial
transform fraction. Another broad theta sweep is not justified by these kernel
measurements. Preserve the raw results and the noisy controls as part of the
evidence rather than repeating this host until favorable intervals appear.
