/* Alman--Rao, arXiv:2211.06459v2, Algorithms 9 and 5.
   Independent Arb implementation. Natural binary output order, no normalization.
   Distinct input/output arrays; caller owns reusable scratch (1, 1, 6, 16 balls).
   All input scaling is included, fused with the input-to-output copy. */
#include "arb.h"

static void wn_pair(arb_ptr a, arb_ptr b, arb_ptr s, slong p) {
    arb_add(s,a,b,p); arb_sub(b,a,b,p); arb_swap(a,s);
}
static void wn_iter_inner(arb_ptr y, slong l, slong p, arb_ptr s) {
    slong n=1L<<l;
    for(slong half=1;half<n;half*=2)
        for(slong i=0;i<n;i+=2*half)
            for(slong j=0;j<half;j++) wn_pair(y+i+j,y+i+j+half,s,p);
}
static void wn_iter(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    _arb_vec_set(y,x,1L<<l); wn_iter_inner(y,l,p,s);
}
static void wn_recursive(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    if(!l) {arb_set(y,x);return;}
    slong h=1L<<(l-1);
    wn_recursive(y,x,l-1,p,s);wn_recursive(y+h,x+h,l-1,p,s);
    for(slong j=0;j<h;j++) wn_pair(y+j,y+j+h,s,p);
}
static void wn_h4_rec(arb_ptr y, arb_srcptr x, slong l, slong k, slong p, arb_ptr s) {
    if(l<2) {
        for(slong i=0;i<(1L<<l);i++) arb_mul_2exp_si(y+i,x+i,k);
        wn_iter_inner(y,l,p,s);return;
    }
    slong h=1L<<(l-2);
    for(slong j=0;j<4;j++) wn_h4_rec(y+j*h,x+j*h,l-2,k+(j!=0),p,s);
    for(slong i=0;i<h;i++) {
        arb_ptr a=y+i,b=a+h,c=b+h,d=c+h;
        arb_add(s,b,c,p);arb_add(s,s,d,p);arb_mul_2exp_si(s,s,-1);
        arb_sub(s+1,a,s,p);
        arb_add(s+2,a,s,p);arb_add(s+3,s+1,c,p);
        arb_add(s+4,s+1,b,p);arb_add(s+5,s+1,d,p);
        for(slong j=0;j<4;j++) arb_swap(a+j*h,s+2+j);
    }
}
static void wn_h4(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    wn_h4_rec(y,x,l,0,p,s);
}
static void wn_h8_rec(arb_ptr y, arb_srcptr x, slong l, slong k, slong p, arb_ptr s) {
    if(l<3) {
        for(slong i=0;i<(1L<<l);i++) arb_mul_2exp_si(y+i,x+i,k);
        wn_iter_inner(y,l,p,s);return;
    }
    slong h=1L<<(l-3);
    for(slong j=0;j<8;j++) wn_h8_rec(y+j*h,x+j*h,l-3,k+(j!=0),p,s);
    for(slong i=0;i<h;i++) {
        arb_ptr a=y+i,b=a+h,c=b+h,d=c+h,e=d+h,f=e+h,g=f+h,v=g+h;
        arb_add(s,b,c,p);arb_add(s+1,d,v,p);arb_add(s+2,f,g,p);
        arb_add(s+3,s,s+1,p);arb_add(s+3,s+3,s+2,p);arb_add(s+3,s+3,e,p);
        arb_mul_2exp_si(s+3,s+3,-1);arb_sub(s+4,a,s+3,p);
        arb_add(s+5,s+4,d,p);arb_add(s+6,s+4,e,p);arb_add(s+7,s+4,v,p);
        arb_add(s+8,a,s+3,p);
        arb_add(s+9,s+6,c,p);arb_add(s+9,s+9,g,p);
        arb_add(s+10,s+6,b,p);arb_add(s+10,s+10,f,p);
        arb_add(s+11,s+6,s+1,p);arb_add(s+12,s+5,s,p);
        arb_add(s+13,s+7,c,p);arb_add(s+13,s+13,f,p);
        arb_add(s+14,s+7,b,p);arb_add(s+14,s+14,g,p);
        arb_add(s+15,s+5,s+2,p);
        for(slong j=0;j<8;j++) arb_swap(a+j*h,s+8+j);
    }
}
static void wn_h8(arb_ptr y, arb_srcptr x, slong l, slong p, arb_ptr s) {
    wn_h8_rec(y,x,l,0,p,s);
}
typedef void (*wn_fn)(arb_ptr,arb_srcptr,slong,slong,arb_ptr);
static wn_fn wn_functions[]={wn_iter,wn_recursive,wn_h4,wn_h8};
static const slong wn_scratch[]={1,1,6,16};
