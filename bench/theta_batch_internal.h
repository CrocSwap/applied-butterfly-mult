/* Experimental private helpers inserted into FLINT acb_theta/ql_exact.c.
   The surrounding generated file retains FLINT's LGPL-3.0-or-later notice.
   Reuse is local to one duplication step; no global or cross-call cache. */
#ifndef BF_BATCH_TRANSFORMS
#define BF_BATCH_TRANSFORMS 1
#endif
#ifdef BF_BATCH_TRACE
#include <stdint.h>
#include <time.h>
static uint64_t bf_counters[5];
void bf_trace_reset(void) {for(int i=0;i<5;i++) bf_counters[i]=0;}
uint64_t bf_trace_get(int i) {return bf_counters[i];}
static uint64_t bf_ticks(void) {struct timespec t;clock_gettime(CLOCK_THREAD_CPUTIME_ID,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
#define BF_COUNT(i) (bf_counters[i]++)
#else
#define BF_COUNT(i) ((void)0)
#endif

typedef struct {
    acb_srcptr input;
    acb_ptr mid, hat;
    arf_t mag, eps;
    slong hat_prec;
} bf_batch_slot;

typedef struct {
    bf_batch_slot slot[2];
    acb_ptr work;
    arf_t mag, eps, error;
    arb_t bound;
    slong n;
} bf_batch_cache;

static void bf_batch_init(bf_batch_cache *c,slong n)
{
    c->n=n;
    for(int i=0;i<2;i++) {
        bf_batch_slot *s=c->slot+i;
        s->input=NULL;s->hat_prec=-1;
        s->mid=_acb_vec_init(n);
        s->hat=BF_BATCH_TRANSFORMS?_acb_vec_init(n):NULL;
        arf_init(s->mag);arf_init(s->eps);
    }
    c->work=_acb_vec_init(2*n);
    arf_init(c->mag);arf_init(c->eps);arf_init(c->error);arb_init(c->bound);
}

static void bf_batch_reset(bf_batch_cache *c)
{
    /* Both the input banks and d0 change between duplication steps. */
    for(int i=0;i<2;i++) {c->slot[i].input=NULL;c->slot[i].hat_prec=-1;}
}

static void bf_batch_clear(bf_batch_cache *c)
{
    for(int i=0;i<2;i++) {
        bf_batch_slot *s=c->slot+i;
        _acb_vec_clear(s->mid,c->n);
        if(s->hat) _acb_vec_clear(s->hat,c->n);
        arf_clear(s->mag);arf_clear(s->eps);
    }
    _acb_vec_clear(c->work,2*c->n);
    arf_clear(c->mag);arf_clear(c->eps);arf_clear(c->error);arb_clear(c->bound);
}

static void bf_batch_mul(bf_batch_cache *c,acb_ptr res,acb_srcptr a0,
    acb_srcptr a,arb_srcptr d0,arb_srcptr d,slong g,int all,slong prec)
{
    slong n=c->n,lp=ACB_THETA_LOW_PREC,hprec=prec;
    bf_batch_slot *s=NULL;
    BF_COUNT(0);
    for(int i=0;i<2;i++) if(c->slot[i].input==a0) {s=c->slot+i;break;}
    if(s) {BF_COUNT(2);}
    else {
        for(int i=0;i<2;i++) if(c->slot[i].input==NULL) {s=c->slot+i;break;}
        /* Defensive fallback if the caller's two-bank contract ever changes. */
        if(!s) {acb_theta_agm_mul_tight(res,a0,a,d0,d,g,all,prec);return;}
#ifdef BF_BATCH_TRACE
        uint64_t tick=bf_ticks();
#endif
        bf_rel_mag_err(s->mag,s->eps,a0,d0,n,lp);
        for(slong k=0;k<n;k++) acb_get_mid(s->mid+k,a0+k);
        s->input=a0;
#ifdef BF_BATCH_TRACE
        bf_counters[1]+=bf_ticks()-tick;
#endif
    }
    bf_rel_mag_err(c->mag,c->eps,a,d,n,lp);
    for(slong k=0;k<n;k++) {
        hprec=FLINT_MAX(hprec,prec+acb_theta_sum_addprec(d+k));
        acb_get_mid(c->work+k,a+k);
    }
    if(BF_BATCH_TRANSFORMS && !all) {
        /* Exact precision key: never substitute a transform rounded at another precision. */
        if(s->hat_prec!=hprec) {
            bf_hadamard(s->hat,s->mid,g,hprec);s->hat_prec=hprec;BF_COUNT(4);
        } else {BF_COUNT(3);}
        acb_ptr v=c->work+n;
        if(a0==a) {
            for(slong k=0;k<n;k++) acb_sqr(v+k,s->hat+k,hprec);
        } else {
            bf_hadamard(v,c->work,g,hprec);
            for(slong k=0;k<n;k++) acb_mul(v+k,s->hat+k,v+k,hprec);
        }
        bf_hadamard(res,v,g,hprec);
        _acb_vec_scalar_mul_2exp_si(res,res,n,-g);
    } else {
        acb_theta_agm_mul(res,s->mid,a0==a?s->mid:c->work,g,all,hprec);
    }
    /* Preserve the existing directed-rounding error formula, operation by operation. */
    arf_mul(c->error,s->mag,c->eps,lp,ARF_RND_CEIL);
    arf_addmul(c->error,c->mag,s->eps,lp,ARF_RND_CEIL);
    arf_addmul(c->error,c->eps,s->eps,lp,ARF_RND_CEIL);
    arf_mul_2exp_si(c->error,c->error,g);
    for(slong k=0;k<n;k++) {
        arb_neg(c->bound,d+k);arb_exp(c->bound,c->bound,lp);
        arb_mul_arf(c->bound,c->bound,c->error,lp);
        if(all) for(slong b=0;b<n;b++) acb_add_error_arb(res+k*n+b,c->bound);
        else acb_add_error_arb(res+k,c->bound);
    }
}
