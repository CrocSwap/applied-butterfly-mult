# poly-prepared patch-application and patched-source recheck

Card `recheck-poly-prepared` (track `verify`), hub seed `2a680fc57882973d80399fe8b0aa85e4`,
base `8f6dcb3fd47e8c1dca2866d15cf686757145691d`. This takes up part of the handoff left with
[PR #17](https://github.com/CrocSwap/applied-butterfly-mult/pull/17)
([comment](https://github.com/CrocSwap/applied-butterfly-mult/discussions/13#discussioncomment-19004049)):
the FLINT-dependent checks that do not need a build.

## What was checked (35 checks, 0 failures)

On a clean shallow checkout of FLINT `657a2839cf0125164859ff102b1f124abcb87ce0`:

- `git apply --check` passes for `patches/poly-prepared.patch`, `patches/poly-contiguous-control.patch`,
  and the 7 kernel patches that `scripts/audit_poly_kernel.py` checks.
- After applying each poly-prepared patch, the SHA-256 of `src/gr/nmod_transformed_poly.c` and
  `src/nmod_poly_mat/mulmid_fft_small.c` equals the pinned
  `.deps/experiments/<name>/src/...` hash in `results/<name>-build/build.json` (4 of the 20
  uncommitted files PR #17 could not check).
- A replay of the string transform in `scripts/build_poly_prepared.py` (with `prepare` taken from
  `build.json`: 1 for the candidate, 0 for the control) produces the same patched sources, and
  `difflib` regenerates both committed patch files byte for byte.
- The committed inputs pinned in each `build.json` (builder script, `poly_prepared.inc`,
  `poly_survey.c`, the patch, `gr.s`) still match their hashes.
- Failure controls: a patch with one corrupted context line is rejected by `git apply --check`,
  and the `BF_PREPARE=0` transform does not match the candidate's pinned hash.

## Replay (a few seconds, no build)

```sh
git init flint && git -C flint remote add origin https://github.com/flintlib/flint.git
git -C flint fetch --depth 1 origin 657a2839cf0125164859ff102b1f124abcb87ce0 && git -C flint checkout --detach FETCH_HEAD
python3 -I results/poly-prepared-patchcheck-1/patchcheck.py . flint
```

## Not checked

- No FLINT build. The other 16 uncommitted pinned files (`libflint-experiment.dylib`, `poly-survey`,
  `libflint.25.0.dylib`, the trace builds, `kernel.inc`/`gr.c` trace sources, `build/trace-*`) were not
  rebuilt or hashed. `gr.s` was not regenerated from the patched source, so the instruction
  counts rest on the committed `gr.s` (which PR #17 recounted).
- The kernel patches were only `--check`ed. Their patched-source hashes were not compared.
- `scripts/audit_poly_prepared.py` itself was not run. No timing, correctness test or FLINT test suite was run.

## Open next questions

- Build per README.md on an M2, run `scripts/audit_poly_prepared.py`, and report which binary hashes differ.
  It aborts at the first mismatched hash, so a run on another machine needs a local copy with
  `check_hashes` changed to report mismatches and continue.

Evidence level: author-checked. Credit: the measurements, patches, builder and audit are the project
author's (@Mister-Meeseeks). The handoff and the raw-data recheck are PR #17. An AI agent (Claude
Opus 5.5) did this work in a donated Discovery@Home session.
