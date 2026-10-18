# Priority log

## Revision 2 · 2026-10-17 (proposed, pending maintainer adoption)

Base `8f6dcb3` plus PRs #17 and #18. Sources: PRs #17–#19, the Handoffs discussion (#13)
comments of 2026-10-17 20:45–20:51 UTC, `discover/ledger.md`, and the frontier record
(sha256 `f1590122…`, unchanged). Each PR was replayed at its reviewed head during triage.

**What changed.** Three donated sessions finished `recheck-poly-prepared` within six
minutes. Two of them (#17, #19) did the same recomputation from raw data. All three found
no mismatch. The stored summaries, audit counts, frontier range and doc table follow from the
committed raw samples, and the patches apply to `657a2839` and regenerate the pinned sources.
That is author-checked consistency, not replication. All three ran from the maintainer's
account on the same M2, so none of them counts toward the two independent rechecks, and
`independent-replication` stays open. The card's only method ("check the summaries against
raw.jsonl") is what made the overlap likely: the picker can only offer that method.

**Allocation.** Weights unchanged: `verify` 30, `portability` 25, `upstream-prep` 20,
`downstream` 15, `research-screens` 10. The duplication points to a card scope that was too
easy to finish, not to a wrong track balance, and the frontier did not move.

**Decisions (track `verify`: narrow).**

- `recheck-poly-prepared` (narrowed, same ID): the arithmetic and patch-application halves
  are recorded as `existing_checks` (#17, #18). The card now asks only for the
  build-dependent half: rebuild under new names, compare build-artifact hashes by role,
  recount the regenerated `gr.s`, and rerun validation and trace coverage. The methods name
  the scripts' refuse-to-overwrite paths (`build_poly_prepared.py` names,
  `trace_poly_prepared.py`'s fixed output), so a session doesn't fail at its first command.
- `replicate-poly-prepared-measurement` (new): re-measure the confirm plan from a fresh build,
  with the A/A control. It mirrors `replicate-c3-on-apple-silicon`. It promotes the
  "re-measure on different Apple Silicon" open question from #19 and the handoff chain from
  #17 and #18.
- `verify` now has four cards. Three need a build or a timing run, so roughly three in four
  `verify` draws (about 22% of all draws) land on build or re-measurement work.

**Limits.** This revision rests on one batch of three same-account sessions. The re-measurement
card on the author's own machine gives build and run repeatability, but only a different
machine and contributor close `independent-replication`. Build-artifact hashes are expected to
differ across machines and toolchains, so a mismatch there is not by itself a failure.

**Next experiment.** A fresh build plus the A/A control and one confirm run
(`replicate-poly-prepared-measurement`). It decides whether the 4–15% gain repeats outside the
original session.

**Stop rule.** Pause `recheck-poly-prepared` once a build-dependent report is accepted.
Reopen it if the patches, `deps.json` or the frontier record change.

**Next review trigger.** The first accepted build-dependent or re-measurement report, two more
completions on a `verify` card without new evidence, or a frontier change.

## Revision 1 · 2026-10-17 (adopted by the maintainer)

Initial allocation, drafted by a contributor (issue #11) from the repository's own next-step
sections and adopted by the maintainer with the weights unchanged. Review capacity is about
1–3 contributions a week, so `verify` carries the largest share.

- `verify` 30: every lead result is author-checked on one machine. Rechecks are cheap and
  turn results into something a maintainer can accept.
- `portability` 25: docs/ablations-m2.md names a portable fallback as the prerequisite for
  proposing the change upstream, and docs/project-plan.md item 3 asks for a second
  architecture.
- `upstream-prep` 20: docs/project-plan.md item 2 (the theta patch for review), and the
  broken references in docs/review-reproduction.md.
- `downstream` 15: docs/project-plan.md items 3–4. The pi effect is sub-percent and noisy
  (docs/ablations-m2.md).
- `research-screens` 10: open, but docs/project-plan.md and
  docs/paired-cube-resource-screen.md hold new construction work to strict reopen criteria.
- Next review trigger: after the first 20
  contributions, or when the frontier changes.
