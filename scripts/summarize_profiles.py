#!/usr/bin/env python3
"""Group exclusive top-of-stack samples, never recursive inclusive counts."""
import argparse
from collections import Counter
import json
from pathlib import Path
import re


def category(name):
    if name.startswith("sd_fft_ctx_point_"):
        return "pointwise"
    if name.startswith("sd_ifft_") or "moth_inv" in name:
        return "inverse_fft"
    if name.startswith("sd_fft_"):
        return "forward_fft"
    if "from_ffts" in name or "crt_recompose" in name or name == "_convert_block":
        return "reconstruction"
    if "mpn_to_fft" in name or "np2_pack" in name:
        return "packing"
    return "other_or_inline"


def summarize(path):
    text = path.read_text()
    graph = text.split("Call graph:", 1)[1].split("Total number in stack", 1)[0]
    total = sum(map(int, re.findall(r"^\s+(\d+) Thread_", graph, re.M)))
    collapsed = text.split("Sort by top of stack, same collapsed", 1)[1].split("Binary Images:", 1)[0]
    counts = Counter()
    functions = []
    for line in collapsed.splitlines():
        match = re.match(r"\s+(\S+)\s+\(in .*\)\s+(\d+)\s*$", line)
        if match:
            name, count = match.group(1), int(match.group(2))
            counts[category(name)] += count
            functions.append({"function": name, "samples": count})
    if not total or sum(counts.values()) > total:
        raise ValueError(f"unexpected sample format or counts: {path}")
    counts["other_or_inline"] += total - sum(counts.values())
    return {"source": str(path), "samples": total, "counts": dict(counts),
            "percent": {k: round(100 * v / total, 2) for k, v in sorted(counts.items())},
            "functions": functions,
            "caveat": "Exclusive samples, approximate attribution. Inlined work and entries omitted below five samples remain other_or_inline. No separation of arithmetic and memory stalls."}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("profiles", type=Path, nargs="+")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    results = [summarize(path) for path in args.profiles]
    args.output.write_text(json.dumps(results, indent=2) + "\n")
    for row in results:
        print(row["source"], row["percent"])


if __name__ == "__main__":
    main()
