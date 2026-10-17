#!/usr/bin/env python3
"""Collect raw paired timings; GMP is a reference, not an optimization baseline."""
import argparse
import csv
import datetime
import hashlib
import json
import os
from pathlib import Path
import platform
import random
import statistics
import subprocess

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SIZES = [999, 1000, 1001, 1399, 1400, 1401, 2048, 3072, 4096, 6144,
                 8192, 12288, 16384, 24576, 32768, 39999, 40000, 40001, 49152,
                 65536, 98304, 131072, 196608, 262144, 393216, 524288]


def capture(*args):
    return subprocess.check_output(args, cwd=ROOT, text=True).strip()


def metadata():
    return {
        "utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "platform": platform.platform(), "machine": platform.machine(),
        "cpu": capture("sysctl", "-n", "machdep.cpu.brand_string"),
        "memory_bytes": int(capture("sysctl", "-n", "hw.memsize")),
        "compiler": capture("clang", "--version"),
        "flint_commit": capture("git", "-C", ".deps/flint", "rev-parse", "HEAD"),
        "flint_diff": capture("git", "-C", ".deps/flint", "diff", "--stat"),
        "configure": capture(".deps/flint/config.status", "--config"),
        "libraries": capture("brew", "list", "--versions", "gmp", "mpfr"),
        "threads": 1, "limb_bits": 64,
        "sha256": fingerprints(),
        "method": "warm fixed random operands; AB/BA batches; four exact input-pattern checks per case",
        "environment": {k: v for k, v in os.environ.items()
                        if k in ("OMP_NUM_THREADS", "FLINT_NUM_THREADS", "DYLD_LIBRARY_PATH")},
    }


def fingerprints():
    files = ("bench/mul.c", "build/mul", ".deps/flint/libflint.25.0.dylib")
    result = {}
    for name in files:
        with (ROOT / name).open("rb") as stream:
            result[name] = hashlib.file_digest(stream, "sha256").hexdigest()
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--sizes", type=int, nargs="+", default=DEFAULT_SIZES)
    parser.add_argument("--samples", type=int, default=11)
    parser.add_argument("--batch-ms", type=int, default=10)
    parser.add_argument("--unbalanced", action="store_true", help="add 2:1 multiplication")
    args = parser.parse_args()
    if args.samples < 3 or args.batch_ms < 1 or min(args.sizes) < 1:
        parser.error("require samples >= 3, batch-ms >= 1, and positive sizes")
    args.output.mkdir(parents=True, exist_ok=False)
    info = metadata()
    info["arguments"] = {k: str(v) if isinstance(v, Path) else v for k, v in vars(args).items()}
    (args.output / "metadata.json").write_text(json.dumps(info, indent=2) + "\n")
    cases = [(n, n, op) for n in args.sizes for op in ("mul", "sqr")]
    if args.unbalanced:
        cases += [(n, max(1, n // 2), "mul") for n in args.sizes]
    random.Random(20261007).shuffle(cases)
    summaries = []
    with (args.output / "raw.jsonl").open("w") as raw:
        for an, bn, op in cases:
            result = capture(str(ROOT / "build/mul"), str(an), str(bn), op,
                             str(args.samples), str(args.batch_ms))
            raw.write(result + "\n")
            raw.flush()
            rows = [json.loads(line) for line in result.splitlines()]
            row = {"an": an, "bn": bn, "bits_a": an * 64, "operation": op}
            for engine in ("flint", "gmp"):
                values = [r["ns_per_op"] for r in rows if r["engine"] == engine]
                median = statistics.median(values)
                row[engine + "_median_ns"] = round(median, 3)
                row[engine + "_mad_pct"] = round(100 * statistics.median(
                    abs(v - median) for v in values) / median, 3)
            # Ratio of paired samples; distinct from ratio of the medians.
            by_trial = {}
            for r in rows:
                by_trial.setdefault(r["trial"], {})[r["engine"]] = r["ns_per_op"]
            ratios = [r["gmp"] / r["flint"] for r in by_trial.values()]
            row["median_gmp_over_flint"] = round(statistics.median(ratios), 4)
            summaries.append(row)
            print(f"{op} {an}x{bn}: FLINT {row['flint_median_ns']/1e6:.3f} ms, "
                  f"GMP/FLINT {row['median_gmp_over_flint']:.2f}, "
                  f"FLINT MAD {row['flint_mad_pct']:.2f}%", flush=True)
    with (args.output / "summary.csv").open("w") as output:
        writer = csv.DictWriter(output, fieldnames=list(summaries[0]))
        writer.writeheader()
        writer.writerows(sorted(summaries, key=lambda r: (r["operation"], r["an"], r["bn"])))


if __name__ == "__main__":
    main()
