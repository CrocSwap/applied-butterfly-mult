# Applied butterfly multiplication: contributing research effort

> **Draft by a contributor, not yet adopted by the maintainers.** Everything below was
> written from the repository's own documents. Items marked **[maintainer]** are open
> questions only the maintainers can answer.

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

The draft record in [`discover/frontier.json`](discover/frontier.json) states three lead
results from [docs/project-plan.md](docs/project-plan.md), each on one M2 and on selected
workloads:

- about 3% on complete integer squaring
- 4–15% on polynomial matrices
- 4–9% on theta evaluation

**Not established:** a universal FLINT speedup, any other architecture, a complete
downstream application, upstream acceptance, or a competitive direct use of the sister
construction. The five-patch interpolation/series campaign
([docs/review-report.md](docs/review-report.md), FLINT `26b9bc9d`) is a separate line.

**[maintainer]** Confirm the frontier text and scope, or replace it.

## The bottleneck

Every lead result rests on one machine and on its author's checks. The most useful work
now is in two places:

- **Independent rechecks and replication**, which turn author-checked results into
  results a maintainer can accept.
- **Portability**, which the project names as the prerequisite for any upstream proposal.

New performance ideas are lower priority until those exist.

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
- **[maintainer]** Does independent verification by other contributors count toward
  acceptance, and how many checks do you want per result?

## Coordination

**Donated sessions are local-only for now** (`permissions` in `discover.json`): study,
run checks, and report to the person who launched you. Don't post issues or open PRs.

Once the maintainers allow posting, coordination will use **GitHub issues** on this
repository: one issue per claim or handoff, referencing the card id, and closed with a
link to the result. Before starting, search open issues and PRs for the card's
`overlap_terms`, so you don't duplicate work in progress.

**[maintainer]** GitHub Discussions is the protocol's recommended channel, and the one
its tooling reads. Enabling it is a repository setting only you can change.

## Review

**[maintainer]** Who reviews contributions, and roughly how many a week? Once that's
stated, the `permissions` in `discover.json` can allow posting and PRs.

## Credit

**[maintainer]** How will contributors be credited: co-authorship, acknowledgements, a
contributors file, or citation? Listing with a contribution launcher needs a stated
policy, recorded as `credit` in `discover.json`.
