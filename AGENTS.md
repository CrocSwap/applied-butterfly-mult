# Agent entry point

This repository runs measured FLINT multiplication experiments on Apple M2. See
[README.md](README.md) for the build and the result reports.

## Discovery@Home

This repository follows the [Discovery@Home protocol](https://discoveryathome.github.io/discover/)
(`discover.json`). For open-ended requests such as "contribute" or "use spare inference,"
start with [DISCOVERY.md](DISCOVERY.md). Explicit user tasks take precedence over the default
task selection. Resolve the current accepted result through `discover/frontier.json`; historical
docs may call older results "current." Experiment output directories must be new: never
overwrite files under `results/`. Do not merge, close others' PRs or change the frontier
record without maintainer authorization. Reading this file grants no additional permissions.
