"""Independent recheck of results/poly-prepared-audit.json against committed raw.jsonl.
Reimplements the summary statistics (does not import project code). Usage: recheck.py REPO"""
import hashlib, json, math, random, statistics, sys
from pathlib import Path
R = Path(sys.argv[1]).resolve()
rd = lambda p: json.loads((R/p).read_text())
K = lambda r: (r['dim'], r['length'], r['modulus'], r['window'])
mism = []; nfields = 0

def summ(rows, metric, B=4000):
    g = {}
    for r in rows: g.setdefault(r['trial'], {0: [], 1: []})[r['engine']].append(r[metric])
    logs = [math.log(statistics.mean(x[0])/statistics.mean(x[1])) for _, x in sorted(g.items())]
    blk = min(5, max(1, len(logs)//4)); rng = random.Random(67341); d = []
    for _ in range(B):
        s = []
        while len(s) < len(logs):
            st = rng.randrange(len(logs)); s.extend(logs[(st+j) % len(logs)] for j in range(blk))
        d.append(statistics.mean(s[:len(logs)]))
    d.sort(); f = lambda x: 100*(1-math.exp(-x))
    return {'reduction_pct': f(statistics.mean(logs)), 'ci95_low_pct': f(d[int(B*.025)]),
            'ci95_high_pct': f(d[int(B*.975)]),
            'baseline_median_ns': statistics.median(r[metric] for r in rows if r['engine'] == 0),
            'candidate_median_ns': statistics.median(r[metric] for r in rows if r['engine'] == 1),
            'quartets': len(logs), 'bootstrap_block': blk}

audit = rd('results/poly-prepared-audit.json')
# 1. hashes recorded in the audit (all files it tracked)
def hcheck(mp):
    miss = [p for p in mp if not (R/p).is_file()]
    bad = [p for p, h in mp.items() if (R/p).is_file() and hashlib.sha256((R/p).read_bytes()).hexdigest() != h]
    return len(mp)-len(miss), miss, bad
n, miss, bad = hcheck(audit['sha256'])
print('audit sha256 entries:', len(audit['sha256']), 'present+checked:', n, 'absent (build artifacts):', len(miss), 'MISMATCHED:', bad)
print('  absent are all under .deps/ or build/:', all(p.startswith(('.deps/', 'build/')) for p in miss))
runs = ['poly-prepared-screen','poly-prepared-aa','poly-prepared-confirm','poly-prepared-repeat',
        'poly-contiguous-ablation','poly-preparation-ablation','poly-prepared-versus-tile']
S = {}
for name in runs:
    p = Path('results')/name; m = rd(p/'metadata.json')
    hn, hm, hb = hcheck(m['sha256'])
    rows = [json.loads(l) for l in (R/p/'raw.jsonl').read_text().splitlines()]
    warm = [r for r in rows if r['phase'] == 'warm']; chk = [r for r in rows if r['phase'] == 'correctness']
    cases = {}
    for r in warm: cases.setdefault(K(r), []).append(r)
    cnt = {'cases': len(cases), 'batches': len(warm), 'comparisons': sum(r['comparisons'] for r in chk)}
    if cnt != audit['runs'][name]: mism.append((name, 'counts', cnt, audit['runs'][name]))
    summary = rd(p/'summary.json'); S[name] = summary
    for s in summary:
        rk = s['dim'], s['length'], s['modulus'], 'middle' if s['window'] == 'mid' else 'full'
        for field, metric in [('cpu', 'cpu_ns_per_op'), ('wall', 'ns_per_op')]:
            mine = summ(cases[rk], metric)
            for k, v in mine.items():
                nfields += 1
                if not (abs(v - s[field][k]) <= 1e-9*max(1, abs(v))): mism.append((name, rk, field, k, v, s[field][k]))
    print(f'{name}: summaries={len(summary)} counts={cnt} metadata hashes checked={hn} absent={len(hm)} MISMATCHED={hb}')
a = {K(r): r for r in S['poly-prepared-confirm']}; b = {K(r): r for r in S['poly-prepared-repeat']}
act = [k for k in a if k[0] >= 4]
cp = [k for k in act if min(a[k]['cpu']['ci95_low_pct'], b[k]['cpu']['ci95_low_pct']) > 0]
wp = [k for k in act if min(a[k]['wall']['ci95_low_pct'], b[k]['wall']['ci95_low_pct']) > 0]
cn = [k for k in act if max(a[k]['cpu']['ci95_high_pct'], b[k]['cpu']['ci95_high_pct']) < 0]
print('eligible (dim>=4):', len(act), 'of', len(a), '| cpu+both', len(cp), 'wall+both', len(wp), 'cpu-both', len(cn),
      '| audit says', audit['cpu_positive_both'], audit['wall_positive_both'], audit['cpu_negative_both'])
red = [x[k]['cpu']['reduction_pct'] for x in (a, b) for k in act]
print('cpu reduction range over eligible cases, both runs: %.2f-%.2f%%' % (min(red), max(red)))
for nm, x in (('confirm', a), ('repeat', b)):
    v = [x[k]['cpu']['reduction_pct'] for k in act]; print(f'  {nm}: {min(v):.2f}-{max(v):.2f}%')
# audit's confirmation block must equal the summaries
ac = {(c['case']['dim'], c['case']['length'], c['case']['modulus'], c['case']['window']): c for c in audit['confirmation']}
for k in a:
    if ac[k]['confirm'] != {'cpu': a[k]['cpu'], 'wall': a[k]['wall']} or ac[k]['repeat'] != {'cpu': b[k]['cpu'], 'wall': b[k]['wall']}:
        mism.append(('audit.confirmation', k))
aa = S['poly-prepared-aa']
print('A/A control intervals containing 0:', sum(s[f]['ci95_low_pct'] <= 0 <= s[f]['ci95_high_pct'] for s in aa for f in ('cpu', 'wall')), 'of', 2*len(aa),
      [(K(s), round(s['cpu']['reduction_pct'], 3), round(s['cpu']['ci95_low_pct'], 3), round(s['cpu']['ci95_high_pct'], 3)) for s in aa])
print('summary fields recomputed:', nfields, 'mismatches:', len(mism)); [print(' ', x) for x in mism[:20]]
