# Joint frame compiler: application-contract and resource survey

## Decision

**No candidate in this bounded survey passes the gate for a performance
prototype using the new frame compiler.** Erasure coding supplies a real,
reproducible workload with expensive binary-linear intermediates, but its
storage contract permits ordinary overwriting and sharing. We found no required
address frames or restoration of arbitrary temporary contents. Quantum circuits
have genuine reversibility constraints, but we have not identified an application
requiring this construction's additional address-frame structure.

This is a contract screen and conventional-baseline resource audit, not a
head-to-head implementation or proof that the compiler cannot help. The retained
erasure-code programs make a useful future corpus for ordinary linear synthesis.
They do not establish a new theory-derived speedup.

## What the theory supplies

The sister repository is pinned at
`56b66d58297deca1d7dd130247d720e960f77a37`. Its
`research/joint-dual/PROOF.md`, sections 1–3, distinguishes rational address
frames from GF(2) payload values. Within a common frame the compiler jointly
synthesizes output rows, retains compatible independent inputs, and completes
an invertible map. Matching selects independent retained continuations with
distinct uses. Reclamation requires frame containment, a signal-span check,
and paid XORs. An enclosing sequence restores arbitrary initial scratch.

Those restrictions are essential to the stated construction. They are not
automatically requirements of classical array programs. A classical dead array
can be overwritten; two readers can share one immutable array. Nor is a rational
address frame automatically a quantum phase frame or hardware coupling graph.

The whole scalar wrapper implements `(x,z,d) -> (x,z XOR x,d)`. Without its
address semantics, direct coordinate-wise XOR already implements that contract.
Comparing its large serialized word against a generic CNOT optimizer would
measure removal of imposed constraints, not a useful construction transfer.

## Candidate survey

| Candidate | Real resource constraint | Existing competitor | Disposition |
|---|---|---|---|
| XOR erasure coding | Large byte-array intermediates, input preservation, cache traffic | XOR compression, fusion, pebble scheduling, last-use allocation | Extracted and checked real programs below. No required frame/restoration contract found. |
| Dense GF(2) matrix arithmetic | Packed data, tables, memory locality | M4RI's M4RM and Strassen–Winograd hierarchy | No concrete fixed-operator caller with the required constraints found. General matrix multiplication is bilinear; fixed-input compilation needs amortization. |
| CNOT/Clifford synthesis | Reversibility, potentially ancilla and connectivity limits | PMH synthesis in Qiskit; existing matroid-based phase optimization | Relevant research area, but no matched application instance yet. Unconstrained invertible binary maps already admit in-place elimination without additional qubits. |

The erasure-code baseline is [Uezato's SC'21 work](https://arxiv.org/abs/2108.02692),
whose optimization stages address operations, memory traffic and scheduling.
For matrix arithmetic, see [Albrecht, Bard and Hart](https://arxiv.org/abs/0811.1714).
For quantum prior art, see [Qiskit's PMH implementation](https://github.com/Qiskit/qiskit/blob/main/qiskit/synthesis/linear/cnot_synth.py)
and [Amy, Maslov and Mosca's matroid-partitioning work](https://arxiv.org/abs/1303.2042).
These are baseline identifications; we did not benchmark M4RI or quantum packages.
Local FLINT `nmod_mat/mul.c` and `fq_nmod/add.c` were also inspected. Their
mutable arithmetic interfaces supply no such scratch-restoration requirement.
That limited inspection is not an exhaustive claim about every FLINT caller.

## Measured resource counts from existing erasure-code programs

Source: [xorslp_ec](https://github.com/yuezato/xorslp_ec/tree/9cb7f38112c9e2ec4197f841466989441ef388e1),
commit `9cb7f38112c9e2ec4197f841466989441ef388e1`, MIT license retained.
The author's program generator constructs modified systematic Vandermonde
Reed–Solomon matrices over GF(256), then expands them into binary maps.
Notation `(k,m)` means k data fragments plus m parity fragments.

We extracted encoding and decoding for `(4,2)`, `(8,2)`, `(10,4)`.
Missing fragments are `[2,3]` for m=2 and `[2,4,5,6]` for m=4, zero based.
Trivial identity rows are omitted, as in the author's benchmark; decoding
retains the rows reconstructing missing data. Each case has three programs:
XorRePair compression, compression plus fusion, and compression plus fusion
plus the author's bottom-up/MRU scheduler. These are existing optimizations.

| Case | Direct XORs | Compressed XORs | Scratch before reuse | Scheduled scratch | Scheduled scratch at 2 KiB/buffer |
|---|---:|---:|---:|---:|---:|
| (4,2) encode | 128 | 76 | 60 | 7 | 14 KiB |
| (4,2) decode | 212 | 85 | 69 | 8 | 16 KiB |
| (8,2) encode | 243 | 149 | 133 | 11 | 22 KiB |
| (8,2) decode | 494 | 169 | 153 | 31 | 62 KiB |
| (10,4) encode | 890 | 418 | 386 | 69 | 138 KiB |
| (10,4) decode | 1,368 | 519 | 487 | 110 | 220 KiB |

An XOR here is an elementwise array XOR, not a machine instruction. Scratch
excludes immutable input and required output buffers. The source processes
large fragments in chunks and reuses temporary storage across chunks; its
default chunk size is 2,048 bytes. Scratch does not scale with the full fragment
length in this implementation. Joint encode/decode execution can allocate the
larger of the two scratch requirements; rows above are individual programs.

For (10,4) encoding, fusion reduces modeled array accesses from 1,254 to 736;
scheduling retains that count and 418 XORs while reusing physical buffers.
These are static accesses, not measured bytes transferred through caches.
The README's older fusion-access figure differs; we retain counts generated by
the pinned code and do not claim reproduction of its throughput measurements.

For all six scheduled programs, an independent last-use analysis finds that
the number of allocated variable slots equals the peak number of simultaneously
live values, including outputs. Thus simple slot renaming cannot reduce storage
for these exact statement orders under the stated read-before-write model.
This is **not** a lower bound over rescheduling, changed circuits, recomputation,
or storing a different basis. The chosen scheduler is one existing heuristic,
not an asserted optimum among all conventional implementations.

At the other end of the tradeoff, computing each requested row directly in its
output array uses zero additional array buffers: copy its first input and XOR
the remaining inputs into it. This takes the direct XOR counts above and one
initial copy per output (16 or 32), or equivalent fused initialization. It
preserves all inputs. No timing advantage is inferred from this endpoint;
giving up sharing can increase work substantially. It shows why minimum scratch
alone cannot establish a distinctive construction benefit.

## Why this does not yet justify a port

The source's `reorder.rs::Alloc::try_release` releases a temporary after its
last use, protecting designated outputs. `assign` reuses released slots without
clearing them. `main.rs` checks input preservation; it does not require old
temporary contents to be restored. The runtime separately addresses inputs,
outputs and reusable temporary chunks. None of these contracts imposes the
theory's rational envelopes or one physical continuation per use.

There could still be a useful basis-selection or circuit-rewriting improvement
over these schedules. The 69/110 buffers in the larger cases are an opportunity
to investigate, not an established removable cost. To qualify, a candidate must
improve a joint work/storage tradeoff after charging for materializing requested
values, input rereads, copies and reconstruction. Borrowing independent-row
selection alone would need comparison with conventional linear synthesis and
would have weaker attribution than a distinctive frame construction.

For quantum work, a worthwhile next input would be an existing circuit with
specific permitted intermediate representations, required borrowed-ancilla
restoration and connectivity restrictions. No such instance was established
here. We should obtain one before adapting or benchmarking the compiler.

**Disposition:** retain the corpus, pause the frame-compiler performance port,
and reopen only with a genuine application constraint or a concrete resource
improvement over these ordinary baselines. Earlier positive non-rigidity kernel
results and discovery-through-theory FLINT improvements are unaffected.

## Validation and reproduction

The resource adapter omits the original CLI and x86 execution modules; it does
not port or time their SIMD kernels. Algorithm modules are copied unchanged.
The locally cached itertools 0.10.5 replaces 0.9; lazy_static 1.4.0 and rand
0.7.3 are retained. The Cargo lockfile, build log and original source blobs are
saved. All 27 retained upstream files match their Git blob hashes exactly.

The author's symbolic output checks run during extraction. A separate Python
bitset replay verifies all output coefficients and immutable inputs, rejecting
uninitialized temporary reads. Across 18 programs it checks **24,576 binary
input/output coefficients**, plus operation counts and fixed-order liveness.
This validates programs against the extracted binary matrices, not an independent
second implementation of Reed–Solomon matrix generation. The 890/418 encoding
XOR counts also agree with the author's published repository example.

Artifacts are in `results/joint-workload-survey/`. Extraction:

```sh
python3 scripts/joint_workload_extract.py
cargo run --offline --release --features bottomup_sched \
  --manifest-path .deps/joint-workload-analyzer/Cargo.toml
```

The preparation script refuses an existing build directory. Save new runs to a
fresh result destination; do not overwrite historical receipts. The retained
`scripts/audit_joint_workload.py` consumes `programs.jsonl` and creates a fresh
`audit-final.json`, likewise refusing to overwrite it. The earlier `audit.json`
is retained: its fused-program storage fields counted distinct variable names,
whereas the final audit also records the maximum array index plus one. Fusion
leaves index gaps before allocation. Compressed and scheduled programs have
no gaps, so all table figures and decisions above are unaffected.
`completion.json` records
source and artifact hashes and verification of the inherited result manifests.
