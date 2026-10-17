/* The shared resident-library utilities and input constructors are also used
   by the first campaign harness; this file adds complete series operations. */
#define main campaign_evaluation_main
#include "optimization_campaign.c"
#undef main

typedef void (*arb_exp_fn)(arb_poly_t, const arb_poly_t, slong, slong);
typedef void (*acb_exp_fn)(acb_poly_t, const acb_poly_t, slong, slong);

typedef struct
{
    workload input;
    int real;
    engine engines[2];
    arb_exp_fn real_fn[2];
    acb_exp_fn complex_fn[2];
    arb_poly_t real_result[2], real_reference;
    acb_poly_t complex_result[2], complex_reference;
} series_workload;

static void series_call(series_workload *s, int k)
{
    if (s->real)
        s->real_fn[k](s->real_result[k], s->input.real_poly, s->input.size, s->input.prec);
    else
        s->complex_fn[k](s->complex_result[k], s->input.complex_poly, s->input.size, s->input.prec);
}

static void series_check(series_workload *s)
{
    for (int k = 0; k < 2; k++)
    {
        slong accuracy = WORD_MAX;
        series_call(s, k);
        int ok = s->real ? arb_poly_overlaps(s->real_result[k], s->real_reference) :
                          acb_poly_overlaps(s->complex_result[k], s->complex_reference);
        for (slong j = 0; j < s->input.size; j++)
        {
            if (s->real)
            {
                arb_srcptr a = s->real_result[k]->coeffs + j;
                if (j >= s->real_result[k]->length) break;
                ok &= arb_is_finite(a);
                accuracy = FLINT_MIN(accuracy, arb_rel_one_accuracy_bits(a));
            }
            else
            {
                acb_srcptr a = s->complex_result[k]->coeffs + j;
                if (j >= s->complex_result[k]->length) break;
                ok &= acb_is_finite(a);
                accuracy = FLINT_MIN(accuracy, acb_rel_one_accuracy_bits(a));
            }
        }
        printf("{\"phase\":\"check\",\"engine\":%d,\"passed\":%s,\"accuracy\":%ld}\n",
            k, ok ? "true" : "false", accuracy);
        if (!ok) abort();
    }
}

static void series_batch(series_workload *s, int k, ulong reps, uint64_t *wall, uint64_t *cpu)
{
    uint64_t c = ticks(CLOCK_THREAD_CPUTIME_ID), t = ticks(CLOCK_MONOTONIC);
    for (ulong i = 0; i < reps; i++) series_call(s, k);
    *wall = ticks(CLOCK_MONOTONIC) - t;
    *cpu = ticks(CLOCK_THREAD_CPUTIME_ID) - c;
}

int main(int argc, char **argv)
{
    if (argc != 11)
    {
        fprintf(stderr, "usage: series arb_exp|acb_exp base candidate size bits prec fixture seed trials batch_ms\n");
        return 2;
    }
    series_workload s = {0};
    s.real = !strcmp(argv[1], "arb_exp");
    if (!s.real && strcmp(argv[1], "acb_exp")) return 2;
    s.input.kind = s.real ? "arb_eval2" : "acb_eval2";
    s.input.size = atol(argv[4]); s.input.length = atol(argv[5]); s.input.prec = atol(argv[6]);
    int fixture = atoi(argv[7]);
    rng = strtoull(argv[8], NULL, 10);
    int trials = atoi(argv[9]);
    ulong milliseconds = strtoul(argv[10], NULL, 10);
    if (s.input.size < 1 || s.input.length < 1 || s.input.prec < 2 || !rng || trials < -1 || !milliseconds) return 2;
    if (pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0)) return 1;
    flint_set_num_threads(1);
    for (int k = 0; k < 2; k++)
    {
        s.engines[k] = load(argv[k + 2]);
        s.real_fn[k] = (arb_exp_fn) symbol(s.engines[k].handle, "arb_poly_exp_series");
        s.complex_fn[k] = (acb_exp_fn) symbol(s.engines[k].handle, "acb_poly_exp_series");
        Dl_info info;
        if (!dladdr(s.real ? (void *) s.real_fn[k] : (void *) s.complex_fn[k], &info)) abort();
        printf("{\"phase\":\"binding\",\"engine\":%d,\"image\":\"%s\"}\n", k, info.dli_fname);
        arb_poly_init(s.real_result[k]); acb_poly_init(s.complex_result[k]);
    }
    init(&s.input);
    if (fixture != 1)
    {
        arb_zero(s.input.real_poly->coeffs);
        acb_zero(s.input.complex_poly->coeffs);
    }
    if (fixture == 2)
    {
        arb_poly_truncate(s.input.real_poly, s.input.size / 2);
        acb_poly_truncate(s.input.complex_poly, s.input.size / 2);
    }
    arb_poly_init(s.real_reference); acb_poly_init(s.complex_reference);
    if (s.real)
        arb_poly_exp_series_basecase(s.real_reference, s.input.real_poly, s.input.size, 2 * s.input.prec + 128);
    else
        acb_poly_exp_series_basecase(s.complex_reference, s.input.complex_poly, s.input.size, 2 * s.input.prec + 128);
    series_check(&s);
    fflush(stdout);
    if (trials == -1)
    {
        uint64_t start = ticks(CLOCK_MONOTONIC);
        while (ticks(CLOCK_MONOTONIC) - start < milliseconds * UINT64_C(1000000)) series_call(&s, 0);
    }
    else if (trials > 0)
    {
        uint64_t start = ticks(CLOCK_MONOTONIC), wall[2], cpu[2];
        do {series_call(&s, 0); series_call(&s, 1);}
        while (ticks(CLOCK_MONOTONIC) - start < UINT64_C(200000000));
        ulong reps = 1;
        for (;;)
        {
            for (int k = 0; k < 2; k++) series_batch(&s, k, reps, wall + k, cpu + k);
            if (cpu[0] >= milliseconds * UINT64_C(1000000) && cpu[1] >= milliseconds * UINT64_C(1000000)) break;
            if (reps > (1UL << 28)) abort();
            reps *= 2;
        }
        for (int t = 0; t < trials; t++)
        {
            int first = t & 1, order[4] = {first, 1 - first, 1 - first, first};
            for (int pos = 0; pos < 4; pos++)
            {
                int k = order[pos];
                series_batch(&s, k, reps, wall + k, cpu + k);
                printf("{\"phase\":\"timing\",\"trial\":%d,\"position\":%d,\"engine\":%d,"
                    "\"iterations\":%lu,\"ns_per_op\":%.9f,\"cpu_ns_per_op\":%.9f}\n",
                    t, pos, k, reps, (double) wall[k] / reps, (double) cpu[k] / reps);
            }
            fflush(stdout);
        }
        series_check(&s);
    }
    arb_poly_clear(s.real_reference); acb_poly_clear(s.complex_reference);
    for (int k = 0; k < 2; k++)
    {
        arb_poly_clear(s.real_result[k]); acb_poly_clear(s.complex_result[k]);
    }
    clear(&s.input);
    if (s.engines[0].handle != s.engines[1].handle)
        ((void (*)(void)) symbol(s.engines[1].handle, "flint_cleanup_master"))();
    ((void (*)(void)) symbol(s.engines[0].handle, "flint_cleanup_master"))();
    flint_cleanup_master();
    return 0;
}
