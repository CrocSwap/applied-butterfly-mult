/* Independent exact oracle for descending and ascending cache precisions. */
#include <assert.h>
#include "../.deps/experiments/theta-batch/retained/ql_exact.c"

int main(void)
{
    flint_rand_t state;flint_rand_init(state);flint_rand_set_seed(state,135017,713051);
    fmpz_t z;fmpz_init(z);acb_t t;acb_init(t);
    slong cases=0,checks=0;
    const slong bits=600,oprec=2*bits+32;
    const slong precisions[]={256,64,512,128,256,80};
    for(slong g=0;g<=5;g++) for(int all=0;all<2;all++) {
        slong n=1L<<g,len=all?n*n:n;
        acb_ptr x=_acb_vec_init(2*n),y=_acb_vec_init(n),ref=_acb_vec_init(len),out=_acb_vec_init(len);
        arb_ptr d=_arb_vec_init(n);bf_batch_cache cache;bf_batch_init(&cache,n);
        for(int step=0;step<2;step++) {
            bf_batch_reset(&cache);
            for(slong i=0;i<3*n;i++) {
                acb_ptr a=i<2*n?x+i:y+i-2*n;
                fmpz_randbits(z,state,bits);arb_set_fmpz(acb_realref(a),z);
                fmpz_randbits(z,state,bits);arb_set_fmpz(acb_imagref(a),z);
                acb_mul_2exp_si(a,a,-bits);
            }
            for(int pi=0;pi<6;pi++) for(int bank=0;bank<2;bank++) for(int sq=0;sq<2;sq++) {
                acb_srcptr left=x+bank*n,right=sq?left:y;
                for(slong k=0;k<n;k++) for(slong a=0;a<(all?n:1);a++) {
                    acb_ptr v=ref+(all?k*n+a:k);acb_zero(v);
                    for(slong b=0;b<n;b++) {
                        acb_mul(t,left+(b^k),right+b,oprec);
                        if(__builtin_parityll((unsigned long long)(a&b))) acb_sub(v,v,t,oprec);
                        else acb_add(v,v,t,oprec);
                    }
                    assert(acb_is_exact(v));
                }
                bf_batch_mul(&cache,out,left,right,d,d,g,all,precisions[pi]);
                assert(_acb_vec_is_finite(out,len));
                for(slong i=0;i<len;i++) {assert(acb_contains(out+i,ref+i));checks++;}
                cases++;
            }
        }
        bf_batch_clear(&cache);_acb_vec_clear(x,2*n);_acb_vec_clear(y,n);
        _acb_vec_clear(ref,len);_acb_vec_clear(out,len);_arb_vec_clear(d,n);
    }
    acb_clear(t);fmpz_clear(z);flint_rand_clear(state);flint_cleanup();
    printf("{\"status\":\"PASS\",\"calls\":%ld,\"exact_containment_checks\":%ld}\n",cases,checks);
}
