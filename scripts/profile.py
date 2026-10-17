#!/usr/bin/env python3
"""Sample a warmed FLINT-only process on macOS; never use these runs for timing."""
import argparse
import json
from pathlib import Path
import subprocess
import time
from benchmark import ROOT, metadata


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--limbs", type=int, required=True)
    parser.add_argument("--operation", choices=("mul", "sqr"), default="mul")
    parser.add_argument("--seconds", type=int, default=10)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.limbs < 1 or args.seconds < 1:
        parser.error("limbs and seconds must be positive")
    args.output.mkdir(parents=True, exist_ok=False)
    info = metadata()
    info.update(limbs=args.limbs, operation=args.operation, seconds=args.seconds,
                sampling_interval_ms=1)
    (args.output / "metadata.json").write_text(json.dumps(info, indent=2) + "\n")
    with (args.output / "workload.json").open("w") as output:
        process = subprocess.Popen([str(ROOT / "build/mul"), str(args.limbs),
                                    str(args.limbs), args.operation, "0",
                                    str((args.seconds + 5) * 1000)], stdout=output)
        try:
            time.sleep(1)
            subprocess.run(["sample", str(process.pid), str(args.seconds), "1",
                            "-file", str(args.output / "sample.txt")], check=True)
            if process.wait() != 0:
                raise RuntimeError("profile workload failed")
        finally:
            if process.poll() is None:
                process.terminate()
                process.wait()


if __name__ == "__main__":
    main()
