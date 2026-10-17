_sd_fft_basecase_5_0:                   ; @sd_fft_basecase_5_0
Lfunc_begin10:
	.loc	0 638 0 is_stmt 1               ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:638:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_fft_basecase_5_0:Q <- $x0
	;DEBUG_VALUE: sd_fft_basecase_5_0:X <- $x1
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_r <- $x2
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_bits <- $x3
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x3
Ltmp2500:
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_bits <- $x19
	mov	x21, x2
Ltmp2501:
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_r <- $x21
	mov	x20, x0
Ltmp2502:
	;DEBUG_VALUE: sd_fft_basecase_5_0:Q <- $x20
	.loc	0 639 5 prologue_end            ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:639:5
	lsl	x8, x3, #3
Ltmp2503:
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:w <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:w <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:w <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:w <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	8 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:639:5 ] ] ]
	mov	x9, x0
	ld1r.2d	{ v0 }, [x9], x8
Ltmp2504:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_5_0:n <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_5_0:n <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_5_0:n <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_5_0:n <- [DW_OP_LLVM_fragment 384 128] $q0
	.loc	0 639 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:639:5
	ldr	x8, [x9, #56]
	ldr	d1, [x8, x2, lsl #3]
Ltmp2505:
	;DEBUG_VALUE: vec8d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	ldr	d2, [x0, #8]
Ltmp2506:
	;DEBUG_VALUE: vec8d_set_d:a <- $d2
	;DEBUG_VALUE: vec4d_set_d:a <- $d2
	;DEBUG_VALUE: vec2d_set_d:a <- $d2
	;DEBUG_VALUE: i <- 0
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_load:a <- $x1
	;DEBUG_VALUE: vec4d_load:a <- $x1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q3, q4, [x1]
Ltmp2507:
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	8 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q5, q6, [x1, #32]
Ltmp2508:
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	.loc	8 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v7, v3, v2[0]
Ltmp2509:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2510:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v3, v0, v7
Ltmp2511:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v7, v4, v2[0]
Ltmp2512:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2513:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v4, v0, v7
Ltmp2514:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v7, v5, v2[0]
Ltmp2515:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2516:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v5, v0, v7
Ltmp2517:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v7, v6, v2[0]
Ltmp2518:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2519:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v6, v0, v7
Ltmp2520:
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 256 128] $q5
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	mov	x22, x1
	ldr	q7, [x22, #128]!
Ltmp2521:
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:a <- $x22
	;DEBUG_VALUE: vec4d_load:a <- $x22
	;DEBUG_VALUE: vec2d_load:a <- $x22
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x1
	.loc	8 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1902:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q16, q17, [x1, #144]
Ltmp2522:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	.loc	8 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v18, v7, v1[0]
Ltmp2523:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v19, v18, v2[0]
Ltmp2524:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp2525:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v20, v18
	fmls.2d	v20, v7, v1[0]
Ltmp2526:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v18, v0, v19
Ltmp2527:
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v7, v18, v20
Ltmp2528:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v18, v16, v1[0]
Ltmp2529:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v19, v18, v2[0]
Ltmp2530:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp2531:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v20, v18
Ltmp2532:
	fmls.2d	v20, v16, v1[0]
Ltmp2533:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v18, v0, v19
Ltmp2534:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v16, v18, v20
Ltmp2535:
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v18, v17, v1[0]
Ltmp2536:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v19, v18, v2[0]
Ltmp2537:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp2538:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v20, v18
Ltmp2539:
	fmls.2d	v20, v17, v1[0]
Ltmp2540:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v18, v0, v19
Ltmp2541:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v17, v18, v20
Ltmp2542:
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1902:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q18, q19, [x1, #176]
Ltmp2543:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 384 128] $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v20, v18, v1[0]
Ltmp2544:
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v21, v20, v2[0]
Ltmp2545:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v21, v21
Ltmp2546:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v22, v20
	fmls.2d	v22, v18, v1[0]
Ltmp2547:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp2548:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v18, v20, v22
Ltmp2549:
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v20, v3, v7
Ltmp2550:
	;DEBUG_VALUE: vec4d_add:z1 <- $q20
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	8 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v21, v4, v16
Ltmp2551:
	;DEBUG_VALUE: vec4d_add:z2 <- $q21
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v22, v5, v17
Ltmp2552:
	;DEBUG_VALUE: vec4d_add:z1 <- $q22
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q18
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v23, v6, v18
Ltmp2553:
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 384 128] $q23
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 256 128] $q22
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q22
	;DEBUG_VALUE: vec8d_store:z <- $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	.loc	8 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q20, q21, [x1]
Ltmp2554:
	;DEBUG_VALUE: vec2d_store:a <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_store:a <- $q22
	;DEBUG_VALUE: __s1 <- $q22
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	8 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q22, q23, [x1, #32]
Ltmp2555:
	;DEBUG_VALUE: vec2d_store:a <- $q23
	;DEBUG_VALUE: __s1 <- $q23
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v7, v3, v7
Ltmp2556:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	8 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v4, v4, v16
Ltmp2557:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v5, v5, v17
Ltmp2558:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v3, v6, v18
Ltmp2559:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_store:a <- $q7
	;DEBUG_VALUE: __s1 <- $q7
	;DEBUG_VALUE: vec8d_store:z <- $x22
	;DEBUG_VALUE: vec4d_store:z <- $x22
	;DEBUG_VALUE: vec2d_store:z <- $x22
	.loc	8 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	str	q7, [x22]
Ltmp2560:
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x1
	.loc	8 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1884:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q4, q5, [x1, #144]
Ltmp2561:
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	.loc	8 1571 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q4, q5, [x1, #64]
Ltmp2562:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	8 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q6, q7, [x1, #96]
Ltmp2563:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	8 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v16, v4, v2[0]
Ltmp2564:
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2565:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v4, v0, v16
Ltmp2566:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v16, v5, v2[0]
Ltmp2567:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2568:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v5, v0, v16
Ltmp2569:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q7
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v16, v6, v2[0]
Ltmp2570:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2571:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v6, v0, v16
Ltmp2572:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2573:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2574:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2575:
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x1
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1902:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldp	q16, q17, [x1, #208]
Ltmp2576:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x1
	.loc	8 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1902:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	ldr	q18, [x1, #240]
Ltmp2577:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	.loc	8 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2578:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 384 128] $q0
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v21, v20, v2[0]
Ltmp2579:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v21, v21
Ltmp2580:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v22, v20
Ltmp2581:
	fmls.2d	v22, v19, v1[0]
Ltmp2582:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp2583:
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v19, v20, v22
Ltmp2584:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v20, v16, v1[0]
Ltmp2585:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v21, v20, v2[0]
Ltmp2586:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v21, v21
Ltmp2587:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v22, v20
Ltmp2588:
	fmls.2d	v22, v16, v1[0]
Ltmp2589:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp2590:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v16, v20, v22
Ltmp2591:
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v20, v17, v1[0]
Ltmp2592:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v21, v20, v2[0]
Ltmp2593:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v21, v21
Ltmp2594:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v22, v20
Ltmp2595:
	fmls.2d	v22, v17, v1[0]
Ltmp2596:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp2597:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v17, v20, v22
Ltmp2598:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v20, v18, v1[0]
Ltmp2599:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmul.2d	v2, v20, v2[0]
Ltmp2600:
	;DEBUG_VALUE: vec2d_round:a <- $q2
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	frintn.2d	v2, v2
Ltmp2601:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	mov.16b	v21, v20
Ltmp2602:
	fmls.2d	v21, v18, v1[0]
Ltmp2603:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fmls.2d	v20, v0, v2
Ltmp2604:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ] ] ]
	fsub.2d	v0, v20, v21
Ltmp2605:
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v1, v4, v19
Ltmp2606:
	;DEBUG_VALUE: vec4d_add:z1 <- $q1
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	8 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v2, v5, v16
Ltmp2607:
	;DEBUG_VALUE: vec4d_add:z2 <- $q2
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v18, v6, v17
Ltmp2608:
	;DEBUG_VALUE: vec4d_add:z1 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q0
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fadd.2d	v20, v7, v0
Ltmp2609:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 256 128] $q18
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q18
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	.loc	8 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q1, q2, [x1, #64]
Ltmp2610:
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_store:a <- $q18
	;DEBUG_VALUE: __s1 <- $q18
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	8 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q18, q20, [x1, #96]
Ltmp2611:
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v1, v4, v19
Ltmp2612:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q1
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q3
	.loc	8 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v2, v5, v16
Ltmp2613:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q2
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v4, v6, v17
Ltmp2614:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x1
	.loc	8 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1884:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q3, q1, [x1, #176]
Ltmp2615:
	;DEBUG_VALUE: i <- 8
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q0
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	fsub.2d	v0, v7, v0
Ltmp2616:
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:z2 <- $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 256 128] $q4
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x1
	.loc	8 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1884:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	stp	q2, q4, [x1, #208]
Ltmp2617:
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x1
	.loc	8 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1884:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:641:9 ] ] ]
	str	q0, [x1, #240]
Ltmp2618:
	;DEBUG_VALUE: i <- 16
	.loc	0 643 30 is_stmt 1              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:643:30
	lsl	x2, x2, #1
	.loc	0 643 43 is_stmt 0              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:643:43
	add	x3, x3, #1
	.loc	0 643 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:643:5
	bl	_sd_fft_basecase_4_0
Ltmp2619:
	;DEBUG_VALUE: sd_fft_basecase_5_0:X <- [DW_OP_LLVM_entry_value 1] $x1
	.loc	0 0 5                           ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:0:5
	mov	w2, #1                          ; =0x1
	.loc	0 644 37 is_stmt 1              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:644:37
	bfi	x2, x21, #1, #63
	.loc	0 643 43                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:643:43
	add	x3, x19, #1
	.loc	0 644 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:644:5
	mov	x0, x20
	mov	x1, x22
	.loc	0 644 5 epilogue_begin is_stmt 0 ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:644:5
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
Ltmp2620:
	;DEBUG_VALUE: sd_fft_basecase_5_0:Q <- [DW_OP_LLVM_entry_value 1] $x0
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_bits <- [DW_OP_LLVM_entry_value 1] $x3
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
Ltmp2621:
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_r <- [DW_OP_LLVM_entry_value 1] $x2
	b	_sd_fft_basecase_4_0
Ltmp2622:
Lfunc_end10:
	.cfi_endproc
