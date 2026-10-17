#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include "arb.h"
#include "mp_real.h"

static void *sym(void *h,const char *name) {
    void *p=dlsym(h,name);
    if (!p) { fprintf(stderr,"%s\n",dlerror());exit(1); }
    return p;
}
int main(int argc,char **argv) {
    if (argc!=2) return 2;
    void *h=dlopen(argv[1],RTLD_NOW|RTLD_LOCAL);
    if (!h) { fprintf(stderr,"%s\n",dlerror());return 1; }
    void (*init)(arb_t)=sym(h,"arb_init"),(*clear)(arb_t)=sym(h,"arb_clear");
    void (*compute)(arb_t,mp_real_const_func,slong)=sym(h,"_mp_real_const_arb");
    mp_real_const_func pi4=sym(h,"mp_real_const_pi4");
    void (*scale)(arb_t,const arb_t,slong)=sym(h,"arb_mul_2exp_si");
    void (*threads)(int)=sym(h,"flint_set_num_threads");
    void (*cleanup)(void)=sym(h,"flint_cleanup_master");
    slong (*accuracy)(const arb_t)=sym(h,"arb_rel_accuracy_bits");
    ulong *calls=sym(h,"bf_trace_fused_calls"),*coeffs=sym(h,"bf_trace_fused_coefficients");
    ulong *windows=sym(h,"bf_trace_window_calls");
    threads(1);
    for (slong prec=262144;prec<=1048576;prec*=2) {
        arb_t z;init(z);
        *calls=*coeffs=*windows=0;
        compute(z,pi4,prec);scale(z,z,2);
        if (accuracy(z)<prec-4 || !*calls) return 1;
        printf("{\"precision_bits\":%ld,\"fused_calls\":%lu,\"fused_coefficients\":%lu,\"np2_window_calls\":%lu,\"accuracy_bits\":%ld}\n",
               prec,*calls,*coeffs,*windows,accuracy(z));
        clear(z);
    }
    cleanup();return 0;
}
