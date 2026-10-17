#define main survey_unused_main
#include "poly_survey.c"
#undef main
#include "fft_small.h"

int main(void) {
    ulong mods[]={65537,1000000007,0x3f00000000001UL,2013265921UL,18446744073709551557UL};
    slong lengths[]={64,240,256,272,1008,1024,1040},ks[]={1,2,4,8,16,17};
    ulong comparisons=0,accepted=0,refused=0,aliases=0;
    for(int it=0;it<84;it++) {
        slong ar=2+it%7,k=ks[it%6],bc=4+(it/6)%6,len=lengths[it%7];
        int square=it%7==0;if(square)ar=k=bc=(it%2)?4:8;
        ulong mod=mods[it%5];flint_set_num_threads((int[]){1,2,4}[it%3]);
        nmod_poly_mat_t A,B,C,R,Z;
        nmod_poly_mat_init(A,ar,k,mod);nmod_poly_mat_init(B,k,bc,mod);
        nmod_poly_mat_init(C,ar,bc,mod);nmod_poly_mat_init(R,ar,bc,mod);nmod_poly_mat_init(Z,ar,bc,mod);
        fill(A,len,mod,it%3);fill(B,len,mod,(it/3)%3);
        if(it%5==3) {
            nmod_poly_zero(nmod_poly_mat_entry(A,0,0));
            nmod_poly_truncate(nmod_poly_mat_entry(B,0,0),len/2);
        }
        if(it%19==18)nmod_poly_mat_zero(A);
        const nmod_poly_mat_struct *right=square?A:B;
        reference(R,A,right,0,0,2*len-1);
        nmod_poly_mat_mul(C,A,right);
        if(!nmod_poly_mat_equal(C,R))abort();comparisons++;
        slong lo=(it%4==0)?0:(it%4==1)?len/2:(it%4==2)?2*len-3:3*len;
        slong hi=(it%4==0)?0:(it%4==1)?3*len/2:lo+10;
        reference(R,A,right,1,lo,hi);
        ulong oldlimit=flint_fft_small_max_transformed_ring_size;
        if(it%11==10)flint_fft_small_max_transformed_ring_size=1UL<<18;
        int ok=nmod_poly_mat_mulmid_fft_small(C,A,right,lo,hi);
        if(ok){if(!nmod_poly_mat_equal(C,R))abort();accepted++;comparisons++;}else refused++;
        if(square) {
            nmod_poly_mat_set(Z,A);
            ok=nmod_poly_mat_mulmid_fft_small(Z,Z,Z,lo,hi);
            if(ok){if(!nmod_poly_mat_equal(Z,R))abort();comparisons++;aliases++;}
            reference(R,A,B,0,0,2*len-1);
            nmod_poly_mat_set(Z,B);nmod_poly_mat_mul(Z,A,Z);
            if(!nmod_poly_mat_equal(Z,R))abort();comparisons++;aliases++;
        }
        flint_fft_small_max_transformed_ring_size=oldlimit;
        nmod_poly_mat_clear(A);nmod_poly_mat_clear(B);nmod_poly_mat_clear(C);nmod_poly_mat_clear(R);nmod_poly_mat_clear(Z);
    }
    printf("{\"matrix_comparisons\":%lu,\"middle_accepted\":%lu,\"middle_refused\":%lu,\"alias_comparisons\":%lu",comparisons,accepted,refused,aliases);
    ulong *calls=dlsym(RTLD_DEFAULT,"bf_tile_calls"),*successes=dlsym(RTLD_DEFAULT,"bf_tile_successes");
    if(calls){if(!*successes || *calls<=*successes)abort();printf(",\"tile_calls\":%lu,\"tile_successes\":%lu",*calls,*successes);}
    ulong *prepared=dlsym(RTLD_DEFAULT,"bf_prepare_calls"),*slots=dlsym(RTLD_DEFAULT,"bf_prepare_slots");
    if(prepared)printf(",\"prepared_inputs\":%lu,\"prepared_slots\":%lu",*prepared,*slots);
    puts("}");flint_cleanup_master();return 0;
}
