#!/usr/bin/env python3
"""Compare fresh single-library processes in ABBA/BAAB quartets.

The baseline FLINT library remains linked for input construction/reference
checks, but both timed engine slots call the same selected library. This
avoids alternating between different library images inside a timed process.
"""
import argparse
import json
from pathlib import Path
import random
import shutil
import statistics
import subprocess

from compare import summarize
from optimization_campaign import ROOT, BUILDS, sha, check_baseline
from run_optimization_screen import BINARY, ORIGINAL, command, verify


def prepare(args):
    check_baseline()
    args.output.mkdir(parents=True, exist_ok=False)
    baseline = BUILDS / "control/libflint-experiment.dylib"
    cases = [
        dict(candidate="evaluate2-dot", kind="acb_eval2", size=64, length=128, prec=1024, modulus=0),
        dict(candidate="combined-v1", kind="acb_eval2", size=64, length=128, prec=1024, modulus=0),
        dict(candidate="evaluate2-dot", kind="arb_eval2", size=64, length=128, prec=1024, modulus=0),
        dict(candidate="interpolation-leaves-v2", kind="nmod_interp", size=16, length=16, prec=0,
             modulus=18446744073709551557),
        dict(candidate="interpolation-leaves-v2", kind="nmod_interp", size=32, length=32, prec=0,
             modulus=1000000007),
        dict(candidate="original", kind="acb_eval2", size=64, length=128, prec=1024, modulus=0)]
    random.Random(args.order_seed).shuffle(cases)
    frozen = {str(p): sha(p) for p in [BINARY, ORIGINAL, baseline]}
    snapshots = args.output / "sources"
    snapshots.mkdir()
    for p in [Path(__file__), ROOT / "bench/optimization_campaign.c",
              ROOT / "scripts/compare.py", ROOT / "scripts/optimization_campaign.py",
              ROOT / "scripts/run_optimization_screen.py"]:
        dest = snapshots / p.name
        shutil.copyfile(p, dest)
        frozen[str(dest.resolve())] = sha(dest)
    for case in cases:
        case["seed"] = args.input_seed
        case["library"] = str(ORIGINAL if case["candidate"] == "original" else
                              BUILDS / case["candidate"] / "libflint-experiment.dylib")
        frozen[case["library"]] = sha(case["library"])
        case["group"] = "original_build_control" if case["candidate"] == "original" else "active"
        if case["candidate"] != "original":
            build = BUILDS / case["candidate"] / "build.json"
            frozen[str(build)] = sha(build)
            for path in json.loads(build.read_text())["changed"]:
                p = BUILDS / case["candidate"] / path
                frozen[str(p)] = sha(p)
    plan = dict(baseline=str(baseline), cases=cases, quartets=args.quartets,
                inner_trials=1, batch_ms=args.batch_ms, input_seed=args.input_seed,
                order_seed=args.order_seed, frozen_sha256=frozen)
    (args.output / "plan.json").write_text(json.dumps(plan, indent=2) + "\n")
    print(json.dumps(dict(cases=len(cases), processes=4 * args.quartets * len(cases))))


def measure(output):
    plan = json.loads((output / "plan.json").read_text())
    verify(plan)
    with (output / "raw.jsonl").open("x") as log:
        for i, case in enumerate(plan["cases"]):
            for trial in range(plan["quartets"]):
                first = trial & 1
                for position, engine in enumerate([first, 1 - first, 1 - first, first]):
                    library = plan["baseline"] if engine == 0 else case["library"]
                    cmd = command(case, library, library, plan["inner_trials"], plan["batch_ms"])
                    result = subprocess.run(cmd, capture_output=True, text=True)
                    rows = [json.loads(line) for line in result.stdout.splitlines()]
                    record = dict(case_index=i, trial=trial, position=position, engine=engine,
                                  library=library, command=cmd, rows=rows,
                                  returncode=result.returncode, stderr=result.stderr)
                    log.write(json.dumps(record) + "\n")
                    log.flush()
                    result.check_returncode()
                if (trial + 1) % 5 == 0:
                    print(f"case {i + 1}/{len(plan['cases'])}: {case['candidate']} {case['kind']}, "
                          f"{trial + 1}/{plan['quartets']} process quartets", flush=True)
    verify(plan)


def analyze(output):
    plan = json.loads((output / "plan.json").read_text())
    verify(plan)
    raw = [json.loads(line) for line in (output / "raw.jsonl").read_text().splitlines()]
    assert len(raw) == 4 * plan["quartets"] * len(plan["cases"])
    results = []
    for i, case in enumerate(plan["cases"]):
        records = [r for r in raw if r["case_index"] == i]
        observations = []
        accuracies = {0: [], 1: []}
        for record in records:
            assert record["returncode"] == 0
            rows = record["rows"]
            bindings = [x for x in rows if x["phase"] == "binding"]
            assert len(bindings) == 2
            assert all(Path(x["image"]).resolve() == Path(record["library"]).resolve() for x in bindings)
            checks = [x for x in rows if x["phase"] == "check"]
            assert len(checks) == 4 and all(x["passed"] for x in checks)
            if "accuracy" in checks[0]:
                accuracies[record["engine"]].append(min(x["accuracy"] for x in checks))
            timed = [x for x in rows if x["phase"] == "timing"]
            assert len(timed) == 4 * plan["inner_trials"]
            observations.append(dict(trial=record["trial"], engine=record["engine"],
                ns_per_op=statistics.mean(x["ns_per_op"] for x in timed),
                cpu_ns_per_op=statistics.mean(x["cpu_ns_per_op"] for x in timed)))
        result = dict(case=case, cpu=summarize(observations, metric="cpu_ns_per_op"),
                      wall=summarize(observations, metric="ns_per_op"), accuracies=accuracies)
        results.append(result)
        s = result["cpu"]
        print(f"{case['candidate']:24} {case['kind']:12} CPU {s['reduction_pct']:.2f}% "
              f"[{s['ci95_low_pct']:.2f}, {s['ci95_high_pct']:.2f}]")
    with (output / "summary.json").open("x") as log:
        json.dump(dict(raw_sha256=sha(output / "raw.jsonl"), results=results), log, indent=2)
        log.write("\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="action", required=True)
    p = sub.add_parser("prepare")
    p.add_argument("output", type=Path)
    p.add_argument("--quartets", type=int, default=15)
    p.add_argument("--batch-ms", type=int, default=20)
    p.add_argument("--input-seed", type=int, required=True)
    p.add_argument("--order-seed", type=int, required=True)
    for action in ["measure", "analyze"]:
        p = sub.add_parser(action)
        p.add_argument("output", type=Path)
    args = parser.parse_args()
    if args.action == "prepare": prepare(args)
    elif args.action == "measure": measure(args.output)
    else: analyze(args.output)


if __name__ == "__main__":
    main()
