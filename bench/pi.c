#define _DARWIN_C_SOURCE
#define _POSIX_C_SOURCE 200809L
#include <dlfcn.h>
#include <errno.h>
#include <inttypes.h>
#include <pthread.h>
#include <pthread/qos.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <mpfr.h>
#include "arb.h"
#include "mp_real.h"

/* No FLINT library is linked into this harness. Each function is resolved
   from its own dylib, whose internal two-level bindings stay in that dylib. */
typedef struct {
    void *handle;
    void (*init)(arb_t);
    void (*clear)(arb_t);
    void (*compute)(arb_t,mp_real_const_func,slong);
    mp_real_const_func pi4;
    void (*scale)(arb_t,const arb_t,slong);
    int (*equal)(const arb_t,const arb_t);
    int (*contains)(const arb_t,const mpfr_t);
    slong (*accuracy)(const arb_t);
    void (*threads)(int);
    void (*cleanup)(void);
} engine;

static volatile ulong sink;
static uint64_t now(clockid_t clock) {
    struct timespec t;
    if (clock_gettime(clock,&t)) abort();
    return (uint64_t)t.tv_sec*UINT64_C(1000000000)+t.tv_nsec;
}
static void *symbol(void *h,const char *name) {
    void *p=dlsym(h,name);
    if (!p) { fprintf(stderr,"%s: %s\n",name,dlerror());exit(1); }
    return p;
}
static engine load(const char *path) {
    engine e;
    e.handle=dlopen(path,RTLD_NOW|RTLD_LOCAL);
    if (!e.handle) { fprintf(stderr,"%s\n",dlerror());exit(1); }
    e.init=symbol(e.handle,"arb_init");e.clear=symbol(e.handle,"arb_clear");
    e.compute=symbol(e.handle,"_mp_real_const_arb");
    e.pi4=symbol(e.handle,"mp_real_const_pi4");
    e.scale=symbol(e.handle,"arb_mul_2exp_si");
    e.equal=symbol(e.handle,"arb_equal");
    e.contains=symbol(e.handle,"arb_contains_mpfr");
    e.accuracy=symbol(e.handle,"arb_rel_accuracy_bits");
    e.threads=symbol(e.handle,"flint_set_num_threads");
    e.cleanup=symbol(e.handle,"flint_cleanup_master");
    e.threads(1);
    return e;
}
static size_t number(const char *s,size_t max) {
    char *end;errno=0;
    unsigned long long x=strtoull(s,&end,10);
    if (errno || !*s || *end || *s=='-' || x>max || !x) exit(2);
    return x;
}
static void compute(engine *e,arb_t z,slong prec) {
    /* _mp_real_const_arb calls pi4 with cache=0, recomputing the series. */
    e->compute(z,e->pi4,prec);
    e->scale(z,z,2);
}
static uint64_t batch(engine *e,arb_t z,slong prec,size_t reps,uint64_t *cpu) {
    uint64_t c=now(CLOCK_THREAD_CPUTIME_ID),w=now(CLOCK_MONOTONIC);
    for (size_t j=0;j<reps;j++) compute(e,z,prec);
    uint64_t wall=now(CLOCK_MONOTONIC)-w;
    *cpu=now(CLOCK_THREAD_CPUTIME_ID)-c;
    sink^=MAG_MAN(arb_radref(z));
    return wall;
}
static void verify(engine *e,arb_struct *z,mpfr_t lo,mpfr_t hi,slong prec) {
    if (!e[0].equal(z,z+1)) { fprintf(stderr,"baseline/candidate balls differ\n");exit(1); }
    for (int k=0;k<2;k++) {
        if (!e[k].contains(z+k,lo) || !e[k].contains(z+k,hi) || e[k].accuracy(z+k)<prec-4) {
            fprintf(stderr,"MPFR containment or accuracy failure, engine=%d\n",k);exit(1);
        }
    }
}
int main(int argc,char **argv) {
    if (argc!=6) {
        fprintf(stderr,"usage: pi baseline.dylib candidate.dylib precision_bits trials batch_ms\n");return 2;
    }
    if (pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0)) return 1;
    slong prec=(slong)number(argv[3],1u<<27);
    size_t trials=number(argv[4],10000),ms=number(argv[5],10000);
    engine e[2]={load(argv[1]),load(argv[2])};
    arb_struct z[2];
    mpfr_t lo,hi;
    mpfr_init2(lo,prec+128);mpfr_init2(hi,prec+128);
    mpfr_const_pi(lo,MPFR_RNDD);mpfr_const_pi(hi,MPFR_RNDU);
    for (int k=0;k<2;k++) { e[k].init(z+k);compute(e+k,z+k,prec); }
    verify(e,z,lo,hi,prec);
    uint64_t warm=now(CLOCK_MONOTONIC),cpu;
    do { for (int k=0;k<2;k++) compute(e+k,z+k,prec); }
    while (now(CLOCK_MONOTONIC)-warm<200000000);
    size_t reps=1;
    while (reps<(1u<<20)) {
        uint64_t a=batch(e,z,prec,reps,&cpu),b=batch(e+1,z+1,prec,reps,&cpu);
        if (a>=ms*UINT64_C(1000000) && b>=ms*UINT64_C(1000000)) break;
        reps*=2;
    }
    for (size_t t=0;t<trials;t++) {
        int first=t%2,order[4]={first,1-first,1-first,first};
        for (int pos=0;pos<4;pos++) {
            int k=order[pos];
            uint64_t wall=batch(e+k,z+k,prec,reps,&cpu);
            printf("{\"precision_bits\":%ld,\"operation\":\"pi\",\"trial\":%zu,\"position\":%d,\"engine\":%d,\"iterations\":%zu,\"elapsed_ns\":%" PRIu64 ",\"ns_per_op\":%.3f,\"cpu_elapsed_ns\":%" PRIu64 ",\"cpu_ns_per_op\":%.3f}\n",
                   prec,t,pos,k,reps,wall,(double)wall/reps,cpu,(double)cpu/reps);
        }
        fflush(stdout);
    }
    verify(e,z,lo,hi,prec);
    fprintf(stderr,"{\"precision_bits\":%ld,\"exact_ball_equality\":true,\"mpfr_directed_bounds_contained\":true,\"accuracy_bits\":[%ld,%ld],\"verified_before_and_after\":true}\n",
            prec,e[0].accuracy(z),e[1].accuracy(z+1));
    for (int k=0;k<2;k++) e[k].clear(z+k);
    mpfr_clear(lo);mpfr_clear(hi);
    if (e[0].handle!=e[1].handle) e[1].cleanup();
    e[0].cleanup();
    return 0;
}
