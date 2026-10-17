# Encrypted transforms and positive probability sums: application screen

## Decision

**No new speedup or ready construction port passes this screen.** OpenFHE has a
real expensive operator, but no exact, cheaper mapping from the sister network
was found. Bayesian score summation now has public code, data, an actual
cancellation-handling caller, and a stronger positive-summation baseline.
However, none of 19,096 captured Gibby sum calls satisfies our conservative
whole-table pair-only/two-exclusion replacement condition.

Retain the Bayesian traces as an application corpus for a possible extension to
larger parent sets. Do not implement a pair-only replacement or a full encrypted
network on the present evidence. This is a narrowed research direction, not a
proof that either application admits no construction-derived improvement.

## Scope

8 October 2026. This is a bounded source, algebra, and query-shape investigation.
It does not establish a speedup, a cryptographic implementation, or a certified
probability computation. Sister checkout:
`56b66d58297deca1d7dd130247d720e960f77a37`, read only.

The objective is a competitive application of a specific sister construction.
Generic low-rank decomposition, denominator tracking, and retained layouts are
not sufficient attribution by themselves.

## 1. OpenFHE: real expensive transforms, no ready construction transfer

Pinned `openfheorg/openfhe-development` at
`6206d24f9eefefc620b524a4f2b9f308feb91e9f`. The public CKKS bootstrap examples
provide a complete caller: coefficient-to-slot conversion, nonlinear modular
reduction, and slot-to-coefficient conversion. This is a real application of
linear transforms on encrypted data. These sources were inspected, not built.

The inspected baseline is substantially stronger than independent rotations:

- `EvalLinearTransform` shares digit decomposition across baby rotations, uses
  Horner accumulation for giant steps, and returns from the extended basis once.
- `EvalCoeffsToSlots` and `EvalSlotsToCoeffs` collapse FFT layers according to a
  level budget. Their costs include plaintext products, rotations, modulus
  reduction, key switching and intermediate ciphertexts.
- `GetGiantStepRotation` retains the key and automorphism map for a fixed stride.
- The coefficient-to-slot implementation accounts for an accumulated output
  rotation inside its final extended-basis stage. Functional bootstrapping also
  exposes bit reversal in plaintext encoding/decoding and reuse of intermediate
  exponential powers across outputs. Those mechanisms are already baseline work.

Primary source locations are the pinned `ckksrns-fhe.cpp`, especially lines
103–155 and functions at 2568–2859, `ckksrns-utils.cpp`'s
`CoeffEncodingOneLevel`/`CoeffEncodingCollapse`, and the two bootstrap guides.
[OpenFHE source](https://github.com/openfheorg/openfhe-development/blob/6206d24f9eefefc620b524a4f2b9f308feb91e9f/src/pke/lib/scheme/ckksrns/ckksrns-fhe.cpp)

### Why the sister butterfly is not a direct replacement

The sister's constant phase butterfly acts along binary address directions.
OpenFHE's encoding layers carry position-dependent roots of unity. A Walsh or
constant phase circuit cannot simply replace these twiddle-weighted layers.
An exact operator identity including twiddles, scaling and slot layout is missing.

Even the address operations have different costs. For N fully packed cyclic slots,
flipping binary bit j is representable as masked rotations by +2^j and -2^j.
These coincide only at the highest bit. Exact index checks for N=2 through 1024
verify this decomposition. For example, at N=64 there are two nonzero cyclic
diagonals per lower-bit flip and one for the highest bit. Bit reversal has 27
cyclic diagonals in its direct matrix representation at N=64, and 77 at N=256.
These counts are **not lower bounds** over compositions, BSGS, alternate packing,
or plaintext endpoint reordering. They illustrate why scalar XOR/add counts are
not encrypted rotation counts.

Keeping a permutation across an elementwise operation is an ordinary possible
optimization; arbitrary linear mixing cannot be kept for free across nonlinear
modular reduction. Even an eliminated final cyclic rotation would need comparison
with straightforward changes to precomputed transform diagonals before attributing
it to the sister network. The rational-frame/dirty-role compiler has no established
mapping to this cost model.

**Decision:** do not port the finite network or build a cryptographic benchmark yet.
A future candidate must supply an exact CKKS transform factorization and a complete
resource schedule that improves this pinned baseline at the same precision, level
budget and security parameters. Recent rotation-sharing literature is also required:
[triple-hoisted BSGS](https://arxiv.org/abs/2605.17222).

## 2. Sumu: a concrete cancellation-sensitive caller

Pinned `Sums-of-Products/sumu` at
`d0e2d6dd5a42053bf507dfd06c4de8129c0b6a9d`. Gadget samples Bayesian network
structures. `PartitionMCMC._pi` asks for local score sums using the union of
earlier partition blocks as U and the immediately preceding block as T.
Within candidate parents the operator is

    tau_v(U,T) = sum w_v(P), over P subset U with P intersect T nonempty.

The score weights are nonnegative. The empty-required-set case has separate API
handling. The conventional identity subtracts two subset sums:

    tau_v(U,T) = tau_v(U) - tau_v(U minus T).

The library explicitly documents catastrophic cancellation, maintains a cache of
problematic sums, and falls back to positive scans. Its defaults include a 2^-32
log-gap cancellation tolerance and a maximum cache of ten million entries, plus
nonzero pruning and summation tolerances. `GroundSetIntersectSums::scan_sum`
sorts weights and can terminate after negligible contributions. This is neither
arbitrary-precision ball arithmetic nor a rigorous interval-certified interface.
[Pinned source](https://github.com/Sums-of-Products/sumu/blob/d0e2d6dd5a42053bf507dfd06c4de8129c0b6a9d/sumu/weight_sum/CandidateRestrictedScore.cpp)

The original authors already describe a positive first-hit decomposition and
selective precomputation for troublesome queries. Consequently, discovering
positive summation here would not itself be a new contribution.
[Supplement, A.2](https://papers.neurips.cc/paper_files/paper/2020/file/48f7d3043bc03e6c48a6f0ebc0f258a8-Supplemental.pdf)

### Exact construction match and its restrictions

For a fixed child and fixed T, gate each pair weight by whether it intersects T.
If U is the candidate universe minus a forbidden pair F, the sister's paired
exclusion circuit computes the contribution from two-parent sets exactly.
Singleton/empty contributions require separate handling. Higher-cardinality
parent sets are not represented by this circuit. A three-parent set with positive
weight gives an immediate counterexample to an unrestricted replacement.

Thus a useful batch needs repeated forbidden pairs for the same table and T,
sufficient work in the pair portion, and an efficient treatment of all other
contributions. Changing the model to forbid larger parent sets merely to obtain
this match is not justified. Exact checks validate 74,700 pair-map coefficients
and 314,078 coefficients of the ordinary first-hit recurrence; these are algebraic
fixtures, not workload-frequency measurements.

## 3. Gibby: stronger baseline and runnable query source

The 2025 work on Bayesian DAG sampling introduces stronger score pruning and
supplies an implementation and benchmark inputs. We therefore included its
positive scans before considering a new circuit. This is an additional baseline,
not a claim that one sampler uniformly replaces another or mixes identically.
[Paper](https://arxiv.org/abs/2510.25254)

Pinned `sums-of-products/gibby` at
`4aae8cefb7c9ca3f8ddbf0ed18bd9198beb9aa80`. `RangeSums::scansum` already sums
surviving weights positively using an extended-range numeric representation and
a tolerance-based cutoff. Its interface tests intersection with L; the paper's
interval formulation agrees for empty/singleton required sets. We inspect actual
code semantics in the trace rather than assuming arbitrary L means containment.
[Pinned implementation](https://github.com/sums-of-products/gibby/blob/4aae8cefb7c9ca3f8ddbf0ed18bd9198beb9aa80/src/RangeSums.hpp)

The trace plan uses the repository's Asia and Sachs benchmark data, native
unpruned and bottom-up-pruned modes, unrestricted indegree, all candidate parents,
fixed seed 81009, 2 burn-in and 20 main iterations with 100 basic, 20 reversal and
10 blanket moves per iteration. This shortened run measures operator/query shapes;
it does not establish posterior convergence or comparative sampling efficiency.
The working source copy only logs immutable score tables and sum-query arguments;
the reference snapshot is untouched. The same compiler builds an uninstrumented
control, and sampled DAGs and score files must remain byte-identical.

The source defaults differ from some README entries; pruning and precision are
specified explicitly (-P 0/2, -a 15). No two-parent constraint is imposed.

### Trace results

| Input | Pruning | Sum calls | Calls on nonempty tables | Calls excluding two supported labels | Whole-table pair-only matches |
|---|---|---:|---:|---:|---:|
| Asia | None | 4,674 | 2,694 | 481 | 0 |
| Asia | Bottom-up | 4,706 | 2,726 | 525 | 0 |
| Sachs | None | 4,858 | 2,878 | 408 | 0 |
| Sachs | Bottom-up | 4,858 | 2,878 | 408 | 0 |

There are two RangeSums banks, so these are internal sum calls, not distinct
MCMC moves. Empty banks account for part of the call count. Exclusions are counted
relative to the union of labels present in the retained score table; this avoids
counting labels that cannot affect its answer. This is an algebraic eligibility
test rather than a profitability test. Table/required-set reuse would additionally
be needed to amortize evaluation of every forbidden-pair output.

Unpruned Asia tables contain 128 sets each, with maximum size seven. Pruned tables
retain 102–128 sets, with maximum size five to seven. Unpruned Sachs tables contain
1,024 sets each, with maximum size ten. Pruned Sachs tables retain **32–163 sets,
with maximum size three or four**. The retained tables and exact observed query
masks are saved. Values exported as log doubles are diagnostics, not an exact
serialization of the internal extended-range numbers.

The native sampler's DAG and score files are byte-identical with and without
instrumentation in all four cases. This checks that logging preserved these
sampled paths; it does not independently prove the upstream sampler correct.
Only one seed and two small public benchmark inputs were used. The trace includes
burn-in. No wall time from these instrumented executions is reported as a profile
or performance result.

Zero matches applies to replacing a **complete retained table** with the existing
pair circuit under the declared condition. Splitting off pair contributions while
separately handling larger sets remains mathematically possible; this pass supplies
no evidence that its extra preparation, storage and fallback are profitable.
Likewise, native tolerance-based stopping might make some larger sets negligible
for some queries, but this cannot be assumed without charging and validating that
additional approximation under the original accuracy contract.

### A concrete next research gate

The most useful follow-up would be a static cost screen on the pruned Sachs
tables: can an extension of the sister's retained-contribution recursion to
three/four-element inputs share positive sums across the **observed** queries,
beating the existing sorted scans, selective caching, and ordinary positive
first-hit/trie aggregation? Charge all setup and unused computed outputs; retain
the original score and error contract. Removing the sister-specific mechanism
must worsen the resulting schedule before making an attribution claim.

This is a new algorithmic question, not a currently available construction.
There is no reason yet to broaden timing runs or install an encrypted library.

## Reproduction and evidence

- `scripts/encrypted_probability_survey.py`: source blob checks, separate original
  and traced builds, fixed query runs and shape analysis.
- `scripts/check_encrypted_probability_contracts.py`: exact index/support checks.
- `results/encrypted-probability-survey/`: commit pins, original source/license
  snapshots, fixed plan, build logs, query traces and summaries.

Scripts refuse existing outputs. Preserve the recorded run and use fresh paths
for any repeat. Neither OpenFHE nor Sumu was installed, no FLINT source/library
was changed, and no external author was contacted.

The trace logger's first compilation failed because the upstream numeric
`get_log()` method is not const-qualified. The corrected logger copies the value
before reading it; the failed header and compiler diagnostics are retained.
Downloaded files were checked against Git blob hashes, including original line
endings. There are 36 verified upstream source/data/license blobs and 1,797
verified inherited fingerprints. The exact index/support checks total 18,434 XOR
coordinate checks, 314,078 first-hit coefficient checks and 74,700 pair-map checks.
The completion manifest links to the preceding Walsh qualification record.
