/* Whole public theta evaluations; two resident, isolated FLINT libraries. */
#include <assert.h>
#include <dlfcn.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "acb.h"
#include "acb_mat.h"
#include "acb_theta.h"

typedef void (*jet_fn)(acb_ptr,acb_srcptr,slong,const acb_mat_t,slong,ulong,int,int,slong);
static uint64_t now(clockid_t c) {
    struct timespec t; assert(!clock_gettime(c,&t));
    return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;
}
static void *sym(void *h,const char *s) {void *p=dlsym(h,s);assert(p);return p;}
static void batch(jet_fn fn, acb_ptr out,acb_srcptr z,const acb_mat_t tau,
                  int all,int sqr,slong prec,int reps) {
    for(int i=0;i<reps;i++) fn(out,z,1,tau,0,0,all,sqr,prec);
}
int main(int argc,char **argv) {
    assert(argc==12);
    const char *mode=argv[1];
    void *h0=dlopen(argv[2],RTLD_NOW|RTLD_LOCAL),*h1=dlopen(argv[3],RTLD_NOW|RTLD_LOCAL);
    assert(h0 && h1);
    jet_fn fn[2]={(jet_fn)sym(h0,"acb_theta_jet"),(jet_fn)sym(h1,"acb_theta_jet")};
    slong g=atol(argv[4]),prec=atol(argv[5]);int cst=atoi(argv[6]),sqr=atoi(argv[7]);
    int fixture=atoi(argv[8]),all=atoi(argv[9]),trials=atoi(argv[10]),same=atoi(argv[11]);
    assert(g>=1 && g<=3 && prec>=64 && fixture>=0 && fixture<=1);
    if(same) fn[1]=fn[0];
    slong n=1L<<g,len=all?n*n:1;
    acb_mat_t tau;acb_mat_init(tau,g,g);
    acb_ptr z=_acb_vec_init(g),out=_acb_vec_init(len),ref=_acb_vec_init(len);
    /* Exact dyadic, coupled matrices. Imaginary part strictly diagonally dominant. */
    for(slong i=0;i<g;i++) {
        for(slong j=0;j<g;j++) {
            acb_ptr a=acb_mat_entry(tau,i,j);
            arb_set_si(acb_realref(a),i==j?2+i+fixture:1+fixture);
            arb_mul_2exp_si(acb_realref(a),acb_realref(a),-4);
            arb_set_si(acb_imagref(a),i==j?48+8*i+4*fixture:2+fixture);
            arb_mul_2exp_si(acb_imagref(a),acb_imagref(a),-5);
        }
        if(!cst) {
            arb_set_si(acb_realref(z+i),i+1+fixture);
            arb_mul_2exp_si(acb_realref(z+i),acb_realref(z+i),-4);
            arb_set_si(acb_imagref(z+i),i+1);
            arb_mul_2exp_si(acb_imagref(z+i),acb_imagref(z+i),-5);
        }
    }
    batch(fn[0],ref,z,tau,all,sqr,prec,1);batch(fn[1],out,z,tau,all,sqr,prec,1);
    assert(_acb_vec_is_finite(ref,len) && _acb_vec_is_finite(out,len));
    assert(_acb_vec_overlaps(ref,out,len));
    if(!strcmp(mode,"validate")) {
        /* Independent direct theta-series algorithm at higher precision. */
        acb_theta_ctx_tau_t ctx;acb_theta_ctx_tau_init(ctx,0,g);
        acb_theta_ctx_z_struct *vec=acb_theta_ctx_z_vec_init(1,g);
        acb_ptr oracle=_acb_vec_init(n*n);
        acb_theta_ctx_tau_set(ctx,tau,prec+64);
        acb_theta_ctx_z_set(vec,z,ctx,prec+64);
        acb_theta_sum_jet(oracle,vec,1,ctx,0,1,1,prec+64);
        if(sqr) _acb_vec_sqr(oracle,oracle,n*n,prec+64);
        assert(_acb_vec_is_finite(oracle,n*n));
        assert(_acb_vec_overlaps(out,oracle,len) && _acb_vec_overlaps(ref,oracle,len));
        slong minabs=WORD_MAX;
        for(slong i=0;i<len;i++) {
            slong a=acb_rel_one_accuracy_bits(out+i);if(a<minabs) minabs=a;
        }
        slong base_min=WORD_MAX,wider=0;
        double rbase=0,rcand=0;
        for(slong i=0;i<len;i++) {
            slong bits=acb_rel_one_accuracy_bits(ref+i);if(bits<base_min)base_min=bits;
            double a=mag_get_d(arb_radref(acb_realref(ref+i)))+mag_get_d(arb_radref(acb_imagref(ref+i)));
            double b=mag_get_d(arb_radref(acb_realref(out+i)))+mag_get_d(arb_radref(acb_imagref(out+i)));
            rbase+=a;rcand+=b;wider+=(b>a);
        }
        printf("{\"status\":\"PASS\",\"outputs\":%ld,\"baseline_min_accuracy\":%ld,\"candidate_min_accuracy\":%ld,\"radius_sum_ratio\":%.9g,\"wider_outputs\":%ld}\n",
               len,base_min,minabs,rbase?rcand/rbase:0,wider);
        _acb_vec_clear(oracle,n*n);acb_theta_ctx_z_vec_clear(vec,1);acb_theta_ctx_tau_clear(ctx);
    } else if(!strcmp(mode,"trace")) {
        void (*reset)(void)=(void(*)(void))sym(h1,"bf_trace_reset");
        uint64_t (*calls)(void)=(uint64_t(*)(void))sym(h1,"bf_trace_calls");
        uint64_t (*ns)(void)=(uint64_t(*)(void))sym(h1,"bf_trace_ns");
        reset();uint64_t t=now(CLOCK_THREAD_CPUTIME_ID);
        batch(fn[1],out,z,tau,all,sqr,prec,3);t=now(CLOCK_THREAD_CPUTIME_ID)-t;
        printf("{\"all1_calls_per_evaluation\":%.3f,\"instrumented_kernel_cpu_fraction\":%.9g}\n",(double)calls()/3,(double)ns()/t);
    } else {
        assert(!strcmp(mode,"measure"));pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
        uint64_t t=now(CLOCK_MONOTONIC);
        do {batch(fn[0],ref,z,tau,all,sqr,prec,1);batch(fn[1],out,z,tau,all,sqr,prec,1);}
        while(now(CLOCK_MONOTONIC)-t<20000000);
        int reps=1;
        for(;;) {
            uint64_t a[2];for(int e=0;e<2;e++) {
                t=now(CLOCK_MONOTONIC);batch(fn[e],out,z,tau,all,sqr,prec,reps);a[e]=now(CLOCK_MONOTONIC)-t;
            }
            if((a[0]>a[1]?a[0]:a[1])>=5000000 || reps>=65536)break;reps*=2;
        }
        for(int trial=0;trial<trials;trial++) for(int step=0;step<4;step++) {
            int e=((step==1 || step==2)^(trial&1));
            uint64_t wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID);
            batch(fn[e],out,z,tau,all,sqr,prec,reps);
            cpu=now(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=now(CLOCK_MONOTONIC)-wall;
            assert(_acb_vec_overlaps(ref,out,len));
            printf("{\"trial\":%d,\"step\":%d,\"engine\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f}\n",
                   trial,step,e,reps,(double)wall/reps,(double)cpu/reps);
        }
    }
    _acb_vec_clear(z,g);_acb_vec_clear(out,len);_acb_vec_clear(ref,len);acb_mat_clear(tau);
    ((void(*)(void))sym(h1,"flint_cleanup"))();flint_cleanup();return 0;
}
