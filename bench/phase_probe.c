#include <stdint.h>
#include <stdio.h>
#include "fft_small.h"

void bf_phase_forward(const sd_fft_ctx_t, double *, ulong, ulong);
void bf_phase_inverse(const sd_fft_ctx_t, double *, ulong, ulong);

static void emit(double *x, ulong n, ulong p)
{
    putchar('[');
    for (ulong i=0;i<n;i++) {
        int64_t v=(int64_t)x[i] % (int64_t)p;
        if (v<0) v+=p;
        printf("%s%llu",i?",":"",(unsigned long long)v);
    }
    putchar(']');
}

int main(void)
{
    const ulong primes[]={257,1108307720798209UL};
    double *x=flint_aligned_alloc(64,256*sizeof(double));
    for (ulong pi=0;pi<2;pi++) {
        ulong p=primes[pi];
        sd_fft_ctx_t Q; sd_fft_ctx_init_prime(Q,p);
        printf("{\"kind\":\"twiddles\",\"p\":%lu,\"values\":",p);
        for (ulong i=0;i<128;i++) x[i]=sd_fft_ctx_w2(Q,i);
        emit(x,128,p);puts("}");
        for (ulong k=1;k<=5;k++) for (ulong j=0;j<8;j++)
            for (int inv=0;inv<2;inv++) {
                ulong n=1UL<<k;
                printf("{\"kind\":\"matrix\",\"p\":%lu,\"k\":%lu,\"j\":%lu,\"inverse\":%d,\"columns\":[",p,k,j,inv);
                for (ulong col=0;col<n;col++) {
                    for (ulong i=0;i<n;i++) x[i]=(i==col);
                    if (inv) bf_phase_inverse(Q,x,k,j); else bf_phase_forward(Q,x,k,j);
                    if(col) putchar(',');
                    emit(x,n,p);
                }
                puts("]}");
            }
        for (ulong k=1;k<=8;k++) for (int inv=0;inv<2;inv++) {
            ulong n=1UL<<k;
            for (ulong i=0;i<n;i++) x[i]=1;
            if(inv) sd_ifft_trunc(Q,x,k,n); else sd_fft_trunc(Q,x,k,n,n);
            printf("{\"kind\":\"public_ones\",\"p\":%lu,\"k\":%lu,\"inverse\":%d,\"values\":",p,k,inv);
            emit(x,n,p);puts("}");
        }
        sd_fft_ctx_clear(Q);
    }
    flint_aligned_free(x);
    flint_cleanup();
    return 0;
}
