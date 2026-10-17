#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
root=$(pwd)
revision=$(python3 -c 'import json; print(json.load(open("deps.json"))["flint"]["commit"])')
mkdir -p .deps build
if [ ! -d .deps/flint/.git ]; then
    git init .deps/flint
    git -C .deps/flint remote add origin https://github.com/flintlib/flint.git
    git -C .deps/flint fetch --depth 1 origin "$revision"
    git -C .deps/flint checkout --detach FETCH_HEAD
fi
test "$(git -C .deps/flint rev-parse HEAD)" = "$revision" || {
    echo 'FLINT checkout differs from deps.json; use a separate checkout for experiments.' >&2
    exit 1
}
gmp_prefix=${GMP_PREFIX:-$(brew --prefix gmp)}
mpfr_prefix=${MPFR_PREFIX:-$(brew --prefix mpfr)}
cd .deps/flint
if [ ! -f configure ]; then ./bootstrap.sh > "$root/build/bootstrap.log" 2>&1; fi
if [ ! -f Makefile ]; then
    ./configure --with-gmp="$gmp_prefix" --with-mpfr="$mpfr_prefix" \
        --disable-static CC="${CC:-clang}" \
        CFLAGS="${CFLAGS:--O3 -g -mcpu=apple-m2 -fno-omit-frame-pointer}" \
        > "$root/build/configure.log" 2>&1
fi
make -j"${JOBS:-4}" > "$root/build/flint-build.log" 2>&1
cd "$root"
"${CC:-clang}" -O3 -g -fno-omit-frame-pointer -Wall -Wextra \
    -I.deps/flint/src -I"$gmp_prefix/include" -I"$mpfr_prefix/include" \
    bench/mul.c -L.deps/flint -L"$gmp_prefix/lib" \
    -Wl,-rpath,"$root/.deps/flint" -lflint -lgmp -o build/mul
