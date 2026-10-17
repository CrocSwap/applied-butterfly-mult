#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
mkdir -p build
gmp_prefix=${GMP_PREFIX:-$(brew --prefix gmp)}
mpfr_prefix=${MPFR_PREFIX:-$(brew --prefix mpfr)}
clang -O3 -g -fno-omit-frame-pointer -Wall -Wextra \
  -I.deps/flint/src -I"$gmp_prefix/include" -I"$mpfr_prefix/include" \
  bench/pi.c -L"$gmp_prefix/lib" -L"$mpfr_prefix/lib" -lgmp -lmpfr -o build/pi
