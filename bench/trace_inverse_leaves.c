#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>
#include "fft_small.h"
#include "mpn_extras.h"

extern ulong bf_inverse_leaf_calls[4];
static ulong state=0x65cc9379be3a6241UL;
static ulong rnd(void) { state^=state<<13;state^=state>>7;state^=state<<17;return state; }
static void report(const char *op, ulong an, ulong bn) {
    printf("{\"operation\":\"%s\",\"an\":%lu,\"bn\":%lu,\"leaf16_zero\":%lu,"
           "\"leaf16_nonzero\":%lu,\"leaf32_zero\":%lu,\"leaf32_nonzero\":%lu}\n",
           op,an,bn,bf_inverse_leaf_calls[0],bf_inverse_leaf_calls[1],
           bf_inverse_leaf_calls[2],bf_inverse_leaf_calls[3]);
}
int main(void) {
    ulong sizes[]={4095,4096,4097,6144,8191,8192,8193,12288,16383,16384,16385};
    flint_set_num_threads(1);
    for (int k=0;k<11;k++) for (int shape=0;shape<3;shape++) {
        ulong an=sizes[k],bn=shape==2?an/2:an;
        ulong *a=malloc(an*sizeof(ulong)),*b=malloc(bn*sizeof(ulong));
        ulong *z=malloc((an+bn)*sizeof(ulong)),*ref=malloc((an+bn)*sizeof(ulong));
        if (!a || !b || !z || !ref) abort();
        for (ulong i=0;i<an;i++) a[i]=rnd();
        for (ulong i=0;i<bn;i++) b[i]=rnd();
        a[an-1]|=1UL<<63; b[bn-1]|=1UL<<63;
        if (shape==1) { mpn_sqr(ref,a,an); _flint_mpn_sqr(z,a,an); }
        else { mpn_mul(ref,a,an,b,bn); _flint_mpn_mul(z,a,an,b,bn); }
        memset(bf_inverse_leaf_calls,0,4*sizeof(ulong));
        if (shape==1) _flint_mpn_sqr(z,a,an); else _flint_mpn_mul(z,a,an,b,bn);
        if (memcmp(z,ref,(an+bn)*sizeof(ulong))) abort();
        report(shape==1?"sqr":"mul",an,bn);
        free(a);free(b);free(z);free(ref);
    }
    sd_fft_ctx_t Q; sd_fft_ctx_init_prime(Q,0x3f00000000001UL);
    for (ulong L=5;L<=12;L++) {
        ulong N=1UL<<L;
        double *x=flint_aligned_alloc(32,N*sizeof(double));
        for (ulong i=0;i<N;i++) x[i]=rnd()%Q->mod.n;
        memset(bf_inverse_leaf_calls,0,4*sizeof(ulong));
        sd_ifft_trunc(Q,x,L,N); report("ifft",N,N);
        flint_aligned_free(x);
    }
    sd_fft_ctx_clear(Q); flint_cleanup_master(); return 0;
}
