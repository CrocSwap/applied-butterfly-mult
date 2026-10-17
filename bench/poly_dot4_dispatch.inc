/* Internal matrix-only helper. Declines before writing any output if a zero
   operand or an unsupported metadata bound requires the generic path. */
int _bf_tpoly_dot4(gr_ptr out, gr_srcptr left, gr_srcptr right,
                  slong k, slong bc, gr_ctx_t ctx)
{
    tpoly_ctx_struct *T=TPOLY_CTX(ctx);
    slong lens[4]={0,0,0,0};
    ulong terms[4]={0,0,0,0}, depths[4]={0,0,0,0};
    int negs[4]={0,0,0,0};
    if (k<1 || k>16 || T->cyclic) return GR_UNABLE;
    for (slong l=0;l<k;l++) for (slong j=0;j<4;j++)
    {
        const tpoly_struct *a=TPOLY(GR_ENTRY(left,l,ctx->sizeof_elem));
        const tpoly_struct *b=TPOLY(GR_ENTRY(right,l*bc+j,ctx->sizeof_elem));
        ulong t, sum;
        if (!a->len || !b->len || a->op.domain!=FFT_SMALL_OP_PRIMAL ||
            b->op.domain!=FFT_SMALL_OP_PRIMAL) return GR_UNABLE;
        slong len=a->len+b->len-1;
        if (len>T->N || !_mul_terms(&t,a,b,T->terms_bound)) return GR_UNABLE;
        sum=terms[j]+t;
        if (sum<t || sum>T->terms_bound || a->depth+b->depth>T->max_depth)
            return GR_UNABLE;
        terms[j]=sum;lens[j]=FLINT_MAX(lens[j],len);
        depths[j]=FLINT_MAX(depths[j],a->depth+b->depth);
        negs[j]|=a->negs|b->negs;
    }
    for (ulong pi=0;pi<T->P->np;pi++)
    {
        const double *ap[16], *bp[16][4]; double *zp[4];
        ulong offset=pi*T->P->stride;
        for (slong j=0;j<4;j++)
            zp[j]=TPOLY(GR_ENTRY(out,j,ctx->sizeof_elem))->op.data+offset;
        for (slong l=0;l<k;l++)
        {
            ap[l]=TPOLY(GR_ENTRY(left,l,ctx->sizeof_elem))->op.data+offset;
            for (slong j=0;j<4;j++)
                bp[l][j]=TPOLY(GR_ENTRY(right,l*bc+j,ctx->sizeof_elem))->op.data+offset;
        }
        _bf_dot4(T->P->ffts+T->P->offset+pi,zp,ap,bp,1UL<<T->P->depth,k);
    }
    for (slong j=0;j<4;j++)
    {
        tpoly_struct *z=TPOLY(GR_ENTRY(out,j,ctx->sizeof_elem));
        z->op.domain=FFT_SMALL_OP_PRIMAL;z->len=lens[j];
        z->terms=terms[j];z->depth=depths[j];z->negs=negs[j];
    }
    return GR_SUCCESS;
}
