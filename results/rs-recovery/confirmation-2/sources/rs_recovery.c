/* Prime-field RS erasure recovery. One selected FLINT image per process.
   Encoding is independently performed in Python; timing includes recovery
   allocation, survivor gathering, interpolation and byte serialization. */
#define _DARWIN_C_SOURCE
#include <dlfcn.h>
#include <inttypes.h>
#include <pthread.h>
#include <pthread/qos.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "nmod_poly.h"

typedef struct {
    void *handle;
    void (*init)(nmod_poly_t, ulong);
    void (*clear)(nmod_poly_t);
    void (*fit)(nmod_poly_t, slong);
    void (*interp)(nmod_poly_t, nn_srcptr, nn_srcptr, slong);
    nn_ptr *(*tree_alloc)(slong);
    void (*tree_free)(nn_ptr *, slong);
    void (*tree_build)(nn_ptr *, nn_srcptr, slong, nmod_t);
    void (*weights)(nn_ptr, const nn_ptr *, slong, nmod_t);
    void (*precomp)(nn_ptr, nn_srcptr, const nn_ptr *, nn_srcptr, slong, nmod_t);
    void (*threads)(int);
    void (*cleanup)(void);
} engine;

typedef struct {
    size_t k, n, width, blocks;
    ulong p;
    unsigned char *payload;
    ulong *code, *masks;
    nmod_t mod;
} fixture;

typedef struct { nn_ptr *tree; nn_ptr weights; } decoder;
static volatile uint64_t sink;

static void require(int ok, const char *why) {
    if (!ok) { fprintf(stderr, "%s\n", why); exit(1); }
}
static void *alloc(size_t n) {
    void *p = malloc(n); require(p != NULL, "allocation failed"); return p;
}
static uint64_t ticks(clockid_t id) {
    struct timespec t;
    require(!clock_gettime(id, &t), "clock failed");
    return (uint64_t)t.tv_sec * UINT64_C(1000000000) + t.tv_nsec;
}
static void *symbol(void *h, const char *name) {
    void *p = dlsym(h, name); require(p != NULL, name);
    Dl_info info;
    require(dladdr(p, &info) != 0, "dladdr failed");
    printf("{\"phase\":\"binding\",\"symbol\":\"%s\",\"image\":\"%s\"}\n", name, info.dli_fname);
    return p;
}
static engine load(const char *path) {
    engine e;
    e.handle = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (!e.handle) { fprintf(stderr, "%s\n", dlerror()); exit(1); }
#define LOAD(field, name) e.field = (__typeof__(e.field))symbol(e.handle, name)
    LOAD(init, "nmod_poly_init"); LOAD(clear, "nmod_poly_clear");
    LOAD(fit, "nmod_poly_fit_length"); LOAD(interp, "nmod_poly_interpolate_nmod_vec");
    LOAD(tree_alloc, "_nmod_poly_tree_alloc"); LOAD(tree_free, "_nmod_poly_tree_free");
    LOAD(tree_build, "_nmod_poly_tree_build"); LOAD(weights, "_nmod_poly_interpolation_weights");
    LOAD(precomp, "_nmod_poly_interpolate_nmod_vec_fast_precomp");
    LOAD(threads, "flint_set_num_threads"); LOAD(cleanup, "flint_cleanup_master");
#undef LOAD
    e.threads(1); return e;
}
static uint64_t read64(FILE *file) {
    unsigned char b[8]; uint64_t v = 0;
    require(fread(b, 1, 8, file) == 8, "short fixture");
    for (int i = 7; i >= 0; i--) v = (v << 8) | b[i];
    return v;
}
static fixture read_fixture(const char *path, engine *e) {
    fixture f; char magic[8];
    FILE *file = fopen(path, "rb"); require(file != NULL, "open fixture");
    require(fread(magic, 1, 8, file) == 8 && !memcmp(magic, "RSERASE1", 8), "fixture magic");
    f.k = read64(file); f.n = read64(file); f.width = read64(file);
    f.blocks = read64(file); f.p = read64(file);
    require(f.k >= 16 && f.k <= 1024 && f.n == 2*f.k && f.blocks == 16 &&
            (f.width == 3 || f.width == 7) && f.p > f.n, "fixture dimensions");
    f.payload = alloc(f.blocks*f.k*f.width);
    f.code = alloc(f.blocks*f.n*sizeof(ulong)); f.masks = alloc(f.blocks*f.k*sizeof(ulong));
    require(fread(f.payload, 1, f.blocks*f.k*f.width, file) == f.blocks*f.k*f.width, "payload");
    for (size_t i = 0; i < f.blocks*f.n; i++) {
        f.code[i] = read64(file); require(f.code[i] < f.p, "noncanonical symbol");
    }
    for (size_t j = 0; j < f.blocks; j++) {
        unsigned char *seen = calloc(f.n, 1); require(seen != NULL, "seen");
        for (size_t i = 0; i < f.k; i++) {
            ulong x = read64(file); require(x < f.n && !seen[x], "invalid survivor set");
            seen[x] = 1; f.masks[j*f.k+i] = x;
        }
        free(seen);
    }
    require(fgetc(file) == EOF, "trailing fixture data"); fclose(file);
    nmod_poly_t temp; e->init(temp, f.p); f.mod = temp->mod; e->clear(temp);
    return f;
}
static decoder prepare(engine *e, const fixture *f) {
    decoder d; nn_ptr xs = alloc(f->k*sizeof(ulong));
    for (size_t i = 0; i < f->k; i++) xs[i] = f->masks[i] + 1;
    d.tree = e->tree_alloc(f->k); e->tree_build(d.tree, xs, f->k, f->mod);
    d.weights = alloc(f->k*sizeof(ulong));
    e->weights(d.weights, d.tree, f->k, f->mod); free(xs); return d;
}
static void release(engine *e, const fixture *f, decoder *d) {
    free(d->weights); e->tree_free(d->tree, f->k);
}
static void recover(engine *e, const fixture *f, size_t j, decoder *d, int check) {
    nn_ptr xs = d ? NULL : alloc(f->k*sizeof(ulong));
    nn_ptr ys = alloc(f->k*sizeof(ulong));
    unsigned char *bytes = alloc(f->k*f->width);
    const ulong *mask = f->masks + (d ? 0 : j*f->k);
    for (size_t i = 0; i < f->k; i++) {
        if (xs) xs[i] = mask[i] + 1;
        ys[i] = f->code[j*f->n + mask[i]];
    }
    nmod_poly_t poly; e->init(poly, f->p);
    if (d) {
        e->fit(poly, f->k);
        e->precomp(poly->coeffs, ys, d->tree, d->weights, f->k, f->mod);
        poly->length = f->k;
    } else e->interp(poly, xs, ys, f->k);
    int valid = 1;
    for (size_t i = 0; i < f->k; i++) {
        ulong v = i < (size_t)poly->length ? poly->coeffs[i] : 0;
        valid &= (v >> (8*f->width)) == 0;
        for (size_t b = 0; b < f->width; b++) bytes[i*f->width+b] = (unsigned char)(v >> (8*b));
    }
    require(valid, "decoded symbol outside byte-payload range");
    if (check) require(!memcmp(bytes, f->payload+j*f->k*f->width, f->k*f->width), "incorrect recovery");
    /* Consume all serialized bytes; the output cannot be optimized away. */
    uint64_t sum = 0;
    for (size_t i = 0; i < f->k*f->width; i++) sum += bytes[i];
    sink += sum;
    e->clear(poly); free(xs); free(ys); free(bytes);
}
static void operation(engine *e, const fixture *f, int mode, decoder *cached, size_t j, int check) {
    if (mode == 1) {
        decoder d = prepare(e, f);
        for (size_t b = 0; b < f->blocks; b++) recover(e, f, b, &d, check);
        release(e, f, &d);
    } else recover(e, f, j % f->blocks, mode == 2 ? cached : NULL, check);
}
int main(int argc, char **argv) {
    require(argc == 5, "usage: rs_recovery LIB FIXTURE MODE(0,1,2) MILLISECONDS(0=check)");
    int mode = atoi(argv[3]), ms = atoi(argv[4]);
    require(mode >= 0 && mode <= 2 && ms >= 0 && ms <= 1000, "invalid arguments");
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
    engine e = load(argv[1]); fixture f = read_fixture(argv[2], &e);
    decoder cached = {0}; if (mode == 2) cached = prepare(&e, &f);
    for (int pass = 0; pass < 2; pass++) {
        if (mode == 1) operation(&e, &f, mode, &cached, 0, 1);
        else for (size_t j = 0; j < f.blocks; j++) operation(&e, &f, mode, &cached, j, 1);
        printf("{\"phase\":\"check\",\"passed\":true,\"blocks\":%zu,\"bytes\":%zu}\n", f.blocks, f.blocks*f.k*f.width);
        if (pass == 0 && ms) {
            uint64_t start = ticks(CLOCK_THREAD_CPUTIME_ID); size_t it = 0;
            do { operation(&e, &f, mode, &cached, it++, 0); }
            while (ticks(CLOCK_THREAD_CPUTIME_ID) - start < 100000000);
            size_t reps = 1;
            for (;;) {
                start = ticks(CLOCK_THREAD_CPUTIME_ID);
                for (size_t i = 0; i < reps; i++) operation(&e, &f, mode, &cached, i, 0);
                if (ticks(CLOCK_THREAD_CPUTIME_ID) - start >= (uint64_t)ms*1000000) break;
                require(reps < (1UL << 25), "calibration limit"); reps *= 2;
            }
            for (int batch = 0; batch < 4; batch++) {
                uint64_t wall = ticks(CLOCK_MONOTONIC), cpu = ticks(CLOCK_THREAD_CPUTIME_ID);
                for (size_t i = 0; i < reps; i++) operation(&e, &f, mode, &cached, i, 0);
                cpu = ticks(CLOCK_THREAD_CPUTIME_ID) - cpu; wall = ticks(CLOCK_MONOTONIC) - wall;
                double blocks = (double)reps*(mode == 1 ? f.blocks : 1);
                printf("{\"phase\":\"timing\",\"batch\":%d,\"repetitions\":%zu,\"blocks\":%.0f,\"cpu_ns_per_block\":%.9f,\"wall_ns_per_block\":%.9f}\n",
                       batch, reps, blocks, cpu/blocks, wall/blocks);
            }
        }
    }
    if (mode == 2) release(&e, &f, &cached);
    free(f.payload); free(f.code); free(f.masks); e.cleanup(); dlclose(e.handle);
    return 0;
}
