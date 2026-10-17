#!/usr/bin/env python3
"""Equal-bank theta experiment. Build/validate, time alone, then analyze."""
import argparse
import difflib
import json
from pathlib import Path
import random
import subprocess
import statistics

from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS, make_var
from qualify_theory_paths_hard import sha, save
from compare import summarize

OUT = ROOT / 'results/theta-equal'
BUILD = ROOT / '.deps/experiments/theta-equal'
CURRENT = ROOT / '.deps/experiments/theta-batch/retained/libflint-experiment.dylib'
ORIGINAL = BASE / 'libflint.25.0.dylib'
DIRECT = ROOT / '.deps/experiments/theta-direct-walsh/agm_mul.c'
QL = ROOT / '.deps/experiments/theta-batch/retained/ql_exact.lo'


def run(cmd, log):
    proc = subprocess.run(list(map(str, cmd)), capture_output=True, text=True)
    log.write_text(proc.stdout + proc.stderr)
    proc.check_returncode()


def build(name, source):
    dest = BUILD / name
    dest.mkdir(parents=True, exist_ok=False)
    file = dest / 'agm_mul.c'
    file.write_text(source)
    obj = dest / 'agm_mul.lo'
    run(['clang', *FLAGS, *INCLUDES, '-DBUILDING_FLINT', '-DFLINT_NOSTDIO',
         '-DFLINT_NOSTDARG', '-c', file, '-o', obj], dest / 'compile.log')
    replacements = {'build/acb_theta/agm_mul.lo': obj, 'build/acb_theta/ql_exact.lo': QL}
    module = dest / 'acb_theta_merged.lo'
    run(['ld', '-r', *[replacements.get(p, BASE / p) for p in make_var('acb_theta_LOBJS')],
         '-o', module], dest / 'merge.log')
    lib = dest / 'libflint-experiment.dylib'
    run(['clang', *FLAGS, '-shared', '-install_name', lib, '-compatibility_version', '25.0',
         '-current_version', '25.0.0',
         *[module if Path(p).name == 'acb_theta_merged.lo' else BASE / p for p in make_var('SHARED_LIB_DEPS')],
         '-o', lib, *LIBS], dest / 'link.log')
    return lib


def trace_source(source):
    return '''#include <stdint.h>
#include <time.h>
#define acb_theta_agm_mul bf_equal_uninstrumented
''' + source + '''
#undef acb_theta_agm_mul
static uint64_t counts[4];
void bf_equal_trace_reset(void) {for(int i=0;i<4;i++)counts[i]=0;}
uint64_t bf_equal_trace_get(int i) {return counts[i];}
static uint64_t ticks(void) {struct timespec t;clock_gettime(CLOCK_THREAD_CPUTIME_ID,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
void acb_theta_agm_mul(acb_ptr r,acb_srcptr a,acb_srcptr b,slong g,int all,slong p) {
 if(all) {uint64_t t=ticks();bf_equal_uninstrumented(r,a,b,g,all,p);t=ticks()-t;
 counts[0]++;counts[2]+=t;if(a==b){counts[1]++;counts[3]+=t;}}
 else bf_equal_uninstrumented(r,a,b,g,all,p);
}
'''


def command(c, mode, base, candidate):
    return list(map(str, [OUT / 'theta-equal', mode, base, candidate,
        c['g'], c['prec'], c.get('constant', 1), c.get('square', 1), c['fixture'],
        c.get('all', 1), c.get('trials', 31), c.get('same', 0), c.get('nb', 1)]))


def prepare():
    OUT.mkdir(exist_ok=False)
    BUILD.mkdir(exist_ok=False)
    frozen = {}
    for f in ('results/theta-batch/retained/plan.json', 'results/theta-batch/confirmation/plan.json',
              'results/theta-batch/control-diagnostic/plan.json', 'results/theta-batch/completion.json'):
        d = json.loads((ROOT / f).read_text())
        frozen.update(d.get('frozen_sha256', {})); frozen.update(d.get('sha256', {}))
        frozen[str(ROOT / f)] = sha(ROOT / f)
    for p, h in frozen.items():
        assert sha(ROOT / p) == h, p
    old = DIRECT.read_text()
    helper = (ROOT / 'bench/theta_equal_kernel.h').read_text()
    index = old.index('static void\nacb_theta_agm_mul_one')
    new = old[:index] + helper + '\n' + old[index:]
    needle = '    if (all)\n    {\n'
    assert new.count(needle) == 1
    new = new.replace(needle, '''    if (all && a1 == a2)
    {
        acb_theta_agm_mul_equal(res, a1, g, prec);
    }
    else if (all)
    {
''')
    patch = ROOT / 'patches/theta-equal-bank.patch'
    with patch.open('x') as out:
        out.write(''.join(difflib.unified_diff(old.splitlines(True), new.splitlines(True),
            fromfile='a/src/acb_theta/agm_mul.c', tofile='b/src/acb_theta/agm_mul.c')))
    libraries = dict(current=str(CURRENT), original=str(ORIGINAL))
    libraries['candidate'] = str(build('candidate', new))
    libraries['rebuild'] = str(build('rebuild', old))
    libraries['trace'] = str(build('trace', trace_source(old)))
    libraries['candidate_trace'] = str(build('candidate-trace', trace_source(new)))
    run(['clang', *FLAGS, *INCLUDES, ROOT / 'bench/theta_equal.c', ORIGINAL, *LIBS,
         '-o', OUT / 'theta-equal'], OUT / 'compile.log')
    run(['clang', *FLAGS, *INCLUDES, '-fsanitize=address,undefined',
         ROOT / 'bench/theta_equal_check.c', CURRENT, *LIBS,
         '-o', OUT / 'exact-check'], OUT / 'exact-compile.log')
    run([OUT / 'exact-check'], OUT / 'exact-check.json')
    print('Exact oracle and sanitizer checks passed', flush=True)
    run(['clang', *FLAGS, *INCLUDES, BASE / 'src/acb_theta/test/main.c', libraries['candidate'],
         *LIBS, '-o', OUT / 'test-theta'], OUT / 'test-compile.log')
    run([OUT / 'test-theta', 'acb_theta_agm_mul', 'acb_theta_agm_mul_tight',
         'acb_theta_ql_exact', 'acb_theta_jet_notransform', 'acb_theta_jet'], OUT / 'upstream-tests.log')
    print('Five upstream tests passed', flush=True)
    primary = [dict(g=g, prec=p, fixture=f, group='squared_constants')
        for g in (1, 2, 3, 4, 6) for p in (512, 2048) if g != 6 or p == 512 for f in (0, 1)]
    ordinary = [dict(g=g, prec=512, fixture=f, square=0, group='ordinary_constants')
        for g in (2, 3, 6) for f in (0, 1)]
    mixed = [dict(g=g, prec=512, fixture=f, nb=4, group='mixed_batch')
        for g in (2, 3) for f in (0, 1)]
    inactive = [dict(g=g, prec=512, fixture=f, constant=0, group='nonzero_control')
        for g in (2, 3) for f in (0, 1)]
    single = [dict(g=2, prec=512, fixture=f, all=0, group='single_control') for f in (0, 1)]
    cases = primary + ordinary + mixed + inactive + single
    validation, trace = [], []
    for i, c in enumerate(cases):
        v = json.loads(subprocess.check_output(command(c, 'validate', CURRENT, libraries['candidate']), text=True, timeout=600))
        validation.append(dict(case=c, **v))
        for name in ('trace', 'candidate_trace'):
            t = json.loads(subprocess.check_output(command(c, 'trace', CURRENT, libraries[name]), text=True, timeout=300))
            trace.append(dict(case=c, variant=name, **t))
        save(OUT / 'validation.json', validation); save(OUT / 'trace.json', trace)
        print('Validated/profiled', i + 1, '/', len(cases), c, flush=True)
    comparisons = [dict(case=c, base='current', candidate='candidate') for c in cases]
    total = [c for c in primary if c['prec'] == 512 and c['g'] > 1]
    comparisons += [dict(case=c, base='original', candidate='candidate') for c in total]
    for f in (0, 1):
        comparisons.append(dict(case=dict(g=3,prec=512,fixture=f,same=1,group='same_control'),base='current',candidate='candidate'))
        for g in (2, 3):
            comparisons.append(dict(case=dict(g=g,prec=512,fixture=f,group='rebuild_control'),base='current',candidate='rebuild'))
    random.Random(703172).shuffle(comparisons)
    for p in [Path(__file__).resolve(), ROOT/'scripts/compare.py', ROOT/'scripts/build_experiment.py',
              ROOT/'scripts/qualify_theory_paths_hard.py', ROOT/'bench/theta_equal_kernel.h',
              ROOT/'bench/theta_equal_check.c', ROOT/'bench/theta_equal.c', patch, DIRECT, QL,
              *[p for p in BUILD.rglob('*') if p.is_file()], *[p for p in OUT.rglob('*') if p.is_file()]]:
        frozen[str(p)] = sha(p)
    save(OUT / 'plan.json', dict(comparisons=comparisons,libraries=libraries,frozen_sha256=frozen,
        protocol='31 ABBA/BAAB quartets, 200ms joint warmup, 20ms equal-repetition calibration; CPU and wall; marginal bootstrap intervals. Timing alone, analysis afterwards.',
        confirmation_rule='Repeat all squared-constant cases at 512 bits, total-original comparisons, nonzero/single controls, same controls, and unchanged rebuild controls, independently shuffled. No case selection based on timing results.',
        attribution='Known equal-input symmetry suggested by external research review. No new network construction is required.'))
    print('Prepared', len(comparisons), 'comparisons', flush=True)


def verify(plan):
    for p,h in plan['frozen_sha256'].items():
        assert sha(ROOT/p)==h,p


def measure(dest=OUT):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    with (dest/'raw.jsonl').open('x') as out:
        for i,c in enumerate(plan['comparisons']):
            raw=subprocess.check_output(command(c['case'],'measure',plan['libraries'][c['base']],plan['libraries'][c['candidate']]),text=True,timeout=900)
            rows=[json.loads(s) for s in raw.splitlines()]
            assert len(rows)==4*c['case'].get('trials',31)
            out.write(json.dumps(dict(**c,rows=rows))+'\n');out.flush()
            print(i+1,'/',len(plan['comparisons']),c,flush=True)


def analyze(dest=OUT):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    raw=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
    assert [{k:r[k] for k in ('case','base','candidate')} for r in raw]==plan['comparisons']
    rows=[dict(case=r['case'],base=r['base'],candidate=r['candidate'],
        cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in raw]
    groups={}
    for base,group in sorted({(r['base'],r['case']['group']) for r in rows}):
        subset=[r for r in rows if r['base']==base and r['case']['group']==group]
        groups[base+'/'+group]=dict(cases=len(subset),median_cpu=statistics.median(r['cpu']['reduction_pct'] for r in subset),
            positive_cpu=sum(r['cpu']['ci95_low_pct']>0 for r in subset),
            positive_both=sum(min(r['cpu']['ci95_low_pct'],r['wall']['ci95_low_pct'])>0 for r in subset))
    save(dest/'summary.json',dict(results=rows,groups=groups,raw_sha256=sha(dest/'raw.jsonl'),preserved_hashes=len(plan['frozen_sha256'])))
    print(json.dumps(groups,indent=2))


def confirm_prepare():
    dest=OUT/'confirmation';dest.mkdir(exist_ok=False)
    plan=json.loads((OUT/'plan.json').read_text());verify(plan)
    plan['comparisons']=[c for c in plan['comparisons'] if c['case']['prec']==512 and
        c['case']['group'] not in ('ordinary_constants','mixed_batch')]
    random.Random(803171).shuffle(plan['comparisons'])
    for f in ('raw.jsonl','summary.json','plan.json'):
        plan['frozen_sha256'][str(OUT/f)]=sha(OUT/f)
    save(dest/'plan.json',plan)
    print('Prepared confirmation:',len(plan['comparisons']),flush=True)


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['prepare','measure','analyze','confirm-prepare','confirm-measure','confirm-analyze'])
    stage=ap.parse_args().stage
    if stage=='confirm-prepare':confirm_prepare()
    elif stage.startswith('confirm-'):globals()[stage.split('-')[1]](OUT/'confirmation')
    else:globals()[stage]()
