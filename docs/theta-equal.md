# Equal-input all-characteristic theta multiplication

## Result and decision

**Retain the equal-bank specialization as an experimental extension of the
combined theta patch.** Confirmation supports additional CPU savings on the
sampled squared theta constants. It does not establish a broad gain on nonzero
points or mixed batches, nor absence of regressions across FLINT.

These are medians over two deterministic fixtures per genus, at 512-bit working
precision, for complete public calls computing all squared constants:

| Genus | Additional CPU reduction versus current combined patch | Total CPU reduction versus original FLINT |
| ---: | ---: | ---: |
| 1 | 1.37% | Not measured in this campaign |
| 2 | 0.90% | 4.38% |
| 3 | 0.95% | 5.27% |
| 4 | 1.63% | 6.60% |
| 6 | 2.07% | 9.13% |

These are independently measured comparisons, not added percentages. All ten
additional-savings cases have positive CPU intervals in confirmation; nine
also have positive wall intervals. All eight original-FLINT comparisons have
positive CPU and wall intervals. Genus-six additional CPU savings are 1.99%
and 2.15%, with intervals [0.91, 2.93]% and [1.50, 2.75]%. Genus-six total
savings are 8.93% and 9.33%, with intervals [8.57, 9.30]% and [8.88, 9.73]%.
The two fixtures are not a representative workload distribution.

The initial screen and confirmation both give positive CPU point estimates
for every 512-bit squared-constant case. Initially, eight of ten incremental
CPU intervals exclude zero, versus ten of ten in confirmation. Seven of eight
total-savings CPU intervals exclude zero initially, versus eight of eight in
confirmation. Significance did not repeat in every individual case.

The initial 2048-bit screen has additional savings of 2.44–4.36% across its
eight genus-1/2/3/4 cases, all with positive CPU and wall intervals. Those cases
were not repeated in confirmation. Initial ordinary genus-2/3 constants have
0.61% median additional CPU savings, while mixed four-point batches have 0.26%;
neither group supports a confirmed broad claim.

### Coverage and opportunity limits

The baseline profile finds one equal-bank all-characteristic kernel call per
squared-constant evaluation. For genus six that kernel occupies approximately
4.3–4.7% of complete-call CPU time, making the measured roughly 2% incremental
saving plausible. In contrast, ordinary genus-six values take approximately
9.4–10.6 seconds per baseline public call while the eligible kernel occupies
only 0.037–0.044%. The pre-timing resource gate excludes their repeated timings,
while retaining both fixtures' successful numerical validation and diagnostics.

The nonzero-point and single-characteristic controls have no equal-bank
all-characteristic calls. This patch does not add the same percentage to our
earlier nonzero-point batch results; it improves a specific input condition.

### Controls and limitations

Both same-function controls include zero in CPU and wall intervals in both
campaigns. Initial timing nonetheless has an unchanged-source rebuild control
at -2.21% CPU (interval [-3.86, -0.47]%) and an inactive nonzero-point control at
-0.72% ([-1.44, -0.05]%). These are preserved, not discarded.

In confirmation, all nonzero-point and single-characteristic CPU control
intervals include zero. One unchanged-source rebuild control shows -0.44%
CPU ([-0.83, -0.05]%) and -0.41% wall ([-0.80, -0.007]%). The previously flagged
rebuild fixture includes zero. This documents remaining timing/build-layout
sensitivity; it does not establish a stable algorithmic regression. It limits
precise subpercent attribution. No universally clean controls or regression-free
behavior are claimed, and no further run was used to obtain a clean outcome.

The evidence is from one Apple M2, warm repeated inputs, selected well-conditioned
matrices, and derivative order zero. It does not reproduce the published
genus-six inverse-Galois application, measure derivatives, compare specialized
genus-one algorithms, or establish time to a user-specified accuracy with
automatic precision retries. Working precision is held constant; measured
output accuracy did not decrease. All builds remain isolated. Nothing has
been submitted upstream or installed as the default library.

## Construction and scope

The external research review identified a standard symmetry that the current
product-first patch did not exploit. For an identical input bank `x`,

\[
R(k,a)=\sum_b(-1)^{a\cdot b}x_{b\oplus k}x_b.
\]

For nonzero `k`, the products are invariant under `b -> b XOR k`. Characters
with `a.k` odd vanish, while the others are twice a Walsh transform on the
quotient by the two-element subgroup `{0,k}`.

The implementation chooses the lowest set bit `j` of `k`. Representatives have
bit `j` zero. After a length-`n/2` transform on those representatives, the output
character is reconstructed by inserting the unique bit `a_j` making `a.k`
even. The other outputs are set to exact zero. The `k=0` row uses `n` squares
and a length-`n` transform. The existing recursive Hadamard helper is reused.

For `n=2^g`, the multiplication/squaring count falls from `n^2` to
`n(n+1)/2`. The transform addition/subtraction count falls from `n^2*g` to
`n*g + (n-1)*(n/2)*(g-1)`, with additional exact doublings, index mapping,
and output zeroing. These are algebraic counts, not CPU instruction counts.

Dispatch requires identical input pointers. Equal values in distinct banks
take the general path, and a request for squared theta values is not itself
evidence that the two banks are identical. The `all=0` implementation and
the general distinct-bank loop are unchanged.

The additional patch is `patches/theta-equal-bank.patch`. It applies after
`patches/theta-direct-walsh.patch`; the measured candidate also includes
`patches/theta-batch-retained.patch`. The comparison baseline is that existing
combined candidate, not the original unoptimized implementation. Separate
comparisons measure the combined change against original FLINT.

## Numerical reasoning

For each exact vector represented by the input balls, the symmetry is an
identity. Sharing the same uncertain vector preserves that identity, so odd
characters can be set to zero even when individual input balls have nonzero
radii. The remaining products, sums, and squares use FLINT's ordinary rigorous
ball operations. The final multiplication by two is exact.

No cached-input identity, lifetime, or precision rule changes. In particular,
the existing batch wrapper preserves pointer equality when it passes shared
midpoints into the AGM kernel. Its conservative input-error inflation remains
in place; it may add a radius to a zero midpoint after this kernel returns.

## Qualification protocol

The exact-oracle harness passes 1,060,800 containment checks over 768 calls,
including 259,080 exact odd-character zeros. It also verifies 536,520 unchanged
coefficient enclosures on the general/all=0 paths. All five upstream tests pass.
The 34 independent public-call fixtures check 18,706 outputs; minimum
`rel_one` accuracy never decreases. Summed component-radius ratios range from
0.733183988 to 1.0, but 1,761 individual output enclosures are wider, so uniformly
tighter outputs are not claimed. Nonzero-radius oracle cases check containment
of exact midpoint inputs, alongside the algebraic enclosure argument above.

The evidence audit passes, verifies 927 preserved fingerprints, and independently
recomputes paired point estimates from 9,424 timed batches across 76 comparisons.
Its PASS status certifies evidence integrity and numerical checks, not universally
clean performance controls.

- Isolated libraries on the same Apple M2 and pinned FLINT baseline as the
  earlier theta reports. Original sources and historical libraries are preserved.
- Candidate replaces only the AGM multiplication object; it reuses the exact
  retained-cache `ql_exact` object. An unchanged AGM-source rebuild provides a
  linking/layout control.
- Independent dense exact complex-dyadic oracle, random/cancellation/sparse
  patterns, genus 0 through 7, working precisions 64/128/512/2048, equal and
  distinct banks, nonzero input radii, and both output modes.
- AddressSanitizer and UndefinedBehaviorSanitizer cover the compiled candidate
  kernel and its exact-oracle harness, not every object in the linked library.
- Five upstream tests: `agm_mul`, `agm_mul_tight`, `ql_exact`,
  `jet_notransform`, and `jet`.
- Complete public `acb_theta_jet` calls, derivative order zero; deterministic
  coupled, well-conditioned period matrices. Squared constants cover genera
  1/2/3/4 at 512 and 2048 bits, plus genus 6 at 512 bits, with two fixtures each.
  Additional cases cover ordinary constants, mixed four-point batches, and
  inactive paths.
- Independent direct theta-series reference at 64 additional working bits,
  plus output accuracy and radius diagnostics. The initial derivative-oriented
  `sum_jet` reference exceeded FLINT's ten-million-point limit at genus six.
  Qualification therefore uses `acb_theta_sum`, which splits the series by
  characteristic, on unchanged inputs and at unchanged reference precision.
- Coverage and kernel CPU fractions come from separate instrumented libraries.
  These diagnostic fractions include instrumentation overhead.
- Uninstrumented timing uses two resident libraries, equal repetitions,
  200 ms joint warmup, at least 20 ms batch calibration, and 31 alternating
  ABBA/BAAB quartets. Both thread CPU and monotonic wall clocks are recorded.
- Confirmation repeats the complete predefined 512-bit squared-constant slice,
  original-baseline comparisons, and controls. It does not select cases based
  on timing results. Intervals are marginal per-case moving-block bootstrap
  intervals, without a multiple-comparison adjustment.

## Attribution

This is an established equal-input Walsh symmetry, closely related to vanishing
odd theta constants. The external review supplied the specific next experiment;
our earlier theory-directed investigation supplied the theta implementation and
qualification framework. No new phase-frame or finite-network construction is
required, and no mathematical or implementation priority is claimed.

## Next experiment

The next application target is the genus-six Eisenstein-series stage
`E4 = sum(theta_ab(0,tau)^8)` in Elkies and Kieffer's
[Fast evaluation of Riemann theta functions in any dimension](https://arxiv.org/html/2505.22382),
Section 6. Use the squared-value interface and sum fourth powers, then compare
the same invariant and required accuracy. Obtaining the actual period matrices
and reproducing that stage remain outstanding. The authors' public
[comparison harness](https://github.com/j-kieffer/theta-implementations) measures
a single characteristic, so it would not exercise this patch unchanged.

## Reproduction

Use fresh output/build directories; the script refuses to overwrite a campaign.

```sh
python3 scripts/theta_equal.py prepare
python3 scripts/limit_theta_equal.py
python3 scripts/theta_equal.py measure
python3 scripts/theta_equal.py analyze
python3 scripts/theta_equal.py confirm-prepare
python3 scripts/theta_equal.py confirm-measure
python3 scripts/theta_equal.py confirm-analyze
python3 scripts/audit_theta_equal.py
```

Timing commands run without concurrent compilation, reference calculations,
analysis, or research activity by this agent. Earlier preparation failures are
retained in `results/theta-equal-prepare0` (test-harness compilation) and
`results/theta-equal-prepare1` (the direct-series reference cutoff), not included
as timing campaigns.

The pre-timing resource gate excludes cases where a baseline public call takes
over one second and the eligible kernel accounts for under 0.1% of runtime.
The original plan, removed cases, and baseline-only profiles are retained in
`plan-before-resource-gate.json` and `resource-gate.json`. Numerical qualification
is retained for these cases. This gate does not use candidate speedup estimates.
