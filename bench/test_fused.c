#include <stdio.h>
#include <string.h>
#include "fft_small.h"

void bf_sd_ifft_trunc_mul(sd_fft_ctx_t, double *, const double *, ulong, ulong);
static ulong state = UWORD(0x764e38ae11792bc1);
static ulong random_word(void) { state^=state<<13;state^=state>>7;state^=state<<17;return state; }

int main(void)
{
    const ulong primes[] = {UWORD(1108307720798209), UWORD(659706976665601),
                            UWORD(1086317488242689)};
    ulong cases=0, coefficients=0;
    for (ulong pi=0;pi<3;pi++) {
        sd_fft_ctx_t Q;
        sd_fft_ctx_init_prime(Q,primes[pi]);
        for (ulong L=8;L<=18;L++) {
            ulong len=UWORD(1)<<L, blocks=len/BLK_SZ;
            double *x=flint_aligned_alloc(64,len*sizeof(double));
            double *y=flint_aligned_alloc(64,len*sizeof(double));
            double *ref=flint_aligned_alloc(64,len*sizeof(double));
            ulong reps=blocks<=16?blocks:20;
            for (ulong rep=0;rep<reps;rep++) {
                ulong n=blocks<=16?rep+1:rep==0?blocks:rep==1?blocks-1:
                        rep==2?blocks/2:rep==3?blocks/2+1:1+random_word()%blocks;
                ulong trunc=n*BLK_SZ;
                for (int square=0;square<2;square++) {
                    memset(x,0,len*sizeof(double));memset(y,0,len*sizeof(double));
                    memset(ref,0,len*sizeof(double));
                    for (ulong j=0;j<trunc;j++) {
                        /* Signed FFT-range values, including extreme endpoints. */
                        x[j]=(double)(random_word()%(6*primes[pi]-1))-(3*Q->p-1);
                        y[j]=(double)(random_word()%(6*primes[pi]-1))-(3*Q->p-1);
                        if (j%17==0) x[j]=(j&1)?3*Q->p-1:1-3*Q->p;
                        ref[j]=vec1d_mulmod(x[j],square?x[j]:y[j],Q->p,Q->pinv);
                    }
                    sd_ifft_trunc(Q,ref,L,trunc);
                    bf_sd_ifft_trunc_mul(Q,x,square?x:y,L,trunc);
                    if (memcmp(x,ref,trunc*sizeof(double))) {
                        fprintf(stderr,"FAIL prime=%lu L=%lu blocks=%lu square=%d\n",pi,L,n,square);
                        return 1;
                    }
                    cases++;coefficients+=trunc;
                }
            }
            flint_aligned_free(x);flint_aligned_free(y);flint_aligned_free(ref);
        }
        sd_fft_ctx_clear(Q);
    }
    printf("PASS %lu fused/reference cases, %lu coefficients compared bit-for-bit\n",cases,coefficients);
    flint_cleanup_master();
    return 0;
}
