#!/usr/bin/env python3
"""Generate focused upstream-style test additions without changing the baseline."""
import difflib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / ".deps/flint-optimization-base"


def patch(name, additions):
    chunks = []
    for path, body, include in additions:
        before = (BASE / path).read_text()
        after = before.replace("    TEST_FUNCTION_END(state);", body + "\n    TEST_FUNCTION_END(state);")
        if include:
            after = after.replace('#include "test_helpers.h"', '#include "test_helpers.h"\n' + include)
        chunks.extend(difflib.unified_diff(before.splitlines(True), after.splitlines(True),
                      fromfile="a/" + path, tofile="b/" + path))
    out = ROOT / "patches" / name
    content = "".join(chunks)
    if out.exists():
        if out.read_text() != content:
            raise FileExistsError(out)
    else:
        out.write_text(content)


INTERPOLATION = r'''
    /* Shuffled affine point sets, tree boundaries and composite moduli.
       All point differences are units; values use scalar evaluation. */
    {
        const ulong mods[] = {1, 2, 17, 257 * 263, 1000000007,
                              UWORD_MAX_PRIME};
        const slong lengths[] = {0, 1, 2, 3, 7, 8, 15, 16, 17,
                                 31, 32, 33, 63, 64, 65, 127, 128, 129};
        slong mi, li, j, n;

        for (mi = 0; mi < 6; mi++)
        for (li = 0; li < 18; li++)
        {
            nmod_poly_t f, g;
            nn_ptr xs, ys;
            ulong mod = mods[mi], step = 1, offset;

            n = lengths[li];
            if ((mod == 1 && n > 1) || (mod != 1 && n > mod))
                continue;
            if (mod > 1)
                do { step = 1 + n_randint(state, mod - 1); }
                while (n_gcd(step, mod) != 1);
            offset = n_randint(state, mod);
            nmod_poly_init(f, mod);
            nmod_poly_init(g, mod);
            nmod_poly_randtest(f, state, n);
            xs = _nmod_vec_init(n);
            ys = _nmod_vec_init(n);
            for (j = 0; j < n; j++)
                xs[j] = nmod_add(nmod_mul(step % mod, j % mod, f->mod),
                                 offset, f->mod);
            for (j = n - 1; j > 0; j--)
            {
                slong k = n_randint(state, j + 1);
                ulong t = xs[j]; xs[j] = xs[k]; xs[k] = t;
            }
            for (j = 0; j < n; j++)
                ys[j] = nmod_poly_evaluate_nmod(f, xs[j]);
            nmod_poly_interpolate_nmod_vec_fast(g, xs, ys, n);
            if (!nmod_poly_equal(f, g))
                TEST_FUNCTION_FAIL("fast recovery: mod=%wu n=%wd\n", mod, n);
            nmod_poly_interpolate_nmod_vec(g, xs, ys, n);
            if (!nmod_poly_equal(f, g))
                TEST_FUNCTION_FAIL("automatic recovery: mod=%wu n=%wd\n", mod, n);
            _nmod_vec_clear(xs);
            _nmod_vec_clear(ys);
            nmod_poly_clear(f);
            nmod_poly_clear(g);
        }
    }
'''


EVALUATION = r'''
    /* Exact dyadic Horner references cover block boundaries, the automatic
       high-precision dispatch, and either output aliasing the point. */
    {
        const slong lengths[] = {0, 1, 2, 3, 4, 8, 15, 16, 17,
                                 24, 25, 26, 31, 32, 33, 63, 64, 65,
                                 127, 128, 129};
        const slong precisions[] = {32, 128, 1024, 4096};
        slong li, pi, j, alg, point;
        TYPE_poly_t f, df;
        TYPE_t x, y, z, exact_y, exact_z, coefficient;

        TYPE_poly_init(f); TYPE_poly_init(df);
        TYPE_init(x); TYPE_init(y); TYPE_init(z);
        TYPE_init(exact_y); TYPE_init(exact_z); TYPE_init(coefficient);
        for (li = 0; li < 21; li++)
        {
            TYPE_poly_zero(f);
            for (j = 0; j < lengths[li]; j++)
            {
                COEFFICIENT
                TYPE_mul_2exp_si(coefficient, coefficient, -3);
                TYPE_poly_set_coeff_TYPE(f, j, coefficient);
            }
            TYPE_poly_derivative(df, f, ARF_PREC_EXACT);
            for (point = 0; point < 3; point++)
            {
                TYPE_set_si(x, point == 0 ? 0 : (point == 1 ? 3 : 8));
                TYPE_mul_2exp_si(x, x, -3);
                COMPLEX_POINT
                TYPE_poly_evaluate_horner(exact_y, f, x, ARF_PREC_EXACT);
                TYPE_poly_evaluate_horner(exact_z, df, x, ARF_PREC_EXACT);
                for (pi = 0; pi < 4; pi++)
                for (alg = 0; alg < 2; alg++)
                {
                    void (*evaluate)(TYPE_t, TYPE_t, const TYPE_poly_t,
                                     const TYPE_t, slong) = alg ?
                        TYPE_poly_evaluate2 : TYPE_poly_evaluate2_rectangular;
                    evaluate(y, z, f, x, precisions[pi]);
                    if (!TYPE_contains(y, exact_y) || !TYPE_contains(z, exact_z))
                        TEST_FUNCTION_FAIL("exact evaluation: n=%wd prec=%wd\n",
                                           lengths[li], precisions[pi]);
                    TYPE_set(y, x);
                    evaluate(y, z, f, y, precisions[pi]);
                    if (!TYPE_contains(y, exact_y) || !TYPE_contains(z, exact_z))
                        TEST_FUNCTION_FAIL("value aliases point\n");
                    TYPE_set(z, x);
                    evaluate(y, z, f, z, precisions[pi]);
                    if (!TYPE_contains(y, exact_y) || !TYPE_contains(z, exact_z))
                        TEST_FUNCTION_FAIL("derivative aliases point\n");
                }
            }
        }
        TYPE_poly_clear(f); TYPE_poly_clear(df);
        TYPE_clear(x); TYPE_clear(y); TYPE_clear(z);
        TYPE_clear(exact_y); TYPE_clear(exact_z); TYPE_clear(coefficient);
    }
'''


HYPERBOLIC = r'''
    /* Force Newton steps at small odd/even lengths and compare against
       exact rational series, including sparse and shortened inputs. */
    {
        const slong lengths[] = {0, 1, 2, 3, 4, 5, 7, 8, 9,
                                 15, 16, 17, 31, 32, 33, 64, 65, 128, 129};
        slong saved = TYPE_poly_newton_exp_cutoff;
        slong li, fixture, j, n, hlen;
        fmpq_poly_t hq, sq, cq;
        TYPE_poly_t h, s, c, a, b;
        TYPE_poly_newton_exp_cutoff = 4;
        fmpq_poly_init(hq); fmpq_poly_init(sq); fmpq_poly_init(cq);
        TYPE_poly_init(h); TYPE_poly_init(s); TYPE_poly_init(c);
        TYPE_poly_init(a); TYPE_poly_init(b);
        for (li = 0; li < 19; li++)
        for (fixture = 0; fixture < 3; fixture++)
        {
            n = lengths[li];
            hlen = fixture == 1 ? (n + 1) / 2 : n;
            fmpq_poly_zero(hq);
            for (j = 1; j < hlen; j++)
                if (fixture != 2 || j == hlen - 1)
                    fmpq_poly_set_coeff_si(hq, j, (7 * j) % 11 - 5);
            fmpq_poly_scalar_div_ui(hq, hq, 16);
            fmpq_poly_sinh_cosh_series(sq, cq, hq, n);
            TYPE_poly_set_fmpq_poly(h, hq, 128);
            TYPE_poly_sinh_cosh_series_exponential(s, c, h, n, 128);
            if (!TYPE_poly_contains_fmpq_poly(s, sq) ||
                !TYPE_poly_contains_fmpq_poly(c, cq))
                TEST_FUNCTION_FAIL("exact series: n=%wd fixture=%wd\n", n, fixture);
            TYPE_poly_set(a, h);
            TYPE_poly_sinh_cosh_series_exponential(a, b, a, n, 128);
            if (!TYPE_poly_equal(a, s) || !TYPE_poly_equal(b, c))
                TEST_FUNCTION_FAIL("sinh aliases input\n");
            TYPE_poly_set(b, h);
            TYPE_poly_sinh_cosh_series_exponential(a, b, b, n, 128);
            if (!TYPE_poly_equal(a, s) || !TYPE_poly_equal(b, c))
                TEST_FUNCTION_FAIL("cosh aliases input\n");
        }
        fmpq_poly_clear(hq); fmpq_poly_clear(sq); fmpq_poly_clear(cq);
        TYPE_poly_clear(h); TYPE_poly_clear(s); TYPE_poly_clear(c);
        TYPE_poly_clear(a); TYPE_poly_clear(b);
        TYPE_poly_newton_exp_cutoff = saved;
    }

    /* Nonzero constants and genuine ball inputs, with a high-precision
       basecase reference and both public input/output aliases. */
    {
        slong saved = TYPE_poly_newton_exp_cutoff;
        slong j, n, prec;
        TYPE_poly_t h, s, c, a, b;
        TYPE_t coefficient;
        TYPE_poly_init(h); TYPE_poly_init(s); TYPE_poly_init(c);
        TYPE_poly_init(a); TYPE_poly_init(b); TYPE_init(coefficient);
        TYPE_poly_newton_exp_cutoff = 4;
        for (n = 31; n <= 257; n = 2 * n + 3)
        for (prec = 256; prec <= 1024; prec *= 4)
        {
            TYPE_poly_zero(h);
            for (j = 0; j < n; j++)
            {
                BALL_COEFFICIENT
                TYPE_poly_set_coeff_TYPE(h, j, coefficient);
            }
            TYPE_poly_sinh_cosh_series_basecase(a, b, h, n, 2 * prec + 64);
            TYPE_poly_sinh_cosh_series_exponential(s, c, h, n, prec);
            if (!TYPE_poly_overlaps(s, a) || !TYPE_poly_overlaps(c, b) ||
                !_TYPE_vec_is_finite(s->coeffs, s->length) ||
                !_TYPE_vec_is_finite(c->coeffs, c->length))
                TEST_FUNCTION_FAIL("ball series reference\n");
            TYPE_poly_sinh_cosh_series(s, c, h, n, prec);
            TYPE_poly_set(a, h);
            TYPE_poly_sinh_cosh_series(a, b, a, n, prec);
            if (!TYPE_poly_equal(a, s) || !TYPE_poly_equal(b, c))
                TEST_FUNCTION_FAIL("public sinh alias\n");
            TYPE_poly_set(b, h);
            TYPE_poly_sinh_cosh_series(a, b, b, n, prec);
            if (!TYPE_poly_equal(a, s) || !TYPE_poly_equal(b, c))
                TEST_FUNCTION_FAIL("public cosh alias\n");
        }
        TYPE_poly_clear(h); TYPE_poly_clear(s); TYPE_poly_clear(c);
        TYPE_poly_clear(a); TYPE_poly_clear(b); TYPE_clear(coefficient);
        TYPE_poly_newton_exp_cutoff = saved;
    }
'''


GENERIC = r'''
    /* Exact rational recovery at paired, unpaired and upper-tree leaves. */
    {
        gr_ctx_t ctx;
        gr_poly_t f, g;
        gr_vec_t xs, ys;
        slong n, j;
        gr_ctx_init_fmpq(ctx);
        gr_poly_init(f, ctx); gr_poly_init(g, ctx);
        for (n = 0; n <= 33; n++)
        {
            gr_vec_init(xs, n, ctx); gr_vec_init(ys, n, ctx);
            GR_MUST_SUCCEED(gr_poly_randtest(f, state, n, ctx));
            for (j = 0; j < n; j++)
                GR_MUST_SUCCEED(gr_set_si(GR_ENTRY(xs->entries, j,
                    ctx->sizeof_elem), n - 2 * j, ctx));
            GR_MUST_SUCCEED(gr_poly_evaluate_vec_iter(ys, f, xs, ctx));
            GR_MUST_SUCCEED(gr_poly_interpolate_fast(g, xs, ys, ctx));
            if (gr_poly_equal(f, g, ctx) != T_TRUE)
                TEST_FUNCTION_FAIL("rational recovery at length %wd\n", n);
            gr_vec_clear(xs, ctx); gr_vec_clear(ys, ctx);
        }
        gr_poly_clear(f, ctx); gr_poly_clear(g, ctx); gr_ctx_clear(ctx);
    }
'''


def main():
    patch("opt-interpolation-coverage.patch", [("src/nmod_poly/test/t-interpolate_nmod_vec_fast.c", INTERPOLATION, "")])
    patch("opt-interpolation-leaves-coverage.patch", [("src/gr_poly/test/t-interpolate_fast.c", GENERIC, "")])
    eval_additions, hyperbolic_additions = [], []
    for kind in ["arb", "acb"]:
        if kind == "arb":
            coefficient = "arb_set_si(coefficient, (7 * j) % 19 - 9);"
            point = ""
            ball = """arb_set_si(coefficient, (7 * j) % 11 - 5);
                arb_mul_2exp_si(coefficient, coefficient, -5);
                arb_add_error_2exp_si(coefficient, -prec - 16);"""
        else:
            coefficient = """arb_set_si(acb_realref(coefficient), (7 * j) % 19 - 9);
                arb_set_si(acb_imagref(coefficient), (5 * j) % 13 - 6);"""
            point = """if (point == 1)
                {
                    arb_one(acb_imagref(x));
                    arb_mul_2exp_si(acb_imagref(x), acb_imagref(x), -4);
                }"""
            ball = """arb_set_si(acb_realref(coefficient), (7 * j) % 11 - 5);
                arb_set_si(acb_imagref(coefficient), (5 * j) % 7 - 3);
                acb_mul_2exp_si(coefficient, coefficient, -5);
                arb_add_error_2exp_si(acb_realref(coefficient), -prec - 16);
                arb_add_error_2exp_si(acb_imagref(coefficient), -prec - 16);"""
        body = EVALUATION.replace("COEFFICIENT", coefficient).replace("COMPLEX_POINT", point).replace("TYPE", kind)
        eval_additions.append((f"src/{kind}_poly/test/t-evaluate2_rectangular.c", body, ""))
        body = HYPERBOLIC.replace("BALL_COEFFICIENT", ball).replace("TYPE", kind)
        include = f'#include "fmpq_poly.h"\n\nFLINT_DLL extern slong {kind}_poly_newton_exp_cutoff;'
        hyperbolic_additions.append((f"src/{kind}_poly/test/t-sinh_cosh_series.c", body, include))
    patch("opt-evaluate2-coverage.patch", eval_additions)
    patch("opt-hyperbolic-coverage-v2.patch", hyperbolic_additions)
    before = (ROOT / "patches/opt-interpolation-leaves.patch").read_text()
    after = before.replace("gr_mul(u, pb, GR_ENTRY(pa, 2, sz), ctx)",
                           "gr_mul(u, GR_ENTRY(pa, 2, sz), pb, ctx)")
    out = ROOT / "patches/opt-interpolation-leaves-v2.patch"
    if out.exists():
        if out.read_text() != after:
            raise FileExistsError(out)
    else:
        out.write_text(after)


if __name__ == "__main__":
    main()
