#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
void hn_iter(double *,int);void hn_r2(double *,int);void hn_r4(double *,int);
void hn_r8(double *,int);void hn_h4(double *,int);void hn_h8(double *,int);
void hn_i4(double *,int);void hn_i8(double *,int);
void hn_h4i(double *,int);void hn_h8i(double *,int);
int main(void) {
    void (*fs[])(double*,int)={hn_iter,hn_r2,hn_r4,hn_r8,hn_h4,hn_h8,hn_i4,hn_i8,hn_h4i,hn_h8i};
    uint32_t s=78019;
    for(int l=0;l<=16;l++) {
        size_t n=(size_t)1<<l;
        double *x=malloc(n*sizeof(double)),*ref=malloc(n*sizeof(double));
        for(size_t i=0;i<n;i++){s=s*1664525+1013904223;x[i]=((int)(s%33)-16)/8.0;}
        memcpy(ref,x,n*sizeof(double));hn_iter(ref,l);
        for(int j=0;j<10;j++) {
            double *y=malloc(n*sizeof(double));memcpy(y,x,n*sizeof(double));fs[j](y,l);
            for(size_t i=0;i<n;i++)assert(y[i]==ref[i]);free(y);
        }
        free(x);free(ref);
    }
    puts("PASS: 170 native exact dyadic transforms, ASan+UBSan");
}
