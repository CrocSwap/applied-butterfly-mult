#define main survey_unused_main
#include "poly_survey.c"
#undef main

int main(int argc,char **argv) {
    if(argc!=5)return 2;
    slong d=strtol(argv[1],NULL,10),len=strtol(argv[2],NULL,10);
    ulong p=strtoul(argv[3],NULL,10);int middle=!strcmp(argv[4],"mid");
    if(d<1 || d>16 || len<2 || len>8192 || p<2)return 2;
    ulong *calls=dlsym(RTLD_DEFAULT,"bf_tile_calls"),*successes=dlsym(RTLD_DEFAULT,"bf_tile_successes");
    ulong *prepared=dlsym(RTLD_DEFAULT,"bf_prepare_calls"),*slots=dlsym(RTLD_DEFAULT,"bf_prepare_slots");
    if(!calls || !successes || !prepared || !slots)return 2;
    flint_set_num_threads(1);
    nmod_poly_mat_t A,B,C,R;
    nmod_poly_mat_init(A,d,d,p);nmod_poly_mat_init(B,d,d,p);
    nmod_poly_mat_init(C,d,d,p);nmod_poly_mat_init(R,d,d,p);
    fill(A,len,p,0);fill(B,len,p,0);
    slong lo=middle?len/2:0,hi=middle?3*len/2:2*len-1;
    if(!operation(C,A,B,middle,lo,hi))return 3;
    *calls=*successes=*prepared=*slots=0;
    if(!operation(C,A,B,middle,lo,hi))return 3;
    ulong observed[]={*calls,*successes,*prepared,*slots};
    reference(R,A,B,middle,lo,hi);
    if(!nmod_poly_mat_equal(C,R))abort();
    prefix(d,len,p,middle);
    printf(",\"dot_calls\":%lu,\"dot_successes\":%lu,\"prepared_inputs\":%lu,\"prepared_slots\":%lu}\n",observed[0],observed[1],observed[2],observed[3]);
    nmod_poly_mat_clear(A);nmod_poly_mat_clear(B);nmod_poly_mat_clear(C);nmod_poly_mat_clear(R);
    flint_cleanup_master();return 0;
}
