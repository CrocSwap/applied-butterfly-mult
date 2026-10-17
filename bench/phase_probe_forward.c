/* Read-only algebra probe of pinned FLINT kernels; never used for timing. */
#define sd_fft_trunc bf_phase_private_fft_trunc
#include "fft_small/sd_fft.c"
#undef sd_fft_trunc

void bf_phase_forward(const sd_fft_ctx_t Q, double *x, ulong k, ulong j)
{
    ulong bits, r;
    SET_J_BITS_AND_J_R(bits, r, j);
    if (j == 0) {
        switch (k) {
            case 1: sd_fft_basecase_1_1(Q,x); return;
            case 2: sd_fft_basecase_2_1(Q,x); return;
            case 3: sd_fft_basecase_3_1(Q,x); return;
            case 4: sd_fft_basecase_4_1(Q,x); return;
            case 5: sd_fft_basecase_5_1(Q,x); return;
        }
    }
    double n=Q->p, ninv=Q->pinv;
    if (k == 1) {
        RADIX_2_FORWARD_PARAM_J_IS_NZ(vec1d,Q,r,bits);
        RADIX_2_FORWARD_MOTH_J_IS_NZ(vec1d,x,x+1);
    } else if (k == 2) {
        LENGTH4_ANY_J(vec1d,x[0],x[1],x[2],x[3],n,ninv,
            sd_fft_ctx_w2(Q,j),sd_fft_ctx_w2(Q,2*j),sd_fft_ctx_w2(Q,2*j+1));
    } else if (k == 3) {
        LENGTH8_ANY_J(vec1d,x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7],n,ninv,
            sd_fft_ctx_w2(Q,j),sd_fft_ctx_w2(Q,2*j),sd_fft_ctx_w2(Q,2*j+1),
            sd_fft_ctx_w2(Q,4*j),sd_fft_ctx_w2(Q,4*j+1),
            sd_fft_ctx_w2(Q,4*j+2),sd_fft_ctx_w2(Q,4*j+3));
    } else if (k == 4) sd_fft_basecase_4_0(Q,x,r,bits);
    else if (k == 5) sd_fft_basecase_5_0(Q,x,r,bits);
    else flint_abort();
}
