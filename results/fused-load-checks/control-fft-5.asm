_sd_fft_basecase_5_0:                   ; @sd_fft_basecase_5_0
Lfunc_begin11:
	.loc	5 636 0 is_stmt 1               ; build/fused-load-screen/control-fft.c:636:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_fft_basecase_5_0:Q <- $x0
	;DEBUG_VALUE: sd_fft_basecase_5_0:X <- $x1
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_r <- $x2
	;DEBUG_VALUE: sd_fft_basecase_5_0:j_bits <- $x3
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	sub	sp, sp, #80
	stp	d15, d14, [sp, #16]             ; 16-byte Folded Spill
	stp	d13, d12, [sp, #32]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #48]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #64]               ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset b8, -8
	.cfi_offset b9, -16
	.cfi_offset b10, -24
	.cfi_offset b11, -32
	.cfi_offset b12, -40
	.cfi_offset b13, -48
	.cfi_offset b14, -56
	.cfi_offset b15, -64
Ltmp2707:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] undef
	.loc	5 650 24 prologue_end           ; build/fused-load-screen/control-fft.c:650:24
	lsl	x8, x3, #3
Ltmp2708:
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/control-fft.c:637:18 ] ]
	mov	x9, x0
	ld1r.2d	{ v0 }, [x9], x8
Ltmp2709:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_5_0:n <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: sd_fft_basecase_5_0:n <- [DW_OP_LLVM_fragment 128 128] $q0
	.loc	5 638 33                        ; build/fused-load-screen/control-fft.c:638:33
	ldr	d1, [x0, #8]
Ltmp2710:
	;DEBUG_VALUE: vec4d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec4d_load:a <- $x1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ninv <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:641:16 ] ]
	ldp	q23, q22, [x1]
Ltmp2711:
	;DEBUG_VALUE: __ret <- $q23
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q22
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	9 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:642:16 ] ]
	ldp	q21, q20, [x1, #32]
Ltmp2712:
	;DEBUG_VALUE: __ret <- $q21
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q20
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:643:16 ] ]
	ldp	q16, q17, [x1, #64]
Ltmp2713:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:644:16 ] ]
	ldp	q18, q19, [x1, #96]
Ltmp2714:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:645:16 ] ]
	ldp	q8, q31, [x1, #128]
Ltmp2715:
	;DEBUG_VALUE: __ret <- $q8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q31
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:646:16 ] ]
	ldp	q30, q29, [x1, #160]
Ltmp2716:
	;DEBUG_VALUE: __ret <- $q30
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q29
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:647:16 ] ]
	ldp	q28, q26, [x1, #192]
Ltmp2717:
	;DEBUG_VALUE: __ret <- $q28
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q26
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] $q28
	.loc	5 650 24 is_stmt 1              ; build/fused-load-screen/control-fft.c:650:24
	lsl	x8, x2, #3
	ldp	x10, x11, [x9, #56]
	ldr	d24, [x10, x8]
Ltmp2718:
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_set_d:a <- $d24
	;DEBUG_VALUE: vec2d_set_d:a <- $d24
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ build/fused-load-screen/control-fft.c:648:16 ] ]
	ldp	q27, q25, [x1, #224]
Ltmp2719:
	;DEBUG_VALUE: __ret <- $q27
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q25
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q25
	.loc	5 651 24                        ; build/fused-load-screen/control-fft.c:651:24
	add	x8, x11, x2, lsl #4
Ltmp2720:
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/control-fft.c:651:12 ] ]
	ld1r.2d	{ v7 }, [x8], #8
Ltmp2721:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q7
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 128 128] $q7
	.loc	5 652 24                        ; build/fused-load-screen/control-fft.c:652:24
	ldr	d6, [x8]
Ltmp2722:
	;DEBUG_VALUE: vec4d_set_d:a <- $d6
	;DEBUG_VALUE: vec2d_set_d:a <- $d6
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	5 653 24                        ; build/fused-load-screen/control-fft.c:653:24
	ldr	x8, [x9, #72]
	add	x8, x8, x2, lsl #5
Ltmp2723:
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ build/fused-load-screen/control-fft.c:653:12 ] ]
	mov	x10, x8
	ld1r.2d	{ v5 }, [x10], #8
Ltmp2724:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q5
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_fft_basecase_5_0:www0 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: sd_fft_basecase_5_0:www0 <- [DW_OP_LLVM_fragment 128 128] $q5
	.loc	5 654 24                        ; build/fused-load-screen/control-fft.c:654:24
	ldr	d4, [x10]
Ltmp2725:
	;DEBUG_VALUE: vec4d_set_d:a <- $d4
	;DEBUG_VALUE: vec2d_set_d:a <- $d4
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:www1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:www1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	5 655 24                        ; build/fused-load-screen/control-fft.c:655:24
	ldp	d3, d2, [x8, #16]
Ltmp2726:
	;DEBUG_VALUE: vec4d_set_d:a <- $d3
	;DEBUG_VALUE: vec2d_set_d:a <- $d3
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:www2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:www2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_set_d:a <- $d2
	;DEBUG_VALUE: vec2d_set_d:a <- $d2
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:www3 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:www3 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: X4 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: X4 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: X5 <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: X5 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: X6 <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: X6 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: X7 <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: X7 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q23
	.loc	5 0 24 is_stmt 0                ; build/fused-load-screen/control-fft.c:0:24
	str	q2, [sp]                        ; 16-byte Folded Spill
Ltmp2727:
	;DEBUG_VALUE: vec4d_set_d:a <- [$sp+0]
	;DEBUG_VALUE: vec2d_set_d:a <- [$sp+0]
	.loc	5 663 30 is_stmt 1              ; build/fused-load-screen/control-fft.c:663:30
	ldp	x8, x9, [x9, #80]
	.loc	5 664 30                        ; build/fused-load-screen/control-fft.c:664:30
	add	x10, x9, x2, lsl #7
	.loc	5 665 30                        ; build/fused-load-screen/control-fft.c:665:30
	add	x11, x10, #32
Ltmp2728:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x11
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x11
	.loc	9 1581 12                       ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:665:10 ] ]
	ld2.2d	{ v9, v10 }, [x11]
Ltmp2729:
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 128 128] $q10
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
	;DEBUG_VALUE: sd_fft_basecase_5_0:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_unpacklo:b <- undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_unpacklo:a <- undef
	.loc	5 663 30                        ; build/fused-load-screen/control-fft.c:663:30
	add	x11, x8, x2, lsl #6
Ltmp2730:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x11
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x11
	.loc	9 1581 12                       ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:663:10 ] ]
	ldp	q12, q11, [x11]
Ltmp2731:
	;DEBUG_VALUE: __ret <- $q12
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x11
	;DEBUG_VALUE: sd_fft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] $q12
	;DEBUG_VALUE: sd_fft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: __ret <- $q11
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v13, v23, v1[0]
Ltmp2732:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2733:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v23, v0, v13
Ltmp2734:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q23
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v13, v22, v1[0]
Ltmp2735:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2736:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v22, v0, v13
Ltmp2737:
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v13, v21, v1[0]
Ltmp2738:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2739:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v21, v0, v13
Ltmp2740:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v13, v20, v1[0]
Ltmp2741:
	;DEBUG_VALUE: vec2d_round:a <- $q13
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v13, v13
Ltmp2742:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v20, v0, v13
Ltmp2743:
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q8
	;DEBUG_VALUE: vec2d_mulmod:a <- $q8
	;DEBUG_VALUE: vec2d_mul:a <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v13, v8, v24[0]
Ltmp2744:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q13
	;DEBUG_VALUE: vec2d_mul:a <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v14, v13, v1[0]
Ltmp2745:
	;DEBUG_VALUE: vec2d_round:a <- $q14
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v14, v14
Ltmp2746:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q8
	;DEBUG_VALUE: vec2d_mulmod:q <- $q14
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v15, v13
	fmls.2d	v15, v8, v24[0]
Ltmp2747:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v13, v0, v14
Ltmp2748:
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	;DEBUG_VALUE: vec2d_sub:a <- $q13
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v8, v13, v15
Ltmp2749:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q8
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod:a <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v13, v31, v24[0]
Ltmp2750:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q13
	;DEBUG_VALUE: vec2d_mul:a <- $q13
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v14, v13, v1[0]
Ltmp2751:
	;DEBUG_VALUE: vec2d_round:a <- $q14
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v14, v14
Ltmp2752:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v15, v13
Ltmp2753:
	fmls.2d	v15, v31, v24[0]
Ltmp2754:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v13, v0, v14
Ltmp2755:
	;DEBUG_VALUE: vec2d_sub:a <- $q13
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v31, v13, v15
Ltmp2756:
	;DEBUG_VALUE: X4 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: X4 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q30
	;DEBUG_VALUE: vec2d_mulmod:a <- $q30
	;DEBUG_VALUE: vec2d_mul:a <- $q30
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v13, v30, v24[0]
Ltmp2757:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q13
	;DEBUG_VALUE: vec2d_mul:a <- $q13
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v14, v13, v1[0]
Ltmp2758:
	;DEBUG_VALUE: vec2d_round:a <- $q14
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v14, v14
Ltmp2759:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q30
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v15, v13
Ltmp2760:
	fmls.2d	v15, v30, v24[0]
Ltmp2761:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v13, v0, v14
Ltmp2762:
	;DEBUG_VALUE: vec2d_sub:a <- $q13
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v30, v13, v15
Ltmp2763:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q29
	;DEBUG_VALUE: vec2d_mulmod:a <- $q29
	;DEBUG_VALUE: vec2d_mul:a <- $q29
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v13, v29, v24[0]
Ltmp2764:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q13
	;DEBUG_VALUE: vec2d_mul:a <- $q13
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v14, v13, v1[0]
Ltmp2765:
	;DEBUG_VALUE: vec2d_round:a <- $q14
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v14, v14
Ltmp2766:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v15, v13
Ltmp2767:
	fmls.2d	v15, v29, v24[0]
Ltmp2768:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v13, v0, v14
Ltmp2769:
	;DEBUG_VALUE: vec2d_sub:a <- $q13
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v13, v13, v15
Ltmp2770:
	;DEBUG_VALUE: X5 <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: X5 <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q13
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q28
	;DEBUG_VALUE: vec2d_mulmod:a <- $q28
	;DEBUG_VALUE: vec2d_mul:a <- $q28
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v29, v28, v24[0]
Ltmp2771:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q29
	;DEBUG_VALUE: vec2d_mul:a <- $q29
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v14, v29, v1[0]
Ltmp2772:
	;DEBUG_VALUE: vec2d_round:a <- $q14
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v14, v14
Ltmp2773:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v15, v29
Ltmp2774:
	fmls.2d	v15, v28, v24[0]
Ltmp2775:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v29, v0, v14
Ltmp2776:
	;DEBUG_VALUE: vec2d_sub:a <- $q29
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v14, v29, v15
Ltmp2777:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q14
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod:a <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v28, v26, v24[0]
Ltmp2778:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q28
	;DEBUG_VALUE: vec2d_mul:a <- $q28
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v29, v28, v1[0]
Ltmp2779:
	;DEBUG_VALUE: vec2d_round:a <- $q29
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v29, v29
Ltmp2780:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v15, v28
Ltmp2781:
	fmls.2d	v15, v26, v24[0]
Ltmp2782:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v28, v0, v29
Ltmp2783:
	;DEBUG_VALUE: vec2d_sub:a <- $q28
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v15, v28, v15
Ltmp2784:
	;DEBUG_VALUE: X6 <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: X6 <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q15
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q27
	;DEBUG_VALUE: vec2d_mulmod:a <- $q27
	;DEBUG_VALUE: vec2d_mul:a <- $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v27, v24[0]
Ltmp2785:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v28, v26, v1[0]
Ltmp2786:
	;DEBUG_VALUE: vec2d_round:a <- $q28
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v28, v28
Ltmp2787:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v29, v26
Ltmp2788:
	fmls.2d	v29, v27, v24[0]
Ltmp2789:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v26, v0, v28
Ltmp2790:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v2, v26, v29
Ltmp2791:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod:a <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v25, v24[0]
Ltmp2792:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v27, v26, v1[0]
Ltmp2793:
	;DEBUG_VALUE: vec2d_round:a <- $q27
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v27, v27
Ltmp2794:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v28, v26
Ltmp2795:
	fmls.2d	v28, v25, v24[0]
Ltmp2796:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v26, v0, v27
Ltmp2797:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v24, v26, v28
Ltmp2798:
	;DEBUG_VALUE: X7 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: X7 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q8
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v26, v23, v8
Ltmp2799:
	;DEBUG_VALUE: vec4d_add:z1 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q22
	;DEBUG_VALUE: vec2d_add:b <- $q31
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v27, v22, v31
Ltmp2800:
	;DEBUG_VALUE: vec4d_add:z2 <- $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q30
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v28, v21, v30
Ltmp2801:
	;DEBUG_VALUE: vec4d_add:z1 <- $q28
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q13
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v29, v20, v13
Ltmp2802:
	;DEBUG_VALUE: vec4d_add:z2 <- $q29
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q28
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v23, v23, v8
Ltmp2803:
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec2d_add:b <- $q14
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:z1 <- $q23
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v8, v16, v14
Ltmp2804:
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	;DEBUG_VALUE: vec4d_add:z1 <- $q8
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v22, v22, v31
Ltmp2805:
	;DEBUG_VALUE: vec2d_add:b <- $q15
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Y4 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: Y4 <- [DW_OP_LLVM_fragment 0 128] $q23
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v31, v17, v15
Ltmp2806:
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	;DEBUG_VALUE: vec4d_add:z2 <- $q31
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q8
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v30, v21, v30
Ltmp2807:
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_sub:z1 <- $q30
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v21, v18, v2
Ltmp2808:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q13
	;DEBUG_VALUE: vec4d_add:z1 <- $q21
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v25, v20, v13
Ltmp2809:
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec2d_add:a <- $q19
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: Y5 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: Y5 <- [DW_OP_LLVM_fragment 0 128] $q30
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v20, v19, v24
Ltmp2810:
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec2d_sub:b <- $q14
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v16, v16, v14
Ltmp2811:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q15
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v17, v17, v15
Ltmp2812:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q17
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Y6 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Y6 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q19
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v2, v18, v2
Ltmp2813:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v18, v19, v24
Ltmp2814:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: Y7 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Y7 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q8
	;DEBUG_VALUE: vec2d_mulmod:a <- $q8
	;DEBUG_VALUE: vec2d_mul:a <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v19, v7, v8
Ltmp2815:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v24, v19, v1[0]
Ltmp2816:
	;DEBUG_VALUE: vec2d_round:a <- $q24
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v24, v24
Ltmp2817:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v13, v19
Ltmp2818:
	fmls.2d	v13, v7, v8
Ltmp2819:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v19, v0, v24
Ltmp2820:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q13
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v19, v19, v13
Ltmp2821:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod:a <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v24, v7, v31
Ltmp2822:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q24
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v8, v24, v1[0]
Ltmp2823:
	;DEBUG_VALUE: vec2d_round:a <- $q8
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v8, v8
Ltmp2824:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v13, v24
Ltmp2825:
	fmls.2d	v13, v7, v31
Ltmp2826:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v24, v0, v8
Ltmp2827:
	;DEBUG_VALUE: vec2d_sub:a <- $q24
	;DEBUG_VALUE: vec2d_sub:b <- $q13
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v24, v24, v13
Ltmp2828:
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v31, v7, v21
Ltmp2829:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v8, v31, v1[0]
Ltmp2830:
	;DEBUG_VALUE: vec2d_round:a <- $q8
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v8, v8
Ltmp2831:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v13, v31
Ltmp2832:
	fmls.2d	v13, v7, v21
Ltmp2833:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v31, v0, v8
Ltmp2834:
	;DEBUG_VALUE: vec2d_sub:a <- $q31
	;DEBUG_VALUE: vec2d_sub:b <- $q13
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v21, v31, v13
Ltmp2835:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v31, v7, v20
Ltmp2836:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v8, v31, v1[0]
Ltmp2837:
	;DEBUG_VALUE: vec2d_round:a <- $q8
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v8, v8
Ltmp2838:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v13, v31
Ltmp2839:
	fmls.2d	v13, v7, v20
Ltmp2840:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q13
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v31, v0, v8
Ltmp2841:
	;DEBUG_VALUE: vec2d_sub:a <- $q31
	;DEBUG_VALUE: vec2d_sub:b <- $q13
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v20, v31, v13
Ltmp2842:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v7, v16, v6[0]
Ltmp2843:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v31, v7, v1[0]
Ltmp2844:
	;DEBUG_VALUE: vec2d_round:a <- $q31
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v31, v31
Ltmp2845:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:q <- $q31
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v8, v7
Ltmp2846:
	fmls.2d	v8, v16, v6[0]
Ltmp2847:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_mulmod:l <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v7, v0, v31
Ltmp2848:
	;DEBUG_VALUE: vec2d_sub:b <- $q8
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v31, v7, v8
Ltmp2849:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q31
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v7, v17, v6[0]
Ltmp2850:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp2851:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2852:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v8, v7
Ltmp2853:
	fmls.2d	v8, v17, v6[0]
Ltmp2854:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q8
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2855:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q8
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v8, v7, v8
Ltmp2856:
	;DEBUG_VALUE: Y6 <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: Y6 <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q18
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
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v7, v2, v6[0]
Ltmp2857:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp2858:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2859:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v17, v7
Ltmp2860:
	fmls.2d	v17, v2, v6[0]
Ltmp2861:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2862:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v2, v7, v17
Ltmp2863:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v7, v18, v6[0]
Ltmp2864:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp2865:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v16, v16
Ltmp2866:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v17, v7
Ltmp2867:
	fmls.2d	v17, v18, v6[0]
Ltmp2868:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp2869:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v13, v7, v17
Ltmp2870:
	;DEBUG_VALUE: Y7 <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: Y7 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q13
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_add:a <- $q26
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v6, v26, v19
Ltmp2871:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q27
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v7, v27, v24
Ltmp2872:
	;DEBUG_VALUE: vec4d_add:z2 <- $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_add:a <- $q28
	;DEBUG_VALUE: vec2d_add:b <- $q21
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v14, v28, v21
Ltmp2873:
	;DEBUG_VALUE: vec4d_add:z1 <- $q14
	;DEBUG_VALUE: vec2d_add:a <- $q29
	;DEBUG_VALUE: vec2d_add:b <- $q20
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v15, v29, v20
Ltmp2874:
	;DEBUG_VALUE: vec4d_add:z2 <- $q15
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v16, v26, v19
Ltmp2875:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v17, v27, v24
Ltmp2876:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q17
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q28
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v26, v28, v21
Ltmp2877:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q26
	;DEBUG_VALUE: vec2d_sub:a <- $q29
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v27, v29, v20
Ltmp2878:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q27
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: vec2d_add:a <- $q23
	;DEBUG_VALUE: vec2d_add:b <- $q31
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v18, v23, v31
Ltmp2879:
	;DEBUG_VALUE: vec4d_add:z1 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q22
	;DEBUG_VALUE: vec2d_add:b <- $q8
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v19, v22, v8
Ltmp2880:
	;DEBUG_VALUE: vec4d_add:z2 <- $q19
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: Z4 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: Z4 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec2d_add:a <- $q30
	;DEBUG_VALUE: vec2d_add:b <- $q2
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v28, v30, v2
Ltmp2881:
	;DEBUG_VALUE: vec4d_add:z1 <- $q28
	;DEBUG_VALUE: vec2d_add:a <- $q25
	;DEBUG_VALUE: vec2d_add:b <- $q13
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v29, v25, v13
Ltmp2882:
	;DEBUG_VALUE: vec4d_add:z2 <- $q29
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: Z5 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: Z5 <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	;DEBUG_VALUE: vec2d_sub:b <- $q31
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v20, v23, v31
Ltmp2883:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q8
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v21, v22, v8
Ltmp2884:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Z6 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: Z6 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q30
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q13
	;DEBUG_VALUE: vec2d_sub:a <- $q30
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v23, v30, v2
Ltmp2885:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q13
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v22, v25, v13
Ltmp2886:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Z7 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: Z7 <- [DW_OP_LLVM_fragment 0 128] $q23
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
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v2, v6, v1[0]
Ltmp2887:
	;DEBUG_VALUE: vec2d_round:a <- $q2
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v2, v2
Ltmp2888:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v6, v0, v2
Ltmp2889:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v2, v7, v1[0]
Ltmp2890:
	;DEBUG_VALUE: vec2d_round:a <- $q2
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v2, v2
Ltmp2891:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v7, v0, v2
Ltmp2892:
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: Z0 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q14
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q15
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q14
	;DEBUG_VALUE: vec2d_mulmod:a <- $q14
	;DEBUG_VALUE: vec2d_mul:a <- $q14
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:b <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v2, v5, v14
Ltmp2893:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v24, v2, v1[0]
Ltmp2894:
	;DEBUG_VALUE: vec2d_round:a <- $q24
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v24, v24
Ltmp2895:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q14
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v25, v2
Ltmp2896:
	fmls.2d	v25, v5, v14
Ltmp2897:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v2, v0, v24
Ltmp2898:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v24, v2, v25
Ltmp2899:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q24
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q15
	;DEBUG_VALUE: vec2d_mulmod:a <- $q15
	;DEBUG_VALUE: vec2d_mul:a <- $q15
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:b <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v2, v5, v15
Ltmp2900:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v25, v2, v1[0]
Ltmp2901:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp2902:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q15
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v30, v2
Ltmp2903:
	fmls.2d	v30, v5, v15
Ltmp2904:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v2, v0, v25
Ltmp2905:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v2, v2, v30
Ltmp2906:
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: Z1 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q24
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v5, v16, v1[0]
Ltmp2907:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v5, v5
Ltmp2908:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v16, v0, v5
Ltmp2909:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v5, v17, v1[0]
Ltmp2910:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v5, v5
Ltmp2911:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v17, v0, v5
Ltmp2912:
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: Z2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q17
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q27
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
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v5, v26, v4[0]
Ltmp2913:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v25, v5, v1[0]
Ltmp2914:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp2915:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v30, v5
Ltmp2916:
	fmls.2d	v30, v26, v4[0]
Ltmp2917:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v5, v0, v25
Ltmp2918:
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v5, v5, v30
Ltmp2919:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q27
	;DEBUG_VALUE: vec2d_mulmod:a <- $q27
	;DEBUG_VALUE: vec2d_mul:a <- $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v25, v27, v4[0]
Ltmp2920:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v25, v1[0]
Ltmp2921:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v26, v26
Ltmp2922:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v30, v25
Ltmp2923:
	fmls.2d	v30, v27, v4[0]
Ltmp2924:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v25, v0, v26
Ltmp2925:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q30
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v4, v25, v30
Ltmp2926:
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: Z3 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v25, v18, v1[0]
Ltmp2927:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v25, v25
Ltmp2928:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v18, v0, v25
Ltmp2929:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q18
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v25, v19, v1[0]
Ltmp2930:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v25, v25
Ltmp2931:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v19, v0, v25
Ltmp2932:
	;DEBUG_VALUE: Z4 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: Z4 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q28
	;DEBUG_VALUE: vec2d_mulmod:a <- $q28
	;DEBUG_VALUE: vec2d_mul:a <- $q28
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v25, v28, v3[0]
Ltmp2933:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v25, v1[0]
Ltmp2934:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v26, v26
Ltmp2935:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v27, v25
Ltmp2936:
	fmls.2d	v27, v28, v3[0]
Ltmp2937:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v25, v0, v26
Ltmp2938:
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v25, v25, v27
Ltmp2939:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q29
	;DEBUG_VALUE: vec2d_mulmod:a <- $q29
	;DEBUG_VALUE: vec2d_mul:a <- $q29
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v29, v3[0]
Ltmp2940:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v27, v26, v1[0]
Ltmp2941:
	;DEBUG_VALUE: vec2d_round:a <- $q27
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v27, v27
Ltmp2942:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v28, v26
Ltmp2943:
	fmls.2d	v28, v29, v3[0]
Ltmp2944:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v26, v0, v27
Ltmp2945:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v3, v26, v28
Ltmp2946:
	;DEBUG_VALUE: Z5 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Z5 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v26, v20, v1[0]
Ltmp2947:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v26, v26
Ltmp2948:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v20, v0, v26
Ltmp2949:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmul.2d	v26, v21, v1[0]
Ltmp2950:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	frintn.2d	v26, v26
Ltmp2951:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ]
	fmls.2d	v21, v0, v26
Ltmp2952:
	;DEBUG_VALUE: Z6 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Z6 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	.loc	9 0 12 is_stmt 0                ; .deps/flint/src/machine_vectors.h:0:12
	ldr	q29, [sp]                       ; 16-byte Folded Reload
Ltmp2953:
	;DEBUG_VALUE: vec4d_set_d:a <- $d29
	;DEBUG_VALUE: vec2d_set_d:a <- $d29
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q23
	;DEBUG_VALUE: vec2d_mulmod:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v23, v29[0]
Ltmp2954:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v27, v26, v1[0]
Ltmp2955:
	;DEBUG_VALUE: vec2d_round:a <- $q27
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v27, v27
Ltmp2956:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_mulmod:q <- $q27
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v28, v26
Ltmp2957:
	fmls.2d	v28, v23, v29[0]
Ltmp2958:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v26, v0, v27
Ltmp2959:
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v23, v26, v28
Ltmp2960:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v26, v22, v29[0]
Ltmp2961:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmul.2d	v27, v26, v1[0]
Ltmp2962:
	;DEBUG_VALUE: vec2d_round:a <- $q27
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	frintn.2d	v27, v27
Ltmp2963:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	mov.16b	v28, v26
Ltmp2964:
	fmls.2d	v28, v22, v29[0]
Ltmp2965:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fmls.2d	v26, v0, v27
Ltmp2966:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ] ] ]
	fsub.2d	v22, v26, v28
Ltmp2967:
	;DEBUG_VALUE: Z7 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Z7 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v26, v6, v24
Ltmp2968:
	;DEBUG_VALUE: vec4d_add:z1 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q2
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v27, v7, v2
Ltmp2969:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:z2 <- $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v6, v6, v24
Ltmp2970:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v2, v7, v2
Ltmp2971:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_sub:z2 <- $q2
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v7, v16, v5
Ltmp2972:
	;DEBUG_VALUE: vec4d_add:z1 <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q4
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v24, v17, v4
Ltmp2973:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:z2 <- $q24
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v5, v16, v5
Ltmp2974:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v4, v17, v4
Ltmp2975:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:z2 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q25
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v16, v18, v25
Ltmp2976:
	;DEBUG_VALUE: vec4d_add:z1 <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q19
	;DEBUG_VALUE: vec2d_add:b <- $q3
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v28, v19, v3
Ltmp2977:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_add:z2 <- $q28
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v18, v18, v25
Ltmp2978:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v25, v19, v3
Ltmp2979:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q23
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v29, v20, v23
Ltmp2980:
	;DEBUG_VALUE: vec4d_add:z1 <- $q29
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fadd.2d	v30, v21, v22
Ltmp2981:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_add:z2 <- $q30
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v23, v20, v23
Ltmp2982:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:657:5 ] ]
	fsub.2d	v21, v21, v22
Ltmp2983:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q26
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q6
	.loc	9 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip1.2d	v20, v26, v6
Ltmp2984:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q20
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q27
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q2
	.loc	9 1769 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip1.2d	v22, v27, v2
Ltmp2985:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q22
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q26
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q6
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q20
	.loc	9 1773 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip2.2d	v19, v26, v6
Ltmp2986:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q19
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q27
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q2
	.loc	9 1773 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip2.2d	v26, v27, v2
Ltmp2987:
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q26
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q7
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q5
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q19
	.loc	9 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip1.2d	v27, v7, v5
Ltmp2988:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q27
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q24
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q4
	.loc	9 1769 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip1.2d	v31, v24, v4
Ltmp2989:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q31
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q7
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q5
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q27
	.loc	9 1773 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip2.2d	v8, v7, v5
Ltmp2990:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q8
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q24
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q4
	.loc	9 1773 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:659:5 ] ]
	zip2.2d	v24, v24, v4
Ltmp2991:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q24
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q16
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q18
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 0 128] $q8
	.loc	9 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip1.2d	v3, v16, v18
Ltmp2992:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q3
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q28
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q25
	.loc	9 1769 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip1.2d	v17, v28, v25
Ltmp2993:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q17
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q16
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q18
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: _t0 <- [DW_OP_LLVM_fragment 0 128] $q3
	.loc	9 1773 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip2.2d	v2, v16, v18
Ltmp2994:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q2
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q28
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q25
	.loc	9 1773 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip2.2d	v7, v28, v25
Ltmp2995:
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q7
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_unpacklo:a <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_unpacklo:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q29
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q23
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: _t1 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	9 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip1.2d	v5, v29, v23
Ltmp2996:
	;DEBUG_VALUE: vec4d_unpacklo:z1 <- $q5
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q30
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q21
	.loc	9 1769 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1987:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip1.2d	v16, v30, v21
Ltmp2997:
	;DEBUG_VALUE: vec4d_unpacklo:z2 <- $q16
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_unpackhi:a <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_unpackhi:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q29
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q23
	;DEBUG_VALUE: vec4d_unpacklo:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: _t2 <- [DW_OP_LLVM_fragment 0 128] $q5
	.loc	9 1773 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip2.2d	v4, v29, v23
Ltmp2998:
	;DEBUG_VALUE: vec4d_unpackhi:z1 <- $q4
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q30
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q21
	.loc	9 1773 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1988:1 @[ build/fused-load-screen/control-fft.c:660:5 ] ]
	zip2.2d	v6, v30, v21
Ltmp2999:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x10
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x10
	;DEBUG_VALUE: vec4d_unpackhi:z2 <- $q6
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_unpackhi:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: _t3 <- [DW_OP_LLVM_fragment 0 128] $q4
	.loc	9 1581 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:664:10 ] ]
	ldp	q18, q21, [x10]
Ltmp3000:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x10
	;DEBUG_VALUE: __ret <- $q21
	;DEBUG_VALUE: sd_fft_basecase_5_0:u <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: sd_fft_basecase_5_0:u <- [DW_OP_LLVM_fragment 0 128] $q18
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1943:29 @[ build/fused-load-screen/control-fft.c:666:11 ] ]
	zip1.2d	v23, v18, v21
Ltmp3001:
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q21
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q18
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1948:29 @[ build/fused-load-screen/control-fft.c:667:11 ] ]
	zip2.2d	v18, v18, v21
Ltmp3002:
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q8
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ]
	fmul.2d	v21, v20, v1[0]
Ltmp3003:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ]
	frintn.2d	v21, v21
Ltmp3004:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ]
	fmls.2d	v20, v0, v21
Ltmp3005:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q27
	;DEBUG_VALUE: vec2d_mul:a <- $q27
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ]
	fmul.2d	v21, v27, v1[0]
Ltmp3006:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ]
	frintn.2d	v21, v21
Ltmp3007:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ]
	fmls.2d	v27, v0, v21
Ltmp3008:
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q27
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q12
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q12
	;DEBUG_VALUE: vec2d_mulmod:b <- $q12
	;DEBUG_VALUE: vec2d_mul:b <- $q12
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v21, v12, v22
Ltmp3009:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v25, v21, v1[0]
Ltmp3010:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp3011:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q12
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v28, v21
Ltmp3012:
	fmls.2d	v28, v12, v22
Ltmp3013:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v21, v0, v25
Ltmp3014:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v21, v21, v28
Ltmp3015:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod:a <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q11
	;DEBUG_VALUE: vec2d_mulmod:b <- $q11
	;DEBUG_VALUE: vec2d_mul:b <- $q11
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v22, v11, v31
Ltmp3016:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v25, v22, v1[0]
Ltmp3017:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp3018:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q11
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v28, v22
Ltmp3019:
	fmls.2d	v28, v11, v31
Ltmp3020:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v22, v0, v25
Ltmp3021:
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q28
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v22, v22, v28
Ltmp3022:
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q26
	;DEBUG_VALUE: vec2d_mulmod:a <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q11
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q12
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q12
	;DEBUG_VALUE: vec2d_mulmod:b <- $q12
	;DEBUG_VALUE: vec2d_mul:b <- $q12
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v25, v12, v26
Ltmp3023:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v28, v25, v1[0]
Ltmp3024:
	;DEBUG_VALUE: vec2d_round:a <- $q28
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v28, v28
Ltmp3025:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q12
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v29, v25
Ltmp3026:
	fmls.2d	v29, v12, v26
Ltmp3027:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v25, v0, v28
Ltmp3028:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v25, v25, v29
Ltmp3029:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q25
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q24
	;DEBUG_VALUE: vec2d_mulmod:a <- $q24
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q11
	;DEBUG_VALUE: vec2d_mulmod:b <- $q11
	;DEBUG_VALUE: vec2d_mul:b <- $q11
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v26, v11, v24
Ltmp3030:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q26
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v28, v26, v1[0]
Ltmp3031:
	;DEBUG_VALUE: vec2d_round:a <- $q28
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v28, v28
Ltmp3032:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q11
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v29, v26
Ltmp3033:
	fmls.2d	v29, v11, v24
Ltmp3034:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q28
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v26, v0, v28
Ltmp3035:
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v24, v26, v29
Ltmp3036:
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q21
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v26, v20, v21
Ltmp3037:
	;DEBUG_VALUE: vec4d_add:z1 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q27
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v28, v27, v22
Ltmp3038:
	;DEBUG_VALUE: vec4d_add:z2 <- $q28
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q25
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_add:a <- $q19
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q8
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v29, v19, v25
Ltmp3039:
	;DEBUG_VALUE: vec4d_add:z1 <- $q29
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec2d_add:a <- $q8
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v30, v8, v24
Ltmp3040:
	;DEBUG_VALUE: vec4d_add:z2 <- $q30
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v20, v20, v21
Ltmp3041:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v21, v27, v22
Ltmp3042:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q8
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v19, v19, v25
Ltmp3043:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q19
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v22, v8, v24
Ltmp3044:
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_sub:z2 <- $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q29
	;DEBUG_VALUE: vec2d_mulmod:a <- $q29
	;DEBUG_VALUE: vec2d_mul:a <- $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q23
	;DEBUG_VALUE: vec2d_mulmod:b <- $q23
	;DEBUG_VALUE: vec2d_mul:b <- $q23
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v24, v23, v29
Ltmp3045:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q24
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v25, v24, v1[0]
Ltmp3046:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp3047:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q23
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v27, v24
Ltmp3048:
	fmls.2d	v27, v23, v29
Ltmp3049:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v24, v0, v25
Ltmp3050:
	;DEBUG_VALUE: vec2d_sub:a <- $q24
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v24, v24, v27
Ltmp3051:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod:b <- $q9
	;DEBUG_VALUE: vec2d_mul:b <- $q9
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q24
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q30
	;DEBUG_VALUE: vec2d_mulmod:a <- $q30
	;DEBUG_VALUE: vec2d_mul:a <- $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v23, v9, v30
Ltmp3052:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v25, v23, v1[0]
Ltmp3053:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v25, v25
Ltmp3054:
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q9
	;DEBUG_VALUE: vec2d_mulmod:q <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q30
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v27, v23
Ltmp3055:
	fmls.2d	v27, v9, v30
Ltmp3056:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v23, v0, v25
Ltmp3057:
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v25, v23, v27
Ltmp3058:
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q10
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q18
	;DEBUG_VALUE: vec2d_mulmod:b <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- $q18
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v23, v18, v19
Ltmp3059:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v27, v23, v1[0]
Ltmp3060:
	;DEBUG_VALUE: vec2d_round:a <- $q27
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v27, v27
Ltmp3061:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q18
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v29, v23
Ltmp3062:
	fmls.2d	v29, v18, v19
Ltmp3063:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v23, v0, v27
Ltmp3064:
	;DEBUG_VALUE: vec2d_sub:a <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v27, v23, v29
Ltmp3065:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q10
	;DEBUG_VALUE: vec2d_mulmod:b <- $q10
	;DEBUG_VALUE: vec2d_mul:b <- $q10
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q27
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v18, v10, v22
Ltmp3066:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp3067:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	frintn.2d	v19, v19
Ltmp3068:
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q10
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	mov.16b	v23, v18
Ltmp3069:
	fmls.2d	v23, v10, v22
Ltmp3070:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fmls.2d	v18, v0, v19
Ltmp3071:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ] ] ]
	fsub.2d	v29, v18, v23
Ltmp3072:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_add:a <- $q26
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v22, v26, v24
Ltmp3073:
	;DEBUG_VALUE: vec4d_add:z1 <- $q22
	;DEBUG_VALUE: vec2d_add:a <- $q28
	;DEBUG_VALUE: vec2d_add:b <- $q25
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v23, v28, v25
Ltmp3074:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: sd_fft_basecase_5_0:x0 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_add:z2 <- $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q23
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q28
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_sub:a <- $q26
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v24, v26, v24
Ltmp3075:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q28
	;DEBUG_VALUE: vec2d_sub:b <- $q25
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v25, v28, v25
Ltmp3076:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: sd_fft_basecase_5_0:x1 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_sub:z2 <- $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q27
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v18, v20, v27
Ltmp3077:
	;DEBUG_VALUE: vec4d_add:z1 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q29
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fadd.2d	v19, v21, v29
Ltmp3078:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: sd_fft_basecase_5_0:x2 <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_add:z2 <- $q19
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q27
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q29
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v20, v20, v27
Ltmp3079:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q29
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:668:5 ] ]
	fsub.2d	v21, v21, v29
Ltmp3080:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_sub:z2 <- $q21
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q21
	.loc	9 0 12                          ; .deps/flint/src/machine_vectors.h:0:12
	mov	w10, #4                         ; =0x4
Ltmp3081:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x3 <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q20
	.loc	5 671 61 is_stmt 1              ; build/fused-load-screen/control-fft.c:671:61
	bfi	x10, x2, #3, #61
	.loc	5 671 30 is_stmt 0              ; build/fused-load-screen/control-fft.c:671:30
	add	x8, x8, x10, lsl #3
Ltmp3082:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x8
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x8
	.loc	9 1581 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:671:10 ] ]
	ldp	q29, q30, [x8]
Ltmp3083:
	;DEBUG_VALUE: __ret <- $q29
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x8
	;DEBUG_VALUE: sd_fft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: sd_fft_basecase_5_0:w0 <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: __ret <- $q30
	.loc	5 672 30                        ; build/fused-load-screen/control-fft.c:672:30
	add	x8, x9, x10, lsl #4
Ltmp3084:
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x8
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x8
	.loc	9 1581 12                       ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:672:10 ] ]
	ldp	q28, q31, [x8], #32
Ltmp3085:
	;DEBUG_VALUE: __ret <- $q28
	;DEBUG_VALUE: vec2d_load_aligned:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x8
	;DEBUG_VALUE: sd_fft_basecase_5_0:u <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: sd_fft_basecase_5_0:u <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: __ret <- $q31
	;DEBUG_VALUE: vec4d_load_aligned:a <- $x8
	;DEBUG_VALUE: vec2d_load_aligned:a <- $x8
	.loc	9 1581 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1581:12 @[ .deps/flint/src/machine_vectors.h:1907:29 @[ build/fused-load-screen/control-fft.c:673:10 ] ]
	ld2.2d	{ v26, v27 }, [x8]
Ltmp3086:
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: sd_fft_basecase_5_0:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: sd_fft_basecase_5_0:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_unpackhi:a <- undef
	;DEBUG_VALUE: vec2d_unpackhi:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_unpacklo:a <- undef
	;DEBUG_VALUE: vec2d_unpacklo:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: __ret <- undef
	;DEBUG_VALUE: vec2d_load_aligned:a <- undef
	;DEBUG_VALUE: __ret <- undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q31
	;DEBUG_VALUE: vec4d_unpack_lo_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q28
	.loc	9 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/flint/src/machine_vectors.h:1943:29 @[ build/fused-load-screen/control-fft.c:674:11 ] ]
	zip1.2d	v8, v28, v31
Ltmp3087:
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww0 <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:v <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 128 128] $q31
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q31
	;DEBUG_VALUE: vec4d_unpack_hi_permute_0_2_1_3:u <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q28
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/flint/src/machine_vectors.h:1948:29 @[ build/fused-load-screen/control-fft.c:675:11 ] ]
	zip2.2d	v28, v28, v31
Ltmp3088:
	;DEBUG_VALUE: sd_fft_basecase_5_0:ww1 <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X1 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ]
	fmul.2d	v31, v3, v1[0]
Ltmp3089:
	;DEBUG_VALUE: vec2d_round:a <- $q31
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ]
	frintn.2d	v31, v31
Ltmp3090:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ]
	fmls.2d	v3, v0, v31
Ltmp3091:
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z1 <- $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ]
	fmul.2d	v31, v5, v1[0]
Ltmp3092:
	;DEBUG_VALUE: vec2d_round:a <- $q31
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ]
	frintn.2d	v31, v31
Ltmp3093:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/flint/src/machine_vectors.h:1989:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ]
	fmls.2d	v5, v0, v31
Ltmp3094:
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: X0 <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z2 <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_pm1n:z <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q29
	;DEBUG_VALUE: vec2d_mulmod:b <- $q29
	;DEBUG_VALUE: vec2d_mul:b <- $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v31, v29, v17
Ltmp3095:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v9, v31, v1[0]
Ltmp3096:
	;DEBUG_VALUE: vec2d_round:a <- $q9
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v9, v9
Ltmp3097:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q29
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v10, v31
Ltmp3098:
	fmls.2d	v10, v29, v17
Ltmp3099:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v31, v0, v9
Ltmp3100:
	;DEBUG_VALUE: vec2d_sub:a <- $q31
	;DEBUG_VALUE: vec2d_sub:b <- $q10
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v17, v31, v10
Ltmp3101:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q30
	;DEBUG_VALUE: vec2d_mulmod:b <- $q30
	;DEBUG_VALUE: vec2d_mul:b <- $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v31, v30, v16
Ltmp3102:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v9, v31, v1[0]
Ltmp3103:
	;DEBUG_VALUE: vec2d_round:a <- $q9
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v9, v9
Ltmp3104:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q30
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v10, v31
Ltmp3105:
	fmls.2d	v10, v30, v16
Ltmp3106:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v31, v0, v9
Ltmp3107:
	;DEBUG_VALUE: vec2d_sub:a <- $q31
	;DEBUG_VALUE: vec2d_sub:b <- $q10
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v16, v31, v10
Ltmp3108:
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: X2 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q29
	;DEBUG_VALUE: vec2d_mulmod:b <- $q29
	;DEBUG_VALUE: vec2d_mul:b <- $q29
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v31, v29, v7
Ltmp3109:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v9, v31, v1[0]
Ltmp3110:
	;DEBUG_VALUE: vec2d_round:a <- $q9
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v9, v9
Ltmp3111:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q29
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v10, v31
Ltmp3112:
	fmls.2d	v10, v29, v7
Ltmp3113:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q10
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v31, v0, v9
Ltmp3114:
	;DEBUG_VALUE: vec2d_sub:a <- $q31
	;DEBUG_VALUE: vec2d_sub:b <- $q10
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v7, v31, v10
Ltmp3115:
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q30
	;DEBUG_VALUE: vec2d_mulmod:b <- $q30
	;DEBUG_VALUE: vec2d_mul:b <- $q30
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v29, v30, v6
Ltmp3116:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q29
	;DEBUG_VALUE: vec2d_mul:a <- $q29
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v31, v29, v1[0]
Ltmp3117:
	;DEBUG_VALUE: vec2d_round:a <- $q31
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v31, v31
Ltmp3118:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q30
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v9, v29
Ltmp3119:
	fmls.2d	v9, v30, v6
Ltmp3120:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q29
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v29, v0, v31
Ltmp3121:
	;DEBUG_VALUE: vec2d_sub:a <- $q29
	;DEBUG_VALUE: vec2d_sub:b <- $q9
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v6, v29, v9
Ltmp3122:
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: X3 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v29, v3, v17
Ltmp3123:
	;DEBUG_VALUE: vec4d_add:z1 <- $q29
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v30, v5, v16
Ltmp3124:
	;DEBUG_VALUE: vec4d_add:z2 <- $q30
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: Y0 <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_add:b <- $q7
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_add:a <- $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q4
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v31, v2, v7
Ltmp3125:
	;DEBUG_VALUE: vec4d_add:z1 <- $q31
	;DEBUG_VALUE: vec2d_add:b <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q4
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v9, v4, v6
Ltmp3126:
	;DEBUG_VALUE: vec4d_add:z2 <- $q9
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q3
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v17, v3, v17
Ltmp3127:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v3, v5, v16
Ltmp3128:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: Y2 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q4
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v2, v2, v7
Ltmp3129:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v4, v4, v6
Ltmp3130:
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_sub:z2 <- $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q9
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q31
	;DEBUG_VALUE: vec2d_mulmod:a <- $q31
	;DEBUG_VALUE: vec2d_mul:a <- $q31
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q8
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q8
	;DEBUG_VALUE: vec2d_mulmod:b <- $q8
	;DEBUG_VALUE: vec2d_mul:b <- $q8
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v5, v8, v31
Ltmp3131:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v6, v5, v1[0]
Ltmp3132:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v6, v6
Ltmp3133:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q8
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v7, v5
Ltmp3134:
	fmls.2d	v7, v8, v31
Ltmp3135:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v5, v0, v6
Ltmp3136:
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v5, v5, v7
Ltmp3137:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q26
	;DEBUG_VALUE: vec2d_mulmod:b <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- $q26
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q9
	;DEBUG_VALUE: vec2d_mulmod:a <- $q9
	;DEBUG_VALUE: vec2d_mul:a <- $q9
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v6, v26, v9
Ltmp3138:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp3139:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v7, v7
Ltmp3140:
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q26
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q9
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v16, v6
Ltmp3141:
	fmls.2d	v16, v26, v9
Ltmp3142:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v6, v0, v7
Ltmp3143:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v6, v6, v16
Ltmp3144:
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 128 128] $q27
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: Y1 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:b <- [DW_OP_LLVM_fragment 0 128] $q28
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q28
	;DEBUG_VALUE: vec2d_mulmod:b <- $q28
	;DEBUG_VALUE: vec2d_mul:b <- $q28
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod_fast:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:c <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v7, v28, v2
Ltmp3145:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v16, v7, v1[0]
Ltmp3146:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v16, v16
Ltmp3147:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q28
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v31, v7
Ltmp3148:
	fmls.2d	v31, v28, v2
Ltmp3149:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q31
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v7, v0, v16
Ltmp3150:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v2, v7, v31
Ltmp3151:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q27
	;DEBUG_VALUE: vec2d_mulmod:b <- $q27
	;DEBUG_VALUE: vec2d_mul:b <- $q27
	;DEBUG_VALUE: vec4d_mulmod_fast:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v7, v27, v4
Ltmp3152:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmul.2d	v1, v7, v1[0]
Ltmp3153:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	frintn.2d	v1, v1
Ltmp3154:
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q27
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	mov.16b	v16, v7
Ltmp3155:
	fmls.2d	v16, v27, v4
Ltmp3156:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fmls.2d	v7, v0, v1
Ltmp3157:
	.loc	9 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:680:5 ] ]
	stp	q22, q23, [x1]
Ltmp3158:
	;DEBUG_VALUE: vec2d_store:a <- $q23
	;DEBUG_VALUE: __s1 <- $q23
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q25
	;DEBUG_VALUE: vec2d_store:a <- $q24
	;DEBUG_VALUE: __s1 <- $q24
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	9 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:681:5 ] ]
	stp	q24, q25, [x1, #32]
Ltmp3159:
	;DEBUG_VALUE: vec2d_store:a <- $q25
	;DEBUG_VALUE: __s1 <- $q25
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/flint/src/machine_vectors.h:1999:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ] ] ]
	fsub.2d	v0, v7, v16
Ltmp3160:
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: Y3 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod_fast:z2 <- $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_mulmod_fast:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_add:a <- $q29
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v1, v29, v5
Ltmp3161:
	;DEBUG_VALUE: vec4d_add:z1 <- $q1
	;DEBUG_VALUE: vec2d_add:a <- $q30
	;DEBUG_VALUE: vec2d_add:b <- $q6
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v4, v30, v6
Ltmp3162:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: sd_fft_basecase_5_0:x4 <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_add:z2 <- $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q29
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q30
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q29
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v5, v29, v5
Ltmp3163:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q30
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v6, v30, v6
Ltmp3164:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: sd_fft_basecase_5_0:x5 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_sub:z2 <- $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q2
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v7, v17, v2
Ltmp3165:
	;DEBUG_VALUE: vec4d_add:z1 <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q0
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fadd.2d	v16, v3, v0
Ltmp3166:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: sd_fft_basecase_5_0:x6 <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_add:z2 <- $q16
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v2, v17, v2
Ltmp3167:
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q18
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q19
	;DEBUG_VALUE: vec2d_store:a <- $q18
	;DEBUG_VALUE: __s1 <- $q18
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_sub:z1 <- $q2
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:682:5 ] ]
	stp	q18, q19, [x1, #64]
Ltmp3168:
	;DEBUG_VALUE: vec2d_store:a <- $q19
	;DEBUG_VALUE: __s1 <- $q19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q20
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec2d_store:a <- $q20
	;DEBUG_VALUE: __s1 <- $q20
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	9 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:683:5 ] ]
	stp	q20, q21, [x1, #96]
Ltmp3169:
	;DEBUG_VALUE: vec2d_store:a <- $q21
	;DEBUG_VALUE: __s1 <- $q21
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q4
	;DEBUG_VALUE: vec2d_store:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 128, DW_OP_stack_value] $x1
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:684:5 ] ]
	stp	q1, q4, [x1, #128]
Ltmp3170:
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 144, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q6
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 160, DW_OP_stack_value] $x1
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:685:5 ] ]
	stp	q5, q6, [x1, #160]
Ltmp3171:
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 176, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q7
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q16
	;DEBUG_VALUE: vec2d_store:a <- $q7
	;DEBUG_VALUE: __s1 <- $q7
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 192, DW_OP_stack_value] $x1
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:686:5 ] ]
	stp	q7, q16, [x1, #192]
Ltmp3172:
	;DEBUG_VALUE: vec2d_store:a <- $q16
	;DEBUG_VALUE: __s1 <- $q16
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 208, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q0
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ build/fused-load-screen/control-fft.c:676:5 ] ]
	fsub.2d	v0, v3, v0
Ltmp3173:
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: sd_fft_basecase_5_0:x7 <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 224, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec4d_sub:z2 <- $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ build/fused-load-screen/control-fft.c:687:5 ] ]
	stp	q2, q0, [x1, #224]
Ltmp3174:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 240, DW_OP_stack_value] $x1
	.loc	5 688 1 epilogue_begin          ; build/fused-load-screen/control-fft.c:688:1
	ldp	d9, d8, [sp, #64]               ; 16-byte Folded Reload
Ltmp3175:
	ldp	d11, d10, [sp, #48]             ; 16-byte Folded Reload
Ltmp3176:
	ldp	d13, d12, [sp, #32]             ; 16-byte Folded Reload
Ltmp3177:
	ldp	d15, d14, [sp, #16]             ; 16-byte Folded Reload
Ltmp3178:
	add	sp, sp, #80
	ret
Ltmp3179:
