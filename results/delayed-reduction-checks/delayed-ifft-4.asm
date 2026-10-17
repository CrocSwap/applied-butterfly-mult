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
	.loc	5 487 40 prologue_end is_stmt 1 ; build/delayed-reduction-screen/delayed.c:487:40
	lsl	x9, x3, #3
Ltmp5113:
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/delayed-reduction-screen/delayed.c:478:18 ] ]
	mov	x8, x0
	ld1r.2d	{ v0 }, [x8], x9
Ltmp5114:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:n <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:n <- [DW_OP_LLVM_fragment 128 128] $q0
	.loc	5 479 33                        ; build/delayed-reduction-screen/delayed.c:479:33
	ldr	d1, [x0, #8]
Ltmp5115:
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_load:a <- $x1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:482:16 ] ]
	ldp	q2, q3, [x1]
Ltmp5116:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	10 1571 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:483:16 ] ]
	ldp	q4, q5, [x1, #32]
Ltmp5117:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:484:16 ] ]
	ldp	q6, q7, [x1, #64]
Ltmp5118:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:485:16 ] ]
	ldp	q16, q17, [x1, #96]
Ltmp5119:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q16
	.loc	5 487 30 is_stmt 1              ; build/delayed-reduction-screen/delayed.c:487:30
	ldp	x10, x9, [x8, #64]
	add	x9, x9, x2, lsl #5
Ltmp5120:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x9
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:487:10 ] ]
	ldp	q18, q19, [x9]
Ltmp5121:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: __s0 <- $q19
	;DEBUG_VALUE: __s1 <- $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 0 128] $q18
	.loc	10 1924 29                      ; .deps/flint/src/machine_vectors.h:1924:29 @[ build/delayed-reduction-screen/delayed.c:488:10 ]
	ext.16b	v19, v19, v19, #8
Ltmp5122:
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: __s0 <- $q18
	;DEBUG_VALUE: __s1 <- $q18
	.loc	10 1925 29                      ; .deps/flint/src/machine_vectors.h:1925:29 @[ build/delayed-reduction-screen/delayed.c:488:10 ]
	ext.16b	v18, v18, v18, #8
Ltmp5123:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: __ret <- $q18
	.loc	5 489 30                        ; build/delayed-reduction-screen/delayed.c:489:30
	ldr	x9, [x8, #80]
Ltmp5124:
	add	x9, x9, x2, lsl #6
Ltmp5125:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x9
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:489:10 ] ]
	ldp	q20, q21, [x9]
Ltmp5126:
	;DEBUG_VALUE: __ret <- $q20
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q21
	;DEBUG_VALUE: sd_ifft_basecase_4_0:u <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: sd_ifft_basecase_4_0:u <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_load_aligned:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x9
	.loc	10 1581 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:490:10 ] ]
	ldp	q22, q23, [x9, #32]
Ltmp5127:
	;DEBUG_VALUE: __ret <- $q22
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q23
	;DEBUG_VALUE: sd_ifft_basecase_4_0:v <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q23
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: sd_ifft_basecase_4_0:v <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q22
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 0 128] $q20
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1953:29 @[ build/delayed-reduction-screen/delayed.c:491:10 ] ]
	zip2.2d	v24, v23, v22
Ltmp5128:
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q21
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q20
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1954:29 @[ build/delayed-reduction-screen/delayed.c:491:10 ] ]
	zip2.2d	v25, v21, v20
Ltmp5129:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q22
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q23
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 0 128] $q20
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1958:29 @[ build/delayed-reduction-screen/delayed.c:492:10 ] ]
	zip1.2d	v22, v23, v22
Ltmp5130:
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q21
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q20
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1959:29 @[ build/delayed-reduction-screen/delayed.c:492:10 ] ]
	zip1.2d	v20, v21, v20
Ltmp5131:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_add:b <- $q4
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_add:a <- $q2
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v21, v2, v4
Ltmp5132:
	;DEBUG_VALUE: vec4d_add:z1 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v23, v3, v5
Ltmp5133:
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_add:b <- $q16
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q17
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v26, v6, v16
Ltmp5134:
	;DEBUG_VALUE: vec4d_add:z1 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v27, v7, v17
Ltmp5135:
	;DEBUG_VALUE: vec4d_add:z2 <- $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v2, v2, v4
Ltmp5136:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v3, v3, v5
Ltmp5137:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q17
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v4, v16, v6
Ltmp5138:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v5, v17, v7
Ltmp5139:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:b <- $q24
	;DEBUG_VALUE: vec2d_mul:b <- $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v6, v2, v24
Ltmp5140:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp5141:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	frintn.2d	v7, v7
Ltmp5142:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	mov.16b	v16, v6
Ltmp5143:
	fmls.2d	v16, v24, v2
Ltmp5144:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmls.2d	v6, v0, v7
Ltmp5145:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fsub.2d	v2, v6, v16
Ltmp5146:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q25
	;DEBUG_VALUE: vec2d_mulmod:b <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v6, v3, v25
Ltmp5147:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp5148:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	frintn.2d	v7, v7
Ltmp5149:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q25
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	mov.16b	v16, v6
Ltmp5150:
	fmls.2d	v16, v25, v3
Ltmp5151:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmls.2d	v6, v0, v7
Ltmp5152:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fsub.2d	v3, v6, v16
Ltmp5153:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q22
	;DEBUG_VALUE: vec2d_mulmod:b <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v6, v4, v22
Ltmp5154:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp5155:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	frintn.2d	v7, v7
Ltmp5156:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q22
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	mov.16b	v16, v6
Ltmp5157:
	fmls.2d	v16, v22, v4
Ltmp5158:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmls.2d	v6, v0, v7
Ltmp5159:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fsub.2d	v4, v6, v16
Ltmp5160:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q20
	;DEBUG_VALUE: vec2d_mulmod:b <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v6, v5, v20
Ltmp5161:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp5162:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	frintn.2d	v7, v7
Ltmp5163:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q20
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	mov.16b	v16, v6
Ltmp5164:
	fmls.2d	v16, v20, v5
Ltmp5165:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmls.2d	v6, v0, v7
Ltmp5166:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fsub.2d	v5, v6, v16
Ltmp5167:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q26
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v6, v21, v26
Ltmp5168:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q27
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v7, v23, v27
Ltmp5169:
	;DEBUG_VALUE: vec4d_add:z2 <- $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v16, v4, v2
Ltmp5170:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v17, v5, v3
Ltmp5171:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q17
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v20, v26, v21
Ltmp5172:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fsub.2d	v21, v27, v23
Ltmp5173:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q2
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v2, v4, v2
Ltmp5174:
	;DEBUG_VALUE: vec4d_add:z1 <- $q2
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q3
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ]
	fadd.2d	v3, v5, v3
Ltmp5175:
	;DEBUG_VALUE: vec4d_add:z2 <- $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmul.2d	v4, v6, v1[0]
Ltmp5176:
	;DEBUG_VALUE: vec2d_round:a <- $q4
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	frintn.2d	v4, v4
Ltmp5177:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmls.2d	v6, v0, v4
Ltmp5178:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmul.2d	v4, v7, v1[0]
Ltmp5179:
	;DEBUG_VALUE: vec2d_round:a <- $q4
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	frintn.2d	v4, v4
Ltmp5180:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmls.2d	v7, v0, v4
Ltmp5181:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- $q19
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmul.2d	v4, v20, v19
Ltmp5182:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmul.2d	v5, v4, v1[0]
Ltmp5183:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	frintn.2d	v5, v5
Ltmp5184:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q19
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	mov.16b	v22, v4
Ltmp5185:
	fmls.2d	v22, v19, v20
Ltmp5186:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmls.2d	v4, v0, v5
Ltmp5187:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fsub.2d	v4, v4, v22
Ltmp5188:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod:b <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmul.2d	v5, v21, v18
Ltmp5189:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmul.2d	v20, v5, v1[0]
Ltmp5190:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	frintn.2d	v20, v20
Ltmp5191:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q18
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	mov.16b	v22, v5
Ltmp5192:
	fmls.2d	v22, v18, v21
Ltmp5193:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fmls.2d	v5, v0, v20
Ltmp5194:
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ]
	fsub.2d	v5, v5, v22
Ltmp5195:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v20, v19, v2
Ltmp5196:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v21, v20, v1[0]
Ltmp5197:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	frintn.2d	v21, v21
Ltmp5198:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q19
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	mov.16b	v22, v20
Ltmp5199:
	fmls.2d	v22, v19, v2
Ltmp5200:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp5201:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fsub.2d	v19, v20, v22
Ltmp5202:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod:b <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v2, v18, v3
Ltmp5203:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmul.2d	v20, v2, v1[0]
Ltmp5204:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5205:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q18
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	mov.16b	v21, v2
Ltmp5206:
	fmls.2d	v21, v18, v3
Ltmp5207:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fmls.2d	v2, v0, v20
Ltmp5208:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:493:5 ] ] ] ]
	fsub.2d	v3, v2, v21
Ltmp5209:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q6
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q16
	.loc	10 1769 12                      ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip1.2d	v18, v6, v16
Ltmp5210:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q18
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q7
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q17
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip1.2d	v20, v7, v17
Ltmp5211:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q20
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q6
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q16
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q18
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip2.2d	v21, v6, v16
Ltmp5212:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q21
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q7
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q17
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip2.2d	v22, v7, v17
Ltmp5213:
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q22
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q4
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q19
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q21
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip1.2d	v23, v4, v19
Ltmp5214:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q23
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q5
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q3
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip1.2d	v24, v5, v3
Ltmp5215:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q24
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q4
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q19
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q23
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip2.2d	v25, v4, v19
Ltmp5216:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q25
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q5
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q3
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:494:5 ] ]
	zip2.2d	v26, v5, v3
Ltmp5217:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q18
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
	.loc	5 496 22 is_stmt 1              ; build/delayed-reduction-screen/delayed.c:496:22
	add	x9, x10, x2, lsl #4
Ltmp5218:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/delayed-reduction-screen/delayed.c:497:10 ] ]
	ld1r.2d	{ v27 }, [x9], #8
Ltmp5219:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_ifft_basecase_4_0:IW <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q27
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q27
	.loc	5 496 22                        ; build/delayed-reduction-screen/delayed.c:496:22
	ldr	d28, [x9]
Ltmp5220:
	;DEBUG_VALUE: vec4d_set_d:a <- $d28
	;DEBUG_VALUE: vec2d_set_d:a <- $d28
	.loc	5 498 22                        ; build/delayed-reduction-screen/delayed.c:498:22
	ldr	x8, [x8, #56]
	ldr	d2, [x8, x2, lsl #3]
Ltmp5221:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:W2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- $d2
	;DEBUG_VALUE: vec2d_set_d:a <- $d2
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_add:b <- $q21
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	faddp.2d	v6, v6, v16
Ltmp5222:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q25
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	faddp.2d	v4, v4, v19
Ltmp5223:
	;DEBUG_VALUE: vec4d_add:z2 <- $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	faddp.2d	v7, v7, v17
Ltmp5224:
	;DEBUG_VALUE: vec4d_add:z1 <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q26
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	faddp.2d	v3, v5, v3
Ltmp5225:
	;DEBUG_VALUE: vec4d_add:z2 <- $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v5, v18, v21
Ltmp5226:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v16, v23, v25
Ltmp5227:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q16
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v17, v22, v20
Ltmp5228:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v18, v26, v24
Ltmp5229:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q16
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
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v19, v5, v28[0]
Ltmp5230:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5231:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5232:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5233:
	fmls.2d	v21, v5, v28[0]
Ltmp5234:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5235:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fsub.2d	v5, v19, v21
Ltmp5236:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v19, v16, v28[0]
Ltmp5237:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5238:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5239:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5240:
	fmls.2d	v21, v16, v28[0]
Ltmp5241:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5242:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fsub.2d	v16, v19, v21
Ltmp5243:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
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
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v19, v27, v17
Ltmp5244:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5245:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5246:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q27
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5247:
	fmls.2d	v21, v27, v17
Ltmp5248:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5249:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fsub.2d	v17, v19, v21
Ltmp5250:
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
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v19, v27, v18
Ltmp5251:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp5252:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp5253:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q27
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	mov.16b	v21, v19
Ltmp5254:
	fmls.2d	v21, v27, v18
Ltmp5255:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp5256:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fsub.2d	v18, v19, v21
Ltmp5257:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fadd.2d	v19, v7, v6
Ltmp5258:
	;DEBUG_VALUE: vec4d_add:z1 <- $q19
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q3
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fadd.2d	v20, v3, v4
Ltmp5259:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v21, v17, v5
Ltmp5260:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v22, v18, v16
Ltmp5261:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v6, v7, v6
Ltmp5262:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fsub.2d	v3, v3, v4
Ltmp5263:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fadd.2d	v4, v17, v5
Ltmp5264:
	;DEBUG_VALUE: vec4d_add:z1 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ]
	fadd.2d	v5, v18, v16
Ltmp5265:
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
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmul.2d	v7, v19, v1[0]
Ltmp5266:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	frintn.2d	v7, v7
Ltmp5267:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmls.2d	v19, v0, v7
Ltmp5268:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmul.2d	v7, v20, v1[0]
Ltmp5269:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	frintn.2d	v7, v7
Ltmp5270:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmls.2d	v20, v0, v7
Ltmp5271:
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
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmul.2d	v7, v6, v2[0]
Ltmp5272:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp5273:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	frintn.2d	v16, v16
Ltmp5274:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	mov.16b	v17, v7
Ltmp5275:
	fmls.2d	v17, v6, v2[0]
Ltmp5276:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmls.2d	v7, v0, v16
Ltmp5277:
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fsub.2d	v6, v7, v17
Ltmp5278:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmul.2d	v7, v3, v2[0]
Ltmp5279:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp5280:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	frintn.2d	v16, v16
Ltmp5281:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	mov.16b	v17, v7
Ltmp5282:
	fmls.2d	v17, v3, v2[0]
Ltmp5283:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fmls.2d	v7, v0, v16
Ltmp5284:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ]
	fsub.2d	v3, v7, v17
Ltmp5285:
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
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v7, v4, v2[0]
Ltmp5286:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp5287:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	frintn.2d	v16, v16
Ltmp5288:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	mov.16b	v17, v7
Ltmp5289:
	fmls.2d	v17, v4, v2[0]
Ltmp5290:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp5291:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fsub.2d	v4, v7, v17
Ltmp5292:
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
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v7, v5, v2[0]
Ltmp5293:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmul.2d	v1, v7, v1[0]
Ltmp5294:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	frintn.2d	v1, v1
Ltmp5295:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	mov.16b	v16, v7
Ltmp5296:
	fmls.2d	v16, v5, v2[0]
Ltmp5297:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fmls.2d	v7, v0, v1
Ltmp5298:
	.loc	10 1586 5 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:501:5 ] ]
	stp	q19, q20, [x1]
Ltmp5299:
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_store:a <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	10 1586 5 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:502:5 ] ]
	stp	q21, q22, [x1, #32]
Ltmp5300:
	;DEBUG_VALUE: vec2d_store:a <- $q22
	;DEBUG_VALUE: __s1 <- $q22
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:503:5 ] ]
	stp	q6, q3, [x1, #64]
Ltmp5301:
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:499:5 ] ] ] ]
	fsub.2d	v0, v7, v16
Ltmp5302:
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
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:504:5 ] ]
	stp	q4, q0, [x1, #96]
Ltmp5303:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	.loc	5 505 1                         ; build/delayed-reduction-screen/delayed.c:505:1
	ret
Ltmp5304:
