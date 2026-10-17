#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
library=${1:-.deps/experiments/network-two-lane/libflint-experiment.dylib}
clang -std=gnu23 -O3 -g -mcpu=apple-m2 -fno-omit-frame-pointer \
  -I.deps/flint/src -I/opt/homebrew/opt/gmp/include -I/opt/homebrew/opt/mpfr/include \
  bench/test_network.c "$library" \
  -L/opt/homebrew/opt/gmp/lib -L/opt/homebrew/opt/mpfr/lib -lgmp -lmpfr \
  -o build/test-network
build/test-network
