# Bulk exclusion application screen

October 7, 2026. **Outcome: no new application qualified for a timing campaign.**
This follows the [short-path rejection](theory-paths-qualification.md). It
narrows the next search; it does not establish that the paired construction
has no practical application. No earlier performance claim has been changed.

## The operator we need to match

The actual sister-project circuit computes

```
y[c,d] = combine x[a,b] over all unordered pairs {a,b} disjoint from {c,d}.
```

An application must supply pair-indexed inputs, need many of these outputs,
and benefit from sharing their computation. Those conditions alone are not
enough. The operation and the application's output contract determine which
conventional shortcuts are available.

The direct construction attribution remains the one in the
[original transfer report](theory-transfer-screen.md): import the actual
paired circuit and ablate its retained internal weights. The present screen
does not turn that earlier circuit-level benefit into an application win.

## Source-level application findings

| Candidate | Actual operation / interface | Decision for this pass |
| --- | --- | --- |
| Poker range compatibility | Sum opponent two-card hand weights excluding each player's two cards | Exact bulk operator match, but existing software already uses subtraction |
| Bayesian-network parent selection | Best scored parent set subject to included and excluded variables | Published application connection; arbitrary exclusion sizes and specialized query structures need to be respected |
| Disjoint set constraints | Existence of a compatible set assignment; sometimes a global cardinality constraint | A Boolean pair-state specialization admits small certificates; it does not replace the full global propagator |
| Statistical jackknife convolutions | Complementary products of individual distributions | Genuine non-invertible bulk workload, but singleton inputs and one exclusion, not the paired operator |
| Log-domain messages over disjoint pair states | Hypothetical log-sum-exp over compatible pairs | Algebraic match only; no existing application/code match established in this search |

### Poker: an exact match with an existing cheap implementation

[TexasSolver's `PCfrSolver.cpp`](https://github.com/bupticybee/TexasSolver/blob/78f2ed2544440ea143873918f45b30a331f00383/src/solver/PCfrSolver.cpp#L651-L687)
computes terminal utilities using the total opponent range weight, per-card
incident weights, and an identical-hand correction. Lines 548–578 also use
this operation for expected-value normalization. Lines 606–643 maintain
incident totals while scanning strength-ordered hands for showdown payoffs.

For ordinary addition the exact identity is

```
y[c,d] = total - incident[c] - incident[d] + x[c,d].
```

The last term corrects subtracting the identical pair twice. This is already
a linear-time pass over the inputs followed by constant work per output.
The showdown scan additionally exploits ordering; evaluating a full exclusion
circuit at every hand-strength threshold would miss that sharing.

The source was pinned and hashed, but the solver was not built or timed.
Floating-point cancellation can affect this identity. This screen has not
established a consequential accuracy problem on actual solver traces, nor
that a paired circuit beats a suitable more accurate control. Such a claim
would require separate evidence; inventing an extreme range is insufficient.

### Parent selection and constraint propagation

The [2012 disjoint-summation paper](https://arxiv.org/abs/1208.0554)
already gives constrained feature selection as an application. That is useful
prior art, not a new application discovered here. An available
[Bayesian-network learning paper, Algorithm 3](https://pmc.ncbi.nlm.nih.gov/articles/PMC9601758/),
uses bit-array filters for required and forbidden parents followed by selection
of the first valid scored set. Restricting parent sets to size two and excluding
exactly two candidates would match our operator, but would only cover a
special case of these queries. No application trace establishing enough such
queries, or showing a bottleneck there, was obtained.

[ECLiPSe's `all_disjoint` documentation](https://eclipseclp.org/doc/bips/lib_public/cardinal/all_disjoint-1.html)
includes cardinality-two examples, but describes a global constraint with a
cardinality bound in addition to pairwise disjointness. A pair-compatibility
routine alone would not implement that contract. Even its Boolean pair-domain
subproblem should be compared with the certificate method below.

### Non-invertible convolution: genuine need, wrong incidence pattern

[Spouge, Ziegelbauer and Gonzalez (2020)](https://link.springer.com/article/10.1186/s13015-020-00178-x)
describe a biological statistical application requiring complementary
convolutions of independent count distributions. The application uses
logarithmic representations to handle a very wide coefficient range. The
paper provides a linear-operation-count jackknife algorithm and
[public source](https://github.com/johnlspouge/jackknife-product/blob/11dfc1d6eb319cfcd8a50afc3d896947831713e3/jls_jackknifeproduct.py).

This supplies evidence that bulk, non-invertible aggregation is practically
useful. However, its inputs are individual distributions, and each output
omits one input. They are not arbitrary edge values with all edges incident
to two vertices removed. The existing upward/downward tree already shares
computation. Replacing it with the sister circuit has no established benefit
or specific construction attribution. Also, convolution costs vary with
operand size: counting abstract gates would not predict elapsed time.

## A conventional certificate for all scalar maximum queries

The previous failure-tree idea applies even when **every output** is needed.
Here is a simple bound; no optimality or novelty is claimed.

1. Select a maximum-weight edge `e` with a fixed deterministic tie order.
2. For each endpoint of `e`, recursively select a maximum edge after deleting
   that endpoint.
3. Continue to deletion depth two. Keep all selected edges.

There are at most `1 + 2 + 4 = 7` selections. For any query deleting at most
two vertices, either the current selected edge survives and is optimal, or
one of its endpoints was deleted. Follow that endpoint's child. Every descent
accounts for a distinct deleted vertex, so after at most two descents the
selection is optimal or the surviving graph is empty.

Thus the selected edges preserve the scalar maximum and one canonical witness
for every pair exclusion simultaneously. The same reasoning works for minima
and for Boolean existence by assigning every present edge the same weight.
Preprocessing and producing the outputs still cost work; this is **not** a
measured performance dominance result. A paired circuit might have better
constants for some bulk workloads. A credible comparison must include this
kind of conventional method, not just another addition DAG.

The certificate does **not** preserve the number of tied optima. The checker
records a complete six-vertex, equal-weight graph where deleting vertices
0 and 1 leaves six optimal edges, but only one survives in the selected
certificate. Richer outputs require a corresponding stronger comparator,
such as the earlier count-aware failure tree. This distinction prevents
incorrectly dismissing every non-invertible aggregation.

## Exact checks and evidence

[The new checker](../scripts/screen_bulk_exclusion.py) passed:

- All 59,049 assignments of absent / negative / positive weights to the ten
  edges on five vertices: 944,784 queries including zero, one and two failures.
- All 32,768 simple graphs on six vertices: 720,896 such queries, checking
  Boolean existence and the canonical witness.
- 10,910 ring-formula output checks on 3–32 vertices, using separate powers
  of two as input markers and signed arbitrary-precision random integers.
- An explicit counterexample to preserving all tie counts with representatives.
- Verification of 86 existing evidence fingerprints, including prior theory
  measurements and the prepared-input completion records.

The finite certificate tests are supporting evidence; the argument above is
what extends the bound beyond the tested sizes. The largest deduplicated
certificate in these finite families had six edges; we only use the proven
seven-selection upper bound here.

[Results](../results/bulk-exclusion-screen/checks.json) and
[pinned source metadata](../results/bulk-exclusion-screen/sources/manifest.json)
are retained. Downloaded code was read, not executed. There are no performance
measurements in this pass. To repeat the algebraic checks from the repo root,
choose a new output file:

```sh
python3 scripts/screen_bulk_exclusion.py --output /tmp/bulk-exclusion-checks.json
```

## Research decision

Do not start another paired-circuit benchmark solely because an application
mentions exclusion, all pairs, or non-invertible aggregation. The current
search found no candidate satisfying all three requirements: an actual bulk
pair-exclusion call site, the correct richer output contract, and a plausible
advantage over its conventional controls.

For this construction, the remaining focused lead is a real bulk workload
with richer values: distributions, log-domain masses with demonstrated
accuracy requirements, or tie counts that the caller actually consumes.
Before implementing it, obtain a concrete call site and representative input
trace. The biological convolution example motivates that search but does not
yet supply the required pair-indexed operator.

My recommendation is also to broaden the construction screen beyond paired
exclusion. Finding an application for a different explicit sister-project
construction may be more productive than extending the same benchmark. The
present evidence does not select a new winning construction or change the
existing FLINT gains.
