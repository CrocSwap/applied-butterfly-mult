/* Complete-call screening harness. Profiling and correctness precede timing.
   Inputs are deterministic and shared between two resident FLINT libraries. */
#define _DARWIN_C_SOURCE
#include <dlfcn.h>
#include <inttypes.h>
#include <math.h>
#include <pthread.h>
#include <pthread/qos.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "nmod_poly_mat.h"
#include "nmod_poly.h"
#include "nmod_vec.h"
#include "fmpz.h"
#include "arb_poly.h"
#include "acb_poly.h"

typedef void (*matrix_sqr_fn)(nmod_poly_mat_t, const nmod_poly_mat_t);
typedef void (*interpolate_fn)(nmod_poly_t, nn_srcptr, nn_srcptr, slong);
typedef void (*arb_eval_fn)(arb_t, arb_t, const arb_poly_t, const arb_t, slong);
typedef void (*acb_eval_fn)(acb_t, acb_t, const acb_poly_t, const acb_t, slong);

typedef struct
{
    void *handle;
    matrix_sqr_fn sqr;
    interpolate_fn interpolate;
    arb_eval_fn arb_eval;
    acb_eval_fn acb_eval;
} engine;

typedef struct
{
    const char *kind;
    slong size, length, prec;
    ulong modulus;
    nmod_poly_mat_t matrix, matrix_result[2], matrix_reference;
    nmod_poly_t poly, poly_result[2];
    nn_ptr xs, ys;
    arb_poly_t real_poly, real_derivative;
    acb_poly_t complex_poly, complex_derivative;
    arb_t real_x, real_y[2], real_z[2], real_ref_y, real_ref_z;
    acb_t complex_x, complex_y[2], complex_z[2], complex_ref_y, complex_ref_z;
} workload;

static uint64_t rng;
static size_t diagnostic_cpu_start, diagnostic_cpu_end;

static void digest_arb(uint64_t *digest, const arb_t x)
{
    char *s = arb_dump_str(x);
    for (const unsigned char *p = (const unsigned char *) s; *p; p++)
        *digest = (*digest ^ *p) * UINT64_C(1099511628211);
    flint_free(s);
}

static uint64_t random_word(void)
{
    rng ^= rng << 13;
    rng ^= rng >> 7;
    rng ^= rng << 17;
    return rng;
}

static uint64_t ticks(clockid_t clock)
{
    struct timespec t;
    if (clock_gettime(clock, &t)) abort();
    return (uint64_t) t.tv_sec * UINT64_C(1000000000) + t.tv_nsec;
}

static void *symbol(void *handle, const char *name)
{
    void *p = dlsym(handle, name);
    if (!p) { fprintf(stderr, "%s: %s\n", name, dlerror()); exit(1); }
    return p;
}

static engine load(const char *path)
{
    engine e;
    e.handle = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (!e.handle) { fprintf(stderr, "%s\n", dlerror()); exit(1); }
    e.sqr = (matrix_sqr_fn) symbol(e.handle, "nmod_poly_mat_sqr");
    e.interpolate = (interpolate_fn) symbol(e.handle, "nmod_poly_interpolate_nmod_vec");
    e.arb_eval = (arb_eval_fn) symbol(e.handle, "arb_poly_evaluate2");
    e.acb_eval = (acb_eval_fn) symbol(e.handle, "acb_poly_evaluate2");
    ((void (*)(int)) symbol(e.handle, "flint_set_num_threads"))(1);
    return e;
}

static void init(workload *w)
{
    if (!strcmp(w->kind, "nmod_sqr"))
    {
        nmod_poly_mat_init(w->matrix, w->size, w->size, w->modulus);
        nmod_poly_mat_init(w->matrix_reference, w->size, w->size, w->modulus);
        for (int e = 0; e < 2; e++)
            nmod_poly_mat_init(w->matrix_result[e], w->size, w->size, w->modulus);
        for (slong i = 0; i < w->size; i++)
            for (slong j = 0; j < w->size; j++)
                for (slong k = 0; k < w->length; k++)
                    nmod_poly_set_coeff_ui(nmod_poly_mat_entry(w->matrix, i, j),
                        k, random_word() % w->modulus);
        nmod_poly_mat_mul_classical(w->matrix_reference, w->matrix, w->matrix);
    }
    else if (!strcmp(w->kind, "nmod_interp"))
    {
        if (w->length > w->size || (ulong) w->size > w->modulus) abort();
        nmod_poly_init(w->poly, w->modulus);
        for (int e = 0; e < 2; e++) nmod_poly_init(w->poly_result[e], w->modulus);
        w->xs = _nmod_vec_init(w->size);
        w->ys = _nmod_vec_init(w->size);
        for (slong i = 0; i < w->length; i++)
            nmod_poly_set_coeff_ui(w->poly, i, random_word() % w->modulus);
        /* Consecutive points work over primes and composites whose least
           prime factor exceeds the point count. */
        for (slong i = 0; i < w->size; i++)
        {
            w->xs[i] = i;
            w->ys[i] = nmod_poly_evaluate_nmod(w->poly, i);
        }
    }
    else
    {
        flint_rand_t state;
        fmpz_t c;
        flint_rand_init(state);
        flint_rand_set_seed(state, random_word(), random_word());
        fmpz_init(c);
        arb_poly_init(w->real_poly);
        arb_poly_init(w->real_derivative);
        acb_poly_init(w->complex_poly);
        acb_poly_init(w->complex_derivative);
        arb_init(w->real_x);
        arb_init(w->real_ref_y); arb_init(w->real_ref_z);
        acb_init(w->complex_x);
        acb_init(w->complex_ref_y); acb_init(w->complex_ref_z);
        for (int e = 0; e < 2; e++)
        {
            arb_init(w->real_y[e]); arb_init(w->real_z[e]);
            acb_init(w->complex_y[e]); acb_init(w->complex_z[e]);
        }
        arb_poly_fit_length(w->real_poly, w->size);
        acb_poly_fit_length(w->complex_poly, w->size);
        for (slong i = 0; i < w->size; i++)
        {
            fmpz_randbits(c, state, w->length);
            arb_set_fmpz(w->real_poly->coeffs + i, c);
            arb_mul_2exp_si(w->real_poly->coeffs + i, w->real_poly->coeffs + i, -w->length);
            arb_set(acb_realref(w->complex_poly->coeffs + i), w->real_poly->coeffs + i);
            fmpz_randbits(c, state, w->length);
            arb_set_fmpz(acb_imagref(w->complex_poly->coeffs + i), c);
            arb_mul_2exp_si(acb_imagref(w->complex_poly->coeffs + i),
                acb_imagref(w->complex_poly->coeffs + i), -w->length);
        }
        _arb_poly_set_length(w->real_poly, w->size);
        _acb_poly_set_length(w->complex_poly, w->size);
        _arb_poly_normalise(w->real_poly);
        _acb_poly_normalise(w->complex_poly);
        fmpz_randbits(c, state, w->prec);
        fmpz_abs(c, c);
        arb_set_fmpz(w->real_x, c);
        arb_mul_2exp_si(w->real_x, w->real_x, -w->prec - 2);
        arb_add_ui(w->real_x, w->real_x, 1, ARF_PREC_EXACT);
        arb_mul_2exp_si(w->real_x, w->real_x, -1);
        arb_set(acb_realref(w->complex_x), w->real_x);
        arb_set_si(acb_imagref(w->complex_x), 1);
        arb_mul_2exp_si(acb_imagref(w->complex_x), acb_imagref(w->complex_x), -3);
        arb_poly_derivative(w->real_derivative, w->real_poly, ARF_PREC_EXACT);
        acb_poly_derivative(w->complex_derivative, w->complex_poly, ARF_PREC_EXACT);
        slong refprec = 2 * w->prec + 128;
        arb_poly_evaluate_horner(w->real_ref_y, w->real_poly, w->real_x, refprec);
        arb_poly_evaluate_horner(w->real_ref_z, w->real_derivative, w->real_x, refprec);
        acb_poly_evaluate_horner(w->complex_ref_y, w->complex_poly, w->complex_x, refprec);
        acb_poly_evaluate_horner(w->complex_ref_z, w->complex_derivative, w->complex_x, refprec);
        flint_rand_clear(state);
        fmpz_clear(c);
    }
}

static void call(workload *w, engine *e, int k)
{
    if (!strcmp(w->kind, "nmod_sqr")) e->sqr(w->matrix_result[k], w->matrix);
    else if (!strcmp(w->kind, "nmod_interp")) e->interpolate(w->poly_result[k], w->xs, w->ys, w->size);
    else if (!strcmp(w->kind, "arb_eval2")) e->arb_eval(w->real_y[k], w->real_z[k], w->real_poly, w->real_x, w->prec);
    else e->acb_eval(w->complex_y[k], w->complex_z[k], w->complex_poly, w->complex_x, w->prec);
}

static void check(workload *w, engine *engines)
{
    for (int k = 0; k < 2; k++)
    {
        call(w, engines + k, k);
        int ok;
        slong accuracy = 0;
        if (!strcmp(w->kind, "nmod_sqr"))
            ok = nmod_poly_mat_equal(w->matrix_result[k], w->matrix_reference);
        else if (!strcmp(w->kind, "nmod_interp"))
            ok = nmod_poly_equal(w->poly_result[k], w->poly);
        else if (!strcmp(w->kind, "arb_eval2"))
        {
            ok = arb_is_finite(w->real_y[k]) && arb_is_finite(w->real_z[k]) &&
                arb_overlaps(w->real_y[k], w->real_ref_y) && arb_overlaps(w->real_z[k], w->real_ref_z);
            accuracy = FLINT_MIN(arb_rel_accuracy_bits(w->real_y[k]), arb_rel_accuracy_bits(w->real_z[k]));
        }
        else
        {
            ok = acb_is_finite(w->complex_y[k]) && acb_is_finite(w->complex_z[k]) &&
                acb_overlaps(w->complex_y[k], w->complex_ref_y) && acb_overlaps(w->complex_z[k], w->complex_ref_z);
            accuracy = FLINT_MIN(acb_rel_accuracy_bits(w->complex_y[k]), acb_rel_accuracy_bits(w->complex_z[k]));
        }
        printf("{\"phase\":\"check\",\"engine\":%d,\"passed\":%s,\"accuracy\":%ld}\n",
            k, ok ? "true" : "false", accuracy);
        if (!ok) abort();
    }
}

static void batch(workload *w, engine *e, int k, ulong reps, uint64_t *wall, uint64_t *cpu)
{
    if (pthread_cpu_number_np(&diagnostic_cpu_start)) abort();
    uint64_t c = ticks(CLOCK_THREAD_CPUTIME_ID), t = ticks(CLOCK_MONOTONIC);
    for (ulong i = 0; i < reps; i++) call(w, e, k);
    *wall = ticks(CLOCK_MONOTONIC) - t;
    *cpu = ticks(CLOCK_THREAD_CPUTIME_ID) - c;
    if (pthread_cpu_number_np(&diagnostic_cpu_end)) abort();
}

static void clear(workload *w)
{
    if (!strcmp(w->kind, "nmod_sqr"))
    {
        nmod_poly_mat_clear(w->matrix); nmod_poly_mat_clear(w->matrix_reference);
        for (int k = 0; k < 2; k++) nmod_poly_mat_clear(w->matrix_result[k]);
    }
    else if (!strcmp(w->kind, "nmod_interp"))
    {
        nmod_poly_clear(w->poly);
        for (int k = 0; k < 2; k++) nmod_poly_clear(w->poly_result[k]);
        _nmod_vec_clear(w->xs); _nmod_vec_clear(w->ys);
    }
    else
    {
        arb_poly_clear(w->real_poly); arb_poly_clear(w->real_derivative);
        acb_poly_clear(w->complex_poly); acb_poly_clear(w->complex_derivative);
        arb_clear(w->real_x); arb_clear(w->real_ref_y); arb_clear(w->real_ref_z);
        acb_clear(w->complex_x); acb_clear(w->complex_ref_y); acb_clear(w->complex_ref_z);
        for (int k = 0; k < 2; k++)
        {
            arb_clear(w->real_y[k]); arb_clear(w->real_z[k]);
            acb_clear(w->complex_y[k]); acb_clear(w->complex_z[k]);
        }
    }
}

int main(int argc, char **argv)
{
    if (argc != 11)
    {
        fprintf(stderr, "usage: campaign kind base candidate size length prec modulus seed trials batch_ms\n");
        return 2;
    }
    workload w = {0};
    w.kind = argv[1];
    if (strcmp(w.kind, "nmod_sqr") && strcmp(w.kind, "nmod_interp") &&
        strcmp(w.kind, "arb_eval2") && strcmp(w.kind, "acb_eval2")) return 2;
    w.size = atol(argv[4]); w.length = atol(argv[5]); w.prec = atol(argv[6]);
    w.modulus = strtoul(argv[7], NULL, 10); rng = strtoull(argv[8], NULL, 10);
    int trials = atoi(argv[9]);
    ulong milliseconds = strtoul(argv[10], NULL, 10);
    engine engines[2] = {load(argv[2]), load(argv[3])};
    if (w.size < 1 || w.length < 1 || w.prec < 0 || !rng || trials < -1 || !milliseconds) return 2;
    if ((!strcmp(w.kind, "nmod_sqr") || !strcmp(w.kind, "nmod_interp")) && w.modulus < 2) return 2;
    for (int k = 0; k < 2; k++)
    {
        Dl_info info;
        void *function = !strcmp(w.kind, "nmod_sqr") ? (void *) engines[k].sqr :
            !strcmp(w.kind, "nmod_interp") ? (void *) engines[k].interpolate :
            !strcmp(w.kind, "arb_eval2") ? (void *) engines[k].arb_eval : (void *) engines[k].acb_eval;
        if (!dladdr(function, &info)) abort();
        printf("{\"phase\":\"address\",\"engine\":%d,\"public\":\"%p\","
               "\"image_base\":\"%p\",\"acb_dot\":\"%p\"}\n", k, function,
               info.dli_fbase, symbol(engines[k].handle, "acb_dot"));
        printf("{\"phase\":\"binding\",\"engine\":%d,\"image\":\"%s\"}\n", k, info.dli_fname);
    }
    if (pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0)) return 1;
    flint_set_num_threads(1);
    init(&w);
    if (!strcmp(w.kind, "acb_eval2"))
    {
        uint64_t digest = UINT64_C(14695981039346656037);
        for (slong j = 0; j < w.complex_poly->length; j++)
        {
            digest_arb(&digest, acb_realref(w.complex_poly->coeffs + j));
            digest_arb(&digest, acb_imagref(w.complex_poly->coeffs + j));
        }
        digest_arb(&digest, acb_realref(w.complex_x));
        digest_arb(&digest, acb_imagref(w.complex_x));
        printf("{\"phase\":\"input\",\"digest\":\"%016" PRIx64 "\"}\n", digest);
    }
    check(&w, engines);
    fflush(stdout);
    if (trials == -1)
    {
        uint64_t start = ticks(CLOCK_MONOTONIC);
        while (ticks(CLOCK_MONOTONIC) - start < milliseconds * UINT64_C(1000000))
            call(&w, engines, 0);
    }
    else if (trials > 0)
    {
        uint64_t start = ticks(CLOCK_MONOTONIC), wall[2], cpu[2];
        do {call(&w, engines, 0); call(&w, engines + 1, 1);}
        while (ticks(CLOCK_MONOTONIC) - start < UINT64_C(200000000));
        ulong reps = 1;
        for (;;)
        {
            for (int k = 0; k < 2; k++) batch(&w, engines + k, k, reps, wall + k, cpu + k);
            if (cpu[0] >= milliseconds * UINT64_C(1000000) &&
                cpu[1] >= milliseconds * UINT64_C(1000000)) break;
            if (reps > (1UL << 28)) abort();
            reps *= 2;
        }
        for (int t = 0; t < trials; t++)
        {
            int first = t & 1, order[4] = {first, 1 - first, 1 - first, first};
            for (int pos = 0; pos < 4; pos++)
            {
                int k = order[pos];
                batch(&w, engines + k, k, reps, wall + k, cpu + k);
                printf("{\"phase\":\"placement\",\"trial\":%d,\"engine\":%d,"
                       "\"start\":%zu,\"end\":%zu}\n", t, k,
                       diagnostic_cpu_start, diagnostic_cpu_end);
                printf("{\"phase\":\"timing\",\"trial\":%d,\"position\":%d,\"engine\":%d,"
                    "\"iterations\":%lu,\"ns_per_op\":%.9f,\"cpu_ns_per_op\":%.9f}\n",
                    t, pos, k, reps, (double) wall[k] / reps, (double) cpu[k] / reps);
            }
            fflush(stdout);
        }
        check(&w, engines);
    }
    clear(&w);
    if (engines[0].handle != engines[1].handle)
        ((void (*)(void)) symbol(engines[1].handle, "flint_cleanup_master"))();
    ((void (*)(void)) symbol(engines[0].handle, "flint_cleanup_master"))();
    flint_cleanup_master();
    return 0;
}
