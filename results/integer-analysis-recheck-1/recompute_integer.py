#!/usr/bin/env python3
"""Independent stdlib recompute of results/confirmation-analysis.json point estimates.

Written without importing the project's scripts. Usage:
  python3 -I recompute_integer.py REPO_DIR
Point estimates must match exactly (to 1e-9 pct); bootstrap intervals are recomputed with
an unrelated RNG and seed, so they're compared only to within a stated tolerance.
"""
import json, math, random, sys
from pathlib import Path

repo = Path(sys.argv[1])
stored = {r['run']: r for r in json.loads((repo/'results/confirmation-analysis.json').read_text())}
plan = json.loads((repo/'experiments/c3-confirmation-plan.json').read_text())
lo, hi = plan['primary_interval_limbs']
TOL_CI = 0.15  # pct points allowed between independent bootstrap replicates
fails = checks = 0

def pct(x): return 100.0*(1.0-math.exp(-x))

for run, rep in stored.items():
    rows = [json.loads(l) for l in (repo/'results'/run/'raw.jsonl').read_text().splitlines() if l.strip()]
    for metric, label in (('ns_per_op', 'wall'), ('cpu_ns_per_op', 'cpu')):
        cases = {}
        for r in rows:
            cases.setdefault((r['an'], r['bn'], r['operation']), {}).setdefault(r['trial'], []).append(r)
        series = {}
        for key, trials in cases.items():
            seq = []
            for t in sorted(trials):
                q = sorted(trials[t], key=lambda r: r['position'])
                eng = [r['engine'] for r in q]
                ok = eng in ([0, 1, 1, 0], [1, 0, 0, 1]) and eng[0] == t % 2
                checks += 1
                if not ok or len({r['iterations'] for r in q}) != 1:
                    fails += 1; print('FAIL quartet', run, key, t, eng)
                a = sum(r[metric] for r in q if r['engine'] == 0)/2
                b = sum(r[metric] for r in q if r['engine'] == 1)/2
                seq.append(math.log(a/b))
            series[key] = seq
        for shape, s_rep in rep['metrics'][label].items():
            sel = sorted(k for k in series if lo <= k[0] <= hi and (
                k[2] == 'sqr' if shape == 'sqr' else k[2] == 'mul' and ((k[0] == k[1]) == (shape == 'mul'))))
            mean = sum(sum(series[k])/len(series[k]) for k in sel)/len(sel)
            checks += 2
            if len(sel) != s_rep['cases']: fails += 1; print('FAIL cases', run, label, shape)
            if abs(pct(mean) - s_rep['reduction_pct']) > 1e-9:
                fails += 1; print('FAIL point', run, label, shape, pct(mean), s_rep['reduction_pct'])
            rng = random.SystemRandom()
            boot = []
            for _ in range(4000):
                ms = []
                for k in sel:
                    s = series[k]; n = len(s); blk = min(5, max(1, n//4)); d = []
                    while len(d) < n:
                        st = rng.randrange(n); d += [s[(st+j) % n] for j in range(blk)]
                    ms.append(sum(d[:n])/n)
                boot.append(sum(ms)/len(ms))
            boot.sort()
            clo, chi = pct(boot[100]), pct(boot[3900])
            checks += 1
            dev = max(abs(clo - s_rep['ci95_low_pct']), abs(chi - s_rep['ci95_high_pct']))
            if dev > TOL_CI: fails += 1; print('FAIL ci', run, label, shape, clo, chi, s_rep)
            print(f"{run:22s} {label:4s} {shape:10s} n={len(sel):2d} sizes={sorted({k[0] for k in sel})} "
                  f"point={pct(mean):+.4f} stored={s_rep['reduction_pct']:+.4f} "
                  f"ci=[{clo:+.2f},{chi:+.2f}] stored=[{s_rep['ci95_low_pct']:+.2f},{s_rep['ci95_high_pct']:+.2f}]")
print(f"checks={checks} failures={fails}")
sys.exit(1 if fails else 0)
