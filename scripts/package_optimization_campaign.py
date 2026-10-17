#!/usr/bin/env python3
"""Audit and package the five retained FLINT changes with their evidence."""
import datetime
import json
from pathlib import Path
import re
import shutil
import subprocess
import tarfile

from optimization_campaign import ROOT, BASE, BUILDS, OUT, sha, check_baseline
from run_optimization_screen import verify

PATCHES = [
    ("0001-nmod-matrix-square-dispatch.patch", ["opt-nmod-matrix-sqr-fallthrough.patch"]),
    ("0002-nmod-interpolation-batch-inversion.patch", ["opt-nmod-interpolation-batch-inverse.patch", "opt-interpolation-coverage.patch"]),
    ("0003-ball-evaluation-derivative-dot.patch", ["opt-ball-evaluate2-dot.patch", "opt-evaluate2-coverage.patch"]),
    ("0004-interpolation-scalar-leaves.patch", ["opt-interpolation-leaves-v2.patch", "opt-interpolation-leaves-coverage.patch"]),
    ("0005-hyperbolic-series-shared-inverse.patch", ["opt-hyperbolic-shared-inverse-v2.patch", "opt-hyperbolic-coverage-v2.patch"]),
]
RUNS = ["screen-1", "screen-2", "screen-3", "confirmation-1", "confirmation-2",
        "series-confirmation-1", "series-confirmation-2", "combined-confirmation",
        "leaf-interaction", "control-audit", "placement-diagnostic",
        "process-audit-1", "process-audit-2"]


def copy(source, destination):
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(source, destination)


def main():
    check_baseline()
    dest = OUT / "review-v1"
    dest.mkdir(exist_ok=False)
    audit = dict(created_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
                 baseline_commit=subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=BASE, text=True).strip(),
                 runs={}, builds={}, tests={}, patch_application={})
    summaries = {}
    build_names = {"combined-v1", "combined-asan-v1", "combined-without-leaves-v1",
                   "interpolation-inverse-review", "evaluate2-dot-review", "hyperbolic-inverse-v2"}
    for run in RUNS:
        directory = OUT / run
        plan = json.loads((directory / "plan.json").read_text())
        summary = json.loads((directory / "summary.json").read_text())
        verify(plan)
        assert summary["raw_sha256"] == sha(directory / "raw.jsonl")
        assert len(summary["results"]) == len(plan["cases"])
        summaries[run] = summary["results"]
        audit["runs"][run] = dict(cases=len(plan["cases"]), raw_sha256=summary["raw_sha256"])
        for case in plan["cases"]:
            if case["candidate"] != "original":
                build_names.add(case["candidate"])
        shutil.copytree(directory, dest / "evidence" / run)

    # Use the preregistered confirmations plus the more conservative fresh-
    # process audits for qualification; preserve the unfavorable diagnostics.
    for run in ["confirmation-1", "confirmation-2", "series-confirmation-1",
                "series-confirmation-2", "combined-confirmation", "process-audit-1", "process-audit-2"]:
        for result in summaries[run]:
            if not result["case"]["group"].startswith("active"):
                continue
            assert result["cpu"]["ci95_low_pct"] > 0, (run, result["case"])
            assert result["wall"]["ci95_low_pct"] > 0, (run, result["case"])
            if "checks" in result and "accuracy" in result["checks"][0]:
                assert result["checks"][1]["accuracy"] >= result["checks"][0]["accuracy"]
            if "accuracies" in result:
                accuracy = result["accuracies"]
                assert min(accuracy["1"]) >= min(accuracy["0"])

    for name in sorted(build_names):
        build = BUILDS / name
        manifest = json.loads((build / "build.json").read_text())
        for path, expected in manifest["sha256"].items():
            assert sha(path) == expected, path
        audit["builds"][name] = dict(library_sha256=sha(build / "libflint-experiment.dylib"),
                                     changed=manifest["changed"])
        copy(build / "build.json", dest / "evidence/builds" / name / "build.json")
        for path in manifest["changed"]:
            copy(build / path, dest / "evidence/builds" / name / path)
        for log in sorted(build.glob("test-*.log")):
            content = re.sub(r"\x1b\[[0-9;]*m", "", log.read_text())
            assert "FAIL" not in content and "PASS" in content, log
            audit["tests"][str(log.relative_to(BUILDS))] = dict(passed=content.count("PASS"), sha256=sha(log))
            copy(log, dest / "evidence/tests" / name / log.name)
            metadata = log.with_suffix(".json")
            if metadata.exists():
                copy(metadata, dest / "evidence/tests" / name / metadata.name)

    for output, sources in PATCHES:
        patch = dest / "patches" / output
        patch.parent.mkdir(exist_ok=True)
        patch.write_text("".join((ROOT / "patches" / p).read_text() for p in sources))

    # Apply the exact delivered patches independently and compare every changed
    # file byte-for-byte with the tested, measured combined source tree.
    stage = dest / "validation/applied-source"
    manifest = json.loads((BUILDS / "combined-v1/build.json").read_text())
    for path in manifest["changed"]:
        copy(BASE / path, stage / path)
    with (dest / "validation/apply.log").open("w") as log:
        for output, _ in PATCHES:
            subprocess.run(["patch", "--batch", "--forward", "-p1", "-i", str(dest / "patches" / output)],
                           cwd=stage, stdout=log, stderr=subprocess.STDOUT, check=True)
    for path in manifest["changed"]:
        expected = sha(BUILDS / "combined-v1" / path)
        assert sha(stage / path) == expected, path
        audit["patch_application"][path] = expected

    copy(OUT / "baseline/build.json", dest / "evidence/baseline-build.json")
    for name in ["profiles-initial", "profiles-next", "profiles-series"]:
        shutil.copytree(OUT / name, dest / "evidence" / name)
    for name in ["result.json", "baseline.log"]:
        copy(OUT / "sqr-regression" / name, dest / "evidence/sqr-regression" / name)

    # A small runnable source bundle for fresh macOS/Apple-M2 reproductions.
    for name in ["setup_optimization_campaign.py", "optimization_campaign.py", "run_optimization_screen.py",
                 "run_process_optimization_audit.py", "profile_optimization_campaign.py", "compare.py", "benchmark.py"]:
        copy(ROOT / "scripts" / name, dest / "reproduce/scripts" / name)
    for name in ["optimization_campaign.c", "optimization_series.c", "optimization_campaign_diagnostic.c"]:
        copy(ROOT / "bench" / name, dest / "reproduce/bench" / name)
    copy(ROOT / "experiments/flint-optimization-campaign.json",
         dest / "reproduce/experiments/flint-optimization-campaign.json")
    for _, sources in PATCHES:
        for name in sources:
            copy(ROOT / "patches" / name, dest / "reproduce/patches" / name)
    for path in ["review-report.md", "review-reproduction.md"]:
        copy(ROOT / "docs" / path, dest / ("README.md" if path == "review-report.md" else "REPRODUCE.md"))

    table = ["# Fresh-process audit results", "", "Complete-call time reductions; 95% moving-block bootstrap intervals across process quartets.", "",
             "| Run | Candidate | Operation | Size | Modulus | CPU reduction | Wall reduction |", "| --- | --- | --- | ---: | ---: | --- | --- |"]
    for run in ["process-audit-1", "process-audit-2"]:
        for result in summaries[run]:
            c = result["case"]
            cells = []
            for clock in ["cpu", "wall"]:
                s = result[clock]
                cells.append(f"{s['reduction_pct']:.2f}% [{s['ci95_low_pct']:.2f}, {s['ci95_high_pct']:.2f}]")
            table.append(f"| {run} | {c['candidate']} | {c['kind']} | {c['size']} | {c['modulus']} | " + " | ".join(cells) + " |")
    (dest / "PROCESS-AUDITS.md").write_text("\n".join(table) + "\n")
    (dest / "audit.json").write_text(json.dumps(audit, indent=2) + "\n")
    files = sorted(p for p in dest.rglob("*") if p.is_file())
    (dest / "SHA256SUMS").write_text("".join(f"{sha(p)}  {p.relative_to(dest)}\n" for p in files))
    archive = OUT / "flint-optimization-review-v1.tar.gz"
    with tarfile.open(archive, "x:gz") as tar:
        tar.add(dest, arcname="flint-optimization-review-v1")
    print(json.dumps(dict(package=str(dest), archive=str(archive), archive_sha256=sha(archive),
                         files=len(files) + 1, source_files_verified=len(audit["patch_application"]),
                         test_passes=sum(x["passed"] for x in audit["tests"].values()))))


if __name__ == "__main__":
    main()
