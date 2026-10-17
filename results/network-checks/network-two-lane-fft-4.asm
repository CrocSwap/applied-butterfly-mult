_sd_fft_basecase_4_0:                   ; @sd_fft_basecase_4_0
Lfunc_begin11:
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_fft_basecase_4_0:Q <- $x0
	;DEBUG_VALUE: sd_fft_basecase_4_0:X <- $x1
	;DEBUG_VALUE: sd_fft_basecase_4_0:j_r <- $x2
	;DEBUG_VALUE: sd_fft_basecase_4_0:j_bits <- $x3
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	0 578 5 prologue_end is_stmt 1  ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	lsl	x9, x3, #3
Ltmp2623:
	.loc	8 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:569:13 ]
	mov	x8, x0
	ld1r.2d	{ v0 }, [x8], x9
Ltmp2624:
	;DEBUG_VALUE: sd_fft_basecase_4_0:n <- $q0
	.loc	0 569 52                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:569:52
	ldr	d1, [x0, #8]
Ltmp2625:
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: sd_fft_basecase_4_0:ninv <- undef
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:570:14 ]
	ldp	q4, q5, [x1]
Ltmp2626:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- $q5
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	8 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:572:14 ]
	ldp	q2, q3, [x1, #32]
Ltmp2627:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- $q3
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:574:14 ]
	ldp	q17, q16, [x1, #64]
Ltmp2628:
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_fft_basecase_4_0:x4 <- $q17
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: sd_fft_basecase_4_0:x5 <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:576:14 ]
	ldp	q7, q6, [x1, #96]
Ltmp2629:
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_fft_basecase_4_0:x6 <- $q7
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: sd_fft_basecase_4_0:x7 <- $q6
	;DEBUG_VALUE: X7 <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: X1 <- $q5
	;DEBUG_VALUE: X2 <- $q2
	;DEBUG_VALUE: X3 <- $q3
	;DEBUG_VALUE: X4 <- $q17
	;DEBUG_VALUE: X5 <- $q16
	;DEBUG_VALUE: X6 <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	;DEBUG_VALUE: X0 <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	8 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmul.2d	v18, v4, v1[0]
Ltmp2630:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	frintn.2d	v18, v18
Ltmp2631:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmls.2d	v4, v0, v18
Ltmp2632:
	;DEBUG_VALUE: X0 <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmul.2d	v18, v5, v1[0]
Ltmp2633:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	frintn.2d	v18, v18
Ltmp2634:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmls.2d	v5, v0, v18
Ltmp2635:
	;DEBUG_VALUE: X1 <- $q5
	.loc	0 578 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	ldp	x9, x10, [x8, #56]
	ldr	d18, [x9, x2, lsl #3]
Ltmp2636:
	;DEBUG_VALUE: vec2d_set_d:a <- $d18
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
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v19, v17, v18[0]
Ltmp2637:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2638:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2639:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v19
	fmls.2d	v21, v17, v18[0]
Ltmp2640:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v19, v0, v20
Ltmp2641:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v17, v19, v21
Ltmp2642:
	;DEBUG_VALUE: X4 <- $q17
	;DEBUG_VALUE: vec2d_set_d:a <- undef
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
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v19, v16, v18[0]
Ltmp2643:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2644:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2645:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v19
Ltmp2646:
	fmls.2d	v21, v16, v18[0]
Ltmp2647:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v19, v0, v20
Ltmp2648:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v16, v19, v21
Ltmp2649:
	;DEBUG_VALUE: X5 <- $q16
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v19, v7, v18[0]
Ltmp2650:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2651:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2652:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v19
Ltmp2653:
	fmls.2d	v21, v7, v18[0]
Ltmp2654:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v19, v0, v20
Ltmp2655:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v7, v19, v21
Ltmp2656:
	;DEBUG_VALUE: X6 <- $q7
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v19, v6, v18[0]
Ltmp2657:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2658:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2659:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v19
Ltmp2660:
	fmls.2d	v21, v6, v18[0]
Ltmp2661:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v19, v0, v20
Ltmp2662:
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v6, v19, v21
Ltmp2663:
	;DEBUG_VALUE: X7 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v18, v4, v17
Ltmp2664:
	;DEBUG_VALUE: Y0 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	8 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v19, v5, v16
Ltmp2665:
	;DEBUG_VALUE: Y1 <- $q19
	;DEBUG_VALUE: vec2d_add:b <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q2
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v20, v2, v7
Ltmp2666:
	;DEBUG_VALUE: Y2 <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q3
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v21, v3, v6
Ltmp2667:
	;DEBUG_VALUE: Y3 <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v17, v4, v17
Ltmp2668:
	;DEBUG_VALUE: Y4 <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	8 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v16, v5, v16
Ltmp2669:
	;DEBUG_VALUE: Y5 <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v2, v2, v7
Ltmp2670:
	;DEBUG_VALUE: Y6 <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v3, v3, v6
Ltmp2671:
	;DEBUG_VALUE: Y7 <- $q3
	.loc	0 578 5 is_stmt 1               ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	add	x9, x10, x2, lsl #4
Ltmp2672:
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	8 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	ld1r.2d	{ v4 }, [x9], #8
Ltmp2673:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v5, v4, v20
Ltmp2674:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v6, v5, v1[0]
Ltmp2675:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v6, v6
Ltmp2676:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v7, v5
Ltmp2677:
	fmls.2d	v7, v4, v20
Ltmp2678:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v5, v0, v6
Ltmp2679:
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v5, v5, v7
Ltmp2680:
	;DEBUG_VALUE: Y2 <- $q5
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- $q4
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v6, v4, v21
Ltmp2681:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp2682:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v7, v7
Ltmp2683:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q4
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v20, v6
Ltmp2684:
	fmls.2d	v20, v4, v21
Ltmp2685:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v6, v0, v7
Ltmp2686:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v4, v6, v20
Ltmp2687:
	;DEBUG_VALUE: Y3 <- $q4
	.loc	0 578 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	ldr	d6, [x9]
Ltmp2688:
	;DEBUG_VALUE: vec2d_set_d:a <- $d6
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v7, v2, v6[0]
Ltmp2689:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v7, v1[0]
Ltmp2690:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2691:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v7
Ltmp2692:
	fmls.2d	v21, v2, v6[0]
Ltmp2693:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v7, v0, v20
Ltmp2694:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v7, v7, v21
Ltmp2695:
	;DEBUG_VALUE: Y6 <- $q7
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v2, v3, v6[0]
Ltmp2696:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v2, v1[0]
Ltmp2697:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2698:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v2
Ltmp2699:
	fmls.2d	v21, v3, v6[0]
Ltmp2700:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v2, v0, v20
Ltmp2701:
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v6, v2, v21
Ltmp2702:
	;DEBUG_VALUE: Y7 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v2, v18, v5
Ltmp2703:
	;DEBUG_VALUE: Z0 <- $q2
	;DEBUG_VALUE: vec2d_add:a <- $q19
	;DEBUG_VALUE: vec2d_add:b <- $q4
	.loc	8 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v20, v19, v4
Ltmp2704:
	;DEBUG_VALUE: Z1 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q5
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v3, v18, v5
Ltmp2705:
	;DEBUG_VALUE: Z2 <- $q3
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	.loc	8 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v18, v19, v4
Ltmp2706:
	;DEBUG_VALUE: Z3 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	8 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v4, v17, v7
Ltmp2707:
	;DEBUG_VALUE: Z4 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q16
	;DEBUG_VALUE: vec2d_add:b <- $q6
	.loc	8 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v19, v16, v6
Ltmp2708:
	;DEBUG_VALUE: Z5 <- $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v5, v17, v7
Ltmp2709:
	;DEBUG_VALUE: Z6 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	8 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v6, v16, v6
Ltmp2710:
	;DEBUG_VALUE: Z7 <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmul.2d	v7, v2, v1[0]
Ltmp2711:
	.loc	0 578 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	ldr	x9, [x8, #72]
	add	x9, x9, x2, lsl #5
Ltmp2712:
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	8 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	mov	x10, x9
	ld1r.2d	{ v16 }, [x10], #8
Ltmp2713:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	frintn.2d	v7, v7
Ltmp2714:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmls.2d	v2, v0, v7
Ltmp2715:
	;DEBUG_VALUE: Z0 <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q16
	;DEBUG_VALUE: vec2d_mulmod:b <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v7, v16, v20
Ltmp2716:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v17, v7, v1[0]
Ltmp2717:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v17, v17
Ltmp2718:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v7
Ltmp2719:
	fmls.2d	v21, v16, v20
Ltmp2720:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v7, v0, v17
Ltmp2721:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v7, v7, v21
Ltmp2722:
	;DEBUG_VALUE: Z1 <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmul.2d	v16, v3, v1[0]
Ltmp2723:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	frintn.2d	v16, v16
Ltmp2724:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmls.2d	v3, v0, v16
Ltmp2725:
	;DEBUG_VALUE: Z2 <- $q3
	.loc	0 578 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	ldr	d16, [x10]
Ltmp2726:
	;DEBUG_VALUE: vec2d_set_d:a <- $d16
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
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v17, v18, v16[0]
Ltmp2727:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v17, v1[0]
Ltmp2728:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2729:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v17
Ltmp2730:
	fmls.2d	v21, v18, v16[0]
Ltmp2731:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v17, v0, v20
Ltmp2732:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v16, v17, v21
Ltmp2733:
	;DEBUG_VALUE: Z3 <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmul.2d	v17, v4, v1[0]
Ltmp2734:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	frintn.2d	v17, v17
Ltmp2735:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmls.2d	v4, v0, v17
Ltmp2736:
	;DEBUG_VALUE: Z4 <- $q4
	.loc	0 578 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5
	ldp	d17, d18, [x9, #16]
Ltmp2737:
	;DEBUG_VALUE: vec2d_set_d:a <- $d17
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
	;DEBUG_VALUE: vec2d_set_d:a <- $d18
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v19, v17[0]
Ltmp2738:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v20
Ltmp2739:
	fmls.2d	v21, v19, v17[0]
Ltmp2740:
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v17, v20, v1[0]
Ltmp2741:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v17, v17
Ltmp2742:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v20, v0, v17
Ltmp2743:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v17, v20, v21
Ltmp2744:
	;DEBUG_VALUE: Z5 <- $q17
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmul.2d	v19, v5, v1[0]
Ltmp2745:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	frintn.2d	v19, v19
Ltmp2746:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ]
	fmls.2d	v5, v0, v19
Ltmp2747:
	;DEBUG_VALUE: Z6 <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v19, v6, v18[0]
Ltmp2748:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmul.2d	v20, v19, v1[0]
Ltmp2749:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2750:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	mov.16b	v21, v19
Ltmp2751:
	fmls.2d	v21, v6, v18[0]
Ltmp2752:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fmls.2d	v19, v0, v20
Ltmp2753:
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ] ] ]
	fsub.2d	v6, v19, v21
Ltmp2754:
	;DEBUG_VALUE: Z7 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q2
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v18, v2, v7
Ltmp2755:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v7, v2, v7
Ltmp2756:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v19, v3, v16
Ltmp2757:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v16, v3, v16
Ltmp2758:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v20, v4, v17
Ltmp2759:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x4 <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v4, v4, v17
Ltmp2760:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x5 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q6
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fadd.2d	v2, v5, v6
Ltmp2761:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x6 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:578:5 ]
	fsub.2d	v3, v5, v6
Ltmp2762:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x7 <- $q3
	.loc	0 580 28                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:580:28
	ldr	x8, [x8, #80]
	.loc	0 580 46 is_stmt 0              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:580:46
	add	x8, x8, x2, lsl #6
Ltmp2763:
	.loc	8 1769 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:581:18 ]
	zip1.2d	v5, v18, v7
Ltmp2764:
	;DEBUG_VALUE: lo <- $q5
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q18
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q7
	.loc	8 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:581:43 ]
	zip2.2d	v6, v18, v7
Ltmp2765:
	;DEBUG_VALUE: hi <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:582:12 ] ]
	fmul.2d	v7, v5, v1[0]
Ltmp2766:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:582:12 ] ]
	frintn.2d	v7, v7
Ltmp2767:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:582:12 ] ]
	fmls.2d	v5, v0, v7
Ltmp2768:
	;DEBUG_VALUE: lo <- $q5
	;DEBUG_VALUE: vec2d_load:a <- $x8
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:580:17 ]
	ldp	q7, q17, [x8]
Ltmp2769:
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: w <- $q7
	;DEBUG_VALUE: vec2d_unpacklo:a <- undef
	;DEBUG_VALUE: vec2d_unpacklo:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: w <- $q17
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:583:12 ] ]
	fmul.2d	v18, v7, v6
Ltmp2770:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:583:12 ] ]
	mov.16b	v21, v18
Ltmp2771:
	fmls.2d	v21, v7, v6
Ltmp2772:
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:583:12 ] ]
	fmul.2d	v6, v18, v1[0]
Ltmp2773:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:583:12 ] ]
	frintn.2d	v6, v6
Ltmp2774:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_mulmod:q <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:583:12 ] ]
	fmls.2d	v18, v0, v6
Ltmp2775:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:583:12 ] ]
	fsub.2d	v6, v18, v21
Ltmp2776:
	;DEBUG_VALUE: hi <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q5
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:584:12 ]
	fadd.2d	v7, v5, v6
Ltmp2777:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x0 <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:584:32 ]
	fsub.2d	v5, v5, v6
Ltmp2778:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x1 <- $q5
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q19
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x8
	.loc	8 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:588:18 ]
	zip1.2d	v6, v19, v16
Ltmp2779:
	;DEBUG_VALUE: lo <- $q6
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q19
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q16
	.loc	8 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:588:43 ]
	zip2.2d	v16, v19, v16
Ltmp2780:
	;DEBUG_VALUE: hi <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:589:12 ] ]
	fmul.2d	v18, v6, v1[0]
Ltmp2781:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:589:12 ] ]
	frintn.2d	v18, v18
Ltmp2782:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:589:12 ] ]
	fmls.2d	v6, v0, v18
Ltmp2783:
	;DEBUG_VALUE: lo <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- $q17
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:590:12 ] ]
	fmul.2d	v18, v17, v16
Ltmp2784:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:590:12 ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp2785:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:590:12 ] ]
	frintn.2d	v19, v19
Ltmp2786:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q17
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:590:12 ] ]
	mov.16b	v21, v18
Ltmp2787:
	fmls.2d	v21, v17, v16
Ltmp2788:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:590:12 ] ]
	fmls.2d	v18, v0, v19
Ltmp2789:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:590:12 ] ]
	fsub.2d	v16, v18, v21
Ltmp2790:
	;DEBUG_VALUE: hi <- $q16
	;DEBUG_VALUE: vec2d_add:b <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q6
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:591:12 ]
	fadd.2d	v17, v6, v16
Ltmp2791:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x2 <- $q17
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:591:32 ]
	fsub.2d	v6, v6, v16
Ltmp2792:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x3 <- $q6
	.loc	8 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:595:18 ]
	zip1.2d	v16, v20, v4
Ltmp2793:
	;DEBUG_VALUE: lo <- $q16
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q20
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q4
	.loc	8 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:595:43 ]
	zip2.2d	v4, v20, v4
Ltmp2794:
	;DEBUG_VALUE: hi <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:596:12 ] ]
	fmul.2d	v18, v16, v1[0]
Ltmp2795:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:596:12 ] ]
	frintn.2d	v18, v18
Ltmp2796:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:596:12 ] ]
	fmls.2d	v16, v0, v18
Ltmp2797:
	;DEBUG_VALUE: lo <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x8
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:594:17 ]
	ldp	q18, q19, [x8, #32]
Ltmp2798:
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: w <- $q18
	;DEBUG_VALUE: vec2d_unpacklo:a <- undef
	;DEBUG_VALUE: vec2d_unpacklo:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: w <- $q19
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:597:12 ] ]
	fmul.2d	v20, v18, v4
Ltmp2799:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:597:12 ] ]
	mov.16b	v21, v20
Ltmp2800:
	fmls.2d	v21, v18, v4
Ltmp2801:
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:597:12 ] ]
	fmul.2d	v4, v20, v1[0]
Ltmp2802:
	;DEBUG_VALUE: vec2d_round:a <- $q4
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:597:12 ] ]
	frintn.2d	v4, v4
Ltmp2803:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_mulmod:q <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:597:12 ] ]
	fmls.2d	v20, v0, v4
Ltmp2804:
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:597:12 ] ]
	fsub.2d	v4, v20, v21
Ltmp2805:
	;DEBUG_VALUE: hi <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q16
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:598:12 ]
	fadd.2d	v18, v16, v4
Ltmp2806:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x4 <- $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	.loc	8 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:598:32 ]
	fsub.2d	v4, v16, v4
Ltmp2807:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x5 <- $q4
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q2
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q3
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] undef
	.loc	8 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:602:18 ]
	zip1.2d	v16, v2, v3
Ltmp2808:
	;DEBUG_VALUE: lo <- $q16
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q2
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q3
	.loc	8 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:602:43 ]
	zip2.2d	v2, v2, v3
Ltmp2809:
	;DEBUG_VALUE: hi <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:603:12 ] ]
	fmul.2d	v3, v16, v1[0]
Ltmp2810:
	;DEBUG_VALUE: vec2d_round:a <- $q3
	.loc	8 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:603:12 ] ]
	frintn.2d	v3, v3
Ltmp2811:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:603:12 ] ]
	fmls.2d	v16, v0, v3
Ltmp2812:
	;DEBUG_VALUE: lo <- $q16
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- $q19
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	8 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:604:12 ] ]
	fmul.2d	v3, v19, v2
Ltmp2813:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	8 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:604:12 ] ]
	fmul.2d	v1, v3, v1[0]
Ltmp2814:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	8 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:604:12 ] ]
	frintn.2d	v1, v1
Ltmp2815:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q19
	.loc	8 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:604:12 ] ]
	mov.16b	v20, v3
Ltmp2816:
	fmls.2d	v20, v19, v2
Ltmp2817:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	8 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:604:12 ] ]
	fmls.2d	v3, v0, v1
Ltmp2818:
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:604:12 ] ]
	fsub.2d	v0, v3, v20
Ltmp2819:
	;DEBUG_VALUE: hi <- $q0
	;DEBUG_VALUE: vec2d_add:b <- $q0
	;DEBUG_VALUE: vec2d_add:a <- $q16
	.loc	8 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:605:12 ]
	fadd.2d	v1, v16, v0
Ltmp2820:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x6 <- $q1
	.loc	8 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:607:5 ]
	stp	q7, q5, [x1]
Ltmp2821:
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q17
	;DEBUG_VALUE: __s1 <- $q17
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	8 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:609:5 ]
	stp	q17, q6, [x1, #32]
Ltmp2822:
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q18
	;DEBUG_VALUE: __s1 <- $q18
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	8 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:611:5 ]
	stp	q18, q4, [x1, #64]
Ltmp2823:
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q0
	.loc	8 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:605:32 ]
	fsub.2d	v0, v16, v0
Ltmp2824:
	;DEBUG_VALUE: sd_fft_basecase_4_0:x7 <- $q0
	;DEBUG_VALUE: vec2d_store:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	.loc	8 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:613:5 ]
	stp	q1, q0, [x1, #96]
Ltmp2825:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	.loc	0 615 1                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_fft.c:615:1
	ret
Ltmp2826:
Lfunc_end11:
	.cfi_endproc
