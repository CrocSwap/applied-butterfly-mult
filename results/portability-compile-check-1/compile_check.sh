#!/bin/bash
# Compile-only check of pinned vs C3-patched mpn_mul_np2.c for NEON (arm64) and AVX2 (x86_64).
set -u
B="$1"; cd "$B/build"
INC=(-I inc -I "$B/dl/flint-src/src" -I "$B/dl/flint-src/src/fft_small" -I /opt/homebrew/include)
for f in ${FILES:-base c3}; do
  for arch in arm64 x86_64; do
    if [ $arch = arm64 ]; then FL=(-target arm64-apple-macos13 -mcpu=apple-m2); else FL=(-target x86_64-apple-macos13 -mavx2 -mfma -mbmi2); fi
    clang "${FL[@]}" -O3 -Wall -c -I inc-$arch "${INC[@]}" ${f}_mpn_mul_np2.c -o ${f}_$arch.o 2> ${f}_$arch.log
    echo "$f $arch exit=$? warnings=$(grep -c 'warning:' ${f}_$arch.log) errors=$(grep -c 'error:' ${f}_$arch.log)"
  done
done
