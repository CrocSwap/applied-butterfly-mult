# First transform-frame experiment on M2

## Outcome

We built and verified a different retained FFT layout, then **rejected this
concrete schedule for performance**. It makes complete multiplication roughly
3% slower on M2. The prior reconstruction-fusion patch remains unchanged.

This time the experiment changes the transform itself: its 16/32-point
factorization, native SIMD grouping, physical spectral order, and matching
inverse. It retains the new order across pointwise multiplication. It is a
conventional FFT expressed in another frame, not an implementation of the
sister project's enormous finite-network construction, and it establishes no
new arithmetic-rank or asymptotic saving.

The useful research outputs are an exact finite frame model, a working pair of
private transforms, a tested layout contract, a reproducible negative result,
and a restricted obstruction to finding savings by changing the frame alone.

## Measurements

The candidate is based on pinned unmodified FLINT, without the earlier C3
reconstruction change. Two comparisons use the original eleven sizes and all
three shapes (33 cases each), with 21 interleaved ABBA/BAAB quartets per case and
a 10 ms batch calibration target. Aggregates equally weight the nine interior
sizes from 4,096 to 16,384 limbs; outer neighbors are retained in the raw data.
The [plan](../experiments/network-plan.json) was recorded before timing.

The second comparison uses a control with the same private-source duplication
and driver redirection but unchanged FFT bodies. Positive values in this table
mean **additional CPU time**, reversing the sign of the runtime-reduction
estimator stored in the result files:

| Complete operation | Versus unmodified FLINT | Versus private-copy control |
| --- | ---: | ---: |
| Squaring | 3.37% slower [2.95, 3.80] | 2.48% slower [2.22, 2.73] |
| Balanced multiplication | 3.26% slower [3.00, 3.53] | 3.19% slower [2.95, 3.49] |
| 2:1 multiplication | 3.20% slower [2.84, 3.58] | 3.21% slower [2.93, 3.49] |

Intervals are 95% circular block-bootstrap intervals. Wall-time aggregates
also show regressions in all six comparisons. Exact statistics and both clocks
are in [network-analysis.json](../results/network-analysis.json).

The unchanged-body private-copy control itself showed apparent gains of 1.10%
[0.25, 2.21] CPU for squaring, 0.34% [-0.08, 0.75] for balanced multiplication,
and 0.66% [-0.13, 1.54] for 2:1 multiplication at three sizes. This means
link/layout effects and measurement variability limit fine attribution in this
run. We do not treat that control gain as a network optimization. The candidate
loses against both references, so there is no reason to advance it to an
application benchmark or claim a small speedup hidden by the aggregate.

## What changed

FLINT already avoids the final transpose of each 16-point kernel. Its output
uses a 4-by-4 transpose of the logical bit-reversed evaluation indices. The
candidate uses a swap of the lowest two bits instead:

| Interface | Low physical bits, highest to lowest |
| --- | --- |
| Original | `i1 i0 i3 i2` |
| Candidate | `i3 i2 i0 i1` |

The candidate computes the first three layers of a 16-point transform across
eight native two-lane vectors, performs four two-by-two unpack pairs, then
computes the final layer with the corresponding twiddles. The 32-point case
uses a length-32 butterfly layer followed by two 16-point kernels. The inverse
reverses these steps. Larger and truncated transforms retain the original
recursive schedules over 256-element blocks.

Both input spectra have the same new ordering, so pointwise multiplication
preserves that ordering and the inverse consumes it directly. There is no
extra canonicalization pass hidden outside timing. Public FFT entry points and
their original index interface are preserved in their existing source files;
only the two-prime driver's calls use the private transform pair. Packing,
pointwise arithmetic, CRT, carries, and the multi-prime path are unchanged.

The full [contract](network-contract.md) records index maps, twiddle handling,
inverse scaling, truncation, integration boundaries, and finite-model limits.
The [candidate patch](../patches/network-two-lane.patch) and
[private-copy control patch](../patches/network-control.patch) apply
independently to the pinned original checkout. The patches deliberately
duplicate private transform sources to isolate this prototype; they are not
upstream-ready source organization.

## What the finite search tells us

The exact screen enumerates all **20,160 invertible binary frames on four bits**.
It checks how coordinate translations change under conjugation. In every fixed
frame, at least one of the four butterfly directions changes the physical lane
bit. The distribution is:

| Stages whose direction crosses lanes | Frames |
| ---: | ---: |
| 1 | 5,376 |
| 2 | 8,064 |
| 3 | 5,376 |
| 4 | 1,344 |

This rules out a free fixed-frame representation that keeps all four stages
within their original lane pairing. It does **not** rule out better dynamic
frames, other networks, interleaved memory operations, or butterflies that
absorb shuffles into arithmetic.

In a separate restricted register-register permutation model, both FLINT's
internal 4-by-4 transpose and the candidate's bit-0/bit-1 exchange need eight
mixed destination vectors. Thus the candidate never had a proved reduction
in that data-shuffle count. It tests whether different grouping and twiddle
placement are cheaper in compiled code. [Exact screen](../results/network-frame-screen.json).

The compiled nonzero-twiddle 16-point kernels do remove some twiddle-arrangement
shuffles, but their total instruction counts increase. The new 32-point bodies
delegate to two 16-point kernels, so comparing only their wrapper instruction
counts would be misleading. Preserved assembly and machine-readable counts
are in [network-checks](../results/network-checks/) and
[network-assembly.json](../results/network-assembly.json). These observations
suggest why the candidate loses; they do not isolate the cost of each
instruction, cache effect, or register spill.

## Correctness and provenance

- **441 direct transform cases**, comparing the original and new index maps,
  forward/inverse results, full and truncated inputs, signed extreme values,
  four primes, and depths up to 17.
- **7,620,714 coefficient checks** and **24 small cyclic convolutions** checked
  against a naive integer-modular reference.
- **338 complete multiplication cases / 4,056 exact GMP comparisons per library**,
  including squares, unbalanced products, carries, and dispatch neighbors.
- Both builds pass the four relevant upstream FLINT tests. The public FFT test
  checks the preserved public path; the direct private-transform checks and
  multiplication tests exercise the experimental path.
- The independent finite-field model checks dense DFT equality on every input
  basis vector and cyclic convolution on every basis-vector pair for four
  representative frames. It also checks that dropping a necessary basis
  conjugation changes the operator.
- All seven repository analysis/model tests pass. The
  [audit](../results/network-audit.json) checks hashes, coverage, and all 6,300
  timed batches. No prior candidate or baseline library was overwritten.

Evidence is in [network-checks](../results/network-checks/),
[whole-operation validation](../results/network-two-lane-validation.json),
`results/network-aa`, `results/network-screen`, and `results/network-confirm`.

The theory connection is specifically the sister project's
[retained-layout and conjugation audit](../../integerMult/docs/packed-movement-audit.md).
Its later [shared-sum construction](../../integerMult/docs/research/shared-computation.md)
computes a different operator under additional role/frame constraints. We
reviewed that construction, but did not substitute it for a DFT. Sister-source
hashes are retained in the audit so that this distinction stays reproducible
as that repository evolves.

## Reproduce

Use the existing M2 build prerequisites. Build names and result directories must
be new; reuse verified existing builds when working in the original workspace.

```sh
make
sh scripts/build_harness.sh
python3 scripts/network_frames.py
python3 -m unittest discover -s tests -v
python3 scripts/make_network_patch.py
python3 scripts/make_network_patch.py --control
python3 scripts/build_experiment.py network-two-lane \
  --patch patches/network-two-lane.patch --test
python3 scripts/build_experiment.py network-control \
  --patch patches/network-control.patch --test
sh scripts/check_network.sh
python3 scripts/validate.py \
  --candidate .deps/experiments/network-two-lane/libflint-experiment.dylib \
  --output results/repro-network-validation.json
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/network-control/libflint-experiment.dylib \
  --sizes 4096 8192 16384 --trials 21 --batch-ms 10 --seed 39193 \
  --output results/repro-network-aa
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --candidate .deps/experiments/network-two-lane/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 21 --batch-ms 10 --seed 59173 --output results/repro-network-screen
python3 scripts/compare.py --binary build/compare-dual --metric cpu \
  --baseline .deps/experiments/network-control/libflint-experiment.dylib \
  --candidate .deps/experiments/network-two-lane/libflint-experiment.dylib \
  --sizes 4095 4096 4097 6144 8191 8192 8193 12288 16383 16384 16385 \
  --trials 21 --batch-ms 10 --seed 27183 --output results/repro-network-confirm
python3 scripts/analyze_experiments.py \
  --runs repro-network-aa repro-network-screen repro-network-confirm \
  --output results/repro-network-analysis.json
```

`python3 scripts/analyze_network_asm.py` summarizes the preserved assembly.
`python3 scripts/audit_network.py` validates the original evidence against the
current local binaries. The generator, private patches, compiler/linker commands,
raw timing data, and exact checks are retained.

## Next bounded research experiment

The first load-fusion probe is now complete; see
[Loading FFT twiddles into their required lane order](fused-loads-m2.md).

Search for **fused shuffle-and-butterfly operations with a richer hardware cost
model**, allowing interleaved loads/stores and dynamic frames. Start with one
16-point layer transition; require the generated machine code to reduce actual
work before integrating another whole transform. Score arithmetic instructions,
twiddle loads, lane movement, register pressure, and every boundary conversion
together. A smaller count of one kind of shuffle is insufficient.

This leaves a clear open question: can a different physical network reduce
total compiled work, rather than merely replace FLINT's already efficient
retained layout? The present experiment establishes a working evaluation path,
but supplies no positive practical evidence for the finite-network construction
itself.
