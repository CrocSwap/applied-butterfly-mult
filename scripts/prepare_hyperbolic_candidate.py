#!/usr/bin/env python3
"""Reuse the inverse already built by Newton exponentiation for sinh/cosh."""
from prepare_optimization_candidates import BASE, patch


def main():
    changes = {}
    for kind in ("arb", "acb"):
        path = f"src/{kind}_poly/exp_series.c"
        original = (BASE / path).read_text()
        marker = f"\nvoid\n{kind}_poly_exp_series("
        helper = '''
/* Private paired operation for a zero-constant input of length n.
   The three vectors must be disjoint. */
void
_KIND_poly_exp_inv_series(KIND_ptr f, KIND_ptr g,
    KIND_srcptr h, slong n, slong prec)
{
    slong cutoff;

    FLINT_ASSERT(n > 0);
    FLINT_ASSERT(KIND_is_zero(h));

    if (KIND_poly_newton_exp_cutoff != 0)
        cutoff = KIND_poly_newton_exp_cutoff;
    else if (prec <= 256)
        cutoff = 750;
    else
        cutoff = 1e5 / pow(log(prec), 3);

    if (n <= cutoff || n < 3)
    {
        _KIND_poly_exp_series(f, h, n, n, prec);
        _KIND_poly_inv_series(g, f, n, n, prec);
    }
    else if (_KIND_vec_is_zero(h + 1, n - 2))
    {
        /* h = b*x^(n-1): exp(+/-h) = 1 +/- h modulo x^n. */
        KIND_one(f);
        KIND_one(g);
        _KIND_vec_zero(f + 1, n - 2);
        _KIND_vec_zero(g + 1, n - 2);
        KIND_set_round(f + n - 1, h + n - 1, prec);
        KIND_neg(g + n - 1, f + n - 1);
    }
    else
    {
        /* The Newton loop already has exp(-h) through half the length.
           Extend that inverse instead of computing it again from scratch. */
        _KIND_poly_exp_series_newton(f, g, h, n, prec, 1, cutoff);
    }
}
'''.replace("KIND", kind)
        assert original.count(marker) == 1
        changes[path] = original.replace(marker, helper + marker)

        path = f"src/{kind}_poly/sinh_cosh_series_exponential.c"
        original = (BASE / path).read_text()
        old = '''    _KIND_vec_set(t + 1, h + 1, hlen - 1);
    _KIND_poly_exp_series(t, t, len, len, prec);

    /* todo: part of the inverse could be avoided since exp computes
       it internally to half the length */
    _KIND_poly_inv_series(u, t, len, len, prec);'''.replace("KIND", kind)
        new = '''    /* Keep the zero-constant input separate from both outputs. The
       existing third buffer is available until the final linear combination. */
    _KIND_vec_set(v + 1, h + 1, hlen - 1);
    _KIND_poly_exp_inv_series(t, u, v, len, prec);'''.replace("KIND", kind)
        assert original.count(old) == 1
        changes[path] = original.replace(old, new)

        path = f"src/{kind}_poly.h"
        original = (BASE / path).read_text()
        marker = f"void _{kind}_poly_exp_series({kind}_ptr f, {kind}_srcptr h, slong hlen, slong n, slong prec);"
        declaration = f'''/* Internal: h has n coefficients, h[0] = 0, and f, g, h are disjoint. */
void _{kind}_poly_exp_inv_series({kind}_ptr f, {kind}_ptr g,
    {kind}_srcptr h, slong n, slong prec);

'''
        assert original.count(marker) == 1
        changes[path] = original.replace(marker, declaration + marker)
    patch("hyperbolic-shared-inverse-v2", changes)


if __name__ == "__main__":
    main()
