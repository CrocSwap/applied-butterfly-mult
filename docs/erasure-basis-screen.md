# Erasure coding: joint basis retention versus conventional reconstruction

## Result

**Small static tradeoff improvements appeared, but no candidate passed the
declared gate for a runtime prototype.** Ordinary three- and four-term identity
search subsequently covered 129 of the 164 initially uncovered basis tradeoff
points. There are 35 remaining points in the tested resource frontier; 24 use
only changes expressible with at most four operands. The other 11 contain
longer recipes. None establishes a practical speedup or a distinctive application
of the new framed construction.

This is the bounded follow-up to [the workload survey](joint-workload-survey.md).
It tests selecting retained values and reconstructing their dependents on real
Reed–Solomon encoder/decoder programs. It does not impose address frames or
restoration of old temporary contents on those programs.

## Concrete examples

Counts below are per execution of an elementwise array program, before choosing
an array length. Scratch excludes 80 input arrays and 32 required output arrays.
The program can reuse output buffers before their final values are produced.

| Workload and variant | Scratch arrays | Array XORs | Array reads + writes | Input-array reads |
|---|---:|---:|---:|---:|
| Encoder, original scheduled | 69 | 418 | 736 | 277 |
| Encoder, best initial control at at most 8 scratch arrays | 8 | 655 | 869 | 599 |
| Encoder, general-basis candidate | 8 | 650 | 864 | 588 |
| Encoder, stronger short-identity control | 8 | 653 | 863 | 578 |
| Decoder, original scheduled | 110 | 519 | 939 | 292 |
| Decoder, best examined control at at most 32 scratch arrays | 32 | 727 | 1,051 | 627 |
| Decoder, general-basis candidate | 32 | 722 | 1,046 | 608 |
| Decoder, matched three/four-term rewrite | 33 | 721 | 1,045 | 598 |

All these examples have zero separate copy instructions and zero zero-fill
instructions. At the source implementation's 2 KiB chunk size, 8 and 32 scratch
arrays occupy 16 and 64 KiB. We have **not** identified a caller requiring either
scratch budget. They illustrate the computed frontier; they are not external
application requirements or measured cache thresholds.

The initial five-XOR reductions are about 0.76% and 0.69% at the respective
storage limits. The stronger encoder control uses fewer accesses and input
reads, while the basis candidate uses three fewer XORs. The decoder's stronger
matched rewrite needs one more buffer. Resource-aware selection among these
short rewrites is therefore part of the conventional optimization problem.

At 32 scratch arrays, the basis decoder still needs 722 XORs versus the original
519, and 1,046 modeled accesses versus 939. That is a memory/work exchange,
not an established CPU saving. The initial gate required improvement without
this increase in the other charged resources. It failed before hardware timing.

## Frozen initial screen

Inputs are the pinned 10-data/4-parity encoder and decoder from the survey.
Decoding removes fragments `[2,4,5,6]`. Both the existing fused order and the
existing bottom-up scheduled order are tested. The mathematical outputs and
required output-buffer placement remain identical across candidates.

At every internal instruction boundary:

1. Find the values produced before the boundary which a later instruction uses,
   together with already-produced final outputs.
2. Preserve final outputs. Greedily select independent live values, using four
   priorities: future-use count, next use, value weight times use count, or
   recency. Address arithmetic and new framed transformations are absent.
3. Also select conventional top-q retained sets with those priorities: q is
   zero, one-quarter, one-half, three-quarters, all optional live values, or the
   number retained by the independent-set selection. Duplicate sets at a cut
   are merged.
4. Test three reconstruction policies on the **same** retained sets:
   original-expression rematerialization; that policy plus one/two-array XOR
   identities; and those options plus general GF(2) basis reconstruction.

Each omitted value is substituted into its future consumers. XOR cancellation
is applied and dead instructions are removed. Earlier instructions are retained
when still needed to produce other values. Reconstruction costs are thus in the
resulting literal program; omitted values do not become free oracle inputs.

General reconstruction tries two deterministic basis orders, preferring stored
arrays before immutable input arrays. The locally chosen expression minimizes
operand count, then input reads, then a deterministic tie-break. This local
choice need not minimize the complete program: cancellations and extended
lifetimes can change the global costs. Every resulting program is scored again.

The initial run evaluated **40,432 programs**. Its plan and implementation hashes
were written before the case loop. The controls receive even the retained sets
chosen using independence, making the reconstruction ablation deliberately
stronger than a comparison against a different retention heuristic alone.

## Resource model and gate

An instruction computes an elementwise XOR of its sources into one array.
For k distinct operands it costs max(k-1,0) XORs, k reads and one write.
One-operand copies and zero-operand writes are counted separately. Input reads
are tracked in addition to total accesses. No reconstruction or output copy is
omitted from this accounting.

Backward interval allocation starts with the 32 terminal output slots fixed to
their required positions. Moving backward frees a target slot before assigning
its input lifetimes, allowing a target to reuse an input consumed by that
instruction. This models loading an element's sources before storing that
element's result. The independent forward-liveness audit agrees with the
allocated peak for every tested program. The allocation needs no final output
permutation or copy.

The model assumes fused elementwise execution. Fan-in reaches 55 in the full
screen; register pressure and real generated-code traffic could make such
programs slower than the static counts suggest. Access counts are not measured
cache misses or actual hardware traffic. Runtime compilation and synthesis cost
would also require amortization in any later implementation.

The predeclared timing gate required all of the following:

- No ordinary tested program weakly dominates the candidate across scratch,
  XORs, total accesses, copies, input reads and zero writes.
- The candidate strictly dominates its matched short-identity ablation.
- Against the original scheduled program, no charged resource increases, and
  either scratch falls at least 10%, XORs fall at least 5%, or accesses fall at
  least 5%.

**Zero candidates qualified.** This is a conservative implementation gate. It
does not prove that a memory/work tradeoff cannot win under a real storage limit
or on a particular machine. No such workload constraint or timing result was
established here.

## Stronger conventional controls and attribution

The initial resource frontier contained 164 distinct representative points not
covered by its ordinary controls. An explicitly adaptive follow-up revisited
all 164, using a table of pair XORs to find three-term identities (one plus a
pair) and four-term identities (pair plus pair). It used no general basis solve.
Original rematerialization and the earlier short alternatives remained available.
Every new physical program was checked, including output placement and reads
from initially arbitrary scratch contents.

Combining those controls with the original ordinary frontier covers **129/164**
points. The 35 remaining points comprise 10 encoder and 25 decoder programs.
Their metadata labels 34 retained sets as top-q and one as independently
selected; when generation methods choose the same set, its first label is kept.
These labels alone do not prove independence selection is necessary or absent.

Inspection of the actual changed recipes gives a sharper attribution check:

- In 24 of the 35, every new recipe has at most four operands. The general solve
  is one way to discover/select these short identities. This is not evidence
  that the application needs a general basis construction.
- The other 11 use recipes of length five, six or eight. They remain small static
  tradeoff candidates in this restricted search, not successful performance
  results or previously unknown algebra.

For example, all six recipe changes in the 32-buffer decoder are also found by
the three/four-term identity search. Its greedy local choices make additional
changes and increase peak scratch to 33. Reproducing the exact 32-buffer program
with a conventional resource-aware selector remains an optimization task; the
expressibility observation is **not** a claim that an independently run solver
already selected that exact program.

This search was motivated by the sister compiler's independent-row retention
and joint linear reconstruction. The actual mechanisms used here—binary
elimination, matroid-greedy independence selection, XOR identities, liveness and
rematerialization—are conventional. We did not use the new frame-containment
construction, its matroid intersection across future-use assignments, its
arbitrary-dirty wrapper or the exponent theorem. Thus even a future runtime win
from these recipes would initially support discovery-through-theory attribution.

Relevant primary prior art includes [Uezato's erasure-code program optimization](https://arxiv.org/abs/2108.02692),
[Boyar, Matthews and Peralta on linear straight-line programs](https://www.nist.gov/publications/shortest-linear-straight-line-program-computing-linear-forms),
and [three-input support for Boyar–Peralta optimization](https://eprint.iacr.org/2021/1400).
The new controls are simple conventional searches, not implementations of the
full Boyar–Peralta family, a SAT optimum, or an exhaustive literature comparison.

## Validation, scope and disposition

An independent auditor replayed every initial program as exact binary linear
forms against the pinned output matrices: 40,432 programs, representing
103,505,920 input/output coefficient equalities. This is bitset symbolic
verification, not that many separately timed executions. It also checked all
charged counts, forward live-value peaks, frontier coverage and the gate.
Small positive controls verify that general basis recovery and the allocator
are exercised. The 164 follow-up programs passed literal physical replay and
forward-liveness checks, representing another 419,840 output coefficients.

Limits: two operators, two source orders, one cut per candidate, existing live
values as the retained basis, greedy priorities and recipe choices. No exhaustive
multi-cut search, new intermediate synthesis or global optimality claim. The
three/four-term follow-up covers the initially uncovered frontier, not every
possible cut/retention combination with that stronger search.

**Park the performance port.** The screen preserves the small resource signals
without promoting them to CPU savings or a distinctive new-construction result.
Reopen with a real caller's memory constraint or a materially stronger static
candidate. The original survey, all earlier positive results and historical
artifacts are preserved.

Artifacts:

- `scripts/erasure_basis_screen.py`: frozen initial screen, allocator and checks.
- `scripts/audit_erasure_basis.py`: independent full-program audit.
- `scripts/erasure_basis_short_controls.py`: stronger adaptive conventional controls.
- `scripts/summarize_erasure_basis.py`: recipe-level mechanism classification.
- `results/erasure-basis-screen/`: initial plan, every score and compressed program,
  frontiers, validation, audit and progress log.
- `results/erasure-basis-short-controls/`: follow-up plan, every control program,
  coverage receipts, recipe classification and completion manifest.

Run screen scripts with `--out` pointing to fresh directories. Existing
directories and final audit files reject overwrite. The completion manifest
checks the inherited survey manifest and its history, plus the new artifacts.
