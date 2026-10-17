#define _POSIX_C_SOURCE 200809L
#include <dlfcn.h>
#include <errno.h>
#include <gmp.h>
#include <inttypes.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct {
    void *handle;
    mp_limb_t (*mul)(mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);
    mp_limb_t (*sqr)(mp_ptr, mp_srcptr, mp_size_t);
    void (*threads)(long);
    void (*cleanup)(void);
} engine;

static volatile mp_limb_t sink;
static uint64_t rng = UINT64_C(0x65cc9379be3a6241);
static uint64_t random_word(void) { rng ^= rng<<13; rng ^= rng>>7; rng ^= rng<<17; return rng; }
static uint64_t now(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t)) abort();
    return (uint64_t)t.tv_sec*UINT64_C(1000000000)+t.tv_nsec;
}
static void *symbol(void *h, const char *name) {
    void *p = dlsym(h, name);
    if (!p) { fprintf(stderr, "%s: %s\n", name, dlerror()); exit(1); }
    return p;
}
static engine load(const char *path) {
    engine e;
    e.handle = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (!e.handle) { fprintf(stderr, "%s\n", dlerror()); exit(1); }
    e.mul = symbol(e.handle, "_flint_mpn_mul");
    e.sqr = symbol(e.handle, "_flint_mpn_sqr");
    e.threads = symbol(e.handle, "flint_set_num_threads");
    e.cleanup = symbol(e.handle, "flint_cleanup_master");
    e.threads(1);
    return e;
}
static size_t number(const char *s, size_t max) {
    char *end; errno = 0;
    unsigned long long x = strtoull(s, &end, 10);
    if (errno || !*s || *end || *s=='-' || x>max) exit(2);
    return x;
}
static void mul(engine *e, int square, mp_ptr z, mp_srcptr a, size_t an, mp_srcptr b, size_t bn) {
    if (square) e->sqr(z,a,an); else e->mul(z,a,an,b,bn);
}
static uint64_t batch(engine *e, int square, mp_ptr z, mp_srcptr a, size_t an,
                      mp_srcptr b, size_t bn, size_t reps) {
    uint64_t start=now();
    for (size_t i=0;i<reps;i++) mul(e,square,z,a,an,b,bn);
    uint64_t ns=now()-start;
    sink ^= z[0]; return ns;
}
int main(int argc,char **argv) {
    if (argc!=8) { fprintf(stderr,"usage: compare base.dylib candidate.dylib an bn mul|sqr trials batch_ms\n"); return 2; }
    engine e[2]={load(argv[1]),load(argv[2])};
    size_t an=number(argv[3],1u<<26),bn=number(argv[4],1u<<26);
    int square=!strcmp(argv[5],"sqr");
    size_t trials=number(argv[6],10000), ms=number(argv[7],10000);
    if (!bn || an<bn || (square && an!=bn) || (!square && strcmp(argv[5],"mul")) || !ms) return 2;
    mp_ptr a=malloc(an*sizeof(*a)), b=malloc(bn*sizeof(*b));
    mp_ptr z=malloc((an+bn)*sizeof(*z)),ref=malloc((an+bn)*sizeof(*ref));
    if (!a || !b || !z || !ref) return 1;
    for(int p=0;p<12;p++) {
        for(size_t i=0;i<an;i++) a[i]=p==0?~(mp_limb_t)0:p==1?UINT64_C(0xaaaaaaaaaaaaaaaa):p==2?0:random_word();
        for(size_t i=0;i<bn;i++) b[i]=p==0?~(mp_limb_t)0:p==1?UINT64_C(0x5555555555555555):p==2?0:random_word();
        a[an-1]|=(mp_limb_t)1<<(GMP_NUMB_BITS-1); b[bn-1]|=(mp_limb_t)1<<(GMP_NUMB_BITS-1);
        if(square) mpn_sqr(ref,a,an); else mpn_mul(ref,a,an,b,bn);
        for(int k=0;k<2;k++) {
            mul(e+k,square,z,a,an,b,bn);
            if(memcmp(z,ref,(an+bn)*sizeof(*z))) {
                fprintf(stderr,"mismatch engine=%d pattern=%d an=%zu bn=%zu\n",k,p,an,bn); return 1;
            }
        }
    }
    /* Both libraries are resident and warm. Each quartet uses equal work. */
    uint64_t warm=now();
    do { for(int k=0;k<2;k++) mul(e+k,square,z,a,an,b,bn); } while(now()-warm<200000000);
    size_t reps=1;
    while (reps<(1u<<24)) {
        uint64_t t0=batch(e,square,z,a,an,b,bn,reps);
        uint64_t t1=batch(e+1,square,z,a,an,b,bn,reps);
        if(t0>=ms*UINT64_C(1000000) && t1>=ms*UINT64_C(1000000)) break;
        reps*=2;
    }
    for(size_t t=0;t<trials;t++) {
        /* ABBA / BAAB cancels a linear drift within each quartet. */
        int first=t%2;
        int order[4]={first,1-first,1-first,first};
        for(int pos=0;pos<4;pos++) {
            int k=order[pos];
            uint64_t ns=batch(e+k,square,z,a,an,b,bn,reps);
            printf("{\"an\":%zu,\"bn\":%zu,\"operation\":\"%s\",\"trial\":%zu,\"position\":%d,\"engine\":%d,\"iterations\":%zu,\"elapsed_ns\":%" PRIu64 ",\"ns_per_op\":%.3f}\n",an,bn,argv[5],t,pos,k,reps,ns,(double)ns/reps);
        }
        fflush(stdout);
    }
    free(a);free(b);free(z);free(ref);
    if(e[0].handle!=e[1].handle) e[1].cleanup();
    e[0].cleanup();
    return 0;
}
