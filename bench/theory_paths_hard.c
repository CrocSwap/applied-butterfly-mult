/* Complete six-edge optimum/count queries on externally supplied graphs.
   Includes a generated, traced copy of the frozen BNB implementation. */
#include <stdint.h>
typedef struct { uint64_t visits; int fallback; } HardStats;
static HardStats hard_stats;
#include "bnb-frozen.inc"

typedef struct {
    const V *w; int N, seen[MAXN], degree[MAXN], adj[MAXN][MAXN];
    int bestnext[7][MAXN];
    int64_t best[7][MAXN], second[7][MAXN];
    V answer; uint64_t visits, budget; int exhausted;
} NBSearch;

static int64_t nb_bound(NBSearch *s,int r,int previous,int u) {
    return s->bestnext[r][u]==previous ? s->second[r][u] : s->best[r][u];
}

static void nb_search(NBSearch *s,int previous,int u,int r,int64_t weight,int bounded) {
    if (++s->visits>s->budget) {s->exhausted=1;return;}
    int64_t bound=bounded?nb_bound(s,r,previous,u):0;
    if(bounded && (bound==NEG || weight+bound<s->answer.w)) return;
    if(r==1) {
        V edge=s->w[u*s->N+s->N-1];
        if(edge.c) s->answer=add(s->answer,(V){weight+edge.w,1});
        return;
    }
    int next[MAXN],count=0;int64_t scores[MAXN];
    for(int t=0;t<s->degree[u];t++) {
        int v=s->adj[u][t]; if(s->seen[v]) continue;
        int64_t b=bounded?nb_bound(s,r-1,u,v):0;
        if(bounded && b==NEG) continue;
        int64_t score=s->w[u*s->N+v].w+b;
        if(bounded && weight+score<s->answer.w) continue;
        int k=count++;
        if(bounded) while(k && score>scores[k-1]) {
            next[k]=next[k-1];scores[k]=scores[k-1];k--;
        }
        next[k]=v;scores[k]=score;
    }
    for(int t=0;t<count && !s->exhausted;t++) {
        int v=next[t];
        if(bounded && weight+scores[t]<s->answer.w) continue;
        s->seen[v]=1;
        nb_search(s,u,v,r-1,weight+s->w[u*s->N+v].w,bounded);
        s->seen[v]=0;
    }
}

static V solve_nb(const V *w,int N,Plan *p,int bounded) {
    NBSearch s;s.w=w;s.N=N;s.answer=zero;s.visits=0;s.exhausted=0;
    s.budget=bounded?4*(uint64_t)N*N:UINT64_MAX;
    memset(s.seen,0,N*sizeof(int));s.seen[0]=s.seen[N-1]=1;
    /* Adjacency construction is charged inside every solve. */
    for(int u=0;u<N;u++) {
        s.degree[u]=0;
        for(int v=1;v<N-1;v++) if(w[u*N+v].c) s.adj[u][s.degree[u]++]=v;
        s.best[1][u]=w[u*N+N-1].w;s.second[1][u]=NEG;s.bestnext[1][u]=N-1;
    }
    if(bounded) for(int r=2;r<=6;r++) for(int u=0;u<N;u++) {
        int64_t best=NEG,second=NEG;int winner=-1;
        for(int t=0;t<s.degree[u];t++) {
            int v=s.adj[u][t];int64_t b=nb_bound(&s,r-1,u,v);
            if(b==NEG) continue;
            int64_t z=w[u*N+v].w+b;
            if(z>best) {second=best;best=z;winner=v;}
            else if(z>second) second=z;
        }
        s.best[r][u]=best;s.second[r][u]=second;s.bestnext[r][u]=winner;
    }
    /* The relaxation excludes immediate returns, but may repeat vertices
       after longer cycles. Every simple continuation is still admissible. */
    nb_search(&s,-1,0,6,0,bounded);
    hard_stats=(HardStats){s.visits,s.exhausted};
    return s.exhausted?solve(w,N,p,1):s.answer;
}

static V run_engine(const V *w,int N,Plan *plans,int engine) {
    hard_stats=(HardStats){0,0};
    if(engine<=2) return solve(w,N,&plans[engine],0);
    if(engine==3) return solve(w,N,&plans[0],1);
    if(engine==4) return solve_bnb(w,N,&plans[0],1);
    if(engine==5 || engine==6) return solve_nb(w,N,&plans[0],engine==5);
    abort();
}

static V run_batch(const V *w,int N,Plan *plans,int engine,int reps) {
    V v=zero;
    for(int i=0;i<reps;i++) {v=run_engine(w,N,plans,engine);checksum^=v.c+(uint64_t)v.w;}
    return v;
}

int main(int argc,char **argv) {
    assert(argc==9);
    Plan plans[3]={load(argv[1]),load(argv[2]),load(argv[3])};
    FILE *f=fopen(argv[4],"r");assert(f);int N;assert(fscanf(f,"%d",&N)==1 && N>=7 && N<MAXN);
    V *w=malloc((size_t)N*N*sizeof(V));assert(w);
    for(int a=0;a<N;a++) for(int b=0;b<N;b++) {
        int present;int64_t weight;
        assert(fscanf(f,"%d %" SCNd64,&present,&weight)==2);
        assert((present==0 || present==1) && weight>=-1000000 && weight<=1000000);
        assert(a!=b || !present);
        w[a*N+b]=present?(V){weight,1}:zero;
    }
    assert(fgetc(f)=='\n');assert(fgetc(f)==EOF);fclose(f);
    for(int i=0;i<3;i++) assert(plans[i].n==(uint32_t)(N-3));
    int base=atoi(argv[5]),trials=atoi(argv[6]),ms=atoi(argv[7]),enumerate=atoi(argv[8]);
    assert(base>=0 && base<=6 && trials>=0 && ms>=1);
    V exact=run_engine(w,N,plans,0);
    if(!trials) {
        for(int engine=0;engine<=5+enumerate;engine++) {
            V v=run_engine(w,N,plans,engine);
            assert(v.w==exact.w && v.c==exact.c);
            printf("{\"engine\":%d,\"weight\":%" PRId64 ",\"count\":%" PRIu64 ",\"visits\":%" PRIu64 ",\"fallback\":%d}\n",
                   engine,v.w,v.c,hard_stats.visits,hard_stats.fallback);
        }
        if(N<=11) {V b=brute_rec(w,N,0,5,1,(V){0,1});assert(b.w==exact.w && b.c==exact.c);}
        return 0;
    }
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
    uint64_t start=now(CLOCK_MONOTONIC);
    do {run_batch(w,N,plans,base,1);run_batch(w,N,plans,0,1);}
    while(now(CLOCK_MONOTONIC)-start<20000000);
    int reps=1;
    for(;;) {
        start=now(CLOCK_MONOTONIC);run_batch(w,N,plans,base,reps);
        uint64_t a=now(CLOCK_MONOTONIC)-start;
        start=now(CLOCK_MONOTONIC);run_batch(w,N,plans,0,reps);
        uint64_t b=now(CLOCK_MONOTONIC)-start;
        if((a>b?a:b)>=(uint64_t)ms*1000000 || reps>=65536) break;
        reps*=2;
    }
    for(int t=0;t<trials;t++) for(int step=0;step<4;step++) {
        int engine=((step==1 || step==2)^(t&1));
        uint64_t wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID);
        V v=run_batch(w,N,plans,engine?0:base,reps);
        cpu=now(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=now(CLOCK_MONOTONIC)-wall;
        assert(v.w==exact.w && v.c==exact.c);
        printf("{\"trial\":%d,\"engine\":%d,\"step\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f,\"weight\":%" PRId64 ",\"count\":%" PRIu64 "}\n",
               t,engine,step,reps,(double)wall/reps,(double)cpu/reps,v.w,v.c);
    }
    return 0;
}
