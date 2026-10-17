/* Complete acb_theta_agm_mul-call controls; finite ball arithmetic throughout. */
#include <assert.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "acb.h"
#include "acb_theta.h"

typedef void (*method)(acb_ptr,acb_srcptr,acb_srcptr,slong,int,slong);
void bf_theta_original(acb_ptr,acb_srcptr,acb_srcptr,slong,int,slong);
void bf_theta_shared(acb_ptr,acb_srcptr,acb_srcptr,slong,int,slong);
void bf_theta_direct(acb_ptr,acb_srcptr,acb_srcptr,slong,int,slong);
static method methods[]={acb_theta_agm_mul,bf_theta_original,bf_theta_shared,bf_theta_direct};
static volatile slong checksum;

static uint64_t now(clockid_t clock) {
    struct timespec t; assert(clock_gettime(clock,&t)==0);
    return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;
}

static void fill(acb_ptr x,slong n,slong prec,flint_rand_t state,int pattern) {
    fmpz_t z; fmpz_init(z);
    for (slong i=0;i<n;i++) {
        for (int part=0;part<2;part++) {
            fmpz_randbits(z,state,prec);
            arb_set_fmpz(part?acb_imagref(x+i):acb_realref(x+i),z);
        }
        acb_mul_2exp_si(x+i,x+i,-prec);
        if (pattern==1) {
            arb_add_error_2exp_si(acb_realref(x+i),-prec-8);
            arb_add_error_2exp_si(acb_imagref(x+i),-prec-8);
        }
        if (pattern==2 && i%3) acb_zero(x+i);
        if (pattern==3) acb_set_si(x+i,i%2?-1:1);
    }
    fmpz_clear(z);
}

/* Independent direct sum, at enough precision for exact dyadic test inputs. */
static void oracle(acb_ptr out,acb_srcptr x,acb_srcptr y,slong g,int all,slong prec) {
    slong n=1L<<g; acb_t t; acb_init(t);
    for (slong k=0;k<n;k++) for(slong a=0;a<(all?n:1);a++) {
        acb_ptr z=out+(all?k*n+a:k);acb_zero(z);
        for(slong b=0;b<n;b++) {
            acb_mul(t,x+(b^k),y+b,prec);
            if(__builtin_parityll((unsigned long long)(a&b))) acb_sub(z,z,t,prec);
            else acb_add(z,z,t,prec);
        }
    }
    acb_clear(t);
}

static void validate(void) {
    flint_rand_t state;flint_rand_init(state);flint_rand_set_seed(state,739019,950029);
    slong cases=0,checks=0,containment=0;
    for(slong g=0;g<=5;g++) for(slong pi=0;pi<3;pi++)
    for(int sq=0;sq<2;sq++) for(int all=0;all<2;all++) for(int pattern=0;pattern<4;pattern++) {
        slong prec=(slong[]){64,128,512}[pi],n=1L<<g,len=all?n*n:n;
        acb_ptr x=_acb_vec_init(n),y=_acb_vec_init(n),ref=_acb_vec_init(len);
        acb_ptr original=_acb_vec_init(len),out=_acb_vec_init(len);
        fill(x,n,prec,state,pattern);fill(y,n,prec,state,pattern);
        acb_srcptr rhs=sq?x:y;
        oracle(ref,x,rhs,g,all,2*prec+g+32);
        methods[0](original,x,rhs,g,all,prec);
        for(int m=0;m<4;m++) {
            methods[m](out,x,rhs,g,all,prec);
            assert(_acb_vec_is_finite(out,len));
            assert(_acb_vec_overlaps(out,ref,len));
            assert(_acb_vec_overlaps(out,original,len));
            for(slong i=0;i<len;i++) {
                checks++;
                if(pattern!=1) { assert(acb_is_exact(ref+i));assert(acb_contains(out+i,ref+i));containment++; }
            }
        }
        cases++;
        _acb_vec_clear(x,n);_acb_vec_clear(y,n);_acb_vec_clear(ref,len);
        _acb_vec_clear(original,len);_acb_vec_clear(out,len);
    }
    flint_rand_clear(state);
    printf("{\"status\":\"PASS\",\"cases\":%ld,\"coefficient_checks\":%ld,\"exact_containment_checks\":%ld}\n",cases,checks,containment);
}

static void batch(int engine,acb_ptr out,acb_srcptr x,acb_srcptr y,
                  slong g,int all,slong prec,int reps) {
    for(int i=0;i<reps;i++) methods[engine](out,x,y,g,all,prec);
    checksum^=acb_rel_accuracy_bits(out);
}

int main(int argc,char **argv) {
    if(argc==2 && !strcmp(argv[1],"validate")) {validate();flint_cleanup();return 0;}
    assert(argc==9);
    slong g=atol(argv[1]),prec=atol(argv[2]);int sq=atoi(argv[3]);
    int base=atoi(argv[4]),candidate=atoi(argv[5]),trials=atoi(argv[6]);
    ulong seed=strtoul(argv[7],NULL,10);int all=atoi(argv[8]);
    assert(g>=0 && g<=8 && prec>=64 && base>=0 && base<4 && candidate>=0 && candidate<4 && trials>=1);
    slong n=1L<<g,len=all?n*n:n;
    acb_ptr x=_acb_vec_init(n),y=_acb_vec_init(n),out=_acb_vec_init(len),ref=_acb_vec_init(len);
    flint_rand_t state;flint_rand_init(state);flint_rand_set_seed(state,seed,seed+1009);
    fill(x,n,prec,state,1);fill(y,n,prec,state,1);acb_srcptr rhs=sq?x:y;
    methods[base](ref,x,rhs,g,all,prec);methods[candidate](out,x,rhs,g,all,prec);
    assert(_acb_vec_overlaps(ref,out,len) && _acb_vec_is_finite(out,len));
    double radius_base=0,radius_candidate=0;slong wider=0;
    for(slong i=0;i<len;i++) {
        double a=mag_get_d(arb_radref(acb_realref(ref+i)))+mag_get_d(arb_radref(acb_imagref(ref+i)));
        double b=mag_get_d(arb_radref(acb_realref(out+i)))+mag_get_d(arb_radref(acb_imagref(out+i)));
        radius_base+=a;radius_candidate+=b;wider+=(b>a);
    }
    printf("{\"kind\":\"accuracy\",\"radius_sum_ratio\":%.9g,\"wider_outputs\":%ld,\"outputs\":%ld}\n",
           radius_base?radius_candidate/radius_base:0,wider,len);
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
    uint64_t start=now(CLOCK_MONOTONIC);
    do { batch(base,out,x,rhs,g,all,prec,1);batch(candidate,out,x,rhs,g,all,prec,1); }
    while(now(CLOCK_MONOTONIC)-start<20000000);
    int reps=1;
    for(;;) {
        start=now(CLOCK_MONOTONIC);batch(base,out,x,rhs,g,all,prec,reps);
        uint64_t a=now(CLOCK_MONOTONIC)-start;
        start=now(CLOCK_MONOTONIC);batch(candidate,out,x,rhs,g,all,prec,reps);
        uint64_t b=now(CLOCK_MONOTONIC)-start;
        if((a>b?a:b)>=5000000 || reps>=65536) break;
        reps*=2;
    }
    for(int trial=0;trial<trials;trial++) for(int step=0;step<4;step++) {
        int engine=((step==1 || step==2)^(trial&1));
        uint64_t wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID);
        batch(engine?candidate:base,out,x,rhs,g,all,prec,reps);
        cpu=now(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=now(CLOCK_MONOTONIC)-wall;
        assert(_acb_vec_overlaps(out,ref,len));
        printf("{\"trial\":%d,\"step\":%d,\"engine\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f}\n",
               trial,step,engine,reps,(double)wall/reps,(double)cpu/reps);
    }
    _acb_vec_clear(x,n);_acb_vec_clear(y,n);_acb_vec_clear(out,len);_acb_vec_clear(ref,len);
    flint_rand_clear(state);flint_cleanup();return 0;
}
