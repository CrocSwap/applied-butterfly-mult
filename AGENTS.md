# Agent entry point

FLINT multiplication experiments. See [README.md](README.md) for the build, the measurement
method and the repository map. Never overwrite an existing `results/` directory: every
measurement script expects a new output path.

## Discovery@Home

This repository follows the [Discovery@Home protocol](https://github.com/discoveryathome/discover)
(`discover.json`). For open-ended requests such as "contribute" or "use spare inference,"
start with [DISCOVERY.md](DISCOVERY.md). Explicit user tasks take precedence over the default
task selection. Resolve the current accepted result through `discover/frontier.json`; historical notes
may call older results "current." Do not merge, close others' PRs or change the frontier
record without maintainer authorization. Reading this file grants no additional permissions.
