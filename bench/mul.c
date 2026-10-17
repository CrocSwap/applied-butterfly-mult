#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "flint.h"
#include "mpn_extras.h"

static volatile mp_limb_t sink;
static uint64_t rng = UINT64_C(0x65cc9379be3a6241);

static uint64_t random_word(void)
{
    rng ^= rng << 13; rng ^= rng >> 7; rng ^= rng << 17;
    return rng;
}

static uint64_t now_ns(void)
{
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t)) { perror("clock_gettime"); exit(1); }
    return (uint64_t)t.tv_sec * UINT64_C(1000000000) + t.tv_nsec;
}

static size_t number(const char *s, size_t maximum)
{
    char *end;
    errno = 0;
    unsigned long long x = strtoull(s, &end, 10);
    if (errno || !*s || *end || *s == '-' || x > maximum) {
        fprintf(stderr, "invalid numeric argument: %s\n", s); exit(2);
    }
    return (size_t)x;
}

static void multiply(int engine, int square, mp_ptr z, mp_srcptr a,
                     size_t an, mp_srcptr b, size_t bn)
{
    if (engine == 0) {
        if (square) flint_mpn_sqr(z, a, an);
        else flint_mpn_mul(z, a, an, b, bn);
    } else {
        if (square) mpn_sqr(z, a, an);
        else mpn_mul(z, a, an, b, bn);
    }
}

static uint64_t batch(int engine, int square, mp_ptr z, mp_srcptr a,
                      size_t an, mp_srcptr b, size_t bn, size_t count)
{
    uint64_t start = now_ns();
    for (size_t i = 0; i < count; i++) multiply(engine, square, z, a, an, b, bn);
    uint64_t elapsed = now_ns() - start;
    sink ^= z[0];
    return elapsed;
}

int main(int argc, char **argv)
{
    if (argc != 6) {
        fprintf(stderr, "usage: %s an bn mul|sqr samples target_ms\n"
                        "samples=0 profiles FLINT alone for target_ms\n", argv[0]);
        return 2;
    }
    size_t an = number(argv[1], 1u << 26), bn = number(argv[2], 1u << 26);
    int square = !strcmp(argv[3], "sqr");
    size_t samples = number(argv[4], 10000), ms = number(argv[5], 600000);
    if ((!square && strcmp(argv[3], "mul")) || !bn || an < bn ||
        (square && an != bn) || !ms) return 2;
    mp_ptr a = malloc(an * sizeof(*a)), b = malloc(bn * sizeof(*b));
    mp_ptr z = malloc((an + bn) * sizeof(*z)), ref = malloc((an + bn) * sizeof(*ref));
    if (!a || !b || !z || !ref) { fprintf(stderr, "allocation failed\n"); return 1; }
    flint_set_num_threads(1);
    /* Exact cross-checks: all ones, alternating bits, sparse powers, random. */
    for (int pattern = 0; pattern < 4; pattern++) {
        for (size_t i = 0; i < an; i++)
            a[i] = pattern == 0 ? ~(mp_limb_t)0 : pattern == 1 ?
                UINT64_C(0xaaaaaaaaaaaaaaaa) : pattern == 2 ? 0 : random_word();
        for (size_t i = 0; i < bn; i++)
            b[i] = pattern == 0 ? ~(mp_limb_t)0 : pattern == 1 ?
                UINT64_C(0x5555555555555555) : pattern == 2 ? 0 : random_word();
        a[an-1] |= (mp_limb_t)1 << (GMP_NUMB_BITS-1);
        b[bn-1] |= (mp_limb_t)1 << (GMP_NUMB_BITS-1);
        multiply(0, square, z, a, an, b, bn);
        multiply(1, square, ref, a, an, b, bn);
        if (memcmp(z, ref, (an+bn)*sizeof(*z))) {
            fprintf(stderr, "mismatch: an=%zu bn=%zu pattern=%d\n", an, bn, pattern);
            return 1;
        }
    }
    if (!samples) {
        uint64_t start = now_ns(), elapsed;
        size_t count = 0;
        do {
            multiply(0, square, z, a, an, b, bn); count++;
            elapsed = now_ns() - start;
        } while (elapsed < ms * UINT64_C(1000000));
        printf("{\"profile_iterations\":%zu,\"elapsed_ns\":%" PRIu64 "}\n", count, elapsed);
    } else {
        size_t counts[2] = {1, 1};
        for (int engine = 0; engine < 2; engine++) {
            uint64_t elapsed;
            while ((elapsed = batch(engine, square, z, a, an, b, bn, counts[engine])) <
                   ms * UINT64_C(1000000) / 2 && counts[engine] < (1u << 24))
                counts[engine] *= 2;
        }
        /* Alternate AB/BA to reduce systematic order bias. */
        for (size_t trial = 0; trial < samples; trial++) {
            for (int position = 0; position < 2; position++) {
                int engine = (trial + position) % 2;
                uint64_t elapsed = batch(engine, square, z, a, an, b, bn, counts[engine]);
                printf("{\"an\":%zu,\"bn\":%zu,\"operation\":\"%s\","
                       "\"trial\":%zu,\"engine\":\"%s\",\"iterations\":%zu,"
                       "\"elapsed_ns\":%" PRIu64 ",\"ns_per_op\":%.3f}\n",
                       an, bn, argv[3], trial, engine ? "gmp" : "flint",
                       counts[engine], elapsed, (double)elapsed/counts[engine]);
            }
        }
    }
    free(a); free(b); free(z); free(ref);
    flint_cleanup_master();
    return 0;
}
