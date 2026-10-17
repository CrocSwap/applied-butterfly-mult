# Tentative project plan: from theoretical inspiration to practical gains

Agreed direction, October 9, 2026. This is a working research and presentation
plan; performance claims retain the qualifications in their experiment reports.

## Main story

**Theory → inspiration → applied mathematics → engineering → measured gains.**

The integer-multiplication investigation directed attention to representations,
shared intermediate values, signed transforms and the cost of moving between
them. Applying those questions to FLINT exposed useful algebra and repeated
work. Implementing and measuring the resulting algorithms produced practical
improvements on selected workloads.

The strongest demonstrated results use established mathematical identities and
ordinary implementation techniques. The documented discovery path connects
them to the theory investigation. We cannot establish that others would not
have discovered them independently, or attribute their speedups to the new
asymptotic bound or its distinctive finite constructions.

## Lead examples

| Example | Mathematical step | Engineering step | Measured complete-operation result |
| --- | --- | --- | --- |
| Theta evaluation | Signed-product/Walsh reformulation; quotient by equal-bank symmetry | Reuse prepared transforms at valid precision; specialize identical banks | Nonzero-point batches: median CPU reductions 3.65–5.84% across the tested batch groups. Squared constants: genus-group medians 4.38–9.13% versus original FLINT |
| Polynomial matrices | Identify the same reduced spectral input across output columns | Prepare each reusable left input once, preserve contiguous products | CPU reductions 4.34–15.09% across all 30 eligible tested cases, with positive intervals in both confirmation runs |
| Integer squaring | Preserve reconstruction/carry equivalence while combining stages | Fuse reconstruction and carry propagation, eliminate intermediate materialization | Approximately 3% complete squaring wall-time reduction in two confirmation runs on sampled 262k–1M-bit operands |

Evidence: [theta batches](theta-batch.md), [equal-bank theta](theta-equal.md),
[polynomial matrices](prepared-inputs-m2.md), [integer reconstruction](experiments-m2.md).
The theta figures describe different input conditions and are not additive.
The matrix patch replaces the earlier tiled candidate. All measurements are
from one M2 and selected workloads; experimental patches remain isolated.

### Attribution to preserve

- **Theta:** the theory-inspired search led to this operator and its shared
  signed transforms. The product-first identity has prior art; external review
  proposed exploiting the established equal-input symmetry.
- **Polynomial matrices:** the investigation of retained intermediates helped
  focus the search on repeated reductions. The implementation uses conventional
  common-subexpression reuse and locality improvements.
- **Integer reconstruction:** the original discussion of layouts and
  materialization motivated investigating adjacent representation stages.
  Fusion and carry engineering provide the actual measured saving.

This is numerical algorithm work spanning applied mathematics and engineering.
The published account should explain both contributions rather than assign a
precise percentage to either discipline.

## One final bounded construction check

Before selecting another application, establish a surviving resource advantage
for an actual construction. Charge arithmetic, conversions, scratch, output
placement, movement and restoration under the same input/output contract.
Use strong ordinary algorithms, including cancellation when the payload permits
it. A tradeoff can qualify if a real constraint or measured resource price makes
it favorable; improvement in every resource is not required.

The [October 9 resource audit](paired-cube-resource-screen.md) examines the newly
available paired-cube construction at sister commit `d1d6c070`. It finds no
qualifying advantage for either its explicit classical frame realization or
the tested scalar restrictions. It therefore does not authorize another
performance prototype merely on the strength of its rank saving.

Reopen this line only with a concrete change: a compact replacement for the
full cover, a much cheaper scalar schedule, a genuine accuracy benefit, or an
application whose representation makes the saved operation unusually expensive.
Previous memory/work tradeoffs remain unresolved under actual capacity limits;
their failed conservative gate is not an impossibility theorem.

## Practical follow-through

1. Assemble the three lead examples into a concise account with the algebra,
   discovery chronology, implementation changes, raw evidence and prior-art
   attribution side by side.
2. Prepare the theta patch for maintainer review, including correctness scope,
   dispatch conditions, accuracy checks and retained timing controls.
3. Seek a second architecture and a genuine complete downstream caller for the
   strongest eligible paths. Keep synthetic fixtures clearly identified.
4. Treat derivative workloads, the published genus-six invariant computation,
   and complete polynomial-matrix callers as qualification work requiring their
   own baseline and opportunity profile.

No claim of universal FLINT acceleration, a reproduced inverse-Galois workload,
or a competitive direct application of the sister construction is supported yet.

