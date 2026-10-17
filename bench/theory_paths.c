/* Exploratory complete 6-edge simple-path computation, no FLINT dependency.
   Circuit plans come from the exact support-checked Python screen.
   Count/weight arithmetic is bounded by the driver's N <= 67, |w| <= 1000.
   All methods return the maximum weight and exact number of maximizing paths.
*/
#include <assert.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <pthread.h>

#define MAXN 160
#define NEG (INT64_MIN / 4)
typedef struct { int64_t w; uint64_t c; } V;
static const V zero = {NEG, 0};
static V add(V a, V b) {
    if (a.w > b.w) return a;
    if (b.w > a.w) return b;
    return (V){a.w, a.c + b.c};
}
static V mul(V a, V b) {
    if (!a.c || !b.c) return zero;
    return (V){a.w + b.w, a.c * b.c};
}
typedef struct { uint32_t n, m, nodes; uint32_t *ops, *out; V *v; } Plan;
static Plan load(const char *path) {
    FILE *f = fopen(path, "rb"); assert(f);
    uint32_t h[4]; assert(fread(h, 4, 4, f) == 4 && h[0] == 0x42544631);
    Plan p = {h[1], h[2], h[3], NULL, NULL, NULL};
    assert(p.n + 3 < MAXN && p.m == p.n*(p.n-1)/2 && p.nodes >= p.m+1);
    p.ops = malloc(2*(p.nodes-p.m-1)*sizeof(uint32_t));
    p.out = malloc(p.m*sizeof(uint32_t)); p.v = calloc(p.nodes, sizeof(V));
    assert(p.ops && p.out && p.v);
    assert(fread(p.ops, 8, p.nodes-p.m-1, f) == p.nodes-p.m-1);
    assert(fread(p.out, 4, p.m, f) == p.m); assert(fgetc(f) == EOF); fclose(f);
    for (uint32_t i=p.m+1; i<p.nodes; i++) {
        assert(p.ops[2*(i-p.m-1)] < i && p.ops[2*(i-p.m-1)+1] < i);
    }
    for (uint32_t i=0; i<p.m; i++) assert(p.out[i] < p.nodes);
    p.v[0] = zero;
    return p;
}

/* Data-specific conventional control. At a node store the heaviest edge
   class, its total multiplicity and incident multiplicities. If deleting
   the requested two vertices leaves any of this class, subtraction computes
   its exact remaining count. Otherwise at least one endpoint of a chosen
   heaviest edge was deleted; descend after forcing that vertex absent.
   Depth is at most two, with at most seven nodes/scans for all queries.
   This does not subtract max values or assume distinct weights. */
typedef struct {
    int fa, fb, u, v, child[2];
    int64_t best;
    uint64_t count, degree[MAXN];
} FaultNode;
typedef struct { FaultNode nodes[7]; int used, n; const V *edges; } Fault;
static int node(Fault *t, int fa, int fb) {
    assert(t->used < 7);
    int id = t->used++; FaultNode *p = &t->nodes[id];
    *p = (FaultNode){.fa=fa, .fb=fb, .u=-1, .v=-1, .child={-1,-1}, .best=NEG};
    for (int a=0; a<t->n; a++) for (int b=a+1; b<t->n; b++) {
        if (a==fa || a==fb || b==fa || b==fb) continue;
        V x=t->edges[a*t->n+b]; if (!x.c) continue;
        if (x.w > p->best) {
            p->best=x.w; p->count=0; p->u=a; p->v=b;
            memset(p->degree, 0, t->n*sizeof(uint64_t));
        }
        if (x.w == p->best) {
            p->count+=x.c; p->degree[a]+=x.c; p->degree[b]+=x.c;
        }
    }
    return id;
}
static V query(Fault *t, int id, int a, int b) {
    FaultNode *p=&t->nodes[id]; if (!p->count) return zero;
    V edge=t->edges[a*t->n+b];
    uint64_t overlap = (edge.w==p->best && a!=p->fa && a!=p->fb &&
                       b!=p->fa && b!=p->fb) ? edge.c : 0;
    uint64_t count=p->count+overlap-p->degree[a]-p->degree[b];
    if (count) return (V){p->best,count};
    int side = (p->u==a || p->u==b) ? 0 : 1;
    int omitted=side ? p->v : p->u;
    assert(omitted==a || omitted==b); assert(p->fb < 0);
    if (p->child[side]<0) p->child[side]=node(t, omitted, p->fa);
    return query(t,p->child[side],a,b);
}

static V solve(const V *w, int N, Plan *p, int fault) {
    int n=N-3, pool[MAXN]; V answer=zero;
    V left[MAXN*MAXN], right[MAXN*MAXN];
    for (int middle=1; middle<N-1; middle++) {
        int k=0; for (int a=1; a<N-1; a++) if(a!=middle) pool[k++]=a;
        assert(k==n); k=0;
        for (int a=0; a<n; a++) for (int b=a+1; b<n; b++) {
            int x=pool[a], y=pool[b];
            V l=add(mul(mul(w[x],w[x*N+y]),w[y*N+middle]),
                    mul(mul(w[y],w[y*N+x]),w[x*N+middle]));
            V r=add(mul(mul(w[middle*N+x],w[x*N+y]),w[y*N+N-1]),
                    mul(mul(w[middle*N+y],w[y*N+x]),w[x*N+N-1]));
            left[a*n+b]=l; right[a*n+b]=r; p->v[++k]=l;
        }
        if (fault) {
            Fault tree={.used=0,.n=n,.edges=left}; node(&tree,-1,-1);
            for (int a=0; a<n; a++) for (int b=a+1; b<n; b++)
                answer=add(answer,mul(query(&tree,0,a,b),right[a*n+b]));
        } else {
            for (uint32_t i=p->m+1,j=0; i<p->nodes; i++,j+=2)
                p->v[i]=add(p->v[p->ops[j]],p->v[p->ops[j+1]]);
            k=0;
            for (int a=0; a<n; a++) for (int b=a+1; b<n; b++)
                answer=add(answer,mul(p->v[p->out[k++]],right[a*n+b]));
        }
    }
    return answer;
}
static uint64_t rng=20261007;
static uint64_t rand64(void) { rng^=rng<<13; rng^=rng>>7; rng^=rng<<17; return rng; }
static uint64_t now(clockid_t c) {
    struct timespec t; assert(clock_gettime(c,&t)==0);
    return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;
}
static volatile uint64_t checksum;
static V batch(const V *w,int N,Plan *p,int fault,int reps) {
    V v=zero;
    for(int r=0;r<reps;r++) {v=solve(w,N,p,fault); checksum^=v.c+(uint64_t)v.w;}
    return v;
}
static V brute_rec(const V *w,int N,int last,int left,uint64_t seen,V sofar) {
    if (!left) return mul(sofar,w[last*N+N-1]);
    V ans=zero;
    for(int a=1;a<N-1;a++) if(!(seen & (UINT64_C(1)<<a)))
        ans=add(ans,brute_rec(w,N,a,left-1,seen|(UINT64_C(1)<<a),mul(sofar,w[last*N+a])));
    return ans;
}
int main(int argc,char **argv) {
    assert(argc==7); Plan base=load(argv[1]), candidate=load(argv[2]);
    assert(base.n==candidate.n);
    int kind=atoi(argv[3]), fault=atoi(argv[4]), trials=atoi(argv[5]), ms=atoi(argv[6]);
    int N=base.n+3; assert(N<=67 && kind>=0 && kind<=4 && ms>0 && trials>=1);
    V *w=malloc(N*N*sizeof(V)); assert(w);
    for(int a=0;a<N;a++) for(int b=0;b<N;b++) {
        int64_t weight=kind==0 ? 0 : kind==1 ? (int64_t)(rand64()%2001)-1000 : (int64_t)(rand64()%5)-2;
        w[a*N+b]=(a==b || kind==4 || (kind==3 && rand64()%3)) ? zero : (V){weight,1};
    }
    V reference=solve(w,N,&base,fault), got=solve(w,N,&candidate,0);
    V control=solve(w,N,&base,!fault);
    assert(reference.w==got.w && reference.c==got.c);
    assert(reference.w==control.w && reference.c==control.c);
    if (N<=11) {
        V exact=brute_rec(w,N,0,5,1,(V){0,1});
        assert(exact.w==got.w && exact.c==got.c);
    }
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED,0);
    uint64_t warm=now(CLOCK_MONOTONIC);
    do {batch(w,N,&base,fault,1);batch(w,N,&candidate,0,1);}
    while(now(CLOCK_MONOTONIC)-warm<50000000);
    int reps=1; uint64_t elapsed;
    do {uint64_t start=now(CLOCK_MONOTONIC);batch(w,N,&base,fault,reps);
        elapsed=now(CLOCK_MONOTONIC)-start;
        if(elapsed<(uint64_t)ms*1000000 && reps<100000) reps*=2; else break;
    } while(1);
    for(int t=0;t<trials;t++) for(int step=0;step<4;step++) {
        int engine=((step==1 || step==2) ^ (t&1));
        Plan *p=engine ? &candidate : &base;
        uint64_t wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID);
        V v=batch(w,N,p,engine?0:fault,reps);
        cpu=now(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=now(CLOCK_MONOTONIC)-wall;
        assert(v.w==reference.w && v.c==reference.c);
        printf("{\"trial\":%d,\"engine\":%d,\"step\":%d,\"reps\":%d,\"ns_per_op\":%.3f,\"cpu_ns_per_op\":%.3f,\"weight\":%" PRId64 ",\"count\":%" PRIu64 "}\n",
               t,engine,step,reps,(double)wall/reps,(double)cpu/reps,v.w,v.c);
    }
    return 0;
}
