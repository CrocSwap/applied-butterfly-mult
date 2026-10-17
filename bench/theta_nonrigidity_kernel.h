/* Alman--Rao, arXiv:2211.06459v2, Algorithms 9 and 5.
   Independent Acb implementation. Natural binary output order, no normalization.
   Distinct input/output arrays; caller owns reusable scratch (1, 1, 6, 16 balls).
   All input scaling is included, fused with the input-to-output copy. */
#include "acb.h"

static void tn_pair(acb_ptr a, acb_ptr b, acb_ptr s, slong p) {
    acb_add(s,a,b,p); acb_sub(b,a,b,p); acb_swap(a,s);
}
static void tn_iter_inner(acb_ptr y, slong l, slong p, acb_ptr s) {
    slong n=1L<<l;
    for(slong half=1;half<n;half*=2)
        for(slong i=0;i<n;i+=2*half)
            for(slong j=0;j<half;j++) tn_pair(y+i+j,y+i+j+half,s,p);
}
static void tn_iter(acb_ptr y, acb_srcptr x, slong l, slong p, acb_ptr s) {
    _acb_vec_set(y,x,1L<<l); tn_iter_inner(y,l,p,s);
}
static void tn_recursive(acb_ptr y, acb_srcptr x, slong l, slong p, acb_ptr s) {
    if(!l) {acb_set(y,x);return;}
    slong h=1L<<(l-1);
    tn_recursive(y,x,l-1,p,s);tn_recursive(y+h,x+h,l-1,p,s);
    for(slong j=0;j<h;j++) tn_pair(y+j,y+j+h,s,p);
}
static void tn_h4_rec(acb_ptr y, acb_srcptr x, slong l, slong k, slong p, acb_ptr s) {
    if(l<2) {
        for(slong i=0;i<(1L<<l);i++) acb_mul_2exp_si(y+i,x+i,k);
        tn_iter_inner(y,l,p,s);return;
    }
    slong h=1L<<(l-2);
    for(slong j=0;j<4;j++) tn_h4_rec(y+j*h,x+j*h,l-2,k+(j!=0),p,s);
    for(slong i=0;i<h;i++) {
        acb_ptr a=y+i,b=a+h,c=b+h,d=c+h;
        acb_add(s,b,c,p);acb_add(s,s,d,p);acb_mul_2exp_si(s,s,-1);
        acb_sub(s+1,a,s,p);
        acb_add(s+2,a,s,p);acb_add(s+3,s+1,c,p);
        acb_add(s+4,s+1,b,p);acb_add(s+5,s+1,d,p);
        for(slong j=0;j<4;j++) acb_swap(a+j*h,s+2+j);
    }
}
static void tn_h4(acb_ptr y, acb_srcptr x, slong l, slong p, acb_ptr s) {
    tn_h4_rec(y,x,l,0,p,s);
}
static void tn_h8_rec(acb_ptr y, acb_srcptr x, slong l, slong k, slong p, acb_ptr s) {
    if(l<3) {
        for(slong i=0;i<(1L<<l);i++) acb_mul_2exp_si(y+i,x+i,k);
        tn_iter_inner(y,l,p,s);return;
    }
    slong h=1L<<(l-3);
    for(slong j=0;j<8;j++) tn_h8_rec(y+j*h,x+j*h,l-3,k+(j!=0),p,s);
    for(slong i=0;i<h;i++) {
        acb_ptr a=y+i,b=a+h,c=b+h,d=c+h,e=d+h,f=e+h,g=f+h,v=g+h;
        acb_add(s,b,c,p);acb_add(s+1,d,v,p);acb_add(s+2,f,g,p);
        acb_add(s+3,s,s+1,p);acb_add(s+3,s+3,s+2,p);acb_add(s+3,s+3,e,p);
        acb_mul_2exp_si(s+3,s+3,-1);acb_sub(s+4,a,s+3,p);
        acb_add(s+5,s+4,d,p);acb_add(s+6,s+4,e,p);acb_add(s+7,s+4,v,p);
        acb_add(s+8,a,s+3,p);
        acb_add(s+9,s+6,c,p);acb_add(s+9,s+9,g,p);
        acb_add(s+10,s+6,b,p);acb_add(s+10,s+10,f,p);
        acb_add(s+11,s+6,s+1,p);acb_add(s+12,s+5,s,p);
        acb_add(s+13,s+7,c,p);acb_add(s+13,s+13,f,p);
        acb_add(s+14,s+7,b,p);acb_add(s+14,s+14,g,p);
        acb_add(s+15,s+5,s+2,p);
        for(slong j=0;j<8;j++) acb_swap(a+j*h,s+8+j);
    }
}
static void tn_h8(acb_ptr y, acb_srcptr x, slong l, slong p, acb_ptr s) {
    tn_h8_rec(y,x,l,0,p,s);
}
typedef void (*tn_fn)(acb_ptr,acb_srcptr,slong,slong,acb_ptr);
static tn_fn tn_functions[]={tn_iter,tn_recursive,tn_h4,tn_h8};
static const slong tn_scratch[]={1,1,6,16};
