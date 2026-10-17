# Applied butterfly multiplication: contributing research effort

**Start here if you were told to contribute without a specific task.** Aim for one useful,
independently reviewable result in the time available (default 60 minutes).
The generic session procedure (refresh, orient, choose, bound, verify, hand off) comes from
the Discovery@Home playbooks (https://github.com/discoveryathome/discover/tree/main/playbooks);
this file holds only what is specific to this project.

## The problem

A sister project (`../integerMult`, not required here) studies integer multiplication
through finite networks, signed transforms and the cost of moving between
representations. This repository asks a practical question: do those ideas lead to
**measured, exactly checked speedups of complete operations in a real library**? The
target is [FLINT](https://github.com/flintlib/flint), pinned in [`deps.json`](deps.json).

A result counts only if it survives strong ordinary baselines, exact correctness checks
(against GMP or unmodified FLINT), and interleaved two-library timing with confidence
intervals. Gains so far come from established identities and ordinary engineering
(fusion, reuse, symmetry); the theory directed the search. See
[`docs/project-plan.md`](docs/project-plan.md) for the story and the attribution to
preserve.

## Current frontier

The accepted result is recorded in [`discover/frontier.json`](discover/frontier.json):
three isolated FLINT patches, each measured on **one Apple M2, one thread**:

- **Integer squaring** (`patches/c3-register-reconstruction.patch`): about 3% lower
  complete squaring wall time (2.99% [1.94, 4.11] and 2.91% [2.02, 3.74]) over sampled
  4,096–16,384-limb (262k–1M-bit) operands, in two confirmation runs.
- **Polynomial matrices** (`patches/poly-prepared.patch`): 4.34–15.09% lower complete-call
  CPU across all 30 eligible tested cases, positive intervals in both runs.
- **Theta** (`theta-direct-walsh` + `theta-batch-retained`, plus `theta-equal-bank`):
  nonzero-point batch medians 3.65/4.92/5.84% at 1/4/16 points (512 bits, genus 2–3);
  equal-bank squared constants 4.38–9.13% by genus. These figures are not additive.

**Not established:** any result on other hardware; gains at every size (sizes were
sampled); absence of regressions elsewhere in FLINT; upstream acceptance; a genuine
downstream caller; memory cost. "No claim of universal FLINT acceleration … is supported
yet" (`docs/project-plan.md`).

A separate five-patch FLINT series ([`docs/review-report.md`](docs/review-report.md),
`patches/opt-*.patch`, against FLINT `26b9bc9d`) is retained context, not part of the
frontier.

## The bottleneck

**Every number comes from a single M2.** One machine can't separate a real algorithmic
gain from an artifact of one microarchitecture, compiler and memory system, and no
patch can go upstream on that evidence. Donors bring many different machines, so
the binding constraint is now **replication on other hardware and portability of
the harness**, followed by upstream readiness. New constructions are gated: per
`docs/project-plan.md`, reopen that line only with a compact replacement for the full
cover, a much cheaper scalar schedule, a genuine accuracy benefit, or an application
whose representation makes the saved operation unusually expensive.

## Tracks

Task cards live in [`discover/catalog.json`](discover/catalog.json) (weights sum to 100).
Draw with `discover pick . --seed SEED` (or the seeded procedure in the hub playbook);
don't choose by preference.

| Track | Share | Useful outcome |
|---|---:|---|
| `replicate-hardware` | 30% | Frontier results re-timed on hardware other than the M2, or a harness that runs there |
| `verify-audit` | 25% | Independent rechecks of the frontier and repairs to evidence a stranger can't currently check |
| `upstream-readiness` | 25% | Patches a FLINT maintainer could review: portable, fully tested, memory-profiled |
| `downstream-callers` | 20% | A genuine complete caller, or the missing inputs for one, before any new timing campaign |

## Settled questions

Don't rediscover these. Each is closed only within its stated scope; the "reopen if"
column names what would have to change.

| Question | Result and scope | Reopen if | Source |
|---|---|---|---|
| Walsh H4/H8 kernels inside complete theta calls | −0.43% / −0.64%; an ordinary allocation cleanup gives ~1–1.4% | A caller where the transform dominates call time | `docs/theta-nonrigidity.md` |
| H4/H8 standalone at large precision | H4 −5.04%, H8 −29.86% at 32,768 bits (gains only at 512–4,096 bits) | — | `docs/walsh-nonrigidity.md` |
| 8-point Walsh transforms vs stronger baselines | Lose at 512 bits; H8 evidence weak; no default dispatch | — | `docs/walsh-baseline-qualification.md` |
| Theta workspace reuse | No complete-call gain; all eight intervals cross zero | — | `docs/theta-workspace.md` |
| Theta replay | Kernel-only advantage; full-call opportunity 0.04–0.20% | — | `docs/theta-replay.md` |
| Paired-cube construction (sister commit `d1d6c070`) | Needs C/S > 76.59 to break even; scalar side loses at all four sizes | Any of the four reopen conditions above | `docs/paired-cube-resource-screen.md` |
| Gaussian correction-power bound | Tied in 30, worse in 47 of 77 cases vs a finite-matrix certificate | — | `docs/gaussian-bound-screen.md` |
| Sachs hybrid / hypergraph schedules | 970 additions every arm; 2,329 vs 972 conventional | — | `docs/sachs-hybrid-screen.md`, `docs/sachs-hypergraph-screen.md` |
| Theory paths (paired circuit) | Branch-and-bound beats it; stronger control wins all 48 instances incl. Wnt | — | `docs/theory-paths-qualification.md`, `docs/theory-paths-hard-qualification.md` |
| Sister tools on FFT leaves (length 16/32) | No competitive circuit | — | `docs/kernel-construction-screen.md` |
| Six-to-one phase substitution in `fft_small` | No legal substitution | — | `docs/phase-fusion-screen.md` |
| Network frame / fused twiddle loads / delayed reductions in `fft_small` | ~3% slower / no gain / not called by target workloads | — | `docs/network-research-m2.md`, `docs/fused-loads-m2.md`, `docs/delayed-reductions-m2.md` |
| C1 native lanes, C2 fused inverse | Rejected in favor of C3 | — | `docs/experiments-m2.md` |
| Reed–Solomon basis retention | No candidate passed the runtime gate; 35 frontier points without a caller | A caller that needs them | `docs/erasure-basis-screen.md` |
| Bulk exclusion, QROM, Pareto, encrypted/Bayesian, joint-workload, HadaMAG Float64 | No qualifying application | A real constrained computation | the matching `docs/*.md` |
| Theory transfer construction | 1.9–4.7% stands only as an ablation; application claim superseded | — | `docs/theory-transfer-screen.md` |

Genus-six E4 (`docs/theta-e4.md`) is **blocked, not negative**: the actual period matrix
is missing.

## Verification

Evidence here is benchmark evidence (`verification_profile: benchmark`): exact
correctness checks, then two resident libraries timed in alternating ABBA/BAAB quartets,
with raw samples, medians, bootstrap intervals and environment metadata retained.
Output directories must be new; scripts refuse to overwrite evidence.

- **Recheck the frontier** from a clean clone, no build needed (well under a minute):
  `PYTHONDONTWRITEBYTECODE=1 python3 scripts/check_frontier.py`. It re-derives the
  headline statistics from the committed raw samples. It does not re-time anything.
- **Full replay** needs Apple Silicon macOS, the prerequisites in [README](README.md),
  `make`, and the per-result commands in `docs/experiments-m2.md` (Reproduce),
  `docs/prepared-inputs-m2.md` and `docs/theta-equal.md`. Expect hours, on a quiet machine.
- The `scripts/audit_*.py` files hash local build artifacts in `.deps/` and some import
  from `../integerMult`. They verify the original author's machine, not yours.
- **Before a PR**: `python3 -m unittest discover -s tests` passes; new timing results
  include an A/A control on the same machine; new patches pass FLINT's tests for the
  touched module; the report says what was *not* checked.

**Acceptance.** The maintainer reviews roughly five contributions a week. A result is
accepted on **one independent replay or audit by another contributor plus maintainer
review**. Record verifications as `research/<name>/verifications/<YYYY-MM-DD>-<handle>.json`
(spec §9.1). Reviewed contributions are logged in [`discover/ledger.md`](discover/ledger.md).
Changing `discover/frontier.json` is maintainer-only.

## Coordination

GitHub Discussions, using the message format in the hub playbooks:
[Start here (#1)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/1),
[Handoffs (#2)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/2) for claims,
findings, handoffs and `done`,
[Proposals (#3)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/3) for new cards or
reopening a settled question, and
[Feedback (#4)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/4) for session
retrospectives. `discover pick . --live` reads live claims and open handoffs from there.
Short sessions that finish inside their budget need no claim; post `done` or `finding`.
Label results measured only on your machine `LOCAL-ONLY` until replicated, and always
state the CPU model, OS, compiler and flags.

## Credit

Accepted contributions are credited by GitHub handle in
[`CONTRIBUTORS.md`](CONTRIBUTORS.md) and acknowledged in any write-up or upstream FLINT
patch that uses them.
