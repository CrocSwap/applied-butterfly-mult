# Positive hypergraph contraction on real Bayesian queries

## Decision

**The sister-derived feature helps its own construction, but the resulting
circuits are not competitive on this corpus.** Do not build a runtime prototype.

We implemented a positive-sum extension of the sister's paired exclusion recursion
to hyperedges, including the three- and four-parent score sets retained by Gibby
on the public Sachs benchmark. Every captured query is included, with a common
fallback for exclusions outside the construction's domain. The same full retained
sum is computed by every method; there is no parent-set truncation.

Across 11 nonempty tables and 299 unique queries, the best carried variants need
2,329 additions, versus 972 for the best conventional variants. The best ablated
variants need 2,486. These sums combine independently selected per-table circuits;
they are static counts, not CPU reductions or a complete sampler comparison.
No table passes the predeclared arithmetic/storage gate.

## The construction and what it inherits

The source is the sister checkout at
`56b66d58297deca1d7dd130247d720e960f77a37`, particularly
`scripts/paired_exclusion_circuit.py` and `docs/research/paired-network.md`.
The existing paired circuit groups vertices in pairs, turns internal edges into
vertex weights, and keeps those weights inside subsequent recursion. This screen
extends that specific decomposition. It reuses the sister's actual disjoint-support
addition interning and leave-one/two-out vector routines. No sister files change.

Let X_P be a weight attached to any vertex subset P. Pair vertices and let pi(P)
be the set of pairs touched by P. The coarse weight is

    W_S = sum of X_P for which pi(P) = S.

For two excluded vertices a,b in different groups i,j, partition the surviving
parent sets into four disjoint regions:

1. Touch neither group: the coarse problem excluding groups i and j.
2. Touch i only through a's surviving partner and avoid j: a strip problem.
3. Touch j only through b's surviving partner and avoid i: the other strip.
4. Touch both groups only through their surviving partners: a direct cross sum.

Strip inputs are themselves hyperedges on the remaining groups, and only require
one exclusion. Two excluded vertices in the same group reduce to one coarse
exclusion. Empty subsets carry constants. Odd-sized universes have a final singleton
group, handled without inventing a surviving partner. Recursion stops at four
vertices, matching the sister's small-instance cutoff.

For a fixed required-intersection set L, input weights are gated by whether their
parent set intersects L, except that empty L admits all sets. Different L values
have separate logical problems but share any identical intermediate sum. The
top-level circuit answers observed queries excluding at most two supported labels.
Other observed queries use balanced positive sums within the same arithmetic graph.

### Feature ablation

At each recursive call above the leaf cutoff, remove singleton weights and sum
them through a separate leave-one/two-out vector circuit. Combine those answers
with the recursion on the remaining hyperedges. This preserves the exact map,
pairing order, leaf rule, support interning and final pruning. It removes the
specific benefit of carrying singleton contributions with larger contributions.

Three fixed orders are tested: natural labels, reversed labels, and descending
input-set incidence (ties by label). Of the 33 matched-order comparisons, carrying
singletons uses fewer additions in **31**, ties in two, and loses in none.
The reduction is 0–11.86%. This is a static ablation result. It does not establish
novelty of the general hypergraph identity or an application speedup.

## Conventional comparators and resource contract

- Memoized balanced summation of each distinct query support.
- Positive binary parent-set tries in each of the same three fixed orders.
  Fully covered subtrees share their total; partial queries recurse.
- Greedy common-pair elimination across query forms. It repeatedly shares the
  pair of current terms appearing in the most forms, then sums remaining terms.
  Every addition is positive and combines disjoint original input supports.

All methods get immutable input weights, the complete offline list of observed
queries, exact equality-based sum interning, unlimited result memoization, and
dead-node pruning. We count active additions, two scalar reads and one write per
addition, dependency depth, and peak live computed values under node-ID order.
The peak includes cached computed outputs but excludes immutable inputs. It uses
read-before-write allocation; it is not a globally optimal workspace bound.
Generated additions and contraction entry visits are also recorded, including
work on intermediate outputs later pruned away. Planning CPU time is unpriced.

The offline query list is an optimistic applicability screen, not a promise that
the future queries are known in an actual MCMC run. Repeated queries require the
same lookup machinery across methods; no speed claim follows from caching them.
The native sampler also stops scans at a tolerance-dependent cutoff. Reconstructing
that behavior from the rounded diagnostic log weights would not be an exact replay,
so we do not assert the native arithmetic counts. Even beating our full-sum controls
would still require beating that stronger application comparator at equal accuracy.

## Full captured workload results

The frozen source is `results/encrypted-probability-survey/runs/sachs1k-p2/trace/queries.tsv`:
2,878 calls on nonempty tables; 299 distinct (L,U) queries. No model or pruning
parameter was changed. Each row below selects the best order separately for
construction and ablation, and the best conventional method by addition count,
then live storage. The counts are for computing the unique outputs once.

| Child node | Retained sets | Unique queries | Conventional additions | Carried additions | Separate-singleton additions |
|---:|---:|---:|---:|---:|---:|
| 5 | 32 | 8 | 33 | 53 | 59 |
| 6 | 32 | 8 | 33 | 52 | 59 |
| 0 | 68 | 24 | 85 | 232 | 247 |
| 3 | 108 | 33 | 135 | 308 | 339 |
| 9 | 36 | 8 | 37 | 70 | 74 |
| 10 | 67 | 32 | 95 | 231 | 257 |
| 8 | 95 | 43 | 130 | 312 | 349 |
| 7 | 163 | 81 | 202 | 503 | 524 |
| 4 | 61 | 17 | 71 | 171 | 172 |
| 2 | 59 | 21 | 75 | 205 | 210 |
| 1 | 65 | 24 | 76 | 192 | 196 |

The incidence-ordered trie wins the conventional comparison for nodes 5,6,9;
greedy common-pair sharing wins for the others. Every best carried circuit also
has greater peak live computed storage than its best conventional comparator.
The weaker balanced baseline needs 2,651 additions overall: comparing only against
it would obscure the much stronger existing style of positive-sum sharing.

The predeclared timing gate requires at least 5% fewer additions than the best
conventional comparator, strictly fewer additions than the best ablation, and
no greater peak live computed storage than the selected conventional comparator.
**0 of 11 tables qualify.** No elapsed-time benchmark was run.

## Diagnostic restricted to the construction's domain

The full comparison uses a balanced fallback for larger exclusions. To check
whether this explains the negative result, a separately recorded diagnostic
removes those queries from every method. All original tables and fixed orders
remain; no favorable subset of tables or new parameters is selected.

There are 86 distinct queries excluding at most two supported labels. On those
alone the carried construction loses to the best conventional method on ten
tables and ties on one. The tied table has just one eligible query. Thus the
full-workload gap is not solely due to a weak implementation of the fallback.
This still does not rule out all hybrid synthesis or other hypergraph schedules.

## Verification, limits, and next direction

The construction is checked on dense and sparse hypergraphs of maximum input
size four, at universe sizes 1–8 and 10, including constants, singleton inputs,
odd group counts, both omission bounds and both ablations. Its pair-input output
maps are also compared with the actual sister circuit at sizes 4,5,6,8,10.
There are 1,060 checked fixture outputs. All saved workload circuits are then
replayed independently using sets of input indices, verifying every coefficient
and every gate's disjointness. No floating-point identities are assumed.

This is a useful direct mechanism transfer and a negative application result.
The workload's sparse parent tables and small, irregular requested output family
favor ordinary shared subset totals. Keeping the smaller contributions helps
the structured construction but does not overcome that difference.

Park this runtime port. The captured corpus can support future construction work,
but repeating measurements or restricting the model to two parents would not
address the measured gap. A future reopening needs a different schedule with
fewer charged operations on these same queries, or a real caller requiring a
larger, more regular output family. No such caller is established by this screen.

Artifacts:

- `scripts/sachs_hypergraph_screen.py`, `results/sachs-hypergraph-screen/`.
- `scripts/sachs_hypergraph_eligible.py`, `results/sachs-hypergraph-eligible/`.
- `scripts/audit_sachs_hypergraph.py`: independent replay and inherited SHA audit.

Each runner refuses an existing destination. Original evidence is preserved;
repeat runs require fresh paths. The completion record extends the preceding
encrypted/probability-survey preservation chain. No FLINT or upstream library is
modified, no author is contacted, and no practical or asymptotic novelty is claimed.
