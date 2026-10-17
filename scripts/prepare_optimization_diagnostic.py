#!/usr/bin/env python3
"""Copy the frozen timing harness and add diagnostic metadata outside timing."""
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / "bench/optimization_campaign.c").read_text()
source = source.replace("static uint64_t rng;", """static uint64_t rng;
static size_t diagnostic_cpu_start, diagnostic_cpu_end;

static void digest_arb(uint64_t *digest, const arb_t x)
{
    char *s = arb_dump_str(x);
    for (const unsigned char *p = (const unsigned char *) s; *p; p++)
        *digest = (*digest ^ *p) * UINT64_C(1099511628211);
    flint_free(s);
}
""")
source = source.replace("    uint64_t c = ticks(CLOCK_THREAD_CPUTIME_ID), t = ticks(CLOCK_MONOTONIC);", """    if (pthread_cpu_number_np(&diagnostic_cpu_start)) abort();
    uint64_t c = ticks(CLOCK_THREAD_CPUTIME_ID), t = ticks(CLOCK_MONOTONIC);""")
source = source.replace("    *cpu = ticks(CLOCK_THREAD_CPUTIME_ID) - c;", """    *cpu = ticks(CLOCK_THREAD_CPUTIME_ID) - c;
    if (pthread_cpu_number_np(&diagnostic_cpu_end)) abort();""")
source = source.replace("    init(&w);", r'''    init(&w);
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
    }''')
source = source.replace("        if (!dladdr(function, &info)) abort();", r'''        if (!dladdr(function, &info)) abort();
        printf("{\"phase\":\"address\",\"engine\":%d,\"public\":\"%p\","
               "\"image_base\":\"%p\",\"acb_dot\":\"%p\"}\n", k, function,
               info.dli_fbase, symbol(engines[k].handle, "acb_dot"));''')
marker = "                batch(&w, engines + k, k, reps, wall + k, cpu + k);"
source = source.replace(marker, marker + r'''
                printf("{\"phase\":\"placement\",\"trial\":%d,\"engine\":%d,"
                       "\"start\":%zu,\"end\":%zu}\n", t, k,
                       diagnostic_cpu_start, diagnostic_cpu_end);''')
output = ROOT / "bench/optimization_campaign_diagnostic.c"
if output.exists():
    raise FileExistsError(output)
output.write_text(source)
