#define _POSIX_C_SOURCE 200809L
#define _DARWIN_C_SOURCE
#include <dlfcn.h>
#include <math.h>
#include <pthread.h>
#include <pthread/qos.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "fft_small.h"

typedef void (*inverse_fn)(sd_fft_ctx_t,double*,ulong,ulong);
static double original[1024],data[1024] __attribute__((aligned(32)));
static ulong seed=0x318fb4ea17493711UL;
static ulong rnd(void) { seed^=seed<<13;seed^=seed>>7;seed^=seed<<17;return seed; }
static double now(clockid_t id) {
    struct timespec t; if(clock_gettime(id,&t)) abort(); return t.tv_sec*1e9+t.tv_nsec;
}
static void *symbol(void *h,const char *name) {
    void *p=dlsym(h,name); if(!p) { fprintf(stderr,"%s\n",dlerror());exit(1); } return p;
}
static void batch(inverse_fn fn,sd_fft_ctx_t Q,ulong L,ulong n,ulong reps,double *wall,double *cpu) {
    memcpy(data,original,n*sizeof(double));
    double c=now(CLOCK_THREAD_CPUTIME_ID),w=now(CLOCK_MONOTONIC);
    for(ulong i=0;i<reps;i++) fn(Q,data,L,n);
    *wall=now(CLOCK_MONOTONIC)-w;*cpu=now(CLOCK_THREAD_CPUTIME_ID)-c;
}
int main(int argc,char **argv) {
    if(argc!=6) return 2;
    ulong n=strtoul(argv[3],NULL,10),trials=strtoul(argv[4],NULL,10),ms=strtoul(argv[5],NULL,10);
    if((n!=128 && n!=256 && n!=512 && n!=1024) || trials<8 || !ms) return 2;
    if(pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0)) abort();
    void *h[2]={dlopen(argv[1],RTLD_NOW|RTLD_LOCAL),dlopen(argv[2],RTLD_NOW|RTLD_LOCAL)};
    if(!h[0] || !h[1]) { fprintf(stderr,"%s\n",dlerror());return 1; }
    inverse_fn fn[2]={symbol(h[0],"sd_ifft_trunc"),symbol(h[1],"sd_ifft_trunc")};
    void (*init)(sd_fft_ctx_t,ulong)=symbol(h[0],"sd_fft_ctx_init_prime");
    void (*clear)(sd_fft_ctx_t)=symbol(h[0],"sd_fft_ctx_clear");
    sd_fft_ctx_t Q; init(Q,0x3f00000000001UL);
    ulong L=0;while((1UL<<L)<n)L++;
    for(ulong i=0;i<n;i++) original[i]=(long)(rnd()%(4*Q->mod.n-1))-(2*(long)Q->mod.n-1);
    double wall,cpu,reference[1024];
    batch(fn[0],Q,L,n,1,&wall,&cpu);memcpy(reference,data,n*sizeof(double));
    batch(fn[1],Q,L,n,1,&wall,&cpu);
    for(ulong i=0;i<n;i++) {
        long p=Q->mod.n,a=(long)reference[i]%p,b=(long)data[i]%p;
        if(a<0)a+=p;if(b<0)b+=p;
        if(a!=b || !isfinite(data[i]) || trunc(data[i])!=data[i] || fabs(data[i])>=2.0*p) abort();
    }
    double start=now(CLOCK_MONOTONIC);
    do { for(int e=0;e<2;e++)batch(fn[e],Q,L,n,1000,&wall,&cpu); }
    while(now(CLOCK_MONOTONIC)-start<2e8);
    ulong reps=1;
    do { batch(fn[0],Q,L,n,reps,&wall,&cpu);if(wall<ms*1e6)reps*=2;else break; } while(reps<(1UL<<30));
    for(ulong t=0;t<trials;t++) for(int pos=0;pos<4;pos++) {
        int e=(t%2)^(pos==1 || pos==2);
        batch(fn[e],Q,L,n,reps,&wall,&cpu);
        printf("{\"an\":%lu,\"bn\":%lu,\"operation\":\"ifft\",\"trial\":%lu,\"position\":%d,"
               "\"engine\":%d,\"iterations\":%lu,\"ns_per_op\":%.9f,\"cpu_ns_per_op\":%.9f}\n",
               n,n,t,pos,e,reps,wall/reps,cpu/reps);
    }
    clear(Q); return 0;
}
