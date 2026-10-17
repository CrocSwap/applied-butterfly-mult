/* Native Float64 natural-order, unnormalized WHTs.
 * H4/H8: Alman--Rao non-rigidity schedules, adapted from our frozen
 * theta_nonrigidity_kernel.h; same recursive traversal as radix4/radix8.
 * No fast-math, heap allocation, padding or normalization. Finite bounded
 * HadaMAG inputs only; no claim of overflow equivalence for arbitrary doubles.
 */
#include <stddef.h>
#include <stdint.h>

void hn_iter(double *x, int l) {
    size_t n=(size_t)1<<l;
    for(size_t h=1;h<n;h*=2)
        for(size_t b=0;b<n;b+=2*h)
            for(size_t i=0;i<h;i++) {
                double a=x[b+i],c=x[b+i+h];
                x[b+i]=a+c;x[b+i+h]=a-c;
            }
}
void hn_r2(double *x,int l) {
    if(!l)return;
    size_t h=(size_t)1<<(l-1);
    hn_r2(x,l-1);hn_r2(x+h,l-1);
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h];x[i]=a+b;x[i+h]=a-b;
    }
}
void hn_r4(double *x,int l) {
    if(l<2){hn_iter(x,l);return;}
    size_t h=(size_t)1<<(l-2);
    for(int j=0;j<4;j++)hn_r4(x+j*h,l-2);
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double ab=a+b,ad=a-b,cd=c+d,dd=c-d;
        x[i]=ab+cd;x[i+h]=ad+dd;x[i+2*h]=ab-cd;x[i+3*h]=ad-dd;
    }
}
void hn_r8(double *x,int l) {
    if(l<3){hn_iter(x,l);return;}
    size_t h=(size_t)1<<(l-3);
    for(int j=0;j<8;j++)hn_r8(x+j*h,l-3);
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double e=x[i+4*h],f=x[i+5*h],g=x[i+6*h],z=x[i+7*h];
        double ab=a+b,ad=a-b,cd=c+d,dd=c-d;
        double ef=e+f,ed=e-f,gz=g+z,gd=g-z;
        double t0=ab+cd,t1=ad+dd,t2=ab-cd,t3=ad-dd;
        double t4=ef+gz,t5=ed+gd,t6=ef-gz,t7=ed-gd;
        x[i]=t0+t4;x[i+h]=t1+t5;x[i+2*h]=t2+t6;x[i+3*h]=t3+t7;
        x[i+4*h]=t0-t4;x[i+5*h]=t1-t5;x[i+6*h]=t2-t6;x[i+7*h]=t3-t7;
    }
}
static void h4(double *x,int l,int k) {
    if(l<2) {
        double s=(double)((uint64_t)1<<k);
        for(size_t i=0;i<((size_t)1<<l);i++)x[i]*=s;
        hn_iter(x,l);return;
    }
    size_t h=(size_t)1<<(l-2);
    h4(x,l-2,k);for(int j=1;j<4;j++)h4(x+j*h,l-2,k+1);
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double e=(b+c+d)*0.5,f=a-e;
        x[i]=a+e;x[i+h]=f+c;x[i+2*h]=f+b;x[i+3*h]=f+d;
    }
}
static void h8(double *x,int l,int k) {
    if(l<3) {
        double s=(double)((uint64_t)1<<k);
        for(size_t i=0;i<((size_t)1<<l);i++)x[i]*=s;
        hn_iter(x,l);return;
    }
    size_t h=(size_t)1<<(l-3);
    h8(x,l-3,k);for(int j=1;j<8;j++)h8(x+j*h,l-3,k+1);
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double e=x[i+4*h],f=x[i+5*h],g=x[i+6*h],z=x[i+7*h];
        double b1=b+c,b2=d+z,b3=f+g;
        double tot=(b1+b2+b3+e)*0.5,diff=a-tot;
        double D=diff+d,E=diff+e,H=diff+z;
        x[i]=a+tot;x[i+h]=E+c+g;x[i+2*h]=E+b+f;x[i+3*h]=E+b2;
        x[i+4*h]=D+b1;x[i+5*h]=H+c+f;x[i+6*h]=H+b+g;x[i+7*h]=D+b3;
    }
}
void hn_h4(double *x,int l){h4(x,l,0);}
void hn_h8(double *x,int l){h8(x,l,0);}

static inline void merge4(double *x,size_t h) {
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double ab=a+b,ad=a-b,cd=c+d,dd=c-d;
        x[i]=ab+cd;x[i+h]=ad+dd;x[i+2*h]=ab-cd;x[i+3*h]=ad-dd;
    }
}
void hn_i4(double *x,int l) {
    size_t n=(size_t)1<<l,h=1;int done=0;
    for(;done+2<=l;done+=2,h*=4)
        for(size_t b=0;b<n;b+=4*h)merge4(x+b,h);
    for(;done<l;done++,h*=2)
        for(size_t b=0;b<n;b+=2*h)
            for(size_t i=0;i<h;i++) {
                double a=x[b+i],c=x[b+i+h];x[b+i]=a+c;x[b+i+h]=a-c;
            }
}

static inline void merge8(double *x,size_t h) {
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double e=x[i+4*h],f=x[i+5*h],g=x[i+6*h],z=x[i+7*h];
        double ab=a+b,ad=a-b,cd=c+d,dd=c-d;
        double ef=e+f,ed=e-f,gz=g+z,gd=g-z;
        double t0=ab+cd,t1=ad+dd,t2=ab-cd,t3=ad-dd;
        double t4=ef+gz,t5=ed+gd,t6=ef-gz,t7=ed-gd;
        x[i]=t0+t4;x[i+h]=t1+t5;x[i+2*h]=t2+t6;x[i+3*h]=t3+t7;
        x[i+4*h]=t0-t4;x[i+5*h]=t1-t5;x[i+6*h]=t2-t6;x[i+7*h]=t3-t7;
    }
}
void hn_i8(double *x,int l) {
    size_t n=(size_t)1<<l,h=1;int done=0;
    for(;done+3<=l;done+=3,h*=8)
        for(size_t b=0;b<n;b+=8*h)merge8(x+b,h);
    for(;done<l;done++,h*=2)
        for(size_t b=0;b<n;b+=2*h)
            for(size_t i=0;i<h;i++) {
                double a=x[b+i],c=x[b+i+h];x[b+i]=a+c;x[b+i+h]=a-c;
            }
}

static inline void mergeh4(double *x,size_t h) {
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double e=(b+c+d)*0.5,f=a-e;
        x[i]=a+e;x[i+h]=f+c;x[i+2*h]=f+b;x[i+3*h]=f+d;
    }
}
/* Flatten exactly the same schedule; scaling is part of each call. */
void hn_h4i(double *x,int l) {
    size_t n=(size_t)1<<l,h=(size_t)1<<(l%2);
    for(size_t b=0;b<n;b+=h) {
        uint64_t digits=b/h;
        unsigned k=__builtin_popcountll(((digits>>0) | (digits>>1))&UINT64_C(0x5555555555555555));
        double scale=(double)(UINT64_C(1)<<k);
        for(size_t i=0;i<h;i++)x[b+i]*=scale;
        hn_iter(x+b,l%2);
    }
    for(;h<n;h*=4)
        for(size_t b=0;b<n;b+=4*h)mergeh4(x+b,h);
}

static inline void mergeh8(double *x,size_t h) {
    for(size_t i=0;i<h;i++) {
        double a=x[i],b=x[i+h],c=x[i+2*h],d=x[i+3*h];
        double e=x[i+4*h],f=x[i+5*h],g=x[i+6*h],z=x[i+7*h];
        double b1=b+c,b2=d+z,b3=f+g;
        double tot=(b1+b2+b3+e)*0.5,diff=a-tot;
        double D=diff+d,E=diff+e,H=diff+z;
        x[i]=a+tot;x[i+h]=E+c+g;x[i+2*h]=E+b+f;x[i+3*h]=E+b2;
        x[i+4*h]=D+b1;x[i+5*h]=H+c+f;x[i+6*h]=H+b+g;x[i+7*h]=D+b3;
    }
}
/* Flatten exactly the same schedule; scaling is part of each call. */
void hn_h8i(double *x,int l) {
    size_t n=(size_t)1<<l,h=(size_t)1<<(l%3);
    for(size_t b=0;b<n;b+=h) {
        uint64_t digits=b/h;
        unsigned k=__builtin_popcountll(((digits>>0) | (digits>>1) | (digits>>2))&UINT64_C(0x9249249249249249));
        double scale=(double)(UINT64_C(1)<<k);
        for(size_t i=0;i<h;i++)x[b+i]*=scale;
        hn_iter(x+b,l%3);
    }
    for(;h<n;h*=8)
        for(size_t b=0;b<n;b+=8*h)mergeh8(x+b,h);
}
