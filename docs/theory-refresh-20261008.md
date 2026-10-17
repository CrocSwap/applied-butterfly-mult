# Theory refresh: possible practical transfers, 8 October 2026

## Scope and recommendation

Surveyed the clean local sister checkout at
`56b66d58297deca1d7dd130247d720e960f77a37`. Our previous direct sister-construction
screen, `weighted-phase-application.md`, pinned
`1c09a5887e3f900798eef904371441ab18c057de` (the 2^-31 checkpoint). The new
constructions discussed below were added after that checkpoint. Later H4/H8
experiments here used older Alman–Rao constructions rather than these additions.

The current sister README selects conditional kappa approximately
`5.1016920170078e-5 > 2^-15`; release/history pages retain older numbers. That
exponent change is not a practical runtime claim. The selected bit witness still
has 137,151,806 physical roles; directly executing it is not the proposed task.

**Best next bounded screen: the new Gaussian correction-power bound at genuinely
high precision.** There is a direct link to a specific sister-project analytic
result, and a small exact calculation survives a stronger conventional bound in
two high-precision examples. This is an opportunity to investigate, not a measured
speedup or a confirmed application. Before implementation, compare stronger
conventional error certificates and optimize parameters under the same accuracy
contract. A later library target would be awkward-length complex DFTs, compared
with FLINT's actual Bluestein path and all resampling overhead included.

The other substantial additions offer workspace or exact-representation ideas.
Neither currently supplies a drop-in faster FLINT transform. The earlier negative
Float64 result and positive high-precision H4/H8 kernel results remain unchanged.

## 1. Gaussian resampling: a new bound with a finite-size opportunity

The new `notes/fast-gaussian-resampling.tex` (eumemic's construction, with the
subsequent icekylinx chirp-error correction) proves a bound on powers of the
specific Gaussian resampling correction operator E. Writing sigma=t/s=1+theta,
its older sufficient count is ceil(p/(alpha^2 theta)). A sufficient new count is

    min(ceil(p/(alpha^2 theta)), ceil((p+1)/(4 alpha^2) + 1/theta)).

The argument controls products along paths, with a telescoping potential. It can
certify a shorter correction series than repeatedly applying a one-step norm
bound. This is a transfer of a mathematical estimate, with direct attribution to
that estimate, if it ultimately reduces a competitive computation's work.

### A stronger conventional bound changes the initial impression

We checked s=1031, t=1280, theta=249/1031 with exact rational arithmetic. All four
examples satisfy the stated p, alpha, oversampling and coprimality restrictions.
The actual operator is

    (E u)_j = sum_{h != 0} exp(-pi alpha^2 X_{j,h}) u_{j+h},
    X_{j,h} = (sigma*h + beta_j)^2 - beta_{j+h}^2,
    beta_j = sigma*j - floor(sigma*j + 1/2), periodic modulo s.

For a stronger ordinary comparator, enumerate the nearest-shift minima h=±1
exactly and bound the |h|>=2 tail by a geometric series. Since |beta_j|<=1/2,

    X_{j,h} >= sigma^2 h^2 - sigma |h|  for |h|>=2.

Successive tail exponents differ by at least `5 sigma^2 - sigma`. Using the
source's lower bound pi/log(2)>4.531, conservatively replace it by 4.5 and floor
the positive exponents. This gives a rational bound r>=||E||_infinity and an exact
check of the least n with r^n<=2^-p. No floating-point exponential is used.

| p, bits | alpha | Older sufficient count | New power bound | Stronger ordinary norm bound |
|---:|---:|---:|---:|---:|
| 512 | 8 | 34 | 7 | **4** |
| 4,096 | 16 | 67 | 9 | **8** |
| 16,384 | 24 | 118 | **12** | 14 |
| 65,536 | 32 | 265 | **21** | 30 |

The last two rows reduce the sufficient term count against this stronger
comparator by about 14% and 30%. **These are error-bound comparisons, not runtime
measurements or observed required iterations.** They concern ||E^n||, not the
complete inverse/DFT error. Each row holds alpha fixed across methods. Joint
parameter tuning, row-specific sharper norms, multi-step norm bounds and certified
residual stopping could narrow or remove the advantage.

The inspected FLINT `gr_dft/bluestein.c` provides a concrete eventual competitor:
odd-length DFT via a precomputed chirped convolution, using a power-of-two
convolution length at least 2n-1. The Gaussian method would have to pay for map
setup, kernel generation, corrections, resampling, output restoration, and guard
precision. Its proof has significant precision-amplification costs (including a
conservative 34p internal map bound). A smaller central transform or fewer terms
alone is insufficient. The bounded local search did not identify an existing
Gaussian-resampling caller in the inspected FLINT DFT/theta directories.

**Proposed gate:** first verify complete inverse-error certificates at optimized
parameters against strong conventional certificates on a small high-precision
matrix family. Stop if the new estimate removes no work. Only then consider a
reusable-plan DFT prototype against Bluestein with matched achieved accuracy.
High precision here must be part of the requested mathematical computation,
not an unexplained change to HadaMAG's Float64 contract.

## 2. Equal-frame compilation and paid scratch reclamation

PR #57 (eumemic) treats a region of scalar operations with the same rational
address frame as one binary linear map. It selects independent outputs, preserves
useful incoming signals, completes an invertible map, emits explicit XORs, and
reclaims compatible retired roles after paying for signal clearing. PR #60
(Chafik Boukhalfa) changes the reclamation priority; PR #62 combines the compiler
with the new interval graph. This is materially broader than our earlier
per-gate phase/layout experiments.

The source is executable and independently replayable. We replayed the selected
h=23 serialized word on all 31,460 input/target/dirty basis vectors in both
orientations, including frame transitions. It passed: 27,918 auxiliary roles,
148,958 XORs in the mixer, 620,626 XORs in the complete wrapper. This is a finite
semantic check, not a new full theorem audit or performance measurement.

**Important application constraint:** if the address frames are discarded, the
complete wrapper simply implements `(x,z,d) -> (x,z XOR x,d)`. An unconstrained
classical or quantum implementation can do that with one XOR/CNOT per source
bit. Exporting the entire word as a quantum benchmark would impose unnecessary
constraints and create a misleading advantage.

The potentially reusable component is the compiler's treatment of intermediate
signals under genuine representation and workspace constraints. A real GF(2)
computation or quantum circuit would first need to expose such constraints. It
must be compared with ordinary liveness allocation, linear-map synthesis, and
recomputation under the same memory/gate contract. The current compiler is tied
to triple-source graphs and envelopes; it is not a generic drop-in compiler for
arbitrary FLINT additions or Acb arithmetic. No such application was established
in this quick pass.

## 3. Interval strips and pair assembly: fewer roles, more arithmetic

PR #53 skip-prefix strips, PR #55 dual-suffix strips, and PR #62 interval strips
and core-aware pair assembly offer new schedules for exact disjoint summation.
PR #62 computes cyclic intervals to expose carrier reuse. Their declared counts
show the practical tradeoff clearly:

| Axis | PR53 additions -> PR62 additions | PR53 roles -> PR62 roles | After joint compilation |
|---:|---:|---:|---:|
| h=23 | 40,329 -> 62,294 (+54.5%) | 32,946 -> 28,719 (-12.8%) | 27,918 roles |
| h=25 | 53,475 -> 86,595 (+61.9%) | 43,409 -> 37,676 (-13.2%) | 36,586 roles |

These are construction resource counts, not measured CPU savings or RAM
reductions in a conventional evaluator. The small interval gadget uses
k(k-2)+1 additions for k>=3; the full graph's physical-role objective differs
from minimizing arithmetic or ordinary peak live values. We independently
checked all leave-one-out supports and disjointness for three layouts at
lengths 1–13 (39 checks).

The natural application condition is expensive constrained workspace with cheap
recomputation. Cancellation-sensitive positive aggregation remains another
possible source of demand, but the new schedules do not remove our earlier
obstacles: ordinary subtraction, problem-specific solvers, the max-and-count
decomposition, and older monotone constructions remain competitors. More
additions can also increase floating-point error; disjoint support alone does
not establish a practical accuracy advantage. No graph-solver reopening is
justified solely by the improved exponent.

## 4. Gaussian parity and image-conditioned exact decoding

Alejandro Zarzuelo Urdiales's PR #45 and its integrated synthesis package supply
actual exact-arithmetic code and scoped formal proofs. Two distinct results matter:

- The synthetic phase butterfly C=(iI+X)/(1+i) has an exact Gaussian parity
  predicate and a completed D-axis binary-grid requirement ceil(D/2). The
  normalized Hadamard still needs D bits. This cannot be used to halve precision
  for our ordinary WHT or HadaMAG kernels.
- For the specific h=28,d=19 mixed-center producer, difference old/new dirty
  ports in one common scalar frame before decoding. On its exact image the
  total-recovery numerator is divisible by 32, and the final scatter numerator
  is divisible by 2. The supplied scalar schedule eliminates six additional
  fractional bits and reduces quotient calls from 26,268 to 3,286 relative to
  its stated reference. The reference is not an optimal conventional baseline.

The fast path requires an existing producer-image witness. A standalone full
image check costs another producer pass (78,608 Gaussian additions in the
archived evaluator); arbitrary per-role phase changes can invalidate the premise.
The six-bit reduction does not imply six bits saved in total magnitude, whole
program storage, or general floating-point arithmetic. Ordinary fixed common-
denominator representations and collect-before-divide baselines must be included.

We reran the earlier exact parity checker: 3,721 division cases, 13,122 pair cases,
72 tensor cases, 36 normalized-transform cases, and negative controls passed.
We read the later synthesis proof/code contracts and existing receipts; we did
not rebuild Lean or rerun its full 10,732,176-coefficient producer-image audit.
No external practical caller of that mixed-center operator was identified.

## What to retain and what to defer

1. **Screen the Gaussian power bound**, starting with the stronger conventional
   comparator above. This is the clearest new bounded numerical question.
2. **Keep joint compilation as a workspace-oriented lead**, requiring an actual
   constrained computation before porting the compiler.
3. **Keep exact Gaussian encoding as a niche representation lead**, requiring a
   native exact-dyadic/Gaussian application and a fair common-grid baseline.
4. Defer full interval-network ports, a return to the defeated graph solver,
   generic CNOT benchmarks of the copy wrapper, and more Float64 H4/H8 work.

Copied centers, partial swaps, fixed common bases, profile refinements, reordered
sums and paid clones were also surveyed through their review/proof records.
Their present savings mainly concern frame-rank distributions, child recurrences
and constrained role reuse. This pass found no direct replacement for a current
FLINT numerical primitive in those components.

## Evidence and limits

Local source survey only; no new literature-priority search, external contact,
performance benchmark, full multiplication audit or installed-library change.
Sister sources were read-only, bytecode writes disabled, and its checkout remained
clean. All prior butterflyMult records are preserved.

Primary inspected sources include:

- Sister `docs/research/community-round2-review.md`, `community-followup-review.md`.
- `research/pair-assembly/PROOF.md` and `pair_graph.py`.
- `scripts/experiments/binary_frame_compiler.py`, `binary_frame_replay.py`.
- `research/joint-dual/PROOF.md`, `research/split-skip/PROOF.md`.
- `research/gaussian-parity/README.md`, `verify_exact.py`.
- `research/gaussian-parity-synthesis/README.md`, `IMAGE_PROOF.md`.
- `notes/fast-gaussian-resampling.tex`, `docs/research/batched-review.md`.
- Local pinned FLINT `src/gr_dft/bluestein.c` and `precomp.c`.

`results/theory-refresh-20261008/` contains fresh finite-check receipts, exact
resource/bound calculations, and source/artifact hashes. Reproduce the small
checks with `PYTHONDONTWRITEBYTECODE=1 python3 scripts/theory_refresh_survey.py`;
use a new destination to preserve these recorded results.
