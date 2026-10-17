# Recheck: polynomial-matrix prepared-input summaries (card `recheck-poly-prepared`)

Verification report for the 4.34–15.09% polynomial-matrix lead result in
`discover/frontier.json`. Done by an AI agent (Claude) in a donated Discovery@Home
session. This is **arithmetic re-derivation from committed evidence**, not a re-measurement.

- Base commit: `8f6dcb3fd47e8c1dca2866d15cf686757145691d`
- Python 3.14.6, macOS 26.6.2, Apple M2 (no build, no timing runs)
- Draw: seed `b77b7909b86a402fd111f5ecfb9fd217` → track `verify`, card `recheck-poly-prepared`
- Positive control: `python3 -m unittest discover -s tests` → `Ran 11 tests ... OK`

## Why the audit script was not run

`scripts/audit_poly_prepared.py` needs a FLINT checkout and builds: it runs
`git apply --check` and `git diff` in `.deps/flint`, and it hashes 20 build artifacts under
`.deps/` and `build/` that are not committed. It also rewrites
`results/poly-prepared-audit.json`. So, following the card, the summaries were checked
against `raw.jsonl` with a separate script, `recheck.py`, which reimplements the
statistics instead of importing project code.

## Replay

```sh
python3 -I results/poly-prepared-recheck-1/recheck.py .   > recheck.log
python3 -I results/poly-prepared-recheck-1/doctable.py .  > doctable.log
```

## Recomputed from raw.jsonl (all matched)

| Check | Result |
|---|---|
| Every field of every `summary.json` entry (reduction, both CI bounds, both medians, quartets, block; cpu and wall) in all 7 runs (screen, aa, confirm, repeat, contiguous-ablation, preparation-ablation, versus-tile) | 1400 fields, **0 mismatches** (tolerance 1e-9 relative) |
| Per-run `cases` / `batches` / `comparisons` in the audit's `runs` block | all 7 match |
| `cpu_positive_both` / `wall_positive_both` / `cpu_negative_both` | 30 / 30 / 0, as stored |
| Eligible (dim ≥ 4) cases | 30 of 32 |
| CPU reduction range over eligible cases, both runs | **4.34–15.09%** (run 1: 4.70–14.94%; run 2: 4.34–15.09%) |
| Audit `confirmation` block equals the confirm/repeat summaries | yes, all 32 cases |
| A/A control (`poly-prepared-aa`) intervals containing 0 | 12 of 12 (cpu and wall, 6 cases) |
| SHA-256 of every committed file listed in the audit and in the 7 metadata files | 56 of 76 audit entries present, 0 mismatches; the 20 absent files are all under `.deps/` or `build/` |
| The 32-row CPU table in `docs/prepared-inputs-m2.md` | 32 rows, 0 differences after rounding to 2 dp |

The CI bounds are a stronger check than the audit script makes: that script compares
only `reduction_pct` with raw, while the circular block bootstrap uses a fixed seed
(67341 in `scripts/compare.py`), so the bounds can be reproduced exactly.

**Failure control:** scaling one candidate `cpu_ns_per_op` by 1.02 in a scratch copy of
`poly-prepared-repeat/raw.jsonl` gives a SHA-256 mismatch on that file and 4 field
mismatches in the affected case.

## Inspected only, or not checked

- Not checked: the build, patch application, assembly counts (`frintn` 16 vs 24), FLINT
  test outputs, trace and coverage counts against binaries. They need `.deps/` and the
  builds. Their stored JSON hashes do match.
- Not checked: whether the raw timings themselves are right. No re-measurement was done.
  This recheck ran on the same machine and GitHub account as the original work, so it
  is **not** the independent replication the frontier lists as open.
- Observation, not a mismatch: the inactive 1×1 control in the confirm run shows
  −0.63% [−1.18, −0.13], an interval that excludes zero. Run 2 gives −0.08% [−0.52, +0.35]
  for the same case. The docs report inactive cases separately, and the claim is unaffected.

Credit: this rechecks the prepared-inputs experiment and audit by the project author
(`docs/prepared-inputs-m2.md`, `scripts/audit_poly_prepared.py`).

## Open next questions

- Rerun `audit_poly_prepared.py` against a fresh `make` of the pinned FLINT 657a2839, to
  cover the build-dependent assertions.
- Re-measure `poly-prepared-confirm` on different Apple Silicon hardware (closes
  `independent-replication`).
