# Spectral persistence across chained products: opportunity screen

October 18, 2026. **Decision: stopped at the pricing gate; no build, no timing.**
Source reading and arithmetic only, against FLINT `657a2839cf0125164859ff102b1f124abcb87ce0`
(`deps.json`) and this repository at `cba99fa`. Evidence level: author-checked.

## Question

Keeping results in fft_small's transformed (spectral) representation across a chain
of polynomial-matrix products would remove the inverse/forward transform pair at each
call boundary. Does a genuine caller give a favorable, fully charged best case of at
least 10% of complete time? The predeclared kill test was: below 10%, or already being
built upstream.

## Findings

1. **The general mechanism is already under upstream development.**
   `src/gr/nmod_transformed_poly.c` (1,049 lines, copyright 2026 Fredrik Johansson)
   implements a prototype ring of nmod polynomials stored as pointwise evaluations,
   closed under +, -, *, with normalization applied once at conversion back.
   `src/gr.h:914-927` defines `gr_transformed_poly_workload_struct` (inputs,
   multiplications, outputs, live elements, memory limit), feeding a profitability
   model. An `mpn_mod` variant is declared at `src/mpn_mod.h:279`. Multi-prime plans
   are limited to multiplicative depth two; deeper products return `GR_UNABLE` and
   callers renormalize through a conversion roundtrip (file header comment).
2. **No in-library caller chains same-length products.** The only FLINT function that
   chains `nmod_poly_mat_mul`/`sqr` is `nmod_poly_mat_pow` (`src/nmod_poly_mat/pow.c`),
   by repeated squaring. Each step doubles the entry length, so a result cannot be
   reused at the same transform size.
3. **Best case for `pow` is at or below the gate.** With the usual transform-doubling
   reuse, at most about half of each step's forward transforms is saved. Pointwise work
   is already 36-46% of a matrix product (`docs/polynomial-survey-m2.md`), squaring has
   only one input, and the prepared-inputs patch already prepares it once. That bounds
   the saving at roughly 10-15% of `pow` alone. This is an order-of-magnitude
   estimate, not a measured or certified bound, for a function with no identified
   performance-critical caller.

4. **The obvious same-length chaining caller is already covered upstream.** Half-gcd
   chains 2x2 polynomial-matrix products; FLINT already dispatches them to a
   transformed-representation path, `_gr_poly_hgcd_mat_mul_transformed`
   (`src/gr_poly/hgcd.c:301`, called from `_gr_poly_hgcd_mat_mul_generic` at line 392).
   Upstream main (`54d1439`, 2026-10-17) adds further transform reuse: hypergeometric
   binary splitting (`7e66d0a`) and stored transforms for geometric
   evaluation/interpolation (`37a3c0f`).

## Settled-question entry (proposed)

**Spectral persistence across chained polynomial-matrix products:** the general
mechanism is being built upstream (`gr/nmod_transformed_poly.c`), half-gcd matrix products already use it, and the only other
in-library chaining caller, `nmod_poly_mat_pow`, has a best case of roughly 15% or
less. Reopens with a genuine caller that chains products of equal length, or if the
upstream ring lifts its depth-two limit and a caller adopts it.

## Not checked

- No external (non-FLINT) callers were searched.
- The 10-15% figure was not derived from a pow-specific profile.
- `fmpz_poly_mat`, `gr_poly_mat` and `mpn_mod` paths were not surveyed.

## Open next questions

- Once the upstream ring stabilizes, can a real caller (`find-downstream-caller`)
  serve as its benchmark? That would be an `upstream-prep` contribution, not a new
  mechanism.
- `patches/poly-prepared.patch` also touches `src/gr/nmod_transformed_poly.c`; check
  whether it still applies to later FLINT revisions before any upstream proposal.

## Replay

```sh
git -C flint fetch --depth 1 origin 657a2839cf0125164859ff102b1f124abcb87ce0 && git -C flint checkout FETCH_HEAD
sed -n 36,80p flint/src/gr/nmod_transformed_poly.c
sed -n 905,930p flint/src/gr.h
grep -rln "nmod_poly_mat_mul\|nmod_poly_mat_sqr" flint/src | grep -v /test/
```

AI assistance: researched and drafted by Claude (Opus 5.5) in a session steered by
@Mister-Meeseeks.
