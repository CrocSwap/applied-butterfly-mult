_sd_ifft_basecase_4_0:                  ; @sd_ifft_basecase_4_0
Lfunc_begin39:
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:Q <- $x0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:X <- $x1
	;DEBUG_VALUE: sd_ifft_basecase_4_0:j_mr <- $x2
	;DEBUG_VALUE: sd_ifft_basecase_4_0:j_bits <- $x3
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	5 453 40 prologue_end is_stmt 1 ; build/fused-load-screen/fused-ifft.c:453:40
	lsl	x9, x3, #3
Ltmp5127:
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/fused-ifft.c:444:18 ] ]
	mov	x8, x0
	ld1r.2d	{ v0 }, [x8], x9
Ltmp5128:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:n <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:n <- [DW_OP_LLVM_fragment 128 128] $q0
	.loc	5 445 33                        ; build/fused-load-screen/fused-ifft.c:445:33
	ldr	d1, [x0, #8]
Ltmp5129:
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_load:a <- $x1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/fused-ifft.c:448:16 ] ]
	ldp	q4, q5, [x1]
Ltmp5130:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	10 1571 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/fused-ifft.c:449:16 ] ]
	ldp	q6, q7, [x1, #32]
Ltmp5131:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/fused-ifft.c:450:16 ] ]
	ldp	q16, q17, [x1, #64]
Ltmp5132:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/fused-ifft.c:451:16 ] ]
	ldp	q18, q19, [x1, #96]
Ltmp5133:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q18
	.loc	5 453 30 is_stmt 1              ; build/fused-load-screen/fused-ifft.c:453:30
	ldp	x9, x10, [x8, #72]
	add	x9, x9, x2, lsl #5
Ltmp5134:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x9
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/fused-ifft.c:453:10 ] ]
	ldp	q2, q3, [x9]
Ltmp5135:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	5 457 29                        ; build/fused-load-screen/fused-ifft.c:457:29
	add	x9, x10, x2, lsl #6
Ltmp5136:
	;DEBUG_VALUE: tw <- $x9
	.loc	5 458 27                        ; build/fused-load-screen/fused-ifft.c:458:27
	ld2.2d	{ v20, v21 }, [x9], #32
Ltmp5137:
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: __s0 <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: __ret <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: __s0 <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: __ret <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: __s0 <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	.loc	10 1924 29                      ; .deps/flint/src/machine_vectors.h:1924:29 @[ build/fused-load-screen/fused-ifft.c:454:10 ]
	ext.16b	v3, v3, v3, #8
Ltmp5138:
	;DEBUG_VALUE: __ret <- $q3
	.loc	5 459 27                        ; build/fused-load-screen/fused-ifft.c:459:27
	ld2.2d	{ v22, v23 }, [x9]
Ltmp5139:
	;DEBUG_VALUE: __s0 <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: __ret <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: __s0 <- $q22
	;DEBUG_VALUE: __s1 <- $q22
	;DEBUG_VALUE: __ret <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: __s0 <- $q23
	;DEBUG_VALUE: __s1 <- $q23
	.loc	10 1925 29                      ; .deps/flint/src/machine_vectors.h:1925:29 @[ build/fused-load-screen/fused-ifft.c:454:10 ]
	ext.16b	v2, v2, v2, #8
Ltmp5140:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: __ret <- $q2
	.loc	5 460 30                        ; build/fused-load-screen/fused-ifft.c:460:30
	ext.16b	v24, v23, v23, #8
Ltmp5141:
	;DEBUG_VALUE: __ret <- $q24
	.loc	5 461 29                        ; build/fused-load-screen/fused-ifft.c:461:29
	ext.16b	v25, v21, v21, #8
Ltmp5142:
	;DEBUG_VALUE: __ret <- $q25
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 128 128] $q25
	.loc	5 462 31                        ; build/fused-load-screen/fused-ifft.c:462:31
	ext.16b	v22, v22, v22, #8
Ltmp5143:
	;DEBUG_VALUE: __ret <- $q22
	.loc	5 463 30                        ; build/fused-load-screen/fused-ifft.c:463:30
	ext.16b	v20, v20, v20, #8
Ltmp5144:
	;DEBUG_VALUE: __ret <- $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_add:b <- $q6
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_add:a <- $q4
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v21, v4, v6
Ltmp5145:
	;DEBUG_VALUE: vec4d_add:z1 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v23, v5, v7
Ltmp5146:
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_add:b <- $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q19
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v26, v16, v18
Ltmp5147:
	;DEBUG_VALUE: vec4d_add:z1 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v27, v17, v19
Ltmp5148:
	;DEBUG_VALUE: vec4d_add:z2 <- $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v4, v4, v6
Ltmp5149:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v5, v5, v7
Ltmp5150:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q19
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v6, v18, v16
Ltmp5151:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v7, v19, v17
Ltmp5152:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:b <- $q24
	;DEBUG_VALUE: vec2d_mul:b <- $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v16, v4, v24
Ltmp5153:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp5154:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp5155:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	mov.16b	v18, v16
Ltmp5156:
	fmls.2d	v18, v24, v4
Ltmp5157:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmls.2d	v16, v0, v17
Ltmp5158:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fsub.2d	v4, v16, v18
Ltmp5159:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q25
	;DEBUG_VALUE: vec2d_mulmod:b <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v16, v5, v25
Ltmp5160:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp5161:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp5162:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q25
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	mov.16b	v18, v16
Ltmp5163:
	fmls.2d	v18, v25, v5
Ltmp5164:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmls.2d	v16, v0, v17
Ltmp5165:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fsub.2d	v5, v16, v18
Ltmp5166:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q22
	;DEBUG_VALUE: vec2d_mulmod:b <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v16, v6, v22
Ltmp5167:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp5168:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp5169:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q22
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	mov.16b	v18, v16
Ltmp5170:
	fmls.2d	v18, v22, v6
Ltmp5171:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmls.2d	v16, v0, v17
Ltmp5172:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fsub.2d	v6, v16, v18
Ltmp5173:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q20
	;DEBUG_VALUE: vec2d_mulmod:b <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v16, v7, v20
Ltmp5174:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp5175:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp5176:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q20
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	mov.16b	v18, v16
Ltmp5177:
	fmls.2d	v18, v20, v7
Ltmp5178:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmls.2d	v16, v0, v17
Ltmp5179:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fsub.2d	v7, v16, v18
Ltmp5180:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q26
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v16, v21, v26
Ltmp5181:
	;DEBUG_VALUE: vec4d_add:z1 <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q27
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v17, v23, v27
Ltmp5182:
	;DEBUG_VALUE: vec4d_add:z2 <- $q17
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v18, v6, v4
Ltmp5183:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v19, v7, v5
Ltmp5184:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q19
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v20, v26, v21
Ltmp5185:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fsub.2d	v21, v27, v23
Ltmp5186:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q4
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v4, v6, v4
Ltmp5187:
	;DEBUG_VALUE: vec4d_add:z1 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ]
	fadd.2d	v5, v7, v5
Ltmp5188:
	;DEBUG_VALUE: vec4d_add:z2 <- $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmul.2d	v6, v16, v1[0]
Ltmp5189:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	frintn.2d	v6, v6
Ltmp5190:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmls.2d	v16, v0, v6
Ltmp5191:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmul.2d	v6, v17, v1[0]
Ltmp5192:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	frintn.2d	v6, v6
Ltmp5193:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmls.2d	v17, v0, v6
Ltmp5194:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q17
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- $q3
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmul.2d	v6, v20, v3
Ltmp5195:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp5196:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	frintn.2d	v7, v7
Ltmp5197:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	mov.16b	v22, v6
Ltmp5198:
	fmls.2d	v22, v3, v20
Ltmp5199:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmls.2d	v6, v0, v7
Ltmp5200:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fsub.2d	v6, v6, v22
Ltmp5201:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod:b <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmul.2d	v7, v21, v2
Ltmp5202:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmul.2d	v20, v7, v1[0]
Ltmp5203:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	frintn.2d	v20, v20
Ltmp5204:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	mov.16b	v22, v7
Ltmp5205:
	fmls.2d	v22, v2, v21
Ltmp5206:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fmls.2d	v7, v0, v20
Ltmp5207:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ]
	fsub.2d	v7, v7, v22
Ltmp5208:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q7
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v20, v3, v4
Ltmp5209:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v21, v20, v1[0]
Ltmp5210:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	frintn.2d	v21, v21
Ltmp5211:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	mov.16b	v22, v20
Ltmp5212:
	fmls.2d	v22, v3, v4
Ltmp5213:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp5214:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fsub.2d	v3, v20, v22
Ltmp5215:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:b <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v4, v2, v5
Ltmp5216:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmul.2d	v20, v4, v1[0]
Ltmp5217:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5218:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	mov.16b	v21, v4
Ltmp5219:
	fmls.2d	v21, v2, v5
Ltmp5220:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fmls.2d	v4, v0, v20
Ltmp5221:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:471:5 ] ] ] ]
	fsub.2d	v4, v4, v21
Ltmp5222:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q16
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q18
	.loc	10 1769 12                      ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip1.2d	v5, v16, v18
Ltmp5223:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q5
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q17
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q19
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip1.2d	v20, v17, v19
Ltmp5224:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q20
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q16
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q18
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q5
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip2.2d	v21, v16, v18
Ltmp5225:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q21
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q17
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q19
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip2.2d	v22, v17, v19
Ltmp5226:
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q22
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q6
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q3
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q21
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip1.2d	v23, v6, v3
Ltmp5227:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q23
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q7
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q4
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip1.2d	v24, v7, v4
Ltmp5228:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q24
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q6
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q3
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q23
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip2.2d	v25, v6, v3
Ltmp5229:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q25
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q7
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q4
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/fused-ifft.c:472:5 ] ]
	zip2.2d	v26, v7, v4
Ltmp5230:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q26
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 0 128] $q25
	.loc	5 474 22 is_stmt 1              ; build/fused-load-screen/fused-ifft.c:474:22
	ldp	x8, x9, [x8, #56]
	add	x9, x9, x2, lsl #4
Ltmp5231:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/fused-ifft.c:475:10 ] ]
	ld1r.2d	{ v27 }, [x9], #8
Ltmp5232:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q27
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q27
	.loc	5 474 22                        ; build/fused-load-screen/fused-ifft.c:474:22
	ldr	d28, [x9]
Ltmp5233:
	;DEBUG_VALUE: vec4d_set_d:a <- $d28
	;DEBUG_VALUE: vec2d_set_d:a <- $d28
	.loc	5 476 22                        ; build/fused-load-screen/fused-ifft.c:476:22
	ldr	d2, [x8, x2, lsl #3]
Ltmp5234:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- $d2
	;DEBUG_VALUE: vec2d_set_d:a <- $d2
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_add:b <- $q21
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	faddp.2d	v16, v16, v18
Ltmp5235:
	;DEBUG_VALUE: vec4d_add:z1 <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q25
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	faddp.2d	v3, v6, v3
Ltmp5236:
	;DEBUG_VALUE: vec4d_add:z2 <- $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	faddp.2d	v6, v17, v19
Ltmp5237:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q26
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	faddp.2d	v4, v7, v4
Ltmp5238:
	;DEBUG_VALUE: vec4d_add:z2 <- $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v5, v5, v21
Ltmp5239:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v7, v23, v25
Ltmp5240:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v17, v22, v20
Ltmp5241:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v18, v26, v24
Ltmp5242:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q7
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
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v19, v5, v28[0]
Ltmp5243:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5244:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5245:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5246:
	fmls.2d	v21, v5, v28[0]
Ltmp5247:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5248:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fsub.2d	v5, v19, v21
Ltmp5249:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v19, v7, v28[0]
Ltmp5250:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5251:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5252:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5253:
	fmls.2d	v21, v7, v28[0]
Ltmp5254:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5255:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fsub.2d	v7, v19, v21
Ltmp5256:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q27
	;DEBUG_VALUE: vec2d_mulmod:b <- $q27
	;DEBUG_VALUE: vec2d_mul:b <- $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v19, v27, v17
Ltmp5257:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5258:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5259:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q27
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5260:
	fmls.2d	v21, v27, v17
Ltmp5261:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5262:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fsub.2d	v17, v19, v21
Ltmp5263:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q27
	;DEBUG_VALUE: vec2d_mulmod:b <- $q27
	;DEBUG_VALUE: vec2d_mul:b <- $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v19, v27, v18
Ltmp5264:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5265:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5266:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q27
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5267:
	fmls.2d	v21, v27, v18
Ltmp5268:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5269:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fsub.2d	v18, v19, v21
Ltmp5270:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec2d_add:b <- $q6
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fadd.2d	v19, v6, v16
Ltmp5271:
	;DEBUG_VALUE: vec4d_add:z1 <- $q19
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q4
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fadd.2d	v20, v4, v3
Ltmp5272:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v21, v17, v5
Ltmp5273:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v22, v18, v7
Ltmp5274:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v6, v6, v16
Ltmp5275:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fsub.2d	v3, v4, v3
Ltmp5276:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fadd.2d	v4, v17, v5
Ltmp5277:
	;DEBUG_VALUE: vec4d_add:z1 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ]
	fadd.2d	v5, v18, v7
Ltmp5278:
	;DEBUG_VALUE: vec4d_add:z2 <- $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmul.2d	v7, v19, v1[0]
Ltmp5279:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	frintn.2d	v7, v7
Ltmp5280:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmls.2d	v19, v0, v7
Ltmp5281:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmul.2d	v7, v20, v1[0]
Ltmp5282:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	frintn.2d	v7, v7
Ltmp5283:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmls.2d	v20, v0, v7
Ltmp5284:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmul.2d	v7, v6, v2[0]
Ltmp5285:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp5286:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	frintn.2d	v16, v16
Ltmp5287:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	mov.16b	v17, v7
Ltmp5288:
	fmls.2d	v17, v6, v2[0]
Ltmp5289:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmls.2d	v7, v0, v16
Ltmp5290:
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fsub.2d	v6, v7, v17
Ltmp5291:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmul.2d	v7, v3, v2[0]
Ltmp5292:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp5293:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	frintn.2d	v16, v16
Ltmp5294:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	mov.16b	v17, v7
Ltmp5295:
	fmls.2d	v17, v3, v2[0]
Ltmp5296:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fmls.2d	v7, v0, v16
Ltmp5297:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ]
	fsub.2d	v3, v7, v17
Ltmp5298:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
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
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v7, v4, v2[0]
Ltmp5299:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp5300:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	frintn.2d	v16, v16
Ltmp5301:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	mov.16b	v17, v7
Ltmp5302:
	fmls.2d	v17, v4, v2[0]
Ltmp5303:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp5304:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fsub.2d	v4, v7, v17
Ltmp5305:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v7, v5, v2[0]
Ltmp5306:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmul.2d	v1, v7, v1[0]
Ltmp5307:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	frintn.2d	v1, v1
Ltmp5308:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	mov.16b	v16, v7
Ltmp5309:
	fmls.2d	v16, v5, v2[0]
Ltmp5310:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fmls.2d	v7, v0, v1
Ltmp5311:
	.loc	10 1586 5 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/fused-ifft.c:479:5 ] ]
	stp	q19, q20, [x1]
Ltmp5312:
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_store:a <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	10 1586 5 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/fused-ifft.c:480:5 ] ]
	stp	q21, q22, [x1, #32]
Ltmp5313:
	;DEBUG_VALUE: vec2d_store:a <- $q22
	;DEBUG_VALUE: __s1 <- $q22
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/fused-ifft.c:481:5 ] ]
	stp	q6, q3, [x1, #64]
Ltmp5314:
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/fused-ifft.c:477:5 ] ] ] ]
	fsub.2d	v0, v7, v16
Ltmp5315:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/fused-ifft.c:482:5 ] ]
	stp	q4, q0, [x1, #96]
Ltmp5316:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	.loc	5 483 1                         ; build/fused-load-screen/fused-ifft.c:483:1
	ret
Ltmp5317:
