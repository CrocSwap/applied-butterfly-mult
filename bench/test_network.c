#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fft_small.h"
#include "machine_vectors.h"

void bf_sd_fft_trunc(sd_fft_ctx_t,double*,ulong,ulong,ulong);
void bf_sd_ifft_trunc(sd_fft_ctx_t,double*,ulong,ulong);
static ulong seed=0x573a9b12345098abUL;
static ulong rnd(void) { seed^=seed<<13;seed^=seed>>7;seed^=seed<<17;return seed; }
static ulong new_index(ulong L,ulong i) {
    return L<4?i:(i&~3UL)|((i&1)<<1)|((i&2)>>1);
}
static ulong residue(double d,ulong p) {
    long a=(long)d,r=a%(long)p;return r<0?r+p:r;
}
static void fail(const char *what,ulong p,ulong L,ulong trunc,ulong i) {
    fprintf(stderr,"FAIL %s p=%lu L=%lu trunc=%lu i=%lu\n",what,p,L,trunc,i);exit(1);
}
int main(void) {
    ulong primes[]={0x0003f00000000001UL,1086317488242689UL,659706976665601UL,257};
    ulong cases=0,coefficients=0,convolutions=0;
    for (int pi=0;pi<4;pi++) {
        sd_fft_ctx_t Q;sd_fft_ctx_init_prime(Q,primes[pi]);
        ulong p=primes[pi];
        for (ulong L=0;L<=(pi==3?8:17);L++) {
            ulong N=1UL<<L;
            double *a=flint_aligned_alloc(32,FLINT_MAX(32,N*sizeof(double)));
            double *b=flint_aligned_alloc(32,FLINT_MAX(32,N*sizeof(double)));
            double *input=malloc(N*sizeof(double));
            for (int mode=0;mode<6;mode++) {
                ulong trunc=mode<3?N:mode==3?1:mode==4?FLINT_MAX(1,N/3):FLINT_MAX(1,N-1);
                for (ulong i=0;i<N;i++) {
                    long lim=3*(long)p-1;
                    input[i]=mode==0?(i%2?lim:-lim):mode==1?(i%4<2?lim:-lim):(long)(rnd()%(2*lim+1))-lim;
                }
                memcpy(a,input,N*sizeof(double));memcpy(b,input,N*sizeof(double));
                sd_fft_trunc(Q,a,L,trunc,trunc);bf_sd_fft_trunc(Q,b,L,trunc,trunc);
                ulong avail=L<=8?N:FLINT_MIN(N,((trunc+255)/256)*256);
                for (ulong i=0;i<avail;i++) {
                    if (residue(a[sd_fft_ctx_trunc_index(L,i)],p)!=residue(b[new_index(L,i)],p))
                        fail("forward layout",p,L,trunc,i);
                    coefficients++;
                }
                sd_ifft_trunc(Q,a,L,trunc);bf_sd_ifft_trunc(Q,b,L,trunc);
                for (ulong i=0;i<trunc;i++) {
                    ulong expected=(unsigned __int128)residue(input[i],p)*N%p;
                    if (residue(a[i],p)!=expected || residue(b[i],p)!=expected)
                        fail("round trip",p,L,trunc,i);
                    coefficients++;
                }
                cases++;
            }
            /* Arbitrary inverse inputs, including signed extremes, at full length. */
            for (ulong i=0;i<N;i++) {
                long x=i%3==0?2*(long)p-1:i%3==1?1-2*(long)p:(long)(rnd()%(4*p-1))-(2*p-1);
                a[sd_fft_ctx_trunc_index(L,i)]=x;b[new_index(L,i)]=x;
            }
            sd_ifft_trunc(Q,a,L,N);bf_sd_ifft_trunc(Q,b,L,N);
            for (ulong i=0;i<N;i++) {
                if (residue(a[i],p)!=residue(b[i],p)) fail("inverse layout",p,L,N,i);
                coefficients++;
            }
            cases++;
            if (L<=5) {
                ulong left[32],right[32];
                for (ulong i=0;i<N;i++) { left[i]=rnd()%p;right[i]=rnd()%p;a[i]=left[i];b[i]=right[i]; }
                bf_sd_fft_trunc(Q,a,L,N,N);bf_sd_fft_trunc(Q,b,L,N,N);
                for (ulong i=0;i<N;i++) a[i]=vec1d_mulmod(a[i],b[i],Q->p,Q->pinv);
                bf_sd_ifft_trunc(Q,a,L,N);
                for (ulong k=0;k<N;k++) {
                    ulong expected=0;
                    for (ulong j=0;j<N;j++) expected=(expected+(unsigned __int128)left[j]*right[(k+N-j)%N])%p;
                    expected=(unsigned __int128)expected*N%p;
                    if (residue(a[k],p)!=expected) fail("cyclic convolution",p,L,N,k);
                }
                convolutions++;
            }
            flint_aligned_free(a);flint_aligned_free(b);free(input);
        }
        sd_fft_ctx_clear(Q);
    }
    printf("PASS %lu transform cases, %lu coefficient checks, %lu naive cyclic convolutions\n",cases,coefficients,convolutions);
    flint_cleanup_master();return 0;
}
