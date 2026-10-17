# Priority log

## Revision 1 · 2026-10-17

Initial allocation. A hypothesis, not a mandate.

| Track | Weight | Why |
|---|---:|---|
| `replicate-hardware` | 30 | Every frontier number is from one Apple M2. Donors' varied hardware is this project's scarcest input and is needed before anything goes upstream. |
| `verify-audit` | 25 | The maintainer reviews about five contributions a week, so independent checks have to filter work first. The existing audits only run on the author's machine, and the review-series references don't resolve. |
| `upstream-readiness` | 25 | Project plan item 2 (theta patch for review) and the review series' open obligations (full tests, memory). |
| `downstream-callers` | 20 | No frontier result has a genuine complete caller yet. New constructions are deliberately excluded until a reopen condition in `docs/project-plan.md` holds. |

- Next review: after the first 10 reviewed contributions, when any frontier result is replicated or fails to replicate on other hardware, or by 2026-11-16, whichever comes first.
- Likely moves: shift weight from `replicate-hardware` to `upstream-readiness` once one non-M2 replication of C3 and one of `poly-prepared` exist; shift toward `verify-audit` if the review queue grows.
