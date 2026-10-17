# Actual theta intermediate replay: scratch lifetime

## Decision

Persistent scratch recovers a modest, construction-specific **kernel** advantage on
actual intermediate vectors from synthetic theta evaluations. This justifies a
bounded workspace integration experiment. It does not establish a new complete
theta-call improvement, and no default library was changed.

H4 beat both ordinary kernels in all eight captured workloads, with positive CPU
and wall confidence intervals in the fixed confirmation pass. H8 was attractive
at genus three but did not reliably beat both ordinary kernels at genus six.

This follows the negative full-call experiment in `theta-nonrigidity.md`: its
H4/H8 implementations allocated and cleared scratch for every transform. Here
each implementation can retain scratch through the complete captured sequence.

## Capture and validation

The instrumented library starts from the existing equal-bank candidate and retained
batch source. It serializes the inputs **before** each top-level AGM or QL transform,
without changing the transform, including call-site identity, order, size, working
precision, and exact Arb representations of both complex components. Recursive
children are not separately captured.

Eight complete `acb_theta_jet` calls use the same deterministic, coupled dyadic
period fixtures as the earlier experiment:

| Workload | Requested precision | Fixtures | Captured transforms per call | Actual transform precision |
|---|---:|---:|---:|---:|
| Genus 3 squared constants | 512 | 2 | 22 | 512–2,138 |
| Genus 6 squared constants | 512 | 2 | 76 | 512–2,448 |
| Genus 4 squared constants | 2,048 | 2 | 34 | 2,048–10,967 |
| Genus 3 mixed four-point batch | 512 | 2 | 88 | 512–2,140 |

These are real intermediates from the implementation, **not** period matrices from
the Elkies–Kieffer application. That application-data dependency remains unresolved.

All 9,344 public outputs were bitwise equal between the instrumented and original
libraries. All eight calls met the existing requested-precision-minus-32 accuracy
criterion without retries. The 440 captured transforms contain 8,192 complex inputs.

An independent dense signed-sum oracle computes centers and sums of input radii
with exact dyadic arithmetic. Every kernel output contains the entire independent
input box componentwise: **65,536 checks** across four kernels, under ASan/UBSan
for the replay code. This is stronger than checking output overlap. It does not
prove a future integrated algorithm will preserve full-call accuracy: changed
intermediate enclosures can affect later calculations.

## Timing contract

The frozen `theta_nonrigidity_kernel.h` supplies iterative and recursive ordinary
WHTs and the Alman–Rao H4/H8 circuits. Inputs, order, and precision are identical.
There is no circuit tuning between initial and confirmation passes.

Two scratch modes are compared:

1. Initialize and clear scratch for every transform.
2. Initialize scratch at the start of the captured call sequence, reuse it through
   every transform, and clear it at the end. All initialization and destruction
   are timed; scratch is not retained across sequences.

Both modes reuse one output buffer outside timing. Both ordinary baselines receive
the same reuse opportunity. Scratch contains 1, 1, 6, or 16 complex balls respectively.
Input-to-output copying and all power-of-two scaling are timed.

This is deliberately a replay diagnostic: it excludes intervening theta work,
uses a shared warm output buffer, and replays identical inputs on every repetition.
A future integration must supply the workspace across actual call boundaries and
handle nesting/lifetime explicitly. Captured inputs come from the original circuit;
downstream inputs are not recomputed from each alternative's earlier outputs.

The diagnostic runs H4/H8 directly at every captured precision and size. Unlike the
previous application patch, it **does not** fall back to recursive ordinary WHT
above 4,096 bits or below the gadget's natural base size. Consequently the genus-four
high-precision replay is not an exact replay of that patch's dispatch. The six
512-bit-request cases remain entirely below 4,096 working bits.

Initial timing: 76 comparisons, 19 alternating ABBA/BAAB quartets each.
Confirmation: all 32 construction comparisons and all four controls, 31 quartets
each; no favorable-case selection. Both use 200 ms warmup and equal repetitions
calibrated to at least 10 ms for the slower variant. CPU and wall intervals use
4,000 circular moving-block bootstrap draws. Timing ran separately from compilation,
validation, and analysis. Total: **10,240 timed batches**.

## Results

The table gives confirmed CPU reductions. Each fixture is compared separately
against **both** persistent ordinary kernels; the displayed range uses the smaller
point estimate for each fixture. These are replay-sequence reductions, not complete
theta reductions or simultaneous confidence bounds.

| Captured workload | H4 vs both ordinary baselines | H8 vs both ordinary baselines |
|---|---:|---:|
| Genus 3 constants, 512 bits | 2.32–3.85% | 4.20–6.28% |
| Genus 6 constants, 512 bits | 1.08–2.85% | −0.41–0.59%; inconclusive |
| Genus 4 constants, 2,048 bits | 4.18–4.50% | 1.88–2.77% |
| Genus 3 mixed batch, 512 bits | 1.69–1.72% | 3.91–4.38% |

H4: 16/16 individual CPU and wall intervals positive. H8: 15/16 CPU intervals
positive, 13/16 positive for both metrics; all failures to clear both metrics were
genus six. These are marginal intervals, without a multiple-comparison correction.

Initial scratch-only comparisons explain why reuse matters. For genus-three
constants, it reduced H4 replay time by about 17–18% and H8 by about 25%, versus
roughly 5–7% for ordinary kernels. For genus six the corresponding savings were
about 2.8% and 6.6–6.9%, versus roughly 0.4–1.0% for ordinary kernels. Those
scratch-only comparisons were not independently confirmed.

The initial iterative same-function genus-three control showed a spurious
+0.635% CPU reduction, CI [+0.006%, +1.138%], and +0.696% wall reduction,
CI [+0.087%, +1.218%]. It is retained in the record.
All four confirmation controls had CPU and wall intervals including zero. One
genus-six H8 comparison had a wide wall interval despite a positive CPU interval;
it is not classified as a confirmed win. No additional rerun was used to clean up
controls or marginal cases.

## Interpretation and next experiment

The results support scratch allocation/lifetime as **one material contributor** to
the failed full-call transfer. They do not establish it as the sole cause: input
structure, complex arithmetic, output-buffer lifetime, cache effects, and intervening
work differ from the earlier real-ball microbenchmarks and from a complete call.

The opportunity remains small. Applying the per-fixture replay reductions against
recursive ordinary WHT to the earlier measured recursive-helper fractions gives
rough opportunity estimates of 0.04–0.07% for genus-six H4 and 0.13–0.20% for
genus-three H8. These are estimates using instrumented fractions from a different
run, not observed application gains. Setup, workspace plumbing, accuracy changes,
and a stronger ordinary baseline can consume them.

Next: give the ordinary and H4/H8 implementations equal per-context workspace
lifetime in a small set of complete theta calls, preserving the existing accuracy
and retry contract. Start with the two genus-three constants and two genus-six
constants fixtures at 512 bits; retain reconstruction and same-function controls.
Do not expand to another broad sweep unless that test establishes a reproducible
complete-call benefit. The wider ordinary cleanup and leading equal-bank/product-first
results remain separate candidates.

Attribution remains unchanged: these are explicit older **Alman–Rao non-rigidity
circuits**, reached through the current theoretical investigation. Reusing scratch
is conventional implementation work. This is not evidence that a distinctive new
OpenAI/sister-project construction has become competitive in FLINT.

## Reproduction and artifacts

- `scripts/theta_replay.py`: capture-library build, serialization, validation,
  initial timing, analysis.
- `bench/theta_replay.c`: replay, exact enclosure oracle, scratch-lifetime comparison.
- `scripts/confirm_theta_replay.py`: one fixed confirmation pass.
- `results/theta-replay/`: captures, validation, frozen plans, raw timing, summaries.
- `.deps/experiments/theta-replay/`: instrumented source, objects, library, derived
  capture harness, and build logs.

Stages are `build`, `measure`, `analyze`; confirmation stages are `prepare`,
`measure`, `analyze`. Existing directories/raw files are intentionally protected
against overwrite. A new run requires new destinations.

The initial and confirmation audits passed 1,352 and 1,357 fingerprints respectively,
including inherited historical artifacts. Reports and completion metadata are
additive; older source, patches, results, and default libraries remain unchanged.
