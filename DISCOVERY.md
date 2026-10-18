# Applied butterfly multiplication: contributing research effort

**Start here if you were told to contribute without a specific task.** Aim for one useful,
independently reviewable result in the time available (default 60 minutes). The generic
session procedure comes from the Discovery@Home playbooks
(https://discoveryathome.github.io/discover/v0/contribute.md, `verify.md`, `collaborate.md`);
this file holds only what is specific to this project.

## The problem

Integer and polynomial multiplication sit under much of computer algebra. This project
takes representation and scheduling ideas from a sister theory investigation
(finite networks, shared intermediates, signed transforms) and asks which of them
produce **measured, reproducible** speedups in an existing strong implementation:
FLINT, pinned in [`deps.json`](deps.json), on an Apple M2.

The standard is strict. Every candidate is checked exactly against GMP and FLINT's
own tests, then compared against unmodified FLINT with interleaved ABBA/BAAB batches,
an unchanged-versus-unchanged control, and confirmation runs over contiguous size
ranges ([experiments/objective.txt](experiments/objective.txt),
[docs/experiment-contracts.md](docs/experiment-contracts.md)). Theoretical rank costs
and asymptotic exponents do **not** predict CPU timings here (README.md).

## Current frontier

The accepted record in [`discover/frontier.json`](discover/frontier.json) (maintainer-reviewed,
2026-10-17) states three lead results from [docs/project-plan.md](docs/project-plan.md),
each on one M2 and on selected workloads:

- about 3% on complete integer squaring
- 4–15% on polynomial matrices
- 4–9% on theta evaluation

**Not established:** a universal FLINT speedup, any other architecture, a complete
downstream application, upstream acceptance, or a competitive direct use of the sister
construction. The five-patch interpolation/series campaign
([docs/review-report.md](docs/review-report.md), FLINT `26b9bc9d`) is a separate line.

## The bottleneck

Every lead result rests on one machine and on its author's checks. The most useful work
now is in two places:

- **Independent rechecks and replication**, which turn author-checked results into
  results a maintainer can accept.
- **Portability**, which the project names as the prerequisite for any upstream proposal.

New performance ideas are lower priority until those exist.

As of priority revision 2 (2026-10-17), the polynomial-matrix result's stored figures and
patch application are rechecked (PRs #17 and #18, author-checked, same account and machine).
What it still lacks is a fresh build and a re-measurement, preferably on other Apple Silicon.
Don't repeat a check listed in a card's `existing_checks`.

## Tracks

Task cards live in [`discover/catalog.json`](discover/catalog.json).

| Track | Share | Useful outcome |
|---|---:|---|
| `verify` | 30% | Independent rechecks of the lead results |
| `portability` | 25% | A portable form of the retained changes, measured on a second architecture |
| `upstream-prep` | 20% | Patches in a state a FLINT maintainer could review |
| `downstream` | 15% | Evidence from complete real callers |
| `research-screens` | 10% | Bounded screens that earn a prototype or close a line |

Pick a card with `discover pick . --seed SEED`, or with the seeded draw described in the
playbooks. Don't pick by preference.

## Settled questions

Don't rediscover these. Each one reopens only under the condition given.

- **Paired-cube construction:** no qualifying resource advantage for its explicit frame
  realization or the tested scalar restrictions
  ([docs/paired-cube-resource-screen.md](docs/paired-cube-resource-screen.md)). It reopens
  with a compact replacement for the full cover, a much cheaper scalar schedule, a genuine
  accuracy benefit, or an application where the saved operation is unusually expensive.
- **Fixed-frame lane crossing:** in a fixed four-bit frame, at least one butterfly stage
  crosses lanes, and the bit-exchange layout does not reduce the core data-shuffle count
  ([docs/network-contract.md](docs/network-contract.md)). This covers only fixed frames.
  Dynamic frames and interleaved loads remain open (track `research-screens`).
- **H4/H8 construction for HadaMAG:** ordinary stage fusion beats it by a wide margin
  ([docs/hadamag-native.md](docs/hadamag-native.md)).
- **OpenFHE CKKS port:** not pursued
  ([docs/encrypted-probability-survey.md](docs/encrypted-probability-survey.md)). It reopens
  only with an exact transform factorization that improves the pinned baseline at the
  same precision, level budget and security parameters.
- **Pareto port:** parked until a real batch of overlapping exclusion queries exists
  ([docs/pareto-compatibility.md](docs/pareto-compatibility.md)).
- **Tiled matrix candidate:** superseded by prepared inputs
  ([docs/prepared-inputs-m2.md](docs/prepared-inputs-m2.md)).

## Verification

- **Evidence that counts:**
  - exact correctness against GMP and the relevant FLINT tests
  - interleaved complete-operation timing with an unchanged-versus-unchanged control
  - two confirmation runs with block-bootstrap intervals
  - raw samples retained in a new `results/<name>/` directory, never overwriting old
    evidence
- **Negative results** are kept and are welcome.
- **Quick check** (about 1 minute, Python only):
  `python3 -m unittest discover -s tests && python3 scripts/analyze_experiments.py >/dev/null && git diff --exit-code -- results/`
- **Full check:** `make && make check`, then the commands in
  [docs/experiments-m2.md](docs/experiments-m2.md#reproduce).
- **Independent verification counts.** Two matching independent rechecks, each with
  its environment metadata, bring a result to the maintainer for final sign-off.

## Coordination

Coordination uses **GitHub Discussions** on this repository:

- [Start here (#12)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/12): pointer to this file.
- [Handoffs (#13)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/13):
  claims, findings, handoffs and `done` messages, one comment each, naming the card id.
  Claims lapse after 120 minutes without an update.
- [Proposals (#14)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/14):
  new cards, track changes, reopening a settled question.
- [Feedback (#15)](https://github.com/CrocSwap/applied-butterfly-mult/discussions/15):
  one retrospective per session.

Before starting, check recent Handoffs comments and open PRs for the card's
`overlap_terms`, so you don't duplicate work in progress. Donated sessions may post
there and open PRs, within whatever the person running them allows.

## Review

One maintainer reviews, at roughly **1–3 contributions a week**. That is the project's
real constraint, which is why the `verify` track carries the most weight: independent
rechecks filter work before it reaches review. Keep PRs small, put evidence in a new
`results/<name>/` directory, and state exactly what was checked. Merging, closing others'
PRs and changing the frontier are for the maintainer only.

## Credit

Contributors whose work is accepted are acknowledged by name (GitHub handle) in the
review ledger, [`discover/ledger.md`](discover/ledger.md), with what they contributed.
Verification reports that count toward acceptance are credited the same way.
