/* BF_KERNEL_BEGIN: shared input normalization with contiguous dot products.
   Truncated variant: covers only the points the plan's transforms produce and
   read, as upstream fft_small's _op_npts does (FLINT main 54d1439, op.c).
   BF_PREPARE=0 is a matched control retaining per-product reductions. */
static __attribute__((noinline)) void
_bf_normalize(const sd_fft_ctx_struct *Q, double *x, ulong npts)
{
    vec8d p=vec8d_set_d(Q->p), pinv=vec8d_set_d(Q->pinv);
    for (ulong f=0;f<npts;f+=16)
    {
        vec8d a=vec8d_load(x+f), b=vec8d_load(x+f+8);
        vec8d_store(x+f,vec8d_reduce_to_pm1n(a,p,pinv));
        vec8d_store(x+f+8,vec8d_reduce_to_pm1n(b,p,pinv));
    }
}

static __attribute__((noinline)) void
_bf_contiguous(const sd_fft_ctx_struct *Q, double *z,
               const double *ap[16], const double *bp[16], ulong npts, slong k)
{
    vec8d p=vec8d_set_d(Q->p), pinv=vec8d_set_d(Q->pinv);
    for (slong l=0;l<k;l++)
    {
        const double *a=ap[l], *b=bp[l];
        for (ulong f=0;f<npts;f+=16)
        {
            vec8d x0=vec8d_load(a+f), x1=vec8d_load(a+f+8);
#if !BF_PREPARE
            x0=vec8d_reduce_to_pm1n(x0,p,pinv);
            x1=vec8d_reduce_to_pm1n(x1,p,pinv);
#endif
            x0=vec8d_mulmod(x0,vec8d_load(b+f),p,pinv);
            x1=vec8d_mulmod(x1,vec8d_load(b+f+8),p,pinv);
            if (l!=0)
            {
                x0=vec8d_reduce_to_pm1n(vec8d_add(vec8d_load(z+f),x0),p,pinv);
                x1=vec8d_reduce_to_pm1n(vec8d_add(vec8d_load(z+f+8),x1),p,pinv);
            }
            vec8d_store(z+f,x0);vec8d_store(z+f+8,x1);
        }
    }
}
/* BF_KERNEL_END */

static ulong _bf_npts(const fft_small_plan_struct *P)
{
    return n_min(_fft_small_op_trunc(P->ztrunc, P), n_pow2(P->depth));
}

/* Called only by the matrix driver's input-owning worker, after conversion
   and before the phase barrier. No representation tags or extra storage. */
void _bf_tpoly_prepare(gr_ptr x, gr_ctx_t ctx)
{
    tpoly_ctx_struct *T=TPOLY_CTX(ctx);
    if (!TPOLY(x)->len) return;
    for (ulong pi=0;pi<T->P->np;pi++)
        _bf_normalize(T->P->ffts+T->P->offset+pi,
                      TPOLY(x)->op.data+pi*T->P->stride,_bf_npts(T->P));
}

/* Private matrix-only interface: left inputs must have passed through
   _bf_tpoly_prepare when BF_PREPARE=1. Decline before writing outputs. */
int _bf_tpoly_contiguous(gr_ptr out, gr_srcptr left, gr_srcptr right,
                         slong k, slong bc, gr_ctx_t ctx)
{
    tpoly_ctx_struct *T=TPOLY_CTX(ctx);
    slong len=0;ulong terms=0,depth=0;int negs=0;
    if (k<4 || k>16 || bc<4 || T->cyclic) return GR_UNABLE;
    for (slong l=0;l<k;l++)
    {
        const tpoly_struct *a=TPOLY(GR_ENTRY(left,l,ctx->sizeof_elem));
        const tpoly_struct *b=TPOLY(GR_ENTRY(right,l*bc,ctx->sizeof_elem));
        ulong t,sum;
        if (!a->len || !b->len || a->op.domain!=FFT_SMALL_OP_PRIMAL ||
            b->op.domain!=FFT_SMALL_OP_PRIMAL) return GR_UNABLE;
        slong n=a->len+b->len-1;
        if (n>T->N || !_mul_terms(&t,a,b,T->terms_bound)) return GR_UNABLE;
        sum=terms+t;
        if (sum<t || sum>T->terms_bound || a->depth+b->depth>T->max_depth)
            return GR_UNABLE;
        terms=sum;len=FLINT_MAX(len,n);depth=FLINT_MAX(depth,a->depth+b->depth);
        negs|=a->negs|b->negs;
    }
    /* BF_DOT_SUCCESS */
    for (ulong pi=0;pi<T->P->np;pi++)
    {
        const double *ap[16],*bp[16];ulong offset=pi*T->P->stride;
        for (slong l=0;l<k;l++)
        {
            ap[l]=TPOLY(GR_ENTRY(left,l,ctx->sizeof_elem))->op.data+offset;
            bp[l]=TPOLY(GR_ENTRY(right,l*bc,ctx->sizeof_elem))->op.data+offset;
        }
        _bf_contiguous(T->P->ffts+T->P->offset+pi,TPOLY(out)->op.data+offset,
                       ap,bp,_bf_npts(T->P),k);
    }
    tpoly_struct *z=TPOLY(out);
    z->op.domain=FFT_SMALL_OP_PRIMAL;z->len=len;z->terms=terms;
    z->depth=depth;z->negs=negs;
    return GR_SUCCESS;
}
