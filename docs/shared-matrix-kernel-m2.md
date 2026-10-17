# Shared spectral matrix kernel: repeated gains, with a limited useful range

October 7, 2026. Follow-up to the [polynomial workload survey](polynomial-survey-m2.md).

## Result and decision

**A four-column spectral kernel reduces complete FLINT polynomial-matrix
multiplication time on several tested workloads.** The strongest clean full
product result is an 8×8 matrix of length-256 polynomials modulo the FFT prime
`0x3f00000000001`: CPU time reductions of **8.45% and 8.63%** in two confirmation
runs, with wall-time reductions of **8.73% and 7.88%**.

This includes the complete public call: planning, allocations, input transforms,
spectral arithmetic, inverse transforms, and reconstruction. It is not a timing
of the replacement kernel alone. The inputs are synthetic dense polynomial
matrices; no downstream application has been measured.

**Keep the patch experimental.** Some larger 8×8 cases modulo 1000000007 regress,
including a large first-run slowdown retained below. The default baseline is
unchanged. There is no justification for enabling this kernel across all
matrix workloads.

Of the 30 active confirmation cases, 21 had positive CPU confidence intervals
in both runs, and 20 had positive wall-time intervals in both. Three had
negative CPU intervals in both. The remaining cases were inconclusive or did
not repeat. These counts do not replace the individual results or establish a
FLINT-wide average gain.

## Representative complete-operation results

Positive numbers mean less time than baseline. Brackets are marginal 95%
circular block-bootstrap intervals over interleaved quartets.

| Matrix, input length, modulus, operation | CPU reduction: run 1 | CPU reduction: run 2 | Wall reduction: runs 1 / 2 |
| --- | ---: | ---: | ---: |
| 8×8, 256, FFT prime, full | 8.45% [8.02, 8.91] | 8.63% [8.02, 9.07] | 8.73% / 7.88% |
| 8×8, 240, FFT prime, middle | 5.92% [5.04, 6.73] | 7.26% [6.77, 7.68] | 6.06% / 7.24% |
| 8×8, 256, FFT prime, middle | 5.54% [3.22, 7.62] | 7.90% [6.88, 9.01] | 5.28% / 8.03% |
| 8×8, 272, 1000000007, middle | 6.44% [5.44, 7.44] | 7.02% [6.72, 7.37] | 6.37% / 6.99% |
| 4×4, 256, 1000000007, full | 4.85% [4.07, 5.56] | 5.13% [4.89, 5.35] | 4.86% / 5.20% |
| 8×8, 1024, 1000000007, full | −6.45% [−9.22, −4.21] | −0.94% [−1.91, −0.10] | −6.45% / −0.84% |
| 8×8, 1024, 1000000007, middle | −51.40% [−60.79, −43.27] | −6.02% [−6.96, −5.09] | −51.34% / −6.40% |

Middle products return coefficients in `[length/2, 3*length/2)`. “FFT prime”
means 1108307720798209; it does not stand for arbitrary large moduli. Full
matrix multiplication uses automatic FLINT dispatch; middle products call
the explicit `nmod_poly_mat_mulmid_fft_small` API.

The severe first-run middle-product regression is not discarded as an outlier.
Its magnitude did not repeat, but its direction did. The cause of that
variation has not been isolated. Timing confidence intervals within one run
do not account for all variation between runs, allocation states, or system
conditions. The full table below includes every confirmation case.

## What changed

The selected patch is [`poly-shared4-wide.patch`](../patches/poly-shared4-wide.patch).
It changes two pinned FLINT files:

- `gr/nmod_transformed_poly.c`: a private matrix dot-product helper, including
  metadata checks and an ARM64 SIMD kernel;
- `nmod_poly_mat/mulmid_fft_small.c`: groups four output columns per task and
  allocates four accumulators per worker instead of one. Its memory planning
  includes those additional accumulators.

For each FFT prime, the kernel processes **eight frequencies and four output
columns** together. It keeps output sums across the inner matrix dimension
and shares the range reduction of the left input across the four columns.
The original output order, prime selection, transform depth, and CRT machinery
are retained. Existing code still handles incomplete output tiles, zero
operands, and metadata cases declined by the helper. Inner dimensions above
16 use the original dot-product path.

The helper validates all lengths, term bounds, multiplicative depths, and
input domains before writing outputs. Each worker owns its accumulators.
Aliasing and the blocked memory-budget fallback remain under the existing
matrix driver's control.

### Arithmetic and access counts

In the transformed ring, export normalization is deferred. Each original
pointwise product reduces its left input to `[-p,p]` before multiplying by a
right input in `(-4p,4p)`. For fixed row, inner index, and frequency, four
columns need exactly the same left-input reduction.

For a square dimension `d` divisible by four, `q` FFT primes, and `L` spectral
slots, those reductions decrease from `d³ q L` to `d³ q L / 4`: **75% fewer of
this particular reduction**, without removing product mulmods or accumulator
reductions. At d=8, q=2, L=4096, the count is 4,194,304 → 1,048,576.

At source level, four separate length-d dot products require `16d - 4`
double loads/stores per frequency. The grouped computation needs `5d + 4`
before compiler spills: 124 versus 44 at d=8. This is not a DRAM-traffic count
or a predicted percentage time saving.

The selected kernel does spill vector temporaries. Assembly has 18
stack-referencing instructions, including eight callee-save/restore
instructions and ten other stack accesses. The source-level goal of retaining
the entire tile in registers was therefore only partially achieved. A variant
that removed the inner spills by consuming products earlier was slower in the
screen; fewer spills alone did not select the winner.

### Range and correctness argument

Sharing evaluates the same deterministic reduction once instead of four times.
The left operand remains in `[-p,p]`, so the unchanged right operand keeps the
product inside the existing `(-4p²,4p²)` mulmod contract. The first product is
stored without adding a new reduction. Subsequent additions retain the
original accumulator reduction and the original order along the inner matrix
dimension. There is no delayed-reduction assumption in this kernel.

The existing transformed-ring metadata rules still limit coefficient growth
and multiplicative depth. The final inverse and CRT export use the original
saved normalizers. Zero elements are identified before reading their spectral
storage and are handled by the generic operations.

## Candidate screens and attribution

The search was limited to three frequency widths for a fixed four-column tile,
plus one ordering change motivated by observed register spills:

| Candidate | Decision |
| --- | --- |
| 2 frequencies × 4 columns | Initial paired length-1008 case was slower; not promoted. |
| 4 frequencies × 4 columns | Six-case screen regressed in most cases; rejected. |
| 8 frequencies × 4 columns | Best initial screen; selected for full confirmation. |
| 8 frequencies × 4 columns, consume products earlier | Removed inner spills but gave smaller/no gains in the screen; rejected. |

The valid arithmetic control uses the selected tile structure but repeats all
four left-input reductions. Empty **volatile** assembly barriers prevent the
compiler from merging those reductions. Assembly confirms 48 `FRINTN`
instructions in its kernel versus 36 in the shared version. The barriers emit
no instructions themselves, but they can affect register allocation; the
comparison measures the compiled consequences of sharing, not an isolated
per-instruction cost.

An earlier wide control used separate nonvolatile barriers. LLVM merged them,
producing the same reduction count as the shared kernel. It was rejected as an
arithmetic control and was not used in the attribution timings. Its build is
retained so this correction is visible.

The six-case control results were:

| Full product, modulus 1000000007 unless marked | Tiling with repeated reductions vs baseline | Shared vs repeated reductions, same source tile |
| --- | ---: | ---: |
| 8×8, length 240 | +1.83% [1.57, 2.20] | +3.77% [3.20, 4.29] |
| 8×8, length 256 | +1.64% [1.45, 1.81] | +6.16% [5.95, 6.40] |
| 8×8, length 1008 | +0.44% [−0.17, 0.98] | +3.97% [3.36, 4.51] |
| 8×8, length 1024 | −6.58% [−7.61, −5.56] | +3.68% [−0.45, 6.20] |
| 8×8, length 1024, FFT prime | +0.09% [−0.65, 0.75] | +6.17% [5.43, 6.86] |
| 4×4, length 256 | +1.20% [0.99, 1.37] | +4.15% [3.90, 4.42] |

These are CPU time reductions in separate paired runs. They are conditional
effects and cannot be added to reconstruct the confirmation results. Sharing
has a measurable benefit on five of the six control cases; tiling alone has
a smaller benefit on three and regresses at the larger general-modulus case.
The result supports further work on shared reductions without assuming that
this tile shape is generally profitable.

## Validation and measurement boundary

Both the selected kernel and the valid repeated-reduction control passed:

- **1,294,080 exact coefficient and range checks each**, using four FFT primes,
  inner dimensions 1, 2, 4, 8, 16, boundary values, and random signed inputs;
  the oracle uses signed 128-bit integer arithmetic;
- **188 complete-matrix comparisons each** against explicit KS polynomial
  dot products, including rectangular shapes, partial four-column tiles,
  unequal lengths, zero entries, squaring, aliases, output windows beyond the
  product, small storage budgets, and thread counts 1, 2, 4;
- the same 188 comparisons in separately instrumented builds, recording 862
  helper attempts and 828 successes per build, so fallback and active paths
  were both exercised;
- FLINT's `nmod_poly_mat_mul`, `nmod_poly_mat_mulmid_fft_small`, and
  `nmod_poly_mat_sqr` tests.

The first upstream-test invocation used abbreviated names unsupported by that
test executable. It ran no upstream tests. Its failure log is retained under
`results/poly-shared4-wide-checks-initial`; the corrected full-name invocation
passed all three tests.

Performance measurements use the pinned baseline, Apple M2, Apple Clang 21,
the existing optimization flags, and **one FLINT thread**. Two resident dylibs
are called through separately resolved symbols. Each case first passes six
KS-reference comparisons, warms both libraries together, and then runs 31
alternating ABBA/BAAB quartets with equal iteration counts and batches targeting
at least 10 ms. Case order differs between confirmation runs. No compilation,
validation, or profiling was run alongside the timed suite by this task.

All six unchanged-versus-unchanged CPU control intervals included zero.
The inactive scalar case in the second confirmation nevertheless showed a
0.79% CPU / 0.75% wall apparent improvement, although the changed matrix kernel
is not executed there. The 2×2 CPU control intervals included zero in both
runs. Thus small apparent changes should not be assigned wholly to the new
arithmetic, and confidence intervals do not remove code-placement or system
effects. The headline gains are materially larger and repeat in active cases.

The suite is a workload screen followed by confirmation, not a representative
distribution of all FLINT usage. Intervals are not adjusted for multiple case
comparisons. Warm-call behavior does not establish cold-start behavior or
multi-thread performance. These gains have not been stacked with the earlier
integer reconstruction patch.

## Relationship to the theoretical work

The implemented transfer is **shared computation across compatible outputs**:
identify identical intermediate nodes in a finite computation graph and
evaluate them once. Here the shared nodes are input range reductions in a
matrix product over transformed polynomials. The sister project's paired
network shares weighted sums under different operator and frame constraints.
Its particular pair-exclusion circuit, rank savings, and asymptotic exponent
are not used by this patch.

The existing FFT spectral order already aligns all operands. Grouping matrix
outputs exploits that compatibility, but does not introduce a new butterfly
network or a matched forward/inverse frame. The measured gain is a practical
application of the shared-computation principle, with a narrower theory claim
than a direct implementation of the finite network.

## Next step

The most useful follow-up is to normalize each reusable left input once while
preserving FLINT's contiguous pointwise loops. This would test whether the
sharing benefit can survive without the extra accumulators, inner spills,
and performance sensitivity of this tile. Any normalization pass must be
charged to the complete operation.

For a closer retained-network application, a subsequent joint layout must
identify real movements it removes across the FFT/pointwise/inverse boundary
and provide the corresponding operator identity. The current result is a
measured comparison point for that research; merely renaming this loop tiling
as a new finite network would overstate the connection.

## Reproduction and evidence

```sh
python3 scripts/build_poly_kernel_wide.py poly-shared4-wide --share 1 --lanes 8
python3 scripts/build_poly_kernel_control.py poly-tile4-wide-control --share 0 --lanes 8
python3 scripts/validate_poly_kernel.py poly-shared4-wide
python3 scripts/validate_poly_kernel.py poly-tile4-wide-control
```

The comparison harness's exact compile command and hashes are recorded in
[`poly-kernel-harness-build.json`](../results/poly-kernel-harness-build.json).
Then run:

```sh
python3 scripts/compare_poly.py --candidate .deps/experiments/poly-shared4-wide/libflint-experiment.dylib --plan experiments/poly-kernel-confirm-plan.json --output results/poly-kernel-confirm
python3 scripts/compare_poly.py --candidate .deps/experiments/poly-shared4-wide/libflint-experiment.dylib --plan experiments/poly-kernel-confirm-plan.json --seed 493191 --output results/poly-kernel-repeat
```

All build and measurement destinations must be new. Control and ablation
commands, source hashes, full raw batches, and numerical summaries are in:

- [`poly-kernel-aa`](../results/poly-kernel-aa)
- [`poly-kernel-confirm`](../results/poly-kernel-confirm)
- [`poly-kernel-repeat`](../results/poly-kernel-repeat)
- [`poly-kernel-tile-ablation`](../results/poly-kernel-tile-ablation)
- [`poly-kernel-sharing-ablation`](../results/poly-kernel-sharing-ablation)
- [`poly-shared4-wide-checks`](../results/poly-shared4-wide-checks)
- [`poly-tile4-wide-control-checks`](../results/poly-tile4-wide-control-checks)

[`audit_poly_kernel.py`](../scripts/audit_poly_kernel.py) checks build hashes,
patch applicability, numerical results, dispatch counts, quartet structure,
and preservation of the prior survey and delayed-reduction artifacts. Its
complete output is [`poly-kernel-audit.json`](../results/poly-kernel-audit.json).

## All confirmation cases

The following table reports CPU time reductions and 95% intervals for every
case. `p` is the FFT prime, `g` is 1000000007. Negative reductions are slowdowns.
All wall-time intervals are retained in the linked summaries and audit.

| Matrix | Length | Modulus | Window | Run 1 CPU reduction | Run 2 CPU reduction |
| --- | ---: | --- | --- | ---: | ---: |
| 1×1 | 1024 | g | full | +0.31% [-0.28, +0.81] | +0.79% [+0.66, +0.92] |
| 2×2 | 1024 | g | full | +0.17% [-0.13, +0.52] | +0.35% [-0.03, +0.90] |
| 4×4 | 240 | g | full | +3.28% [+2.15, +4.21] | +3.41% [+2.58, +4.26] |
| 4×4 | 240 | g | mid | +2.06% [+0.48, +3.40] | +4.38% [+4.08, +4.71] |
| 4×4 | 256 | g | full | +4.85% [+4.07, +5.56] | +5.13% [+4.89, +5.35] |
| 4×4 | 256 | g | mid | +0.74% [-1.55, +3.03] | +6.25% [+5.96, +6.57] |
| 4×4 | 272 | g | full | +2.29% [+0.15, +4.16] | +4.16% [+3.97, +4.35] |
| 4×4 | 272 | g | mid | +3.33% [+2.38, +4.20] | +5.00% [+4.70, +5.38] |
| 4×4 | 1008 | g | full | +2.17% [+1.59, +2.71] | +2.16% [+1.81, +2.46] |
| 4×4 | 1008 | g | mid | +0.91% [-0.26, +1.91] | +2.94% [+2.73, +3.14] |
| 4×4 | 1024 | g | full | +3.72% [+3.19, +4.18] | +3.67% [+2.96, +4.23] |
| 4×4 | 1024 | g | mid | +2.62% [+1.38, +3.66] | +3.48% [+2.10, +4.60] |
| 4×4 | 1040 | g | full | +2.55% [+0.92, +3.75] | +3.67% [+3.30, +4.01] |
| 4×4 | 1040 | g | mid | +3.15% [+2.40, +3.84] | +3.85% [+3.45, +4.21] |
| 8×8 | 240 | g | full | -1.32% [-4.21, +1.17] | +5.60% [+4.72, +6.17] |
| 8×8 | 240 | g | mid | +5.57% [+4.54, +6.45] | +4.45% [+3.25, +5.34] |
| 8×8 | 240 | p | full | +4.87% [+3.74, +5.93] | +6.72% [+6.40, +6.98] |
| 8×8 | 240 | p | mid | +5.92% [+5.04, +6.73] | +7.26% [+6.77, +7.68] |
| 8×8 | 256 | g | full | -5.45% [-14.87, +1.46] | +6.05% [+4.69, +6.95] |
| 8×8 | 256 | g | mid | +4.62% [+2.36, +6.76] | +8.49% [+8.15, +8.78] |
| 8×8 | 256 | p | full | +8.45% [+8.02, +8.91] | +8.63% [+8.02, +9.07] |
| 8×8 | 256 | p | mid | +5.54% [+3.22, +7.62] | +7.90% [+6.88, +9.01] |
| 8×8 | 272 | g | full | +4.37% [+2.17, +6.16] | +5.25% [+4.55, +6.10] |
| 8×8 | 272 | g | mid | +6.44% [+5.44, +7.44] | +7.02% [+6.72, +7.37] |
| 8×8 | 1008 | g | full | +3.05% [+1.99, +4.08] | +4.35% [+3.78, +4.91] |
| 8×8 | 1008 | g | mid | +2.67% [+0.91, +4.24] | +4.90% [+4.59, +5.23] |
| 8×8 | 1024 | g | full | -6.45% [-9.22, -4.21] | -0.94% [-1.91, -0.10] |
| 8×8 | 1024 | g | mid | -51.40% [-60.79, -43.27] | -6.02% [-6.96, -5.09] |
| 8×8 | 1024 | p | full | -10.06% [-23.48, +1.42] | +7.45% [+6.75, +8.00] |
| 8×8 | 1024 | p | mid | +6.48% [+5.36, +7.36] | +8.07% [+7.76, +8.37] |
| 8×8 | 1040 | g | full | -5.87% [-9.36, -3.25] | -0.37% [-1.54, +0.82] |
| 8×8 | 1040 | g | mid | -7.04% [-9.93, -4.60] | -1.54% [-2.70, -0.47] |
