/* Reuse the survey's deterministic inputs and independent KS reference. */
#define main survey_unused_main
#include "poly_survey.c"
#undef main

typedef struct {
    void (*full)(nmod_poly_mat_t,const nmod_poly_mat_t,const nmod_poly_mat_t);
    int (*mid)(nmod_poly_mat_t,const nmod_poly_mat_t,const nmod_poly_mat_t,slong,slong);
    void (*scalar)(nmod_poly_t,const nmod_poly_t,const nmod_poly_t);
    void (*scalar_mid)(nmod_poly_t,const nmod_poly_t,const nmod_poly_t,slong,slong);
} engine;
static void *sym(void *h,const char *name) {
    void *p=dlsym(h,name);if(!p){fprintf(stderr,"%s\n",dlerror());abort();}return p;
}
static int call(engine *e,nmod_poly_mat_t C,nmod_poly_mat_t A,nmod_poly_mat_t B,int mid,slong lo,slong hi) {
    if(A->r==1) {
        if(mid)e->scalar_mid(nmod_poly_mat_entry(C,0,0),nmod_poly_mat_entry(A,0,0),nmod_poly_mat_entry(B,0,0),lo,hi);
        else e->scalar(nmod_poly_mat_entry(C,0,0),nmod_poly_mat_entry(A,0,0),nmod_poly_mat_entry(B,0,0));
        return 1;
    }
    if(mid)return e->mid(C,A,B,lo,hi);
    e->full(C,A,B);return 1;
}
static void batch(engine *e,nmod_poly_mat_t C,nmod_poly_mat_t A,nmod_poly_mat_t B,int mid,slong lo,slong hi,ulong reps,double *wall,double *cpu) {
    double c=now(CLOCK_THREAD_CPUTIME_ID),w=now(CLOCK_MONOTONIC);
    for(ulong r=0;r<reps;r++)if(!call(e,C,A,B,mid,lo,hi))abort();
    *wall=now(CLOCK_MONOTONIC)-w;*cpu=now(CLOCK_THREAD_CPUTIME_ID)-c;
}
int main(int argc,char **argv) {
    if(argc!=9)return 2;
    slong d=strtol(argv[3],NULL,10),len=strtol(argv[4],NULL,10),trials=strtol(argv[7],NULL,10);
    ulong p=strtoul(argv[5],NULL,10),ms=strtoul(argv[8],NULL,10);int mid=!strcmp(argv[6],"mid");
    if(d<1 || d>16 || len<2 || len>8192 || p<2 || trials<8 || !ms)return 2;
    if(pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0))abort();
    engine engines[2];
    for(int e=0;e<2;e++) {
        void *h=dlopen(argv[1+e],RTLD_NOW|RTLD_LOCAL);if(!h){fprintf(stderr,"%s\n",dlerror());return 1;}
        engines[e].full=sym(h,"nmod_poly_mat_mul");engines[e].mid=sym(h,"nmod_poly_mat_mulmid_fft_small");
        engines[e].scalar=sym(h,"nmod_poly_mul");engines[e].scalar_mid=sym(h,"nmod_poly_mulmid");
        void (*threads)(int)=sym(h,"flint_set_num_threads");threads(1);
        Dl_info info;if(!dladdr((void *)engines[e].mid,&info))abort();
        printf("{\"phase\":\"binding\",\"engine\":%d,\"image\":\"%s\"}\n",e,info.dli_fname);
    }
    nmod_poly_mat_t A,B,C[2],R;
    nmod_poly_mat_init(A,d,d,p);nmod_poly_mat_init(B,d,d,p);nmod_poly_mat_init(R,d,d,p);
    for(int e=0;e<2;e++)nmod_poly_mat_init(C[e],d,d,p);
    slong lo=mid?len/2:0,hi=mid?3*len/2:2*len-1;
    for(int pattern=0;pattern<3;pattern++) {
        fill(A,len,p,pattern);fill(B,len,p,pattern);reference(R,A,B,mid,lo,hi);
        for(int e=0;e<2;e++) {
            if(!call(&engines[e],C[e],A,B,mid,lo,hi)) {
                prefix(d,len,p,mid);printf(",\"phase\":\"unsupported\",\"engine\":%d}\n",e);return 0;
            }
            if(!nmod_poly_mat_equal(C[e],R)){fprintf(stderr,"mismatch engine %d pattern %d\n",e,pattern);abort();}
        }
    }
    prefix(d,len,p,mid);puts(",\"phase\":\"correctness\",\"comparisons\":6}");
    fill(A,len,p,0);fill(B,len,p,0);
    double wall,cpu,start=now(CLOCK_MONOTONIC);
    do {for(int e=0;e<2;e++)batch(&engines[e],C[e],A,B,mid,lo,hi,1,&wall,&cpu);}
    while(now(CLOCK_MONOTONIC)-start<1e8);
    ulong reps=1;
    while(1) {batch(&engines[0],C[0],A,B,mid,lo,hi,reps,&wall,&cpu);if(wall>=ms*1e6 || reps>=(1UL<<24))break;reps*=2;}
    for(slong t=0;t<trials;t++)for(int pos=0;pos<4;pos++) {
        int e=(t%2)^(pos==1 || pos==2);
        batch(&engines[e],C[e],A,B,mid,lo,hi,reps,&wall,&cpu);
        prefix(d,len,p,mid);
        printf(",\"phase\":\"warm\",\"trial\":%ld,\"position\":%d,\"engine\":%d,\"iterations\":%lu,\"ns_per_op\":%.9f,\"cpu_ns_per_op\":%.9f}\n",t,pos,e,reps,wall/reps,cpu/reps);
    }
    for(int e=0;e<2;e++)nmod_poly_mat_clear(C[e]);
    nmod_poly_mat_clear(A);nmod_poly_mat_clear(B);nmod_poly_mat_clear(R);return 0;
}
