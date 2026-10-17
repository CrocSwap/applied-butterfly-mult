#!/usr/bin/env python3
"""Build isolated FLINT candidates against the optimization campaign baseline."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
PLAN = json.loads((ROOT / "experiments/flint-optimization-campaign.json").read_text())
BASE = ROOT / PLAN["baseline"]["source_directory"]
OUT = ROOT / "results/flint-optimization-campaign"
BUILDS = ROOT / ".deps/optimization-builds"
FLAGS = ["-std=gnu23", *PLAN["baseline"]["cflags"].split()]
GMP = Path(subprocess.check_output(["brew", "--prefix", "gmp"], text=True).strip())
MPFR = Path(subprocess.check_output(["brew", "--prefix", "mpfr"], text=True).strip())
INCLUDES = ["-I" + str(BASE / "src"), "-I" + str(GMP / "include"),
            "-I" + str(MPFR / "include")]
LIBS = ["-L" + str(GMP / "lib"), "-L" + str(MPFR / "lib"),
        "-Wl,-rpath," + str(GMP / "lib"), "-Wl,-rpath," + str(MPFR / "lib"),
        "-pthread", "-lmpfr", "-lgmp"]


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def make_var(name):
    return subprocess.check_output(
        ["make", "--no-print-directory", "-s", "-f", "Makefile", "-f", "-", "print-var"],
        input=f"print-var:\n\t@echo $({name})\n", cwd=BASE, text=True).split()


def check_baseline():
    actual = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=BASE, text=True).strip()
    assert actual == PLAN["baseline"]["commit"]
    assert not subprocess.check_output(["git", "diff", "HEAD", "--stat"], cwd=BASE)
    manifest = json.loads((OUT / "baseline/build.json").read_text())
    for p, h in manifest["sha256"].items():
        assert sha(ROOT / p) == h, p


def build(name, patches, sanitize=False):
    check_baseline()
    if not re.fullmatch(r"[a-zA-Z0-9_-]+", name):
        raise ValueError("Invalid build name")
    dest = BUILDS / name
    dest.mkdir(parents=True, exist_ok=False)
    changed = set()
    commands = []
    flags = [*FLAGS, *(["-O1", "-fsanitize=address,undefined",
                        "-fno-sanitize-recover=all"] if sanitize else [])]

    def run(args):
        commands.append(list(map(str, args)))
        subprocess.run(args, cwd=dest, check=True)

    for patch in patches:
        patch = patch.resolve()
        paths = re.findall(r"^\+\+\+ b/(src/[^\n]+)$", patch.read_text(), re.M)
        if not paths:
            raise ValueError("Patch has no FLINT source paths")
        for p in paths:
            target = dest / p
            target.parent.mkdir(parents=True, exist_ok=True)
            if not target.exists() and (BASE / p).exists():
                shutil.copyfile(BASE / p, target)
        run(["patch", "-p1", "-i", str(patch)])
        changed.update(paths)

    replacements = {}
    modules = {}
    for p in sorted(changed):
        parts = Path(p).parts
        if len(parts) != 3 or not p.endswith(".c"):
            continue
        module = parts[1]
        obj = dest / (module + "-" + Path(p).stem + ".lo")
        run(["clang", *flags, "-I" + str(dest / "src"), *INCLUDES,
             "-DBUILDING_FLINT", "-DFLINT_NOSTDIO", "-DFLINT_NOSTDARG",
             "-c", str(dest / p), "-o", str(obj)])
        modules.setdefault(module, {})["build/" + module + "/" + Path(p).stem + ".lo"] = obj

    for module, objects in modules.items():
        original = make_var(module + "_LOBJS")
        merged = dest / (module + "_merged.lo")
        run(["ld", "-r", *[str(objects.get(p, BASE / p)) for p in original],
             *[str(o) for p, o in objects.items() if p not in original], "-o", str(merged)])
        replacements[module + "_merged.lo"] = merged
    library = dest / "libflint-experiment.dylib"
    run(["clang", *flags, "-shared", "-install_name", str(library),
         "-compatibility_version", "25.0", "-current_version", "25.0.0",
         *[str(replacements.get(Path(p).name, BASE / p)) for p in make_var("SHARED_LIB_DEPS")],
         "-o", str(library), *LIBS])
    manifest = {"name": name, "commit": PLAN["baseline"]["commit"], "sanitize": sanitize,
                "library": str(library), "changed": sorted(changed),
                "commands": commands, "sha256": {str(p): sha(p) for p in
                    [library, *patches, *[dest / p for p in sorted(changed)]]}}
    (dest / "build.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(library)


def upstream_test(name, module, selected):
    dest = BUILDS / name
    check_baseline()
    directory = dest / "src" / module / "test"
    directory.mkdir(parents=True, exist_ok=True)
    main = directory / "main.c"
    if not main.exists():
        shutil.copyfile(BASE / "src" / module / "test/main.c", main)
    binary = dest / ("test-" + module)
    manifest = json.loads((dest / "build.json").read_text())
    flags = [*FLAGS, *(["-O1", "-fsanitize=address,undefined",
                       "-fno-sanitize-recover=all"] if manifest.get("sanitize") else [])]
    command = ["clang", *flags, "-DBUILDING_FLINT", "-I" + str(dest / "src"),
               *INCLUDES, "-I" + str(BASE / "src" / module / "test"),
               str(main), str(dest / "libflint-experiment.dylib"), *LIBS, "-o", str(binary)]
    subprocess.run(command, check=True)
    with (dest / ("test-" + module + ".log")).open("w") as log:
        subprocess.run([str(binary), *selected], stdout=log, stderr=subprocess.STDOUT, check=True)
    print((dest / ("test-" + module + ".log")).read_text())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="action", required=True)
    p = sub.add_parser("build")
    p.add_argument("name")
    p.add_argument("patch", nargs="*", type=Path)
    p.add_argument("--sanitize", action="store_true")
    p = sub.add_parser("test")
    p.add_argument("name")
    p.add_argument("module")
    p.add_argument("selected", nargs="*")
    args = parser.parse_args()
    if args.action == "build":
        build(args.name, args.patch, args.sanitize)
    else:
        upstream_test(args.name, args.module, args.selected)


if __name__ == "__main__":
    main()
