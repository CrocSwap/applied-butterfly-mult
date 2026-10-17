/* Experimental ARM64 spectral dot product. BF_SHARE selects the ablation.
   Inputs are distinct from four output buffers; k is in [1,16].
   Original operand, product, and accumulator range contracts are retained. */
static __attribute__((noinline)) void
_bf_dot4(const sd_fft_ctx_struct *Q, double *z[4],
         const double *ap[16], const double *bp[16][4], ulong npts, slong k)
{
    vec2d n=vec2d_set_d(Q->p), ni=vec2d_set_d(Q->pinv);
    for (ulong f=0;f<npts;f+=2)
    {
        vec2d s0,s1,s2,s3;
        for (slong l=0;l<k;l++)
        {
            vec2d x=vec2d_load(ap[l]+f), x0,x1,x2,x3;
#if BF_SHARE
            x0=vec2d_reduce_to_pm1n(x,n,ni);
            x1=x2=x3=x0;
#else
            /* No emitted instructions: prevent CSE from silently turning the
               repeated-reduction control into the shared candidate. */
            x0=x1=x2=x3=x;
            __asm__("" : "+w"(x0), "+w"(x1), "+w"(x2), "+w"(x3));
            x0=vec2d_reduce_to_pm1n(x0,n,ni);
            x1=vec2d_reduce_to_pm1n(x1,n,ni);
            x2=vec2d_reduce_to_pm1n(x2,n,ni);
            x3=vec2d_reduce_to_pm1n(x3,n,ni);
#endif
            x0=vec2d_mulmod(x0,vec2d_load(bp[l][0]+f),n,ni);
            if (l==0) s0=x0;
            else s0=vec2d_reduce_to_pm1n(vec2d_add(s0,x0),n,ni);
            x1=vec2d_mulmod(x1,vec2d_load(bp[l][1]+f),n,ni);
            if (l==0) s1=x1;
            else s1=vec2d_reduce_to_pm1n(vec2d_add(s1,x1),n,ni);
            x2=vec2d_mulmod(x2,vec2d_load(bp[l][2]+f),n,ni);
            if (l==0) s2=x2;
            else s2=vec2d_reduce_to_pm1n(vec2d_add(s2,x2),n,ni);
            x3=vec2d_mulmod(x3,vec2d_load(bp[l][3]+f),n,ni);
            if (l==0) s3=x3;
            else s3=vec2d_reduce_to_pm1n(vec2d_add(s3,x3),n,ni);
        }
        vec2d_store(z[0]+f,s0);vec2d_store(z[1]+f,s1);
        vec2d_store(z[2]+f,s2);vec2d_store(z[3]+f,s3);
    }
}
