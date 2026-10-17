# Hard-instance qualification of the paired path circuit

October 7, 2026. **Decision: no practical paired-circuit win in this screen;
no family qualifies for held-out confirmation.** This extends the
[earlier random-graph qualification](theory-paths-qualification.md) without
altering its evidence. The stronger search control wins all 48 performance
instances, including deliberately difficult cycle cases and queries on a
published network.

## What was tested

The output contract remains exactly the same: the maximum total edge weight
and exact number of maximizing **simple six-edge paths between two fixed
endpoints**. Negative weights, missing edges, tied optima and absence of a
path are supported. This is not a top-k path-list computation.

The [plan](../results/theory-paths-hard/run/plan.json) was written before
answer computation or timing. It specifies:

- Six synthetic families, at 19 and 27 vertices, with three fresh fixed seeds:
  independent directed weights, reciprocal weights, a high-weight two-cycle,
  a high-weight three-cycle, a high-weight four-vertex cluster, and heavily
  quantized weights. There are 36 performance instances.
- The first five start with weights in `[-1000,1000]`; the cycle and cluster
  arcs receive `+10000`. Reciprocal arcs share a weight. Quantized weights
  lie in `[-2,2]`. These are **mechanistic stress tests**, not fitted models
  of biological networks.
- Twelve predetermined endpoint pairs on the entire published Wnt graph
  described below, with no vertex filtering or graph-size truncation.
- Comparisons against the older Sergeev circuit, the retained-weight
  ablation, the failure-tree solver, the previous sorted branch-and-bound
  solver, and a stronger nonbacktracking search. Public-network cases also
  include plain sparse enumeration. Seven same-plan comparisons provide
  timing controls.

## Application data and its limits

Fixed-length minimum-weight simple paths have a genuine signaling-pathway
application in [Hüffner, Wernicke and Zichner](https://fpt.akt.tu-berlin.de/homepage-hueffner/color-coding-algorithmica07.pdf).
Their application includes additional outputs and randomized color-coding;
our exact optimum/count interface is not their complete workflow.

We obtained the [Wnt network distributed with PathLinker](https://github.com/Murali-group/PathLinker/blob/d4a44c9f44f4afe30fd945015d84c1ce8c602c00/data/Wnt/uniqueWnt-pathlinker-net.txt),
pinned at commit `d4a44c9f44f4afe30fd945015d84c1ce8c602c00`. It has 106 vertices,
428 directed arcs, no self-loops and no duplicate arcs. Its supplied source
and target files each list 14 vertices. We sorted each list, formed their
196-pair Cartesian product, and selected every seventeenth pair beginning
at index zero. This gives twelve queries independently of solver results.

The file is unweighted. Every present arc receives weight zero, so the exact
query becomes a six-edge simple-path census. No probabilities were rounded
or logarithms quantized. Ten selected queries have paths, with counts ranging
from 24 to 434; two have none.

[PathLinker's actual task](https://github.com/Murali-group/PathLinker/blob/d4a44c9f44f4afe30fd945015d84c1ce8c602c00/README.md)
is reconstruction using top-k simple paths, not this fixed-length census.
Therefore this is a test on published application data, **not an application
integration or evidence that a biological caller needs our counts**. Source
files and [download hashes](../results/theory-paths-hard/data/manifest.json)
are preserved.

## A stronger conventional bound

The earlier search uses an upper bound from fixed-length walks that may
repeat vertices. A highly weighted reciprocal edge can make such a bound
very loose: a walk traverses it repeatedly, while a simple path cannot.

The new control forbids immediately returning to the previous vertex in its
walk relaxation. Write `D[r, previous, u]` for the best remaining `r`-edge
nonbacktracking walk from `u` to the target. For each `r,u`, retain the two
largest successor scores

```
score(v) = weight(u,v) + D[r-1, u, v],
```

with distinct successor vertices. To evaluate `D[r,previous,u]`, use the
largest unless its successor is `previous`, in which case use the second.
This permits preparation in `O(6*N^2)` for dense graphs, with adjacency lists
used by the search. Longer repeated cycles are still allowed by the bound.
Every simple continuation remains admissible, so pruning is exact.

The search visits successors in descending bound order. It prunes only when
the bound is **strictly below** the incumbent, preserving all optimal ties.
Like the earlier control, it has a budget of `4*N*N` visited states and then
uses the exact failure-tree solver from scratch. Adjacency construction,
bound preparation, attempted search and any fallback are all charged inside
each timed call.

On the two-cycle stress family, this changes 1,224–2,803 search visits into
42–64. Neither search exhausts its budget on the performance cases. Separate
equal-weight validation fixtures force both fallback branches and verify the
returned exact count.

## Results

All 48 comparisons against the nonbacktracking control favor it in both CPU
and wall-time bootstrap intervals. The table gives the range of paired CPU
time divided by that control's CPU time, across the prescribed instances.
These are ranges of point estimates, not pooled confidence intervals.

| Family | Cases | Paired / nonbacktracking CPU time |
| --- | ---: | ---: |
| Independent weights | 6 | 11.58–21.45× |
| Reciprocal weights | 6 | 11.86–21.59× |
| High-weight two-cycle | 6 | 9.22–16.53× |
| High-weight three-cycle | 6 | 5.49–8.19× |
| High-weight four-vertex cluster | 6 | 8.01–15.64× |
| Quantized weights | 6 | 1.92–9.29× |
| Published Wnt graph | 12 | 639–1,412× |

There was an apparent lead against the **old** search: on all six two-cycle
instances the paired circuit reduced CPU time by approximately **37–41%**.
The stronger bound removes that lead by a large margin. This is why merely
defeating the previous branch-and-bound implementation would not qualify the
construction.

For the public graph, paired solves take approximately **11.3–11.9 ms**.
Nonbacktracking search takes roughly **7–16 microseconds**; plain sparse
enumeration takes roughly **4–45 microseconds**. These are ranges of per-case
CPU medians. The circuit processes dense pair families for every middle
vertex, while this sparse graph has comparatively few admissible paths.

The paired circuit beats the older circuit on all 48 instances. Removing its
retained-weight feature also usually makes it slower: 46 of 48 ablation
comparisons have positive CPU and wall intervals. This preserves the narrow
construction-level observation. It does not supply a complete-solver advantage
over the stronger conventional algorithms.

The predeclared confirmation gate required a family and size to beat both
search controls and the failure tree on all three seeds. **None passes.**
The reserved confirmation seeds were not used, and no additional favorable
families or endpoint selections were introduced after seeing these results.

## Costs, correctness and uncertainty

Static circuit plans are reusable across graphs of the same size. Their
construction and binary export were recorded separately; construction of the
103-vertex paired exclusion plan took about 0.10 seconds in this preparation
run. Plan loading is outside warm timings and was not separately benchmarked.
The rejection therefore grants the circuit free static preparation and
loading. Charging those costs cannot rescue its warm-solve losses. No cold
application speedup is claimed.

There are 259 comparisons and 15,540 timed batches. Each comparison uses 15
alternating ABBA/BAAB quartets, equal repetition counts, a 20 ms joint warmup
and a 2 ms target batch for the slower implementation. Both clocks are kept.
The shared analysis uses 4,000 circular block-bootstrap draws, block length
three. Compilation, graph generation and correctness validation completed
before timing; no separate computation ran concurrently with the timing
process. Bootstrap analysis occurs between comparisons.

On large-ratio comparisons the faster solver has short batches, so its exact
ratio is less precisely measured. The gap is still sufficient for rejection.
One of seven identical-plan controls shows an apparent **0.55%** reduction
with a positive interval. This screen should not support subpercent claims;
its rejection margins are much larger. These intervals describe this local
campaign, not reproducibility across machines or days.

Verification includes:

- 84 graphs checked across the solver implementations, plus three additional
  degenerate/fallback fixtures: 573 engine comparisons in total.
- Independent NetworkX enumeration on 51 graphs, enumerating 56,829 six-edge
  paths, with exact weight/count agreement.
- A complete equal-weight eleven-vertex graph returning 15,120 tied optima
  after both searches hit their budgets; empty and single-path controls.
- Independent formal-support verification of all 18 exported circuit plans,
  including the large public-network plan and the retained-weight ablation.
- Raw quartet, answer and point-estimate checks; 250 fingerprint checks; the
  baseline FLINT library and previous evidence remain unchanged.

The new nonbacktracking bound is an ordinary algorithmic control, not a
theory-derived speedup. Its advantage here is not a claim that it is the
fastest possible fixed-length path solver.

## Research decision

This bounded pass closes the proposed hard-instance qualification. It found
both a failure mode for the old search and a conventional remedy, and it
tested a whole published graph. Neither supplies the sought practical
advantage for the paired construction. Reopening this route needs a concrete
application contract or algorithmic change beyond selecting harder inputs
for the same comparisons. The earlier practical FLINT results are unchanged.

## Reproduction

- [Solver and controls](../bench/theory_paths_hard.c).
- [Preparation/timing runner](../scripts/qualify_theory_paths_hard.py),
  [plan](../results/theory-paths-hard/run/plan.json),
  [validation](../results/theory-paths-hard/run/validation.json),
  [raw timings](../results/theory-paths-hard/run/raw.jsonl),
  [summary](../results/theory-paths-hard/run/summary.json).
- [Fallback checks](../scripts/check_theory_paths_hard_fallback.py),
  [fallback results](../results/theory-paths-hard/fallback-checks/summary.json).
- [Audit](../scripts/audit_theory_paths_hard.py),
  [audit result](../results/theory-paths-hard/audit.json).

With the pinned data and prior artifacts present, the following commands
require fresh output locations (the fallback checker and auditor use the
recorded canonical paths):

```sh
.deps/theory-paths-qualification-venv/bin/python scripts/qualify_theory_paths_hard.py --stage prepare --output results/theory-paths-hard/run
.deps/theory-paths-qualification-venv/bin/python scripts/qualify_theory_paths_hard.py --stage measure --output results/theory-paths-hard/run
.deps/theory-paths-qualification-venv/bin/python scripts/check_theory_paths_hard_fallback.py
python3 scripts/audit_theory_paths_hard.py
```
