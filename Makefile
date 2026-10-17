.PHONY: all check benchmark

all:
	sh scripts/bootstrap.sh

check: all
	$(MAKE) -C .deps/flint -j4 check MOD=fft_small ARGS='sd_fft mpn_ctx_mpn_mul mpn_ctx_to_from_ffts'
	build/mul 1000 1000 mul 3 10
	build/mul 1400 1400 sqr 3 10
	build/mul 40001 20000 mul 3 10

# Supply a new directory on every run to preserve previous evidence.
benchmark: all
	python3 scripts/benchmark.py --output $(OUTPUT) --unbalanced
