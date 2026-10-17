/* Separate translation unit keeps the original macro namespaces intact. */
#define sd_ifft_trunc bf_phase_private_ifft_trunc
#include "fft_small/sd_ifft.c"
#undef sd_ifft_trunc

void bf_phase_inverse(const sd_fft_ctx_t Q, double *x, ulong k, ulong j)
{
    ulong bits, r;
    SET_J_BITS_AND_J_MR(bits, r, j);
    if (j == 0) {
        switch (k) {
            case 1: sd_ifft_basecase_1_1(Q,x); return;
            case 2: sd_ifft_basecase_2_1(Q,x); return;
            case 3: sd_ifft_basecase_3_1(Q,x); return;
            case 4: sd_ifft_basecase_4_1(Q,x); return;
            case 5: sd_ifft_basecase_5_1(Q,x); return;
        }
    }
    double n=Q->p, ninv=Q->pinv;
    if (k == 1) {
        LENGTH2INV_ANY_J(vec1d,x[0],x[1],n,ninv,sd_fft_ctx_w2inv(Q,j));
    } else if (k == 2) {
        LENGTH4INV_ANY_J(vec1d,x[0],x[1],x[2],x[3],n,ninv,
            sd_fft_ctx_w2inv(Q,j),sd_fft_ctx_w2inv(Q,2*j),sd_fft_ctx_w2inv(Q,2*j+1));
    } else if (k == 3) {
        LENGTH8INV_ANY_J(vec1d,x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7],n,ninv,
            sd_fft_ctx_w2inv(Q,j),sd_fft_ctx_w2inv(Q,2*j),sd_fft_ctx_w2inv(Q,2*j+1),
            sd_fft_ctx_w2inv(Q,4*j),sd_fft_ctx_w2inv(Q,4*j+1),
            sd_fft_ctx_w2inv(Q,4*j+2),sd_fft_ctx_w2inv(Q,4*j+3));
    } else if (k == 4) sd_ifft_basecase_4_0(Q,x,r,bits);
    else if (k == 5) sd_ifft_basecase_5_0(Q,x,r,bits);
    else flint_abort();
}
