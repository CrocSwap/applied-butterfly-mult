# Does the new paired-cube advantage survive practical accounting?

October 9, 2026. Sister repository pinned at
`d1d6c070f5a8c684727ee7ec35d930f9ebfa9758`.

## Decision

**No qualifying advantage appears in this bounded check.** The selected full
frame construction has a small coordinate-transform saving and much larger
scalar overhead under an explicit classical-array realization. Its scalar
side operator also loses to an ordinary shared-sum formula at all four tested
sizes. These are resource calculations and exact algebra checks, not timings.

This check addresses two distinct transfers. Stripping the frames can remove
the theorem's benefit, so we also account for the framed schedule itself.
Conversely, the full construction's enormous stock does not alone reject a
small useful extracted operator, so we test that separately.

## 1. Keep the frames: price the saving and overhead

The new completed-core sharing construction has local dimension `m=72` and
29,937 roles per group vertex. Its published child histogram satisfies:

| Quantity, per vertex and array address | Count |
| --- | ---: |
| Ordinary coordinate layers, `m * W0` | 2,155,464 |
| Child coordinate layers, `sum(r * child_count[r])` | 2,153,528 |
| Saved coordinate layers | **1,936** |
| Physical scalar mixer M, operations per invocation | 49,424 |
| Three stages, one M each: scalar-addition lower bound | **148,272** |

Let `C` be the cost per array element of one ordinary coordinate-transform layer,
and `S` the cost of one scalar addition/subtraction. Expanding each child using
ordinary coordinate transforms gives, even before other overhead:

```
candidate - ordinary >= 148272 S - 1936 C.
```

Breaking even requires **C/S > 76.59**. At equal unit costs this lower bound is
already **6.79% more work**. The 1,936 saved layers are about 0.09% of the ordinary
total. A coordinate butterfly consists of a constant amount of scalar work;
this ledger supplies no reason for a ratio above 76 on ordinary numerical arrays.
It would require a separately demonstrated resource asymmetry.

This deliberately favors the construction: it does not charge inverse mixers,
old-value corrections, normalization, address/phase adapters, group routing,
setup or recursive scheduling. The signed physical M consists of updates
combining two role values; copies into dirty roles also require additions.
The three complete stages remain paid in the sister proof.

The stock is another obstacle. Even **before** multiplying by the full ambient
group order, `29937 * 2^72` is approximately **1.414e26 coefficients**, or
**2.262e27 bytes** at 16 bytes per complex coefficient. This is the literal
classical array interpretation of the selected construction. It is not a lower
bound for every possible replacement construction or implicit representation.

The rank arithmetic was recomputed from the pinned certificate. This audit does
not independently replay the full frame compiler, or verify the all-size theorem.
Source: sister `notes/paired-cube-sharing.tex`,
`scripts/paired_cube/gauges.py`, and `certificates/paired-cube-complex-input.json`.
The sister's new general Clifford frames are explicitly acknowledged: earlier
limitations of its older rational-frame compiler should not be applied wholesale
to this revision. A quantum implementation would require a different contract
and gate accounting; the classical array ledger makes no quantum claim.

## 2. Extract the scalar operator: strengthen the conventional baseline

Ports choose one coordinate from each of three distinct pairs. For `p` pairs,
there are `v=8 choose(p,3)` ports, grouped into eight-port cubes. The construction
uses:

```
B[T,S] = (|T intersection S| - 1)/2
H = blockdiag(B) - B
K = I - blockdiag(B)
K + H + B = I.
```

The full scalar identity requires no nontrivial network if only its endpoint
is requested. We give the construction a more favorable independent task:
compute every output of **2H x**, preserving the input bank. Both algorithms
use only integer addition/subtraction; there is no hidden division or scaling.
For H itself a final division by two is common when the ring permits it.

### Actual sister program

Rebuild its signed H-channel DAG using the pinned inherited disjointness modules.
Prune nodes unused by the side outputs, omit the unrelated B centers, and charge
the additions required to assemble every output from its seven root contributions.
For p=12 the rebuilt graph's binding hash exactly matches the selected source pin.
There are 23,759 side-producer additions and 10,560 output-assembly additions.

### Ordinary shared-sum program

Let `S_c = sum(x_S for S containing coordinate c)` and `F = sum(x_S)`.
Then `2(Bx)_T = sum(S_c for c in T) - F`. Compute each cube's six half-cube sums,
reuse them to assemble the coordinate stars and total, and use the local identity

```
2(Kx)_T = 2*x_antipode(T) - sum(x_S over the opposite-parity half of T's cube).
```

This follows immediately from `K=(antipodal permutation - cube adjacency)/2`.
It supplies `2H x = 2x - 2Kx - 2Bx` without a disjointness circuit or frames.
Even charging doubling as an addition, the explicit program costs `11v-2p-1`
additions/subtractions. Further CSE or four-point butterfly optimization is
possible; optimality is not needed for this comparison.

| p | Outputs | Sister H program additions | Ordinary shared sums | Sister live temporaries | Ordinary live temporaries |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 6 | 160 | 1,880 | **1,747** | 267 | **181** |
| 8 | 448 | 6,944 | **4,911** | 807 | **505** |
| 10 | 960 | 17,094 | **10,539** | 1,780 | **1,081** |
| 12 | 1,760 | 34,319 | **19,335** | 3,370 | **1,981** |

Each binary instruction is charged two operand reads and one result write.
Temporary counts use the recorded topological order, release on last use, retain
all final outputs, and allocate a result before releasing its operands. Inputs
are external and equal on both sides. These are specified schedules, not optimal
register bounds or measured cache traffic. Alternative schedules can change
memory and locality; the arithmetic disadvantage remains for these programs.
Unequal precision, cancellation-sensitive ball arithmetic, SIMD and instruction
fusion would require their own implementation comparison.

### Adaptive baseline and checks

The first ordinary implementation used independent coordinate stars and direct
cube-neighbor sums. The p=6 sister restriction beat it, 1,880 versus 2,067
additions. We retained that result, then strengthened the ordinary implementation
with shared half-cube and parity sums. That removes the apparent win. This is an
explicit adaptive baseline refinement, not a predeclared performance trial.

Both rounds passed **45,568 exact output comparisons**: all 160 basis vectors
at p=6, plus six fixtures per size including zeros, ones, alternating signs and
signed 100-bit integers. References evaluate the dense coefficient definition
independently. The larger-size checks are finite fixtures, not exhaustive proofs;
the algebra above establishes the shared formula for arbitrary inputs.

## 3. What this closes, and what it leaves open

This does not support a CPU prototype of the selected framed construction, or
the tested scalar restrictions. Its actual rank benefit is too small for the
explicit scalar overhead, and its unframed scalar operator admits cheaper
ordinary sharing. The theorem's eventual recursive asymptotic improvement is
compatible with this finite, one-level cost disadvantage.

Other new sister mechanisms have different obstacles: the stopped product-ring
factorization's endpoint reversal/interchange is already a linear streaming
operation in RAM, while the published generic rational basis is an existence
construction rather than a cheap adapter. No new practical cost advantage is
established by that proof alone.

Two earlier negative screens deserve precise limits:

- The [erasure-code study](erasure-basis-screen.md) found memory/work tradeoffs.
  Its conservative no-resource-increase gate does not exclude a win under a real
  memory limit. No such limit or measured price was established.
- The [Gaussian-bound study](gaussian-bound-screen.md) compared certified
  iteration counts. A finite-matrix certificate can cost more to prepare than
  an analytic bound. One-shot or very large implicit operators remain a possible
  distinction, requiring full setup/solve accounting and an actual caller.

We should reopen a direct-construction experiment when one of these missing
resource conditions is concrete, rather than infer it from a rank reduction.
The practical results in the [tentative project plan](project-plan.md) remain
the leading positive findings.

## Artifacts and reproduction

- Initial scalar screen and exact source snapshot:
  `results/paired-cube-resource-screen/{screen.json,source.py}`.
- Refined scalar screen and frame ledger:
  `results/paired-cube-resource-refined/screen.json`.
- Run `python3 scripts/paired_cube_resource_screen.py --output results/NEW_NAME`
  from the project root. Existing output directories are rejected.

The inherited manifest has 1,997 fingerprints. Of these, 1,996 still match live
files. The sister README has legitimately evolved; its old fingerprint was
verified against git commit `56b66d58`, and both old and current hashes are
recorded. No historical experiment artifact was changed.
