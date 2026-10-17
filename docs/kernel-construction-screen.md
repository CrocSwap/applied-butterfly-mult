# Workload-first kernel construction screen

October 7, 2026. **No candidate qualifies for machine-code implementation or
timing in this bounded screen. No new speedup or direct theoretical transfer.**

The proposed next experiment was to start with an actual FLINT operator and
adapt the sister project's construction tools to generate a better circuit.
The first audit corrected an assumption in that proposal: those tools are
specialized constructors and certificate searches, not a general FFT circuit
synthesizer.

## What the sister tools actually provide

| Tools | Actual capability | Relevance to an FFT leaf |
|---|---|---|
| `search_network.py`, `search_network_variants.py`, `research_networks.py` | Optimize or bound parameters in particular combinatorial counting families | No arbitrary operator input or arithmetic-circuit synthesis |
| `reuse_network.py`, `dag_network.py`, `incidence_network.py` | Construct and certify particular reversible incidence networks, with scratch restoration | No general transform factorization search |
| `paired_exclusion_circuit.py`, `paired_network.py` | Specialized paired-exclusion recursion retaining internal weights; downstream certificate | Requires its particular input/output incidence pattern |
| `shared_point_circuit.py`, `shared_point_network.py` | Merge equal pair-star sums across common-point groups | Equality rule depends on triple-incidence provenance |
| `exclusion_circuit.py` | Specialized exclusion recursion, plus reusable sum interning and balanced summation | The latter methods can be adapted to other exact sums |
| `experiments/exclusion_greedy.py`, `intersection_greedy.py` | Conventional frequent-pair factoring for specified incidence matrices | A useful ordinary control, not a specific theoretical construction |
| `experiments/block_completion.py` | Numerical low-rank completion of specified constrained Gram matrices | Does not produce an FFT implementation or exact feasibility certificate |
| `audit_sparse_fusion.py`, `audit_fused_block.py` | Exact searches/identities in restricted phase families | Their direct FFT substitution was already rejected in the [phase screen](phase-fusion-screen.md) |

These are capabilities of the inspected scripts, not a claim that no possible
adaptation could extend them. The inspection hashes are in the new plan.

## Concrete bounded adaptation

We reused the **actual, unmodified `ExclusionCircuit.add` and `total` methods**.
They identify a sum by the set of its input atoms, so differently parenthesized
expressions with equal support can share a node. We changed initialization to
accept atoms of the form `constant * input[column]` over a prime field.

The targets were the exact operators from the pinned FLINT leaf probes:

- lengths 16 and 32;
- forward and unnormalized inverse;
- twiddle indices 0 through 7;
- primes 257 and 1108307720798209;
- the actual physical output/input permutation of the FLINT leaves.

For each of these 64 operators we constructed circuits using three policies:
balanced sums in column order, balanced sums in coefficient order, and greedy
factoring of frequently repeated pairs. Each policy ran both with the sister's
support interning and with ordinary commutative expression interning that does
not reassociate sums. That produced **384 exact circuits** and 192 matched
sharing ablations. All circuits are saved, not just the best ones.

A positive control confirms the intended distinction: `(a+b)+c` and `a+(b+c)`
share a node under support interning but not structural expression interning.
Both reject overlapping supports. On the actual generated transform circuits,
however, **all 192 ablations had identical addition counts**.

This adaptation does not use the paired-exclusion recursion, retained internal
weights, or common-point construction. Support interning is a general algebraic
technique. Even a benefit from it alone would not establish dependence on a
specific result of the theoretical work.

## Arithmetic screen

We compared scalar field operations with the existing logical radix-2
factorization, whose complete operator agrees with the original FLINT probes.
An add and a subtract each count as one operation. Multiplication by `1` is
free; multiplication by `-1` is counted separately as negation. Inverse
normalization is absent in both operators.

| Length | Existing butterfly additions/subtractions | Generated additions, all policies | Existing nontrivial constant multiplications | Generated nontrivial constant multiplications |
|---|---:|---:|---:|---:|
| 16 | 64 | 170–240 | 17–32 | 140–240 |
| 32 | 160 | 682–992 | 49–80 | 620–992 |

Ranges span fields, directions and twiddle indices; endpoints need not belong
to the same case. **Every individual generated circuit used more additions
and more nontrivial multiplications than its corresponding butterfly.**

The gate was deliberately conservative: proceed to machine-code qualification
only after finding a candidate with no worse arithmetic counts in each category
and at least one strict saving. None passed. No timing was performed, and these
counts are not CPU instruction counts or measured slowdown factors.

The comparison grants generated circuits free constant preparation, modular
reduction, data movement and unlimited registers. A surviving candidate would
still need range proofs, scheduling, register-pressure analysis, implementation
and timing. Those steps are not warranted for these candidates.

### Why this search is limited

The generated circuits start from weighted terms of a dense matrix. They can
share equal sums, but do not discover distributive factorizations that move a
multiplication outside a sum, introduce cancellation, or change the operator's
factorization. The butterfly already exploits those additional structures.
The unfavorable results are therefore unsurprising and do **not** rule out a
new FFT factorization or a richer synthesis approach.

Building such a richer synthesizer would be a new research project. The sister
tools audited here do not already supply it. Calling an ordinary FFT optimizer
an application of the theoretical construction would overstate the connection.

## Verification and decision

The construction runner checks every generated coefficient vector. A separate
artifact auditor evaluates the saved circuits without importing the generator,
compares them with independent dense polynomial-evaluation/inverse formulas,
and checks the original pinned FLINT basis probes. Each pass checks 245,760
matrix entries. It also recounts live arithmetic and verifies earlier evidence
fingerprints, including the hard-path campaign's measured artifacts.

**Close this bounded tool-reuse attempt.** It produced no competitive circuit
and no theory-specific capability advantage. The earlier measured FLINT gains
remain valid. Reopening this direction should start with an explicit new
factorization rule or construction that applies to a concrete operator, rather
than assuming a generic synthesizer exists in the sister project.

## Evidence and reproduction

- [Construction runner](../scripts/screen_kernel_construction.py)
- [Independent artifact audit](../scripts/audit_kernel_construction.py)
- [Recorded plan](../results/kernel-construction-screen/plan.json)
- [Complete results and matched ablations](../results/kernel-construction-screen/summary.json)
- [Independent audit](../results/kernel-construction-screen/audit.json)

Run from the repository root, using a fresh directory:

```sh
python3 scripts/screen_kernel_construction.py --output /tmp/kernel-construction-screen
python3 scripts/audit_kernel_construction.py --screen /tmp/kernel-construction-screen
```

FLINT sources, the baseline library and historical evidence were not modified.
