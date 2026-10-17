/* Strong conventional control for the exact same optimum/count query.
   Include frozen circuit implementation without modifying earlier evidence. */
#define main previous_main
#include "theory_paths_control.c"
#undef main

typedef struct {
    const V *w;
    int N, ordered, seen[MAXN], bestnext[7][MAXN];
    int64_t bound[7][MAXN];
    V answer;
    uint64_t visits, budget;
    int exhausted;
} Search;

static void search(Search *s, int u, int r, int64_t weight) {
    if (++s->visits > s->budget) { s->exhausted=1; return; }
    int N=s->N;
    if (s->bound[r][u]==NEG || weight+s->bound[r][u]<s->answer.w) return;
    if (r==1) {
        V edge=s->w[u*N+N-1];
        if (edge.c) s->answer=add(s->answer,(V){weight+edge.w,1});
        return;
    }
    /* Try the best relaxed continuation first, then all other candidates.
       The sorted variant orders currently eligible candidates by the bound. */
    int next[MAXN], count=0;
    int preferred=s->bestnext[r][u];
    for (int pos=0; pos<N-1; pos++) {
        int v=pos==0 ? preferred : pos;
        if (v<=0 || v>=N-1 || (pos!=0 && v==preferred) || s->seen[v]) continue;
        V edge=s->w[u*N+v];
        if (!edge.c || s->bound[r-1][v]==NEG || weight+edge.w+s->bound[r-1][v]<s->answer.w) continue;
        int k=count++;
        if (s->ordered) {
            int64_t score=edge.w+s->bound[r-1][v];
            while(k && score>s->w[u*N+next[k-1]].w+s->bound[r-1][next[k-1]]) {
                next[k]=next[k-1]; k--;
            }
        }
        next[k]=v;
    }
    for(int k=0;k<count && !s->exhausted;k++) {
        int v=next[k];
        if (weight+s->w[u*N+v].w+s->bound[r-1][v]<s->answer.w) continue;
        s->seen[v]=1;
        search(s,v,r-1,weight+s->w[u*N+v].w);
        s->seen[v]=0;
    }
}

static V solve_bnb(const V *w,int N,Plan *p,int ordered) {
    Search s;
    s.w=w;s.N=N;s.ordered=ordered;s.answer=zero;s.visits=0;
    s.budget=4*(uint64_t)N*N; s.exhausted=0;
    memset(s.seen,0,N*sizeof(int));s.seen[0]=s.seen[N-1]=1;
    for(int u=0;u<N;u++) {s.bound[0][u]=u==N-1?0:NEG;s.bestnext[0][u]=-1;}
    for(int u=0;u<N;u++) {s.bound[1][u]=w[u*N+N-1].w;s.bestnext[1][u]=N-1;}
    /* Walks may repeat interior vertices: a valid upper bound on simple paths.
       Source and target may not occur internally. Negative weights are safe.
       Strict inequality alone prunes: all optimal ties must still be counted. */
    for(int r=2;r<=6;r++) for(int u=0;u<N;u++) {
        int64_t best=NEG;int successor=-1;
        for(int v=1;v<N-1;v++) if(w[u*N+v].c && s.bound[r-1][v]!=NEG) {
            int64_t z=w[u*N+v].w+s.bound[r-1][v];
            if(z>best) {best=z;successor=v;}
        }
        s.bound[r][u]=best;s.bestnext[r][u]=successor;
    }
    search(&s,0,6,0);
    hard_stats=(HardStats){s.visits,s.exhausted};
    if(s.exhausted) return solve(w,N,p,1); /* Exact fallback; all setup charged. */
    return s.answer;
}

static V batch_bnb(const V *w,int N,Plan *p,int engine,int reps) {
    V v=zero;
    for(int i=0;i<reps;i++) {
        v=engine ? solve_bnb(w,N,p,engine==2) : solve(w,N,p,0);
        checksum^=v.c+(uint64_t)v.w;
    }
    return v;
}

int hard_frozen_main(int argc,char **argv) {
    assert(argc==7);
    const char *seed=getenv("BF_PATH_SEED"); if(seed) rng=strtoull(seed,NULL,10);
    assert(rng!=0);
    Plan base=load(argv[1]),candidate=load(argv[2]);assert(base.n==candidate.n);
    int kind=atoi(argv[3]),method=atoi(argv[4]),trials=atoi(argv[5]),ms=atoi(argv[6]);
    int N=base.n+3;assert(N<=67 && kind>=0 && kind<=4 && (method==1 || method==2) && ms>0 && trials>=1);
    V *w=malloc(N*N*sizeof(V));assert(w);
    for(int a=0;a<N;a++) for(int b=0;b<N;b++) {
        int64_t weight=kind==0?0:kind==1?(int64_t)(rand64()%2001)-1000:(int64_t)(rand64()%5)-2;
        w[a*N+b]=(a==b || kind==4 || (kind==3 && rand64()%3))?zero:(V){weight,1};
    }
    V exact=solve(w,N,&candidate,0),other=solve_bnb(w,N,&base,method==2);
    V third=solve(w,N,&base,1);
    assert(exact.w==other.w && exact.c==other.c && exact.w==third.w && exact.c==third.c);
    if(N<=11) {V brute=brute_rec(w,N,0,5,1,(V){0,1});assert(brute.w==exact.w && brute.c==exact.c);}
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
    uint64_t start=now(CLOCK_MONOTONIC);
    do {batch_bnb(w,N,&base,method,1);batch_bnb(w,N,&candidate,0,1);}
    while(now(CLOCK_MONOTONIC)-start<50000000);
    int reps=1;
    for(;;) {
        start=now(CLOCK_MONOTONIC);batch_bnb(w,N,&base,method,reps);
        if(now(CLOCK_MONOTONIC)-start>=(uint64_t)ms*1000000 || reps>=100000) break;
        reps*=2;
    }
    for(int t=0;t<trials;t++) for(int step=0;step<4;step++) {
        int engine=((step==1 || step==2)^(t&1));
        uint64_t wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID);
        V v=batch_bnb(w,N,engine?&candidate:&base,engine?0:method,reps);
        cpu=now(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=now(CLOCK_MONOTONIC)-wall;
        assert(v.w==exact.w && v.c==exact.c);
        printf("{\"trial\":%d,\"engine\":%d,\"step\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f,\"weight\":%" PRId64 ",\"count\":%" PRIu64 "}\n",
            t,engine,step,reps,(double)wall/reps,(double)cpu/reps,v.w,v.c);
    }
    return 0;
}
