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


def series_cases(confirmation):
    result = []
    for modulus in [1000000007, 18446744073709551557]:
        sizes = [16, 32, 64, 128, 256, 512]
        if confirmation:
            sizes = [16, 17, 31, 32, 33, 63, 64, 65, 129, 256]
        for size in sizes:
            result.append(dict(candidate="interpolation-leaves-v2", kind="nmod_interp",
                size=size, length=size, prec=0, modulus=modulus,
                group="active" if size <= 33 else "larger_neighbor"))
    for size in [8, 15]:
        result.append(dict(candidate="interpolation-leaves-v2", kind="nmod_interp",
            size=size, length=size, prec=0, modulus=1000000007, group="inactive"))
    for kind in ["arb_sinhcosh", "acb_sinhcosh"]:
        fixtures = [(512, 512, 0), (1024, 512, 0), (512, 1024, 0),
            (1024, 1024, 0), (512, 4096, 0), (1024, 128, 0),
            (1024, 1024, 1), (1024, 1024, 2)]
        if confirmation:
            fixtures += [(301, 1024, 0), (302, 1024, 0), (513, 1024, 0)]
        fixtures += [(64, 128, 0), (300, 1024, 0),
                     (512, 1024, 3), (512, 1024, 4)]
        for size, prec, fixture in fixtures:
            inactive = size == 64 or (size == 300 and prec == 1024) or fixture == 4
            result.append(dict(candidate="hyperbolic-inverse-v2", kind=kind,
                size=size, length=128, prec=prec, modulus=fixture,
                binary=str(ROOT / "build/optimization-series-v2"),
                group="inactive" if inactive else ("sparse" if fixture == 3 else "active")))
    for kind in ["nmod_interp", "arb_sinhcosh", "acb_sinhcosh"]:
        template = next(c for c in result if c["kind"] == kind)
        for candidate, group in [("control", "rebuild_control"),
                                 ("original", "same_function_control")]:
            result.append(dict(template, candidate=candidate, group=group))
    return result


def combined_cases():
    result = []
    for c in cases():
        if (c["candidate"] in ("control", "original") or
            (c["kind"] == "nmod_sqr" and (c["size"], c["length"]) in [(84, 4), (96, 16), (80, 1)]) or
            (c["kind"] == "nmod_interp" and c["size"] in [8, 16, 32, 128, 512]) or
            (c["kind"].endswith("eval2") and ((c["size"] in [32, 128] and c["prec"] == 1024) or c["prec"] == 512))):
            result.append(c)
    for c in series_cases(False):
        if "sinhcosh" in c["kind"] and (
            c["candidate"] in ("control", "original") or
            (c["size"] == 512 and c["prec"] == 1024 and c["modulus"] in [0, 3, 4]) or
            (c["size"] == 1024 and c["prec"] == 1024 and c["modulus"] in [1, 2]) or
            c["size"] == 64):
            result.append(c)
    for c in result:
        if c["candidate"] not in ("control", "original"):
            c["component"] = c["candidate"]
            c["candidate"] = "combined-v1"
    return result


def interaction_cases():
    result = []
    for modulus in [1000000007, 18446744073709551557]:
        for size in [16, 17, 31, 32, 33, 64, 128]:
            result.append(dict(candidate="combined-v1", kind="nmod_interp",
                size=size, length=size, prec=0, modulus=modulus, group="incremental"))
        for size in [16, 128]:
            result.append(dict(candidate="combined-without-leaves-v1", kind="nmod_interp",
                size=size, length=size, prec=0, modulus=modulus,
                group="same_function_control"))
    return result


def control_audit_cases():
    result = []
    for candidate, count in [("original", 4), ("control", 2),
                              ("combined-v1", 3), ("evaluate2-dot", 3)]:
        for repeat in range(count):
            result.append(dict(candidate=candidate, kind="acb_eval2", size=64,
                length=128, prec=1024, modulus=0, repeat=repeat,
                group="active" if candidate not in ("control", "original") else "control"))
    return result


def prepare(args):
    check_baseline()
    args.output.mkdir(parents=True, exist_ok=False)
    selected = {"initial": cases, "next": next_cases,
                "series": lambda: series_cases(args.phase == "confirmation"),
                "combined": combined_cases, "interaction": interaction_cases,
                "control-audit": control_audit_cases}[args.suite]()
    if args.phase == "confirmation" and args.suite == "initial":
        for modulus in [1000000007, 18446744073709551557]:
            for size in [17, 31, 33, 63, 65, 127, 129]:
                selected.append(dict(candidate="interpolation-inverse", kind="nmod_interp",
                    size=size, length=size, prec=0, modulus=modulus, group="active_neighbor"))
        for kind in ["arb_eval2", "acb_eval2"]:
            for size in [31, 33, 63, 65]:
                selected.append(dict(candidate="evaluate2-dot", kind=kind, size=size,
                    length=128, prec=1024, modulus=0, group="active_neighbor"))
        for size, length, active in [(81, 1, False), (82, 1, True), (83, 4, True), (83, 9, False)]:
            selected.append(dict(candidate="sqr-fallthrough", kind="nmod_sqr", size=size,
                length=length, prec=0, modulus=1000003,
                group="active_neighbor" if active else "inactive_neighbor"))
    if args.candidate:
        selected = [c for c in selected if c["candidate"] in args.candidate or
                    c["candidate"] in ("control", "original")]
    baseline = ORIGINAL if not args.baseline_build else (
        BUILDS / args.baseline_build / "libflint-experiment.dylib")
    if args.baseline_build:
        for c in selected:
            if c["candidate"] == args.baseline_build:
                c["group"] = "same_function_control"
            elif c["candidate"] == "original":
                c["group"] = "original_build_control"
    rng = random.Random(args.order_seed)
    rng.shuffle(selected)
    frozen = {str(BINARY): sha(BINARY), str(ORIGINAL): sha(ORIGINAL),
              str(baseline): sha(baseline)}
    snapshots = args.output / "sources"
    snapshots.mkdir()
    for p in [Path(__file__), ROOT / "bench/optimization_campaign.c",
              ROOT / "scripts/compare.py", ROOT / "scripts/optimization_campaign.py",
              ROOT / "experiments/flint-optimization-campaign.json",
              ROOT / "bench/optimization_series.c"]:
        dest = snapshots / p.name
        shutil.copyfile(p, dest)
        frozen[str(dest.resolve())] = sha(dest)
    patches = snapshots / "patches"
    patches.mkdir()
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
            for p, h in manifest["sha256"].items():
                source_patch = Path(p)
                if source_patch.suffix == ".patch":
                    assert sha(source_patch) == h, source_patch
                    saved = patches / source_patch.name
                    if saved.exists():
                        assert sha(saved) == h, saved
                    else:
                        shutil.copyfile(source_patch, saved)
                    frozen[str(saved.resolve())] = h
            # Freeze the isolated source copies as well as their binaries.
            for p in manifest["changed"]:
                source = BUILDS / c["candidate"] / p
                frozen[str(source)] = sha(source)
    plan = dict(baseline=str(baseline), trials=args.trials, batch_ms=args.batch_ms,
                input_seed=args.input_seed, order_seed=args.order_seed, cases=selected,
                frozen_sha256=frozen, phase=args.phase)
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
    p.add_argument("--baseline-build", help="Use an isolated unchanged build as the primary comparator")
    p.add_argument("--suite", choices=["initial", "next", "series", "combined", "interaction", "control-audit"], default="initial")
    p.add_argument("--phase", choices=["screen", "confirmation"], default="screen")
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
