/* Exact dense oracle, independent of the quotient indexing and transform.
   Compile with the candidate source included, under ASan/UBSan. */
#include <assert.h>
#include "acb.h"
#include "acb_theta.h"
#define acb_theta_agm_mul bf_equal_test
#include "../.deps/experiments/theta-equal/candidate/agm_mul.c"
#undef acb_theta_agm_mul

int main(void)
{
    flint_rand_t state;
    flint_rand_init(state);
    flint_rand_set_seed(state, 720931, 915017);
    fmpz_t z;
    fmpz_init(z);
    acb_t tmp;
    acb_init(tmp);
    slong calls = 0, checks = 0, zeros = 0, unchanged = 0;
    const slong precisions[] = {64, 128, 512, 2048};

    for (slong g = 0; g <= 7; g++)
    {
        slong n = 1L << g, len = n * n;
        slong bits = 600, oprec = 2 * bits + 64;
        acb_ptr x = _acb_vec_init(n), y = _acb_vec_init(n);
        acb_ptr bx = _acb_vec_init(n), by = _acb_vec_init(n);
        acb_ptr ref = _acb_vec_init(len), out = _acb_vec_init(len);
        acb_ptr control = _acb_vec_init(len);
        for (int pattern = 0; pattern < 3; pattern++)
        {
            for (slong i = 0; i < n; i++)
            {
                for (int bank = 0; bank < 2; bank++)
                {
                    acb_ptr a = (bank ? y : x) + i;
                    fmpz_randbits(z, state, bits);
                    arb_set_fmpz(acb_realref(a), z);
                    fmpz_randbits(z, state, bits);
                    arb_set_fmpz(acb_imagref(a), z);
                    acb_mul_2exp_si(a, a, -bits);
                    if (pattern == 1) acb_set_si(a, (i & 1) ? -3 : 3);
                    if (pattern == 2 && i != n / 2) acb_zero(a);
                }
            }
            for (int equal = 0; equal < 2; equal++)
            {
                acb_srcptr right = equal ? x : y;
                for (slong k = 0; k < n; k++)
                    for (slong a = 0; a < n; a++)
                    {
                        acb_ptr v = ref + k * n + a;
                        acb_zero(v);
                        for (slong b = 0; b < n; b++)
                        {
                            acb_mul(tmp, x + (b ^ k), right + b, oprec);
                            if (__builtin_parityll((unsigned long long) (a & b)))
                                acb_sub(v, v, tmp, oprec);
                            else
                                acb_add(v, v, tmp, oprec);
                        }
                        assert(acb_is_exact(v));
                    }
                for (int pi = 0; pi < 4; pi++)
                    for (int balls = 0; balls < 2; balls++)
                    {
                        _acb_vec_set(bx, x, n);
                        _acb_vec_set(by, right, n);
                        if (balls)
                            for (slong i = 0; i < n; i++)
                            {
                                arb_add_error_2exp_si(acb_realref(bx + i), -40);
                                arb_add_error_2exp_si(acb_imagref(bx + i), -40);
                                arb_add_error_2exp_si(acb_realref(by + i), -40);
                                arb_add_error_2exp_si(acb_imagref(by + i), -40);
                            }
                        acb_srcptr b = equal ? bx : by;
                        bf_equal_test(out, bx, b, g, 1, precisions[pi]);
                        acb_theta_agm_mul(control, bx, b, g, 1, precisions[pi]);
                        assert(_acb_vec_is_finite(out, len));
                        assert(_acb_vec_overlaps(out, control, len));
                        if (!equal) {assert(_acb_vec_equal(out, control, len));unchanged += len;}
                        for (slong k = 0; k < n; k++)
                            for (slong a = 0; a < n; a++)
                            {
                                slong i = k * n + a;
                                assert(acb_contains(out + i, ref + i));
                                checks++;
                                if (equal && __builtin_parityll((unsigned long long)(k & a)))
                                {assert(acb_is_zero(out + i));zeros++;}
                            }
                        calls++;
                        bf_equal_test(out, bx, b, g, 0, precisions[pi]);
                        acb_theta_agm_mul(control, bx, b, g, 0, precisions[pi]);
                        assert(_acb_vec_equal(out, control, n));
                        unchanged += n;
                        for (slong k = 0; k < n; k++)
                        {assert(acb_contains(out + k, ref + k * n));checks++;}
                        calls++;
                    }
            }
        }
        _acb_vec_clear(x,n);_acb_vec_clear(y,n);_acb_vec_clear(bx,n);_acb_vec_clear(by,n);
        _acb_vec_clear(ref,len);_acb_vec_clear(out,len);_acb_vec_clear(control,len);
    }
    acb_clear(tmp);fmpz_clear(z);flint_rand_clear(state);flint_cleanup();
    printf("{\"status\":\"PASS\",\"calls\":%ld,\"exact_containments\":%ld,\"exact_odd_zeros\":%ld,\"unchanged_coefficients\":%ld}\n",
           calls, checks, zeros, unchanged);
}
