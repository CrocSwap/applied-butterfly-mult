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
static slong points;
static slong achieved, used;
static int attempts;
static uint64_t now(clockid_t c) {
    struct timespec t; assert(!clock_gettime(c,&t));
    return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;
}
static void *sym(void *h,const char *s) {void *p=dlsym(h,s);assert(p);return p;}
static void batch(jet_fn fn, acb_ptr out,acb_srcptr z,const acb_mat_t tau,
                  int all,int sqr,slong prec,int reps) {
    slong len=points*(all?(1L<<(2*acb_mat_nrows(tau))):1);
    for(int i=0;i<reps;i++) {
        attempts=0;
        for(used=prec;used<=prec+256;used+=64) {
            fn(out,z,points,tau,0,0,all,sqr,used);attempts++;
            achieved=WORD_MAX;
            for(slong j=0;j<len;j++) achieved=FLINT_MIN(achieved,acb_rel_one_accuracy_bits(out+j));
            if(_acb_vec_is_finite(out,len) && achieved>=prec-32)break;
        }
        assert(used<=prec+256);
    }
}
int main(int argc,char **argv) {
    assert(argc==14);
    points=atol(argv[12]);assert(points>=1 && points<=16);
    const char *mode=argv[1];
    void *h0=dlopen(argv[2],RTLD_NOW|RTLD_LOCAL),*h1=dlopen(argv[3],RTLD_NOW|RTLD_LOCAL);
    assert(h0 && h1);
    jet_fn fn[2]={(jet_fn)sym(h0,"acb_theta_jet"),(jet_fn)sym(h1,"acb_theta_jet")};
    slong g=atol(argv[4]),prec=atol(argv[5]);int cst=atoi(argv[6]),sqr=atoi(argv[7]);
    int fixture=atoi(argv[8]),all=atoi(argv[9]),trials=atoi(argv[10]),same=atoi(argv[11]);
    assert(g>=1 && g<=6 && prec>=64 && fixture>=0 && fixture<=1);
    if(same) fn[1]=fn[0];
    slong n=1L<<g,len=points*(all?n*n:1);
    acb_mat_t tau;acb_mat_init(tau,g,g);
    acb_ptr z=_acb_vec_init(points*g),out=_acb_vec_init(len),ref=_acb_vec_init(len);
    /* Exact dyadic, coupled matrices. Imaginary part strictly diagonally dominant. */
    for(slong i=0;i<g;i++) {
        for(slong j=0;j<g;j++) {
            acb_ptr a=acb_mat_entry(tau,i,j);
            arb_set_si(acb_realref(a),i==j?2+i+fixture:1+fixture);
            arb_mul_2exp_si(acb_realref(a),acb_realref(a),-4);
            arb_set_si(acb_imagref(a),i==j?48+8*i+4*fixture:2+fixture);
            arb_mul_2exp_si(acb_imagref(a),acb_imagref(a),-5);
        }
    }
    for(slong j=0;j<points;j++) for(slong i=0;i<g;i++) {
        if(!cst || j) {
            arb_set_si(acb_realref(z+j*g+i),(i+1+fixture+3*j)%13+1);
            arb_mul_2exp_si(acb_realref(z+j*g+i),acb_realref(z+j*g+i),-5);
            arb_set_si(acb_imagref(z+j*g+i),(i+1+2*j)%7+1);
            arb_mul_2exp_si(acb_imagref(z+j*g+i),acb_imagref(z+j*g+i),-6);
        }
    }
    batch(fn[0],ref,z,tau,all,sqr,prec,1);
    slong used0=used;int attempts0=attempts;
    batch(fn[1],out,z,tau,all,sqr,prec,1);
    slong used1=used;int attempts1=attempts;
    assert(_acb_vec_is_finite(ref,len) && _acb_vec_is_finite(out,len));
    assert(_acb_vec_overlaps(ref,out,len));
    if(!strcmp(mode,"validate")) {
        /* Independent direct theta-series algorithm at higher precision. */
        acb_theta_ctx_tau_t ctx;acb_theta_ctx_tau_init(ctx,1,g);
        acb_theta_ctx_z_struct *vec=acb_theta_ctx_z_vec_init(points,g);
        acb_ptr oracle=_acb_vec_init(points*n*n);
        FILE *cache=fopen(argv[13],"r");
        if(cache) {
            slong cg,cp,cf,ca,cs,cc,cn;
            assert(fscanf(cache,"%ld %ld %ld %ld %ld %ld %ld",&cg,&cp,&cf,&ca,&cs,&cc,&cn)==7);
            assert(cg==g&&cp==prec&&cf==fixture&&ca==all&&cs==sqr&&cc==cst&&cn==points);
            for(slong i=0;i<len;i++) {
                assert(!arb_load_file(acb_realref(oracle+i),cache));
                assert(!arb_load_file(acb_imagref(oracle+i),cache));
            }
            fclose(cache);
        } else {
            acb_theta_ctx_tau_set(ctx,tau,prec+64);
            for(slong j=0;j<points;j++) acb_theta_ctx_z_set(vec+j,z+j*g,ctx,prec+64);
            arb_ptr distances=_arb_vec_init(n);
            acb_theta_sum(oracle,vec,points,ctx,distances,1,1,0,prec+64);
            _arb_vec_clear(distances,n);
            if(sqr) _acb_vec_sqr(oracle,oracle,points*n*n,prec+64);
            if(!all) for(slong j=0;j<points;j++) acb_set(oracle+j,oracle+j*n*n);
            cache=fopen(argv[13],"wx");assert(cache);
            fprintf(cache,"%ld %ld %d %d %d %d %ld\n",g,prec,fixture,all,sqr,cst,points);
            for(slong i=0;i<len;i++) {
                assert(!arb_dump_file(cache,acb_realref(oracle+i)));fputc('\n',cache);
                assert(!arb_dump_file(cache,acb_imagref(oracle+i)));fputc('\n',cache);
            }
            fclose(cache);
        }
        assert(_acb_vec_is_finite(oracle,len));
        for(slong i=0;i<len;i++)assert(acb_rel_one_accuracy_bits(oracle+i)>=prec-32);
        assert(_acb_vec_overlaps(out,oracle,len) && _acb_vec_overlaps(ref,oracle,len));
        slong min0=WORD_MAX,min1=WORD_MAX;mag_t rad0,rad1,r0,r1,ratio;mag_init(rad0);mag_init(rad1);mag_init(r0);mag_init(r1);mag_init(ratio);slong wider=0;
        for(slong i=0;i<len;i++) {
            min0=FLINT_MIN(min0,acb_rel_one_accuracy_bits(ref+i));
            min1=FLINT_MIN(min1,acb_rel_one_accuracy_bits(out+i));
            mag_add(r0,arb_radref(acb_realref(ref+i)),arb_radref(acb_imagref(ref+i)));
            mag_add(r1,arb_radref(acb_realref(out+i)),arb_radref(acb_imagref(out+i)));
            mag_add(rad0,rad0,r0);mag_add(rad1,rad1,r1);wider+=mag_cmp(r1,r0)>0;
        }
        if(!mag_is_zero(rad0))mag_div(ratio,rad1,rad0);
        printf("{\"status\":\"PASS\",\"outputs\":%ld,\"minimum_accuracy_baseline\":%ld,\"minimum_accuracy_candidate\":%ld,\"radius_sum_ratio\":%.9g,\"wider_outputs\":%ld,\"working_precision\":[%ld,%ld],\"attempts\":[%d,%d]}\n",len,min0,min1,mag_get_d(ratio),wider,used0,used1,attempts0,attempts1);
        mag_clear(rad0);mag_clear(rad1);mag_clear(r0);mag_clear(r1);mag_clear(ratio);
        _acb_vec_clear(oracle,points*n*n);acb_theta_ctx_z_vec_clear(vec,points);acb_theta_ctx_tau_clear(ctx);
    } else if(!strcmp(mode,"trace")) {
        void (*reset)(void)=(void(*)(void))sym(h1,"tn_trace_reset");
        uint64_t (*get)(int)=(uint64_t(*)(int))sym(h1,"tn_trace_get");
        reset();uint64_t t=now(CLOCK_THREAD_CPUTIME_ID);
        batch(fn[1],out,z,tau,all,sqr,prec,3);t=now(CLOCK_THREAD_CPUTIME_ID)-t;
        printf("{\"evaluations\":3,\"total_ns\":%" PRIu64 ",\"counters\":[",t);
        for(int i=0;i<24;i++)printf("%s%" PRIu64,i?",":"",get(i));
        printf("]}\n");
    } else {
        assert(!strcmp(mode,"measure"));pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
        uint64_t t=now(CLOCK_MONOTONIC);
        do {batch(fn[0],ref,z,tau,all,sqr,prec,1);
    slong used0=used;int attempts0=attempts;
    batch(fn[1],out,z,tau,all,sqr,prec,1);
    slong used1=used;int attempts1=attempts;}
        while(now(CLOCK_MONOTONIC)-t<200000000);
        int reps=1;
        for(;;) {
            uint64_t a[2];for(int e=0;e<2;e++) {
                t=now(CLOCK_MONOTONIC);batch(fn[e],out,z,tau,all,sqr,prec,reps);a[e]=now(CLOCK_MONOTONIC)-t;
            }
            if((a[0]>a[1]?a[0]:a[1])>=20000000 || reps>=65536)break;reps*=2;
        }
        for(int trial=0;trial<trials;trial++) for(int step=0;step<4;step++) {
            int e=((step==1 || step==2)^(trial&1));
            uint64_t wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID);
            batch(fn[e],out,z,tau,all,sqr,prec,reps);
            cpu=now(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=now(CLOCK_MONOTONIC)-wall;
            assert(_acb_vec_overlaps(ref,out,len));
            printf("{\"trial\":%d,\"step\":%d,\"engine\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f,\"working_precision\":%ld,\"attempts\":%d,\"accuracy\":%ld}\n",
                   trial,step,e,reps,(double)wall/reps,(double)cpu/reps,used,attempts,achieved);
        }
    }
    _acb_vec_clear(z,points*g);_acb_vec_clear(out,len);_acb_vec_clear(ref,len);acb_mat_clear(tau);
    ((void(*)(void))sym(h1,"flint_cleanup"))();flint_cleanup();return 0;
}
