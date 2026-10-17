# Reproducing the FLINT optimization campaign

The five patches can be applied to a clean FLINT checkout at
`26b9bc9df973206db15616d0849a4c8be9d22059`, individually or in numbered order,
using `git apply`. Build FLINT normally for the target platform and run the
affected upstream tests. The focused test additions are part of the patches.

The convenience commands below reproduce the campaign on macOS/Apple M2.
They require Python 3, Apple clang, Git, make, patch, FLINT's bootstrap
dependencies, and Homebrew GMP/MPFR. Use a **fresh copy** of `reproduce/` as the
working directory; the scripts deliberately reject existing candidate/result
directories. Other architectures need appropriate compiler flags and build
adaptations. No performance result on another architecture is implied.

## Build

From `reproduce/`:

```sh
python3 scripts/setup_optimization_campaign.py
python3 scripts/optimization_campaign.py build control
python3 scripts/optimization_campaign.py build sqr-fallthrough ../patches/0001-nmod-matrix-square-dispatch.patch
python3 scripts/optimization_campaign.py build interpolation-inverse ../patches/0002-nmod-interpolation-batch-inversion.patch
python3 scripts/optimization_campaign.py build evaluate2-dot ../patches/0003-ball-evaluation-derivative-dot.patch
python3 scripts/optimization_campaign.py build interpolation-leaves-v2 ../patches/0004-interpolation-scalar-leaves.patch
python3 scripts/optimization_campaign.py build hyperbolic-inverse-v2 ../patches/0005-hyperbolic-series-shared-inverse.patch
python3 scripts/optimization_campaign.py build combined-v1 ../patches/*.patch
python3 scripts/optimization_campaign.py build combined-asan-v1 --sanitize ../patches/*.patch
python3 scripts/optimization_campaign.py build combined-without-leaves-v1 ../patches/0001-nmod-matrix-square-dispatch.patch ../patches/0002-nmod-interpolation-batch-inversion.patch ../patches/0003-ball-evaluation-derivative-dot.patch ../patches/0005-hyperbolic-series-shared-inverse.patch
```

Build the measurement executables:

```sh
python3 - <<'PY'
import sys
import subprocess
sys.path.insert(0, 'scripts')
from optimization_campaign import ROOT, BASE, FLAGS, INCLUDES, LIBS
(ROOT / 'build').mkdir(exist_ok=True)
for source, binary in [
    ('optimization_campaign.c', 'optimization-campaign'),
    ('optimization_series.c', 'optimization-series-v2'),
    ('optimization_campaign_diagnostic.c', 'optimization-campaign-diagnostic')]:
    subprocess.run(['clang', *FLAGS, '-Wall', '-Wextra', *INCLUDES,
        str(ROOT / 'bench' / source), str(BASE / 'libflint.25.0.dylib'),
        *LIBS, '-Wl,-rpath,' + str(BASE), '-o', str(ROOT / 'build' / binary)], check=True)
PY
```

The build helper substitutes changed module objects into an otherwise unchanged
baseline. `build.json` records commands, source hashes and resulting library
hashes. The `control` build only relinks unchanged objects.

## Correctness

```sh
for build_name in combined-v1 combined-asan-v1; do
  python3 scripts/optimization_campaign.py test "$build_name" nmod_poly_mat nmod_poly_mat_sqr nmod_poly_mat_sqr_interpolate nmod_poly_mat_sqr_KS nmod_poly_mat_pow
  python3 scripts/optimization_campaign.py test "$build_name" nmod_poly nmod_poly_interpolate_nmod_vec nmod_poly_interpolate_nmod_vec_fast nmod_poly_evaluate_nmod_vec_fast
  python3 scripts/optimization_campaign.py test "$build_name" gr_poly gr_poly_interpolate gr_poly_interpolate_fast
  python3 scripts/optimization_campaign.py test "$build_name" arb_poly arb_poly_evaluate2 arb_poly_evaluate2_rectangular arb_poly_interpolate_fast arb_poly_sinh_cosh_series arb_poly_exp_series
  python3 scripts/optimization_campaign.py test "$build_name" acb_poly acb_poly_evaluate2 acb_poly_evaluate2_rectangular acb_poly_interpolate_fast acb_poly_sinh_cosh_series acb_poly_exp_series
done
python3 scripts/optimization_campaign.py test combined-v1 nmod_poly_mat nmod_poly_mat_sqr nmod_poly_mat_sqr_interpolate nmod_poly_mat_pow --threads 4
```

The same test commands can target the relevant standalone candidates. Logs,
commands and binary fingerprints are written under `.deps/optimization-builds/`.
To reproduce the expected baseline square failure, compile the patched
`nmod_poly_mat/test/main.c` against the original library and select
`nmod_poly_mat_sqr`; the exact original command and failure are preserved in
`evidence/sqr-regression/result.json` in the package.

## Performance

Finish builds, tests and profiling before timing. Run **one measurement job at
a time** with no other campaign computation. Analyze only after measurement
has exited. All examples create fresh results; never overwrite recorded runs.

An initial-family confirmation:

```sh
python3 scripts/run_optimization_screen.py prepare results/repeat-initial-1 --suite initial --phase confirmation --trials 31 --batch-ms 20 --input-seed 231973 --order-seed 71003
python3 scripts/run_optimization_screen.py measure results/repeat-initial-1
python3 scripts/run_optimization_screen.py analyze results/repeat-initial-1
```

Use seed/order `539871/91007` and a new directory for its second run. This suite
compares the square, batch-inversion and derivative changes against the original
library, with unchanged-relink and same-function controls.

The later candidates and combined series use the unchanged relink as their
primary comparator:

```sh
python3 scripts/run_optimization_screen.py prepare results/repeat-series-1 --suite series --phase confirmation --baseline-build control --trials 31 --batch-ms 20 --input-seed 570891 --order-seed 358717
python3 scripts/run_optimization_screen.py measure results/repeat-series-1
python3 scripts/run_optimization_screen.py analyze results/repeat-series-1
```

Use `713961/794617` for the second series run. Use `--suite combined` with
`915731/175917` for the 42-case combined check. For the 18-case incremental leaf
check, use `--suite interaction --baseline-build combined-without-leaves-v1`
and `659723/338371`. Keep `--trials 31 --batch-ms 20` and use a new directory
for each plan.

The more conservative fresh-process audits are required for interpreting the
derivative and small interpolation gains:

```sh
python3 scripts/run_process_optimization_audit.py prepare results/repeat-process-1 --input-seed 915731 --order-seed 423081
python3 scripts/run_process_optimization_audit.py measure results/repeat-process-1
python3 scripts/run_process_optimization_audit.py analyze results/repeat-process-1
```

Repeat with `231973/359713` and a new directory. Each audit runs 360 processes
in 15 process quartets for each of six cases. It retains every process and uses
the same complete-call harness with both timed slots bound to one selected
library. The archived two-library diagnostics are available for comparison;
their unfavorable outcomes must not be silently filtered from the report.

The benchmark takes 11 command-line arguments including its name:
`kind baseline-library candidate-library size length-or-coefficient-bits precision modulus-or-fixture seed trials batch-ms`.
`trials=0` performs correctness only. The series fixture selects a zero constant
(0), a nonzero constant (1), shortened input (2), a highest-degree monomial (3),
or a low-degree input (4). Allocation inside the public function is timed;
fixture construction and independent reference computation are outside timing.

Raw data, frozen plans, source snapshots, both clock summaries, and bootstrap
code are included. The delivered archive's `SHA256SUMS` can be checked with
`shasum -a 256 -c SHA256SUMS` from its root. The baseline library and historical
experimental binaries remain in the original workspace; their hashes and build
commands are included rather than bundling platform-specific binaries.
