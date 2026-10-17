#!/usr/bin/env python3
"""Build an isolated dylib by replacing selected fft_small objects; baseline stays untouched."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / '.deps/flint'
FLAGS = ['-std=gnu23', '-O3', '-g', '-mcpu=apple-m2', '-fno-omit-frame-pointer']
INCLUDES = ['-I' + str(BASE / 'src'), '-I/opt/homebrew/opt/gmp/include',
            '-I/opt/homebrew/opt/mpfr/include']
LIBS = ['-L/opt/homebrew/opt/gmp/lib', '-L/opt/homebrew/opt/mpfr/lib',
        '-Wl,-rpath,/opt/homebrew/opt/gmp/lib', '-Wl,-rpath,/opt/homebrew/opt/mpfr/lib',
        '-pthread', '-lmpfr', '-lgmp']


def make_var(name):
    return subprocess.check_output(['make', '--no-print-directory', '-s', '-f',
                                   'Makefile', '-f', '-', 'print-var'],
                                  input=f'print-var:\n\t@echo $({name})\n',
                                  cwd=BASE, text=True).split()


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('name')
    ap.add_argument('--patch', type=Path)
    ap.add_argument('--test', action='store_true')
    args = ap.parse_args()
    expected = json.loads((ROOT/'deps.json').read_text())['flint']['commit']
    actual = subprocess.check_output(['git','rev-parse','HEAD'],cwd=BASE,text=True).strip()
    if actual != expected:
        raise SystemExit('Baseline revision does not match deps.json')
    if not args.name.replace('-', '').replace('_', '').isalnum():
        ap.error('name must be alphanumeric with hyphens/underscores')
    if subprocess.check_output(['git', 'diff', '--stat'], cwd=BASE, text=True).strip():
        raise SystemExit('Baseline source is modified')
    dest = ROOT / '.deps/experiments' / args.name
    dest.mkdir(parents=True, exist_ok=False)
    changed = []
    if args.patch:
        import re
        patch = args.patch.resolve()
        changed = re.findall(r'^\+\+\+ b/(src/fft_small/[^\n]+\.c)$', patch.read_text(), re.M)
        if not changed:
            raise SystemExit('patch must modify fft_small C sources')
        for path in changed:
            target = dest / path
            target.parent.mkdir(parents=True, exist_ok=True)
            if (BASE / path).exists():
                target.write_bytes((BASE / path).read_bytes())
        subprocess.run(['patch', '-p1', '-i', str(patch)], cwd=dest, check=True)
    commands = []
    def run(cmd):
        commands.append(cmd)
        subprocess.run(cmd, cwd=dest, check=True)
    replacements = {}
    for path in changed:
        obj = dest / (Path(path).stem + '.lo')
        run(['clang', *FLAGS, *INCLUDES, '-DBUILDING_FLINT', '-DFLINT_NOSTDIO',
             '-DFLINT_NOSTDARG', '-c', str(dest / path), '-o', str(obj)])
        replacements['build/fft_small/' + Path(path).stem + '.lo'] = obj
    objects = [BASE / p for p in make_var('SHARED_LIB_DEPS')]
    if changed:
        module = dest / 'fft_small_merged.lo'
        original_objects=make_var('fft_small_LOBJS')
        merged=[str(replacements.get(p, BASE / p)) for p in original_objects]
        merged += [str(obj) for p,obj in replacements.items() if p not in original_objects]
        run(['ld', '-r', *merged, '-o', str(module)])
        objects = [module if p.name == 'fft_small_merged.lo' else p for p in objects]
    library = dest / 'libflint-experiment.dylib'
    run(['clang', *FLAGS, '-shared', '-install_name', str(library),
         '-compatibility_version', '25.0', '-current_version', '25.0.0',
         *map(str, objects), '-o', str(library), *LIBS])
    if args.test:
        test = dest / 'test-fft'
        run(['clang', *FLAGS, *INCLUDES, str(BASE/'src/fft_small/test/main.c'),
             str(library), *LIBS, '-o', str(test)])
        cmd = [str(test), 'sd_fft', 'mpn_ctx_mpn_mul', 'mpn_ctx_to_from_ffts',
               '_mpn_ctx_mpn_mul_range']
        commands.append(cmd)
        with (dest/'tests.log').open('w') as log:
            subprocess.run(cmd, stdout=log, stderr=subprocess.STDOUT, check=True)
    manifest = {'name': args.name, 'library': str(library), 'changed': changed,
                'commands': commands, 'sha256': hashlib.sha256(library.read_bytes()).hexdigest(),
                'patch_sha256': hashlib.sha256(args.patch.read_bytes()).hexdigest() if args.patch else None,
                'flint_commit': subprocess.check_output(['git','rev-parse','HEAD'],cwd=BASE,text=True).strip()}
    (dest / 'build.json').write_text(json.dumps(manifest, indent=2)+'\n')
    print(library)


if __name__ == '__main__':
    main()
