# A direct construction transfer: paired exclusion circuits for short paths

October 7, 2026. This is a bounded construction-to-workload search and a
standalone C prototype. It changes no FLINT code or previously measured kernel.

## Finding

We exported the actual paired exclusion circuit from `../integerMult`, and used
it to compute the maximum weight and exact number of maximizing **simple
six-edge paths between fixed endpoints** in a directed graph. This is a complete
graph computation, including construction of the two path halves and their
combination, rather than timing the exclusion primitive alone.

On dense synthetic graphs with integer edge weights in `[-1000,1000]`, the
paired circuit beat both independent controls at the tested **15, 19, 23, and
27 vertex sizes**, on three held-out graph seeds in each of two confirmation
runs. Removing the theory construction's specific feature—retaining internal
vertex weights through its recursion—increased time. Keeping it saved
**1.9–4.7% of complete solve CPU time** relative to that ablation. Every one of
the 24 feature comparisons had positive CPU and wall-time confidence intervals.

This is the closest construction-level transfer in this project so far. It is
not a deployment result, a FLINT improvement, or a claim to the fastest known
short-path solver. The benchmarks use small synthetic graphs and reusable
circuit plans. Larger and highly tied graphs often favor another algorithm.

## What came from the theory

The source is the sister project's
[paired circuit](../../integerMult/scripts/paired_exclusion_circuit.py),
described in its [paired-network note](../../integerMult/docs/research/paired-network.md).
The local operator is

```
y[c,d] = sum of x[a,b] over pairs {a,b} disjoint from {c,d}.
```

The construction groups vertices into pairs. Edges between groups become
coarse edges; edges within groups become vertex weights. Those weights stay
inside the recursive computation. Fine-level strips and a remaining cross
edge reconstruct each output. Every addition combines disjoint source supports.

The practical prototype imports that exact circuit generator, prunes unused
nodes, compacts node numbers and evaluates its additions in C. It preserves
the paired decomposition and retained weights. There is no newly invented FFT
analogy between the two implementations.

We transfer the **finite addition circuit**, not its reversible embedding,
rational frame proof, rank deficit, or asymptotic multiplication algorithm.
Its disjoint-support property permits replacing ordinary addition by another
associative, commutative operation without double-counting inputs.

### Why this is not a novelty claim

Disjoint summation and its application to maximum-weight path counting were
already studied by [Kaski, Koivisto and Korhonen (2012)](https://arxiv.org/abs/1208.0554).
[Sergeev (2012)](https://igorssergeev.github.io/papers/1209.1645e.pdf) gives a
stronger circuit construction. The later
[four-author 2014 paper](https://doi.org/10.1016/j.ipl.2013.12.003) also uses
packing of ground-set elements. These are essential prior art, not evidence
that applying exclusion sums to paths is new.

Our defensible provenance statement is narrower: **the particular circuit
developed in the sister project's theory work led us to this implementation,
and a feature of that circuit produces a measured benefit**. We have not
established that its pairing/weight mechanism is absent from all earlier work.
This is a descendant of the local theory refinements, not a claim that this
practical circuit appeared in the original multiplication paper.

## Matching the application exactly

For each possible middle vertex `v`, a six-edge path has the form

```
s -> a -> b -> v -> c -> d -> t.
```

Exclude `s`, `v`, and `t` from the pair universe. For every unordered pair
`{a,b}`, compute the best left half in either order and count the orders
attaining that weight. Do the same for each right pair. Each half is already
simple. Joining them yields a simple path exactly when their pairs are disjoint.
Every complete path has a unique middle vertex, so summing across middles is
also exact.

A value is `(weight, count)`. Addition keeps the greater weight and adds counts
on a tie; multiplication adds weights and multiplies counts. The zero value
means no path. Apply the exclusion circuit to the left-half values, multiply
each output by the corresponding right-half value, and combine all results.

The C prototype uses exact bounded integer arithmetic. Tested graph sizes are
at most 67 vertices, with edge weights at most 1000 in magnitude. A path has six
edges and the number of paths is bounded by the number of ordered selections
of five interior vertices; the 64-bit weight/count representation suffices.
The separate Python exact-map screen also tests negative, missing, tied and
distinct-weight edges using arbitrary-precision arithmetic.

## Candidate screen and rejected matches

| Theory mechanism | Candidate computation | Decision in this pass |
| --- | --- | --- |
| Paired exclusion with retained weights | Modular/integer exclusion sums | Reject: total minus two incident sums plus the shared edge is simpler. Checked exactly. |
| Same paired circuit | FLINT ball arithmetic and magnitude bounds | No existing matching operator found in inspected routines. Cancellation avoidance alone does not supply a workload. |
| Same paired circuit | Maximum-weight/count simple paths | Exact match; implemented and compared against circuit and data-specific controls. |
| Retained address frames | Ordinary FLINT transform convolution | Existing experiments already found a correct slower candidate. No new eliminated movement identified here. |
| Quadratic phase signatures / fused parity butterflies | Existing FFT kernels | The sister identities have specific constant directional operators; no compatible block in the inspected workload was established. Defer. |
| Reverse complementary frames / shared dirty scratch | Conventional CPU execution | These prove legal rank accounting and scratch restoration. No CPU bottleneck matched in this pass. |
| Short-guard gathering reduction | Packed data movement | The sister work still lacks the required faster gatherer. It does not supply a ready practical primitive. |

The scoped FLINT inspection included `arb_mat/bound_inf_norm.c`,
`arb_mat/bound_frobenius_norm.c`, `acb_poly/validate_roots.c`,
`acb_poly/find_roots.c`, and `acb_poly/interpolate_barycentric.c`.
Their row reductions, root overlap tests and interpolation products are not the
pair-exclusion linear map. This is not an exhaustive impossibility claim about
FLINT. Existing network and prepared-input experiment conclusions remain intact.

## Controls

1. **Published construction.** A specialization of Section 2 of Sergeev's 2012
   paper to two-element inputs and exclusions. It merges the first and last
   vertices, carries their internal edge on a designated coarse edge, and repairs
   exclusions that touch the merged vertices. All formal output coefficients
   are checked. This is our implementation of the construction, not the authors'
   optimized software, and does not exhaust the later literature.
2. **Ordered-region circuit.** Divide the remaining vertices into the intervals
   before, between and after the excluded pair. Precompute the six disjoint
   triangle/rectangle edge regions using prefix/suffix sums. This ordinary
   cancellation-free alternative is slower in the initial screen.
3. **Data-specific failure tree.** Find a heaviest edge class and its total and
   incident multiplicities. Subtract the excluded incidences to count surviving
   edges of that weight. If none survive, at least one endpoint of a chosen
   heaviest edge was excluded. Recurse with it forced absent. Depth is at most
   two and there are at most seven nodes for all pair queries. This exploits
   information unavailable to a generic semigroup circuit. It legitimately
   subtracts *counts*, without subtracting maximum values. It often wins.
4. **Retained-weight ablation.** Keep the same recursive pairing, but compute
   exclusions of its internal vertex weights separately and merge them back.
   The scalar evaluator, graph processing and output semantics are unchanged.
   Node ordering and memory access change along with the construction; this
   measures the feature's implementation effect, not a pure instruction count.
5. **AA.** Pass the identical paired plan to both engines at two sizes.

The first failure-tree implementation zeroed its entire fixed-capacity node
array at every middle vertex. We improved it to initialize only live storage
before confirmation. Initial evidence and source are retained separately.

### Exact addition counts

Here `n` is the pair universe; the graph has `n+3` vertices.

| n | Paired | Sergeev specialization | Paired, weights separate |
| ---: | ---: | ---: | ---: |
| 8 | 142 | 144 | 142 |
| 12 | 414 | 453 | 446 |
| 16 | 842 | 926 | 912 |
| 20 | 1,402 | 1,561 | 1,540 |
| 24 | 2,112 | 2,361 | 2,324 |
| 49 | 9,813 | 11,023 | 10,873 |

The n=8 paired and ablated circuits have equal counts but different node order.
They are **not** an AA control; their performance differs. An initial assertion
that their exported plans were identical caught this before confirmation timing.
The pre-timing artifacts remain in `results/theory-paths-confirm-initial`.

## Confirmation results

Each range below spans three new graph seeds and two timing runs, **not** a
pooled confidence interval. Positive values mean less CPU time for the paired
circuit. The graphs are dense, directed, with independently generated integer
weights in `[-1000,1000]`.

| Graph vertices | Versus published construction | Versus improved failure tree | Retained weights versus ablation |
| ---: | ---: | ---: | ---: |
| 11 | −3.70 to −3.00% | 32.51 to 36.56% | −2.38 to −1.81% |
| 15 | 5.37 to 6.49% | 23.46 to 26.18% | 1.89 to 3.77% |
| 19 | 8.15 to 10.56% | 14.02 to 18.06% | 2.00 to 2.24% |
| 23 | 15.45 to 15.92% | 14.70 to 19.07% | 3.61 to 4.08% |
| 27 | 16.51 to 19.99% | 6.00 to 16.25% | 3.14 to 4.69% |

At each of the four positive sizes, all six comparisons against each control
have positive 95% CPU and wall-time intervals. The percentages against different
controls cannot be added.

For a representative 19-vertex held-out graph (seed 9400033):

| Comparator | CPU reduction, run 1 (95% interval) | Run 2 (95% interval) |
| --- | ---: | ---: |
| Published construction | 8.60% [8.19, 8.97] | 8.74% [8.09, 9.39] |
| Improved failure tree | 15.88% [15.35, 16.43] | 15.73% [15.26, 16.14] |
| Separate-weight ablation | 2.00% [1.55, 2.47] | 2.03% [1.81, 2.25] |

The complete paired solve takes roughly 29–30 microseconds on this graph.
In the ablation comparison it saves roughly half a microsecond.

The identical-plan CPU controls range from −0.53% to +0.52%. One of twelve
CPU intervals excludes zero; some wall intervals do too. This residual
measurement variation is retained and is not interpreted as an arithmetic
effect. The feature's positive results are larger, repeat across seeds/runs,
and have intervals above zero, but the intervals do not capture every possible
systematic measurement error.

### Negative evidence

At 11 vertices the older construction is faster despite having slightly more
additions. On the wider screen of 19, 35, 52 and 67 vertices, equal-weight,
heavily tied and sparse graphs frequently favor the failure tree. At 67 vertices
with weights in `[-2,2]`, the paired implementation takes about twice its CPU
time. Even the broad-weight graphs favor the failure tree at 52 and 67 vertices.
No broad dispatch rule or universal advantage follows from the selected wins.

## Measurement and verification

Apple M2, 24 GiB, Apple Clang, `-std=gnu23 -O3 -g -mcpu=apple-m2`. One thread,
user-initiated QoS. Both compared engines are resident in one executable.
Graph generation, binary-plan loading and workspace allocation occur before
timing. Complete warm solves include all half-path construction, per-middle
exclusion evaluation, final combination and live scratch initialization.
Circuit planning is reusable and is not charged per graph. This evidence does
not establish a benefit for a one-off solve including Python plan construction.

Each confirmation case warms both engines for at least 50 ms, calibrates equal
iteration counts, and records 31 alternating ABBA/BAAB quartets with a 5 ms
target baseline batch. Both wall and thread CPU clocks are retained. Circular
block bootstrap intervals use 4,000 draws and block length five, following the
existing project harness. Seeds and case order were fixed before confirmation;
all selected neighboring sizes are reported. No project compilation or separate
validation job ran concurrently with timing.

Verification includes:

- Exact support and disjointness checks for four circuit families at 13 sizes
  from 4 to 128; every required zero and one in each output is checked.
- 96 Python complete path comparisons against independent permutation
  enumeration, including negative, missing, equal and distinct weights.
- 75 initial C small-graph comparisons, 75 with the improved control on new
  seeds, and 15 ablation checks. Small graphs are independently enumerated in C.
- Every timed batch checks the exact maximum and count against the other
  engines. Large graphs use cross-algorithm comparisons, not exhaustive search.
- An independent audit reconstructs every exported binary plan's support map,
  verifies source/library/data hashes and ABBA structure, and recomputes point
  estimates from raw timings. The baseline FLINT library hash is unchanged.

## Artifacts and reproduction

- [Exact circuit/application screen](../scripts/screen_theory_transfer.py),
  [results](../results/theory-transfer-screen.json).
- [Initial C prototype](../bench/theory_paths.c),
  [initial screen runner](../scripts/benchmark_theory_paths.py),
  [results](../results/theory-paths-screen/summary.json).
- [Improved control source](../bench/theory_paths_control.c),
  [fresh-instance control runner and feature ablation](../scripts/check_theory_paths_control.py),
  [results](../results/theory-paths-control/summary.json).
- [Confirmation runner](../scripts/confirm_theory_paths.py),
  [predeclared plan](../results/theory-paths-confirm/plan.json),
  [confirmation](../results/theory-paths-confirm/summary.json).
- [Independent audit](../scripts/audit_theory_transfer.py),
  [audit result](../results/theory-transfer-audit.json).

The scripts refuse existing output locations. To reproduce in a fresh checkout
with the recorded sister sources, run in order:

```sh
python3 scripts/screen_theory_transfer.py --output results/theory-transfer-screen.json
python3 scripts/benchmark_theory_paths.py --output results/theory-paths-screen
python3 scripts/check_theory_paths_control.py
python3 scripts/confirm_theory_paths.py
python3 scripts/audit_theory_transfer.py
```

## Next decision

This candidate warrants application qualification. Identify a real graph task
that repeatedly asks for fixed-length optimal simple paths and counts, collect
representative graph/weight distributions, and compare against an existing
solver plus conventional pruning/dynamic-programming alternatives. The present
code compares algorithms we implemented, not a mature graph library. Account
for initialization, plan storage and reuse in that application.

The next milestone is a benefit in that setting with this same retained-weight
ablation. If it fails, retain the direct circuit result and move to another
semigroup/workload; do not recast it as an improvement to FLINT multiplication.
