#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
mkdir -p build
gmp_prefix=${GMP_PREFIX:-$(brew --prefix gmp)}
clang -O3 -g -fno-omit-frame-pointer -Wall -Wextra \
    -I"$gmp_prefix/include" bench/compare.c -L"$gmp_prefix/lib" -lgmp -o build/compare
clang -O3 -g -fno-omit-frame-pointer -Wall -Wextra \
    -D_DARWIN_C_SOURCE -DBF_HIGH_QOS \
    -I"$gmp_prefix/include" bench/compare.c -L"$gmp_prefix/lib" -lgmp -o build/compare-qos
clang -O3 -g -DBF_VALIDATE_ONLY \
    -I"$gmp_prefix/include" bench/compare.c -L"$gmp_prefix/lib" -lgmp -o build/validate
clang -O3 -g -fno-omit-frame-pointer -Wall -Wextra \
    -D_DARWIN_C_SOURCE -DBF_HIGH_QOS -DBF_DUAL_CLOCK \
    -I"$gmp_prefix/include" bench/compare.c -L"$gmp_prefix/lib" -lgmp -o build/compare-dual
