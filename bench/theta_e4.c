/* E4 = sum theta(0,tau)^8, with a common requested-accuracy contract.
   Input is an EXACT rounded rational matrix, not a certified curve period.
   File: THETA_E4_V1 g digits, then real/imag integer pairs for i <= j.
   Each integer is scaled by 10^-digits. See docs/theta-e4.md. */
#include <assert.h>
#include <ctype.h>
#include <dlfcn.h>
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "acb.h"
#include "acb_mat.h"
#include "arb_mat.h"
#include "acb_modular.h"
#include "acb_theta.h"

typedef void (*jet_fn)(acb_ptr, acb_srcptr, slong, const acb_mat_t,
                        slong, ulong, int, int, slong);
typedef struct { slong prec, accuracy; int attempts; } stats;
static uint64_t ticks(clockid_t clock) {
    struct timespec t; assert(!clock_gettime(clock, &t));
    return (uint64_t)t.tv_sec * 1000000000 + t.tv_nsec;
}
static void *symbol(void *h, const char *name) {
    void *p = dlsym(h, name); if (!p) { fprintf(stderr, "%s\n", dlerror()); exit(2); }
    return p;
}
static void read_matrix(acb_mat_t tau, const char *path, slong prec) {
    FILE *f = fopen(path, "r"); assert(f);
    char tag[32]; slong g, digits;
    assert(fscanf(f, "%31s %ld %ld", tag, &g, &digits) == 3);
    assert(!strcmp(tag, "THETA_E4_V1") && g >= 1 && g <= 6);
    assert(digits >= 0 && digits <= 5000);
    acb_mat_init(tau, g, g);
    fmpz_t num, den; fmpz_init(num); fmpz_init(den);
    fmpz_ui_pow_ui(den, 10, digits);
    for (slong i = 0; i < g; i++) for (slong j = i; j < g; j++) {
        acb_ptr a = acb_mat_entry(tau, i, j);
        assert(fmpz_fread(f, num) > 0);
        arb_set_fmpz(acb_realref(a), num);
        arb_div_fmpz(acb_realref(a), acb_realref(a), den, prec);
        assert(fmpz_fread(f, num) > 0);
        arb_set_fmpz(acb_imagref(a), num);
        arb_div_fmpz(acb_imagref(a), acb_imagref(a), den, prec);
        if (i != j) acb_set(acb_mat_entry(tau, j, i), a);
    }
    int ch; do { ch = fgetc(f); } while (ch != EOF && isspace(ch));
    assert(ch == EOF); fclose(f); fmpz_clear(num); fmpz_clear(den);
    arb_mat_t im, L; arb_mat_init(im, g, g); arb_mat_init(L, g, g);
    for (slong i = 0; i < g; i++) for (slong j = 0; j < g; j++)
        arb_set(arb_mat_entry(im, i, j), acb_imagref(acb_mat_entry(tau, i, j)));
    assert(arb_mat_cho(L, im, prec)); /* Prove the supplied matrix is in H_g. */
    arb_mat_clear(im); arb_mat_clear(L);
}
static void moment(acb_t out, acb_srcptr theta, slong len, int squared, slong prec) {
    acb_t t; acb_init(t); acb_zero(out);
    for (slong i = 0; i < len; i++) {
        acb_sqr(t, theta + i, prec); acb_sqr(t, t, prec);
        if (!squared) acb_sqr(t, t, prec);
        acb_add(out, out, t, prec);
    }
    acb_clear(t);
}
/* Allocation, all theta values, powers, accumulation, retries and cleanup
   are all included in each timed operation. File import and dlopen are not. */
static int evaluate(acb_t out, stats *s, jet_fn fn, const acb_mat_t tau,
                    slong target, slong start, slong cap) {
    slong g = acb_mat_nrows(tau), len = 1L << (2*g);
    acb_ptr z = _acb_vec_init(g), theta = _acb_vec_init(len);
    s->attempts = 0;
    for (slong prec = start;; prec = FLINT_MIN(2*prec, cap)) {
        fn(theta, z, 1, tau, 0, 0, 1, 1, prec);
        moment(out, theta, len, 1, prec);
        s->attempts++; s->prec = prec; s->accuracy = acb_rel_accuracy_bits(out);
        if ((acb_is_finite(out) && s->accuracy >= target) || prec == cap) break;
    }
    _acb_vec_clear(z, g); _acb_vec_clear(theta, len);
    return acb_is_finite(out) && s->accuracy >= target;
}
static void oracle(acb_t out, const acb_mat_t tau, slong prec) {
    slong g = acb_mat_nrows(tau); int diagonal = 1;
    for (slong i = 0; i < g; i++) for (slong j = 0; j < g; j++)
        if (i != j && !acb_is_zero(acb_mat_entry(tau, i, j))) diagonal = 0;
    if (diagonal) {
        /* Independent elliptic implementation and separability in every genus. */
        acb_t z, factor; acb_init(z); acb_init(factor);
        acb_ptr th = _acb_vec_init(4); acb_one(out);
        for (slong i = 0; i < g; i++) {
            acb_modular_theta(th, th+1, th+2, th+3, z, acb_mat_entry(tau,i,i), prec);
            moment(factor, th, 4, 0, prec); acb_mul(out, out, factor, prec);
        }
        _acb_vec_clear(th, 4); acb_clear(z); acb_clear(factor);
    } else {
        /* Direct theta series, separate from the patched duplication kernel.
           At high genus this may be costly; the runner imposes a time limit. */
        slong n = 1L << g;
        acb_theta_ctx_tau_t ctx; acb_theta_ctx_tau_init(ctx, 1, g);
        acb_theta_ctx_z_struct *v = acb_theta_ctx_z_vec_init(1, g);
        acb_ptr z = _acb_vec_init(g), th = _acb_vec_init(n*n);
        arb_ptr distances = _arb_vec_init(n);
        acb_theta_ctx_tau_set(ctx, tau, prec); acb_theta_ctx_z_set(v, z, ctx, prec);
        acb_theta_sum(th, v, 1, ctx, distances, 1, 1, 0, prec);
        moment(out, th, n*n, 0, prec);
        _arb_vec_clear(distances, n); _acb_vec_clear(z, g); _acb_vec_clear(th, n*n);
        acb_theta_ctx_z_vec_clear(v, 1); acb_theta_ctx_tau_clear(ctx);
    }
    assert(acb_is_finite(out));
}
int main(int argc, char **argv) {
    if (argc != 10) {
        fprintf(stderr, "usage: theta-e4 validate|probe|measure base candidate matrix target start cap trials same\n");
        return 2;
    }
    const char *mode = argv[1];
    slong target = atol(argv[5]), start = atol(argv[6]), cap = atol(argv[7]);
    int trials = atoi(argv[8]), same = atoi(argv[9]);
    assert(target >= 1 && start >= 32 && cap >= start && cap <= 65536);
    assert(trials >= 1 && trials <= 1000 && (same == 0 || same == 1));
    assert(!strcmp(mode,"validate") || !strcmp(mode,"probe") || !strcmp(mode,"measure"));
    void *h[2] = {dlopen(argv[2], RTLD_NOW|RTLD_LOCAL), dlopen(argv[3], RTLD_NOW|RTLD_LOCAL)};
    if (!h[0] || !h[1]) { fprintf(stderr, "%s\n", dlerror()); return 2; }
    jet_fn fn[2] = {(jet_fn)symbol(h[0], "acb_theta_jet"), (jet_fn)symbol(h[1], "acb_theta_jet")};
    if (same) fn[1] = fn[0];
    acb_mat_t tau; read_matrix(tau, argv[4], cap + 128);
    acb_t ref, out, direct; acb_init(ref); acb_init(out); acb_init(direct);
    stats s[2];
    int ok0 = evaluate(ref, s, fn[0], tau, target, start, cap);
    int ok1 = evaluate(out, s+1, fn[1], tau, target, start, cap);
    if (!ok0 || !ok1) {
        printf("{\"status\":\"accuracy_cap\",\"accuracy\":[%ld,%ld],\"attempts\":[%d,%d]}\n",
               s[0].accuracy, s[1].accuracy, s[0].attempts, s[1].attempts);
        return 3;
    }
    assert(acb_overlaps(ref, out));
    if (strcmp(mode, "measure")) {
        if (!strcmp(mode, "validate")) {
            oracle(direct, tau, FLINT_MAX(s[0].prec, s[1].prec) + 64);
            assert(acb_overlaps(ref, direct) && acb_overlaps(out, direct));
            assert(acb_rel_accuracy_bits(direct) >= target);
        }
        printf("{\"status\":\"PASS\",\"independent_oracle\":%s,\"g\":%ld,\"target_bits\":%ld,"
               "\"accuracy\":[%ld,%ld],\"working_precision\":[%ld,%ld],\"attempts\":[%d,%d]}\n",
               !strcmp(mode,"validate")?"true":"false", acb_mat_nrows(tau), target,
               s[0].accuracy,s[1].accuracy,s[0].prec,s[1].prec,s[0].attempts,s[1].attempts);
    } else {
        pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
        stats st; uint64_t t = ticks(CLOCK_MONOTONIC);
        do { for (int e=0;e<2;e++) assert(evaluate(out,&st,fn[e],tau,target,start,cap)); }
        while (ticks(CLOCK_MONOTONIC)-t < 200000000);
        int reps=1;
        for (;;) {
            uint64_t longest=0;
            for (int e=0;e<2;e++) {
                t=ticks(CLOCK_MONOTONIC);
                for (int r=0;r<reps;r++) assert(evaluate(out,&st,fn[e],tau,target,start,cap));
                longest=FLINT_MAX(longest,ticks(CLOCK_MONOTONIC)-t);
            }
            if (longest>=20000000 || reps>=65536) break;
            reps*=2;
        }
        for(int trial=0;trial<trials;trial++) for(int step=0;step<4;step++) {
            int e=((step==1 || step==2)^(trial&1));
            uint64_t wall=ticks(CLOCK_MONOTONIC),cpu=ticks(CLOCK_THREAD_CPUTIME_ID);
            for(int r=0;r<reps;r++) assert(evaluate(out,&st,fn[e],tau,target,start,cap));
            cpu=ticks(CLOCK_THREAD_CPUTIME_ID)-cpu;wall=ticks(CLOCK_MONOTONIC)-wall;
            assert(acb_overlaps(ref,out));
            assert(st.prec==s[e].prec && st.attempts==s[e].attempts);
            printf("{\"trial\":%d,\"step\":%d,\"engine\":%d,\"reps\":%d,\"ns_per_op\":%.3f,"
                   "\"cpu_ns_per_op\":%.3f,\"working_precision\":%ld,\"attempts\":%d,\"accuracy\":%ld}\n",
                   trial,step,e,reps,(double)wall/reps,(double)cpu/reps,st.prec,st.attempts,st.accuracy);
        }
    }
    acb_clear(ref); acb_clear(out); acb_clear(direct); acb_mat_clear(tau);
    if (h[1]!=h[0]) ((void(*)(void))symbol(h[1],"flint_cleanup"))();
    ((void(*)(void))symbol(h[0],"flint_cleanup"))(); flint_cleanup(); return 0;
}
