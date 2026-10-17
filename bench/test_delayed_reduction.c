#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fft_small.h"
#include "ulong_extras.h"

void bf_control_8(double *, const double *, double, double);
void bf_delayed_8(double *, const double *, double, double);
void bf_control_32(const sd_fft_ctx_t, double *, ulong, ulong);
void bf_delayed_32(const sd_fft_ctx_t, double *, ulong, ulong);
static ulong state = 0x17ab493624de8711UL;
static ulong rnd(void) { state^=state<<13; state^=state>>7; state^=state<<17; return state; }
static ulong residue(double x, ulong p) {
    long r=(long)x%(long)p; return r<0?r+p:r;
}
static ulong add(ulong a, ulong b, ulong p) { return (a+b)%p; }
static ulong sub(ulong a, ulong b, ulong p) { return (a+p-b)%p; }
static ulong mul(ulong a, ulong b, ulong p) { return (unsigned __int128)a*b%p; }

/* Integer-modular reference, with no floating reductions or library butterflies. */
static void exact8(ulong *z, const double *x, const double *t, ulong p) {
    ulong a[8], w[7];
    for (int i=0;i<7;i++) w[i]=residue(t[i],p);
    for (int i=0;i<4;i++) {
        ulong u=residue(x[2*i],p),v=residue(x[2*i+1],p);
        a[2*i]=add(u,v,p); a[2*i+1]=mul(sub(v,u,p),w[3+i],p);
    }
    for (int k=0;k<2;k++) {
        ulong y0=add(a[k],a[k+2],p),y1=add(a[k+4],a[k+6],p);
        ulong y2=mul(sub(a[k],a[k+2],p),w[1],p);
        ulong y3=mul(sub(a[k+6],a[k+4],p),w[2],p);
        z[k]=add(y0,y1,p); z[k+2]=sub(y3,y2,p);
        z[k+4]=mul(sub(y1,y0,p),w[0],p);
        z[k+6]=mul(add(y3,y2,p),w[0],p);
    }
}

static void check(double a, double b, ulong expected, ulong p, const char *kind, ulong c, int i) {
    if (!isfinite(a) || !isfinite(b) || a!=trunc(a) || b!=trunc(b) ||
        fabs(a)>=2.0*p || fabs(b)>=2.0*p ||
        residue(a,p)!=expected || residue(b,p)!=expected) {
        fprintf(stderr,"FAIL %s p=%lu case=%lu lane=%d original=%.17g delayed=%.17g expected=%lu\n",
                kind,p,c,i,a,b,expected); exit(1);
    }
}

int main(void) {
    ulong primes[]={0x3f00000000001UL,1086317488242689UL,659706976665601UL,257};
    ulong cases8=0,cases32=0,coefficients=0;
    for (int pi=0;pi<4;pi++) {
        ulong p=primes[pi];
        for (ulong c=0;c<32768+20000;c++) {
            double x[8],a[8],b[8],tw[7]; ulong expected[8];
            for (int i=0;i<8;i++) {
                long v= c<32768 ? (((c>>i)&1)?2*(long)p-1:1-2*(long)p) :
                                  (long)(rnd()%(4*p-1))-(2*(long)p-1);
                x[i]=a[i]=b[i]=v;
            }
            for (int i=0;i<7;i++)
                tw[i]= c<32768 ? (((c>>(8+i))&1)?(long)(p/2):-(long)(p/2)) :
                                  (long)(rnd()%p)-(long)(p/2);
            exact8(expected,x,tw,p);
            bf_control_8(a,tw,p,1.0/p); bf_delayed_8(b,tw,p,1.0/p);
            for (int i=0;i<8;i++) { check(a[i],b[i],expected[i],p,"radix8",c,i); coefficients++; }
            cases8++;
        }
        sd_fft_ctx_t Q; sd_fft_ctx_init_prime(Q,p);
        ulong maxbits=FLINT_MIN(8,n_trailing_zeros(p-1)-5);
        for (ulong bits=1;bits<=maxbits;bits++) {
            sd_fft_ctx_fit_depth(Q,bits+5);
            for (ulong c=0;c<2048;c++) {
                double a[32] __attribute__((aligned(32))), b[32] __attribute__((aligned(32)));
                ulong jr=c<2?c*((1UL<<(bits-1))-1):rnd()%(1UL<<(bits-1));
                for (int i=0;i<32;i++) {
                    long v=c<256 ? (((c>>(i%8))&1)?2*(long)p-1:1-2*(long)p) :
                                  (long)(rnd()%(4*p-1))-(2*(long)p-1);
                    a[i]=b[i]=v;
                }
                bf_control_32(Q,a,jr,bits); bf_delayed_32(Q,b,jr,bits);
                for (int i=0;i<32;i++) { check(a[i],b[i],residue(a[i],p),p,"leaf32",c,i); coefficients++; }
                cases32++;
            }
        }
        sd_fft_ctx_clear(Q);
    }
    printf("PASS %lu radix8 integer-reference cases, %lu leaf32 differential cases, %lu coefficient and range checks\n",
           cases8,cases32,coefficients);
    flint_cleanup_master(); return 0;
}
