_sd_ifft_basecase_5_0:                  ; @sd_ifft_basecase_5_0
Lfunc_begin10:
	.loc	0 522 0 is_stmt 1               ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:522:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:Q <- $x0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:X <- $x1
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_mr <- $x2
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_bits <- $x3
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x20, x3
Ltmp2236:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_bits <- $x20
	mov	x21, x2
Ltmp2237:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_mr <- $x21
	mov	x19, x1
Ltmp2238:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:X <- $x19
	mov	x22, x0
Ltmp2239:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:Q <- $x22
	.loc	0 523 31 prologue_end           ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:523:31
	lsl	x23, x2, #1
	mov	w2, #1                          ; =0x1
	.loc	0 523 36 is_stmt 0              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:523:36
	bfi	x2, x21, #1, #63
	.loc	0 523 45                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:523:45
	add	x3, x3, #1
	.loc	0 523 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:523:5
	bl	_sd_ifft_basecase_4_0
Ltmp2240:
	.loc	0 524 29 is_stmt 1              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:524:29
	add	x1, x19, #128
	.loc	0 523 45                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:523:45
	add	x3, x20, #1
	.loc	0 524 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:524:5
	mov	x0, x22
	mov	x2, x23
	bl	_sd_ifft_basecase_4_0
Ltmp2241:
	.loc	0 525 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:525:5
	lsl	x8, x20, #3
Ltmp2242:
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:W <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:W <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:W <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:W <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:525:5 ] ] ]
	mov	x9, x22
	ld1r.2d	{ v0 }, [x9], x8
Ltmp2243:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:n <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:n <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:n <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:n <- [DW_OP_LLVM_fragment 384 128] $q0
	.loc	0 525 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:525:5
	ldr	x8, [x9, #56]
	ldr	d1, [x8, x21, lsl #3]
Ltmp2244:
	;DEBUG_VALUE: vec8d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	ldr	d2, [x22, #8]
Ltmp2245:
	;DEBUG_VALUE: vec8d_set_d:a <- $d2
	;DEBUG_VALUE: vec4d_set_d:a <- $d2
	;DEBUG_VALUE: vec2d_set_d:a <- $d2
	;DEBUG_VALUE: i <- 0
	;DEBUG_VALUE: vec8d_load:a <- $x19
	;DEBUG_VALUE: vec4d_load:a <- $x19
	;DEBUG_VALUE: vec2d_load:a <- $x19
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q3, q4, [x19]
Ltmp2246:
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x19
	.loc	9 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q5, q6, [x19, #32]
Ltmp2247:
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_load:a <- undef
	;DEBUG_VALUE: vec4d_load:a <- undef
	;DEBUG_VALUE: vec2d_load:a <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 256 128] $q5
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q7, q16, [x19, #128]
Ltmp2248:
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x19
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q17, q18, [x19, #160]
Ltmp2249:
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_add:b <- $q7
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q17
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v19, v3, v7
Ltmp2250:
	;DEBUG_VALUE: vec4d_add:z1 <- $q19
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v20, v4, v16
Ltmp2251:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_add:b <- $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v21, v5, v17
Ltmp2252:
	;DEBUG_VALUE: vec4d_add:z1 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q18
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v22, v6, v18
Ltmp2253:
	;DEBUG_VALUE: vec4d_add:z2 <- $q22
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 384 128] $q18
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v3, v7, v3
Ltmp2254:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v4, v16, v4
Ltmp2255:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v5, v17, v5
Ltmp2256:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v6, v18, v6
Ltmp2257:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v19, v2[0]
Ltmp2258:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2259:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v19, v0, v7
Ltmp2260:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v20, v2[0]
Ltmp2261:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2262:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v20, v0, v7
Ltmp2263:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v21, v2[0]
Ltmp2264:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2265:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v21, v0, v7
Ltmp2266:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v22, v2[0]
Ltmp2267:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2268:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v22, v0, v7
Ltmp2269:
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
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
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v3, v1[0]
Ltmp2270:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2271:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2272:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2273:
	fmls.2d	v17, v3, v1[0]
Ltmp2274:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2275:
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v3, v7, v17
Ltmp2276:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v4, v1[0]
Ltmp2277:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2278:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2279:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2280:
	fmls.2d	v17, v4, v1[0]
Ltmp2281:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2282:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v4, v7, v17
Ltmp2283:
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v5, v1[0]
Ltmp2284:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2285:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2286:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2287:
	fmls.2d	v17, v5, v1[0]
Ltmp2288:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2289:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v5, v7, v17
Ltmp2290:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp2291:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2292:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2293:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2294:
	fmls.2d	v17, v6, v1[0]
Ltmp2295:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2296:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v6, v7, v17
Ltmp2297:
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec8d_store:z <- $x19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_store:z <- $x19
	;DEBUG_VALUE: vec2d_store:z <- $x19
	;DEBUG_VALUE: vec2d_store:a <- $q19
	;DEBUG_VALUE: __s1 <- $q19
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q19, q20, [x19]
Ltmp2298:
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_store:a <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x19
	.loc	9 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q21, q22, [x19, #32]
Ltmp2299:
	;DEBUG_VALUE: vec2d_store:a <- $q22
	;DEBUG_VALUE: __s1 <- $q22
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_store:z <- undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_store:z <- undef
	;DEBUG_VALUE: vec2d_store:z <- undef
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q3, q4, [x19, #128]
Ltmp2300:
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x19
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q5, q6, [x19, #160]
Ltmp2301:
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x19
	;DEBUG_VALUE: i <- 8
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x19
	.loc	9 1571 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q3, q4, [x19, #64]
Ltmp2302:
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x19
	.loc	9 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q5, q6, [x19, #96]
Ltmp2303:
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: x0 <- [DW_OP_LLVM_fragment 256 128] $q5
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q7, q16, [x19, #192]
Ltmp2304:
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x19
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	ldp	q17, q18, [x19, #224]
Ltmp2305:
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x19
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q18
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_add:b <- $q7
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: x1 <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q17
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v19, v3, v7
Ltmp2306:
	;DEBUG_VALUE: vec4d_add:z1 <- $q19
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v20, v4, v16
Ltmp2307:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_add:b <- $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v21, v5, v17
Ltmp2308:
	;DEBUG_VALUE: vec4d_add:z1 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q18
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fadd.2d	v22, v6, v18
Ltmp2309:
	;DEBUG_VALUE: vec4d_add:z2 <- $q22
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 256 128] $q17
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 384 128] $q18
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v3, v7, v3
Ltmp2310:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v4, v16, v4
Ltmp2311:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v5, v17, v5
Ltmp2312:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	fsub.2d	v6, v18, v6
Ltmp2313:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v19, v2[0]
Ltmp2314:
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2315:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v19, v0, v7
Ltmp2316:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v20, v2[0]
Ltmp2317:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2318:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v20, v0, v7
Ltmp2319:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v21, v2[0]
Ltmp2320:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2321:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v21, v0, v7
Ltmp2322:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmul.2d	v7, v22, v2[0]
Ltmp2323:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	frintn.2d	v7, v7
Ltmp2324:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ .deps/flint/src/machine_vectors.h:2163:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ]
	fmls.2d	v22, v0, v7
Ltmp2325:
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: y0 <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 384 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z2 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_mulmod_fast:a <- [DW_OP_LLVM_fragment 384 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v3, v1[0]
Ltmp2326:
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 256 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:c <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2327:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2328:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2329:
	fmls.2d	v17, v3, v1[0]
Ltmp2330:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2331:
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v3, v7, v17
Ltmp2332:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v4, v1[0]
Ltmp2333:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2334:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2335:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2336:
	fmls.2d	v17, v4, v1[0]
Ltmp2337:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2338:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v4, v7, v17
Ltmp2339:
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_mulmod_fast:z1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v5, v1[0]
Ltmp2340:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v16, v7, v2[0]
Ltmp2341:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp2342:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v17, v7
Ltmp2343:
	fmls.2d	v17, v5, v1[0]
Ltmp2344:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2345:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v5, v7, v17
Ltmp2346:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp2347:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmul.2d	v2, v7, v2[0]
Ltmp2348:
	;DEBUG_VALUE: vec2d_round:a <- $q2
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	frintn.2d	v2, v2
Ltmp2349:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	mov.16b	v16, v7
Ltmp2350:
	fmls.2d	v16, v6, v1[0]
Ltmp2351:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fmls.2d	v7, v0, v2
Ltmp2352:
	.loc	9 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q19, q20, [x19, #64]
Ltmp2353:
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_store:a <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x19
	.loc	9 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q21, q22, [x19, #96]
Ltmp2354:
	;DEBUG_VALUE: vec2d_store:a <- $q22
	;DEBUG_VALUE: __s1 <- $q22
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q3, q4, [x19, #192]
Ltmp2355:
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ .deps/flint/src/machine_vectors.h:2173:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ] ] ]
	fsub.2d	v0, v7, v16
Ltmp2356:
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: y1 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 384 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod_fast:z2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod_fast:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x19
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:527:9 ] ] ]
	stp	q5, q0, [x19, #224]
Ltmp2357:
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x19
	;DEBUG_VALUE: i <- 16
	.loc	0 529 1 epilogue_begin          ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:529:1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
Ltmp2358:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_bits <- [DW_OP_LLVM_entry_value 1] $x3
	;DEBUG_VALUE: sd_ifft_basecase_5_0:X <- [DW_OP_LLVM_entry_value 1] $x1
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
Ltmp2359:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:Q <- [DW_OP_LLVM_entry_value 1] $x0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_mr <- [DW_OP_LLVM_entry_value 1] $x2
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
Ltmp2360:
Lfunc_end10:
	.cfi_endproc
