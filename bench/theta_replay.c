/* Replay captured theta WHT inputs. Capture/loading/validation are never timed. */
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <pthread.h>
#include "theta_nonrigidity_kernel.h"
typedef struct {slong kind,g,p,n; acb_ptr x;} record;
static record *records;
static slong count,maxn;
static uint64_t now(clockid_t c) {struct timespec t;assert(!clock_gettime(c,&t));return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
/* A common reusable output buffer is held outside timing in both modes.
   Mode 0: allocate scratch per transform. Mode 1: per captured call sequence.
   Sequence allocation and destruction ARE timed. No cross-call scratch reuse. */
static void sequence(int e,int mode,acb_ptr y) {
    acb_ptr shared=mode?_acb_vec_init(tn_scratch[e]):NULL;
    for(slong i=0;i<count;i++) {
        record *r=records+i;
        acb_ptr s=mode?shared:_acb_vec_init(tn_scratch[e]);
        tn_functions[e](y,r->x,r->g,r->p,s);
        if(!mode)_acb_vec_clear(s,tn_scratch[e]);
    }
    if(mode)_acb_vec_clear(shared,tn_scratch[e]);
}
/* Independent exact signed sum and exact sum of input radii, componentwise.
   Checks containment of the entire independent input box, not just overlap. */
static slong validate(void) {
    arf_t center,radius,tmp,delta,actual;
    arf_init(center);arf_init(radius);arf_init(tmp);arf_init(delta);arf_init(actual);
    acb_ptr y=_acb_vec_init(maxn);slong checks=0;
    for(int e=0;e<4;e++) {
        acb_ptr s=_acb_vec_init(tn_scratch[e]);
        for(slong i=0;i<count;i++) {
            record *r=records+i;tn_functions[e](y,r->x,r->g,r->p,s);
            assert(_acb_vec_is_finite(y,r->n));
            for(slong a=0;a<r->n;a++) for(int part=0;part<2;part++) {
                arf_zero(center);arf_zero(radius);
                for(slong b=0;b<r->n;b++) {
                    arb_srcptr v=part?acb_imagref(r->x+b):acb_realref(r->x+b);
                    arf_set(tmp,arb_midref(v));
                    if(__builtin_parityll((unsigned long long)(a&b)))arf_neg(tmp,tmp);
                    arf_add(center,center,tmp,ARF_PREC_EXACT,ARF_RND_NEAR);
                    arf_set_mag(tmp,arb_radref(v));
                    arf_add(radius,radius,tmp,ARF_PREC_EXACT,ARF_RND_NEAR);
                }
                arb_srcptr v=part?acb_imagref(y+a):acb_realref(y+a);
                arf_sub(delta,center,arb_midref(v),ARF_PREC_EXACT,ARF_RND_NEAR);
                arf_abs(delta,delta);arf_add(delta,delta,radius,ARF_PREC_EXACT,ARF_RND_NEAR);
                arf_set_mag(actual,arb_radref(v));assert(arf_cmp(delta,actual)<=0);checks++;
            }
        }
        _acb_vec_clear(s,tn_scratch[e]);
    }
    _acb_vec_clear(y,maxn);arf_clear(center);arf_clear(radius);arf_clear(tmp);arf_clear(delta);arf_clear(actual);
    return checks;
}
int main(int argc,char **argv) {
    assert(argc==3||argc==8);FILE *f=fopen(argv[2],"r");assert(f);
    slong capacity=128;records=calloc(capacity,sizeof(record));assert(records);
    for(;;) {
        if(count==capacity){capacity*=2;records=realloc(records,capacity*sizeof(record));assert(records);}
        record *r=records+count;int got=fscanf(f,"%ld %ld %ld",&r->kind,&r->g,&r->p);
        if(got==EOF)break;assert(got==3&&r->g>=0&&r->g<=6&&r->p>0);
        r->n=1L<<r->g;maxn=FLINT_MAX(maxn,r->n);r->x=_acb_vec_init(r->n);
        for(slong j=0;j<r->n;j++){assert(!arb_load_file(acb_realref(r->x+j),f));assert(!arb_load_file(acb_imagref(r->x+j),f));}
        assert(_acb_vec_is_finite(r->x,r->n));count++;
    }
    fclose(f);assert(count);
    if(!strcmp(argv[1],"validate")) {
        slong zeroim=0,nonzero_radius=0,values=0,sites[2]={0},sizes[7]={0},minp=WORD_MAX,maxp=0;
        for(slong i=0;i<count;i++) {
            record *r=records+i;assert(r->kind<2);sites[r->kind]++;sizes[r->g]++;
            minp=FLINT_MIN(minp,r->p);maxp=FLINT_MAX(maxp,r->p);
            for(slong j=0;j<r->n;j++){values++;zeroim+=arb_is_zero(acb_imagref(r->x+j));nonzero_radius+=!acb_is_exact(r->x+j);}
        }
        printf("{\"status\":\"PASS\",\"component_box_checks\":%ld,\"transforms\":%ld,\"values\":%ld,\"zero_imaginary\":%ld,\"inexact_values\":%ld,\"precision_range\":[%ld,%ld],\"sites\":[%ld,%ld],\"log_sizes\":[",validate(),count,values,zeroim,nonzero_radius,minp,maxp,sites[0],sites[1]);
        for(int i=0;i<7;i++)printf("%s%ld",i?",":"",sizes[i]);printf("]}\n");
    } else {
        assert(argc==8&&!strcmp(argv[1],"measure"));
        int engines[2]={atoi(argv[3]),atoi(argv[5])},modes[2]={atoi(argv[4]),atoi(argv[6])},trials=atoi(argv[7]);
        for(int i=0;i<2;i++)assert(engines[i]>=0&&engines[i]<4&&modes[i]>=0&&modes[i]<2);
        pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
        acb_ptr y[2]={_acb_vec_init(maxn),_acb_vec_init(maxn)};
        uint64_t t=now(CLOCK_MONOTONIC);
        do{for(int e=0;e<2;e++)sequence(engines[e],modes[e],y[e]);}while(now(CLOCK_MONOTONIC)-t<200000000);
        int reps=1;
        for(;;){uint64_t longest=0;for(int e=0;e<2;e++) {
            t=now(CLOCK_MONOTONIC);for(int k=0;k<reps;k++)sequence(engines[e],modes[e],y[e]);
            longest=FLINT_MAX(longest,now(CLOCK_MONOTONIC)-t);
        }if(longest>=10000000||reps>=65536)break;reps*=2;}
        for(int trial=0;trial<trials;trial++)for(int step=0;step<4;step++) {
            int e=((step==1||step==2)^(trial&1));
            uint64_t w=now(CLOCK_MONOTONIC),c=now(CLOCK_THREAD_CPUTIME_ID);
            for(int k=0;k<reps;k++)sequence(engines[e],modes[e],y[e]);
            c=now(CLOCK_THREAD_CPUTIME_ID)-c;w=now(CLOCK_MONOTONIC)-w;
            printf("{\"trial\":%d,\"step\":%d,\"engine\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f}\n",trial,step,e,reps,(double)w/reps,(double)c/reps);
        }
        for(int i=0;i<2;i++)_acb_vec_clear(y[i],maxn);
    }
    for(slong i=0;i<count;i++)_acb_vec_clear(records[i].x,records[i].n);
    free(records);flint_cleanup();return 0;
}
