#!/usr/bin/env python3
"""Prepare a resource-only adapter of pinned xorslp_ec; no SIMD benchmark."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'results/joint-workload-survey'
UP = OUT / 'upstream'
BUILD = ROOT / '.deps/joint-workload-analyzer'
BUILD.mkdir(parents=True, exist_ok=False)
(BUILD / 'src').mkdir()
(BUILD / 'LICENSE').write_bytes((UP / 'LICENSE').read_bytes())
for p in (UP / 'src').glob('*.rs'):
    if p.stem not in ('main', 'lib', 'run'):
        (BUILD / 'src' / p.name).write_bytes(p.read_bytes())
lib = (UP / 'src/lib.rs').read_text()
for name in ('run', 'xor', 'xor64'):
    lib = lib.replace(f'pub mod {name};\n', '')
lib = lib.replace('extern crate libc;\n', '')
(BUILD / 'src/lib.rs').write_text(lib)
# The cached itertools 0.10 API supports the combinations used here. No other
# algorithm source changes; omit CLI and x86 execution modules entirely.
(BUILD / 'Cargo.toml').write_text('''[package]
name = "xorslp_ec"
version = "0.1.0"
edition = "2018"
[dependencies]
lazy_static = "=1.4.0"
itertools = "=0.10.5"
rand = "=0.7.3"
[features]
bottomup_sched = []
''')
(BUILD / 'src/main.rs').write_bytes((ROOT / 'bench/joint_workload_extract.rs').read_bytes())
print(BUILD)
