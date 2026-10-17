# butterflyMult

Practical integer-multiplication experiments inspired by the finite-network and
representation work in `../integerMult`. The target is a reproducible improvement
to an existing multiplication implementation over a useful range of sizes.

The first baseline uses FLINT's `fft_small` on an Apple M2. FLINT is pinned in
[`deps.json`](deps.json); its source and build stay in the ignored `.deps/`
directory. Fusing two-prime
reconstruction with carry propagation reduced complete squaring wall time by
about 3% across sampled 262k–1M-bit operands in two confirmation runs on M2.

**[Experiment results, patch, and reproduction](docs/experiments-m2.md)**

[Follow-up: attribution and the pi workload](docs/ablations-m2.md)

[Research: first retained FFT-frame experiment](docs/network-research-m2.md)

[Research follow-up: fused twiddle loads](docs/fused-loads-m2.md)

[Research follow-up: reduction scheduling and dispatch coverage](docs/delayed-reductions-m2.md)

[Next workload: polynomial matrix survey and shared spectral computation](docs/polynomial-survey-m2.md)

[Shared matrix kernel: repeated ~8% gains on selected workloads, with regressions elsewhere](docs/shared-matrix-kernel-m2.md)

[Shared input reductions: 4–15% gains across all 30 active tested cases, with contiguous access](docs/prepared-inputs-m2.md)

[Initial baseline and profiles](docs/baseline-m2.md)

## Build on Apple Silicon macOS

Requires Xcode command-line tools, Python 3, and Homebrew packages `gmp`, `mpfr`,
`autoconf`, `automake`, and `libtool`. The measured build uses Apple Clang 21,
GMP 6.3.0, MPFR 4.2.2, and `-O3 -g -mcpu=apple-m2 -fno-omit-frame-pointer`.

```sh
make
make check
```

`scripts/bootstrap.sh` accepts `CC`, `CFLAGS`, `JOBS`, `GMP_PREFIX`, and
`MPFR_PREFIX`. Configuration flags are applied on the first configuration;
reconfigure the dependency explicitly when changing flags on an existing build.
The dependency is built locally, without installing FLINT globally. Benchmark
and profiler tooling currently targets macOS and 64-bit limbs.

## Measure

```sh
python3 scripts/benchmark.py --output results/my-baseline --unbalanced
python3 scripts/profile.py --limbs 16384 --output results/my-profile
python3 scripts/summarize_profiles.py results/my-profile/sample.txt --output results/my-profile/summary.json
```

Each benchmark case checks four operand patterns against GMP before measuring.
Timed input is a deterministic random pair, reused with warm buffers and contexts.
Runs use one FLINT thread. Cases are shuffled with a fixed seed, and the order of
FLINT and GMP batches alternates. Results retain raw samples, medians, median
absolute deviations, and environment metadata. Output directories must be new.

GMP supplies a correctness reference and performance context. The experimental
comparison uses two resident FLINT libraries and interleaved ABBA/BAAB batches,
including the whole multiplication. See the experiment report for uncertainty,
controls, and limits. Profiling runs are separate from timing evidence.

## Repository map

- `bench/mul.c`: public FLINT/GMP multiplication and squaring harness.
- `bench/compare.c`: exact checks and interleaved FLINT comparisons.
- `patches/`: isolated candidate changes against the pinned FLINT revision.
- `scripts/`: dependency setup, timing, sampling, and profile summaries.
- `results/`: raw samples, controls, correctness checks, and build fingerprints.
- `docs/experiments-m2.md`: candidate decisions and confirmed results.
- `docs/baseline-m2.md`: findings, limits, and next experiments.
- `docs/notes/brainstorm`: original discussion supplied with the project.

The theoretical repository supplies scheduling ideas and finite correctness
models. Its rank costs and asymptotic exponents do not predict CPU timings.
