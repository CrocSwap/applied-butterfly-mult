#!/usr/bin/env python3
"""Build the separately pinned optimization baseline, preserving older evidence."""
import hashlib
import json
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
PLAN = ROOT / "experiments/flint-optimization-campaign.json"


def main():
    plan = json.loads(PLAN.read_text())["baseline"]
    source = ROOT / plan["source_directory"]
    output = ROOT / "results/flint-optimization-campaign/baseline"
    output.mkdir(parents=True, exist_ok=True)
    commands = []

    def run(args, cwd=ROOT, logfile=None, env=None):
        commands.append({"argv": list(map(str, args)), "cwd": str(cwd)})
        if logfile:
            with (output / logfile).open("w") as log:
                subprocess.run(args, cwd=cwd, env=env, stdout=log,
                               stderr=subprocess.STDOUT, check=True)
        else:
            subprocess.run(args, cwd=cwd, env=env, check=True)

    if not (source / ".git").exists():
        run(["git", "init", str(source)])
        run(["git", "remote", "add", "origin", plan["repository"]], source)
        run(["git", "fetch", "--depth", "1", "origin", plan["commit"]], source)
        run(["git", "checkout", "--detach", "FETCH_HEAD"], source)
    actual = subprocess.check_output(["git", "rev-parse", "HEAD"],
                                     cwd=source, text=True).strip()
    if actual != plan["commit"]:
        raise SystemExit("Campaign source does not match its pin")
    if subprocess.check_output(["git", "diff", "HEAD", "--stat"], cwd=source):
        raise SystemExit("Campaign baseline source is modified")
    if not (source / "configure").exists():
        run(["./bootstrap.sh"], source, "bootstrap.log")
    if not (source / "Makefile").exists():
        gmp = subprocess.check_output(["brew", "--prefix", "gmp"], text=True).strip()
        mpfr = subprocess.check_output(["brew", "--prefix", "mpfr"], text=True).strip()
        run(["./configure", "--with-gmp=" + gmp, "--with-mpfr=" + mpfr,
             "--disable-static", "CC=" + plan["compiler"],
             "CFLAGS=" + plan["cflags"]], source, "configure.log")
    run(["make", "-j" + os.environ.get("JOBS", "4")], source, "build.log")
    libraries = sorted(p for p in source.glob("libflint.*.dylib") if not p.is_symlink())
    manifest = {"commit": actual, "plan_sha256": hashlib.sha256(PLAN.read_bytes()).hexdigest(),
                "commands": commands, "compiler": subprocess.check_output(
                    [plan["compiler"], "--version"], text=True),
                "sha256": {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
                           for p in libraries}}
    (output / "build.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(json.dumps(manifest, indent=2))


if __name__ == "__main__":
    main()
