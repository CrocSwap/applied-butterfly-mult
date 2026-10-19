/* Exact check of the lane extraction used by the C3 patch on each backend:
   vec4d_convert_limited_vec4n + vec4n_store_unaligned (FLINT 657a2839,
   machine_vectors.h l.633/653 AVX2, l.2288/2293 NEON) versus the scalar
   (ulong) cast of patches/ablation-scalar-conversion.patch.
   Domain: integer-valued doubles in [0, 2^52). Failure control: values
   outside the domain must be detected as mismatches on AVX2. */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#if defined(__AVX2__)
#include <immintrin.h>
static void conv4(uint64_t *z, const double *a) {
    __m256d x = _mm256_loadu_pd(a), t = _mm256_set1_pd(0x1.0p52);
    _mm256_storeu_si256((__m256i *) z, _mm256_castpd_si256(_mm256_xor_pd(_mm256_add_pd(x, t), t)));
}
#define BACKEND "avx2"
#elif defined(__ARM_NEON)
#include <arm_neon.h>
static void conv4(uint64_t *z, const double *a) {
    /* FLINT NEON vec2d_convert_limited_vec2n (machine_vectors.h l.2228): vcvtnq */
    vst1q_u64(z, vcvtnq_u64_f64(vld1q_f64(a)));
    vst1q_u64(z + 2, vcvtnq_u64_f64(vld1q_f64(a + 2)));
}
#define BACKEND "neon"
#endif
static uint64_t s = 0x711a97e932757134ull;
static uint64_t rnd(void) { s ^= s << 13; s ^= s >> 7; s ^= s << 17; return s; }
static long check(const double *v, long n, long *bad) {
    uint64_t z[4]; double a[4]; long i, k; *bad = 0;
    for (i = 0; i + 4 <= n; i += 4) {
        memcpy(a, v + i, sizeof a); conv4(z, a);
        for (k = 0; k < 4; k++) if (z[k] != (uint64_t) a[k]) (*bad)++;
    }
    return i;
}
int main(void) {
    static double v[1 << 20]; long n = 0, bad, tot = 0, totbad = 0, r;
    /* edges, including 2^50-scale fft_small prime neighbourhoods */
    for (int e = 0; e < 52; e++) for (int d = -2; d <= 2; d++) {
        int64_t x = ((int64_t) 1 << e) + d; if (x >= 0 && x < ((int64_t) 1 << 52)) v[n++] = (double) x; }
    v[n++] = 0x1.0p52 - 1; while (n % 4) v[n++] = 0;
    tot += check(v, n, &bad); totbad += bad;
    for (r = 0; r < 64; r++) {
        for (n = 0; n < (1 << 20); n++) v[n] = (double) (rnd() >> 12);
        tot += check(v, n, &bad); totbad += bad;
    }
    printf("%s in-domain: %ld values, %ld mismatches\n", BACKEND, tot, totbad);
    double ctl[8] = {0x1.0p52, 0x1.0p53 + 2, 0.5, 1.5, 0x1.0p52 + 1, 3e15, 2.25, 7.75};
    check(ctl, 8, &bad);
    printf("%s failure control (out of domain): %ld/8 mismatches\n", BACKEND, bad);
    return totbad != 0;
}
