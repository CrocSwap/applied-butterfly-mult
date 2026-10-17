#!/usr/bin/env python3
"""Generate the initial source-screen candidates from the pinned baseline."""
import difflib
from pathlib import Path

from optimization_campaign import BASE, ROOT


def patch(name, changes):
    output = ROOT / "patches" / ("opt-" + name + ".patch")
    if output.exists():
        raise FileExistsError(output)
    chunks = []
    for path, candidate in changes.items():
        original = (BASE / path).read_text()
        assert candidate != original, path
        chunks.extend(difflib.unified_diff(original.splitlines(True), candidate.splitlines(True),
                                         fromfile="a/" + path, tofile="b/" + path))
    output.write_text("".join(chunks))
    print(output)


def main():
    source = "src/nmod_poly_mat/sqr.c"
    original = (BASE / source).read_text()
    old = "        if (Alen > KS_MAX_LENGTH)"
    assert original.count(old) == 1
    changes = {source: original.replace(old, "        else if (Alen > KS_MAX_LENGTH)")}
    test = "src/nmod_poly_mat/test/t-sqr.c"
    original = (BASE / test).read_text()
    regression = r'''
    /* Exercise the interpolation branch, including in-place squaring.
       Falling through to a second algorithm computes A^4 when aliased. */
    for (i = 0; i < 2; i++)
    {
        nmod_poly_mat_t A, B, C;
        slong j, dim = 82 + 2 * i;
        ulong mod = 1000003;

        nmod_poly_mat_init(A, dim, dim, mod);
        nmod_poly_mat_init(B, dim, dim, mod);
        nmod_poly_mat_init(C, dim, dim, mod);

        for (j = 0; j < dim; j++)
        {
            nmod_poly_set_coeff_ui(nmod_poly_mat_entry(A, j, j), 0, 2);
            if (i != 0)
                nmod_poly_set_coeff_ui(nmod_poly_mat_entry(A, j, j), 3, 1);
        }

        nmod_poly_mat_mul_classical(C, A, A);
        nmod_poly_mat_sqr(B, A);
        FLINT_TEST(nmod_poly_mat_equal(B, C));
        nmod_poly_mat_sqr(A, A);
        FLINT_TEST(nmod_poly_mat_equal(A, C));

        nmod_poly_mat_clear(A);
        nmod_poly_mat_clear(B);
        nmod_poly_mat_clear(C);
    }

'''
    changes[test] = original.replace("    TEST_FUNCTION_END(state);", regression + "    TEST_FUNCTION_END(state);")
    patch("nmod-matrix-sqr-fallthrough", changes)

    changes = {}
    for kind in ("arb", "acb"):
        source = "src/" + kind + "_poly/evaluate2_rectangular.c"
        original = (BASE / source).read_text()
        candidate = original.replace("slong i, j, m, r;", "slong i, j, m, r, count;")
        candidate = candidate.replace(kind + "_ptr xs;", kind + "_ptr xs, derivative;")
        candidate = candidate.replace(kind + "_t s, t, c;", kind + "_t s;")
        candidate = candidate.replace("    m *= 1;\n", "")
        candidate = candidate.replace("    " + kind + "_init(t);\n    " + kind + "_init(c);",
                                      "    derivative = _" + kind + "_vec_init(m);")
        start = candidate.index("    /* todo: rewrite using " + kind + "_dot */")
        end = candidate.index("    _" + kind + "_vec_clear(xs, m + 1);", start)
        body = '''    /* Reuse one block of exactly scaled derivative coefficients.
       A dot product avoids rounding and error accumulation per term. */
    len -= 1;
    r = (len + m - 1) / m;
    for (i = r - 1; i >= 0; i--)
    {
        count = FLINT_MIN(m, len - i * m);
        for (j = 0; j < count; j++)
            KIND_mul_ui(derivative + j, poly + i * m + j + 1,
                i * m + j + 1, ARF_PREC_EXACT);

        KIND_dot(s, derivative, 0, xs + 1, 1, derivative + 1, 1,
            count - 1, prec);
        if (i == r - 1)
            KIND_set(z, s);
        else
        {
            KIND_mul(z, z, xs + m, prec);
            KIND_add(z, z, s, prec);
        }
    }

'''.replace("KIND", kind)
        candidate = candidate[:start] + body + candidate[end:]
        candidate = candidate.replace("    " + kind + "_clear(t);\n    " + kind + "_clear(c);",
                                      "    _" + kind + "_vec_clear(derivative, m);")
        changes[source] = candidate
    patch("ball-evaluate2-dot", changes)

    source = "src/nmod_poly/interpolate_nmod_vec.c"
    original = (BASE / source).read_text()
    old = '''    gr_ctx_t ctx;
    _gr_ctx_init_nmod(ctx, &mod);
    GR_MUST_SUCCEED(_gr_poly_interpolation_weights(w, (const gr_ptr *) tree, len, ctx));'''
    new = '''    gr_ctx_t ctx;
    nn_ptr tmp;
    slong n, height;

    if (len == 0)
        return;
    if (len == 1)
    {
        w[0] = (mod.n != 1);
        return;
    }

    _gr_ctx_init_nmod(ctx, &mod);
    tmp = _nmod_vec_init(len + 1);
    height = FLINT_CLOG2(len);
    n = WORD(1) << (height - 1);

    GR_MUST_SUCCEED(_gr_poly_mul_monic(tmp, tree[height - 1], n + 1,
        tree[height - 1] + n + 1, len - n + 1, ctx));
    _nmod_poly_derivative(tmp, tmp, len + 1, mod);
    _nmod_poly_evaluate_nmod_vec_fast_precomp(w, tmp, len, tree, len, mod);

    /* All weights must be units. Batch inversion uses one inverse and
       reuses the derivative workspace for its nonaliased output. */
    _nmod_vec_invert(tmp, w, len, mod);
    _nmod_vec_set(w, tmp, len);
    _nmod_vec_clear(tmp);'''
    assert original.count(old) == 1
    candidate = original.replace(old, new).replace('#include "gr_poly.h"',
        '#include "gr_poly.h"\n#include "gr_poly/impl.h"')
    patch("nmod-interpolation-batch-inverse", {source: candidate})


if __name__ == "__main__":
    main()
