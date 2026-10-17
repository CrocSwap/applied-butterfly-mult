# Explicit non-rigidity circuits with Arb arithmetic

## Result — 8 October 2026

**Retain both circuits for a bounded FLINT application experiment.** The
Alman–Rao H4 and H8 constructions reduce CPU time in the tested 512- and
4,096-bit real-ball Walsh transforms. Both lose at 32,768 bits against the
stronger conventional baseline. No full application or installed FLINT routine
has been changed by this experiment.

Confirmation medians, eight cases per row (8, 64, 512 and 4,096 points; two
input fixtures per size):

| Requested output accuracy | H4 CPU time reduction | H8 CPU time reduction |
|---|---:|---:|
| 512 bits | 7.61% | 6.66% |
| 4,096 bits | 10.18% | 8.57% |
| 32,768 bits | **−5.04%** | **−29.86%** |

Positive numbers mean less CPU time. These are medians over the tested cases,
not predicted savings for an application mix.

At 512 and 4,096 bits, all 32 candidate/case CPU intervals were positive;
31/32 were positive for both CPU and wall time. The smallest H8 gain at 512
bits was 0.73%, with a wall interval including zero. At 32,768 bits every
candidate/case CPU point estimate was negative. The highest precision is
therefore outside the promising region, not an extrapolation target.

The 64-point results are particularly relevant to genus-six theta kernels:

| Accuracy | H4 CPU reduction, two fixtures | H8 CPU reduction, two fixtures |
|---|---|---|
| 512 bits | 11.75%, 12.72% | 12.21%, 12.42% |
| 4,096 bits | 12.47%, 12.49% | 9.17%, 11.19% |

These are synthetic real-ball kernels, not captured theta intermediates.

## Construction and attribution

We implemented Algorithms 9 and 5 of
[Alman and Rao, *Faster Walsh-Hadamard and Discrete Fourier Transforms From Matrix Non-Rigidity*](https://arxiv.org/html/2211.06459v2).
They decompose a small Walsh matrix into low-rank and sparse parts, share work
between those parts, and carry powers-of-two scaling through the recursion.
Their H4 variant trades more additions for cheap scaling; H8 improves the
leading total-operation coefficient asymptotically.

The authors' [verification code](https://github.com/kevinrao99/WHT-and-FFT-from-Non-Rigidity)
is pinned at `241124ea6863b2e7a28972e9362e98e8186e8dd4` under
`results/walsh-nonrigidity/sources/`, with its MIT license. Our Arb implementation
follows the published formulas. The published H8 code was also checked on all
255 basis vectors across lengths 1–128, including its operation counters.

This is a direct implementation of a published non-rigidity construction, with
measured benefits in one arithmetic setting. It is not a novel Walsh algorithm,
a first practical implementation claim, or an implementation of a new OpenAI
or sister-project construction. The integer-multiplication investigation and
external review led us to this experiment; the specific mathematical algorithm
must be credited to Alman–Rao.

The upstream multiplication manuscript's `05-layers.tex` also targets tensor
products of two-point normalized Walsh factors, via phase-conjugate kernels,
finite networks and recursive routing. This gives a concrete shared operator
and broad design idea. The present experiment does not establish equivalence
of those network constructions, their resource models or their asymptotic
results. The objective of a competitive application requiring a distinctive
new construction remains open.

## Finite-size costs

The exact implemented counts below include scaling at the leaves; they do not
substitute the asymptotic leading coefficient for the finite circuit cost.

| Points | Butterfly additions | H4 additions / halvings / leaf scales | H8 additions / halvings / leaf scales |
|---:|---:|---:|---:|
| 8 | 24 | 22 / 2 / 6 | 22 / 1 / 7 |
| 64 | 384 | 336 / 48 / 63 | 352 / 16 / 63 |
| 512 | 4,608 | 4,096 / 512 / 510 | 4,224 / 192 / 511 |
| 4,096 | 49,152 | 43,008 / 6,144 / 4,095 | 45,056 / 2,048 / 4,095 |

Subtractions count as additions. A leaf scale is one multiplication by a
nontrivial power of two, fused with the required copy from input to output.
Arb performs these scales exactly by adjusting the exponent. They still have
copying and bookkeeping costs, and are not counted as free in the table.

The finite total counts are larger than ordinary butterflies at all four
tested sizes. The observed benefit relies on their different actual costs,
not fewer operations of all kinds.

The two baseline implementations are iterative and recursive butterflies,
both using one reusable temporary ball. H4 uses six temporaries and H8 uses
sixteen. All keep natural binary output order, preserve the input, and use
separate output storage. Recursion does not allocate arrays. Output and
scratch storage are initialized outside timing and reused; underlying Arb
arithmetic and any allocation it performs remain inside timing.

More live values, copying and memory behavior could explain the losses at
32,768 bits. We have not collected counters or established that explanation.
The result rejects the simple expectation that increasing arithmetic precision
must make these circuits more competitive.

## Numerical contract and checks

Each output must satisfy `arb_rel_one_accuracy_bits >= target`: relative
accuracy for large outputs and an absolute-error condition near zero. This is
not strict relative accuracy for a nearly cancelled output.

Every implementation starts at `target + log2(N) + 8` working bits. It advances
by 16 bits if an output fails the contract, with a fixed 256-bit extra cap.
The timed operation includes the input copy/scaling, transform, accuracy scan
and any retries. No timed case needed a retry. The same contract, input and
initial precision apply to every algorithm.

Measured fixtures are:

- Dense signed dyadic centers, with full-length random mantissas.
- Centers near one with small random perturbations, producing cancellation
  in the nonconstant Walsh outputs.

Each coefficient also has an independent input radius. Additional numerical
checks use constant exact input and a single impulse. The exact-integer oracle
computes the Walsh transform of the dyadic centers; for lengths at most 128 it
is cross-checked with direct character sums. The oracle then adds the exact
image radius of the entire input box, and checks containment in each output.

ASan/UBSan validation passed **204 comparisons and 217,608 output-enclosure
checks**, covering all logarithms 0–10 at 128 bits plus every measured input.
The new harness and kernels were instrumented; the linked FLINT library was
not rebuilt with sanitizers.

Wider error bounds remain a material limitation. Across the 24 measured inputs,
the sum-of-radii ratio versus ordinary butterflies had median/max:

| Circuit | Median ratio | Maximum ratio |
|---|---:|---:|
| H4 | 3.73 | 12.68 |
| H8 | 7.14 | 22.01 |

Despite this, every measured output met the requested accuracy with at least
two spare bits. A surrounding adaptive algorithm may react differently to the
wider enclosures. Kernel qualification does not remove the need to check that.

## Timing and controls

Machine: Apple M2; pinned native FLINT library and the project's existing
`clang -O3 -mcpu=apple-m2` flags. All work is single-threaded. Compilation,
validation, timing and analysis ran in separate phases.

The screen used 76 comparisons, 19 ABBA/BAAB quartets each, 200 ms joint warmup,
and equal repetitions calibrated to 20 ms per batch. It compared all three
other implementations against iterative butterflies, plus four same-function
controls.

For each input case, the faster conventional implementation by screening CPU
point estimate became the confirmation baseline. **All 48 H4/H8 cases** were
carried forward, plus the four controls. Confirmation used 31 quartets and an
independently shuffled comparison order. No favorable candidate-only subset
was selected. Total: **12,224 timed batches**.

Intervals use the existing 4,000-replicate moving-block paired bootstrap. They
are marginal intervals, not simultaneous bounds across the sweep.

Controls were not uniformly clean:

- The initial 4,096-point iterative same-function control showed −1.88% CPU
  reduction, with interval [−2.71%, −1.19%].
- In confirmation that control included zero. The 64-point iterative control
  showed +0.37% CPU, [0.05%, 0.71%]; its wall interval included zero.
- Both H4 confirmation controls included zero for CPU and wall time.

These controls limit subpercent interpretations. The multi-percent gains at
4,096 bits are the stronger practical signal. There was no third rerun aimed
at obtaining clean controls.

`scripts/audit_walsh_nonrigidity.py` independently recounted raw point estimates,
checked ABBA/BAAB order and baseline selection, verified all cases were retained,
and verified 970 fingerprints, including frozen preceding results. Audit: PASS.

## Artifacts and next experiment

- Kernels: `bench/walsh_nonrigidity.h`.
- Numerical/timing harness: `bench/walsh_nonrigidity.c`.
- Driver: `scripts/walsh_nonrigidity.py`.
- Raw measurements, plans, validation and audit:
  `results/walsh-nonrigidity/` and its `confirmation/` subdirectory.

The next bounded application experiment should carry both candidates into
complex-ball theta transforms at the tested moderate precisions. Its essential
ablation is an ordinary butterfly implementation with the same allocation and
scratch improvements. Compare complete theta calls against that baseline,
record attained accuracy/retries, and profile the affected time fraction.

Do not credit allocation savings to the non-rigidity gadget, enable it at all
precisions, or add these kernel percentages to previous complete-call gains.
The real genus-six E4 application remains separately awaiting its period input;
see [E4 preparation](theta-e4.md).
