# Pareto aggregation: application-contract survey

## Decision

**The actual sister paired-exclusion circuit supports Pareto-frontier payloads,
but none of the inspected operations establishes a competitive application for
it.** The algebraic transfer passes; the application gate remains unmet. No
runtime prototype or speedup is claimed.

We inspected shortest-path search, bicriteria cartographic aggregation, and an
adjacent database subset-convolution implementation. We did not change those
solvers, run them, or collect application query traces. Synthetic checks below
validate the payload interpretation, not workload frequency or performance.

## The useful mathematical distinction

For minimization, write P(A) for the distinct nondominated cost vectors in A.
The operation

    A merge B = P(A union B)

is associative, commutative, and idempotent, with empty-set identity. Therefore
the sister circuit's support partition identities can be evaluated using this
operation instead of scalar addition. In particular, an input edge can carry a
whole frontier, and each output returns the frontier of all edge payloads
avoiding its two forbidden vertices. The carried internal-edge weights remain
inside the paired recursion, exactly as in the original construction.

We evaluated the actual `PairedExclusionCircuit`, not a replacement inspired by
it. Sister revision: `56b66d58297deca1d7dd130247d720e960f77a37`.
Relevant files are `scripts/paired_exclusion_circuit.py`,
`scripts/exclusion_circuit.py`, and `docs/research/paired-network.md`.

This lifting is a standard consequence of associativity; it is not a new Pareto
identity. There is no performance comparison or construction-specific ablation
in this screen. Also, idempotence allows competing algorithms to overlap inputs:
the theory's stronger disjoint-support property is sufficient but unnecessary
for distinct-vector union. Losing that restriction can help conventional methods.

The more expensive operation in several real applications is different:

    A product B = P({a + b : a in A, b in B}).

It creates new vectors. A merge network over existing input vectors does not
perform that product. First enumerating every product and then accelerating its
union would have to pay the enumeration cost and compete with methods that avoid
generating dominated products. Efficient Pareto-sum algorithms and conditional
hardness results already address this distinction.
[Pareto Sums of Pareto Sets](https://link.springer.com/article/10.1007/s00453-025-01314-y).

## Inspected implementations

### 1. Multiobjective path search: an online predicate

Pinned repository: `HanZhang39/MultiObjectiveSearch`, revision
`62fcfc27d96f63c3daff27eacf97332c6ac9f63e`.

`LTMOA::solve` pops a label, checks dominance, extends it along outgoing edges,
and checks each generated label. It maintains frontiers indexed by endpoint.
The inspected implementation provides linear scans, bucket variants, and an
ordered-set dominance structure for two retained cost coordinates. It does not
request a batch of leave-two-vertices-out frontiers.
[Solver](https://github.com/HanZhang39/MultiObjectiveSearch/blob/62fcfc27d96f63c3daff27eacf97332c6ac9f63e/src/Solvers/LTMOA.cpp),
[ordered-set implementation](https://github.com/HanZhang39/MultiObjectiveSearch/blob/62fcfc27d96f63c3daff27eacf97332c6ac9f63e/src/Solvers/GCL.cpp).

There is a closer operation in `LTMOA2`: `GCL_table::is_dominated` ignores the
group having the queried predecessor ID and asks whether any remaining label
dominates the new vector. Thus an actual one-group exclusion exists. But the
return value is a Boolean, the query vector changes, and updates insert and
prune labels between queries. The code even prunes across predecessor groups;
its search invariants cannot be replaced with a generic static deletion model
without further proof.
[Parent-exclusion operation](https://github.com/HanZhang39/MultiObjectiveSearch/blob/62fcfc27d96f63c3daff27eacf97332c6ac9f63e/inc/LTMOA2.h).

At a fixed snapshot, prefix/suffix frontier unions or a tree of group unions
are conventional comparators for single-group omission. For the actual caller,
short-circuit dominance queries and maintenance costs must be included. No trace
showing enough unchanged-state reuse was obtained. This is a possible future
profiling hook, not a matched use of paired exclusion.

### 2. Cartographic aggregation: product generation and state projection

Pinned repository: `Tarek-pub/Bicriteria_Aggregation`, revision
`029970db0ee7425b1739d3c87bfa94e3f9081dbd`.

This is an implementation of a tree-decomposition algorithm for multicriteria
cuts, applied to simplifying building-footprint maps. The authors publish real
instances and precomputed decompositions. Their paper identifies join operations
as the main bottleneck and describes heap enumeration, bounds-based pruning,
and fused join/forget operations.
[Paper](https://arxiv.org/html/2509.06124v1).

The pinned `MincutSolutionVector` confirms three distinct contracts:

- `forget`: merge two sorted frontiers for states S and S union {v}.
- `joinComputeEntry`: combine two frontiers with the same boundary-state key,
  adding their costs and subtracting a fixed overlap correction.
- `joinForgetComputeEntry`: put the products for several child-state keys into
  one fused computation, avoiding separately materialized intermediate fronts.

`NormalBicritSolutionHeap` enumerates candidate sums; the heuristic heap skips
regions based on bounds. `BicritMergeIterator` already merges sorted lists.
[State transitions](https://github.com/Tarek-pub/Bicriteria_Aggregation/blob/029970db0ee7425b1739d3c87bfa94e3f9081dbd/src/main/java/multicriteriaSTCuts/dynamicProgamming/MincutSolutionVector.java).

For a fixed forgotten set F, the projection S -> S minus F partitions the
child-state keys. Different output keys have disjoint input-key families, rather
than overlapping exclusion queries over a common collection. This removes the
structural sharing opportunity sought here; it does not exclude accidental
equal frontiers or other implementation improvements. The expensive join itself
is a Pareto product, not the paired-exclusion union operator.

The source supports both unique-cost and multiple-witness behavior through
`uniqueWeights`. Our finite checks retain only distinct vectors and therefore
do not validate all solution reconstructions or ties in that caller. No claim
of a drop-in replacement is made.

### 3. Database join ordering: real subset convolution, a different target

Pinned repository: `utndatasystems/DPconv`, revision
`dc56bdc52c452bf86b3ac5c224b0176148c38757`.

This adjacent application genuinely combines disjoint subsets, but the inspected
`runMinMaxDPconv_instant` implements threshold feasibility with scalar tables.
Its `BooleanFSC` performs ranked zeta transforms, products, and subtractive
Möbius inversion over integer arrays. It caches completed layers and specializes
small subset sizes. This is not a Pareto-payload caller.
[Code](https://github.com/utndatasystems/DPconv/blob/dc56bdc52c452bf86b3ac5c224b0176148c38757/src/include/SubsetConvolution.hpp),
[project](https://github.com/utndatasystems/DPconv).

A fast convolution over arbitrary Pareto payloads cannot be obtained simply by
substituting frontier union for integer addition: the inspected inversion uses
subtraction, and frontier union has no inverse. A separate transform proposal
would need its own correctness proof and a comparison against the actual cached,
rank-restricted implementation. No such proposal was established here.

## Correctness traps checked explicitly

**Pruning cannot generally precede future exclusions.** Suppose a candidate
using label 0 has cost (0,0), while one using label 1 has cost (1,1). Global Pareto
pruning removes the second. A later query forbidding label 0 should return
(1,1); filtering the globally pruned frontier returns nothing. This is an
abstract counterexample, not a bug allegation against a solver whose additional
invariants may justify its pruning.

The paired circuit avoids that error because a reused intermediate always
represents a whole input family included in every output that consumes it. It
never filters individual supports out of an already compressed mixed frontier.
Dominance elimination within each indivisible edge payload is safe for this
specific query contract.

**There is no frontier subtraction.** Merging {(0,0)} with either {(1,1)} or
{(2,2)} gives the same frontier, but deleting the first source must yield
different answers. Information was lost. This blocks a naive total-minus-group
method but does not make the new circuit competitive by itself.

**Union and product differ even on tiny inputs.** For
A={(0,4),(4,0)} and B={(1,3),(3,1)}, their Pareto sum is
{(1,7),(3,5),(5,3),(7,1)}. None of these vectors occurs in their union.

## Validation and artifacts

`scripts/pareto_compatibility.py` evaluates the actual sister circuit on 168
deterministic synthetic fixtures: universe sizes 4,5,6,7,8,10,12, dimensions
2 and 3, and 12 seeds per size/dimension. Payloads include empty sets, ties, and
dominated points. An independent quadratic checker verifies **4,584 output
frontiers** against direct enumeration. The circuit's own exact support checks
also run. No gate count is interpreted as a runtime estimate for frontier merges.

Additional exact checks cover 4,096 associativity triples, 256 commutativity
pairs, the counterexamples above, and 502 forget projections. All pass.
These checks supplement the general algebraic arguments; they are not a proof
by exhaustive search over arbitrary inputs.

Fifteen retained upstream files match their Git blob hashes. The predecessor
chain verifies 1,977 historical fingerprints. Original notices and README
license statements are retained; these are source snapshots, not redistributed
modified solvers. The completion manifest includes the new artifacts and the
sister source hashes.

To repeat the checks without replacing their receipt:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 scripts/pareto_compatibility.py --out /tmp/pareto-checks-new.json
```

The runner refuses an existing output. Results are in
`results/pareto-compatibility/checks.json`.

## Next decision

Park a Pareto performance port until there is a real batch of overlapping
exclusion queries over stable support-labelled candidates. The nearest observed
hook is LTMOA2's predecessor exclusion, but profiling it would first test online
reuse and conventional dominance indexing, with weaker attribution prospects.
The cartography join would require a different mathematical idea addressing
Pareto products. Neither finding warrants manufacturing pair-exclusion batches
or benchmarking only against direct enumeration.
