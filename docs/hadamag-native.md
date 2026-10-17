# Native Float64 non-rigidity WHT experiment in HadaMAG

## Decision

**Stop H4/H8 integration in its present form.** The non-rigidity circuits beat
HadaMAG's Julia fallback on this M2, but lose decisively to conventional native
butterflies. None passed the predeclared gate requiring a kernel advantage over
all ordinary baselines. No complete SRE timing or application speedup is claimed.

This follows the [application survey](application-survey.md), which found a large
Walsh-transform runtime fraction in complete SRE calls. It tests the existing
Float64 contract, without raising precision to favor the construction.

There is a useful conventional optimization lead: fused native butterflies are
substantially faster in this replay. Qualifying that backend in complete exact SRE
calls would be the practical follow-up. It would carry conventional attribution.
For a stronger construction-transfer story, the survey's accuracy-driven
clustering lead remains more relevant than these machine-precision circuits.

## What was implemented

All transforms are in-place, natural binary order, and unnormalized. Native
transforms allocate no heap memory and use no persistent lookup table or scratch.

| Family | Implementations |
|---|---|
| Actual installed backend | Pinned HadaMAG Julia/LoopVectorization fallback |
| Ordinary native butterflies | Iterative radix2; recursive radix2, radix4, radix8; fused iterative radix4 and radix8 |
| Non-rigidity circuits | H4 and H8, each with recursive and flattened iterative schedules |

H4/H8 use the same identities as the frozen theta non-rigidity experiment. H4
uses seven additions/subtractions and a halving per four-input merge; H8 uses
22 additions/subtractions and a halving per eight-input merge. Both require
power-of-two scaling at the leaves. Scaling and all traversal costs are included.
The iterative versions compute the leaf scaling exponent from the number of
nonzero base-4/base-8 digits of the appropriate input index. They do not precompute
weights outside the measured call.

This uses the **older Alman–Rao non-rigidity construction**, not a new construction
from the sister project. The current theoretical investigation supplied the
research/discovery path. The existing attribution and source audit are retained in
[the Walsh non-rigidity report](walsh-nonrigidity.md).
[Alman–Rao paper](https://arxiv.org/html/2211.06459v2)

FFHT was inspected at `fba727a3ff72c862260460631ae1cc8e3e44e861`.
Its `fht_impl.h` selects AVX or SSE implementations, both containing x86 inline
assembly; neither is a native ARM competitor available unchanged. FFHT was not
benchmarked, ported, or emulated. The native conventional implementations above
provide the stronger local comparison; this is not an x86/GPU/MPI result.
[Inspected FFHT dispatch](https://github.com/FALCONN-LIB/FFHT/blob/fba727a3ff72c862260460631ae1cc8e3e44e861/fht_impl.h)

## Actual application inputs

The eight immutable states from `results/application-survey/cases.json` are reused:
exact SRE2 at 10, 12 and 14 qubits, and Monte Carlo SRE2 at 16 qubits, each at random
brick-wall circuit depths 2 and 8. The package and its source remain unchanged.

A hook copies the transform input **before** calling the original backend at eight
evenly spaced transform-call ordinals, including the first and last, in each public
call. The complete capture call is compared with an uninstrumented call and must
return an identical answer. All 64 captured vectors, their ordinals, original state
hashes, seeds and call outputs are saved. The MC run uses the previous profiling
budget of 13 beta points and 256 samples, not a new statistical accuracy claim.

Each timed transform starts by copying one saved vector into a reusable output
buffer. Both that copy and the Julia/native function-call overhead are included.
Inputs are cycled; transformed outputs are never reused as fresh inputs. These
are actual kernel inputs but a limited replay working set, not complete caller
execution or a representative survey of quantum states.

## Results

The flattened H4 implementation (`h4i`) was the best non-rigidity candidate at all
eight cases. Fused iterative radix4 (`i4`) was the strongest declared ordinary
implementation at the three smaller lengths; radix8 (`i8`) was strongest at 65,536.
The table gives paired wall-time changes, not a ratio inferred across experiments.

| Transform length | Source call | H4i time reduction vs Julia, two depths | H4i **extra time** vs stronger native ordinary, two depths |
|---:|---|---:|---:|
| 1,024 | Exact SRE2, 10 qubits | 57.38–57.66% | 92.11–93.21% |
| 4,096 | Exact SRE2, 12 qubits | 56.28–56.37% | 81.74–83.74% |
| 16,384 | Exact SRE2, 14 qubits | 51.59–53.68% | 70.29–79.72% |
| 65,536 | MC SRE2, 16 qubits | 52.17–54.47% | 58.74–59.83% |

H4i therefore takes about **1.59–1.93 times** as long as the stronger ordinary
implementation. Every corresponding CPU and wall interval excludes an H4i gain.
For example, the 16-qubit depth-8 case has an H4i wall-time reduction of **−58.74%**
[95% interval −60.38%, −57.15%] against `i8`, and CPU reduction **−58.88%**
[−60.37%, −57.37%]. Negative reduction means a slowdown.

All four non-rigidity implementations were compared directly with all seven
ordinary baselines at every workload. **Zero of 32 candidate/workload combinations
passed.** Full per-pair CPU and wall summaries are in `summary.json`; the H4i table
is extracted in `decision-table.json`. Neither the selection of the strongest
ordinary implementation nor these exploratory confidence intervals establishes
optimality among all possible native WHT implementations.

There is no newly measured complete-SRE gain here, and no complete output/accuracy
qualification of a replacement backend. Reusing the earlier profile fraction to
predict a full-call saving would be an estimate, not an experimental result.

## Method, controls and validation

Environment: Apple M2, macOS 26.6.2, Julia 1.10.10, one Julia thread and one BLAS
thread. Apple clang 21.0.0 builds all native variants identically with
`-O3 -mcpu=apple-m2 -fno-fast-math -ffp-contract=off`. The actual Julia backend uses
the previously recorded default runtime target `apple-m1` on M2. Backend comparisons
therefore include differences in compilation and traversal, not just arithmetic
counts. The C-to-C comparisons isolate the construction more closely.

Before timing, the sources, binaries, captures, numerical validation and inherited
historical artifacts were frozen: **1,660 fingerprints**. There were 232 comparison
pairs: 224 candidate/baseline pairs and eight identical-`r8` controls. Each used
12 alternating ABBA/BAAB quartets with a common repetition count calibrated to at
least approximately 10 ms per batch and 100 ms warmup per implementation. Pair
order was shuffled with a fixed seed. This totals **11,136 timed batches**. Garbage
collection was disabled only during the replay quartets; input creation, loading,
compilation and analysis were outside timing. Other task work was paused during
the benchmark.

CPU and wall changes use geometric means of per-quartet ratios and 4,000 circular
moving-block bootstrap draws (three-quartet blocks). These are exploratory,
unadjusted per-comparison intervals. A positive screen would have required an
independent 24-quartet confirmation against every baseline before full-call timing.
No candidate qualified, so that branch was not run.

Seven of eight identical-function wall controls include zero. The 16-qubit depth-8
control shows a small apparent slowdown of 0.84% (interval 0.09–1.57%); another
control has a wide interval. Thus this run is not a basis for sub-percent claims.
The observed 59–93% deficits to the stronger ordinary implementations are much
larger than these control deviations.

Correctness checks passed:

- **1,584 exact checks** across all eleven implementations: independent direct
  Walsh character signs for every basis vector through length 64, and exact dyadic
  random inputs at every binary length from 1 through 65,536.
- **704 captured-vector comparisons** with a 256-bit BigFloat reference. All
  outputs were finite. The largest component error over every implementation was
  1.84e-16; the largest error divided by
  `eps(Float64) * log2(N) * sum(abs(input))` was below 0.083. This is an observed
  error diagnostic, not a relative-error guarantee near zero or a certified SRE
  error bound.
- **170 native transforms** under AddressSanitizer and UndefinedBehaviorSanitizer,
  with exact dyadic equality checks and no reported issues.

Only the finite bounded inputs relevant to this experiment were qualified. Leaf
scaling changes intermediate magnitudes; these implementations are not asserted
to have identical overflow/underflow behavior on arbitrary Float64 inputs.

## Interpretation and next steps

The experiment confirms the importance of the conventional native comparator:
beating the existing fallback alone would have made the construction look useful,
while ordinary stage fusion wins by a much larger margin. Fewer additions do not
by themselves imply faster Float64 execution. These schedules also pay for
scaling, index work, traversal and SIMD scheduling. The measurements do not isolate
which of those costs dominates, and do not prove that every future H4/H8 schedule
must lose.

The bounded construction experiment is complete. If pursuing the practical track,
the next task is a direct Julia-versus-ordinary-native comparison in **complete
exact SRE calls**, including public API allocation, independent small-case Pauli
checks, and full-output numerical diagnostics. Treat Monte Carlo separately since
rounding changes can alter its acceptance trajectory. That work would test a
useful native backend optimization with conventional attribution.

For the construction-specific objective, first obtain genuine clustering
likelihood tables and reproduce its reported cancellation issue. Do not infer
that a WHT circuit solves a subset-convolution accuracy problem without an explicit
operator mapping and comparison with stable conventional methods.

## Artifacts

- `bench/hadamag_native.c`: ordinary and non-rigidity native kernels.
- `bench/hadamag_native.jl`: actual input capture, independent numerical checks,
  replay timing and the unchanged HadaMAG backend hook.
- `bench/hadamag_native_check.c`: native sanitizer/equality checks.
- `scripts/hadamag_native.py`: frozen protocol, execution, paired analysis,
  confirmation gate and preservation audit.
- `results/hadamag-native/`: captures, validation, compiler/assembly records,
  binaries, raw timing, summaries, audit, and completion manifest.

All historical records and installed default libraries are preserved. This report
supersedes the survey's prospective H4/H8 next-step recommendation without editing
that frozen historical report.
