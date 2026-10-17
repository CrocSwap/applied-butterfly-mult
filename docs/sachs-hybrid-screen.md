# Hybrid positive-sum synthesis on Sachs

## Decision

**The bounded hybrid screen found no additional benefit from the sister-derived
proposals. Park this Sachs construction-transfer line.** No timing or held-out
runtime stage is warranted by these results.

All 11 tables and all 299 distinct queries from the previous screen were retained.
The best ordinary circuits now require 970 additions, down from 972. Both hybrid
arms also require 970. The sole addition-count improvement is conventional:
the table for child 0 drops from 85 to 83. These are static full-sum circuit counts,
not CPU measurements or a demonstrated improvement to Gibby.

| Proposal family | Best per-table additions, summed |
|---|---:|
| Previous conventional circuits | 972 |
| Strengthened conventional synthesis | **970** |
| Conventional plus carried-construction proposals | **970** |
| Conventional plus separate-singleton ablation proposals | **970** |

## What the hybrid actually tests

The previous implementation showed that retaining singleton contributions inside
the sister-inspired hypergraph recursion saves work relative to computing those
contributions separately. But the complete construction lost to conventional
shared-sum synthesis. This experiment asks whether its intermediate sums are useful
as optional building blocks in a better surrounding circuit.

Each original input weight is an independent atom. Each possible intermediate sum
is represented by the exact set of atoms it contains. The three proposal families
are:

1. **Ordinary:** all intermediates in the previous conventional circuits, plus
   two bounded rounds of intersections among output/support sets. The intersection
   frontier is capped at 512 supports per round. Ordinary common pairs of current
   expression terms are also discovered dynamically throughout synthesis.
2. **Carried hybrid:** ordinary proposals plus active intermediate supports from
   all three previously saved carried-construction circuits.
3. **Ablated hybrid:** ordinary proposals plus active intermediate supports from
   all three previously saved separate-singleton circuits.

Only sums contained in at least two distinct output forms are proposed. No
arithmetic is free: a selected sum must be built from available disjoint terms,
and its producers are included in the final circuit. The optimizer may construct
a proposed support more cheaply than its original network recipe. Thus the
theory supplies proposed shared sums, not an uncharged precomputed signal or
mandatory execution of the original network. A success would initially establish
the value of those proposals; stronger construction attribution would still need
careful ablation and comparison with broader ordinary search.

## Fixed search budget and controls

Each family receives four synthesis passes: prioritize absolute expression saving
or saving per estimated build cost, with ascending or descending support tie breaks.
Each pass admits at most 256 ranked static proposals and at most 256 sharing rounds.
All dynamic ordinary common pairs remain eligible. No pass reached the round cap.

Candidate scoring accounts for the additions needed to build the chosen sum from
the current terms. It is a greedy surrogate, not a proof of global optimality.
The final addition count is obtained from the actual binary circuit, with unused
nodes removed, and independently replayed. All additions have disjoint supports.

Every family retains the previous conventional circuits as fallbacks. Both hybrid
families also retain the new ordinary runs, so admitting theory proposals cannot
force a regression. Selection uses additions, then peak live computed values,
then a deterministic name. Actual compiler CPU cost and proposal-generation work
are not identical across families; the experiment equalizes structural caps and
policies, not wall-clock search budgets.

The predeclared gate requires at least 5% fewer additions than the strengthened
ordinary result, strictly fewer than the ablated hybrid, and no greater peak live
computed storage than the selected ordinary comparator. **Zero tables pass.**

## Did the search inspect anything distinctive?

Yes, within the stated cap. Across the tables, 204 distinct table-specific carried
supports absent from the ordinary pool appear in at least one hybrid pass's
admitted proposal list. None is selected as a static proposal. The complete pools
contain additional such supports below the cap; this is not an exhaustive test of
every proposed sum or of combinations that require initially unprofitable steps.

Many supports are shared by multiple sources. A sum independently supplied by an
ordinary method cannot be attributed to the sister construction merely because
the sister circuit also contains it. Likewise, dynamic common pairs remain ordinary
proposals even when their resulting support happens to occur in the theory pool.

The carried and ordinary passes produce literally identical active circuits in
34 of 44 matched runs. Other passes can differ due to admission/order effects, but
none improves the selected addition count beyond the ordinary baseline. This
supplies no construction-specific memory or arithmetic gain claim.

## Remaining arithmetic headroom

For each table, connect input atoms that occur together in a requested sum. If
there are m active input atoms and c connected components, any binary positive-sum
circuit needs at least m-c additions: each gate can join at most two previously
separate components. This bound applies to these symbolic full-sum problems,
not arbitrary approximate algorithms or the native tolerance-truncated sampler.

The summed lower bound is 754 additions. The previous 972-addition baseline therefore
had at most 22.43% arithmetic headroom; the new 970-addition baseline has at most
22.27%. This loose ceiling does not assert that the bound is attainable. It supplies
no end-to-end speedup estimate.

## Verification and practical limits

The saved artifacts contain 132 new synthesis runs, alongside the prior conventional
fallbacks, for 187 serialized circuits. An independent set-based evaluator checks
every output coefficient, each gate's disjointness, active addition count, dependency
depth, fixed-order liveness, winner selection and the gate. It also checks theory
proposal provenance against the saved source circuits, the frozen inputs, and the
inherited fingerprint chain. Numeric score values are not used by the optimizer.

All methods have the full offline future-query list and may cache output sums.
That is an optimistic static screen. An online application would need to pay for
planning, cache construction and unseen-query fallbacks. The original weights were
exported as rounded diagnostic logs; native early cutoff and extended-range
arithmetic are not replayed here. The common target is the exact symbolic sum of
all retained input weights. No sampling accuracy, floating-point enclosure,
wall-time improvement or deployment claim follows.

## Conclusion and artifacts

The sister feature has a verified benefit inside its own structured circuit, as
recorded in the preceding experiment. Allowing pieces of that circuit inside a
stronger conventional synthesis did not turn that benefit into a competitive result
on this corpus. A future reopening needs a substantially different synthesis
mechanism or a real workload with different query structure. The present evidence
does not justify another parameter sweep on Sachs.

- `scripts/sachs_hybrid_screen.py`: frozen proposal families, budgets and synthesis.
- `scripts/audit_sachs_hybrid.py`: independent semantic/resource/provenance audit.
- `results/sachs-hybrid-screen/`: plan, all circuits and selections, summary, audit
  and completion manifest extending `results/sachs-hypergraph-screen/completion.json`.

The runner refuses an existing destination. Earlier results and sister sources are
unchanged. No library installation, runtime benchmark or external communication
was performed in this experiment.
