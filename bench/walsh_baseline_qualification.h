/* Conventional WHT comparators. Same n*log2(n) add/sub count as butterflies.
   Distinct input/output arrays; preserve input; one reusable scratch ball.
   Initial output pairs are computed directly from input, without a full copy.
   The original non-rigidity kernels are included unchanged. */
#define wn_functions wn_frozen_functions
#define wn_scratch wn_frozen_scratch
#include "walsh_nonrigidity.h"
#undef wn_functions
#undef wn_scratch

static void wb_direct_iter(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    if (!l) { arb_set(y,x); return; }
    slong n=1L<<l;
    for (slong i=0;i<n;i+=2) {
        arb_add(y+i,x+i,x+i+1,p);
        arb_sub(y+i+1,x+i,x+i+1,p);
    }
    for (slong half=2;half<n;half*=2)
        for (slong i=0;i<n;i+=2*half)
            for (slong j=0;j<half;j++) wn_pair(y+i+j,y+i+j+half,s,p);
}
static void wb_direct_recursive(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    if (l<=1) { wb_direct_iter(y,x,l,p,s); return; }
    slong h=1L<<(l-1);
    wb_direct_recursive(y,x,l-1,p,s);
    wb_direct_recursive(y+h,x+h,l-1,p,s);
    for (slong j=0;j<h;j++) wn_pair(y+j,y+j+h,s,p);
}
static void wb_radix4(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    if (l<=2) { wb_direct_iter(y,x,l,p,s); return; }
    slong h=1L<<(l-2);
    for (slong j=0;j<4;j++) wb_radix4(y+j*h,x+j*h,l-2,p,s);
    for (slong i=0;i<h;i++) {
        arb_ptr a=y+i,b=a+h,c=b+h,d=c+h;
        wn_pair(a,b,s,p); wn_pair(c,d,s,p);
        wn_pair(a,c,s,p); wn_pair(b,d,s,p);
    }
}
static void wb_radix8(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    if (l<=3) { wb_direct_iter(y,x,l,p,s); return; }
    slong h=1L<<(l-3);
    for (slong j=0;j<8;j++) wb_radix8(y+j*h,x+j*h,l-3,p,s);
    for (slong i=0;i<h;i++) {
        arb_ptr a=y+i,b=a+h,c=b+h,d=c+h,e=d+h,f=e+h,g=f+h,v=g+h;
        wn_pair(a,b,s,p); wn_pair(c,d,s,p); wn_pair(e,f,s,p); wn_pair(g,v,s,p);
        wn_pair(a,c,s,p); wn_pair(b,d,s,p); wn_pair(e,g,s,p); wn_pair(f,v,s,p);
        wn_pair(a,e,s,p); wn_pair(b,f,s,p); wn_pair(c,g,s,p); wn_pair(d,v,s,p);
    }
}
static wn_fn wn_functions[]={wn_iter,wn_recursive,wn_h4,wn_h8,
    wb_direct_iter,wb_direct_recursive,wb_radix4,wb_radix8};
static const slong wn_scratch[]={1,1,6,16,1,1,1,1};
