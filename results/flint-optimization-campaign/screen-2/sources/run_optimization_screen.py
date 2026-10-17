#!/usr/bin/env python3
"""Freeze, measure and analyze complete-call optimization screens separately."""
import argparse
import json
from pathlib import Path
import random
import shutil
import subprocess

from compare import summarize
from optimization_campaign import BASE, BUILDS, ROOT, sha, check_baseline

BINARY = ROOT / "build/optimization-campaign"
ORIGINAL = BASE / "libflint.25.0.dylib"


def cases():
    result = []

    def add(candidate, kind, size, length, prec, modulus, group="active"):
        result.append(dict(candidate=candidate, kind=kind, size=size, length=length,
                           prec=prec, modulus=modulus, group=group))

    for size, length in [(84, 1), (84, 4), (84, 9), (96, 4), (96, 16), (112, 16)]:
        add("sqr-fallthrough", "nmod_sqr", size, length, 0, 1000003)
    for size, length in [(80, 1), (82, 4), (32, 16)]:
        add("sqr-fallthrough", "nmod_sqr", size, length, 0, 1000003, "inactive")
    for modulus in [1000000007, 18446744073709551557]:
        for size in [16, 32, 64, 128, 256, 512]:
            add("interpolation-inverse", "nmod_interp", size, size, 0, modulus)
    for size in [4, 8, 15]:
        add("interpolation-inverse", "nmod_interp", size, size, 0, 1000000007, "inactive")
    for kind in ["arb_eval2", "acb_eval2"]:
        for prec in [1024, 4096]:
            for size in [32, 64, 128, 256]:
                add("evaluate2-dot", kind, size, 128, prec, 0)
        add("evaluate2-dot", kind, 64, 128, 512, 0, "inactive")
    for kind, size, length, prec, modulus in [
        ("nmod_sqr", 84, 4, 0, 1000003),
        ("nmod_interp", 64, 64, 0, 1000000007),
        ("arb_eval2", 64, 128, 1024, 0),
        ("acb_eval2", 64, 128, 1024, 0)]:
        add("control", kind, size, length, prec, modulus, "rebuild_control")
        add("original", kind, size, length, prec, modulus, "same_function_control")
    return result


def command(case, baseline, candidate, trials, milliseconds):
    return list(map(str, [case.get("binary", BINARY), case["kind"], baseline, candidate,
        case["size"], case["length"], case["prec"], case["modulus"],
        case["seed"], trials, milliseconds]))


def next_cases():
    result = []
    for modulus in [1000000007, 18446744073709551557]:
        for size in [16, 32, 64, 128, 256, 512]:
            result.append(dict(candidate="interpolation-leaves", kind="nmod_interp",
                size=size, length=size, prec=0, modulus=modulus, group="active"))
    for kind in ["arb_exp", "acb_exp"]:
        for size, prec, fixture in [(512, 512, 0), (1024, 512, 0),
                (512, 1024, 0), (1024, 1024, 0), (512, 4096, 0),
                (1024, 1024, 1), (1024, 1024, 2), (64, 128, 0)]:
            result.append(dict(candidate="exp-truncation", kind=kind, size=size,
                length=128, prec=prec, modulus=fixture,
                binary=str(ROOT / "build/optimization-series"),
                group="inactive" if size == 64 else "active"))
    for kind in ["nmod_interp", "arb_exp", "acb_exp"]:
        template = next(c for c in result if c["kind"] == kind)
        for candidate, group in [("control", "rebuild_control"), ("original", "same_function_control")]:
            result.append(dict(template, candidate=candidate, group=group))
    return result


def prepare(args):
    check_baseline()
    args.output.mkdir(parents=True, exist_ok=False)
    selected = cases() if args.suite == "initial" else next_cases()
    if args.candidate:
        selected = [c for c in selected if c["candidate"] in args.candidate or
                    c["candidate"] in ("control", "original")]
    rng = random.Random(args.order_seed)
    rng.shuffle(selected)
    frozen = {str(BINARY): sha(BINARY), str(ORIGINAL): sha(ORIGINAL)}
    snapshots = args.output / "sources"
    snapshots.mkdir()
    for p in [Path(__file__), ROOT / "bench/optimization_campaign.c",
              ROOT / "scripts/compare.py", ROOT / "scripts/optimization_campaign.py",
              ROOT / "experiments/flint-optimization-campaign.json",
              ROOT / "bench/optimization_series.c"]:
        dest = snapshots / p.name
        shutil.copyfile(p, dest)
        frozen[str(dest.resolve())] = sha(dest)
    for c in selected:
        binary = Path(c.get("binary", BINARY))
        frozen[str(binary)] = sha(binary)
        c["seed"] = args.input_seed
        library = ORIGINAL if c["candidate"] == "original" else BUILDS / c["candidate"] / "libflint-experiment.dylib"
        c["library"] = str(library)
        frozen[str(library)] = sha(library)
        if c["candidate"] != "original":
            build = BUILDS / c["candidate"] / "build.json"
            frozen[str(build)] = sha(build)
            manifest = json.loads(build.read_text())
            # Freeze the isolated source copies as well as their binaries.
            for p in manifest["changed"]:
                source = BUILDS / c["candidate"] / p
                frozen[str(source)] = sha(source)
    plan = dict(baseline=str(ORIGINAL), trials=args.trials, batch_ms=args.batch_ms,
                input_seed=args.input_seed, order_seed=args.order_seed, cases=selected,
                frozen_sha256=frozen, phase="initial screen; no confirmation claim")
    (args.output / "plan.json").write_text(json.dumps(plan, indent=2) + "\n")
    print(json.dumps({"cases": len(selected), "plan": str(args.output / "plan.json")}))


def verify(plan):
    for p, h in plan["frozen_sha256"].items():
        assert sha(p) == h, p


def measure(output):
    plan = json.loads((output / "plan.json").read_text())
    verify(plan)
    with (output / "raw.jsonl").open("x") as log:
        for i, c in enumerate(plan["cases"]):
            cmd = command(c, plan["baseline"], c["library"], plan["trials"], plan["batch_ms"])
            p = subprocess.run(cmd, capture_output=True, text=True)
            record = dict(case=c, command=cmd, returncode=p.returncode,
                          stderr=p.stderr, rows=[json.loads(line) for line in p.stdout.splitlines()])
            log.write(json.dumps(record) + "\n")
            log.flush()
            p.check_returncode()
            print(f"{i + 1}/{len(plan['cases'])}: {c['candidate']} {c['kind']} {c['size']}", flush=True)
    verify(plan)


def analyze(output):
    plan = json.loads((output / "plan.json").read_text())
    verify(plan)
    raw = [json.loads(line) for line in (output / "raw.jsonl").read_text().splitlines()]
    assert len(raw) == len(plan["cases"])
    results = []
    for r, c in zip(raw, plan["cases"]):
        assert r["returncode"] == 0 and r["case"] == c
        checks = [x for x in r["rows"] if x["phase"] == "check"]
        assert len(checks) == 4 and all(x["passed"] for x in checks)
        bindings = [x for x in r["rows"] if x["phase"] == "binding"]
        assert len(bindings) == 2
        for b in bindings:
            assert Path(b["image"]).resolve() == Path(plan["baseline"] if b["engine"] == 0 else c["library"]).resolve()
        timed = [x for x in r["rows"] if x["phase"] == "timing"]
        assert len(timed) == 4 * plan["trials"]
        result = dict(case=c, checks=checks,
                      cpu=summarize(timed, metric="cpu_ns_per_op"),
                      wall=summarize(timed, metric="ns_per_op"))
        results.append(result)
        print(f"{c['group']:22} {c['candidate']:22} {c['kind']:12} {c['size']:4} {c['prec']:4} "
              f"CPU {result['cpu']['reduction_pct']:7.2f}% "
              f"[{result['cpu']['ci95_low_pct']:7.2f}, {result['cpu']['ci95_high_pct']:7.2f}]")
    with (output / "summary.json").open("x") as f:
        json.dump(dict(raw_sha256=sha(output / "raw.jsonl"), results=results), f, indent=2)
        f.write("\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="action", required=True)
    p = sub.add_parser("prepare")
    p.add_argument("output", type=Path)
    p.add_argument("--candidate", nargs="+")
    p.add_argument("--suite", choices=["initial", "next"], default="initial")
    p.add_argument("--trials", type=int, default=15)
    p.add_argument("--batch-ms", type=int, default=5)
    p.add_argument("--input-seed", type=int, default=91073)
    p.add_argument("--order-seed", type=int, default=24013)
    for mode in ["measure", "analyze"]:
        p = sub.add_parser(mode)
        p.add_argument("output", type=Path)
    args = parser.parse_args()
    if args.action == "prepare": prepare(args)
    elif args.action == "measure": measure(args.output)
    else: analyze(args.output)


if __name__ == "__main__":
    main()
