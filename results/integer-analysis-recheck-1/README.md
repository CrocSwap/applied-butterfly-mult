# Integer-squaring confirmation analysis recheck (card `recheck-integer-analysis`)

Evidence level: **author-checked** (one AI-agent session, 2026-10-18). Not an independent
re-measurement: nothing was built or timed.

- Base commit: `cc72641d0dab6731f8fc9faa2e5e5c9cf46cb951`
- Environment: macOS 26.6.2, Python 3.14.6 (chip not recorded: `sysctl` was blocked by the sandbox)
- Seed for the task draw: `f27fe32cb5a254c903032f2606625956` (`discover pick`, track `verify`)
- Input hashes: `inputs.sha256`. `results/confirmation-analysis.json` matches the frontier's
  pinned sha256 `0635177a…17af`.

## What was checked

1. **Card first step, from a clean clone:**
   `python3 -m unittest discover -s tests` (Ran 11 tests, OK), then
   `python3 scripts/analyze_experiments.py >/dev/null && git diff --exit-code -- results/` →
   **REPRODUCED**, no diff, clean tree. This includes the rewritten `cpu-summary.csv` and
   `wall-summary.csv` files of the three runs. It took about 2.5 min, not the card's
   "about 30 seconds" (machine load not controlled).
2. **Code reading of `scripts/compare.py` and `scripts/analyze_experiments.py`:**
   - Each trial is asserted to be ABBA or BAAB, chosen by `trial % 2`, with equal iterations.
   - Effect = `1 - exp(-mean log(baseline/candidate))`.
   - Circular moving-block bootstrap: block `min(5, max(1, n//4))`, 4000 draws.
   - The CI uses indices 100/3900, which are the 2.5% and 97.5% points. This is consistent
     with compare.py's `int(4000*.025)` and `int(4000*.975)`.
   - No defects found.
3. **Separate stdlib reimplementation** (`recompute_integer.py`, which imports nothing from
   the repo), run as `python3 -I recompute_integer.py REPO`:
   - Covers all 16 aggregate figures for control-aa-dual and c3-register-confirm-1/2,
     wall and cpu, for sqr, mul and unbalanced.
   - Quartet ordering is checked for every trial.
   - Case counts and point estimates match exactly (tolerance 1e-9 pct).
   - Bootstrap intervals were redrawn with an unrelated RNG (`SystemRandom`). They agree
     with the stored ones within 0.06 pct points (tolerance 0.15).
   - Totals: 5952 checks, 0 failures (`recompute.txt`).
4. **Failure control:** adding 0.001 pct to the stored c3-register-confirm-2 cpu sqr figure
   in a scratch copy is detected (1 failure; `failure-control.txt`).

Headline figures reproduced: cpu sqr 3.2633% [CI 2.99, 3.54] (confirm-1) and
3.1005% [CI 2.85, 3.34] (confirm-2). These match `discover/frontier.json`.

## Finding (wording only)

The frontier statement says the squaring gain is "over 4095-16385-limb operands".

- Both runs measured 11 sizes, 4095–16385 (`docs/experiments-m2.md:168,172`).
- The stored aggregate covers only the plan's prespecified `primary_interval_limbs`,
  [4096, 16384]. That is 9 sizes, without 4095 or 16385
  (`scripts/analyze_experiments.py:78`, `experiments/c3-confirmation-plan.json`).
- Including the two endpoints gives cpu sqr 3.2162% (confirm-1) and 3.0336% (confirm-2),
  a difference of 0.05–0.07 points. Both endpoints still gain individually (2.47–3.11%).
  Figures are in `range.txt`.

Suggested wording, for the maintainer to decide on: "over 4096-16384-limb operands
(the prespecified primary interval; 4095 and 16385 were measured but are outside it)".
This package doesn't change the frontier.

## Not checked

- Rebuilding FLINT or the C3 patch, any timing, or the exact GMP checks.
- `metadata.json` contents or the hashes of the binaries named in them.
- Other analysis outputs (`ablation-analysis.json`, `final-checks-analysis.json`, pi runs).
- Whether the raw samples are genuine measurements. Only their internal consistency with the
  summaries was checked.
- Independence: the contributor's account and machine were not confirmed to differ from the original author's.

## Open next questions

- Re-measurement on separate Apple Silicon (card `replicate-c3-on-apple-silicon`) remains
  the route to the `independent-replication` obligation.

## Replay

```sh
python3 -I results/integer-analysis-recheck-1/recompute_integer.py .
```
