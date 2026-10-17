# QROM compatibility survey

## Decision

**A genuine borrowed-scratch application exists, but this bounded survey found
no concrete competitive transfer of the sister compiler.** Do not port the whole
compiler or claim a quantum resource improvement on this evidence.

The successful part is the contract match: coherent lookup can borrow qubits in
unknown, possibly entangled states and must return them unchanged. The missing
part is a specific circuit region where the sister construction removes work
after accounting for address selection, phase semantics, and existing shared
cleanup. No new circuit, timing result, or hardware saving is reported.

## Implementations and application boundary

Qualtran is pinned at `585da53e92f1593d22e70b9fc6f05227319c22b2`.
Nine source/license files are retained under
`results/qrom-compatibility/sources/qualtran`, with Git blob checks.

The actual dirty branch in `SelectSwapQROM._build_composite_bloq_with_swz`
has chronological block order

    L, S, C, S^-1, L^-1, S, C, S^-1.

Here L loads the high-address-selected table block into the dirty bank, S routes
the selected row to position zero, and C XORs that row into the output. The second
read cancels the original dirty value. Borrowed allocation is explicit; the
upstream tests include nontrivial dirty-state preparation. The QROM loader also
prunes equal-data ranges. A table-aware baseline must retain that optimization.
[Pinned implementation](https://github.com/quantumlib/Qualtran/blob/585da53e92f1593d22e70b9fc6f05227319c22b2/qualtran/bloqs/data_loading/select_swap_qrom.py).

We inspected application code as well. Alias-sampling preparation uses ordinary
QROM. The tensor-hypercontraction basis-rotation caller loads Givens angles with
`QROAMClean`, not `SelectSwapQROM`; its preparation caller also uses clean QROAM.
These establish real lookup consumers, but do not establish an active dirty-QROM
hot path in those callers. Changing their workspace contract would require a
complete caller comparison. No molecular input trace was collected.
[Pinned rotation caller](https://github.com/quantumlib/Qualtran/blob/585da53e92f1593d22e70b9fc6f05227319c22b2/qualtran/bloqs/chemistry/thc/select_bloq.py).

## Existing competitors

Borrowing unknown qubits to reduce lookup cost is established in
[Low–Kliuchnikov–Schaeffer](https://arxiv.org/abs/1812.00954v2), originally posted
in 2018 and published in 2024. Scratch restoration itself cannot supply new
attribution here.

[Motlagh–Pocrnic, May 2026](https://arxiv.org/html/2605.20334v1), replace paired
selected swaps with selected copies and share successive unload/load operations.
For m compatible packets, the table-pass count becomes m+1 instead of 2m.
Their method also shares dirty-mask correction. Consequently, retaining table
signals between successive lookups is already a baseline. PennyLane exposes
`SelectCopyQROM` as a resource-estimation operator; that is not by itself an
executed gate-level implementation.
[Official API](https://docs.pennylane.ai/en/latest/code/api/api/pennylane.labs.estimator_beta.templates.SelectCopyQROM.html).

[Motlagh, October 1, 2026](https://arxiv.org/html/2610.02321v1), supplies another
relevant baseline: Pauli dense encoding stores two classical labels through X
and Z actions on each dirty qubit. Its primitive restores the bank through a
commutator, and it combines with sequential packets. We checked the elementary
identity below, not the complete construction or its optimized resource bounds.
The preprint itself leaves physical layout and scheduling qualification open.

If clean helper qubits are tightly constrained, compare also with
[Khattar–Gidney's conditionally clean constructions](https://arxiv.org/abs/2407.17966v2).
They optimize unary iteration and other nonlinear building blocks. A fixed clean
helper allowance must be part of any future gate/ancilla comparison.

## Mapping the sister mechanisms

Sister checkout: `56b66d58297deca1d7dd130247d720e960f77a37`.
We inspected `research/joint-dual/PROOF.md` and the original and revised
reclamation compilers. The previously replayed construction is not rerun here.

| Proposed transfer | What the QROM region actually requires | Outcome |
|---|---|---|
| Joint binary row synthesis | The fixed payload fanout at a single decoded address is linear | Possible interface, but the literal one-control fanout already uses one CNOT per changed target; no gate-count opportunity in that isolated block |
| Retain signals and reclaim roles | Preserve unknown bank contents while sharing successive table updates | Genuine requirement; existing sequential QROM already shares those updates and cleanup |
| Compile the selected read | Read a row selected by a coherent address | Not a fixed binary linear map of all quantum inputs |
| Interpret rational address frames as quantum phase frames | Track Pauli signs and conjugation across quantum gates | No such identification is established; these are different mathematical objects |

The local fanout observation is deliberately narrow. Each two-qubit CNOT changes
only its target, and all w specified target bits must acquire the control, so w
CNOTs are necessary in that gate model; the loader uses w. This does not settle
cross-address synthesis, depth, connectivity, or alternative native gate sets.
Sharing across decoded addresses would have to include the cost of retaining or
recomputing their indicators. Streaming unary iteration does not provide every
indicator simultaneously for free.

### A small explicit obstruction

Even selecting one of two unknown bank bits is

    read(r,d0,d1) = d0 XOR (r AND d0) XOR (r AND d1).

This has Boolean degree two. A fixed sequence of CNOT and X gates computes an
affine map, so it cannot implement this read for a coherent address r. Fixing r
while synthesizing each branch is legitimate only if the implementation also
pays for branch selection. The script independently derives this polynomial and
checks all six invertible changes of coordinates of the two-bit bank: each still
has a degree-two selected read.

This is not a lower bound on general QROM gate complexity. Toffoli gates,
measurement-assisted methods, structured tables, and broader quantum synthesis
are outside that restricted statement.

The sister compiler's rational frame containment controls legal address moves
in its original model. The inspected lookup interfaces impose no corresponding
family of rational subspaces. Assigning every qubit one artificial common frame
would retain ordinary linear synthesis while discarding the distinctive frame
mechanism. The entire sister wrapper, stripped of its address semantics, remains
the simple map `(x,z,d) -> (x,z XOR x,d)` and is not a useful QROM benchmark.

### Quantum phases need additional semantics

For the dense-encoding primitive let P = X^a Z^z and let R apply Z^v or X^v
according to the address bit p. The chronological sequence R,P,R,P-dagger is
the identity on the borrowed qubit times the desired phase on the output.
Replacing P-dagger with P can introduce an address-dependent sign. A binary
payload replay alone would miss that error. Our signed replay checks all 32
basis columns and detects eight failures of this deliberately incorrect inverse.

More generally, a CNOT change of basis acts on both Pauli components: X labels
transform by M and Z labels by inverse-transpose M. A quantum adaptation must
preserve commutation and phase information as well as the GF(2) payload. The
sister row compiler alone does not provide that contract. This leaves room for
a future adaptation, but supplies no present resource saving.

## Exact checks and limits

`scripts/qrom_compatibility.py` uses standard-library integer arithmetic and
parses the pinned block schedule without importing Qualtran.

| Check | Scope | Result |
|---|---|---:|
| Dirty lookup | All tables, addresses, arbitrary outputs and dirty banks for (N,b,B) = (4,1,2), (4,2,2), (8,1,4); ideal swap and copy versions | 131,584 basis columns for each version |
| Shared packet cleanup | All two-row one-bit packet banks, 1–4 packets, all outputs and dirty states | 37,440 basis columns |
| Dense primitive | Exact signed permutation, including all address/output controls | 32 basis columns |
| Invalid dense inverse | Negative control retaining classical labels but using the wrong phase | 8 failures detected |
| Source preservation | Frozen predecessor chain and retained Git blobs | 1,963 historical fingerprints and 9 source blobs verified |

The phase-free permutation checks establish complete operator identities for
these finite abstract models, hence also preserve superpositions and external
entanglement. They do not execute Qualtran's implementation: in particular its
approximate-CSWAP decomposition and associated phases were not independently
audited. The dense check covers its primitive only, not full multi-packet dense
QROM. No library installation, CPU benchmark, or physical-qubit estimate was
needed for this contract screen.

For four packets our elementary model changes eight table loads to five, plus
paid output CNOTs and selected reads. This is a check of existing sequential
sharing, not a new 37.5% resource or runtime improvement. Table passes are not
complete gate counts.

## Reopening criterion

Reopen only with a specific nontrivial linear or Clifford region extracted from
a real caller and a candidate rewrite. Compare full gate count, depth, clean and
dirty qubits at the same output/phase contract; retain current QROM and
uncomputation methods as alternatives. Charge entry/exit basis conversions and
all restoration. Require an ablation that removes the particular sister feature.

For now, the contract screen is complete and the performance port is parked.
This does not close quantum compilation in general. It prevents treating a
shared vocabulary of frames and dirty scratch as evidence of a useful transfer.

## Reproduction

The original receipt is immutable. To rerun into a fresh destination:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 scripts/qrom_compatibility.py --out /tmp/qrom-checks-new.json
```

The runner refuses an existing destination. `results/qrom-compatibility/checks.json`
contains the original checks; `completion.json` records artifact hashes and the
inherited preservation chain. Earlier experimental artifacts remain unchanged.
