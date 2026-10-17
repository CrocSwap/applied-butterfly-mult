# E4 application preparation

## Status — 7 October 2026

The evaluator and import path are implemented and checked. **The published
genus-six application has not been benchmarked.** Its actual numerical period
matrix is still missing. This work adds no new performance claim to
[the equal-bank experiment](theta-equal.md).

The user has neither Magma nor exported matrices. Do not acquire a subscription
just to unblock this experiment yet. A one-time export from an existing Magma
installation, or a matrix supplied by the authors, would suffice for a first
test. No author has been contacted. The Magma export script remains unexecuted.

## What the application requires

Elkies and Kieffer's [paper, Section 6](https://arxiv.org/html/2505.22382)
constructs a degree-65 polynomial using a genus-six curve and theta constants.
The numerical stage needs

\[
E_4(\tau)=\sum_{a,b}\theta_{a,b}(0,\tau)^8
\]

at a base period matrix and 65 isogenous neighbours, with determinant factors
and a base-value normalization. Our squared-output interface supplies
\(R=\theta^2\), so this consumer computes \(\sum R^4\).

There are three distinct levels of reproduction:

1. E4 at a numerical capture of the actual base curve's period matrix.
2. The complete collection of normalized E4 values at the isogenous neighbours.
3. Precision lifting, rational recognition and the full inverse-Galois result.

The new harness prepares level 1. It does not generate the neighbours or perform
the remaining stages. The paper reports that its initial 160-decimal-digit
period computation was insufficient for polynomial recognition. Computing E4
at hundreds of bits therefore cannot by itself reproduce that recognition.

### Input search

The downloaded [arXiv source](https://arxiv.org/src/2505.22382) contains the TeX,
bibliography and a small metadata file. Its numerical section prints the curve,
endomorphism matrix, recipes and invariant constraints; it does not print the
numerical entries of the base period matrix.

The linked [comparison repository](https://github.com/j-kieffer/theta-implementations),
at commit `d660fcd965437dba5d287b05389bdcbaeb777097`, contains no committed input
matrix files. That harness measures a single characteristic; it is not the
all-characteristic E4 computation. The author page and public repository list
did not expose the application data in this bounded search. This is not a claim
that no public copy exists anywhere.

Local copies of the paper source and repository metadata are under
`results/theta-e4/sources/`. The public Magma calculator endpoint returned HTTP
401 when fetched; it was not used. The official
[download page](https://magma-maths.org/download/) requires subscription access
and describes the macOS executable running on Apple silicon through Rosetta.
Magma is needed for input generation here; timed FLINT evaluation stays native.

## Added files and contracts

- `scripts/export_theta_e4.m`: the paper's base-curve recipe, followed by an
  explicitly symmetrized, rounded export. Uses 160 decimal working digits and
  rounds to 120 decimal places. **Not tested in Magma.** It omits endomorphism
  recovery, the isogeny orbit and precision lifting.
- `scripts/theta_e4.py`: build, infrastructure checks, tagged-export import,
  numerical qualification, frozen measurement plan, timing and analysis.
- `bench/theta_e4.c`: complete E4 evaluation with a requested relative accuracy.

The text input format is `THETA_E4_V1 g digits`, followed by real/imaginary
integer pairs in upper-triangular row order (`i <= j`). Each integer is scaled
by `10^-digits`. The lower triangle is identical to the upper triangle.
The importer creates rigorous Arb enclosures of these **exact rational
coordinates**. It proves that the imaginary part is positive definite by
Cholesky before evaluation.

Rounding a numerical period matrix does not certify it as an enclosure of the
curve's true period matrix. All output accuracy claims from this harness apply
to the supplied rounded rational matrix. A claim about the curve itself needs
certified period errors and propagation through E4; this remains outstanding.

For each engine, the evaluator starts at the same working precision and doubles
it up to the same cap until the complete invariant reaches the requested
`acb_rel_accuracy_bits`. Nonfinite results or insufficient accuracy at the cap
fail qualification. A zero or very small invariant may require a different
accuracy contract; this harness does not silently switch to absolute error.

Timed work includes output/scratch allocation, all-characteristic squared
theta evaluation, fourth powers, accumulation, failed precision attempts and
cleanup. File loading, matrix import and library loading are outside timing.
Every engine uses the squared-value API. There is no cross-call result cache.

The prepared comparison set is:

- original FLINT versus the latest combined candidate;
- previous combined theta patch versus the equal-bank candidate;
- the same function versus itself;
- previous combined patch versus an unchanged-source rebuild.

Plans freeze input provenance, sources, executable and libraries. Timing uses
31 ABBA/BAAB quartets, a 200 ms warmup and equal repetitions calibrated to 20 ms.
Each row records working precision, attempts and attained accuracy as well as
CPU and wall time. Analysis uses the existing paired moving-block bootstrap.
Timing must run alone, with compilation, validation and analysis in separate
phases. A confirmation run and workload expansion remain necessary before
interpreting a first application's result as a robust improvement.

## Checks performed

Results: `results/theta-e4/smoke-1791431383654006000/summary.json`.

Eight comparisons passed: original and previous combined FLINT each compared
with the newest candidate, on diagonal genus 1/2/6 and coupled genus 2 matrices.
These are **synthetic infrastructure fixtures**. Diagonal fixtures use an
independent elliptic theta implementation and product factorization for the
oracle; the coupled case uses direct theta-series summation.

All requested 256 relative bits and started at 64 working bits. All reached the
target after four attempts, ending at 512 bits; attained relative accuracy was
470–506 bits. All output balls overlap their independently computed reference.
An intentionally insufficient precision cap was correctly rejected. The tagged
integer export round trip passed.

A separate three-quartet same-function check produced 12 valid timed batches
with precision retries and the common accuracy target. It checks the timing
protocol, and supplies no performance estimate for the application.

All 933 collected historical fingerprints from the preceding experiment's
plans and completion record remained unchanged.

## Commands when input becomes available

On an existing licensed Magma installation, from the repository root:

```sh
magma -b scripts/export_theta_e4.m > period-export.log
```

The export emits tagged matrix text on stdout. Preserve the log and record the
Magma version. With a fresh destination for each stage:

```sh
python3 scripts/theta_e4.py capture period-export.log results/theta-e4/base-capture
python3 scripts/theta_e4.py prepare results/theta-e4/base-capture/input.json results/theta-e4/base-run --target 256 --start 512 --cap 4096
python3 scripts/theta_e4.py measure results/theta-e4/base-run
python3 scripts/theta_e4.py analyze results/theta-e4/base-run
```

The numerical qualification invokes independent direct summation and has a
600-second timeout per comparison. On difficult genus-six geometry that oracle
may be too costly. A timeout is an unresolved qualification problem, not a
performance result; do not drop it silently or replace the matrix with an
easier synthetic one.

The next application step is acquiring the base input and qualifying it at a
modest target before attempting the orbit or expensive precision lifting. The
separate non-rigidity-gadget investigation does not depend on obtaining Magma.
