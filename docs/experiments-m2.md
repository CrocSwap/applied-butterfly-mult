# Three practical experiments on Apple M2

Follow-up: [reconstruction ablations and an uncached pi workload](ablations-m2.md).

## Result

**Retain C3's eight-coefficient reconstruction fusion.** Complete squaring wall
time fell by 2.99% and 2.91% in two separate confirmation runs; both aggregate
95% confidence intervals have lower endpoints above 1%. This meets the
[goal](../experiments/objective.txt). The change is preserved as an isolated
[FLINT patch](../patches/c3-register-reconstruction.patch).

The measured interval is 4,096–16,384 64-bit limbs (262,144–1,048,576 bits).
Nine fixed sizes inside that interval contribute equally to each aggregate:
4,096, 4,097, 6,144, 8,191, 8,192, 8,193, 12,288, 16,383, and 16,384.
Each run also includes the two outer neighbors, 4,095 and 16,385, and balanced
multiplication and 2:1 products at all eleven sizes. These are sampled sizes;
the result does not establish a minimum gain at every integer size.

| Whole-operation metric | Run 1 reduction, 95% CI | Run 2 reduction, 95% CI |
| --- | ---: | ---: |
| Squaring, wall time | **2.99% [1.94, 4.11]** | **2.91% [2.02, 3.74]** |
| Squaring, thread CPU time | 3.26% [2.99, 3.54] | 3.10% [2.85, 3.34] |
| Balanced multiplication, wall time | 1.43% [-0.02, 2.77] | 1.40% [0.00, 2.53] |
| Balanced multiplication, thread CPU time | 2.18% [2.00, 2.39] | 2.13% [1.92, 2.34] |
| 2:1 multiplication, wall time | 2.00% [0.77, 3.13] | 2.22% [1.16, 3.24] |
| 2:1 multiplication, thread CPU time | 2.17% [1.97, 2.35] | 2.56% [2.30, 2.82] |

Positive percentages mean less runtime. Ordinary multiplication's wall-time
evidence is less precise than squaring's. Exact values are in
[confirmation-analysis.json](../results/confirmation-analysis.json); each run
retains raw batches and separate wall/CPU summaries:
[run 1](../results/c3-register-confirm-1/metadata.json),
[run 2](../results/c3-register-confirm-2/metadata.json).

## What was tried

| Candidate | Proposed saving | Evidence and decision |
| --- | --- | --- |
| C1: native two-lane butterfly schedule | Expose independent NEON lane groups to the compiler | Assembly changed from 191 to 190 instructions, with no stack accesses in either. Apparent screen gains did not persist in confirmation. **Reject.** |
| C2: pointwise/inverse fusion | Produce spectral products immediately before their inverse subtrees consume them | Exact fused/reference checks pass, but the screen showed no stable interval of improvement and some regressions. **Reject this implementation.** |
| C3: reconstruction tiling | Consume normalized Garner components near their production, carrying continuously across tiles | The initial 128-coefficient version was weak/noisy. Revising it to consume eight coefficients directly, with SIMD conversion and an unrolled carry update, produced the confirmed result. **Retain the revision.** |

Patches apply independently, rather than cumulatively:
[C1](../patches/c1-native-lanes.patch),
[C2](../patches/c2-fused-inverse.patch),
[C3 initial](../patches/c3-tiled-reconstruction.patch), and
[C3 retained](../patches/c3-register-reconstruction.patch).
The [algebraic/layout contracts](experiment-contracts.md) explain lane mapping,
truncation, normalization, aliasing, and carry ordering.

The retained patch changes the two-prime multiplication driver's reconstruction
when the lower output bound is zero and coefficient width is below 64 bits.
It avoids writing normalized components back across the private double arrays,
converts eight components to integer vectors, and immediately feeds the carry
accumulator. Local temporaries can still spill. The existing exported
reconstruction routine remains available to other callers.

This is a concrete use of compatible producer/consumer representations. It
does not implement the sister project's finite network theorem or change the
asymptotic complexity. FLINT already uses a sophisticated transform layout.

## Correctness and build isolation

The baseline is FLINT commit `657a2839cf0125164859ff102b1f124abcb87ce0`,
built with Apple Clang 21, GMP 6.3.0, MPFR 4.2.2, and
`-O3 -g -mcpu=apple-m2 -fno-omit-frame-pointer`. The machine is an Apple M2
with 24 GiB RAM, running macOS 26.6.2. Each candidate replaces only its changed
objects in a separate dylib with a unique install name. The baseline source
and library are preserved. A control library is relinked from unchanged objects
in the same order.

- The retained patch passed **4,056 exact GMP comparisons per library**, over
  338 cases spanning 1–65,537 limbs, carry/transform/dispatch boundaries,
  squares, balanced products, and ratios 2:1, 3:1, and 100:1.
  Patterns include all ones, alternating limbs, sparse limbs, and nine random
  inputs. [Validation evidence](../results/c3-register-validation.json).
- All candidates passed FLINT's `sd_fft`, `mpn_ctx_mpn_mul`, and
  `mpn_ctx_to_from_ffts` tests. C2 and both C3 versions also passed
  `_mpn_ctx_mpn_mul_range`.
- C2 additionally passed 906 direct fused/reference cases comparing
  35,859,968 coefficients bit-for-bit, including full/truncated inverses,
  signed extremes, and aliasing for squares.
- Every timing case also checks twelve exact patterns against GMP for each
  library before measuring. Build manifests and test outputs are preserved
  in [candidate-checks](../results/candidate-checks/).

## Timing reliability and scope

Both libraries are loaded in one process and share the same operand and output
buffers. Contexts and buffers are warm; FLINT uses one thread. Equal-size
batches alternate ABBA and BAAB, with 41 quartets per confirmation case and a
20 ms calibration target. Case order is shuffled with separate fixed seeds.
The [confirmation plan](../experiments/c3-confirmation-plan.json) was recorded
before the two confirmation runs. Thread CPU time was the primary metric;
wall time was retained throughout both runs.

For each quartet, average the two times for each library and take the log of
their ratio. Aggregate equally across the nine fixed sizes. A circular moving
block bootstrap resamples consecutive quartets within each case (up to five
quartets per block, 4,000 draws). Report `100 * (1 - exp(-mean_log_ratio))`.
The intervals describe temporal variability for these fixed cases, conditional
on this machine and setup. They are not simultaneous guarantees for every
operand size or estimates of variation across machines.

The initial unchanged-versus-unchanged runs preceded candidate measurement.
Concurrent system/user CPU load later made wall measurements unreliable:
one QoS-only A/A case misleadingly showed about a 2% gain. That failed control
is retained. The dual-clock harness requests user-initiated macOS QoS without
core pinning and also records thread CPU time, which excludes descheduling.
No other user's processes were stopped.

In the six-case dual-clock A/A control, every individual CPU interval included
zero. The squaring aggregate was +0.06% [-0.46, +0.56]; the balanced product
aggregate was -0.31% [-0.57, -0.03], a small negative bias. Corresponding wall
aggregates were -0.20% [-1.12, +0.71] and -0.94% [-2.17, +0.23]. The controls
limit the precision we can claim, but do not explain the repeated 3% squaring
gain. CPU time is whole-kernel execution time, not application latency.

### Boundary survey and final control

All 66 CPU-time point estimates across the two confirmations (including outer
neighbors and all three shapes) are positive: 1.48–4.53% in run 1 and
1.61–3.61% in run 2. No individual wall-time or CPU-time interval lies wholly
below zero in those runs; several wall-time point estimates are negative and
uncertain, so this is not a claim of uniform wall-time improvement.

The final 30-case survey covers 999, 1,000, 1,001, 1,399, 1,400, 1,401,
32,768, 40,000, 40,001, and 65,536 limbs for all three shapes. It is a short
screen (15 quartets, 10 ms target), not an additional confirmation interval.
One CPU interval is wholly negative: squaring 999 limbs, -0.63% [-1.18, -0.15].
That size dispatches to the unchanged GMP square path (FFT squaring starts at
1,400 limbs); it cannot be attributed to the new reconstruction arithmetic.
This is retained as evidence of small timing/layout effects outside the changed
path. All other CPU intervals either include zero or show a gain. In particular,
results above 40,000 limbs do not justify extending the confirmed interval.
[Survey data](../results/c3-register-boundaries/summary.csv).

The final unchanged-versus-unchanged squaring control at 4,096, 8,192, and
16,384 limbs gives CPU reduction -0.06% [-0.53, +0.35], with all three
individual intervals including zero. Its wall-time aggregate is much noisier:
+1.52% [-1.62, +4.87]. This reinforces the preference for CPU time when
attributing the optimization; wall-clock repeatability under arbitrary system
load remains limited. [Final controls and survey analysis](../results/final-checks-analysis.json).

## Reproduce

Use Apple Silicon macOS with the prerequisites listed in [README](../README.md).
Experimental build names and output directories must be new. The commands below
use fresh names so the preserved evidence is not overwritten. Build experiments
sequentially and avoid running compilation or analysis during timing.

```sh
make
sh scripts/build_harness.sh
python3 scripts/build_experiment.py repro-control
python3 scripts/build_experiment.py repro-c3 \
  --patch patches/c3-register-reconstruction.patch --test
python3 scripts/validate.py \
  --candidate .deps/experiments/repro-c3/libflint-experiment.dylib \
  --output results/repro-validation.json
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/repro-control/libflint-experiment.dylib \
  --sizes 4096 8192 16384 --operations mul sqr --trials 41 --batch-ms 20 \
  --output results/repro-control
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/repro-c3/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 41 --batch-ms 20 --seed 55117 --output results/repro-confirm-1
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/repro-c3/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 41 --batch-ms 20 --seed 98231 --output results/repro-confirm-2
```

Each metadata file contains the exact run arguments, environment, and library
and harness hashes. Build manifests retain compiler/linker commands. The
analysis script reproduces the stored confirmation summaries; use its run-name
arguments to analyze fresh runs. Early wall-only harness source snapshots and
binary fingerprints are preserved in [tooling](../results/tooling/manifest.json).

```sh
python3 scripts/analyze_experiments.py
python3 scripts/analyze_experiments.py --runs repro-control repro-confirm-1 repro-confirm-2 \
  --output results/repro-analysis.json
```

The original evidence and local binaries can be checked with
`python3 scripts/audit_experiments.py`. Its
[completion audit](../results/completion-audit.json) verifies baseline/patch/
binary hashes, exact-check counts, quartet ordering, equal batch iterations,
confirmation coverage, and both improvement gates. Four analysis unit tests
also [pass](../results/candidate-checks/analysis-tests.txt).

### Measurement archive

Each listed directory contains `metadata.json`, `raw.jsonl`, and `summary.csv`.

- Controls: `results/control-aa-1`, `control-aa-2`, `control-aa-qos`,
  `control-aa-dual`, and `control-aa-post`.
- C1: `results/c1-screen`, `c1-confirm`.
- C2: `results/c2-screen`.
- C3 initial: `results/c3-screen`, `c3-confirm-1`.
- C3 retained: `results/c3-register-screen`, `c3-register-confirm-1`,
  `c3-register-confirm-2`, and `c3-register-boundaries`.

## Next experiment

**Separate the contributions of fusion, SIMD conversion, and carry-loop
simplification.** Build three ablations against the retained patch and measure
the same fixed cases with the same controls. That will show how much of the gain
comes from avoiding array traffic versus instruction selection and branching.
Then test the surviving change in a real high-precision workload on a quiet
machine. This prototype is M2-specific (it uses NEON vector internals); portable
code and broader workload evidence are needed before proposing it upstream.
