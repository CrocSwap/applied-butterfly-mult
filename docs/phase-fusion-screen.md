# Phase-fusion screen against FLINT's small transforms

October 7, 2026. **Decision: no legal direct substitution found in the audited
`fft_small` kernels. Do not start a performance experiment for this candidate.**

The theory identity is valid, including over FLINT's prime fields. Its
prerequisites do not match the transform blocks or the internal twiddles
examined here. This is a bounded rejection of a proposed transfer, not a lower
bound on FFT optimization or a claim about every FLINT routine.

## The precise construction

The sister project's [phase-fusion audit](../../integerMult/docs/research/sparse-fusion-audit.md)
defines, on binary addresses,

```
C_v = ((1+i)/2) I + ((1-i)/2) X_v,
(X_v f)[x] = f[x XOR v],       i^2 = -1.
```

In the common Walsh basis, the eigenvalue at frequency `z` is
`i^[v dot z]`, where the exponent is binary parity. In three dimensions,
every nonzero `z` has dot product one with four of the seven nonzero
directions. Therefore

```
product over v=1..7 of C_v = I,
product over v != u of C_v = C_u^(-1).
```

This is the specific six-to-one identity selected for transfer. All factors
must act on the same array in compatible coordinates. Moving one across an
intervening operator requires a separate commutation argument.

We imported the actual sister `minimum_words`, `signature`, and `phase_value`
functions and checked all 512 three-bit phase signatures by independent full
matrix composition over each of two fields. All seven choices of the omitted
direction passed the six-to-one check in both fields. No novelty claim for
these identities, or revalidation of the multiplication theorem, is implied.

## 1. Ordinary butterflies and complete blocks fail a necessary condition

FLINT's [forward radix-2 butterfly](../.deps/flint/src/fft_small/sd_fft.c)
has matrix

```
B(w) = [ 1   w ]       B(w)^(-1) = (1/2) [ 1    1    ].
       [ 1  -w ]                          [ 1/w -1/w ]
```

The implementation leaves the inverse unnormalized. Larger radix-4 and
radix-8 macros combine these layers with their specified twiddles.

Every `C_v`, its inverse, and every product of them fixes the all-ones vector.
A scalar multiple sends it to another constant vector. This remains necessary
after arbitrary input and output address permutations, including binary frame
changes. Thus **nonconstant row sums reject the entire phase-product family**,
not just one ordering of six factors.

The probes found nonconstant row sums in all 160 kernel matrices examined:

- lengths 2, 4, 8, 16 and 32;
- twiddle indices `j = 0..7`;
- forward and inverse directions;
- primes 257 and 1108307720798209.

The C wrappers compile the pinned original macros and static leaf functions
in separate translation units. They retain the actual omitted transpose at
lengths 16 and 32. Every basis-vector output agrees both with an independent
radix-2 layer model and with dense polynomial evaluation / inverse formulas:
43,648 matrix entries checked against each model.

An additional 32 calls to the unchanged library's public transform entry
points check constant-vector behavior at lengths 2 through 256. Each returns
`[length, 0, ..., 0]`, in both directions. These are algebra probes, not timing
measurements or input-range qualification for a replacement kernel.

### Consecutive logical layers

The screen also checks 1,460 nonempty consecutive layer windows, including
inverse windows in reverse order. All fail the same constant-vector condition.
The models use the actual twiddle tables; their full-kernel predictions were
validated against the C probes above. These windows are model checks, not
instrumentation of every internal machine instruction.

There is also a general explanation for this schedule. Apply a window's
inverse to a constant vector. Its first inverse butterfly makes one half of
each pair zero. Subsequent layers operate on distinct address bits, so they
preserve that zero half. Invertibility prevents the entire result being zero.
Consequently neither that inverse nor its forward counterpart can map a
nonzero constant vector to a constant vector. This argument covers the
distinct-axis logical windows, with arbitrary nonzero twiddles.

## 2. Internal twiddles do not supply the required phase family

The connection to a familiar butterfly is exact but has a cost:

```
C = H diag(1,i) H / 2,       H = [1  1].
                                [1 -1]
```

Both surrounding Hadamard transforms matter. A single `H diag(1,w)` butterfly
does not supply this conjugation. Creating such factors would require a new
factorization with its basis changes, scaling and arithmetic counted.

Even the four-point transform's middle diagonal is different. Its source
factorization contains `D = diag(1,1,1,i)`. The exponent is `x0*x1` modulo
four. The sister's phase signatures have the form

```
q(x) = sum d_a*x_a + 2*sum b_ab*x_a*x_b  (mod 4).
```

Their quadratic coefficients are even. All 32 two-bit signatures were checked
against this diagonal in both fields: no match. This is a check of possible
phase labels in the proposed common Walsh representation, not permission to
change bases for free. The diagonal also fails to commute with each of the
three nonzero two-bit `C_v`; exact nonzero commutator entries are recorded.

The eight-point transform additionally needs genuine eighth roots in its
last layer. These are not fourth-root phases. Thus the existing twiddle
sequence cannot simply be relabeled as the selected quarter-phase identity.

## 3. Retaining a non-permutation phase breaks pointwise multiplication

The [multiplication driver](../.deps/flint/src/fft_small/mpn_mul.c) places
pointwise multiplication or squaring between the transforms. Unlike an
address permutation, `C_v` cannot be retained there with the pointwise
operation unchanged.

For distinct basis vectors `e0` and `ev`, their pointwise product is zero.
But the pointwise product of `C_v e0` and `C_v ev` is `1/2` at both addresses
0 and `v`. This is an exact counterexample in both fields; squaring also fails.

More generally, an invertible linear map preserving componentwise
multiplication on every input is a coordinate permutation: different basis
vectors must have disjoint image supports, and idempotence forces each
nonzero entry to be one. Some products of `C_v` are permutations (for example
`C_v^2 = X_v`); those remain legal and do not establish the proposed
non-permutation phase transfer. A different bilinear middle operation would
be a separate algorithm requiring its own cost and correctness analysis.

## Scope and consequence

This pass covers the `fft_small` implementation used in our earlier practical
experiments, selected complete leaves, its standard logical layer schedule,
and the proposed common retained phase across pointwise multiplication.
It does not exhaust:

- arbitrary refactorizations or irregular overlapping subgraphs;
- all large truncated-transform boundary formulas;
- FLINT's other transform implementations;
- applications outside FLINT that already use the exact `C_v` operators.

The direct-substitution hypothesis fails before timing. We therefore made
no optimization patch and have no new speedup to report. The earlier FLINT
results remain unchanged. Reopening this candidate requires an explicit
factorization showing compatible factors and accounting for every basis
change, or a real call site that already executes the required operators.

## Reproduction and evidence

- [Screen runner](../scripts/screen_phase_fusion.py), [probe driver](../bench/phase_probe.c),
  [forward wrapper](../bench/phase_probe_forward.c), [inverse wrapper](../bench/phase_probe_inverse.c).
- [Recorded plan](../results/phase-fusion-screen/plan.json),
  [raw basis probes](../results/phase-fusion-screen/raw.jsonl),
  [summary and rejection witnesses](../results/phase-fusion-screen/summary.json).
- [Internal barrier checker](../scripts/check_phase_barriers.py),
  [barrier results](../results/phase-fusion-screen/barriers.json).

The runner records compiler arguments and hashes the source, binary, raw data,
baseline library and sister modules. Ninety prior evidence fingerprints
passed before and after the screen. The baseline library retains its recorded
SHA-256. FLINT source and all previous measured artifacts were left unchanged.

From the repository root, use a fresh output directory:

```sh
python3 scripts/screen_phase_fusion.py --output /tmp/phase-fusion-screen
python3 scripts/check_phase_barriers.py --screen /tmp/phase-fusion-screen --output /tmp/phase-fusion-screen/barriers.json
```
