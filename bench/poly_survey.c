#define _DARWIN_C_SOURCE
#define _POSIX_C_SOURCE 200809L
#include <dlfcn.h>
#include <pthread.h>
#include <pthread/qos.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "nmod_poly.h"
#include "nmod_poly_mat.h"

static ulong state=0x49a1703bc29e8361UL;
static ulong rnd(void) { state^=state<<13;state^=state>>7;state^=state<<17;return state; }
static double now(clockid_t clock) {
    struct timespec t; if(clock_gettime(clock,&t))abort(); return 1e9*t.tv_sec+t.tv_nsec;
}
static void fill(nmod_poly_mat_t A,slong len,ulong mod,int pattern) {
    for(slong i=0;i<A->r;i++) for(slong j=0;j<A->c;j++) {
        nmod_poly_struct *p=nmod_poly_mat_entry(A,i,j);
        nmod_poly_zero(p);
        for(slong k=0;k<len;k++) {
            ulong v=pattern==1?mod-1:pattern==2?(k==0 || k==len-1):rnd()%mod;
            if(k==len-1 && !v)v=1;
            nmod_poly_set_coeff_ui(p,k,v);
        }
    }
}
static int operation(nmod_poly_mat_t C,const nmod_poly_mat_t A,const nmod_poly_mat_t B,
                     int middle,slong lo,slong hi) {
    if(A->r==1) {
        if(middle)nmod_poly_mulmid(nmod_poly_mat_entry(C,0,0),nmod_poly_mat_entry(A,0,0),nmod_poly_mat_entry(B,0,0),lo,hi);
        else nmod_poly_mul(nmod_poly_mat_entry(C,0,0),nmod_poly_mat_entry(A,0,0),nmod_poly_mat_entry(B,0,0));
        return 1;
    }
    if(middle)return nmod_poly_mat_mulmid_fft_small(C,A,B,lo,hi);
    nmod_poly_mat_mul(C,A,B);return 1;
}
static void reference(nmod_poly_mat_t R,const nmod_poly_mat_t A,const nmod_poly_mat_t B,
                      int middle,slong lo,slong hi) {
    nmod_poly_t t;nmod_poly_init(t,nmod_poly_mat_modulus(A));
    nmod_poly_mat_zero(R);
    for(slong i=0;i<A->r;i++) for(slong j=0;j<B->c;j++) {
        nmod_poly_struct *r=nmod_poly_mat_entry(R,i,j);
        for(slong k=0;k<A->c;k++) {
            nmod_poly_mul_KS(t,nmod_poly_mat_entry(A,i,k),nmod_poly_mat_entry(B,k,j));
            nmod_poly_add(r,r,t);
        }
        if(middle) { nmod_poly_shift_right(r,r,lo);nmod_poly_truncate(r,hi-lo); }
    }
    nmod_poly_clear(t);
}
static void prefix(slong dim,slong len,ulong p,int middle) {
    printf("{\"dim\":%ld,\"length\":%ld,\"modulus\":%lu,\"window\":\"%s\"",dim,len,p,middle?"middle":"full");
}
int main(int argc,char **argv) {
    if(argc!=7)return 2;
    slong dim=strtol(argv[1],NULL,10),len=strtol(argv[2],NULL,10),samples=strtol(argv[5],NULL,10);
    ulong mod=strtoul(argv[3],NULL,10),ms=strtoul(argv[6],NULL,10);
    int middle=!strcmp(argv[4],"mid");
    if(dim<1 || dim>16 || len<2 || len>8192 || mod<2 || !ms || samples < -1)return 2;
    if(pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0))abort();
    flint_set_num_threads(1);
    ulong *counts=dlsym(RTLD_DEFAULT,"bf_poly_counts");
    ulong *forward=dlsym(RTLD_DEFAULT,"bf_poly_forward_depths");
    ulong *inverse=dlsym(RTLD_DEFAULT,"bf_poly_inverse_depths");
    ulong *plan=dlsym(RTLD_DEFAULT,"bf_poly_plan");
    if((samples==-1)!=!!counts) { fprintf(stderr,"trace mode/library mismatch\n");return 2; }
    slong lo=middle?len/2:0,hi=middle?3*len/2:2*len-1;
    nmod_poly_mat_t A,B,C,R;
    nmod_poly_mat_init(A,dim,dim,mod);nmod_poly_mat_init(B,dim,dim,mod);
    nmod_poly_mat_init(C,dim,dim,mod);nmod_poly_mat_init(R,dim,dim,mod);
    fill(A,len,mod,0);fill(B,len,mod,0);
    double c=now(CLOCK_THREAD_CPUTIME_ID),w=now(CLOCK_MONOTONIC);
    int supported=operation(C,A,B,middle,lo,hi);
    double coldwall=now(CLOCK_MONOTONIC)-w,coldcpu=now(CLOCK_THREAD_CPUTIME_ID)-c;
    if(!supported) { prefix(dim,len,mod,middle);puts(",\"supported\":false}");goto done; }
    for(int pattern=0;pattern<3;pattern++) {
        if(pattern) { fill(A,len,mod,pattern);fill(B,len,mod,pattern);operation(C,A,B,middle,lo,hi); }
        reference(R,A,B,middle,lo,hi);
        if(!nmod_poly_mat_equal(C,R)) { fprintf(stderr,"reference mismatch pattern %d\n",pattern);abort(); }
    }
    fill(A,len,mod,0);fill(B,len,mod,0);operation(C,A,B,middle,lo,hi);
    if(samples==-1) {
        memset(counts,0,16*sizeof(ulong));memset(forward,0,32*sizeof(ulong));
        memset(inverse,0,32*sizeof(ulong));memset(plan,0,8*sizeof(ulong));
        operation(C,A,B,middle,lo,hi);
        prefix(dim,len,mod,middle);printf(",\"supported\":true,\"patterns_passed\":3,\"counts\":[");
        for(int i=0;i<16;i++)printf("%s%lu",i?",":"",counts[i]);
        printf("],\"plan\":[");for(int i=0;i<8;i++)printf("%s%lu",i?",":"",plan[i]);
        printf("],\"forward_depths\":[");for(int i=0;i<32;i++)printf("%s%lu",i?",":"",forward[i]);
        printf("],\"inverse_depths\":[");for(int i=0;i<32;i++)printf("%s%lu",i?",":"",inverse[i]);puts("]}");
        goto done;
    }
    if(samples==0) {
        fputs("PROFILE_READY\n",stderr);fflush(stderr);
        double start=now(CLOCK_MONOTONIC);ulong ops=0;
        do { for(int i=0;i<32;i++)operation(C,A,B,middle,lo,hi);ops+=32; }
        while(now(CLOCK_MONOTONIC)-start<ms*1e6);
        prefix(dim,len,mod,middle);printf(",\"profile_operations\":%lu}\n",ops);goto done;
    }
    prefix(dim,len,mod,middle);
    printf(",\"supported\":true,\"phase\":\"first_call\",\"patterns_passed\":3,\"wall_ns\":%.0f,\"cpu_ns\":%.0f}\n",coldwall,coldcpu);
    ulong reps=1;
    while(1) {
        w=now(CLOCK_MONOTONIC);for(ulong i=0;i<reps;i++)operation(C,A,B,middle,lo,hi);
        if(now(CLOCK_MONOTONIC)-w>=ms*1e6 || reps>=(1UL<<25))break;
        reps*=2;
    }
    for(slong trial=0;trial<samples;trial++) {
        c=now(CLOCK_THREAD_CPUTIME_ID);w=now(CLOCK_MONOTONIC);
        for(ulong i=0;i<reps;i++)operation(C,A,B,middle,lo,hi);
        double wall=now(CLOCK_MONOTONIC)-w,cpu=now(CLOCK_THREAD_CPUTIME_ID)-c;
        prefix(dim,len,mod,middle);
        printf(",\"supported\":true,\"phase\":\"warm\",\"trial\":%ld,\"iterations\":%lu,\"wall_ns\":%.6f,\"cpu_ns\":%.6f}\n",trial,reps,wall/reps,cpu/reps);
    }
done:
    nmod_poly_mat_clear(A);nmod_poly_mat_clear(B);nmod_poly_mat_clear(C);nmod_poly_mat_clear(R);
    flint_cleanup_master();return 0;
}
