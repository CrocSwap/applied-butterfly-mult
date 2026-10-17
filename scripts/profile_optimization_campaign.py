#!/usr/bin/env python3
"""Sample representative complete FLINT calls, separately from timing evidence."""
import argparse
import json
from pathlib import Path
import subprocess
import time

from optimization_campaign import OUT, ROOT, sha
from run_optimization_screen import command, ORIGINAL, BINARY


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--suite", choices=["initial", "next", "series"], default="initial")
    args = parser.parse_args()
    output = OUT / ("profiles-" + args.suite)
    output.mkdir(parents=True, exist_ok=False)
    fixtures = [
        dict(kind="nmod_sqr", size=84, length=4, prec=0, modulus=1000003),
        dict(kind="nmod_interp", size=128, length=128, prec=0, modulus=18446744073709551557),
        dict(kind="arb_eval2", size=128, length=128, prec=1024, modulus=0),
        dict(kind="acb_eval2", size=128, length=128, prec=1024, modulus=0)]
    if args.suite == "next":
        fixtures = [
            dict(kind="nmod_interp", size=32, length=32, prec=0, modulus=1000000007),
            dict(kind="arb_exp", size=1024, length=128, prec=1024, modulus=0,
                 binary=str(ROOT / "build/optimization-series")),
            dict(kind="acb_exp", size=1024, length=128, prec=1024, modulus=0,
                 binary=str(ROOT / "build/optimization-series"))]
    if args.suite == "series":
        fixtures = [dict(kind=kind, size=1024, length=128, prec=1024,
                        modulus=0, binary=str(ROOT / "build/optimization-series-v2"))
                    for kind in ["arb_sinhcosh", "acb_sinhcosh"]]
    for case in fixtures:
        case["seed"] = 91073
        dest = output / case["kind"]
        dest.mkdir()
        cmd = command(case, ORIGINAL, ORIGINAL, -1, 6000)
        with (dest / "workload.jsonl").open("w") as log:
            process = subprocess.Popen(cmd, stdout=log, stderr=subprocess.STDOUT)
            try:
                time.sleep(0.5)
                subprocess.run(["sample", str(process.pid), "3", "1", "-file", str(dest / "sample.txt")],
                               check=True, capture_output=True, text=True)
                if process.wait() != 0:
                    raise RuntimeError("Profiling workload failed")
            finally:
                if process.poll() is None:
                    process.terminate()
                    process.wait()
        (dest / "metadata.json").write_text(json.dumps(dict(case=case, command=cmd,
            binary_sha256=sha(case.get("binary", BINARY)), library_sha256=sha(ORIGINAL)), indent=2) + "\n")
        print(case["kind"], flush=True)


if __name__ == "__main__":
    main()
