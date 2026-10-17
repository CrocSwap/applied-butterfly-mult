/* Check cache lifetime, precision changes, alias shortcuts, and fallback.
   Include the actual generated implementation to exercise its private helpers. */
#include <assert.h>
#include "../.deps/experiments/theta-batch/shared/ql_exact.c"

int main(void)
{
    flint_rand_t state;flint_rand_init(state);flint_rand_set_seed(state,991103,517031);
    slong cases=0,coefficients=0;
    for(slong g=0;g<=5;g++) for(int pi=0;pi<3;pi++) for(int all=0;all<2;all++) {
        slong n=1L<<g,len=all?n*n:n,prec=(slong[]){64,128,512}[pi];
        acb_ptr bank=_acb_vec_init(3*n),rhs=_acb_vec_init(n);
        acb_ptr ref=_acb_vec_init(len),out=_acb_vec_init(len);
        arb_ptr d0=_arb_vec_init(n),d=_arb_vec_init(n);
        bf_batch_cache cache;bf_batch_init(&cache,n);
        for(int step=0;step<3;step++) {
            bf_batch_reset(&cache);
            /* Mutate the SAME input allocations between steps. */
            for(slong i=0;i<3*n;i++) acb_randtest(bank+i,state,prec,2);
            for(slong i=0;i<n;i++) arb_set_si(d0+i,step+(i%3));
            for(int call=0;call<12;call++) {
                int index=call==11?2:(call/3)%2;
                acb_srcptr left=bank+index*n;
                for(slong i=0;i<n;i++) {
                    acb_randtest(rhs+i,state,prec,2);
                    arb_set_si(d+i,call/4+(i%2));
                }
                acb_srcptr right=call%4==0?left:rhs;
                slong p=prec+(call>=8?31:0);
                acb_theta_agm_mul_tight(ref,left,right,d0,d,g,all,p);
                bf_batch_mul(&cache,out,left,right,d0,d,g,all,p);
                assert(_acb_vec_is_finite(ref,len));
                assert(_acb_vec_equal(ref,out,len));
                cases++;coefficients+=len;
            }
        }
        bf_batch_clear(&cache);_acb_vec_clear(bank,3*n);_acb_vec_clear(rhs,n);
        _acb_vec_clear(ref,len);_acb_vec_clear(out,len);_arb_vec_clear(d0,n);_arb_vec_clear(d,n);
    }
    flint_rand_clear(state);flint_cleanup();
    printf("{\"status\":\"PASS\",\"calls\":%ld,\"bit_identical_coefficients\":%ld}\n",cases,coefficients);
    return 0;
}
