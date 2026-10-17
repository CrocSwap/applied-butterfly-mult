/* Equal-bank specialization for the all-characteristic AGM product.
   Insert after acb_theta_agm_hadamard in the experimental FLINT source.
   The surrounding file retains FLINT's LGPL-3.0-or-later notice. */
static void
acb_theta_agm_mul_equal(acb_ptr res, acb_srcptr x, slong g, slong prec)
{
    slong n = 1L << g;
    acb_ptr w = _acb_vec_init(n);

    for (slong b = 0; b < n; b++)
        acb_sqr(w + b, x + b, prec);
    acb_theta_agm_hadamard(res, w, g, prec);

    for (slong k = 1; k < n; k++)
    {
        /* Choose representatives b with bit j zero, where k_j = 1.
           The two products indexed by b and b XOR k are identical. */
        slong bit = k & -k;
        slong mask = bit - 1;
        for (slong t = 0; t < n / 2; t++)
        {
            slong b = (t & mask) | ((t & ~mask) << 1);
            acb_mul(w + t, x + (b ^ k), x + b, prec);
        }
        acb_theta_agm_hadamard(w + n / 2, w, g - 1, prec);

        /* Characters with a.k odd vanish. For each character on the
           quotient there is one a with a.k even; its coefficient is
           twice the quotient coefficient. Scaling by two is exact. */
        _acb_vec_zero(res + k * n, n);
        for (slong t = 0; t < n / 2; t++)
        {
            slong a = (t & mask) | ((t & ~mask) << 1);
            if (acb_theta_char_dot(a, k, g) & 1)
                a |= bit;
            acb_mul_2exp_si(res + k * n + a, w + n / 2 + t, 1);
        }
    }
    _acb_vec_clear(w, n);
}
