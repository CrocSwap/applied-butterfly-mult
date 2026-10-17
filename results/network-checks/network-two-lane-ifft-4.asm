_sd_ifft_basecase_4_0:                  ; @sd_ifft_basecase_4_0
Lfunc_begin11:
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:Q <- $x0
	;DEBUG_VALUE: sd_ifft_basecase_4_0:X <- $x1
	;DEBUG_VALUE: sd_ifft_basecase_4_0:j_mr <- $x2
	;DEBUG_VALUE: sd_ifft_basecase_4_0:j_bits <- $x3
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: A2 <- undef
	.loc	0 476 40 prologue_end           ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:476:40
	lsl	x9, x3, #3
Ltmp2361:
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:466:13 ]
	mov	x8, x0
	ld1r.2d	{ v0 }, [x8], x9
Ltmp2362:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:n <- $q0
	.loc	0 466 52                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:466:52
	ldr	d1, [x0, #8]
Ltmp2363:
	;DEBUG_VALUE: vec2d_set_d:a <- $d1
	;DEBUG_VALUE: vec2d_load:a <- $x1
	;DEBUG_VALUE: sd_ifft_basecase_4_0:ninv <- undef
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:467:14 ]
	ldp	q16, q17, [x1]
Ltmp2364:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- $q17
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	9 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:469:14 ]
	ldp	q6, q7, [x1, #32]
Ltmp2365:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- $q7
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:471:14 ]
	ldp	q4, q5, [x1, #64]
Ltmp2366:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x4 <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x5 <- $q5
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	.loc	9 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:473:14 ]
	ldp	q2, q3, [x1, #96]
Ltmp2367:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x6 <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x7 <- $q3
	.loc	0 476 30 is_stmt 1              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:476:30
	ldp	x10, x9, [x8, #72]
	add	x9, x9, x2, lsl #6
	.loc	0 476 59 is_stmt 0              ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:476:59
	ldp	q19, q18, [x9, #32]
Ltmp2368:
	;DEBUG_VALUE: vec2d_set_d2:a0 <- undef
	;DEBUG_VALUE: vec2d_set_d2:a1 <- undef
	;DEBUG_VALUE: vec2d_set_d2:data <- undef
	;DEBUG_VALUE: vec2d_set_d2:a0 <- undef
	;DEBUG_VALUE: vec2d_set_d2:a1 <- undef
	;DEBUG_VALUE: vec2d_set_d2:data <- undef
	.loc	9 1560 39 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1560:39 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:476:17 ]
	ext.16b	v18, v18, v18, #8
Ltmp2369:
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: Z1 <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q17
	;DEBUG_VALUE: Z0 <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q16
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ]
	fadd.2d	v24, v16, v17
Ltmp2370:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q24
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ]
	fmul.2d	v20, v24, v1[0]
Ltmp2371:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ]
	frintn.2d	v20, v20
Ltmp2372:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ]
	fmls.2d	v24, v0, v20
Ltmp2373:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ]
	fsub.2d	v16, v17, v16
Ltmp2374:
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ] ]
	fmul.2d	v17, v16, v18
Ltmp2375:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ] ]
	fmul.2d	v20, v17, v1[0]
Ltmp2376:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ] ]
	frintn.2d	v20, v20
Ltmp2377:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ] ]
	mov.16b	v21, v17
	fmls.2d	v21, v18, v16
Ltmp2378:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ] ]
	fmls.2d	v17, v0, v20
Ltmp2379:
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:477:9 ] ] ]
	fsub.2d	v25, v17, v21
Ltmp2380:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- $q25
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q25
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q24
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:478:18 ]
	zip1.2d	v26, v24, v25
Ltmp2381:
	;DEBUG_VALUE: lo <- $q26
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q24
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q25
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:478:43 ]
	zip2.2d	v27, v24, v25
Ltmp2382:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- $q26
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- $q27
	;DEBUG_VALUE: hi <- $q27
	.loc	9 1560 39                       ; .deps/flint/src/machine_vectors.h:1560:39 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:482:17 ]
	ext.16b	v17, v19, v19, #8
Ltmp2383:
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: Z0 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: Z1 <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ]
	fadd.2d	v16, v6, v7
Ltmp2384:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ]
	fmul.2d	v18, v16, v1[0]
Ltmp2385:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ]
	frintn.2d	v18, v18
Ltmp2386:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ]
	fmls.2d	v16, v0, v18
Ltmp2387:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ]
	fsub.2d	v6, v7, v6
Ltmp2388:
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ] ]
	fmul.2d	v7, v6, v17
Ltmp2389:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ] ]
	fmul.2d	v18, v7, v1[0]
Ltmp2390:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ] ]
	frintn.2d	v18, v18
Ltmp2391:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ] ]
	mov.16b	v19, v7
	fmls.2d	v19, v17, v6
Ltmp2392:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ] ]
	fmls.2d	v7, v0, v18
Ltmp2393:
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:483:9 ] ] ]
	fsub.2d	v23, v7, v19
Ltmp2394:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- $q23
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q23
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q16
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:484:18 ]
	zip1.2d	v18, v16, v23
Ltmp2395:
	;DEBUG_VALUE: lo <- $q18
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q16
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q23
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:484:43 ]
	zip2.2d	v19, v16, v23
Ltmp2396:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- $q18
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- $q19
	;DEBUG_VALUE: hi <- $q19
	.loc	0 488 59                        ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:488:59
	ldp	q7, q6, [x9]
Ltmp2397:
	;DEBUG_VALUE: vec2d_set_d2:a0 <- undef
	;DEBUG_VALUE: vec2d_set_d2:a1 <- undef
	;DEBUG_VALUE: vec2d_set_d2:data <- undef
	;DEBUG_VALUE: vec2d_set_d2:a0 <- undef
	;DEBUG_VALUE: vec2d_set_d2:a1 <- undef
	;DEBUG_VALUE: vec2d_set_d2:data <- undef
	.loc	9 1560 39                       ; .deps/flint/src/machine_vectors.h:1560:39 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:488:17 ]
	ext.16b	v17, v6, v6, #8
Ltmp2398:
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: Z0 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: Z1 <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ]
	fadd.2d	v6, v4, v5
Ltmp2399:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ]
	fmul.2d	v20, v6, v1[0]
Ltmp2400:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ]
	frintn.2d	v20, v20
Ltmp2401:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ]
	fmls.2d	v6, v0, v20
Ltmp2402:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x4 <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ]
	fsub.2d	v4, v5, v4
Ltmp2403:
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ] ]
	fmul.2d	v5, v4, v17
Ltmp2404:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ] ]
	fmul.2d	v20, v5, v1[0]
Ltmp2405:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ] ]
	frintn.2d	v20, v20
Ltmp2406:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ] ]
	mov.16b	v21, v5
Ltmp2407:
	fmls.2d	v21, v17, v4
Ltmp2408:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ] ]
	fmls.2d	v5, v0, v20
Ltmp2409:
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:489:9 ] ] ]
	fsub.2d	v28, v5, v21
Ltmp2410:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x5 <- $q28
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q28
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q6
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:490:18 ]
	zip1.2d	v20, v6, v28
Ltmp2411:
	;DEBUG_VALUE: lo <- $q20
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q6
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q28
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:490:43 ]
	zip2.2d	v22, v6, v28
Ltmp2412:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x4 <- $q20
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x5 <- $q22
	;DEBUG_VALUE: hi <- $q22
	.loc	9 1560 39                       ; .deps/flint/src/machine_vectors.h:1560:39 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:494:17 ]
	ext.16b	v4, v7, v7, #8
Ltmp2413:
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: Z0 <- $q2
	;DEBUG_VALUE: vec2d_add:a <- $q2
	;DEBUG_VALUE: Z1 <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q3
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ]
	fadd.2d	v5, v2, v3
Ltmp2414:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ]
	fmul.2d	v7, v5, v1[0]
Ltmp2415:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ]
	frintn.2d	v7, v7
Ltmp2416:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ]
	fmls.2d	v5, v0, v7
Ltmp2417:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x6 <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ]
	fsub.2d	v2, v3, v2
Ltmp2418:
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ] ]
	fmul.2d	v3, v2, v4
Ltmp2419:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ] ]
	fmul.2d	v7, v3, v1[0]
Ltmp2420:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ] ]
	frintn.2d	v7, v7
Ltmp2421:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ] ]
	mov.16b	v17, v3
	fmls.2d	v17, v4, v2
Ltmp2422:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ] ]
	fmls.2d	v3, v0, v7
Ltmp2423:
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:495:9 ] ] ]
	fsub.2d	v21, v3, v17
Ltmp2424:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x7 <- $q21
	;DEBUG_VALUE: vec2d_unpacklo:b <- $q21
	;DEBUG_VALUE: vec2d_unpacklo:a <- $q5
	.loc	9 1769 12                       ; .deps/flint/src/machine_vectors.h:1769:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:496:18 ]
	zip1.2d	v7, v5, v21
Ltmp2425:
	;DEBUG_VALUE: lo <- $q7
	;DEBUG_VALUE: vec2d_unpackhi:a <- $q5
	;DEBUG_VALUE: vec2d_unpackhi:b <- $q21
	.loc	9 1773 12                       ; .deps/flint/src/machine_vectors.h:1773:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:496:43 ]
	zip2.2d	v17, v5, v21
Ltmp2426:
	;DEBUG_VALUE: A2 <- $q18
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x6 <- $q7
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x7 <- $q17
	;DEBUG_VALUE: hi <- $q17
	;DEBUG_VALUE: A7 <- $q17
	;DEBUG_VALUE: A0 <- $q26
	;DEBUG_VALUE: Z0 <- $q26
	;DEBUG_VALUE: vec2d_add:a <- $q26
	;DEBUG_VALUE: A1 <- $q27
	;DEBUG_VALUE: Z1 <- $q27
	;DEBUG_VALUE: vec2d_add:b <- $q27
	;DEBUG_VALUE: A3 <- $q19
	;DEBUG_VALUE: A4 <- $q20
	;DEBUG_VALUE: A5 <- $q22
	;DEBUG_VALUE: A6 <- $q7
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	faddp.2d	v4, v24, v25
Ltmp2427:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v2, v4, v1[0]
Ltmp2428:
	;DEBUG_VALUE: vec2d_round:a <- $q2
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v2, v2
Ltmp2429:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v4, v0, v2
Ltmp2430:
	;DEBUG_VALUE: A0 <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	;DEBUG_VALUE: vec2d_sub:a <- $q27
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v2, v27, v26
Ltmp2431:
	.loc	0 499 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5
	add	x9, x10, x2, lsl #5
	ldp	d24, d3, [x9, #16]
Ltmp2432:
	;DEBUG_VALUE: vec2d_set_d:a <- $d3
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	;DEBUG_VALUE: vec2d_set_d:a <- $d24
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- undef
	;DEBUG_VALUE: vec2d_mul:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v25, v2, v3[0]
Ltmp2433:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v26, v25
Ltmp2434:
	fmls.2d	v26, v2, v3[0]
Ltmp2435:
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mulmod:l <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- undef
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v2, v25, v1[0]
Ltmp2436:
	;DEBUG_VALUE: vec2d_round:a <- $q2
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v2, v2
Ltmp2437:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	;DEBUG_VALUE: vec2d_mulmod:q <- $q2
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v25, v0, v2
Ltmp2438:
	;DEBUG_VALUE: vec2d_sub:b <- $q26
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v2, v25, v26
Ltmp2439:
	;DEBUG_VALUE: A1 <- $q2
	;DEBUG_VALUE: Z0 <- $q18
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: Z1 <- $q19
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	faddp.2d	v16, v16, v23
Ltmp2440:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v3, v16, v1[0]
Ltmp2441:
	;DEBUG_VALUE: vec2d_round:a <- $q3
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v3, v3
Ltmp2442:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v16, v0, v3
Ltmp2443:
	;DEBUG_VALUE: A2 <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v3, v19, v18
Ltmp2444:
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v18, v3, v24[0]
Ltmp2445:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp2446:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v19, v19
Ltmp2447:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v23, v18
Ltmp2448:
	fmls.2d	v23, v3, v24[0]
Ltmp2449:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v18, v0, v19
Ltmp2450:
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v3, v18, v23
Ltmp2451:
	;DEBUG_VALUE: A3 <- $q3
	;DEBUG_VALUE: Z0 <- $q20
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: Z1 <- $q22
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	faddp.2d	v18, v6, v28
Ltmp2452:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v6, v18, v1[0]
Ltmp2453:
	;DEBUG_VALUE: vec2d_round:a <- $q6
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v6, v6
Ltmp2454:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v18, v0, v6
Ltmp2455:
	;DEBUG_VALUE: A4 <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v6, v22, v20
Ltmp2456:
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	ld1r.2d	{ v19 }, [x9], #8
Ltmp2457:
	.loc	0 499 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5
	ldr	d20, [x9]
Ltmp2458:
	;DEBUG_VALUE: vec2d_set_d:a <- $d20
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v22, v6, v20[0]
Ltmp2459:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v23, v22, v1[0]
Ltmp2460:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v23, v23
Ltmp2461:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v24, v22
Ltmp2462:
	fmls.2d	v24, v6, v20[0]
Ltmp2463:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	;DEBUG_VALUE: vec2d_mulmod:l <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v22, v0, v23
Ltmp2464:
	;DEBUG_VALUE: vec2d_sub:b <- $q24
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v6, v22, v24
Ltmp2465:
	;DEBUG_VALUE: A5 <- $q6
	;DEBUG_VALUE: Z0 <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: Z1 <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q17
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	faddp.2d	v5, v5, v21
Ltmp2466:
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v20, v5, v1[0]
Ltmp2467:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v20, v20
Ltmp2468:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v5, v0, v20
Ltmp2469:
	;DEBUG_VALUE: A6 <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v7, v17, v7
Ltmp2470:
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v17, v19, v7
Ltmp2471:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v20, v17, v1[0]
Ltmp2472:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v20, v20
Ltmp2473:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q19
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v21, v17
Ltmp2474:
	fmls.2d	v21, v19, v7
Ltmp2475:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v17, v0, v20
Ltmp2476:
	;DEBUG_VALUE: vec2d_sub:a <- $q17
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v7, v17, v21
Ltmp2477:
	;DEBUG_VALUE: A7 <- $q7
	;DEBUG_VALUE: X0 <- $q4
	;DEBUG_VALUE: X1 <- $q16
	;DEBUG_VALUE: X2 <- $q18
	;DEBUG_VALUE: X3 <- $q5
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q16
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v17, v4, v16
Ltmp2478:
	;DEBUG_VALUE: Y0 <- $q17
	;DEBUG_VALUE: vec2d_add:a <- $q18
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v19, v18, v5
Ltmp2479:
	;DEBUG_VALUE: Y1 <- $q19
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v4, v4, v16
Ltmp2480:
	;DEBUG_VALUE: Y2 <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v5, v5, v18
Ltmp2481:
	;DEBUG_VALUE: Y3 <- $q5
	.loc	0 499 5 is_stmt 1               ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5
	ldr	x9, [x8, #64]
	add	x9, x9, x2, lsl #4
Ltmp2482:
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	9 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	ld1r.2d	{ v16 }, [x9], #8
Ltmp2483:
	.loc	0 499 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5
	ldr	d18, [x9]
Ltmp2484:
	;DEBUG_VALUE: vec2d_set_d:a <- $d18
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v20, v4, v18[0]
Ltmp2485:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v21, v20, v1[0]
Ltmp2486:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v21, v21
Ltmp2487:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v22, v20
Ltmp2488:
	fmls.2d	v22, v4, v18[0]
Ltmp2489:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v20, v0, v21
Ltmp2490:
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q20
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v20, v20, v22
Ltmp2491:
	;DEBUG_VALUE: Y2 <- $q20
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q16
	;DEBUG_VALUE: vec2d_mulmod:b <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v4, v16, v5
Ltmp2492:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v21, v4, v1[0]
Ltmp2493:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v21, v21
Ltmp2494:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v22, v4
Ltmp2495:
	fmls.2d	v22, v16, v5
Ltmp2496:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v4, v0, v21
Ltmp2497:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q22
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v21, v4, v22
Ltmp2498:
	;DEBUG_VALUE: Y3 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q17
	;DEBUG_VALUE: vec2d_add:b <- $q19
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v5, v17, v19
Ltmp2499:
	;DEBUG_VALUE: Z0 <- $q5
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v4, v21, v20
Ltmp2500:
	;DEBUG_VALUE: Z1 <- $q4
	;DEBUG_VALUE: vec2d_sub:a <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- $q17
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v17, v19, v17
Ltmp2501:
	;DEBUG_VALUE: Z2 <- $q17
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q20
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v19, v20, v21
Ltmp2502:
	;DEBUG_VALUE: Z3 <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v20, v5, v1[0]
Ltmp2503:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v20, v20
Ltmp2504:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v5, v0, v20
Ltmp2505:
	;DEBUG_VALUE: A0 <- $q5
	.loc	0 499 5                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5
	ldr	x8, [x8, #56]
	ldr	d20, [x8, x2, lsl #3]
Ltmp2506:
	;DEBUG_VALUE: vec2d_set_d:a <- $d20
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v21, v17, v20[0]
Ltmp2507:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp2508:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v22, v22
Ltmp2509:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	mov.16b	v23, v21
Ltmp2510:
	fmls.2d	v23, v17, v20[0]
Ltmp2511:
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v21, v0, v22
Ltmp2512:
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fsub.2d	v17, v21, v23
Ltmp2513:
	;DEBUG_VALUE: A4 <- $q17
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v21, v19, v20[0]
Ltmp2514:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp2515:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v22, v22
Ltmp2516:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v23, v21
Ltmp2517:
	fmls.2d	v23, v19, v20[0]
Ltmp2518:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v21, v0, v22
Ltmp2519:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v19, v21, v23
Ltmp2520:
	;DEBUG_VALUE: A6 <- $q19
	;DEBUG_VALUE: X0 <- $q2
	;DEBUG_VALUE: X1 <- $q3
	;DEBUG_VALUE: X2 <- $q6
	;DEBUG_VALUE: X3 <- $q7
	;DEBUG_VALUE: vec2d_add:a <- $q2
	;DEBUG_VALUE: vec2d_add:b <- $q3
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v21, v2, v3
Ltmp2521:
	;DEBUG_VALUE: Y0 <- $q21
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q7
	.loc	9 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v22, v6, v7
Ltmp2522:
	;DEBUG_VALUE: Y1 <- $q22
	;DEBUG_VALUE: vec2d_sub:a <- $q2
	;DEBUG_VALUE: vec2d_sub:b <- $q3
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v2, v2, v3
Ltmp2523:
	;DEBUG_VALUE: Y2 <- $q2
	;DEBUG_VALUE: vec2d_sub:a <- $q7
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v3, v7, v6
Ltmp2524:
	;DEBUG_VALUE: Y3 <- $q3
	;DEBUG_VALUE: vec2d_set_d:a <- undef
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
	.loc	9 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v6, v2, v18[0]
Ltmp2525:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp2526:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v7, v7
Ltmp2527:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v23, v6
Ltmp2528:
	fmls.2d	v23, v2, v18[0]
Ltmp2529:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v6, v0, v7
Ltmp2530:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v2, v6, v23
Ltmp2531:
	;DEBUG_VALUE: Y2 <- $q2
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mulmod_fast:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod_fast:b <- $q16
	;DEBUG_VALUE: vec2d_mulmod:b <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- $q16
	;DEBUG_VALUE: vec2d_mulmod_fast:n <- $q0
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v6, v16, v3
Ltmp2532:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp2533:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v7, v7
Ltmp2534:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v18, v6
Ltmp2535:
	fmls.2d	v18, v16, v3
Ltmp2536:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v6, v0, v7
Ltmp2537:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v3, v6, v18
Ltmp2538:
	;DEBUG_VALUE: Y3 <- $q3
	;DEBUG_VALUE: vec2d_add:a <- $q21
	;DEBUG_VALUE: vec2d_add:b <- $q22
	.loc	9 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v6, v21, v22
Ltmp2539:
	;DEBUG_VALUE: Z0 <- $q6
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q2
	.loc	9 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v7, v3, v2
Ltmp2540:
	;DEBUG_VALUE: Z1 <- $q7
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fsub.2d	v16, v22, v21
Ltmp2541:
	;DEBUG_VALUE: Z2 <- $q16
	;DEBUG_VALUE: vec2d_add:a <- $q3
	;DEBUG_VALUE: vec2d_add:b <- $q2
	.loc	9 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ]
	fadd.2d	v2, v2, v3
Ltmp2542:
	;DEBUG_VALUE: Z3 <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1n:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1789:37 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v3, v6, v1[0]
Ltmp2543:
	;DEBUG_VALUE: vec2d_round:a <- $q3
	.loc	9 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1789:25 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v3, v3
Ltmp2544:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1789:12 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v6, v0, v3
Ltmp2545:
	;DEBUG_VALUE: A1 <- $q6
	;DEBUG_VALUE: A3 <- $q7
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q0
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v3, v16, v20[0]
Ltmp2546:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmul.2d	v18, v3, v1[0]
Ltmp2547:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	frintn.2d	v18, v18
Ltmp2548:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	mov.16b	v21, v3
Ltmp2549:
	fmls.2d	v21, v16, v20[0]
Ltmp2550:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fmls.2d	v3, v0, v18
Ltmp2551:
	;DEBUG_VALUE: vec2d_sub:a <- $q3
	;DEBUG_VALUE: vec2d_sub:b <- $q21
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ]
	fsub.2d	v3, v3, v21
Ltmp2552:
	;DEBUG_VALUE: A5 <- $q3
	;DEBUG_VALUE: vec2d_set_d:a <- undef
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
	.loc	9 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v16, v2, v20[0]
Ltmp2553:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	9 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmul.2d	v1, v16, v1[0]
Ltmp2554:
	;DEBUG_VALUE: vec2d_round:a <- $q1
	.loc	9 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	frintn.2d	v1, v1
Ltmp2555:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	.loc	9 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	mov.16b	v18, v16
Ltmp2556:
	fmls.2d	v18, v2, v20[0]
Ltmp2557:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q0
	.loc	9 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fmls.2d	v16, v0, v1
Ltmp2558:
	.loc	9 1586 5 is_stmt 1              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:500:5 ]
	stp	q5, q6, [x1]
Ltmp2559:
	;DEBUG_VALUE: vec2d_store:a <- $q6
	;DEBUG_VALUE: __s1 <- $q6
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x1
	.loc	9 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:502:5 ]
	stp	q4, q7, [x1, #32]
Ltmp2560:
	;DEBUG_VALUE: vec2d_store:a <- $q7
	;DEBUG_VALUE: __s1 <- $q7
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:a <- $q17
	;DEBUG_VALUE: __s1 <- $q17
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 64, DW_OP_stack_value] $x1
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:504:5 ]
	stp	q17, q3, [x1, #64]
Ltmp2561:
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 80, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	9 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1855:1 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:499:5 ] ] ]
	fsub.2d	v0, v16, v18
Ltmp2562:
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x0 <- undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x1 <- undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x2 <- undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x3 <- undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x4 <- undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x5 <- undef
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x6 <- $q19
	;DEBUG_VALUE: sd_ifft_basecase_4_0:x7 <- $q0
	;DEBUG_VALUE: A7 <- $q0
	;DEBUG_VALUE: vec2d_store:a <- $q19
	;DEBUG_VALUE: __s1 <- $q19
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 96, DW_OP_stack_value] $x1
	;DEBUG_VALUE: vec2d_store:z <- $x1
	;DEBUG_VALUE: vec2d_store:a <- undef
	;DEBUG_VALUE: __s1 <- undef
	.loc	9 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:506:5 ]
	stp	q19, q0, [x1, #96]
Ltmp2563:
	;DEBUG_VALUE: vec2d_store:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_plus_uconst 112, DW_OP_stack_value] $x1
	.loc	0 508 1                         ; .deps/experiments/network-two-lane/src/fft_small/bf_network_ifft.c:508:1
	ret
Ltmp2564:
Lfunc_end11:
	.cfi_endproc
