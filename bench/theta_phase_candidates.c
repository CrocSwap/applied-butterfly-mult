/* Experimental conventional controls for the weighted-phase transfer screen.
   Neither candidate uses the sister project's phase-frame construction.
   Keep the pinned FLINT source and the baseline library unchanged. */
#include "acb.h"
#include "acb_theta.h"

/* Retain the original recursive Hadamard helper in all implementations. */
#define acb_theta_agm_mul bf_theta_original
#include "../.deps/flint/src/acb_theta/agm_mul.c"
#undef acb_theta_agm_mul

/* H D_a y = X_a H y. Share both input transforms, including when x == y. */
void bf_theta_shared(acb_ptr res, acb_srcptr x, acb_srcptr y,
                     slong g, int all, slong prec)
{
    if (!all) { bf_theta_original(res,x,y,g,all,prec); return; }
    slong n = 1L << g;
    acb_ptr w = _acb_vec_init(3*n);
    acb_theta_agm_hadamard(w,x,g,prec);
    if (x == y) _acb_vec_set(w+n,w,n);
    else acb_theta_agm_hadamard(w+n,y,g,prec);
    for (slong a=0;a<n;a++) {
        for (slong t=0;t<n;t++) acb_mul(w+2*n+t,w+t,w+n+(t^a),prec);
        acb_theta_agm_hadamard(w+2*n,w+2*n,g,prec);
        for (slong k=0;k<n;k++) acb_mul_2exp_si(res+k*n+a,w+2*n+k,-g);
    }
    _acb_vec_clear(w,3*n);
}

/* Source convention: signs multiply the SECOND input. For fixed k,
   res[k*n+a] = sum_b (-1)^popcount(a&b) x[b XOR k] y[b].
   Apply one Walsh transform to those products; no inverse scaling needed. */
void bf_theta_direct(acb_ptr res, acb_srcptr x, acb_srcptr y,
                     slong g, int all, slong prec)
{
    if (!all) { bf_theta_original(res,x,y,g,all,prec); return; }
    slong n = 1L << g;
    acb_ptr w = _acb_vec_init(n);
    for (slong k=0;k<n;k++) {
        for (slong b=0;b<n;b++) acb_mul(w+b,x+(b^k),y+b,prec);
        acb_theta_agm_hadamard(res+k*n,w,g,prec);
    }
    _acb_vec_clear(w,n);
}
