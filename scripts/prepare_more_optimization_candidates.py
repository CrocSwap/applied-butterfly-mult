#!/usr/bin/env python3
"""Generate candidates for redundant Newton work and interpolation leaves."""
from prepare_optimization_candidates import BASE, patch


def main():
    changes = {}
    for kind in ("arb", "acb"):
        path = f"src/{kind}_poly/exp_series.c"
        original = (BASE / path).read_text()
        old = '''    _KIND_vec_zero(f + m, n - m);
    _KIND_poly_mulmid(T, f, n, hprime, n, l, n, prec);
    _KIND_poly_derivative(U, f, n, prec); KIND_zero(U + n - 1); /* should skip low terms */
    _KIND_vec_sub(U + l, U + l, T, n - l, prec);'''.replace("KIND", kind)
        new = '''    /* f has degree less than m, so f' has no terms from m - 1.
       Only coefficients m - 1 through n - 2 are consumed below. */
    _KIND_poly_mulmid(T, f, m, hprime, n - 1, l, n - 1, prec);
    _KIND_vec_neg(U + l, T, n - m);'''.replace("KIND", kind)
        assert original.count(old) == 1
        candidate = original.replace(old, new)
        old = f"    _{kind}_poly_integral(U, U, n, prec); /* should skip low terms */"
        new = '''    /* Integrate the required high coefficients, backwards for aliasing. */
    for (slong j = n - 1; j >= m; j--)
        KIND_div_ui(U + j, U + j - 1, j, prec);'''.replace("KIND", kind)
        assert candidate.count(old) == 1
        changes[path] = candidate.replace(old, new)
    patch("ball-exp-newton-truncation", changes)

    path = "src/gr_poly/interpolate_fast.c"
    original = (BASE / path).read_text()
    old = '''    status |= _gr_vec_mul(poly, weights, ys, len, ctx);

    for (i = 0; i < FLINT_CLOG2(len); i++)'''
    new = '''    status |= _gr_vec_mul(poly, weights, ys, len, ctx);

    /* Leaves combine two scalars with monic linear factors. Avoid two
       general polynomial products and their multiplications by one. */
    for (i = 0; i + 1 < len; i += 2)
    {
        pa = GR_ENTRY(tree[0], 2 * i, sz);
        pb = GR_ENTRY(poly, i, sz);
        status |= gr_mul(t, pa, GR_ENTRY(pb, 1, sz), ctx);
        status |= gr_mul(u, pb, GR_ENTRY(pa, 2, sz), ctx);
        status |= gr_add(t, t, u, ctx);
        status |= gr_add(GR_ENTRY(pb, 1, sz), GR_ENTRY(pb, 1, sz), pb, ctx);
        status |= gr_set(pb, t, ctx);
    }

    for (i = 1; i < FLINT_CLOG2(len); i++)'''
    assert original.count(old) == 1
    patch("interpolation-leaves", {path: original.replace(old, new)})


if __name__ == "__main__":
    main()
