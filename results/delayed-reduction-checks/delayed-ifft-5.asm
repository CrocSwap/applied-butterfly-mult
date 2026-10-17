_sd_ifft_basecase_5_0:                  ; @sd_ifft_basecase_5_0
Lfunc_begin11:
	.loc	5 554 0 is_stmt 1               ; build/delayed-reduction-screen/delayed.c:554:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:Q <- $x0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:X <- $x1
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_mr <- $x2
	;DEBUG_VALUE: sd_ifft_basecase_5_0:j_bits <- $x3
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	sub	sp, sp, #176
	stp	d15, d14, [sp, #112]            ; 16-byte Folded Spill
	stp	d13, d12, [sp, #128]            ; 16-byte Folded Spill
	stp	d11, d10, [sp, #144]            ; 16-byte Folded Spill
	stp	d9, d8, [sp, #160]              ; 16-byte Folded Spill
	.cfi_def_cfa_offset 176
	.cfi_offset b8, -8
	.cfi_offset b9, -16
	.cfi_offset b10, -24
	.cfi_offset b11, -32
	.cfi_offset b12, -40
	.cfi_offset b13, -48
	.cfi_offset b14, -56
	.cfi_offset b15, -64
Ltmp2473:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] undef
	.loc	5 568 40 prologue_end           ; build/delayed-reduction-screen/delayed.c:568:40
	lsl	x9, x3, #3
Ltmp2474:
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/delayed-reduction-screen/delayed.c:555:18 ] ]
	mov	x8, x0
	ld1r.2d	{ v3 }, [x8], x9
Ltmp2475:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q3
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: sd_ifft_basecase_5_0:n <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: sd_ifft_basecase_5_0:n <- [DW_OP_LLVM_fragment 128 128] $q3
	.loc	5 556 33                        ; build/delayed-reduction-screen/delayed.c:556:33
	ldr	d1, [x0, #8]
Ltmp2476:
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_load:a <- $x1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:559:16 ] ]
	ldp	q4, q5, [x1]
Ltmp2477:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	10 1571 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:560:16 ] ]
	ldp	q6, q7, [x1, #32]
Ltmp2478:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:561:16 ] ]
	ldp	q16, q17, [x1, #64]
Ltmp2479:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:562:16 ] ]
	ldp	q26, q27, [x1, #96]
Ltmp2480:
	;DEBUG_VALUE: __ret <- $q26
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q27
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:563:16 ] ]
	ldp	q2, q0, [x1, #128]
Ltmp2481:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x1
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: __ret <- $q0
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:564:16 ] ]
	ldp	q20, q21, [x1, #160]
Ltmp2482:
	;DEBUG_VALUE: __ret <- $q20
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x1
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: __ret <- $q21
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:565:16 ] ]
	ldp	q22, q23, [x1, #192]
Ltmp2483:
	;DEBUG_VALUE: __ret <- $q22
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x1
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: __ret <- $q23
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	.loc	10 1571 12                      ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/delayed-reduction-screen/delayed.c:566:16 ] ]
	ldp	q24, q25, [x1, #224]
Ltmp2484:
	;DEBUG_VALUE: __ret <- $q24
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x1
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: __ret <- $q25
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q25
	.loc	5 568 30 is_stmt 1              ; build/delayed-reduction-screen/delayed.c:568:30
	ldp	x9, x11, [x8, #80]
	add	x10, x9, x2, lsl #6
Ltmp2485:
	;DEBUG_VALUE: vec4d_load_aligned:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x10
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x10
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:568:10 ] ]
	ldp	q18, q19, [x10, #32]
Ltmp2486:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x10
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: __s0 <- $q19
	;DEBUG_VALUE: __s1 <- $q19
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 0 128] $q18
	.loc	10 1924 29                      ; .deps/flint/src/machine_vectors.h:1924:29 @[ build/delayed-reduction-screen/delayed.c:569:10 ]
	ext.16b	v19, v19, v19, #8
Ltmp2487:
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: __s0 <- $q18
	;DEBUG_VALUE: __s1 <- $q18
	.loc	10 1925 29                      ; .deps/flint/src/machine_vectors.h:1925:29 @[ build/delayed-reduction-screen/delayed.c:569:10 ]
	ext.16b	v18, v18, v18, #8
Ltmp2488:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: __ret <- $q18
	.loc	5 570 30                        ; build/delayed-reduction-screen/delayed.c:570:30
	add	x9, x11, x2, lsl #7
Ltmp2489:
	;DEBUG_VALUE: vec4d_load_aligned:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x9
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:570:10 ] ]
	ldp	q28, q29, [x9, #64]
Ltmp2490:
	;DEBUG_VALUE: __ret <- $q28
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q29
	;DEBUG_VALUE: sd_ifft_basecase_5_0:u <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: sd_ifft_basecase_5_0:u <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_load_aligned:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x9
	.loc	10 1581 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:571:10 ] ]
	ldp	q30, q31, [x9, #96]
Ltmp2491:
	;DEBUG_VALUE: __ret <- $q30
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x9
	;DEBUG_VALUE: __ret <- $q31
	;DEBUG_VALUE: sd_ifft_basecase_5_0:v <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q31
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: sd_ifft_basecase_5_0:v <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q30
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1953:29 @[ build/delayed-reduction-screen/delayed.c:572:11 ] ]
	zip2.2d	v8, v31, v30
Ltmp2492:
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q28
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q29
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1954:29 @[ build/delayed-reduction-screen/delayed.c:572:11 ] ]
	zip2.2d	v9, v29, v28
Ltmp2493:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q30
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q31
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1958:29 @[ build/delayed-reduction-screen/delayed.c:573:11 ] ]
	zip1.2d	v30, v31, v30
Ltmp2494:
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q28
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q29
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1959:29 @[ build/delayed-reduction-screen/delayed.c:573:11 ] ]
	zip1.2d	v28, v29, v28
Ltmp2495:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_add:b <- $q6
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_add:a <- $q4
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v29, v4, v6
Ltmp2496:
	;DEBUG_VALUE: vec4d_add:z1 <- $q29
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v31, v5, v7
Ltmp2497:
	;DEBUG_VALUE: vec4d_add:z2 <- $q31
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec2d_add:b <- $q26
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q27
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v10, v16, v26
Ltmp2498:
	;DEBUG_VALUE: vec4d_add:z1 <- $q10
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q27
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v11, v17, v27
Ltmp2499:
	;DEBUG_VALUE: vec4d_add:z2 <- $q11
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v4, v4, v6
Ltmp2500:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v5, v5, v7
Ltmp2501:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q27
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v6, v26, v16
Ltmp2502:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v7, v27, v17
Ltmp2503:
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
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q8
	;DEBUG_VALUE: vec2d_mulmod:b <- $q8
	;DEBUG_VALUE: vec2d_mul:b <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v16, v4, v8
Ltmp2504:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp2505:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp2506:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q8
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	mov.16b	v26, v16
Ltmp2507:
	fmls.2d	v26, v8, v4
Ltmp2508:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmls.2d	v16, v3, v17
Ltmp2509:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fsub.2d	v16, v16, v26
Ltmp2510:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod:b <- $q9
	;DEBUG_VALUE: vec2d_mul:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v4, v5, v9
Ltmp2511:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v17, v4, v1[0]
Ltmp2512:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp2513:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q9
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	mov.16b	v26, v4
Ltmp2514:
	fmls.2d	v26, v9, v5
Ltmp2515:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmls.2d	v4, v3, v17
Ltmp2516:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fsub.2d	v17, v4, v26
Ltmp2517:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q30
	;DEBUG_VALUE: vec2d_mulmod:b <- $q30
	;DEBUG_VALUE: vec2d_mul:b <- $q30
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v4, v6, v30
Ltmp2518:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v5, v4, v1[0]
Ltmp2519:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	frintn.2d	v5, v5
Ltmp2520:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q30
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	mov.16b	v26, v4
Ltmp2521:
	fmls.2d	v26, v30, v6
Ltmp2522:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmls.2d	v4, v3, v5
Ltmp2523:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fsub.2d	v26, v4, v26
Ltmp2524:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q26
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q28
	;DEBUG_VALUE: vec2d_mulmod:b <- $q28
	;DEBUG_VALUE: vec2d_mul:b <- $q28
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v4, v7, v28
Ltmp2525:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v5, v4, v1[0]
Ltmp2526:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	frintn.2d	v5, v5
Ltmp2527:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q28
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	mov.16b	v6, v4
Ltmp2528:
	fmls.2d	v6, v28, v7
Ltmp2529:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmls.2d	v4, v3, v5
Ltmp2530:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fsub.2d	v27, v4, v6
Ltmp2531:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec2d_add:a <- $q29
	;DEBUG_VALUE: vec2d_add:b <- $q10
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v6, v29, v10
Ltmp2532:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q31
	;DEBUG_VALUE: vec2d_add:b <- $q11
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v5, v31, v11
Ltmp2533:
	;DEBUG_VALUE: vec4d_add:z2 <- $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v12, v26, v16
Ltmp2534:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q12
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v7, v27, v17
Ltmp2535:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q12
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q12
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_sub:a <- $q10
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v28, v10, v29
Ltmp2536:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q28
	;DEBUG_VALUE: vec2d_sub:a <- $q11
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fsub.2d	v29, v11, v31
Ltmp2537:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q29
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_add:a <- $q26
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v26, v26, v16
Ltmp2538:
	;DEBUG_VALUE: vec4d_add:z1 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q27
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ]
	fadd.2d	v27, v27, v17
Ltmp2539:
	;DEBUG_VALUE: vec4d_add:z2 <- $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmul.2d	v16, v6, v1[0]
Ltmp2540:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	frintn.2d	v16, v16
Ltmp2541:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmls.2d	v6, v3, v16
Ltmp2542:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmul.2d	v16, v5, v1[0]
Ltmp2543:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	frintn.2d	v16, v16
Ltmp2544:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmls.2d	v5, v3, v16
Ltmp2545:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q12
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_mulmod:a <- $q28
	;DEBUG_VALUE: vec2d_mul:a <- $q28
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- $q19
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmul.2d	v16, v28, v19
Ltmp2546:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmul.2d	v17, v16, v1[0]
Ltmp2547:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	frintn.2d	v17, v17
Ltmp2548:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q19
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	mov.16b	v30, v16
Ltmp2549:
	fmls.2d	v30, v19, v28
Ltmp2550:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmls.2d	v16, v3, v17
Ltmp2551:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fsub.2d	v17, v16, v30
Ltmp2552:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q29
	;DEBUG_VALUE: vec2d_mul:a <- $q29
	;DEBUG_VALUE: vec2d_mulmod:b <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmul.2d	v16, v29, v18
Ltmp2553:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmul.2d	v28, v16, v1[0]
Ltmp2554:
	;DEBUG_VALUE: vec2d_round:a <- $q28
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	frintn.2d	v28, v28
Ltmp2555:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q18
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	mov.16b	v30, v16
Ltmp2556:
	fmls.2d	v30, v18, v29
Ltmp2557:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fmls.2d	v16, v3, v28
Ltmp2558:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ]
	fsub.2d	v13, v16, v30
Ltmp2559:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q13
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod:a <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v28, v19, v26
Ltmp2560:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q28
	;DEBUG_VALUE: vec2d_mul:a <- $q28
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v29, v28, v1[0]
Ltmp2561:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2562:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q19
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	mov.16b	v30, v28
Ltmp2563:
	fmls.2d	v30, v19, v26
Ltmp2564:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmls.2d	v28, v3, v29
Ltmp2565:
	;DEBUG_VALUE: vec2d_sub:a <- $q28
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fsub.2d	v19, v28, v30
Ltmp2566:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q27
	;DEBUG_VALUE: vec2d_mulmod:a <- $q27
	;DEBUG_VALUE: vec2d_mul:a <- $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod:b <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v26, v18, v27
Ltmp2567:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmul.2d	v28, v26, v1[0]
Ltmp2568:
	;DEBUG_VALUE: vec2d_round:a <- $q28
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	frintn.2d	v28, v28
Ltmp2569:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q18
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	mov.16b	v29, v26
Ltmp2570:
	fmls.2d	v29, v18, v27
Ltmp2571:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fmls.2d	v26, v3, v28
Ltmp2572:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:574:5 ] ] ] ]
	fsub.2d	v18, v26, v29
Ltmp2573:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x10
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x10
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:576:10 ] ]
	ldp	q26, q27, [x10]
Ltmp2574:
	;DEBUG_VALUE: __ret <- $q26
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x10
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: __ret <- $q27
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: __s0 <- $q27
	;DEBUG_VALUE: __s1 <- $q27
	;DEBUG_VALUE: vec4d_permute_3_2_1_0:a <- [DW_OP_LLVM_fragment 0 128] $q26
	.loc	10 1924 29                      ; .deps/flint/src/machine_vectors.h:1924:29 @[ build/delayed-reduction-screen/delayed.c:577:10 ]
	ext.16b	v30, v27, v27, #8
Ltmp2575:
	;DEBUG_VALUE: __ret <- $q30
	;DEBUG_VALUE: __s0 <- $q26
	;DEBUG_VALUE: __s1 <- $q26
	.loc	10 1925 29                      ; .deps/flint/src/machine_vectors.h:1925:29 @[ build/delayed-reduction-screen/delayed.c:577:10 ]
	ext.16b	v29, v26, v26, #8
Ltmp2576:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: __ret <- $q29
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x9
	.loc	10 1581 12                      ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:578:10 ] ]
	ldp	q26, q27, [x9]
Ltmp2577:
	;DEBUG_VALUE: __ret <- $q26
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x9
	;DEBUG_VALUE: sd_ifft_basecase_5_0:u <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_ifft_basecase_5_0:u <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: __ret <- $q27
	;DEBUG_VALUE: vec4d_load_aligned:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x9
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x9
	.loc	10 1581 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/delayed-reduction-screen/delayed.c:579:10 ] ]
	ldp	q28, q31, [x9, #32]
Ltmp2578:
	;DEBUG_VALUE: __ret <- $q28
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x9
	;DEBUG_VALUE: sd_ifft_basecase_5_0:v <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: sd_ifft_basecase_5_0:v <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: __ret <- $q31
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q31
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q28
	;DEBUG_VALUE: vec4d_unpackhi_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 0 128] $q26
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1953:29 @[ build/delayed-reduction-screen/delayed.c:580:11 ] ]
	zip2.2d	v8, v31, v28
Ltmp2579:
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q27
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q26
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1954:29 @[ build/delayed-reduction-screen/delayed.c:580:11 ] ]
	zip2.2d	v9, v27, v26
Ltmp2580:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q28
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:v <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q31
	;DEBUG_VALUE: vec4d_unpacklo_permute_3_1_2_0:u <- [DW_OP_LLVM_fragment 0 128] $q26
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1958:29 @[ build/delayed-reduction-screen/delayed.c:581:11 ] ]
	zip1.2d	v28, v31, v28
Ltmp2581:
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q27
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q26
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1959:29 @[ build/delayed-reduction-screen/delayed.c:581:11 ] ]
	zip1.2d	v26, v27, v26
Ltmp2582:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_add:a <- $q2
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_add:b <- $q20
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q25
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v27, v2, v20
Ltmp2583:
	;DEBUG_VALUE: vec4d_add:z1 <- $q27
	;DEBUG_VALUE: vec2d_add:a <- $q0
	;DEBUG_VALUE: vec2d_add:b <- $q21
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v31, v0, v21
Ltmp2584:
	;DEBUG_VALUE: vec4d_add:z2 <- $q31
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_add:a <- $q22
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q25
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v10, v22, v24
Ltmp2585:
	;DEBUG_VALUE: vec4d_add:z1 <- $q10
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q25
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v11, v23, v25
Ltmp2586:
	;DEBUG_VALUE: vec4d_add:z2 <- $q11
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v2, v2, v20
Ltmp2587:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q0
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v0, v0, v21
Ltmp2588:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q24
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q25
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v20, v24, v22
Ltmp2589:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v21, v25, v23
Ltmp2590:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q8
	;DEBUG_VALUE: vec2d_mulmod:b <- $q8
	;DEBUG_VALUE: vec2d_mul:b <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v22, v2, v8
Ltmp2591:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v23, v22, v1[0]
Ltmp2592:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	frintn.2d	v23, v23
Ltmp2593:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q8
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	mov.16b	v24, v22
Ltmp2594:
	fmls.2d	v24, v8, v2
Ltmp2595:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmls.2d	v22, v3, v23
Ltmp2596:
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fsub.2d	v2, v22, v24
Ltmp2597:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q0
	;DEBUG_VALUE: vec2d_mulmod:a <- $q0
	;DEBUG_VALUE: vec2d_mul:a <- $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod:b <- $q9
	;DEBUG_VALUE: vec2d_mul:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v22, v0, v9
Ltmp2598:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v23, v22, v1[0]
Ltmp2599:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	frintn.2d	v23, v23
Ltmp2600:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q0
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q9
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	mov.16b	v24, v22
Ltmp2601:
	fmls.2d	v24, v9, v0
Ltmp2602:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmls.2d	v22, v3, v23
Ltmp2603:
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fsub.2d	v0, v22, v24
Ltmp2604:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q28
	;DEBUG_VALUE: vec2d_mulmod:b <- $q28
	;DEBUG_VALUE: vec2d_mul:b <- $q28
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v22, v20, v28
Ltmp2605:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v23, v22, v1[0]
Ltmp2606:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	frintn.2d	v23, v23
Ltmp2607:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q28
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	mov.16b	v24, v22
Ltmp2608:
	fmls.2d	v24, v28, v20
Ltmp2609:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmls.2d	v22, v3, v23
Ltmp2610:
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fsub.2d	v23, v22, v24
Ltmp2611:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q26
	;DEBUG_VALUE: vec2d_mulmod:b <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- $q26
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v20, v21, v26
Ltmp2612:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v22, v20, v1[0]
Ltmp2613:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	frintn.2d	v22, v22
Ltmp2614:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q26
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	mov.16b	v24, v20
Ltmp2615:
	fmls.2d	v24, v26, v21
Ltmp2616:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmls.2d	v20, v3, v22
Ltmp2617:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fsub.2d	v21, v20, v24
Ltmp2618:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec2d_add:a <- $q27
	;DEBUG_VALUE: vec2d_add:b <- $q10
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v24, v27, v10
Ltmp2619:
	;DEBUG_VALUE: vec4d_add:z1 <- $q24
	;DEBUG_VALUE: vec2d_add:a <- $q31
	;DEBUG_VALUE: vec2d_add:b <- $q11
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v20, v31, v11
Ltmp2620:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v26, v23, v2
Ltmp2621:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q26
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q0
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v22, v21, v0
Ltmp2622:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q10
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_sub:a <- $q10
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v25, v10, v27
Ltmp2623:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q25
	;DEBUG_VALUE: vec2d_sub:a <- $q11
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fsub.2d	v27, v11, v31
Ltmp2624:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q27
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q2
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v2, v23, v2
Ltmp2625:
	;DEBUG_VALUE: vec4d_add:z1 <- $q2
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q0
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ]
	fadd.2d	v4, v21, v0
Ltmp2626:
	;DEBUG_VALUE: vec4d_add:z2 <- $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q24
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmul.2d	v21, v24, v1[0]
Ltmp2627:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	frintn.2d	v21, v21
Ltmp2628:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmls.2d	v24, v3, v21
Ltmp2629:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmul.2d	v21, v20, v1[0]
Ltmp2630:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	frintn.2d	v21, v21
Ltmp2631:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmls.2d	v20, v3, v21
Ltmp2632:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec2d_mulmod:a <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec2d_mulmod:b <- $q30
	;DEBUG_VALUE: vec2d_mul:b <- $q30
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmul.2d	v21, v25, v30
Ltmp2633:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmul.2d	v23, v21, v1[0]
Ltmp2634:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2635:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q30
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	mov.16b	v28, v21
Ltmp2636:
	fmls.2d	v28, v30, v25
Ltmp2637:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmls.2d	v21, v3, v23
Ltmp2638:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fsub.2d	v28, v21, v28
Ltmp2639:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q28
	;DEBUG_VALUE: vec2d_mulmod:a <- $q27
	;DEBUG_VALUE: vec2d_mul:a <- $q27
	;DEBUG_VALUE: vec2d_mulmod:b <- $q29
	;DEBUG_VALUE: vec2d_mul:b <- $q29
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmul.2d	v21, v27, v29
Ltmp2640:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmul.2d	v23, v21, v1[0]
Ltmp2641:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2642:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q29
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	mov.16b	v25, v21
Ltmp2643:
	fmls.2d	v25, v29, v27
Ltmp2644:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fmls.2d	v21, v3, v23
Ltmp2645:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ]
	fsub.2d	v0, v21, v25
Ltmp2646:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q30
	;DEBUG_VALUE: vec2d_mulmod:b <- $q30
	;DEBUG_VALUE: vec2d_mul:b <- $q30
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v21, v30, v2
Ltmp2647:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v23, v21, v1[0]
Ltmp2648:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	frintn.2d	v23, v23
Ltmp2649:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q30
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	mov.16b	v25, v21
Ltmp2650:
	fmls.2d	v25, v30, v2
Ltmp2651:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmls.2d	v21, v3, v23
Ltmp2652:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fsub.2d	v30, v21, v25
Ltmp2653:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q29
	;DEBUG_VALUE: vec2d_mulmod:b <- $q29
	;DEBUG_VALUE: vec2d_mul:b <- $q29
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v2, v29, v4
Ltmp2654:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmul.2d	v21, v2, v1[0]
Ltmp2655:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	frintn.2d	v21, v21
Ltmp2656:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q29
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	mov.16b	v23, v2
Ltmp2657:
	fmls.2d	v23, v29, v4
Ltmp2658:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fmls.2d	v2, v3, v21
Ltmp2659:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:582:5 ] ] ] ]
	fsub.2d	v29, v2, v23
Ltmp2660:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q30
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	mov.16b	v16, v12
Ltmp2661:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q6
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q16
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip1.2d	v21, v6, v12
Ltmp2662:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q21
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q5
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q7
	.loc	10 1769 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip1.2d	v23, v5, v7
Ltmp2663:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q23
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q6
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q16
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q21
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip2.2d	v25, v6, v12
Ltmp2664:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q25
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q5
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q7
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip2.2d	v9, v5, v7
Ltmp2665:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_plus_uconst 48, DW_OP_LLVM_fragment 128 128] [$sp+0]
	;DEBUG_VALUE: Z1 <- [DW_OP_plus_uconst 48, DW_OP_LLVM_fragment 128 128] [$sp+0]
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_plus_uconst 48, DW_OP_LLVM_fragment 128 128] [$sp+0]
	;DEBUG_VALUE: vec2d_unpackhi:b <- [DW_OP_plus_uconst 48] [$sp+0]
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q9
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q17
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q19
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q25
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip1.2d	v8, v17, v19
Ltmp2666:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q8
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	mov.16b	v31, v18
Ltmp2667:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q13
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q31
	.loc	10 1769 12                      ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip1.2d	v10, v13, v18
Ltmp2668:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q10
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q17
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q19
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q8
	.loc	10 1773 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip2.2d	v11, v17, v19
Ltmp2669:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q11
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q13
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q31
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:584:5 ] ]
	zip2.2d	v12, v13, v18
Ltmp2670:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q9
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q12
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q11
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 0 128] $q11
	.loc	10 0 12                         ; .deps/flint/src/machine_vectors.h:0:12
	mov.16b	v18, v13
Ltmp2671:
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q18
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q24
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q26
	.loc	10 1769 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip1.2d	v2, v24, v26
Ltmp2672:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q2
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	stp	q7, q2, [sp, #48]               ; 32-byte Folded Spill
Ltmp2673:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- [DW_OP_plus_uconst 64] [$sp+0]
	.loc	5 587 24 is_stmt 1              ; build/delayed-reduction-screen/delayed.c:587:24
	ldp	x9, x10, [x8, #56]
Ltmp2674:
	ldr	d27, [x9, x2, lsl #3]
Ltmp2675:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- $d27
	;DEBUG_VALUE: vec2d_set_d:a <- $d27
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	5 588 24                        ; build/delayed-reduction-screen/delayed.c:588:24
	add	x9, x10, x2, lsl #4
Ltmp2676:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/delayed-reduction-screen/delayed.c:589:12 ] ]
	ld1r.2d	{ v4 }, [x9], #8
Ltmp2677:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: sd_ifft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q4
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q4
	.loc	5 590 24                        ; build/delayed-reduction-screen/delayed.c:590:24
	ldr	x8, [x8, #72]
	add	x8, x8, x2, lsl #5
	ldp	d14, d13, [x8, #16]
Ltmp2678:
	;DEBUG_VALUE: vec4d_set_d:a <- $d13
	;DEBUG_VALUE: vec2d_set_d:a <- $d13
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www0 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- $d14
	;DEBUG_VALUE: vec2d_set_d:a <- $d14
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v21, v25, v21
Ltmp2679:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q8
	;DEBUG_VALUE: vec2d_sub:a <- $q11
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v25, v11, v8
Ltmp2680:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v11, v21, v13[0]
Ltmp2681:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q11
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q11
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v15, v11
	fmls.2d	v15, v21, v13[0]
Ltmp2682:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v21, v25, v13[0]
Ltmp2683:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v2, v21
	fmls.2d	v2, v25, v13[0]
Ltmp2684:
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q20
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q22
	;DEBUG_VALUE: vec2d_mulmod:l <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1769 12                      ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip1.2d	v8, v20, v22
Ltmp2685:
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q8
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_plus_uconst 64, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: _t0 <- [DW_OP_plus_uconst 64, DW_OP_LLVM_fragment 0 128] [$sp+0]
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v23, v9, v23
Ltmp2686:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q10
	;DEBUG_VALUE: vec2d_sub:a <- $q12
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v25, v12, v10
Ltmp2687:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q23
	;DEBUG_VALUE: vec2d_mulmod:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v10, v23, v14[0]
Ltmp2688:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v12, v10
Ltmp2689:
	fmls.2d	v12, v23, v14[0]
Ltmp2690:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q12
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v23, v25, v14[0]
Ltmp2691:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q23
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v9, v23
Ltmp2692:
	fmls.2d	v9, v25, v14[0]
Ltmp2693:
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q24
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q26
	;DEBUG_VALUE: vec2d_mulmod:l <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1773 12                      ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip2.2d	v14, v24, v26
Ltmp2694:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q14
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q20
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q22
	.loc	10 1773 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip2.2d	v7, v20, v22
Ltmp2695:
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q7
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q14
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v6, v6, v16
Ltmp2696:
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q28
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q30
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- undef
	;DEBUG_VALUE: vec2d_add:b <- undef
	.loc	10 1769 12                      ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip1.2d	v25, v28, v30
Ltmp2697:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q25
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v13, v17, v19
Ltmp2698:
	;DEBUG_VALUE: vec2d_mul:a <- $q11
	;DEBUG_VALUE: vec4d_add:z2 <- $q13
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v17, v11, v1[0]
Ltmp2699:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp2700:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q11
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v11, v3, v17
Ltmp2701:
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q0
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q29
	.loc	10 1769 12                      ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip1.2d	v19, v0, v29
Ltmp2702:
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_sub:a <- $q11
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q19
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q25
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v16, v11, v15
Ltmp2703:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v17, v21, v1[0]
Ltmp2704:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v17, v17
Ltmp2705:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v21, v3, v17
Ltmp2706:
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q28
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q30
	.loc	10 1773 12                      ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip2.2d	v11, v28, v30
Ltmp2707:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q11
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v2, v21, v2
Ltmp2708:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:l <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: A1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_plus_uconst 96, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: A1 <- [DW_OP_plus_uconst 96, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: A0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: A0 <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_add:a <- undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_add:b <- undef
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	stp	q2, q16, [sp, #80]              ; 32-byte Folded Spill
Ltmp2709:
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_plus_uconst 80, DW_OP_LLVM_fragment 128 128] [$sp+0]
	;DEBUG_VALUE: A1 <- [DW_OP_plus_uconst 80, DW_OP_LLVM_fragment 128 128] [$sp+0]
	.loc	5 588 24 is_stmt 1              ; build/delayed-reduction-screen/delayed.c:588:24
	ldr	d17, [x9]
Ltmp2710:
	;DEBUG_VALUE: vec4d_set_d:a <- $d17
	;DEBUG_VALUE: vec2d_set_d:a <- $d17
	.loc	5 0 24 is_stmt 0                ; build/delayed-reduction-screen/delayed.c:0:24
	ldr	q2, [sp, #48]                   ; 16-byte Folded Reload
Ltmp2711:
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q2
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v15, v5, v2
Ltmp2712:
	;DEBUG_VALUE: vec4d_add:z1 <- $q15
	;DEBUG_VALUE: vec2d_add:a <- undef
	;DEBUG_VALUE: vec2d_add:b <- undef
	.loc	10 1566 12                      ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/delayed-reduction-screen/delayed.c:593:12 ] ]
	ld1r.2d	{ v2 }, [x8], #8
Ltmp2713:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q2
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www3 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www3 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:www1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v16, v18, v31
Ltmp2714:
	;DEBUG_VALUE: vec2d_mul:a <- $q10
	;DEBUG_VALUE: vec4d_add:z2 <- $q16
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v5, v10, v1[0]
Ltmp2715:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v5, v5
Ltmp2716:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v10, v3, v5
Ltmp2717:
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q0
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q29
	.loc	10 1773 12                      ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/delayed-reduction-screen/delayed.c:585:5 ] ]
	zip2.2d	v18, v0, v29
Ltmp2718:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q12
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_sub:a <- $q10
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q18
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v21, v10, v12
Ltmp2719:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v5, v23, v1[0]
Ltmp2720:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v5, v5
Ltmp2721:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v23, v3, v5
Ltmp2722:
	.loc	5 592 24                        ; build/delayed-reduction-screen/delayed.c:592:24
	ldr	d10, [x8]
Ltmp2723:
	;DEBUG_VALUE: A1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: A1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: A0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: A0 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q9
	;DEBUG_VALUE: vec4d_set_d:a <- $d10
	;DEBUG_VALUE: vec2d_set_d:a <- $d10
	;DEBUG_VALUE: A2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: A3 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: A6 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: A7 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: A4 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: A5 <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: A2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: A3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_add:a <- undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_add:b <- undef
	;DEBUG_VALUE: A6 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: A7 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: A4 <- [DW_OP_plus_uconst 64, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: A5 <- [DW_OP_LLVM_fragment 0 128] $q14
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v5, v23, v9
Ltmp2724:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: A2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: A3 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: A2 <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: A3 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_plus_uconst 64, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: vec2d_add:a <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec2d_add:b <- $q14
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v23, v24, v26
Ltmp2725:
	;DEBUG_VALUE: vec4d_add:z1 <- $q23
	;DEBUG_VALUE: vec2d_add:a <- $q25
	;DEBUG_VALUE: vec2d_add:b <- $q11
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v24, v28, v30
Ltmp2726:
	;DEBUG_VALUE: vec4d_add:z2 <- $q24
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 0 128] $q23
	.loc	10 0 12                         ; .deps/flint/src/machine_vectors.h:0:12
	ldr	q26, [sp, #64]                  ; 16-byte Folded Reload
Ltmp2727:
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: A4 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec2d_sub:a <- $q14
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v26, v14, v26
Ltmp2728:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	;DEBUG_VALUE: vec2d_sub:a <- $q11
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v25, v11, v25
Ltmp2729:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod:a <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v28, v26, v10[0]
Ltmp2730:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q28
	;DEBUG_VALUE: vec2d_mul:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v30, v28, v1[0]
Ltmp2731:
	;DEBUG_VALUE: vec2d_round:a <- $q30
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v30, v30
Ltmp2732:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod:q <- $q30
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v31, v28
Ltmp2733:
	fmls.2d	v31, v26, v10[0]
Ltmp2734:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_mulmod:l <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v28, v3, v30
Ltmp2735:
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	;DEBUG_VALUE: vec2d_sub:a <- $q28
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v31, v28, v31
Ltmp2736:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q31
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod:a <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v26, v25, v10[0]
Ltmp2737:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v28, v26, v1[0]
Ltmp2738:
	;DEBUG_VALUE: vec2d_round:a <- $q28
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v28, v28
Ltmp2739:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v30, v26
Ltmp2740:
	fmls.2d	v30, v25, v10[0]
Ltmp2741:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v26, v3, v28
Ltmp2742:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v10, v26, v30
Ltmp2743:
	;DEBUG_VALUE: A4 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: A5 <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: A4 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: A5 <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q10
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec2d_add:a <- $q8
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v22, v20, v22
Ltmp2744:
	;DEBUG_VALUE: vec4d_add:z1 <- $q22
	;DEBUG_VALUE: vec2d_add:a <- $q19
	;DEBUG_VALUE: vec2d_add:b <- $q18
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	faddp.2d	v25, v0, v29
Ltmp2745:
	;DEBUG_VALUE: vec4d_add:z2 <- $q25
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: S <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec2d_sub:b <- $q8
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v7, v7, v8
Ltmp2746:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v18, v18, v19
Ltmp2747:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:b <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v19, v7, v2
Ltmp2748:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2749:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v20, v20
Ltmp2750:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v26, v19
Ltmp2751:
	fmls.2d	v26, v2, v7
Ltmp2752:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v19, v3, v20
Ltmp2753:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v11, v19, v26
Ltmp2754:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q11
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:b <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v7, v18, v2
Ltmp2755:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v19, v7, v1[0]
Ltmp2756:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v19, v19
Ltmp2757:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v20, v7
Ltmp2758:
	fmls.2d	v20, v2, v18
Ltmp2759:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v7, v3, v19
Ltmp2760:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v12, v7, v20
Ltmp2761:
	;DEBUG_VALUE: A6 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: A7 <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: A6 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: A7 <- [DW_OP_LLVM_fragment 0 128] $q11
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q12
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q11
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q15
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v20, v15, v6
Ltmp2762:
	;DEBUG_VALUE: vec4d_add:z1 <- $q20
	;DEBUG_VALUE: vec2d_add:a <- $q13
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v26, v16, v13
Ltmp2763:
	;DEBUG_VALUE: vec4d_add:z2 <- $q26
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: B0 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: B0 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v18, v22, v23
Ltmp2764:
	;DEBUG_VALUE: vec4d_add:z1 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q25
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v7, v25, v24
Ltmp2765:
	;DEBUG_VALUE: vec4d_add:z2 <- $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: B1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: B1 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v2, v6, v15
Ltmp2766:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q13
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v6, v13, v16
Ltmp2767:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v16, v22, v23
Ltmp2768:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v22, v25, v24
Ltmp2769:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: B3 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: B3 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v23, v20, v1[0]
Ltmp2770:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2771:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v20, v3, v23
Ltmp2772:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v23, v26, v1[0]
Ltmp2773:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2774:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v26, v3, v23
Ltmp2775:
	;DEBUG_VALUE: B0 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: B0 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q26
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v23, v18, v1[0]
Ltmp2776:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2777:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v18, v3, v23
Ltmp2778:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q18
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v23, v7, v1[0]
Ltmp2779:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2780:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v7, v3, v23
Ltmp2781:
	;DEBUG_VALUE: B1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: B1 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v23, v2, v17[0]
Ltmp2782:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v24, v23, v1[0]
Ltmp2783:
	;DEBUG_VALUE: vec2d_round:a <- $q24
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v24, v24
Ltmp2784:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:q <- $q24
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	mov.16b	v25, v23
Ltmp2785:
	fmls.2d	v25, v2, v17[0]
Ltmp2786:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_mulmod:l <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v23, v3, v24
Ltmp2787:
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fsub.2d	v0, v23, v25
Ltmp2788:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q0
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v2, v6, v17[0]
Ltmp2789:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v23, v2, v1[0]
Ltmp2790:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2791:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	mov.16b	v24, v2
Ltmp2792:
	fmls.2d	v24, v6, v17[0]
Ltmp2793:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v2, v3, v23
Ltmp2794:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fsub.2d	v19, v2, v24
Ltmp2795:
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q19
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	stp	q19, q0, [sp]                   ; 32-byte Folded Spill
Ltmp2796:
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v2, v4, v16
Ltmp2797:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v6, v2, v1[0]
Ltmp2798:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v6, v6
Ltmp2799:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	mov.16b	v23, v2
Ltmp2800:
	fmls.2d	v23, v4, v16
Ltmp2801:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v2, v3, v6
Ltmp2802:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fsub.2d	v23, v2, v23
Ltmp2803:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q23
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v2, v4, v22
Ltmp2804:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v6, v2, v1[0]
Ltmp2805:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v6, v6
Ltmp2806:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	mov.16b	v16, v2
Ltmp2807:
	fmls.2d	v16, v4, v22
Ltmp2808:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v2, v3, v6
Ltmp2809:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fsub.2d	v25, v2, v16
Ltmp2810:
	;DEBUG_VALUE: B3 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: B3 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q25
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q23
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	stp	q25, q23, [sp, #32]             ; 32-byte Folded Spill
Ltmp2811:
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v2, v18, v20
Ltmp2812:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v6, v7, v26
Ltmp2813:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v16, v2, v27[0]
Ltmp2814:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v22, v16
Ltmp2815:
	fmls.2d	v22, v2, v27[0]
Ltmp2816:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	str	q22, [sp, #64]                  ; 16-byte Folded Spill
Ltmp2817:
	;DEBUG_VALUE: vec2d_mulmod:l <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: vec2d_mulmod:l <- [DW_OP_plus_uconst 64] [$sp+0]
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v22, v6, v27[0]
Ltmp2818:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v24, v22
Ltmp2819:
	fmls.2d	v24, v6, v27[0]
Ltmp2820:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v2, v0, v23
Ltmp2821:
	;DEBUG_VALUE: B2 <- [DW_OP_plus_uconst 16, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: B3 <- [DW_OP_plus_uconst 48, DW_OP_LLVM_fragment 0 128] [$sp+0]
	;DEBUG_VALUE: vec4d_add:z1 <- $q2
	;DEBUG_VALUE: vec2d_add:a <- $q25
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v6, v19, v25
Ltmp2822:
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 128 128] [$sp+0]
	;DEBUG_VALUE: B3 <- [DW_OP_plus_uconst 32, DW_OP_LLVM_fragment 128 128] [$sp+0]
	;DEBUG_VALUE: vec2d_add:a <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: vec2d_add:b <- [$sp+0]
	;DEBUG_VALUE: vec4d_add:z2 <- $q6
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v28, v2, v27[0]
Ltmp2823:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q28
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v19, v28
Ltmp2824:
	fmls.2d	v19, v2, v27[0]
Ltmp2825:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v30, v6, v27[0]
Ltmp2826:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q30
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v8, v30
Ltmp2827:
	fmls.2d	v8, v6, v27[0]
Ltmp2828:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	ldp	q6, q0, [sp, #80]               ; 32-byte Folded Reload
Ltmp2829:
	.loc	10 1723 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v13, v0, v21
Ltmp2830:
	;DEBUG_VALUE: vec4d_add:z1 <- $q13
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v14, v6, v5
Ltmp2831:
	;DEBUG_VALUE: vec4d_add:z2 <- $q14
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q14
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q14
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q13
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q13
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q11
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: vec2d_add:a <- $q31
	;DEBUG_VALUE: vec2d_add:b <- $q11
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v15, v31, v11
Ltmp2832:
	;DEBUG_VALUE: vec4d_add:z1 <- $q15
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v2, v0, v21
Ltmp2833:
	;DEBUG_VALUE: vec2d_add:a <- $q10
	;DEBUG_VALUE: vec2d_add:b <- $q12
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v23, v12, v10
Ltmp2834:
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q11
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v5, v6, v5
Ltmp2835:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q11
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q12
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: vec2d_sub:a <- $q11
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v6, v11, v31
Ltmp2836:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q12
	;DEBUG_VALUE: vec2d_sub:b <- $q10
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v25, v12, v10
Ltmp2837:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v21, v2, v17[0]
Ltmp2838:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v29, v21, v1[0]
Ltmp2839:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2840:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v31, v21
Ltmp2841:
	fmls.2d	v31, v2, v17[0]
Ltmp2842:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v21, v3, v29
Ltmp2843:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v0, v21, v31
Ltmp2844:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v2, v5, v17[0]
Ltmp2845:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v21, v2, v1[0]
Ltmp2846:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v21, v21
Ltmp2847:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v31, v2
Ltmp2848:
	fmls.2d	v31, v5, v17[0]
Ltmp2849:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v2, v3, v21
Ltmp2850:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v9, v2, v31
Ltmp2851:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q9
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v2, v4, v6
Ltmp2852:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v5, v2, v1[0]
Ltmp2853:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v5, v5
Ltmp2854:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v21, v2
Ltmp2855:
	fmls.2d	v21, v4, v6
Ltmp2856:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v2, v3, v5
Ltmp2857:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v21, v2, v21
Ltmp2858:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod:a <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v2, v4, v25
Ltmp2859:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v5, v2, v1[0]
Ltmp2860:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	10 1765 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v5, v5
Ltmp2861:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v6, v2
Ltmp2862:
	fmls.2d	v6, v4, v25
Ltmp2863:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v2, v3, v5
Ltmp2864:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v6, v2, v6
Ltmp2865:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q21
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v2, v15, v13
Ltmp2866:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q14
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v4, v23, v14
Ltmp2867:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v25, v2, v27[0]
Ltmp2868:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	mov.16b	v31, v25
Ltmp2869:
	fmls.2d	v31, v2, v27[0]
Ltmp2870:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v10, v4, v27[0]
Ltmp2871:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q10
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	mov.16b	v11, v10
Ltmp2872:
	fmls.2d	v11, v4, v27[0]
Ltmp2873:
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q0
	;DEBUG_VALUE: vec2d_mulmod:l <- $q11
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v5, v0, v21
Ltmp2874:
	;DEBUG_VALUE: vec4d_add:z1 <- $q5
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	mov.16b	v17, v0
Ltmp2875:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v2, v5, v27[0]
Ltmp2876:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v4, v2
Ltmp2877:
	fmls.2d	v4, v5, v27[0]
Ltmp2878:
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod:l <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v0, v9, v6
Ltmp2879:
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_add:z2 <- $q0
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v12, v0, v27[0]
Ltmp2880:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q12
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	mov.16b	v5, v12
Ltmp2881:
	fmls.2d	v5, v0, v27[0]
Ltmp2882:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	ldr	q0, [sp, #48]                   ; 16-byte Folded Reload
Ltmp2883:
	;DEBUG_VALUE: B3 <- [DW_OP_LLVM_fragment 0 128] $q0
	ldp	q29, q27, [sp, #16]             ; 32-byte Folded Reload
Ltmp2884:
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 0 128] $q27
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v0, v0, v29
Ltmp2885:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q0
	;DEBUG_VALUE: B3 <- [DW_OP_LLVM_fragment 128 128] $q27
	.loc	10 0 12 is_stmt 0               ; .deps/flint/src/machine_vectors.h:0:12
	ldr	q29, [sp]                       ; 16-byte Folded Reload
Ltmp2886:
	;DEBUG_VALUE: B2 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v27, v27, v29
Ltmp2887:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q27
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q0
	;DEBUG_VALUE: vec2d_mul:a <- $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v29, v0, v1[0]
Ltmp2888:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v29, v29
Ltmp2889:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q0
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v0, v3, v29
Ltmp2890:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q27
	;DEBUG_VALUE: vec2d_mul:a <- $q27
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v29, v27, v1[0]
Ltmp2891:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v29, v29
Ltmp2892:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v27, v3, v29
Ltmp2893:
	;DEBUG_VALUE: A2 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: A2 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q27
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v29, v16, v1[0]
Ltmp2894:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:l <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2895:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v16, v3, v29
Ltmp2896:
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v29, v22, v1[0]
Ltmp2897:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2898:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v22, v3, v29
Ltmp2899:
	;DEBUG_VALUE: vec2d_mul:a <- $q28
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v29, v28, v1[0]
Ltmp2900:
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2901:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v28, v3, v29
Ltmp2902:
	;DEBUG_VALUE: vec2d_mul:a <- $q30
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v29, v30, v1[0]
Ltmp2903:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2904:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v30, v3, v29
Ltmp2905:
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q13
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q14
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q15
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_add:a <- $q13
	;DEBUG_VALUE: vec2d_add:b <- $q15
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v29, v13, v15
Ltmp2906:
	;DEBUG_VALUE: vec4d_add:z1 <- $q29
	;DEBUG_VALUE: vec2d_add:a <- $q14
	;DEBUG_VALUE: vec2d_add:b <- $q23
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v23, v14, v23
Ltmp2907:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q29
	.loc	10 1733 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v13, v29, v1[0]
Ltmp2908:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2909:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v29, v3, v13
Ltmp2910:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q29
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v13, v23, v1[0]
Ltmp2911:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2912:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v23, v3, v13
Ltmp2913:
	;DEBUG_VALUE: A1 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: A1 <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: A3 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: A3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q23
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_mulmod:n <- $q3
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v13, v25, v1[0]
Ltmp2914:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2915:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v25, v3, v13
Ltmp2916:
	;DEBUG_VALUE: vec2d_mul:a <- $q10
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmul.2d	v13, v10, v1[0]
Ltmp2917:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2918:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fmls.2d	v10, v3, v13
Ltmp2919:
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v13, v2, v1[0]
Ltmp2920:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v13, v13
Ltmp2921:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v2, v3, v13
Ltmp2922:
	;DEBUG_VALUE: vec2d_mul:a <- $q12
	.loc	10 1733 12                      ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmul.2d	v1, v12, v1[0]
Ltmp2923:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	10 1765 12                      ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	frintn.2d	v1, v1
Ltmp2924:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q12
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q12
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	10 1746 12                      ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fmls.2d	v12, v3, v1
Ltmp2925:
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q18
	.loc	10 1723 12                      ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v1, v20, v18
Ltmp2926:
	;DEBUG_VALUE: vec4d_add:z1 <- $q1
	;DEBUG_VALUE: vec2d_add:a <- $q26
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	10 1723 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fadd.2d	v3, v26, v7
Ltmp2927:
	;DEBUG_VALUE: A0 <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: A0 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:z2 <- $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	.loc	10 1586 5 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:596:5 ] ]
	stp	q1, q3, [x1]
Ltmp2928:
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec2d_store:a <- $q29
	;DEBUG_VALUE: __s1 <- $q29
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	10 1586 5 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:597:5 ] ]
	stp	q29, q23, [x1, #32]
Ltmp2929:
	;DEBUG_VALUE: vec2d_store:a <- $q23
	;DEBUG_VALUE: __s1 <- $q23
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	.loc	10 0 5                          ; .deps/flint/src/machine_vectors.h:0:5
	ldr	q1, [sp, #64]                   ; 16-byte Folded Reload
Ltmp2930:
	;DEBUG_VALUE: vec2d_sub:b <- $q1
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v1, v16, v1
Ltmp2931:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q1
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q1
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	.loc	10 1728 12 is_stmt 0            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v3, v22, v24
Ltmp2932:
	;DEBUG_VALUE: A4 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: A4 <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec2d_sub:a <- $q28
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_add:a <- undef
	;DEBUG_VALUE: vec2d_add:b <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v7, v28, v19
Ltmp2933:
	;DEBUG_VALUE: vec2d_sub:a <- $q30
	;DEBUG_VALUE: vec2d_sub:b <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v16, v30, v8
Ltmp2934:
	;DEBUG_VALUE: A6 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: A6 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_add:a <- undef
	;DEBUG_VALUE: vec2d_add:b <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v18, v21, v17
Ltmp2935:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q9
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ]
	fsub.2d	v6, v6, v9
Ltmp2936:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	;DEBUG_VALUE: vec4d_sub:z2 <- $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fsub.2d	v17, v25, v31
Ltmp2937:
	;DEBUG_VALUE: vec2d_sub:a <- $q10
	;DEBUG_VALUE: vec2d_sub:b <- $q11
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ]
	fsub.2d	v19, v10, v11
Ltmp2938:
	;DEBUG_VALUE: A5 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: A5 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q19
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	.loc	10 1728 12                      ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v2, v2, v4
Ltmp2939:
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	.loc	10 1586 5 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:598:5 ] ]
	stp	q0, q27, [x1, #64]
Ltmp2940:
	;DEBUG_VALUE: vec2d_store:a <- $q27
	;DEBUG_VALUE: __s1 <- $q27
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_store:a <- $q18
	;DEBUG_VALUE: __s1 <- $q18
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	10 1586 5 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:599:5 ] ]
	stp	q18, q6, [x1, #96]
Ltmp2941:
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_store:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:600:5 ] ]
	stp	q1, q3, [x1, #128]
Ltmp2942:
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_store:a <- $q17
	;DEBUG_VALUE: __s1 <- $q17
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:601:5 ] ]
	stp	q17, q19, [x1, #160]
Ltmp2943:
	;DEBUG_VALUE: vec2d_store:a <- $q19
	;DEBUG_VALUE: __s1 <- $q19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_store:a <- $q7
	;DEBUG_VALUE: __s1 <- $q7
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:602:5 ] ]
	stp	q7, q16, [x1, #192]
Ltmp2944:
	;DEBUG_VALUE: vec2d_store:a <- $q16
	;DEBUG_VALUE: __s1 <- $q16
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q12
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	10 1728 12 is_stmt 1            ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/delayed-reduction-screen/delayed.c:594:5 ] ] ] ]
	fsub.2d	v0, v12, v5
Ltmp2945:
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_ifft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: A7 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: A7 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	.loc	10 1586 5                       ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/delayed-reduction-screen/delayed.c:603:5 ] ]
	stp	q2, q0, [x1, #224]
Ltmp2946:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x1
	.loc	5 604 1 epilogue_begin          ; build/delayed-reduction-screen/delayed.c:604:1
	ldp	d9, d8, [sp, #160]              ; 16-byte Folded Reload
Ltmp2947:
	ldp	d11, d10, [sp, #144]            ; 16-byte Folded Reload
Ltmp2948:
	ldp	d13, d12, [sp, #128]            ; 16-byte Folded Reload
Ltmp2949:
	ldp	d15, d14, [sp, #112]            ; 16-byte Folded Reload
Ltmp2950:
	add	sp, sp, #176
	ret
Ltmp2951:
