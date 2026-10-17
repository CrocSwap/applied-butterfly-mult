# New weighted phase frames: application screen and a theta-function byproduct

October 7, 2026. Sister project commit
`1c09a5887e3f900798eef904371441ab18c057de`, conditional witness `2^-31`.

**Two separate outcomes:**

1. No real operation identified in this bounded screen obtains an established
   benefit from the new weighted phase-frame construction itself.
2. The investigation found a conventional optimization of FLINT's
   `acb_theta_agm_mul(..., all=1, ...)` primitive. Its experimental implementation
   reduced complete-call CPU time by **49.31–63.59%** on all 20 tested cases,
   with positive CPU and wall intervals in both input-seed passes. An isolated
   FLINT patch passes the relevant integration tests.

The second result is a practical byproduct of theory-directed investigation.
It does not meet the stronger specific-construction attribution objective.

## What was screened

The new sister construction supplies signed weighted sum circuits, compatible
binary phase frames in both directions, restoration of arbitrary scratch, and
complete first/third auxiliary-bank sharing. We read the construction and
actual implementation, imported its frame and scalar constructors, and ran its
eight complex-compression tests and five compact-control tests. All passed.
These checks are not an independent verification of the multiplication theorem.

### FLINT theta arithmetic: an actual phase/transform call site

The pinned `acb_theta/agm_mul.c` repeatedly changes input signs and applies
Walsh–Hadamard transforms. The `all=1` branch is called by
`acb_theta_jet_notransform` for squared theta values and by `ql_exact` through
`agm_mul_tight`. It is therefore a real library primitive with actual callers.
FLINT's [theta documentation](https://flintlib.org/doc/acb_theta.html) describes
the all-characteristic convolution interface and its Hadamard implementation.
The experiment follows the pinned source's exact sign convention and storage
order, as specified below.

This matches part of the motivation: shared inputs, sign phases, and repeated
transforms. But the relevant identity is already the elementary
`H D_a = X_a H`, where `D_a` multiplies by `(-1)^(a dot b)` and `X_a` shifts an
index by XOR with `a`. In the sister notation `C_a^2 = X_a`.
No weighted rectangle, internal-weight recursion, nontrivial residual frame,
or scratch-restoration schedule is required for this reuse.

We checked 299,592 modulation-matrix entries and 69,905 bilinear-tensor entries
over the field modulo 257, including every pair of basis inputs through genus
four. These establish the precise ordinary controls before timing.

The neighboring `acb_theta_char_shuffle` already applies a direct characteristic
permutation and per-entry root multiplication. We did not identify a repeated
shared-sum phase network there. The prior `fft_small` rejection remains scoped
to that earlier experiment; the new weighted construction is not excluded in
all possible factorizations.

### Scalar export of the new weighted construction

For triple-indexed inputs the combined side map has a simpler ordinary formula:

```
side[T] = x[T] + (total - sum(incident[i] for i in T))/2
total = sum(x[S] for all triples S)
incident[i] = sum(x[S] for triples S containing i)
```

Its coefficient on source `S` is `1[T=S] + (1-|S intersect T|)/2`, exactly
`+1/2` for disjoint triples, `-1/2` for intersection-two triples, and zero
otherwise. We checked 17,536 coefficients against the actual compiled side
circuits at h=8 and h=10.

This simplification need not satisfy the theoretical phase-frame constraints;
those constraints are where the new construction earns its value. It means
that simply exporting the scalar sums would again overlook a strong ordinary
control. We found no application contract in this pass that requires the
particular stronger frame conditions.

The complete current construction also remains enormous. Its count formulas
first have positive deficit at even h=22, with arity m=10648; the certified
h=26 construction uses m=17576. That observation concerns the complete
construction, not the possible reuse of a small local component.

### Quantum simulation and compact movement

The translation-phase kernel has a genuine nearby API: up to a global phase,
`C_v` is a quarter-turn about an X Pauli string. QuEST already directly applies
such rotations, without cloning a state and separately combining its pieces.
Its [Pauli-gadget documentation](https://quest-kit.github.io/QuEST/group__op__pauligadget.html)
states both the rotation formula and the fused operation. This primitive match
does not identify a workload using the new mixed-bank weighted-frame compiler.
We did not build or benchmark QuEST.

Existing [quadratic-form stabilizer simulation](https://quantum-journal.org/papers/q-2022-09-15-803/)
also supplies a stronger comparison than naive repeated dense transformations.
We found no qualifying new application there in this bounded review; this is
not an exhaustive quantum-simulation search or an optimality claim.

Compact controls remove an actual tape-model obstacle, but the practical
implementation cost is still unestablished. The supplied early-source schedule
uses four swaps and four rotations; the late-source schedule uses twelve swaps
and ten rotations, plus exceptional repair. Moving fewer address-control bits
does not by itself reduce full-record RAM traffic. No concrete RAM advantage
over direct permutation was established, so we did not invent a favorable
movement workload or benchmark only the address calculation.

## The conventional theta optimization

Let `n=2^g`. The pinned source computes, for every characteristic `a`,

```
H((H x) * (H D_a y)) / n
```

and stores coefficient `k` at `res[k*n+a]`. The signs apply to the **second**
input in the source. Thus the exact output is

```
res[k*n+a] = sum_b (-1)^popcount(a & b) * x[b XOR k] * y[b].
```

We compared three implementations:

| Implementation | Length-n Hadamard calls in all=1 | Scalar complex products |
|---|---:|---:|
| Pinned original | 3n | n² |
| Shared input transforms | n+2; n+1 for equal input pointers | n² |
| Product-first transform | n | n² |

The original copies/modulates the second input into a distinct temporary, so
the single-convolution helper's equal-pointer shortcut is not active here.
The product-first variant forms `x[b XOR k] * y[b]` and transforms this vector
once for each `k`. It eliminates the input transforms and inverse scaling.

All implementations retain the original recursive Hadamard helper. This also
reduces allocations made by those eliminated helper calls. The benchmark
includes every per-call allocation, transform, multiplication and output write;
it does not precompute the candidate's spectra outside the timed call.
The `all=0` path retains the original algorithm.

## Timing evidence

Apple M2, pinned FLINT `657a2839cf0125164859ff102b1f124abcb87ce0`, Apple Clang
with the existing `-O3 -mcpu=apple-m2` flags, one thread. The grid comprises
genera 1–5, precisions 128/512 bits, and equal/distinct input pointers:
20 cases, each tested with two deterministic input seeds. Inputs are synthetic
complex balls with full-precision dyadic midpoints and small nonzero radii.

Representative CPU-time reductions against the pinned library:

| Genus | Precision | Inputs | Pass 1, 95% interval | Pass 2, 95% interval |
|---|---:|---|---:|---:|
| 1 | 128 | Distinct | 53.40% [52.71, 54.00] | 49.85% [49.20, 50.52] |
| 2 | 128 | Distinct | 55.88% [55.61, 56.09] | 56.39% [56.01, 56.80] |
| 3 | 512 | Distinct | 58.74% [57.82, 59.51] | 60.47% [59.76, 61.18] |
| 5 | 512 | Equal | 63.59% [63.36, 63.82] | 63.54% [63.11, 63.97] |

All 40 direct-versus-original case-runs had positive CPU and wall intervals.
The shared-input control itself reduced CPU time by 24.35–61.27%, again with
positive CPU and wall intervals in all 40 case-runs. Product-first was faster
in all point estimates versus sharing; 35/40 had positive intervals in both
clocks. The five inconclusive comparisons are retained.

The recorded plan uses 21 alternating ABBA/BAAB quartets per comparison,
equal iteration counts, a 5 ms calibration target for the slower member,
20 ms joint warmup, shuffled comparisons, and both CPU/wall clocks. Compilation,
validation and the application screen finished before timing. There are
126 comparisons and 10,584 timed batches.

Six controls cover identical function pointers, an unchanged-source copy,
and inactive `all=0` calls. Every CPU and wall interval includes zero.
Some wall intervals are wide, and absolute call times vary substantially with
system conditions. The intervals are marginal, within-run estimates; they are
not guarantees for arbitrary data, machines or downstream applications.

**The timed candidate is the standalone implementation of the complete
primitive.** The subsequently rebuilt FLINT dylib uses its exact extracted
loop body and is correctness-tested, but was not separately timed. There is
no claimed 49–64% gain in complete theta-function evaluation, integer
multiplication, or FLINT generally.

## Correctness, accuracy and integration

For genera 0–5 and 64/128/512-bit precision, the checker tests distinct/equal
inputs, both values of `all`, exact dense dyadics, nonzero-radius balls, sparse
inputs and alternating signs. It checks 288 fixtures across four methods:
137,088 coefficient comparisons, including 102,816 containment checks against
exact high-precision results. An independent direct summation is the oracle.
The same checks pass with the rebuilt candidate library.

No arithmetic precision is lowered. The candidate's sum of component radii
was smaller in all 40 timed input pairs (ratios 0.125–0.922). Four individual
outputs had wider radii, so there is no claim of universally tighter bounds.
Both implementations remain rigorous ball computations. The upstream tests
for `agm_mul`, `agm_mul_tight`, `jet_notransform`, `ql_exact`, and `jet` pass
against the isolated candidate library, including comparisons with theta sums.

Equal input pointers are supported and tested. Output/input aliasing for
`all=1` is not promised by this experiment. The initial preparation failed
to compile because the harness used a nonexistent complex-ball error helper;
that attempt is preserved in `theta-initial-compile`. It produced no timings.

The original FLINT checkout/library and historical evidence are unchanged.
The patch is experimental and has not been submitted or installed as default.

## Attribution and decision

The causal research trail is concrete: investigating the new theory's phase
machinery led us beyond `fft_small` to theta arithmetic and exposed redundant
transforms. The optimization uses ordinary Walsh identities, and its simpler
control works without any new weighted phase-frame feature. We therefore
cannot claim the specific construction was necessary for the speedup.

Retain the practical theta patch. The direct-construction application objective
remains open; reopening that part needs a real operation whose frame constraints
make the new construction useful beyond these conventional controls.

## Artifacts and reproduction

- [Application checker](../scripts/check_weighted_phase_application.py) and
  [matching results, source snapshots and sister test logs](../results/weighted-phase-application/matching.json).
- [Candidate implementations](../bench/theta_phase_candidates.c),
  [validation/timing harness](../bench/theta_phase_screen.c), and
  [runner](../scripts/screen_theta_phase.py).
- [Recorded plan](../results/weighted-phase-application/theta/plan.json),
  [validation](../results/weighted-phase-application/theta/validation.json),
  [complete timing and accuracy results](../results/weighted-phase-application/theta/summary.json).
- [Isolated patch](../patches/theta-direct-walsh.patch),
  [builder](../scripts/build_theta_phase.py), and
  [integration record](../results/weighted-phase-application/integration/build.json).
- [Audit script](../scripts/audit_theta_phase.py) and
  [audit result](../results/weighted-phase-application/audit.json).

To reproduce the timing screen on the configured machine, choose a fresh directory and run from the
repository root:

```sh
python3 scripts/screen_theta_phase.py --stage prepare --output /tmp/theta-phase-screen
python3 scripts/screen_theta_phase.py --stage measure --output /tmp/theta-phase-screen
```

The application checker, integration builder and final audit use their fixed
artifact locations and refuse to overwrite completed evidence.
