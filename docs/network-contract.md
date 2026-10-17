# Contract for the two-lane transform experiment

## Connection to the sister project

The retained-layout schedule in `../integerMult/docs/packed-movement-audit.md`
keeps logical axis names while moving the active axis into a useful position.
Its conjugation audit gives the essential constraint:

`P_M X_v P_M^-1 = X_(Mv)`.

Changing a binary frame changes the direction of the child operator. It also
changes the placement of any position-dependent coefficients. Independently
framed wires cannot be pointwise-multiplied without alignment. This experiment
uses those constraints to build a different physical FFT layout and its matched
inverse, with a common frame on both pointwise operands.

The sister repository now also contains a shared-addition-graph construction
in `docs/research/shared-computation.md` and `notes/dag-construction.tex`.
Its common-point exclusion operator, scratch roles, and rank labels are not
an ordinary length-16 DFT. We do not replace an FFT with that different operator
or claim to instantiate the full finite-network multiplication theorem. This
is an executable exploration of frame compatibility inside an actual FFT.

## Logical and physical coordinates

Let `i` be FLINT's logical bit-reversed evaluation index. For depth at least
four, the original physical index within each 16-coefficient block is

`old(i) = (i & ~15) | ((i >> 2) & 3) | ((i & 3) << 2)`.

The private candidate uses

`new(i) = (i & ~3) | ((i & 1) << 1) | ((i & 2) >> 1)`.

At smaller depths both use `i`. Thus original physical bits `[b3,b2,b1,b0]`
are `[i1,i0,i3,i2]`; the new bits are `[i3,i2,i0,i1]`. Both maps permute
only within 16-element blocks, and are independent of transform depth above
the basecase. There is no materialized whole-array conversion between them in
the multiplication path.

## Forward factorization

The new 16-point basecase loads eight native two-lane vectors. Three butterfly
layers, of lengths 16, 8, and 4, are computed by `LENGTH8_*` across the eight
vector registers, preserving the low input bit in the lane position.
Four two-by-two unpack pairs exchange the lowest two logical bits. The final
length-2 layer then combines two registers with the correctly paired twiddles.
The eight resulting vectors are stored directly in the new spectral order.

The 32-point basecase first computes its length-32 butterfly layer, then calls
two 16-point basecases with the appropriate child twiddle indices. The existing
larger radix-4 recursions terminate in these 16/32-point kernels, so all leaf
blocks share the same low-bit permutation. This changes factorization, register
grouping, and the physical wire layout; the mathematical Fourier operator and
number of scalar butterfly stages remain unchanged.

## Inverse and truncation

The inverse first undoes the final length-2 layer in the new frame, unpacks
back into the eight-vector layout, and executes `LENGTH8INV_*`. The inverse
twiddle indices are reflected exactly as in upstream. For logical index zero,
the general inverse length-2 expression uses `-1` so that
`(second - first) * (-1)` gives the usual difference.

For 32 points, two 16-point inverse calls precede the length-32 inverse layer.
The same upstream reduction macros are used, including the general modular
multiplication where the upstream macro requires it. The inverse remains
unnormalized: forward followed by inverse gives `2^L` times the input modulo
the prime. Normalization remains in the original reconstruction.

For depth above eight, the existing truncated recursion works in 256-element
blocks. The new permutation is internal to each 16-element subblock, so it
does not change block identities, requested block prefixes, or the column
schedule. At depth at most eight, upstream already computes complete
basecases from zero-padded inputs. We retain that behavior. Direct tests cover
full and truncated transforms, zero padding, and signed extremes.

## Pointwise compatibility and integration boundary

Both operand transforms use the same `new` permutation. Therefore
`P(a) .* P(b) = P(a .* b)`, including squaring, where `.*` is pointwise
multiplication. The inverse accepts this representation directly. No alignment
pass is omitted from a workload that otherwise requires it.

Only the two-prime multiplication driver's transform calls change. CRT,
packing, pointwise arithmetic, and carry propagation are original FLINT code;
the previous C3 optimization is not combined with this experiment. New private
translation units contain the experimental transforms. Original public FFT
entry points, their documented index function, other callers, and the
multi-prime pipeline remain unchanged.

The `network-control` build uses the same private-copy arrangement and driver
redirection, with unmodified transform bodies. This controls for duplication,
linking, and dispatch changes. Both builds use isolated dylibs and identical
compiler flags. They are ARM64/NEON research prototypes, not portable patches.

## Exact finite model and cost limits

`scripts/network_frames.py` enumerates all 20,160 invertible four-bit binary
frames and checks conjugation of coordinate translations on all sixteen wires.
In a fixed frame, the lane bit is a nonzero linear functional of the four
logical bits. It must be nonzero on at least one basis direction. Thus at least
one of the four butterfly stages crosses lanes. This is a restricted statement
about fixed frames, not a lower bound for arbitrary FFT algorithms or dynamic
frame schedules.

For an explicit register-register permutation, count target two-lane vectors
whose entries come from distinct source vectors. Both the original 4-by-4
transpose and the new bit-0/bit-1 exchange have eight such target vectors.
Each requires a lane-assembly instruction in this restricted model. It does
not cover interleaved loads, scalar/gather addressing, or shuffles absorbed
into arithmetic. Consequently this model offers no reduction in the core
data-shuffle count; hardware measurements must decide whether grouping and
twiddle arrangement compensate for other costs.

The independent finite-field tests compare complete linear maps against a
dense DFT on every input basis vector, and complete cyclic-convolution
bilinear maps on all basis-vector pairs, for four representative frames.
The model's explicit encode/decode operations are correctness devices and
are not treated as free hardware operations or benchmarked speedups.
