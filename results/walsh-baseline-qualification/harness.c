#include <assert.h>
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "fmpz.h"
#include "fmpz_vec.h"
#include "walsh_baseline_qualification.h"

static uint64_t ticks(clockid_t c) {
    struct timespec t;assert(!clock_gettime(c,&t));
    return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;
}
/* Exact integer WHT oracle, with direct character sums also checked for n<=128. */
static void exact_wht(fmpz *y, const fmpz *x, slong n) {
    for(slong i=0;i<n;i++)fmpz_set(y+i,x+i);
    fmpz_t t,u;fmpz_init(t);fmpz_init(u);
    for(slong h=1;h<n;h*=2) for(slong i=0;i<n;i+=2*h) for(slong j=0;j<h;j++) {
        fmpz_add(t,y+i+j,y+i+j+h);fmpz_sub(y+i+j+h,y+i+j,y+i+j+h);fmpz_swap(y+i+j,t);
    }
    if(n<=128) for(slong i=0;i<n;i++) {
        fmpz_zero(u);
        for(slong j=0;j<n;j++) {
            if(__builtin_parityl(i&j))fmpz_sub(u,u,x+j);else fmpz_add(u,u,x+j);
        }
        assert(fmpz_equal(u,y+i));
    }
    fmpz_clear(t);fmpz_clear(u);
}
static int evaluate(arb_ptr out,arb_srcptr in,arb_ptr scratch,int engine,
                    slong l,slong target,slong *used,slong *accuracy) {
    int attempts=0;slong initial=target+l+8;
    for(slong p=initial;p<=initial+256;p+=16) {
        wn_functions[engine](out,in,l,p,scratch);attempts++;
        slong acc=WORD_MAX;
        for(slong i=0;i<(1L<<l);i++)acc=FLINT_MIN(acc,arb_rel_one_accuracy_bits(out+i));
        if(acc>=target) {*used=p;*accuracy=acc;return attempts;}
    }
    fprintf(stderr,"accuracy cap: engine %d logn %ld target %ld\n",engine,l,target);exit(3);
}
int main(int argc,char **argv) {
    assert(argc==8);
    int measure=!strcmp(argv[1],"measure");assert(measure||!strcmp(argv[1],"validate"));
    slong l=atol(argv[2]),target=atol(argv[3]);int fixture=atoi(argv[4]);
    int e0=atoi(argv[5]),e1=atoi(argv[6]),trials=atoi(argv[7]);
    assert(l>=0&&l<=14&&target>=32&&target<=65536&&fixture>=0&&fixture<=3);
    assert(e0>=0&&e0<8&&e1>=0&&e1<8&&trials>=1&&trials<=1000);
    slong n=1L<<l,bits=target+l+80;
    arb_ptr in=_arb_vec_init(n),out[2]={_arb_vec_init(n),_arb_vec_init(n)};
    arb_ptr scratch[2]={_arb_vec_init(wn_scratch[e0]),_arb_vec_init(wn_scratch[e1])};
    fmpz *exact=_fmpz_vec_init(n),*expected=_fmpz_vec_init(n);
    flint_rand_t rng;flint_rand_init(rng);flint_rand_set_seed(rng,703177+fixture,61+l);
    fmpz_t exp,one;fmpz_init(exp);fmpz_init(one);fmpz_set_si(exp,-bits);
    fmpz_one(one);fmpz_mul_2exp(one,one,bits);
    for(slong i=0;i<n;i++) {
        if(fixture<2) {
            /* randbits fills the mantissa; randtest alone overweights short values. */
            fmpz_randbits(exact+i,rng,bits-(fixture?16:0));
            if(fixture)fmpz_add(exact+i,exact+i,one);
        } else if(fixture==2) fmpz_set(exact+i,one); /* exact cancellation */
        else if(i==n/3)fmpz_set(exact+i,one); /* one impulse */
        arb_set_fmpz_2exp(in+i,exact+i,exp);
        if(fixture<2)arb_add_error_2exp_si(in+i,-target-l-32);
    }
    exact_wht(expected,exact,n);
    int engines[2]={e0,e1},attempts[2];slong used[2],accuracy[2];
    for(int e=0;e<2;e++)attempts[e]=evaluate(out[e],in,scratch[e],engines[e],l,target,used+e,accuracy+e);
    /* Qualification-only checks, outside all timed batches. */
    for(slong i=0;i<n;i++) {
        arb_t copy;arb_init(copy);arb_set_fmpz_2exp(copy,exact+i,exp);
        if(fixture<2)arb_add_error_2exp_si(copy,-target-l-32);
        assert(arb_equal(copy,in+i));arb_clear(copy);
        if(e0==0&&(e1==1||e1>=4)) assert(arb_equal(out[0]+i,out[1]+i));
    }
    mag_t radii[2],ratio;mag_init(radii[0]);mag_init(radii[1]);mag_init(ratio);
    arb_t oracle;arb_init(oracle);
    for(slong i=0;i<n;i++) {
        arb_set_fmpz_2exp(oracle,expected+i,exp);
        if(fixture<2)arb_add_error_2exp_si(oracle,-target-32);
        for(int e=0;e<2;e++) {
            assert(arb_contains(out[e]+i,oracle));
            mag_add(radii[e],radii[e],arb_radref(out[e]+i));
        }
    }
    if(!mag_is_zero(radii[0]))mag_div(ratio,radii[1],radii[0]);
    if(!measure) {
        printf("{\"status\":\"PASS\",\"outputs_checked\":%ld,\"precision\":[%ld,%ld],\"accuracy\":[%ld,%ld],"
               "\"attempts\":[%d,%d],\"sum_radius_ratio\":%.9g}\n",2*n,used[0],used[1],accuracy[0],accuracy[1],attempts[0],attempts[1],mag_get_d(ratio));
    } else {
        pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
        slong p,a;uint64_t t=ticks(CLOCK_MONOTONIC);
        do {for(int e=0;e<2;e++)evaluate(out[e],in,scratch[e],engines[e],l,target,&p,&a);}
        while(ticks(CLOCK_MONOTONIC)-t<200000000);
        int reps=1;
        for(;;) {
            uint64_t longest=0;
            for(int e=0;e<2;e++) {
                t=ticks(CLOCK_MONOTONIC);
                for(int r=0;r<reps;r++)evaluate(out[e],in,scratch[e],engines[e],l,target,&p,&a);
                longest=FLINT_MAX(longest,ticks(CLOCK_MONOTONIC)-t);
            }
            if(longest>=20000000||reps>=65536)break;reps*=2;
        }
        for(int trial=0;trial<trials;trial++)for(int step=0;step<4;step++) {
            int e=((step==1||step==2)^(trial&1)),tries=0;
            uint64_t wall=ticks(CLOCK_MONOTONIC),cpu=ticks(CLOCK_THREAD_CPUTIME_ID);
            for(int r=0;r<reps;r++)tries=evaluate(out[e],in,scratch[e],engines[e],l,target,&p,&a);
            cpu=ticks(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=ticks(CLOCK_MONOTONIC)-wall;
            assert(p==used[e]&&a==accuracy[e]&&tries==attempts[e]);
            printf("{\"trial\":%d,\"step\":%d,\"engine\":%d,\"reps\":%d,\"ns_per_op\":%.3f,"
                   "\"cpu_ns_per_op\":%.3f,\"precision\":%ld,\"attempts\":%d}\n",trial,step,e,reps,(double)wall/reps,(double)cpu/reps,p,tries);
        }
    }
    arb_clear(oracle);mag_clear(radii[0]);mag_clear(radii[1]);mag_clear(ratio);
    fmpz_clear(exp);fmpz_clear(one);_fmpz_vec_clear(exact,n);_fmpz_vec_clear(expected,n);
    _arb_vec_clear(in,n);for(int e=0;e<2;e++){_arb_vec_clear(out[e],n);_arb_vec_clear(scratch[e],wn_scratch[engines[e]]);}
    flint_rand_clear(rng);flint_cleanup();return 0;
}
