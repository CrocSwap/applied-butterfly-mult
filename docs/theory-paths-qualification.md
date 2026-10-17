# Qualification: conventional search defeats the short-path candidate

October 7, 2026. **Decision: do not promote the six-edge optimum/count solver as
a practical application win.** This follow-up supersedes the application
recommendation in [the first circuit-transfer report](theory-transfer-screen.md).
Its measurements and artifacts remain unchanged.

The earlier 1.9–4.7% benefit from retaining internal weights is a valid
construction ablation. It improves an approach that computes a large family of
exclusion sums. A stronger conventional algorithm can avoid almost all that
work when the requested output is just one optimal path weight and its count.

## Stronger comparison

We implemented two exact branch-and-bound controls in C. They return **the same
maximum weight and exact number of maximizing simple six-edge paths** as the
paired circuit, including ties, missing edges and negative weights.

First compute `D[r,u]`, the maximum weight of a walk from `u` to the target with
exactly `r` remaining edges. Interior vertices may repeat in this relaxation;
the source and target cannot occur internally. Every admissible simple path
is one of these walks, so its weight is bounded above by `D[r,u]`.

During a depth-first simple-path search, maintain a visited-vertex set and an
incumbent maximum. A prefix of weight `w` can be pruned if

```
w + D[r,u] < incumbent.
```

The inequality is **strict**. Equal-bound branches remain eligible so that all
optimal ties are counted. The bound is valid with negative weights because the
number of remaining edges is fixed. One control visits the best relaxed
successor first, followed by vertex order; the other orders eligible successors
by their continuation bound.

Bound construction is charged inside every timed solve. Search is capped at
`4*N*N` visited states, after which the existing exact failure-tree solver
computes the answer from scratch. All attempted search and fallback costs are
charged. This bounds the experiment on highly tied inputs and never converts
an incomplete search into an answer.

## Results on the previously favorable regime

The screen retained five graph sizes and the three previously held-out broad
weight seeds, plus one new seed. Both controls were tested: 40 comparisons in
total. Graphs are the same dense directed integer-weight model in
`[-1000,1000]` used for the earlier confirmation.

**All 40 CPU and wall-time intervals favor branch-and-bound.** The table shows
the range of paired-circuit CPU time divided by branch-and-bound CPU time over
four seeds and two controls. These ranges are point estimates, not pooled
confidence intervals.

| Graph vertices | Paired time / branch-and-bound time | Search states visited |
| ---: | ---: | ---: |
| 11 | 3.78–6.75× | 9–39 |
| 15 | 9.55–15.07× | 6–31 |
| 19 | 18.90–24.99× | 6–19 |
| 23 | 23.77–32.88× | 6–26 |
| 27 | 38.12–46.82× | 6–22 |

At 19 vertices, branch-and-bound takes approximately **1.18–1.56 microseconds**
per complete solve versus **29.6–30.2 microseconds** for the paired circuit.
The timings include bound preparation. Separate instrumentation found no
fallback on any of the 40 performance cases. The search visits only a handful
of states after preparing its bound, whereas the circuit evaluates the full
exclusion family for every possible middle vertex.

We deliberately grant the circuit its earlier favorable assumption: its plan
has already been constructed and loaded. Charging plan preparation to a
one-off application would add work to the losing candidate. No additional
cold-start study is needed to reject this proposed promotion.

These results do not prove branch-and-bound always wins. Its pruning depends
on the data, and hard tied instances can reach the fallback. They do establish
that the favorable synthetic regime from the first report is not sufficient
evidence of a practical solver advantage.

## Application and existing-software check

There is a genuine application family behind the mathematical query:
signaling-pathway detection has been formulated as finding low-weight simple
paths with a prescribed number of vertices. The
[Hüffner–Wernicke–Zichner paper](https://fpt.akt.tu-berlin.de/homepage-hueffner/color-coding-algorithmica07.pdf)
describes color-coding software for that task. Its experimental task also
includes path reconstruction and diversity among many output paths. Our
weight/count prototype does not implement that complete workflow. Its
randomized algorithms also have a different correctness contract from an
exact optimum-and-count solver.

The available [PathLinker project](https://github.com/Murali-group/PathLinker)
computes the top `k` simple paths of varying lengths between receptor and
transcription-factor sets. Here `k` is the **number of returned paths**, not a
prescribed edge count. Its probabilities, returned sequences and edge rankings
are additional interface differences. Consequently our fixed-six-edge
weight/count routine is not a drop-in PathLinker replacement. We did not
download a biological network, truncate it to a favorable size, or claim a
PathLinker acceleration.

For an independent existing implementation of simple-path enumeration, we used
[NetworkX 3.4.2 `all_simple_paths`](https://networkx.org/documentation/networkx-3.4.2/reference/algorithms/generated/networkx.algorithms.simple_paths.all_simple_paths.html).
We enumerate up to six edges, keep exactly six, and independently aggregate
the maximum and tie count. This is a correctness oracle, **not** a C-versus-
Python performance comparison. All 100 comparisons against the two C search
controls passed, covering 7–11 vertices, two seeds and five edge distributions.
The 50 distinct oracle graphs contain 151,267 six-edge paths in total.

Application integration stopped at this qualification gate. A real biological
application speedup has not been demonstrated.

## Verification and measurement scope

- The original timing harness supplied 80 correctness runs covering 7–11,
  19, 35 and 67 vertices; equal, broad, heavily tied, sparse and empty graphs;
  and both search orderings. Small cases also use exhaustive C enumeration.
- NetworkX supplies a separately generated graph and independently enumerated
  answer for 100 checks. Twenty checks exercise the exact fallback.
- A separate trace binary checks the 40 performance cases, recording search
  visits and fallback status. It is never used for performance evidence.
- The measured binary checks the maximum and count before timing and after
  every batch. Both algorithms use the same C graph representation and compiler.
- Performance uses one thread on the M2, 50 ms joint warmup, equal repetition
  counts, 15 alternating ABBA/BAAB quartets and a 3 ms target baseline batch.
  Thread CPU and wall clocks are retained. Intervals use the existing circular
  block bootstrap with 4,000 draws; here the block length is three.
- No compilation, installation, separate validation or profiling job ran
  concurrently with measurement. NetworkX was installed afterwards in an
  isolated virtual environment.
- The audit checks raw quartet structure and exact answers, recomputes point
  estimates, verifies evidence hashes, and verifies that the earlier theory
  report, earlier measured artifacts and baseline FLINT library are unchanged.

No additional repeated timing campaign was needed: every comparison fails by
a large margin. This is a rejection screen, not a qualification of the new
branch-and-bound routine as a production solver or as fastest known software.

## Consequence for the research direction

The construction transfer itself remains concrete. We exported the actual
paired circuit and measured its retained-weight feature. The application
selection was the weak link: the graph query reduces all those outputs to a
single optimum, permitting a conventional search to skip almost everything.

The next operator search should require evidence that:

1. An existing application needs a substantial collection of disjoint-sum
   outputs or another aggregation that cannot be replaced by a few winners.
2. Ordinary subtraction, incident-total formulas, representative candidates
   and search bounds do not make the full circuit unnecessary.
3. The proposed substitution preserves the application's actual outputs,
   rather than replacing top-k paths by a fixed length or omitting witnesses.

Candidate families include bulk exclusion queries over richer semigroups and
multiple-output computations. These are **search criteria, not established
application matches**. Another benchmark that beats only the older addition
circuit would not settle the practical objective.

## Reproduction and artifacts

- [Exact search control](../bench/theory_paths_bnb.c), which includes the frozen
  [earlier implementation](../bench/theory_paths_control.c).
- [Qualification runner](../scripts/qualify_theory_paths_bnb.py),
  [predeclared cases](../results/theory-paths-bnb/plan.json),
  [raw measurements](../results/theory-paths-bnb/raw.jsonl),
  [summary](../results/theory-paths-bnb/summary.json).
- [NetworkX validation and trace generator](../scripts/validate_theory_paths_bnb.py),
  [validation results](../results/theory-paths-bnb-validation/validation.json).
- [Audit script](../scripts/audit_theory_paths_bnb.py),
  [audit](../results/theory-paths-bnb-audit.json).

With the earlier frozen plans present, run in a fresh output location/check-out:

```sh
python3 scripts/qualify_theory_paths_bnb.py
python3 -m venv .deps/theory-paths-qualification-venv
.deps/theory-paths-qualification-venv/bin/python -m pip install networkx==3.4.2
.deps/theory-paths-qualification-venv/bin/python scripts/validate_theory_paths_bnb.py
python3 scripts/audit_theory_paths_bnb.py
```

Output directories must not already exist. No FLINT source, measured circuit
generator or previous benchmark source was edited during this follow-up.
