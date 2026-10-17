#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "fft_small.h"
#include "machine_vectors.h"
#include "kernel.inc"

static ulong seed=0x195861ade2238945UL;
static ulong random_word(void){seed^=seed<<13;seed^=seed>>7;seed^=seed<<17;return seed;}
static long input(ulong p,int trial,int index) {
    long edge[]={0,1,-1,(long)p,-(long)p,4*(long)p-1,1-4*(long)p,
                 2*(long)p-1,1-2*(long)p,(long)p-1,1-(long)p};
    if(trial<11)return edge[(trial+index)%11];
    return (long)(random_word()%(8*p-1))-(4*(long)p-1);
}
int main(void) {
    mpn_ctx_struct *R=get_default_mpn_ctx();ulong checks=0;
    double a[16][16],b[16][4][16],z[4][16];
    const double *ap[16],*bp[16][4];double *zp[4];
    for(int j=0;j<4;j++)zp[j]=z[j];
    for(int l=0;l<16;l++){ap[l]=a[l];for(int j=0;j<4;j++)bp[l][j]=b[l][j];}
    int ks[]={1,2,4,8,16};
    for(int pi=0;pi<4;pi++)for(int ki=0;ki<5;ki++)for(int trial=0;trial<1011;trial++) {
        const sd_fft_ctx_struct *Q=R->ffts+pi;ulong p=Q->mod.n;int k=ks[ki];
        for(int l=0;l<k;l++)for(int f=0;f<16;f++) {
            a[l][f]=(double)input(p,trial,l+f);
            for(int j=0;j<4;j++)b[l][j][f]=(double)input(p,trial,3*l+f+j);
        }
        _bf_dot4(Q,zp,ap,bp,16,k);
        for(int j=0;j<4;j++)for(int f=0;f<16;f++) {
            __int128 sum=0;for(int l=0;l<k;l++)sum+=(__int128)(long)a[l][f]*(long)b[l][j][f];
            long expected=(long)(sum%p);if(expected<0)expected+=p;
            if(!isfinite(z[j][f]) || trunc(z[j][f])!=z[j][f] ||
               (k==1?fabs(z[j][f])>=2.0*p:fabs(z[j][f])>p))abort();
            long got=(long)z[j][f]%(long)p;if(got<0)got+=p;
            if(got!=expected){fprintf(stderr,"dot mismatch prime %d k %d trial %d\n",pi,k,trial);abort();}
            checks++;
        }
    }
    printf("{\"direct_coefficient_and_range_checks\":%lu,\"primes\":4,\"inner_dimensions\":5}\n",checks);
    flint_cleanup_master();return 0;
}
