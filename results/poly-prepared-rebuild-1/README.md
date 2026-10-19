# Fresh rebuild of the poly-prepared libraries (recheck-poly-prepared, build half)

**Evidence level: author-checked, local-only.** Same GitHub account (@Mister-Meeseeks) and
same physical M2 as the original build. This is an author-side reproducibility check, not one
of the two independent rechecks; `independent-replication` stays open.

- Task: card `recheck-poly-prepared`, taking up handoff
  [#13 comment 19004100](https://github.com/CrocSwap/applied-butterfly-mult/discussions/13#discussioncomment-19004100).
  Drawn by `discover pick . --seed d43039776510d5e8dcd258c87e1073bf` (track `verify`), in a Discovery@Home donation.
- Base: repo `cc72641d0dab6731f8fc9faa2e5e5c9cf46cb951`, FLINT `657a2839cf0125164859ff102b1f124abcb87ce0`.
- Environment: [`environment.json`](environment.json): Apple M2, macOS 26.6.2, Apple clang 21.0.0,
  GNU Make 3.81, GMP 6.3.0, MPFR 4.2.2, shell locale `en_US.UTF-8`.

## Answer

1. **Assembly counts reproduce exactly.** In both regenerated `gr.s` files, `_bf_normalize` has 39
   instructions, 8 `frintn`, 0 stack references. `_bf_contiguous` has 126/16/0 (prepare 1) and 150/24/0 (control),
   matching `results/poly-prepared-audit.json`. After replacing the checkout root and experiment name,
   everything before the `__DWARF` sections is **line-for-line identical** to the pinned `gr.s` (12,244 and
   12,476 lines). The 2,188 differing lines in each file are DWARF string-table offsets and lengths, which
   shift because the absolute path has a different length.
2. **Validation and coverage reproduce exactly.** `validate_poly_prepared.py` PASS for both new names, with
   `test_poly_dot`, `test_poly_matrix` and `matrix-trace` JSON byte-identical to the pinned files. That is
   1,294,080 direct checks, 188 matrix comparisons, 3,112/3,020 tile calls/successes, 3,935 prepared inputs
   and 12,869,120 slots (0 and 0 for the control). FLINT `nmod_poly_mat` upstream tests: 3 PASS each.
   The coverage trace (a local copy of `trace_poly_prepared.py` pointed at the new names, in `tools/`) gives
   64 case/library pairs, all identical to `results/poly-prepared-coverage/coverage.json`.
   `make check` (fft_small tests and the `build/mul` smoke runs) passed.
3. **Hashes ([`all-roles.json`](all-roles.json), 39 hashed roles across the five pinned records):**
   - **25 match.** All sources, scripts, plans, both patches (the regenerated patches are byte-identical
     and so are not committed again), both generated `src/*.c` copies, `kernel.inc` and the trace `gr.c`,
     and the three check JSON files per library.
   - **14 differ**, and none of them affects counts or code. Of the 17 uncommitted pinned artifacts,
     8 match. The 9 that differ are every linked binary: two experiment dylibs, two `poly-survey`, two
     trace dylibs, two trace binaries and `libflint.25.0.dylib`. Also different: the two `gr.s` files
     (DWARF offsets only, item 1), the two `upstream.txt` files (test timings only, e.g. 0.04 vs 0.07),
     and `scripts/trace_poly_prepared.py` (intentionally replaced by the local copy).
4. **Why the linked binaries differ** ([`locale-control.json`](locale-control.json)). There are two
   separate causes:
   - **Absolute paths.** Two extra `LC_ALL=C` builds at different directory names have **identical
     `__TEXT,__text` and `__DATA,__data` bytes** but different file hashes (install name, debug map, UUID).
     So pinned whole-file hashes can only match in a checkout at the original absolute path, under the
     original experiment name.
   - **Locale-dependent link order.** `/usr/bin/make` (GNU Make 3.81) sorts `$(wildcard)` by locale
     collation. Under `en_US.UTF-8`, `gr_LOBJS` begins `fmpq_mpoly.lo fmpq_poly.lo fmpq.lo`; under `LC_ALL=C`
     it begins `fmpq.lo fmpq_mpoly.lo fmpq_poly.lo`. The pinned `ld -r` lists are in C order; this session's
     default-locale lists are the same objects in a different order. A default-locale rebuild therefore has
     different `__text` bytes from a C-locale rebuild, and layout can matter for timing.

## Replay

```sh
make && make check
python3 scripts/build_poly_prepared.py poly-prepared-rebuild-1 --prepare 1
python3 scripts/build_poly_prepared.py poly-contiguous-control-rebuild-1 --prepare 0
python3 scripts/validate_poly_prepared.py poly-prepared-rebuild-1
python3 scripts/validate_poly_prepared.py poly-contiguous-control-rebuild-1
cp results/poly-prepared-rebuild-1/tools/trace_poly_prepared_rebuild.py scripts/ && python3 scripts/trace_poly_prepared_rebuild.py
python3 -I results/poly-prepared-rebuild-1/tools/compare_rebuild.py . poly-prepared poly-prepared-rebuild-1
python3 -I results/poly-prepared-rebuild-1/tools/compare_rebuild.py . poly-contiguous-control poly-contiguous-control-rebuild-1
python3 -I results/poly-prepared-rebuild-1/tools/compare_all_roles.py .
# locale control: LC_ALL=C python3 scripts/build_poly_prepared.py NEW-NAME --prepare 1 (twice, two names),
# then compare `otool -s __TEXT __text …/libflint-experiment.dylib | tail -n +3 | cut -f2- | shasum -a 256`
```

`compare_rebuild.py` hardcodes the pinned checkout root taken from the pinned `build.json` commands.
`results/poly-prepared-rebuild-1-coverage/coverage.json` hashes `scripts/trace_poly_prepared_rebuild.py`;
that file is committed here under `tools/` instead.

## Not checked

- No timing or re-measurement. The machine was loaded (load average 6.6-24.7 on 8 cores).
  `upstream.txt` timings are not comparable.
- Pinned binaries are not committed, so pinned section bytes could not be compared with the rebuild. That
  the pinned build's code matches the rebuild's is inferred from identical non-DWARF `gr.s` and C-order link
  lists, not shown byte-for-byte.
- `libflint.25.0.dylib` was built under `en_US.UTF-8` only. The full FLINT build was not repeated under `LC_ALL=C`.
- Not on other Apple Silicon, nor by another person.

## Open next questions

- Should `scripts/bootstrap.sh` and `scripts/build_*.py` force `LC_ALL=C`, so that link order no longer
  depends on the shell? And should `build.json` record section hashes (for example `__TEXT,__text`,
  `__DATA,__data`) as well as file hashes, so a rebuild at another path can be compared?
- Does the default-locale link order change any confirmed timing? (A/B: C-order against en_US-order
  library, both unpatched, on a quiet machine.)

## Credit

This builds on @Mister-Meeseeks's poly-prepared patch, build, validation, trace and audit scripts, and on the
existing checks in PRs #17 and #18. The work was done by an AI agent (Claude Opus 5.5), in a Discovery@Home
donation session run under the maintainer's account.
