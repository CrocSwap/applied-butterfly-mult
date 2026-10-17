"""Check patch application on clean FLINT and patched-source hashes. Usage: patchcheck.py REPO FLINT"""
import difflib, hashlib, json, shutil, subprocess, sys, tempfile
from pathlib import Path
repo, flint = Path(sys.argv[1]).resolve(), Path(sys.argv[2]).resolve()
fails = []; checks = 0
def ok(cond, msg):
    global checks; checks += 1
    print(('PASS ' if cond else 'FAIL ') + msg)
    if not cond: fails.append(msg)
pin = json.loads((repo/'deps.json').read_text())['flint']['commit']
head = subprocess.check_output(['git','rev-parse','HEAD'], cwd=flint, text=True).strip()
ok(head == pin, f'flint HEAD {head} == deps.json pin')
ok(not subprocess.check_output(['git','status','--porcelain'], cwd=flint, text=True).strip(), 'flint checkout clean')
kernel = ['poly-shared4','poly-tile4','poly-shared4-wide','poly-shared4-medium','poly-shared4-ordered','poly-tile4-ordered','poly-tile4-wide-control']
for name in ['poly-prepared','poly-contiguous-control'] + kernel:
    r = subprocess.run(['git','apply','--check',str(repo/'patches'/(name+'.patch'))], cwd=flint, capture_output=True, text=True)
    ok(r.returncode == 0, f'git apply --check patches/{name}.patch {r.stderr.strip()}')
files = ['gr/nmod_transformed_poly.c','nmod_poly_mat/mulmid_fft_small.c']
def transform(path, old, prepare):
    # Replay of the string transform in scripts/build_poly_prepared.py at base 8f6dcb3.
    s = old
    if path.startswith('gr/'):
        code = '\n#define BF_PREPARE '+str(prepare)+'\n'+(repo/'bench/poly_prepared.inc').read_text()
        needle = 'static gr_funcptr __tpoly_methods[GR_METHOD_TAB_SIZE];'
        assert s.count(needle) == 1; return s.replace(needle, code+'\n'+needle)
    s = s.replace('#if FLINT_HAVE_FFT_SMALL','#if FLINT_HAVE_FFT_SMALL\n\n#define BF_PREPARE '+str(prepare)+'''\nvoid _bf_tpoly_prepare(gr_ptr,gr_ctx_t);
int _bf_tpoly_contiguous(gr_ptr,gr_srcptr,gr_srcptr,slong,slong,gr_ctx_t);
''',1)
    start = s.index('        a->status |= _gr_set_gr_poly('); end = s.index('    }\n}',start)
    s = s[:start]+'''        int status = _gr_set_gr_poly(_MM_TE(a, t), e->coeffs, e->length,
                                          a->ctx, a->tctx);
        a->status |= status;
#if BF_PREPARE
        if (status==GR_SUCCESS && t<a->nA && a->bc>=4 && a->k>=4 && a->k<=16)
            _bf_tpoly_prepare(_MM_TE(a,t),a->tctx);
#endif
'''+s[end:]
    start = s.index('        a->status |= gr_mul(acc,'); end = s.index('        nmod_poly_fit_length(entry,',start)
    original = s[start:end]
    return s[:start]+'''        int fast=GR_UNABLE;
        if (a->bc>=4 && a->k>=4 && a->k<=16)
            fast=_bf_tpoly_contiguous(acc,_MM_TE(a,i*a->k),
                    a->share?_MM_TE(a,j):_MM_TE(a,a->nA+j),a->k,a->bc,a->tctx);
        if (fast!=GR_SUCCESS)
        {
'''+original+'''        }

'''+s[end:]
for name in ['poly-prepared','poly-contiguous-control']:
    m = json.loads((repo/'results'/(name+'-build')/'build.json').read_text())
    ok(m['prepare'] == (1 if name == 'poly-prepared' else 0), f'{name} build.json prepare={m["prepare"]}')
    for f in ['scripts/build_poly_prepared.py','bench/poly_prepared.inc','bench/poly_survey.c',f'patches/{name}.patch',f'results/{name}-build/gr.s']:
        ok(hashlib.sha256((repo/f).read_bytes()).hexdigest() == m['sha256'][f], f'{name}: committed {f} hash matches build.json')
    with tempfile.TemporaryDirectory() as t:
        t = Path(t)
        for f in files:
            (t/'src'/f).parent.mkdir(parents=True, exist_ok=True); shutil.copy(flint/'src'/f, t/'src'/f)
        subprocess.run(['git','apply',str(repo/'patches'/(name+'.patch'))], cwd=t, check=True)
        patch = []
        for f in files:
            got = hashlib.sha256((t/'src'/f).read_bytes()).hexdigest()
            want = m['sha256'][f'.deps/experiments/{name}/src/{f}']
            ok(got == want, f'{name}: patched src/{f} sha256 {got[:12]} == pinned {want[:12]}')
            old = (flint/'src'/f).read_text(); new = transform(f, old, m['prepare'])
            ok(new == (t/'src'/f).read_text(), f'{name}: replayed builder transform of src/{f} == patch result')
            patch.append(''.join(difflib.unified_diff(old.splitlines(True), new.splitlines(True), fromfile='a/src/'+f, tofile='b/src/'+f)))
        ok(''.join(patch) == (repo/'patches'/(name+'.patch')).read_text(), f'{name}: regenerated patch byte-identical to patches/{name}.patch')
# Failure controls: a corrupted patch must fail --check, and a wrong prepare flag must change the hash.
with tempfile.TemporaryDirectory() as t:
    bad = Path(t)/'bad.patch'; txt = (repo/'patches/poly-prepared.patch').read_text()
    bad.write_text(txt.replace('static gr_funcptr __tpoly_methods', 'static gr_funcptr __tpoly_methodZ', 1))
    r = subprocess.run(['git','apply','--check',str(bad)], cwd=flint, capture_output=True)
    ok(r.returncode != 0, 'control: corrupted context line is rejected by git apply --check')
f = files[0]; m = json.loads((repo/'results/poly-prepared-build/build.json').read_text())
wrong = hashlib.sha256(transform(f, (flint/'src'/f).read_text(), 0).encode()).hexdigest()
ok(wrong != m['sha256'][f'.deps/experiments/poly-prepared/src/{f}'], 'control: BF_PREPARE=0 transform does not match poly-prepared pinned hash')
print(f'{checks} checks, {len(fails)} failures')
sys.exit(1 if fails else 0)
