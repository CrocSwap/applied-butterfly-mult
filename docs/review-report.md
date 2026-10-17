# Five FLINT performance changes for maintainer review

October 13, 2026. Based on FLINT commit
`26b9bc9df973206db15616d0849a4c8be9d22059`.

Five independent source changes are retained, with focused tests in each patch.
They apply individually or as the numbered series. The delivered series is
checked byte-for-byte against the combined source tree used for testing and
measurement. No upstream submission has been made.

## Results and scope

Positive percentages below mean **less time for a complete public operation**.
Measurements use one FLINT thread on Apple M2 with Apple clang 21 and
`-O3 -g -mcpu=apple-m2 -fno-omit-frame-pointer`. These are workload-specific
results, not an overall FLINT speedup or a claim about other architectures.

| Patch | Change | Evidence of benefit |
| --- | --- | --- |
| 0001 | Stop matrix squaring after interpolation | 39.70–64.71% CPU reduction across two confirmations; also fixes aliased squaring returning A⁴ |
| 0002 | Batch modular interpolation-weight inversions | 10.01–36.99% across two confirmations |
| 0003 | Use dot products for rectangular derivative evaluation | Fresh-process audits: 8.48–8.84% for Arb and 17.04–17.34% for ACB at length 64, precision 1024; broader resident-library sweep 2.08–23.22% |
| 0004 | Combine interpolation-tree scalar leaves directly | Fresh-process audits: 3.16–3.85% on representative small cases; broader length-16–33 sweep 1.15–4.49% |
| 0005 | Share the exponential's partial inverse with sinh/cosh | 10.75–19.59% on dense series in two confirmations; a narrow sparse case saves about 46% for Arb and 69% for ACB |

The combined series retains positive active-case intervals. Adding patch 0004
on top of the other four saves another 2.34–6.25% on the tested length-16–33
interpolation calls. This is an incremental benefit, not a second count of the
batch-inversion improvement. No sampled numerical confirmation or process-audit
case has lower minimum output accuracy than its comparator.

## Individual changes

**0001: `nmod_poly_mat_sqr`.** The interpolation branch currently falls through
to a second squaring algorithm. Making the following `if` an `else if` removes
that repeated computation. If the output aliases the input, the second square
uses the already squared input and produces A⁴. The added regression fails
against the baseline and passes with the patch. The affected dispatch requires
dimension greater than `80 + n_sqrt(Alen)`, a prime modulus with more than
`FLINT_BITS / 4` bits, and enough interpolation points. Measured dimensions are
82–112, polynomial lengths 1–16, modulus 1000003, with inactive neighbors.

**0002: modular interpolation weights.** Keep the existing product-tree,
derivative and multipoint-evaluation structure, then call FLINT's existing
`_nmod_vec_invert` once for the vector. Its prefix/suffix products replace one
inverse per point with one inverse total. Its output must not alias its input;
the patch reuses the derivative workspace for that output. The original
requirement that point differences be units is preserved. This trades extra
linear temporary storage for fewer inversions. Public-call timings cover
16–512 points and neighboring odd lengths, using a 30-bit and a full-word prime.
Tests also cover shuffled affine points, a composite modulus, and lengths 0/1.

**0003: Arb/ACB value and derivative evaluation.** The value already uses dot
products. Scale one block of derivative coefficients exactly, then evaluate
that block with a dot product instead of individually rounded add-multiplies.
Scratch storage is O(sqrt(length)); it is included in public-call timings.
Automatic dispatch requires precision at least 1024, sufficient length, and
coefficient bit size at most half the working precision. The broader sweep uses
128-bit dyadic coefficients, lengths 31–256, and precisions 1024/4096; 512-bit
inactive controls are retained. Exact-dyadic Horner references and both
point/output aliases are tested. See the timing caveat below before interpreting
the smallest per-size gains.

**0004: generic interpolation leaves.** A pair of scalar leaves multiplied by
monic linear factors needs two scalar products and two additions. Avoid the
generic polynomial multiplications and multiplications by one at this level.
Preserve the original multiplication operand order and leave upper tree levels
unchanged. Exact rational recovery covers odd and even lengths; modular,
Arb/ACB and existing generic-ring tests also pass. Complete-call gains are most
useful near the automatic fast-interpolation threshold, at 16–33 points.
Larger cases show smaller or occasionally inconclusive gains.

**0005: Arb/ACB sinh/cosh series.** Newton exponentiation already constructs
exp(-h) to about half the requested length. Its existing internal Newton routine
supports extending that inverse; expose a private paired helper and reuse this
work instead of restarting inversion. Reuse the caller's existing third buffer
for the disjoint zero-constant input. Original basecase dispatch is retained.
For `h = b*x^(n-1)`, use `exp(±h) = 1 ± h mod x^n` directly, avoiding a sparse
regression seen in the first version. Tests force Newton steps at small boundary
lengths and use exact rational series, nonzero constants, ball inputs and aliases.
Timings cover lengths 301–1024, precisions 128–4096, full/shortened inputs,
nonzero constants, cutoff neighbors and sparse/basecase controls.

## Timing method and caveat

The main confirmations use two resident libraries, equal iteration counts,
200 ms warmup, alternating ABBA/BAAB quartets, and at least 20 ms CPU time per
batch. Each case has 31 quartets. CPU and wall clocks are reported separately.
The estimate is derived from the mean log ratio of paired batch times; 95%
intervals use 4000 circular moving-block bootstrap draws. Inputs and case order
change between the two confirmation runs. Timings run without concurrent
campaign computation. Source, library, executable and plan hashes are preserved.

An additional audit found substantial **between-process variability in the
two-library experiment**, including about a 10% shift for unchanged ACB code.
Two derivative cases in that audit even became small slowdowns despite their
usual gains. The diagnostic records identical inputs and similar sampled CPU
placement; the exact cause is not established. These observations are retained
in `evidence/control-audit/` and `evidence/placement-diagnostic/`. Within-process
bootstrap intervals alone do not capture this source of uncertainty.

Consequently, derivative attribution and the smaller interpolation gains also
require two independent **fresh-process audits**. Both timed engine slots call
one selected library in each process. Baseline and candidate processes are
arranged in 15 ABBA/BAAB quartets per case, with four timed batches per process,
and uncertainty is calculated across process quartets. All processes are kept;
none are selected by their speed. The two input seeds independently confirm
the gains in the table, while unchanged-library controls are 0.29% and 0.10%,
both with intervals containing zero. Combined ACB evaluation saves 17.54% and
17.64% in these audits. Exact intervals for both clocks are in
[PROCESS-AUDITS.md](PROCESS-AUDITS.md).

## Correctness and limitations

The combined series passes 19 selected upstream tests across `nmod_poly_mat`,
`nmod_poly`, `gr_poly`, `arb_poly` and `acb_poly`, including the new focused
coverage. The same selection passes with AddressSanitizer and
UndefinedBehaviorSanitizer on changed objects and test harnesses. The remainder
of the baseline library is not sanitizer-instrumented. Matrix squaring,
interpolation squaring and powering also pass with four FLINT threads.
Benchmark cases check results before and after timing against independent
classical multiplication, scalar evaluation, Horner/derivative, or high-precision
basecase-series references as appropriate. Relevant standalone test logs are
included as well.

No second architecture or full-library exhaustive test run is claimed. The
patches use portable existing FLINT arithmetic; the supplied timing/build
convenience tools target macOS/Apple M2. Memory use is not independently profiled.
Performance outside the documented workload families remains unmeasured.

The unused Newton-exponential coefficient cleanup is **not retained**: its
mostly subpercent screen gains were too weak relative to controls. Earlier
integer-multiplication, polynomial-matrix and theta patches from this project
are separate and do not count toward these five changes.

## Contents

* `patches/`: five numbered source-and-test patches.
* `evidence/`: raw timings, summaries, frozen plans and source snapshots,
  profiles, build manifests, test logs and the failing baseline regression.
* `validation/`: independently applied source files and the patch-application log.
* `audit.json` and `SHA256SUMS`: integrity checks and provenance.
* `reproduce/` and [REPRODUCE.md](REPRODUCE.md): source tools and reproduction steps.

Recorded absolute paths identify the original workspace. Reproductions should
create fresh plans and result directories instead of editing the archived plans
or replacing their binaries.
