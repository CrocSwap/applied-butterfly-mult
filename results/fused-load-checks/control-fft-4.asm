_sd_fft_basecase_4_0:                   ; @sd_fft_basecase_4_0
Lfunc_begin38:
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_fft_basecase_4_0:Q <- $x0
	;DEBUG_VALUE: sd_fft_basecase_4_0:X <- $x1
	;DEBUG_VALUE: sd_fft_basecase_4_0:j_r <- $x2
	;DEBUG_VALUE: sd_fft_basecase_4_0:j_bits <- $x3
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] undef
	.loc	5 556 22 prologue_end is_stmt 1 ; build/fused-load-screen/control-fft.c:556:22
	lsl	x9, x3, #3
Ltmp5955:
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/control-fft.c:547:18 ] ]
	mov	x8, x0
	ld1r.2d	{ v0 }, [x8], x9
Ltmp5956:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_4_0:n <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_4_0:n <- [DW_OP_LLVM_fragment 128 128] $q0
	.loc	5 548 33                        ; build/fused-load-screen/control-fft.c:548:33
	ldr	d1, [x0, #8]
Ltmp5957:
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_load:a <- $x1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:551:16 ] ]
	ldp	q4, q5, [x1]
Ltmp5958:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	9 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:552:16 ] ]
	ldp	q6, q7, [x1, #32]
Ltmp5959:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:553:16 ] ]
	ldp	q16, q17, [x1, #64]
Ltmp5960:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:554:16 ] ]
	ldp	q18, q19, [x1, #96]
Ltmp5961:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q19
	.loc	5 556 22 is_stmt 1              ; build/fused-load-screen/control-fft.c:556:22
	ldp	x9, x10, [x8, #56]
	ldr	d20, [x9, x2, lsl #3]
Ltmp5962:
	;DEBUG_VALUE: vec4d_set_d:a <- $d20
	;DEBUG_VALUE: vec2d_set_d:a <- $d20
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:w2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:w2 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	5 557 22                        ; build/fused-load-screen/control-fft.c:557:22
	add	x9, x10, x2, lsl #4
Ltmp5963:
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/control-fft.c:557:10 ] ]
	ld1r.2d	{ v3 }, [x9], #8
Ltmp5964:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q3
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: sd_fft_basecase_4_0:w <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: sd_fft_basecase_4_0:w <- [DW_OP_LLVM_fragment 128 128] $q3
	.loc	5 558 22                        ; build/fused-load-screen/control-fft.c:558:22
	ldr	d2, [x9]
Ltmp5965:
	;DEBUG_VALUE: vec4d_set_d:a <- $d2
	;DEBUG_VALUE: vec2d_set_d:a <- $d2
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:iw <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:iw <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ]
	fmul.2d	v21, v4, v1[0]
Ltmp5966:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ]
	frintn.2d	v21, v21
Ltmp5967:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ]
	fmls.2d	v4, v0, v21
Ltmp5968:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ]
	fmul.2d	v21, v5, v1[0]
Ltmp5969:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ]
	frintn.2d	v21, v21
Ltmp5970:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ]
	fmls.2d	v5, v0, v21
Ltmp5971:
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v21, v16, v20[0]
Ltmp5972:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp5973:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v22, v22
Ltmp5974:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v23, v21
	fmls.2d	v23, v16, v20[0]
Ltmp5975:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v21, v0, v22
Ltmp5976:
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v16, v21, v23
Ltmp5977:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v21, v17, v20[0]
Ltmp5978:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp5979:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v22, v22
Ltmp5980:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v23, v21
Ltmp5981:
	fmls.2d	v23, v17, v20[0]
Ltmp5982:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v21, v0, v22
Ltmp5983:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v17, v21, v23
Ltmp5984:
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v21, v18, v20[0]
Ltmp5985:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp5986:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v22, v22
Ltmp5987:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v23, v21
Ltmp5988:
	fmls.2d	v23, v18, v20[0]
Ltmp5989:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v21, v0, v22
Ltmp5990:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v18, v21, v23
Ltmp5991:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v21, v19, v20[0]
Ltmp5992:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp5993:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v22, v22
Ltmp5994:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v23, v21
Ltmp5995:
	fmls.2d	v23, v19, v20[0]
Ltmp5996:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v21, v0, v22
Ltmp5997:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v19, v21, v23
Ltmp5998:
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v20, v4, v16
Ltmp5999:
	;DEBUG_VALUE: vec4d_add:z1 <- $q20
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v21, v5, v17
Ltmp6000:
	;DEBUG_VALUE: vec4d_add:z2 <- $q21
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_add:b <- $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q7
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v22, v6, v18
Ltmp6001:
	;DEBUG_VALUE: vec4d_add:z1 <- $q22
	;DEBUG_VALUE: vec2d_add:b <- $q19
	;DEBUG_VALUE: vec2d_add:a <- $q7
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v23, v7, v19
Ltmp6002:
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v4, v4, v16
Ltmp6003:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v5, v5, v17
Ltmp6004:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q7
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v6, v6, v18
Ltmp6005:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v7, v7, v19
Ltmp6006:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v16, v3, v22
Ltmp6007:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp6008:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp6009:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v18, v16
Ltmp6010:
	fmls.2d	v18, v3, v22
Ltmp6011:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v16, v0, v17
Ltmp6012:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v16, v16, v18
Ltmp6013:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q23
	;DEBUG_VALUE: vec2d_mulmod:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v17, v3, v23
Ltmp6014:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v18, v17, v1[0]
Ltmp6015:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v18, v18
Ltmp6016:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v19, v17
Ltmp6017:
	fmls.2d	v19, v3, v23
Ltmp6018:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v17, v0, v18
Ltmp6019:
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v3, v17, v19
Ltmp6020:
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v17, v6, v2[0]
Ltmp6021:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v18, v17, v1[0]
Ltmp6022:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v18, v18
Ltmp6023:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v19, v17
Ltmp6024:
	fmls.2d	v19, v6, v2[0]
Ltmp6025:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v17, v0, v18
Ltmp6026:
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v6, v17, v19
Ltmp6027:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q6
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v17, v7, v2[0]
Ltmp6028:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmul.2d	v18, v17, v1[0]
Ltmp6029:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	frintn.2d	v18, v18
Ltmp6030:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	mov.16b	v19, v17
Ltmp6031:
	fmls.2d	v19, v7, v2[0]
Ltmp6032:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fmls.2d	v17, v0, v18
Ltmp6033:
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ] ] ]
	fsub.2d	v7, v17, v19
Ltmp6034:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v17, v20, v16
Ltmp6035:
	;DEBUG_VALUE: vec4d_add:z1 <- $q17
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q3
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v18, v21, v3
Ltmp6036:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:z2 <- $q18
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v16, v20, v16
Ltmp6037:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v19, v21, v3
Ltmp6038:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:z2 <- $q19
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q6
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v20, v4, v6
Ltmp6039:
	;DEBUG_VALUE: vec4d_add:z1 <- $q20
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fadd.2d	v21, v5, v7
Ltmp6040:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:z2 <- $q21
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v6, v4, v6
Ltmp6041:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	.loc	5 561 30                        ; build/fused-load-screen/control-fft.c:561:30
	ldp	x8, x9, [x8, #72]
	add	x9, x9, x2, lsl #6
	.loc	5 562 30                        ; build/fused-load-screen/control-fft.c:562:30
	add	x10, x9, #32
Ltmp6042:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x10
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x10
	.loc	9 1581 12                       ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:562:10 ] ]
	ld2.2d	{ v2, v3 }, [x10]
Ltmp6043:
	;DEBUG_VALUE: sd_fft_basecase_4_0:w <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: sd_fft_basecase_4_0:iw <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	;DEBUG_VALUE: vec2d_unpackhi:a <- undef
	;DEBUG_VALUE: vec2d_unpackhi:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_unpacklo:a <- undef
	;DEBUG_VALUE: vec2d_unpacklo:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: __ret <- undef
	;DEBUG_VALUE: vec2d_load_aligned:a <- undef
	;DEBUG_VALUE: __ret <- undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_4_0:v <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:559:5 ] ]
	fsub.2d	v5, v5, v7
Ltmp6044:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x9
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	.loc	9 1581 12                       ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:561:10 ] ]
	ldp	q4, q7, [x9]
Ltmp6045:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_fft_basecase_4_0:u <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_fft_basecase_4_0:u <- [DW_OP_LLVM_fragment 0 128] $q4
	.loc	5 563 30                        ; build/fused-load-screen/control-fft.c:563:30
	add	x8, x8, x2, lsl #5
Ltmp6046:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x8
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x8
	.loc	9 1581 12                       ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:563:10 ] ]
	ldp	q22, q23, [x8]
Ltmp6047:
	;DEBUG_VALUE: __ret <- $q22
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x8
	;DEBUG_VALUE: sd_fft_basecase_4_0:w2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: sd_fft_basecase_4_0:w2 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: __ret <- $q23
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q7
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q4
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1943:29 @[ build/fused-load-screen/control-fft.c:564:10 ] ]
	zip1.2d	v24, v4, v7
Ltmp6048:
	;DEBUG_VALUE: sd_fft_basecase_4_0:w <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q7
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q4
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1948:29 @[ build/fused-load-screen/control-fft.c:565:10 ] ]
	zip2.2d	v4, v4, v7
Ltmp6049:
	;DEBUG_VALUE: sd_fft_basecase_4_0:iw <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q17
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q16
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip1.2d	v7, v17, v16
Ltmp6050:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q7
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q18
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q19
	.loc	9 1769 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip1.2d	v25, v18, v19
Ltmp6051:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q25
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q17
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q16
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q7
	.loc	9 1773 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip2.2d	v16, v17, v16
Ltmp6052:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q16
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q18
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q19
	.loc	9 1773 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip2.2d	v17, v18, v19
Ltmp6053:
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q17
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q20
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q6
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q16
	.loc	9 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip1.2d	v18, v20, v6
Ltmp6054:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q18
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q21
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q5
	.loc	9 1769 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip1.2d	v19, v21, v5
Ltmp6055:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q19
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q20
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q6
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q18
	.loc	9 1773 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip2.2d	v6, v20, v6
Ltmp6056:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q6
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q21
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q5
	.loc	9 1773 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:566:5 ] ]
	zip2.2d	v5, v21, v5
Ltmp6057:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q5
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ]
	fmul.2d	v20, v7, v1[0]
Ltmp6058:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ]
	frintn.2d	v20, v20
Ltmp6059:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ]
	fmls.2d	v7, v0, v20
Ltmp6060:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ]
	fmul.2d	v20, v18, v1[0]
Ltmp6061:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ]
	frintn.2d	v20, v20
Ltmp6062:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ]
	fmls.2d	v18, v0, v20
Ltmp6063:
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod:a <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q22
	;DEBUG_VALUE: vec2d_mulmod:b <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v20, v22, v25
Ltmp6064:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v21, v20, v1[0]
Ltmp6065:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v21, v21
Ltmp6066:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q22
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v26, v20
	fmls.2d	v26, v22, v25
Ltmp6067:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v20, v0, v21
Ltmp6068:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v20, v20, v26
Ltmp6069:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q23
	;DEBUG_VALUE: vec2d_mulmod:b <- $q23
	;DEBUG_VALUE: vec2d_mul:b <- $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v21, v23, v19
Ltmp6070:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v25, v21, v1[0]
Ltmp6071:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp6072:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q23
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v26, v21
Ltmp6073:
	fmls.2d	v26, v23, v19
Ltmp6074:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v21, v0, v25
Ltmp6075:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v19, v21, v26
Ltmp6076:
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q22
	;DEBUG_VALUE: vec2d_mulmod:b <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v21, v22, v17
Ltmp6077:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v25, v21, v1[0]
Ltmp6078:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp6079:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q22
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v26, v21
Ltmp6080:
	fmls.2d	v26, v22, v17
Ltmp6081:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v21, v0, v25
Ltmp6082:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v17, v21, v26
Ltmp6083:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q23
	;DEBUG_VALUE: vec2d_mulmod:b <- $q23
	;DEBUG_VALUE: vec2d_mul:b <- $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v21, v23, v5
Ltmp6084:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp6085:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v22, v22
Ltmp6086:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q23
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v25, v21
Ltmp6087:
	fmls.2d	v25, v23, v5
Ltmp6088:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v21, v0, v22
Ltmp6089:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v5, v21, v25
Ltmp6090:
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q20
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v21, v7, v20
Ltmp6091:
	;DEBUG_VALUE: vec4d_add:z1 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v22, v18, v19
Ltmp6092:
	;DEBUG_VALUE: vec4d_add:z2 <- $q22
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_add:b <- $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q6
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v23, v16, v17
Ltmp6093:
	;DEBUG_VALUE: vec4d_add:z1 <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q5
	;DEBUG_VALUE: vec2d_add:a <- $q6
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v25, v6, v5
Ltmp6094:
	;DEBUG_VALUE: vec4d_add:z2 <- $q25
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v7, v7, v20
Ltmp6095:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v18, v18, v19
Ltmp6096:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q6
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v16, v16, v17
Ltmp6097:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q16
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v5, v6, v5
Ltmp6098:
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q23
	;DEBUG_VALUE: vec2d_mulmod:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
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
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v6, v24, v23
Ltmp6099:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v17, v6, v1[0]
Ltmp6100:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp6101:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v19, v6
Ltmp6102:
	fmls.2d	v19, v24, v23
Ltmp6103:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v6, v0, v17
Ltmp6104:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v6, v6, v19
Ltmp6105:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:b <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod:a <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v17, v2, v25
Ltmp6106:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v19, v17, v1[0]
Ltmp6107:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v19, v19
Ltmp6108:
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v20, v17
Ltmp6109:
	fmls.2d	v20, v2, v25
Ltmp6110:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v17, v0, v19
Ltmp6111:
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v17, v17, v20
Ltmp6112:
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v19, v4, v16
Ltmp6113:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp6114:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp6115:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v23, v19
Ltmp6116:
	fmls.2d	v23, v4, v16
Ltmp6117:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v19, v0, v20
Ltmp6118:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v4, v19, v23
Ltmp6119:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:b <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v16, v3, v5
Ltmp6120:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmul.2d	v1, v16, v1[0]
Ltmp6121:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	frintn.2d	v1, v1
Ltmp6122:
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	mov.16b	v19, v16
Ltmp6123:
	fmls.2d	v19, v3, v5
Ltmp6124:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fmls.2d	v16, v0, v1
Ltmp6125:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ] ] ]
	fsub.2d	v0, v16, v19
Ltmp6126:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q6
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v1, v21, v6
Ltmp6127:
	;DEBUG_VALUE: vec4d_add:z1 <- $q1
	;DEBUG_VALUE: vec2d_add:a <- $q22
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v2, v22, v17
Ltmp6128:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_add:z2 <- $q2
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v3, v21, v6
Ltmp6129:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v5, v22, v17
Ltmp6130:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q4
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v6, v7, v4
Ltmp6131:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q0
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fadd.2d	v16, v18, v0
Ltmp6132:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:z2 <- $q16
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v4, v7, v4
Ltmp6133:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:570:5 ] ]
	stp	q1, q2, [x1]
Ltmp6134:
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	9 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:571:5 ] ]
	stp	q3, q5, [x1, #32]
Ltmp6135:
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:572:5 ] ]
	stp	q6, q16, [x1, #64]
Ltmp6136:
	;DEBUG_VALUE: vec2d_store:a <- $q16
	;DEBUG_VALUE: __s1 <- $q16
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q0
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:567:5 ] ]
	fsub.2d	v0, v18, v0
Ltmp6137:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_sub:z2 <- $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:573:5 ] ]
	stp	q4, q0, [x1, #96]
Ltmp6138:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	.loc	5 574 1                         ; build/fused-load-screen/control-fft.c:574:1
	ret
Ltmp6139:
