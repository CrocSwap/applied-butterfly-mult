"""Independent recheck of results/poly-prepared-audit.json from committed raw data.
Usage: python3 -I recheck.py REPO  (stdlib only; no FLINT checkout needed)."""
import hashlib, json, math, random, re, statistics, sys
from pathlib import Path
R = Path(sys.argv[1]).resolve()
fails = []; n_ok = 0
def ok(cond, msg):
    global n_ok
    if cond: n_ok += 1
    else: fails.append(msg)
def J(p): return json.loads((R/p).read_text())
missing=set()
def sha(p):
    if not (R/p).is_file(): missing.add(p); return 'MISSING'
    return hashlib.sha256((R/p).read_bytes()).hexdigest()

def boot(logs, B=4000):
    # independent re-implementation of the documented circular block bootstrap
    block = min(5, max(1, len(logs)//4)); rng = random.Random(67341); d = []
    for _ in range(B):
        s = []
        while len(s) < len(logs):
            st = rng.randrange(len(logs)); s += [logs[(st+j) % len(logs)] for j in range(block)]
        d.append(sum(s[:len(logs)])/len(logs))
    d.sort(); f = lambda x: 100*(1-math.exp(-x))
    return f(statistics.mean(logs)), f(d[int(B*.025)]), f(d[int(B*.975)]), block

audit = J('results/poly-prepared-audit.json')
# 1. every hash the audit pins
for p, h in audit['sha256'].items():
    if not (R/p).is_file(): missing.add(p); continue
    ok(sha(p) == h, f'audit hash {p}')
ok(audit['status'] == 'PASS', 'audit status')

# 2. per-run summaries recomputed from raw.jsonl
runs = ['poly-prepared-screen','poly-prepared-aa','poly-prepared-confirm','poly-prepared-repeat',
        'poly-contiguous-ablation','poly-preparation-ablation','poly-prepared-versus-tile']
summ = {}; maxdiff = 0.0
for name in runs:
    p = f'results/{name}'; m = J(p+'/metadata.json')
    for f, h in m['sha256'].items(): h2=sha(f); ok(h2 in (h,'MISSING'), f'{name} meta hash {f}')
    rows = [json.loads(l) for l in (R/p/'raw.jsonl').read_text().splitlines()]
    warm = [r for r in rows if r['phase']=='warm']; chk = [r for r in rows if r['phase']=='correctness']
    ok(all(r['comparisons']==6 for r in chk), f'{name} comparisons')
    bind = [r for r in rows if r['phase']=='binding']
    ok(len(bind)==2*len(chk)==2*len(m['plan']['cases']), f'{name} binding/check counts')
    ok(all(r['image']==(m['baseline'] if r['engine']==0 else m['candidate']) for r in bind), f'{name} binding images')
    by = {}
    for r in warm: by.setdefault((r['dim'],r['length'],r['modulus'],r['window']), []).append(r)
    ok(audit['runs'][name] == {'cases':len(by),'batches':len(warm),'comparisons':6*len(chk)}, f'{name} counts')
    S = J(p+'/summary.json'); summ[name] = S
    ok(len(S) == len(by), f'{name} #summaries {len(S)} vs {len(by)}')
    for s in S:
        w = 'middle' if s['window']=='mid' else s['window']
        rr = by.get((s['dim'],s['length'],s['modulus'],w)) or by.get((s['dim'],s['length'],s['modulus'],s['window']))
        ok(rr is not None, f'{name} raw for {s}')
        if rr is None: continue
        tr = {}
        for r in rr: tr.setdefault(r['trial'], []).append(r)
        for t, q in tr.items():
            q.sort(key=lambda r: r['position'])
            ok([r['engine'] for r in q] == [t%2,1-t%2,1-t%2,t%2], f'{name} ABBA order t={t}')
            ok(len({r['iterations'] for r in q}) == 1, f'{name} iterations t={t}')
        for fld, met in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
            logs = [math.log(statistics.mean(r[met] for r in tr[t] if r['engine']==0) /
                             statistics.mean(r[met] for r in tr[t] if r['engine']==1)) for t in sorted(tr)]
            red, lo, hi, blk = boot(logs); x = s[fld]
            for a, b, lab in [(red,x['reduction_pct'],'red'),(lo,x['ci95_low_pct'],'lo'),(hi,x['ci95_high_pct'],'hi'),
                              (statistics.median(r[met] for r in rr if r['engine']==0), x['baseline_median_ns'],'bmed'),
                              (statistics.median(r[met] for r in rr if r['engine']==1), x['candidate_median_ns'],'cmed')]:
                maxdiff = max(maxdiff, abs(a-b)); ok(abs(a-b) < 1e-9, f'{name} {s["dim"]},{s["length"]},{s["modulus"]},{s["window"]} {fld} {lab} {a} vs {b}')
            ok(x['quartets']==len(logs) and x['bootstrap_block']==blk, f'{name} quartets/block')

# 3. paired confirmation table and headline counts in the audit
key = lambda r: (r['dim'],r['length'],r['modulus'],r['window'])
a = {key(r): r for r in summ['poly-prepared-confirm']}; b = {key(r): r for r in summ['poly-prepared-repeat']}
ok(set(a)==set(b) and len(a)==32, 'confirm/repeat case sets')
conf = {tuple(c['case'][k] for k in ['dim','length','modulus','window']): c for c in audit['confirmation']}
ok(set(conf)==set(a), 'audit confirmation cases')
pos = {'cpu':0,'wall':0}; neg = 0; active_pts = []
for k in a:
    act = k[0] >= 4; c = conf[k]
    ok(c['active']==act, f'active {k}')
    for f in ['cpu','wall']:
        v = act and min(a[k][f]['ci95_low_pct'], b[k][f]['ci95_low_pct']) > 0; pos[f] += v
        ok(c[f+'_positive_both']==v, f'{f}_positive_both {k}')
        ok(c['confirm'][f]==a[k][f] and c['repeat'][f]==b[k][f], f'audit copy {k} {f}')
    nv = act and max(a[k]['cpu']['ci95_high_pct'], b[k]['cpu']['ci95_high_pct']) < 0; neg += nv
    ok(c['cpu_negative_both']==nv, f'neg {k}')
    if act: active_pts += [a[k]['cpu']['reduction_pct'], b[k]['cpu']['reduction_pct']]
ok(audit['cpu_positive_both']==pos['cpu']==30, f"cpu_positive_both {audit['cpu_positive_both']} {pos['cpu']}")
ok(audit['wall_positive_both']==pos['wall']==30, f"wall_positive_both {audit['wall_positive_both']} {pos['wall']}")
ok(audit['cpu_negative_both']==neg==0, 'cpu_negative_both')
lo_, hi_ = min(active_pts), max(active_pts)
ok(f'{lo_:.2f}'=='4.34' and f'{hi_:.2f}'=='15.09', f'frontier range {lo_:.4f}-{hi_:.4f}')

# 4. coverage expectations
cov = J('results/poly-prepared-coverage/coverage.json')
ok(cov['status']=='PASS' and len(cov['cases'])==64, 'coverage status/len')
for f, h in cov['sha256'].items(): h2=sha(f); ok(h2 in (h,'MISSING'), f'coverage hash {f}')
for r in cov['cases']:
    act = r['dim']>=4; prep = act and r['library']=='poly-prepared'; np_ = 1 if r['modulus']==0x3f00000000001 else 2
    ok(r['dot_calls']==r['dot_successes']==(r['dim']**2 if act else 0), f'cov dot {r}')
    ok(r['prepared_inputs']==(r['dim']**2 if prep else 0), f'cov prep {r}')
    ok(r['prepared_slots']==(r['dim']**2*np_*(1<<(2*r['length']+2).bit_length()) if prep else 0), f'cov slots {r}')

# 5. validation + assembly figures copied into the audit
for name in ['poly-prepared','poly-contiguous-control']:
    p = f'results/{name}-checks'; v = J(p+'/validation.json'); ok(v['status']=='PASS', f'{name} validation')
    for f in ['test_poly_dot','test_poly_matrix','matrix-trace']:
        ok(J(f'{p}/{f}.json')==audit['validation'][name][f], f'{name} validation copy {f}')
    ok((R/p/'upstream.txt').read_text().count('PASS')==3, f'{name} upstream PASS x3')
    src = (R/f'results/{name}-build/gr.s').read_text(errors='replace')
    for sym in ['_bf_normalize','_bf_contiguous']:
        st = src.index('_'+sym+':'); body = src[st:src.index('.cfi_endproc', st)]
        ins = [l.strip() for l in body.splitlines() if re.match(r'^\s+[a-z]+(?:\.[a-z0-9]+)?\s', l)]
        got = {'instructions':len(ins),'frintn':sum(l.startswith('frintn') for l in ins),'stack_references':sum('[sp' in l for l in ins)}
        ok(got==audit['assembly'][name][sym], f'asm {name} {sym} {got}')

old = J('results/poly-kernel-audit.json'); nm = 0
for f, h in old['sha256'].items():
    if not (R/f).is_file(): nm += 1; continue
    ok(sha(f)==h, f'prior kernel hash {f}')
ok(audit['prior_kernel_evidence_hashes_unchanged']==len(old['sha256']), 'prior kernel count')
print(f'prior kernel audit: {len(old["sha256"])} pinned, {nm} not in repo')
# 6. doc table (docs/prepared-inputs-m2.md "Every confirmation case") vs summaries
names = {'g':1000000007,'p':0x3f00000000001}; nrows = 0
for line in (R/'docs/prepared-inputs-m2.md').read_text().splitlines():
    m = re.match(r'\|\s*(\d)×\d\s*\|\s*(\d+)\s*\|\s*([gp])\s*\|\s*(full|mid)\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|$', line)
    if not m: continue
    k = (int(m[1]), int(m[2]), names[m[3]], m[4]); nrows += 1
    for cell, src in [(m[5], a), (m[6], b)]:
        c = src[k]['cpu']; exp = f"{c['reduction_pct']:+.2f}% [{c['ci95_low_pct']:+.2f}, {c['ci95_high_pct']:+.2f}]"
        ok(cell == exp, f'doc row {k}: "{cell}" vs "{exp}"')
ok(nrows == 32, f'doc rows {nrows}')
print(f'checks passed: {n_ok}; failed: {len(fails)}; max |recomputed - stored| = {maxdiff:.3g}')
print(f'audit pins {len(audit["sha256"])} files; not in repo (unchecked, {len(missing)}):', sorted(missing))
for f in fails[:40]: print('FAIL', f)
sys.exit(1 if fails else 0)
