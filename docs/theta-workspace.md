# Theta workspace integration: no resolved complete-call gain

## Decision

The actual-intermediate replay in `theta-replay.md` justified a bounded integration
test. That test is now complete: **no construction-specific complete-call speedup
was established**. All eight confirmation comparisons against ordinary transforms
had CPU and wall confidence intervals crossing zero. Ordinary scratch reuse also
had no resolved complete-call gain in these four cases.

Preserve the implementation as an experimental candidate, do not install it, and
do not expand to a wider theta timing sweep. The kernel replay result remains valid;
these measurements cannot rule out the roughly 0.04–0.2% full-call effect estimated
from the earlier profiles. They provide no evidence of a significant application gain.

## What changed

The existing QL batch cache now owns a transform scratch vector, initialized and
cleared with the cache. The three QL transform sites use it directly. A new private
cross-file helper, `bf_theta_agm_mul_ws`, accepts that same scratch explicitly for
all-characteristic AGM operations. It passes scratch through both the equal-bank
and general product-first paths.

The existing public `acb_theta_agm_mul` API is preserved. Standalone AGM calls own
one scratch vector for their operation. Independent and nested QL calls have their
own cache storage. No global or thread-local workspace is introduced. The existing
cache reset still invalidates mathematical input/transform entries between steps;
scratch retains only reusable allocation, not cached mathematical values.

All four implementations receive the same lifetime opportunity:

| Transform | Complex balls in scratch |
|---|---:|
| Ordinary iterative | 1 |
| Ordinary recursive | 1 |
| Alman–Rao H4 | 6 |
| Alman–Rao H8 | 16 |

H4/H8 retain the previous integration's dispatch: use recursive ordinary WHT
above 4,096 working bits or below the gadget's natural base size. The maximal
workspace is still allocated for the selected implementation when a fallback is
used. All allocation and destruction remain inside the timed public call.

This is a per-batch-context/per-AGM-operation implementation, not one global scratch
vector for every nested operation of a public theta call. It preserves explicit
ownership and reentrancy. It also uses the real application's output buffers, in
contrast with the shared warm output buffer used in replay.

## Qualification

- Four generated variants passed the independent exact AGM oracle under ASan/UBSan:
  **4,243,200 exact containment checks** in total.
- Each passed five relevant FLINT tests: AGM multiplication, tight AGM multiplication,
  QL exact evaluation, jet without transformation, and public jet evaluation:
  **20 test passes**.
- Seven complete-call fixtures per variant covered the four timed cases, a mixed
  four-point batch, genus one, and a 2,048-bit genus-four case exercising high
  internal precision and fallback. All **28 comparisons / 35,344 outputs** passed
  against the prior candidate and cached independent direct-series references.
- The two modified translation units and the complete-call harness were additionally
  compiled under ASan/UBSan for H4 and H8: **14 comparisons / 17,672 outputs** passed.
  The rest of FLINT was not rebuilt with sanitizers.
- No minimum output accuracy decreased and no extra precision retry occurred.
  Ordinary variants had output component-radius sums equal to the prior candidate's;
  the largest H4/H8 radius-sum ratios were 1.110646 and 1.224116 respectively.

These correctness fixtures are synthetic, exactly specified coupled period matrices.
They are not exported periods from the Elkies–Kieffer application. No derivatives
or new real application data were added.

## Frozen timing design

Four cases: genus-three and genus-six squared all-characteristic constants at
512 requested bits, with two existing fixtures each. Based on the completed replay,
the choice was fixed before timing: **H8 for genus three; H4 for genus six**.
Each was compared against both persistent ordinary implementations.

The eight additional reuse comparisons pair each persistent ordinary implementation
with its previously frozen counterpart allocating scratch per transform. Four
controls compare either the same function or an independently rebuilt identical
iterative workspace implementation, once at each genus (fixture zero).

The initial pass used 19 alternating ABBA/BAAB quartets for each of 20 comparisons.
A single fixed confirmation repeated **all 20**, with 31 quartets, no selection and
no implementation change. Each used 200 ms joint warmup, equal repetitions calibrated
to 20 ms for the slower implementation, and CPU plus wall measurements. Bootstrap
intervals use 4,000 circular moving-block draws. Total: **4,000 timed batches**.

The timed operation includes complete `acb_theta_jet`, temporary setup/cleanup,
finite/accuracy scans, and any retries. The target is relative-to-one accuracy at
least requested precision minus 32; working precision would increase by 64 up to
256 additional bits. No retries occurred in any recorded batch. Caller inputs,
output allocation, library loading, and independent oracle work remain outside
timing, as in the previous full-call experiments. Compilation, checking, and analysis
were kept separate from timing.

The frozen decision gate required a case to beat **both** ordinary implementations
with positive CPU and wall intervals in confirmation, with controls consistent
with zero. No case met that gate.

## Confirmation results

Positive percentages mean reduced complete-call CPU time. Intervals are individual
95% block-bootstrap intervals, not simultaneous bounds.

| Case | Circuit | Versus iterative: reduction [CI] | Versus recursive: reduction [CI] |
|---|---|---:|---:|
| Genus 3, fixture 0 | H8 | −0.260% [−0.691, +0.189] | +0.080% [−0.216, +0.393] |
| Genus 3, fixture 1 | H8 | −0.053% [−0.627, +0.487] | −0.291% [−0.684, +0.105] |
| Genus 6, fixture 0 | H4 | +0.343% [−0.006, +0.718] | −0.449% [−0.986, +0.064] |
| Genus 6, fixture 1 | H4 | −0.066% [−0.517, +0.339] | +0.492% [−0.128, +1.137] |

All corresponding wall intervals also contain zero. All eight ordinary reuse
comparisons are unresolved in confirmation (CPU point estimates −0.079% to +0.221%).
Both rebuild controls and both same-function controls contain zero for CPU and wall.

The initial pass had an apparently positive H4-versus-iterative genus-six fixture-zero
result (+0.606% CPU, CI [+0.159, +1.039]), but its comparison against recursive ordinary
was unresolved and the iterative comparison did not clear confirmation. Two initial
ordinary reuse comparisons were positive; neither cleared confirmation. These initial
results and the broad wall interval on one initial same-function control remain in
the raw record. No additional timing was used to seek a favorable outcome.

## Interpretation and next direction

The replay demonstrated a real arithmetic-kernel advantage when scratch is reused.
Explicitly carrying that reuse into the application has not supplied a measurable
complete-call improvement with this protocol. The remaining transform fraction is
small, and actual output-buffer and intervening-work behavior differ from replay.
This experiment does not isolate their separate contributions or establish that
the kernel advantage mathematically disappears inside the application.

For the user's goal of a **significant** applied speedup, another broad theta sweep
is not justified. Keep the earlier, larger product-first/equal-bank/batch theta
results separate and intact. Further construction-transfer work should first find
a real expensive-arithmetic workload where these transforms consume a much larger
fraction of total time. A new workload should pass that profiling gate before
another circuit integration. The existing polynomial-matrix gains remain a separate
practical track worth qualifying in a complete caller.

Attribution is unchanged: H4/H8 are explicit older Alman–Rao non-rigidity constructions;
the current theoretical project supplied the discovery route. Workspace reuse is
conventional implementation work. This experiment supplies no new competitive
application of a distinctive OpenAI/sister-project construction.

## Artifacts and preservation

- `scripts/theta_workspace.py`: source generation, isolated library builds,
  qualification, timing, fixed confirmation, analysis, and raw-record checks.
- `patches/theta-workspace-{iterative,recursive,h4,h8}.patch`: incremental patches
  against the previous equal-bank/retained-batch sources (not standalone patches
  against pristine upstream FLINT).
- `.deps/experiments/theta-workspace/`: generated source, objects, libraries, logs.
- `results/theta-workspace/`: validation, exact/upstream test logs, frozen plans,
  raw timing, summaries, audits, and completion manifest.

Stages are `build`, `qualify`, `measure`, `analyze`, `confirm`, then `measure` and
`analyze` with `--confirmation`. Existing run directories/raw files are protected
against overwrite; a new run needs new destinations. The inherited and new
fingerprint audits passed **1,541** entries initially and **1,545** in confirmation.
Raw quartet ordering, equal repetitions, accuracy/retry contracts, and reported
point estimates were checked. All historical source, results, patches, and default
libraries remain unchanged. Nothing was installed or submitted externally.
