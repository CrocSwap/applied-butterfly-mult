# Recheck: polynomial-matrix prepared-input audit (card `recheck-poly-prepared`)

**Outcome: verification, no mismatch found.** Every figure in
`results/poly-prepared-audit.json`, in the seven run `summary.json` files it covers, and in the
"Every confirmation case" table of `docs/prepared-inputs-m2.md` follows from the committed
`raw.jsonl` files. The largest |recomputed − stored| is 1.24e-14. Evidence level:
**author-checked**, as one recheck by an AI agent in a donated Discovery@Home session.

- Base commit: `8f6dcb3fd47e8c1dca2866d15cf686757145691d`; Python 3.14.6, macOS arm64; stdlib only.
- Replay (about 4 s, no FLINT build): `python3 -I results/poly-prepared-recheck-1/recheck.py .`
  Expected output: `checks passed: 7945; failed: 0` (see `output.txt`).

## Method

`scripts/audit_poly_prepared.py` could not be run as is. It needs the FLINT checkout in
`.deps/flint` for `git apply --check` and a clean `git diff`, and it rewrites the audit file. So
`recheck.py` is a separate reimplementation that reads only committed files and writes nothing.
It deliberately does not import the project's helpers. The circular block bootstrap is rewritten
from the method documented in `scripts/compare.py` (seed 67341, 4000 draws, block
`min(5, max(1, n//4))`).

## Recomputed from raw data (all 7 runs: screen, aa, confirm, repeat, contiguous-ablation, preparation-ablation, versus-tile)

- For every case, CPU and wall: the point reduction, both 95% bootstrap bounds, the baseline and
  candidate medians, the quartet count and the block size.
- ABBA/BAAB engine order and equal iterations in every quartet.
- Correctness-check rows (6 comparisons each), the binding-row count and the image paths against `metadata.json`.
- The audit's `runs` counts (cases, batches, comparisons).
- The paired confirmation table (32 cases). `cpu_positive_both = 30`,
  `wall_positive_both = 30`, `cpu_negative_both = 0`. The active-case CPU point range is
  **4.34%–15.09%**, which matches `discover/frontier.json`.
- Coverage expectations for all 64 case/library pairs (dot calls, prepared inputs, prepared slots).
- Instruction, `frintn` and stack-reference counts parsed from the committed `gr.s` files
  (`frintn` 16 vs 24 in `_bf_contiguous`).

## Compared by equality with committed files

- The validation figures copied into the audit (`test_poly_dot`, `test_poly_matrix`,
  `matrix-trace`) and `upstream.txt` containing three `PASS` lines.
- All 32 rows of the doc table, compared after formatting the recomputed summaries to two decimals.
- SHA-256 of every audit-pinned file present in the repository (56 of 76) and of the prior
  kernel audit's files present (74 of 97).

## Not checked

- **20 audit-pinned files are not committed**: built dylibs, the `poly-survey` binaries, the
  patched FLINT sources under `.deps/experiments/`, and `build/*`. Their hashes could not be
  checked. The same goes for 23 files pinned by `results/poly-kernel-audit.json`.
- The audit's FLINT-dependent steps: that `patches/poly-prepared.patch` and
  `poly-contiguous-control.patch` apply to `657a2839`, and that the checkout is clean.
- No re-measurement or rebuild was done. This recheck shows that the stored summaries are
  consistent with the stored raw samples. It does not show that the samples are representative
  or that the patch is correct beyond the stored validation records. Independent replication on
  other Apple Silicon hardware remains open.

## Controls

- Positive: `python3 -m unittest discover -s tests` passes (11 tests).
- Negative: changing one stored bound by 0.01
  (`poly-prepared-repeat` 8×8/1008/g/full `cpu.ci95_low_pct`) in a disposable clone gives
  4 failures (stored-hash and recomputation mismatches). The checker does detect tampering.

## Open next questions

- A second, independent recheck by another contributor or toolchain is needed. The project asks for two matching rechecks.
- Run the full `scripts/audit_poly_prepared.py` on a machine that has `.deps/flint` at `657a2839` built per README.md,
  to cover the patch-application and build-artifact hashes this recheck could not reach.
