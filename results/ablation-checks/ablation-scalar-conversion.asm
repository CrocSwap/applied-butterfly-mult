__mpn_ctx_mpn_mul_window_np2:           ; @_mpn_ctx_mpn_mul_window_np2
Lfunc_begin2:
	.loc	0 313 0                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:313:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- $x0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- $x2
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x6
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- $x7
	sub	sp, sp, #368
	stp	x28, x27, [sp, #272]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #288]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #304]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #320]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #336]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #352]            ; 16-byte Folded Spill
	add	x29, sp, #352
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x27, x7
Ltmp91:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- $x27
	mov	x28, x6
Ltmp92:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x21, x5
Ltmp93:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	mov	x24, x4
Ltmp94:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	stp	x2, x3, [sp, #64]               ; 16-byte Folded Spill
Ltmp95:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	mov	x20, x1
Ltmp96:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	mov	x26, x0
Ltmp97:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- $x26
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-96]
Ltmp98:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zn <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 120, DW_OP_deref] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 112, DW_OP_deref] $sp
	mov	w22, #1                         ; =0x1
Ltmp99:
	.loc	0 320 18 prologue_end           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:320:18
	add	x4, sp, #120
	add	x5, sp, #112
	mov	x1, x21
	mov	x2, x7
	mov	w3, #1                          ; =0x1
	bl	__fft_small_np2_choose
Ltmp100:
	;DEBUG_VALUE: ok <- undef
	.loc	0 324 16                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:324:16
	lsl	x25, x21, #6
	.loc	0 324 23 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:324:23
	ldr	x23, [sp, #120]
Ltmp101:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	.loc	0 324 21                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:324:21
	sub	x8, x23, #1
	.loc	0 324 28                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:324:28
	add	x9, x8, x25
	.loc	0 324 33                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:324:33
	udiv	x19, x9, x23
Ltmp102:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	.loc	0 325 16 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:325:16
	lsl	x9, x27, #6
	.loc	0 325 28 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:325:28
	add	x8, x8, x9
	.loc	0 325 33                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:325:33
	udiv	x8, x8, x23
Ltmp103:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- $x8
	.loc	0 0 33                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:33
	stp	x9, x8, [sp, #24]               ; 16-byte Folded Spill
Ltmp104:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	.loc	0 326 17 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:326:17
	add	x8, x8, x19
Ltmp105:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: n_round_up:a <- $x19
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- $x19
	;DEBUG_VALUE: n_cdiv:b <- 256
	.file	5 ".deps/flint/src" "fft_small.h" md5 0x44ba70fc45bdb60a6adc33bc1fb33a25
	.loc	5 72 19                         ; .deps/flint/src/fft_small.h:72:19 @[ .deps/flint/src/fft_small.h:77:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:327:17 ] ]
	add	x9, x19, #255
Ltmp106:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- undef
	;DEBUG_VALUE: n_round_up:a <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	.loc	5 0 19 is_stmt 0                ; .deps/flint/src/fft_small.h:0:19
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
Ltmp107:
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:b <- 256
	.loc	5 72 19                         ; .deps/flint/src/fft_small.h:72:19 @[ .deps/flint/src/fft_small.h:77:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:329:17 ] ]
	add	x8, x8, #254
Ltmp108:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- undef
	.loc	5 0 19                          ; .deps/flint/src/fft_small.h:0:19
	stp	x8, x9, [sp, #88]               ; 16-byte Folded Spill
Ltmp109:
	.loc	0 330 18 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:330:18
	cmp	x24, x28
	cset	w8, eq
	str	x27, [sp, #40]                  ; 8-byte Folded Spill
Ltmp110:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	.loc	0 330 23 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:330:23
	cmp	x21, x27
	cset	w9, eq
	.loc	0 338 46 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:338:46
	ands	w8, w8, w9
Ltmp111:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $w8
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q1 <- undef
	.loc	0 0 46 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:46
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
Ltmp112:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	.loc	0 332 38 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:332:38
	ldr	x8, [sp, #112]
Ltmp113:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x8
	.loc	0 0 38 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:38
	str	x8, [sp, #104]                  ; 8-byte Folded Spill
Ltmp114:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: sd_fft_ctx_data_size:L <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: n_pow2:k <- [DW_OP_plus_uconst 104] [$sp+0]
	.loc	5 56 21 is_stmt 1               ; .deps/flint/src/fft_small.h:56:21 @[ .deps/flint/src/fft_small.h:240:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:332:17 ] ]
	lsl	x27, x22, x8
Ltmp115:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	.loc	0 338 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:338:46
	cinc	x8, x22, eq
	lsl	x8, x27, x8
	.loc	0 338 52 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:338:52
	lsl	x1, x8, #3
	str	x26, [sp, #80]                  ; 8-byte Folded Spill
Ltmp116:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	.loc	0 338 10                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:338:10
	mov	x0, x26
	bl	_mpn_ctx_fit_buffer
Ltmp117:
	mov	x1, x0
Ltmp118:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	.loc	0 339 13 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:339:13
	add	x14, x0, x27, lsl #3
Ltmp119:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	.loc	0 0 13 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:13
	mov	x8, #-1                         ; =0xffffffffffffffff
Ltmp120:
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- undef
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	.loc	0 143 37 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:143:37 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsl	x8, x8, x23
	mvn	x22, x8
Ltmp121:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	.loc	0 145 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:145:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	cmp	x21, #2
	b.lo	LBB2_4
Ltmp122:
; %bb.1:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 145 25 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:145:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	sub	x8, x25, #65
	udiv	x8, x8, x23
	add	x9, x8, #1
	cmp	x9, x19
	csinc	x8, x19, x8, hs
Ltmp123:
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	.loc	0 146 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	cbz	x8, LBB2_5
Ltmp124:
; %bb.2:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x9, #0                          ; =0x0
	mov	x10, #0                         ; =0x0
	ldr	x15, [sp, #96]                  ; 8-byte Folded Reload
Ltmp125:
LBB2_3:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x10
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_mul, DW_OP_stack_value] $x10, $x23
	;DEBUG_VALUE: _fft_small_np2_pack:w <- undef
	.loc	0 151 18 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:151:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	and	x11, x9, #0x3f
Ltmp126:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x11
	.loc	0 152 26                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:26 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsr	x12, x9, #6
	add	x12, x24, x12, lsl #3
	ldp	x13, x12, [x12]
	.loc	0 152 31 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:31 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsr	x13, x13, x9
	.loc	0 153 43 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:153:43 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	eor	x11, x11, #0x3f
Ltmp127:
	.loc	0 153 36 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:153:36 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsl	x11, x12, x11
	.loc	0 152 38 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:38 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	orr	x11, x13, x11, lsl #1
	.loc	0 153 58                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:153:58 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	and	x11, x11, x22
	.loc	0 152 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	ucvtf	d0, x11
Ltmp128:
	;DEBUG_VALUE: e <- $d0
	.loc	0 154 14                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:154:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	str	d0, [x1, x10, lsl #3]
	.loc	0 154 25 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:154:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	str	d0, [x14, x10, lsl #3]
Ltmp129:
	.loc	0 146 29 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:29 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x10, x10, #1
Ltmp130:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x10
	.loc	0 146 19 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:19 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x9, x9, x23
Ltmp131:
	.loc	0 146 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	cmp	x8, x10
	b.ne	LBB2_3
	b	LBB2_6
Ltmp132:
LBB2_4:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: n_pow2:k <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: sd_fft_ctx_data_size:L <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_round_up:a <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- $x19
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_round_up:a <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x8, #0                          ; =0x0
Ltmp133:
LBB2_5:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	ldr	x15, [sp, #96]                  ; 8-byte Folded Reload
Ltmp134:
LBB2_6:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	and	x25, x15, #0xffffffffffffff00
Ltmp135:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	and	x26, x9, #0xffffffffffffff00
Ltmp136:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	mov	w17, w9
Ltmp137:
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 156 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	subs	x9, x19, x8
	str	x14, [sp, #96]                  ; 8-byte Folded Spill
Ltmp138:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	b.ls	LBB2_13
Ltmp139:
; %bb.7:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #64                        ; =0x40
	sub	x10, x10, x23
	.loc	0 156 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x11, x1, x8, lsl #3
	mul	x8, x8, x23
Ltmp140:
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	b	LBB2_9
Ltmp141:
LBB2_8:                                 ;   in Loop: Header=BB2_9 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	.loc	0 165 25 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:165:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	and	x12, x12, x22
Ltmp142:
	.loc	0 165 13 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:165:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	ucvtf	d0, x12
Ltmp143:
	;DEBUG_VALUE: e <- $d0
	.loc	0 166 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:166:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	str	d0, [x11]
	.loc	0 166 25 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:166:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	str	d0, [x11, x27, lsl #3]
Ltmp144:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 156 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x11, x11, #8
	add	x8, x8, x23
	subs	x9, x9, #1
Ltmp145:
	.loc	0 156 5 is_stmt 0               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	b.eq	LBB2_12
Ltmp146:
LBB2_9:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 160 17 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:160:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsr	x14, x8, #6
Ltmp147:
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x14
	.loc	0 161 18                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:161:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	and	x13, x8, #0x3f
Ltmp148:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x13
	.loc	0 162 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:162:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	ldr	x12, [x24, x14, lsl #3]
	.loc	0 162 18 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:162:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsr	x12, x12, x8
Ltmp149:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	.loc	0 163 28 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	cmp	x13, x10
	b.ls	LBB2_8
Ltmp150:
; %bb.10:                               ;   in Loop: Header=BB2_9 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 163 33 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:163:33 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x14, x14, #1
Ltmp151:
	.loc	0 163 28                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	cmp	x14, x21
	b.hs	LBB2_8
Ltmp152:
; %bb.11:                               ;   in Loop: Header=BB2_9 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x13
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 164 18 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:164:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	ldr	x14, [x24, x14, lsl #3]
	.loc	0 164 27 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:164:27 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	neg	x13, x13
Ltmp153:
	lsl	x13, x14, x13
	.loc	0 164 15                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:164:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	orr	x12, x13, x12
Ltmp154:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	.loc	0 0 15                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:15
	b	LBB2_8
Ltmp155:
LBB2_12:
	;DEBUG_VALUE: e <- $d0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x8, x19
Ltmp156:
LBB2_13:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	subs	x9, x25, x8
	ldr	x24, [sp, #80]                  ; 8-byte Folded Reload
Ltmp157:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	b.ls	LBB2_22
Ltmp158:
; %bb.14:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	cmp	x9, #8
	b.lo	LBB2_19
Ltmp159:
; %bb.15:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #8                         ; =0x8
	.loc	0 168 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsl	x10, x10, x17
	cmp	x10, #64
	b.lo	LBB2_19
Ltmp160:
; %bb.16:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x12, #0                         ; =0x0
	.loc	0 168 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	and	x11, x9, #0xfffffffffffffff8
	add	x10, x8, x11
	movi.2d	v0, #0000000000000000
	mov	x13, x11
	ldr	x16, [sp, #96]                  ; 8-byte Folded Reload
Ltmp161:
LBB2_17:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	add	x14, x8, x12
Ltmp162:
	.loc	0 170 9 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:9 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	lsl	x14, x14, #3
	add	x15, x1, x14
	.loc	0 170 14 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	stp	q0, q0, [x15]
	stp	q0, q0, [x15, #32]
	.loc	0 170 21                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:21 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x14, x16, x14
	.loc	0 170 27                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	stp	q0, q0, [x14]
	stp	q0, q0, [x14, #32]
	add	x12, x12, #8
	subs	x13, x13, #8
	b.ne	LBB2_17
Ltmp163:
; %bb.18:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	cmp	x9, x11
	b.ne	LBB2_20
	b	LBB2_22
Ltmp164:
LBB2_19:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x10, x8
Ltmp165:
LBB2_20:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	sub	x8, x25, x10
Ltmp166:
	add	x9, x1, x10, lsl #3
Ltmp167:
LBB2_21:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 170 14                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	str	xzr, [x9]
	.loc	0 170 27 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	str	xzr, [x9, x27, lsl #3]
Ltmp168:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 168 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	add	x9, x9, #8
	subs	x8, x8, #1
Ltmp169:
	.loc	0 168 5 is_stmt 0               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:343:5 ]
	b.ne	LBB2_21
Ltmp170:
LBB2_22:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x19, x17
Ltmp171:
	.loc	0 344 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:344:5
	mov	x0, x24
	ldr	x21, [sp, #104]                 ; 8-byte Folded Reload
Ltmp172:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	mov	x2, x21
	mov	x3, x25
	mov	x4, x26
	str	x1, [sp, #88]                   ; 8-byte Folded Spill
	bl	_sd_fft_trunc
Ltmp173:
	.loc	0 331 58                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:331:58
	add	x0, x24, #440
	ldr	x1, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 345 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:345:5
	mov	x2, x21
	mov	x3, x25
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp174:
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	ldr	x1, [sp, #88]                   ; 8-byte Folded Reload
	lsl	x25, x27, #3
Ltmp175:
	mov	x21, x1
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
Ltmp176:
	.loc	0 347 9 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:347:9
	tbnz	w8, #0, LBB2_45
Ltmp177:
; %bb.23:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:9
	ldp	x17, x16, [sp, #32]             ; 16-byte Folded Reload
	add	x9, x17, #255
Ltmp178:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 340 13 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:340:13
	add	x21, x8, x25
Ltmp179:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 341 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:341:13
	add	x24, x21, x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
Ltmp180:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- undef
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	.loc	0 145 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:145:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	cmp	x16, #2
	b.lo	LBB2_33
Ltmp181:
; %bb.24:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 13 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:13
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 145 25                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:145:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	sub	x8, x8, #65
	udiv	x8, x8, x23
	add	x10, x8, #1
	cmp	x10, x17
	csinc	x8, x17, x8, hs
Ltmp182:
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	.loc	0 0 25                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:25
	mov	x0, x19
Ltmp183:
	.loc	0 146 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	cbz	x8, LBB2_27
Ltmp184:
; %bb.25:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x10, #0                         ; =0x0
	mov	x11, #0                         ; =0x0
Ltmp185:
LBB2_26:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x11
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_mul, DW_OP_stack_value] $x11, $x23
	;DEBUG_VALUE: _fft_small_np2_pack:w <- undef
	.loc	0 151 18 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:151:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	and	x12, x10, #0x3f
Ltmp186:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x12
	.loc	0 152 26                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:26 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsr	x13, x10, #6
	add	x13, x28, x13, lsl #3
	ldp	x14, x13, [x13]
	.loc	0 152 31 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:31 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsr	x14, x14, x10
	.loc	0 153 43 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:153:43 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	eor	x12, x12, #0x3f
Ltmp187:
	.loc	0 153 36 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:153:36 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsl	x12, x13, x12
	.loc	0 152 38 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:38 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	orr	x12, x14, x12, lsl #1
	.loc	0 153 58                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:153:58 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	and	x12, x12, x22
	.loc	0 152 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:152:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	ucvtf	d0, x12
Ltmp188:
	;DEBUG_VALUE: e <- $d0
	.loc	0 154 14                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:154:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	str	d0, [x21, x11, lsl #3]
	.loc	0 154 25 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:154:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	str	d0, [x24, x11, lsl #3]
Ltmp189:
	.loc	0 146 29 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:29 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	add	x11, x11, #1
Ltmp190:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x11
	.loc	0 146 19 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:19 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	add	x10, x10, x23
Ltmp191:
	.loc	0 146 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	cmp	x8, x11
	b.ne	LBB2_26
Ltmp192:
LBB2_27:
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 0                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0
	and	x19, x9, #0xffffffffffffff00
Ltmp193:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 156 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	subs	x9, x17, x8
	b.ls	LBB2_34
Ltmp194:
LBB2_28:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #64                        ; =0x40
	sub	x10, x10, x23
	mov	w11, #24                        ; =0x18
	.loc	0 156 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsl	x12, x8, #3
	madd	x11, x27, x11, x12
	add	x11, x1, x11
	add	x12, x12, x27, lsl #4
	add	x12, x1, x12
	mul	x8, x8, x23
Ltmp195:
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	b	LBB2_30
Ltmp196:
LBB2_29:                                ;   in Loop: Header=BB2_30 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	.loc	0 165 25 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:165:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	and	x13, x13, x22
Ltmp197:
	.loc	0 165 13 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:165:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	ucvtf	d0, x13
Ltmp198:
	;DEBUG_VALUE: e <- $d0
	.loc	0 166 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:166:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	str	d0, [x12], #8
	.loc	0 166 25 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:166:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	str	d0, [x11], #8
Ltmp199:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 156 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	add	x8, x8, x23
	subs	x9, x9, #1
Ltmp200:
	.loc	0 156 5 is_stmt 0               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	b.eq	LBB2_35
Ltmp201:
LBB2_30:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 160 17 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:160:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsr	x15, x8, #6
Ltmp202:
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x15
	.loc	0 161 18                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:161:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	and	x14, x8, #0x3f
Ltmp203:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x14
	.loc	0 162 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:162:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	ldr	x13, [x28, x15, lsl #3]
	.loc	0 162 18 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:162:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsr	x13, x13, x8
Ltmp204:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	.loc	0 163 28 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	cmp	x14, x10
	b.ls	LBB2_29
Ltmp205:
; %bb.31:                               ;   in Loop: Header=BB2_30 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 163 33 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:163:33 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	add	x15, x15, #1
Ltmp206:
	.loc	0 163 28                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	cmp	x15, x16
	b.hs	LBB2_29
Ltmp207:
; %bb.32:                               ;   in Loop: Header=BB2_30 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 164 18 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:164:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	ldr	x15, [x28, x15, lsl #3]
	.loc	0 164 27 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:164:27 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	neg	x14, x14
Ltmp208:
	lsl	x14, x15, x14
	.loc	0 164 15                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:164:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	orr	x13, x14, x13
Ltmp209:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	.loc	0 0 15                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:15
	b	LBB2_29
Ltmp210:
LBB2_33:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x8, #0                          ; =0x0
	mov	x0, x19
	and	x19, x9, #0xffffffffffffff00
Ltmp211:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 156 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	subs	x9, x17, x8
	b.hi	LBB2_28
Ltmp212:
LBB2_34:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 168 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	subs	x9, x19, x8
	b.hi	LBB2_36
	b	LBB2_44
Ltmp213:
LBB2_35:
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x8, x17
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
Ltmp214:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	subs	x9, x19, x17
	b.ls	LBB2_44
Ltmp215:
LBB2_36:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	cmp	x9, #8
	b.lo	LBB2_41
Ltmp216:
; %bb.37:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #8                         ; =0x8
	.loc	0 168 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsl	x10, x10, x0
	cmp	x10, #64
	b.lo	LBB2_41
Ltmp217:
; %bb.38:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x12, #0                         ; =0x0
	.loc	0 168 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	and	x11, x9, #0xfffffffffffffff8
	add	x10, x8, x11
	movi.2d	v0, #0000000000000000
	mov	x13, x11
Ltmp218:
LBB2_39:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	add	x14, x8, x12
Ltmp219:
	.loc	0 170 9 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:9 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsl	x14, x14, #3
	add	x15, x21, x14
	.loc	0 170 14 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	stp	q0, q0, [x15]
	stp	q0, q0, [x15, #32]
	.loc	0 170 21                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:21 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	add	x14, x24, x14
	.loc	0 170 27                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	stp	q0, q0, [x14]
	stp	q0, q0, [x14, #32]
	add	x12, x12, #8
	subs	x13, x13, #8
	b.ne	LBB2_39
Ltmp220:
; %bb.40:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	cmp	x9, x11
	b.ne	LBB2_42
	b	LBB2_44
Ltmp221:
LBB2_41:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	x10, x8
Ltmp222:
LBB2_42:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	sub	x8, x19, x10
Ltmp223:
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	mov	w9, #24                         ; =0x18
	.loc	0 168 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	lsl	x10, x10, #3
	madd	x9, x27, x9, x10
	add	x9, x1, x9
	add	x10, x10, x27, lsl #4
	add	x10, x1, x10
Ltmp224:
LBB2_43:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x23
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 170 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	str	xzr, [x10], #8
	.loc	0 170 27 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	str	xzr, [x9], #8
Ltmp225:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 168 14 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	subs	x8, x8, #1
Ltmp226:
	.loc	0 168 5 is_stmt 0               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:349:9 ]
	b.ne	LBB2_43
Ltmp227:
LBB2_44:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	.loc	0 0 5                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	ldr	x22, [sp, #80]                  ; 8-byte Folded Reload
	.loc	0 350 9 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:350:9
	mov	x0, x22
	mov	x1, x21
	ldr	x27, [sp, #104]                 ; 8-byte Folded Reload
Ltmp228:
	mov	x2, x27
	mov	x3, x19
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp229:
	.loc	0 331 58                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:331:58
	add	x0, x22, #440
Ltmp230:
	.loc	0 351 9                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:351:9
	mov	x1, x24
	mov	x24, x22
Ltmp231:
	mov	x2, x27
	mov	x3, x19
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp232:
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:9
	ldr	x1, [sp, #88]                   ; 8-byte Folded Reload
Ltmp233:
LBB2_45:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- undef
	;DEBUG_VALUE: k <- 0
	cbz	x26, LBB2_50
Ltmp234:
; %bb.46:
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: Q <- $x24
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	mov	x8, #0                          ; =0x0
Ltmp235:
	.file	6 ".deps/flint/src" "machine_vectors.h" md5 0x6bfd5c413c5e868bcddcf8e634130c6b
	.loc	6 1566 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:362:20 ] ] ]
	ldp	d0, d1, [x24]
Ltmp236:
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 88] [$sp+0]
	;DEBUG_VALUE: Y <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- 0
	.loc	0 364 9                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:364:9
	add	x9, x1, #32
	add	x10, x21, #32
Ltmp237:
LBB2_47:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: Y <- $x21
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 88] [$sp+0]
	;DEBUG_VALUE: Q <- $x24
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:45 ] ] ]
	ldp	q2, q3, [x9, #-32]
Ltmp238:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:45 ] ] ]
	ldp	q4, q5, [x9]
Ltmp239:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q4
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:366:45 ] ] ]
	ldp	q6, q7, [x10, #-32]
Ltmp240:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q6
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:366:45 ] ] ]
	ldp	q16, q17, [x10], #64
Ltmp241:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_mulmod:b <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q16
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] $q16
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q4
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v18, v2, v6
Ltmp242:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp243:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v19, v19
Ltmp244:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v20, v18
	fmls.2d	v20, v6, v2
Ltmp245:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v18, v19, v0[0]
Ltmp246:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v2, v18, v20
Ltmp247:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v6, v3, v7
Ltmp248:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v18, v6, v1[0]
Ltmp249:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v18, v18
Ltmp250:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v19, v6
Ltmp251:
	fmls.2d	v19, v7, v3
Ltmp252:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v6, v18, v0[0]
Ltmp253:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v3, v6, v19
Ltmp254:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_mulmod:b <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- $q16
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v6, v4, v16
Ltmp255:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp256:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp257:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v18, v6
Ltmp258:
	fmls.2d	v18, v16, v4
Ltmp259:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp260:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v4, v6, v18
Ltmp261:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v6, v5, v17
Ltmp262:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp263:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp264:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v16, v6
Ltmp265:
	fmls.2d	v16, v17, v5
Ltmp266:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp267:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v5, v6, v16
Ltmp268:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q4
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q4
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	.loc	6 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:13 ] ] ]
	stp	q2, q3, [x9, #-32]
Ltmp269:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	.loc	6 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:13 ] ] ]
	stp	q4, q5, [x9], #64
Ltmp270:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 88, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	.loc	0 364 32 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:364:32
	add	x8, x8, #8
Ltmp271:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	.loc	0 364 9 is_stmt 0               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:364:9
	cmp	x8, x26
	b.lo	LBB2_47
Ltmp272:
; %bb.48:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	;DEBUG_VALUE: Y <- $x21
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 88] [$sp+0]
	;DEBUG_VALUE: Q <- $x24
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: k <- 1
	;DEBUG_VALUE: Q <- undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	0 0 9                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:9
	mov	x8, #0                          ; =0x0
Ltmp273:
	.loc	6 1566 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:362:20 ] ] ]
	ldp	d0, d1, [x24, #440]
Ltmp274:
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: n8 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: ninv8 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: Y <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- 0
	.loc	0 364 9                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:364:9
	add	x10, x25, #32
	add	x9, x1, x10
	add	x10, x21, x10
Ltmp275:
LBB2_49:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: k <- 1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:45 ] ] ]
	ldp	q2, q3, [x9, #-32]
Ltmp276:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:45 ] ] ]
	ldp	q4, q5, [x9]
Ltmp277:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q4
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:366:45 ] ] ]
	ldp	q6, q7, [x10, #-32]
Ltmp278:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] undef
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q6
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:366:45 ] ] ]
	ldp	q16, q17, [x10], #64
Ltmp279:
	;DEBUG_VALUE: __ret <- $q16
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] undef
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_mulmod:b <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q16
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] $q16
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q4
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v18, v2, v6
Ltmp280:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp281:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v19, v19
Ltmp282:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v20, v18
	fmls.2d	v20, v6, v2
Ltmp283:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v18, v19, v0[0]
Ltmp284:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v2, v18, v20
Ltmp285:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v6, v3, v7
Ltmp286:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v18, v6, v1[0]
Ltmp287:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v18, v18
Ltmp288:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v19, v6
Ltmp289:
	fmls.2d	v19, v7, v3
Ltmp290:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v6, v18, v0[0]
Ltmp291:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v3, v6, v19
Ltmp292:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] $q17
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] $q16
	;DEBUG_VALUE: vec2d_mulmod:b <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- $q16
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v6, v4, v16
Ltmp293:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp294:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp295:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v18, v6
Ltmp296:
	fmls.2d	v18, v16, v4
Ltmp297:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp298:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v4, v6, v18
Ltmp299:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v6, v5, v17
Ltmp300:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp301:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp302:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	mov.16b	v16, v6
Ltmp303:
	fmls.2d	v16, v17, v5
Ltmp304:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp305:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:32 ] ] ] ]
	fsub.2d	v5, v6, v16
Ltmp306:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q4
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_store:a <- [DW_OP_LLVM_fragment 256 128] $q4
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	.loc	6 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:13 ] ] ]
	stp	q2, q3, [x9, #-32]
Ltmp307:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	.loc	6 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:365:13 ] ] ]
	stp	q4, q5, [x9], #64
Ltmp308:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 96, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	.loc	0 364 32 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:364:32
	add	x8, x8, #8
Ltmp309:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	.loc	0 364 9 is_stmt 0               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:364:9
	cmp	x8, x26
	b.lo	LBB2_49
Ltmp310:
LBB2_50:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 9                           ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:9
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	sub	x21, x8, #1
Ltmp311:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x21
	;DEBUG_VALUE: n_round_up:a <- $x21
	;DEBUG_VALUE: n_cdiv:a <- $x21
	.loc	0 369 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:369:5
	mov	x0, x24
	ldr	x22, [sp, #104]                 ; 8-byte Folded Reload
	mov	x2, x22
	mov	x3, x26
	bl	_sd_ifft_trunc
Ltmp312:
	.loc	0 331 58                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:331:58
	add	x0, x24, #440
	ldr	x1, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 370 5                         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:370:5
	mov	x2, x22
	mov	x3, x26
	bl	_sd_ifft_trunc
Ltmp313:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	ldr	x2, [sp, #64]                   ; 8-byte Folded Reload
Ltmp314:
	.loc	0 372 17 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:372:17
	cbnz	x2, LBB2_86
Ltmp315:
; %bb.51:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	cmp	x23, #63
	b.hi	LBB2_86
Ltmp316:
; %bb.52:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:navail8 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:Q1 <- undef
	.loc	0 0 17 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:17
	mov	x9, #0                          ; =0x0
	mov	x16, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
	mov	x0, #0                          ; =0x0
	mov	x1, #0                          ; =0x0
	mov	x2, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
Ltmp317:
	;DEBUG_VALUE: bf_np2_crt_tiled:R <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 88] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:nchunks <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:Q0 <- $x24
	.loc	0 255 26 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:255:26 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldp	d0, d1, [x24]
Ltmp318:
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	0 255 15 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:255:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	fcvtzu	x10, d0
Ltmp319:
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: vec8d_set_d:a <- $d0
	;DEBUG_VALUE: vec4d_set_d:a <- $d0
	;DEBUG_VALUE: vec2d_set_d:a <- $d0
	.loc	6 1566 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:256:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	dup.2d	v2, v0[0]
Ltmp320:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q2
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	0 257 30                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:257:30 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldp	d3, d4, [x24, #440]
Ltmp321:
	;DEBUG_VALUE: vec8d_set_d:a <- $d3
	;DEBUG_VALUE: vec4d_set_d:a <- $d3
	;DEBUG_VALUE: vec2d_set_d:a <- $d3
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	6 1566 12                       ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:257:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	dup.2d	v5, v3[0]
Ltmp322:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q5
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	0 258 25                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:258:25 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldr	d6, [x24, #5080]
	ucvtf	d6, d6
Ltmp323:
	;DEBUG_VALUE: vec8d_set_d:a <- $d6
	;DEBUG_VALUE: vec4d_set_d:a <- $d6
	;DEBUG_VALUE: vec2d_set_d:a <- $d6
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	0 0 25 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:25
	ldp	x26, x11, [sp, #96]             ; 16-byte Folded Reload
Ltmp324:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:depth <- $x11
	.loc	0 259 37 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:259:37 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x11, x24, x11, lsl #3
Ltmp325:
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:C <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:C <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:C <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:C <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	0 259 26 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:259:26 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldr	d7, [x11, #4568]
	ucvtf	d7, d7
Ltmp326:
	;DEBUG_VALUE: vec8d_set_d:a <- $d7
	;DEBUG_VALUE: vec4d_set_d:a <- $d7
	;DEBUG_VALUE: vec2d_set_d:a <- $d7
	.loc	0 260 26 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:260:26 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldr	d16, [x11, #4824]
	ldr	x24, [sp, #72]                  ; 8-byte Folded Reload
Ltmp327:
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	.loc	0 262 16                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:262:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x11, x24, #6
	udiv	x11, x11, x23
	add	x12, x11, #1
	cmp	x21, x12
	csinc	x11, x21, x11, lo
Ltmp328:
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- 0
	.loc	0 260 26                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:260:26 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ucvtf	d16, d16
Ltmp329:
	;DEBUG_VALUE: start <- 0
	;DEBUG_VALUE: vec8d_set_d:a <- $d16
	;DEBUG_VALUE: vec4d_set_d:a <- $d16
	;DEBUG_VALUE: vec2d_set_d:a <- $d16
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	0 274 10                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:274:10 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x12, x23, #3
	sub	x13, x29, #160
	add	x14, sp, #128
	mov	w15, #5                         ; =0x5
	ldr	x25, [sp, #88]                  ; 8-byte Folded Reload
Ltmp330:
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	.loc	0 0 10 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:10
	b	LBB2_56
Ltmp331:
LBB2_53:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x3
	;DEBUG_VALUE: tt <- $x5
	;DEBUG_VALUE: r1 <- $x4
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x16, #0                         ; =0x0
Ltmp332:
	.loc	0 295 46 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x6, [x20, x8, lsl #3]
Ltmp333:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp334:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
LBB2_54:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x3
	;DEBUG_VALUE: tt <- $x5
	;DEBUG_VALUE: r1 <- $x4
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 0 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	and	x3, x3, #0x3f
Ltmp335:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x3
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x6, x5, x10
Ltmp336:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x6
	;DEBUG_VALUE: vlo <- $x6
	umulh	x5, x5, x10
Ltmp337:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x5
	;DEBUG_VALUE: vhi <- $x5
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x4, x6, x4
Ltmp338:
	;DEBUG_VALUE: vlo <- $x4
	;DEBUG_VALUE: _carry <- undef
	cinc	x5, x5, hs
Ltmp339:
	;DEBUG_VALUE: vhi <- $x5
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x6, x4, x3
Ltmp340:
	;DEBUG_VALUE: x0 <- $x6
	eor	x7, x3, #0x3f
	lsr	x4, x4, x7
Ltmp341:
	lsl	x3, x5, x3
Ltmp342:
	orr	x4, x3, x4, lsr #1
Ltmp343:
	;DEBUG_VALUE: x1 <- $x4
	lsr	x3, x5, x7
	lsr	x5, x3, #1
Ltmp344:
	;DEBUG_VALUE: x2 <- $x5
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x3, x2, x6
	adcs	x2, x1, x4
Ltmp345:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- undef
	;DEBUG_VALUE: _carry <- undef
	adcs	x1, x0, x5
Ltmp346:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x0, x16, hs
Ltmp347:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
LBB2_55:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 46                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:46
	add	x9, x9, x12
	mov	x16, x17
	cmp	x17, x11
	b.hi	LBB2_87
Ltmp348:
LBB2_56:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_61 Depth 2
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: start <- $x16
	.loc	0 274 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:274:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	subs	x6, x11, x16
	b.ls	LBB2_87
Ltmp349:
; %bb.57:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 276 44                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:44 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x17, x16, #3
	add	x4, x25, x17
Ltmp350:
	;DEBUG_VALUE: vec8d_load:a <- $x4
	;DEBUG_VALUE: vec4d_load:a <- $x4
	;DEBUG_VALUE: vec2d_load:a <- $x4
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:31 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	ldp	q17, q18, [x4]
Ltmp351:
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x4
	;DEBUG_VALUE: __ret <- $q17
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x4
	;DEBUG_VALUE: __ret <- $q18
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q18
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:31 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	ldp	q19, q20, [x4, #32]
Ltmp352:
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x4
	;DEBUG_VALUE: __ret <- $q19
	;DEBUG_VALUE: __ret <- $q20
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q19
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q19
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q17
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v17, v7[0]
Ltmp353:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp354:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v22, v22
Ltmp355:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v23, v21
	fmls.2d	v23, v17, v7[0]
Ltmp356:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v22, v0[0]
Ltmp357:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v17, v21, v23
Ltmp358:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q17
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v18, v7[0]
Ltmp359:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp360:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v22, v22
Ltmp361:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v23, v21
Ltmp362:
	fmls.2d	v23, v18, v7[0]
Ltmp363:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v22, v0[0]
Ltmp364:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v18, v21, v23
Ltmp365:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q18
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q20
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v19, v7[0]
Ltmp366:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp367:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v22, v22
Ltmp368:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v23, v21
Ltmp369:
	fmls.2d	v23, v19, v7[0]
Ltmp370:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v22, v0[0]
Ltmp371:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v19, v21, v23
Ltmp372:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v20, v7[0]
Ltmp373:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v22, v21, v1[0]
Ltmp374:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v22, v22
Ltmp375:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v23, v21
Ltmp376:
	fmls.2d	v23, v20, v7[0]
Ltmp377:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v22, v0[0]
Ltmp378:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q23
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v20, v21, v23
Ltmp379:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q20
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q19
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 256 128] $q19
	.loc	0 277 44                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:44 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x17, x26, x17
Ltmp380:
	;DEBUG_VALUE: vec8d_load:a <- $x17
	;DEBUG_VALUE: vec4d_load:a <- $x17
	;DEBUG_VALUE: vec2d_load:a <- $x17
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:31 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	ldp	q21, q22, [x17]
Ltmp381:
	;DEBUG_VALUE: __ret <- $q21
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x17
	;DEBUG_VALUE: __ret <- $q22
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x17
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x17
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:31 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	ldp	q23, q24, [x17, #32]
Ltmp382:
	;DEBUG_VALUE: __ret <- $q23
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x17
	;DEBUG_VALUE: __ret <- $q24
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q23
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q23
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_mulmod:a <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v25, v21, v16[0]
Ltmp383:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v25, v4[0]
Ltmp384:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp385:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v25
	fmls.2d	v27, v21, v16[0]
Ltmp386:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v25, v26, v3[0]
Ltmp387:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v25, v25, v27
Ltmp388:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q25
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v22, v16[0]
Ltmp389:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v21, v4[0]
Ltmp390:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp391:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v21
Ltmp392:
	fmls.2d	v27, v22, v16[0]
Ltmp393:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v26, v3[0]
Ltmp394:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v22, v21, v27
Ltmp395:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q22
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q23
	;DEBUG_VALUE: vec2d_mulmod:a <- $q23
	;DEBUG_VALUE: vec2d_mul:a <- $q23
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q24
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v23, v16[0]
Ltmp396:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v21, v4[0]
Ltmp397:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp398:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v21
Ltmp399:
	fmls.2d	v27, v23, v16[0]
Ltmp400:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v26, v3[0]
Ltmp401:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v26, v21, v27
Ltmp402:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q26
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q24
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v21, v24, v16[0]
Ltmp403:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q21
	;DEBUG_VALUE: vec2d_mul:a <- $q21
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v23, v21, v4[0]
Ltmp404:
	;DEBUG_VALUE: vec2d_round:a <- $q23
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v23, v23
Ltmp405:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q24
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v21
Ltmp406:
	fmls.2d	v27, v24, v16[0]
Ltmp407:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q23
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q21
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v21, v23, v3[0]
Ltmp408:
	;DEBUG_VALUE: vec2d_sub:a <- $q21
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v24, v21, v27
Ltmp409:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q24
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q26
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 256 128] $q26
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 256 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 384 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q17
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q18
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q17
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q17
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v21, v17, v1[0]
Ltmp410:
	;DEBUG_VALUE: vec2d_round:a <- $q21
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v21, v21
Ltmp411:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q17
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v17, v21, v0[0]
Ltmp412:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q17
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v21, v17, #0.0
Ltmp413:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v23, v2, v17
Ltmp414:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bit.16b	v23, v17, v21
Ltmp415:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q18
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q18
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v17, v18, v1[0]
Ltmp416:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp417:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v18, v17, v0[0]
Ltmp418:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q18
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v17, v18, #0.0
Ltmp419:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v21, v2, v18
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bit.16b	v21, v18, v17
Ltmp420:
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v17, v19, v1[0]
Ltmp421:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp422:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v19, v17, v0[0]
Ltmp423:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v17, v19, #0.0
Ltmp424:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v18, v2, v19
Ltmp425:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bit.16b	v18, v19, v17
Ltmp426:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v17, v20, v1[0]
Ltmp427:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp428:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v20, v17, v0[0]
Ltmp429:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v17, v20, #0.0
Ltmp430:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v19, v2, v20
Ltmp431:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bsl.16b	v17, v20, v19
Ltmp432:
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 256 128] $q26
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q22
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q25
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q25
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v19, v25, v4[0]
Ltmp433:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp434:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v25, v19, v3[0]
Ltmp435:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q25
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v19, v25, #0.0
Ltmp436:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v20, v5, v25
Ltmp437:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bsl.16b	v19, v25, v20
Ltmp438:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q22
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q22
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v20, v22, v4[0]
Ltmp439:
	;DEBUG_VALUE: vec2d_round:a <- $q20
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v20, v20
Ltmp440:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v22, v20, v3[0]
Ltmp441:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q22
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v20, v22, #0.0
Ltmp442:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v25, v5, v22
Ltmp443:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bsl.16b	v20, v22, v25
Ltmp444:
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q26
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v22, v26, v4[0]
Ltmp445:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v22, v22
Ltmp446:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v26, v22, v3[0]
Ltmp447:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v22, v26, #0.0
Ltmp448:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v25, v5, v26
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bsl.16b	v22, v26, v25
Ltmp449:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v25, v24, v4[0]
Ltmp450:
	;DEBUG_VALUE: vec2d_round:a <- $q25
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v25, v25
Ltmp451:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q25
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q24
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v24, v25, v3[0]
Ltmp452:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v25, v24, #0.0
Ltmp453:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v26, v5, v24
Ltmp454:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bif.16b	v24, v26, v25
Ltmp455:
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_sub:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_sub:a <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fsub.2d	v19, v19, v23
Ltmp456:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q19
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	.loc	6 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fsub.2d	v20, v20, v21
Ltmp457:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q20
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fsub.2d	v22, v22, v18
Ltmp458:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	.loc	6 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fsub.2d	v24, v24, v17
Ltmp459:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q24
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 256 128] $q22
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 256 128] $q22
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_add:a <- $q19
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	6 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fadd.2d	v19, v5, v19
Ltmp460:
	;DEBUG_VALUE: vec4d_add:z1 <- $q19
	;DEBUG_VALUE: vec2d_add:a <- $q20
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	6 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fadd.2d	v20, v5, v20
Ltmp461:
	;DEBUG_VALUE: vec4d_add:z2 <- $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec2d_add:a <- $q22
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	6 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fadd.2d	v22, v5, v22
Ltmp462:
	;DEBUG_VALUE: vec4d_add:z1 <- $q22
	;DEBUG_VALUE: vec2d_add:a <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q5
	.loc	6 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ]
	fadd.2d	v24, v5, v24
Ltmp463:
	;DEBUG_VALUE: vec4d_add:z2 <- $q24
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 256 128] $q22
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q22
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q19
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v25, v19, v6[0]
Ltmp464:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v25, v4[0]
Ltmp465:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp466:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v25
Ltmp467:
	fmls.2d	v27, v19, v6[0]
Ltmp468:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v25, v26, v3[0]
Ltmp469:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v19, v25, v27
Ltmp470:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q19
	;DEBUG_VALUE: vec2d_mulmod:a <- $q20
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v25, v20, v6[0]
Ltmp471:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v25, v4[0]
Ltmp472:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp473:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v25
Ltmp474:
	fmls.2d	v27, v20, v6[0]
Ltmp475:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v25, v26, v3[0]
Ltmp476:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v20, v25, v27
Ltmp477:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q20
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q22
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q22
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v25, v22, v6[0]
Ltmp478:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q25
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v25, v4[0]
Ltmp479:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp480:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v25
Ltmp481:
	fmls.2d	v27, v22, v6[0]
Ltmp482:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v25, v26, v3[0]
Ltmp483:
	;DEBUG_VALUE: vec2d_sub:a <- $q25
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v25, v25, v27
Ltmp484:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q25
	;DEBUG_VALUE: vec2d_mulmod:a <- $q24
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q24
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v22, v24, v6[0]
Ltmp485:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q22
	;DEBUG_VALUE: vec2d_mul:a <- $q22
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmul.2d	v26, v22, v4[0]
Ltmp486:
	;DEBUG_VALUE: vec2d_round:a <- $q26
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	frintn.2d	v26, v26
Ltmp487:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	mov.16b	v27, v22
Ltmp488:
	fmls.2d	v27, v24, v6[0]
Ltmp489:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q22
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fmls.2d	v22, v26, v3[0]
Ltmp490:
	;DEBUG_VALUE: vec2d_sub:a <- $q22
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fsub.2d	v26, v22, v27
Ltmp491:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q26
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q26
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 384 128] $q26
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 384 128] $q26
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q25
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 256 128] $q25
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 256 128] $q25
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q19
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q20
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q19
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v22, v19, v4[0]
Ltmp492:
	;DEBUG_VALUE: vec2d_round:a <- $q22
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v22, v22
Ltmp493:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q22
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q19
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v19, v22, v3[0]
Ltmp494:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q19
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v22, v19, #0.0
Ltmp495:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v24, v5, v19
Ltmp496:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bit.16b	v24, v19, v22
Ltmp497:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q20
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v19, v20, v4[0]
Ltmp498:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp499:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q20
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v20, v19, v3[0]
Ltmp500:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q20
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v19, v20, #0.0
Ltmp501:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v22, v5, v20
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bit.16b	v22, v20, v19
Ltmp502:
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q25
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q26
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q25
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q25
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q25
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v19, v25, v4[0]
Ltmp503:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp504:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q25
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v25, v19, v3[0]
Ltmp505:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q25
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v19, v25, #0.0
Ltmp506:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v20, v5, v25
Ltmp507:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bit.16b	v20, v25, v19
Ltmp508:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q26
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmul.2d	v19, v26, v4[0]
Ltmp509:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	frintn.2d	v19, v19
Ltmp510:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q26
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ] ]
	fmls.2d	v26, v19, v3[0]
Ltmp511:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q26
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fcmge.2d	v19, v26, #0.0
Ltmp512:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	fadd.2d	v25, v5, v26
Ltmp513:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ] ] ] ] ]
	bsl.16b	v19, v26, v25
Ltmp514:
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: rd <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: rd <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: rd <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: rd <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: td <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: td <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: td <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: td <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	0 284 15 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:284:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	fcvtzu	x7, d23
	.loc	0 284 35 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:284:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	fcvtzu	x19, d24
	.loc	0 284 14                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:284:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	x7, [x29, #-160]
	.loc	0 284 34                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:284:34 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x19, [sp, #128]
	.loc	0 285 15 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:285:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ext.16b	v25, v23, v21, #8
	fcvtzu.2d	v25, v25
	.loc	0 285 14 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:285:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	q25, [x29, #-152]
	.loc	0 285 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:285:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ext.16b	v25, v24, v22, #8
	fcvtzu.2d	v25, v25
	.loc	0 285 34                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:285:34 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	q25, [sp, #136]
	.loc	0 287 15 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:287:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ext.16b	v25, v21, v18, #8
	fcvtzu.2d	v25, v25
	.loc	0 287 14 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:287:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	q25, [x29, #-136]
	.loc	0 287 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:287:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ext.16b	v25, v22, v20, #8
	fcvtzu.2d	v25, v25
	.loc	0 287 34                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:287:34 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	q25, [sp, #152]
	.loc	0 289 15 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:289:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ext.16b	v25, v18, v17, #8
	fcvtzu.2d	v25, v25
	.loc	0 289 14 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:289:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	q25, [x29, #-120]
	.loc	0 289 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:289:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ext.16b	v25, v20, v19, #8
	fcvtzu.2d	v25, v25
	.loc	0 289 34                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:289:34 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	q25, [sp, #168]
	.loc	0 291 22 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:291:22 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mov	d25, v17[1]
	.loc	0 291 15 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:291:15 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	fcvtzu	x4, d25
Ltmp515:
	.loc	0 291 14                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:291:14 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	stur	x4, [x29, #-104]
	.loc	0 291 42                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:291:42 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mov	d25, v19[1]
	.loc	0 291 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:291:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	fcvtzu	x5, d25
	.loc	0 291 34                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:291:34 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x5, [sp, #184]
Ltmp516:
	.loc	0 292 18 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:292:18 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x17, x16, #8
Ltmp517:
	.loc	0 292 20 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:292:20 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x17, x11
	b.ls	LBB2_63
Ltmp518:
; %bb.58:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q26
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_sub:b <- $q27
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:l <- $q27
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_add:b <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_add:b <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q5
	;DEBUG_VALUE: vec2d_mulmod:n <- $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 20                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:20
	mov	x16, #0                         ; =0x0
Ltmp519:
	mov	x4, x9
	;DEBUG_VALUE: k <- 0
	b	LBB2_61
Ltmp520:
LBB2_59:                                ;   in Loop: Header=BB2_61 Depth=2
	;DEBUG_VALUE: k <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x5, #0                          ; =0x0
Ltmp521:
	.loc	0 299 48 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x3, [x20, x8, lsl #3]
Ltmp522:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp523:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
LBB2_60:                                ;   in Loop: Header=BB2_61 Depth=2
	;DEBUG_VALUE: k <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 0 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldr	x3, [x13, x16, lsl #3]
	ldr	x7, [x14, x16, lsl #3]
	and	x19, x4, #0x3f
Ltmp524:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x5
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: r1 <- $x3
	;DEBUG_VALUE: tt <- $x7
	;DEBUG_VALUE: sh <- $x19
	.loc	0 299 48                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x7, x10
Ltmp525:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x7, x7, x10
Ltmp526:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x7
	;DEBUG_VALUE: vhi <- $x7
	.loc	0 299 48                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x3, x21, x3
Ltmp527:
	;DEBUG_VALUE: vlo <- $x3
	;DEBUG_VALUE: _carry <- undef
	cinc	x7, x7, hs
Ltmp528:
	;DEBUG_VALUE: vhi <- $x7
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 299 48                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x3, x19
Ltmp529:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x19, #0x3f
	lsr	x3, x3, x22
Ltmp530:
	lsl	x19, x7, x19
Ltmp531:
	orr	x19, x19, x3, lsr #1
Ltmp532:
	;DEBUG_VALUE: x1 <- $x19
	lsr	x3, x7, x22
	lsr	x7, x3, #1
Ltmp533:
	;DEBUG_VALUE: x2 <- $x7
	.loc	0 299 48                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x3, x2, x21
	adcs	x2, x1, x19
Ltmp534:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- undef
	;DEBUG_VALUE: _carry <- undef
	adcs	x1, x0, x7
Ltmp535:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x0, x5, hs
Ltmp536:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	.loc	0 299 42                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:42 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x16, x16, #1
Ltmp537:
	;DEBUG_VALUE: k <- $x16
	.loc	0 299 29                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:29 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x4, x4, x23
Ltmp538:
	.loc	0 299 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x16, x6
	b.hs	LBB2_55
Ltmp539:
LBB2_61:                                ;   Parent Loop BB2_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: k <- $x16
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_stack_value] undef
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 299 48 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x4, lsr #6
	b.lo	LBB2_59
Ltmp540:
; %bb.62:                               ;   in Loop: Header=BB2_61 Depth=2
	;DEBUG_VALUE: k <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 48 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:48
	mov	x5, x0
	mov	x0, x1
Ltmp541:
	mov	x1, x2
Ltmp542:
	mov	x2, x3
Ltmp543:
	.loc	0 299 48                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:299:48 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	b	LBB2_60
Ltmp544:
LBB2_63:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: r1 <- $x7
	;DEBUG_VALUE: tt <- $x19
	.loc	0 294 13 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x16, x23
Ltmp545:
	;DEBUG_VALUE: pos <- $x21
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 294 13 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x21, lsr #6
	b.hs	LBB2_65
Ltmp546:
; %bb.64:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x21
	;DEBUG_VALUE: tt <- $x19
	;DEBUG_VALUE: r1 <- $x7
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 13                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:13
	mov	x6, #0                          ; =0x0
Ltmp547:
	.loc	0 294 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x3, [x20, x8, lsl #3]
Ltmp548:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp549:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 13                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:13
	b	LBB2_66
Ltmp550:
LBB2_65:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x21
	;DEBUG_VALUE: tt <- $x19
	;DEBUG_VALUE: r1 <- $x7
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x6, x0
	mov	x0, x1
Ltmp551:
	mov	x1, x2
Ltmp552:
	mov	x2, x3
Ltmp553:
LBB2_66:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x21
	;DEBUG_VALUE: tt <- $x19
	;DEBUG_VALUE: r1 <- $x7
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	and	x3, x21, #0x38
Ltmp554:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x3
	.loc	0 294 13 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp555:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp556:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 294 13 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp557:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp558:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 294 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x3
Ltmp559:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x3, #0x3f
	lsr	x7, x7, x22
Ltmp560:
	lsl	x3, x19, x3
Ltmp561:
	orr	x3, x3, x7, lsr #1
Ltmp562:
	;DEBUG_VALUE: x1 <- $x3
	lsr	x7, x19, x22
	lsr	x19, x7, #1
Ltmp563:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 294 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x2, x21
	adcs	x1, x1, x3
Ltmp564:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: _carry <- undef
	adcs	x0, x0, x19
Ltmp565:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x2, x6, hs
Ltmp566:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x2
	.loc	0 294 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x3, x16, #0x1
Ltmp567:
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	mul	x6, x3, x23
Ltmp568:
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 294 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x6, lsr #6
	b.hs	LBB2_68
Ltmp569:
; %bb.67:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 24                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:24
	mov	x3, #0                          ; =0x0
Ltmp570:
	.loc	0 294 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x7, [x20, x8, lsl #3]
Ltmp571:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp572:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 24                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:24
	b	LBB2_69
Ltmp573:
LBB2_68:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: x2 <- $x19
	;DEBUG_VALUE: x0 <- $x21
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x3, x2
	mov	x2, x0
Ltmp574:
	mov	x0, x1
	mov	x1, x7
Ltmp575:
LBB2_69:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	d23, v23[1]
	mov	d24, v24[1]
	fcvtzu	x7, d23
	fcvtzu	x19, d24
	and	x6, x6, #0x3f
Ltmp576:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x6
	.loc	0 294 24 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp577:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp578:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 294 24 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp579:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp580:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 294 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x6
Ltmp581:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x6, #0x3f
	lsr	x7, x7, x22
Ltmp582:
	lsl	x6, x19, x6
Ltmp583:
	orr	x6, x6, x7, lsr #1
Ltmp584:
	;DEBUG_VALUE: x1 <- $x6
	lsr	x7, x19, x22
	lsr	x19, x7, #1
Ltmp585:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 294 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x1, x21
	adcs	x0, x0, x6
Ltmp586:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: _carry <- undef
	adcs	x2, x2, x19
Ltmp587:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x1, x3, hs
Ltmp588:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	.loc	0 294 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x3, x16, #0x2
Ltmp589:
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	mul	x6, x3, x23
Ltmp590:
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 294 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x6, lsr #6
	b.hs	LBB2_71
Ltmp591:
; %bb.70:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 35                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:35
	mov	x3, #0                          ; =0x0
Ltmp592:
	.loc	0 294 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x7, [x20, x8, lsl #3]
Ltmp593:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp594:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 35                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:35
	b	LBB2_72
Ltmp595:
LBB2_71:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: x2 <- $x19
	;DEBUG_VALUE: x0 <- $x21
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x3, x1
	mov	x1, x2
Ltmp596:
	mov	x2, x0
	mov	x0, x7
Ltmp597:
LBB2_72:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	fcvtzu	x7, d21
	fcvtzu	x19, d22
	and	x6, x6, #0x3e
Ltmp598:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x6
	.loc	0 294 35 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp599:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp600:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 294 35 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp601:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp602:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 294 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x6
Ltmp603:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x6, #0x3f
	lsr	x7, x7, x22
Ltmp604:
	lsl	x6, x19, x6
Ltmp605:
	orr	x6, x6, x7, lsr #1
Ltmp606:
	;DEBUG_VALUE: x1 <- $x6
	lsr	x7, x19, x22
	lsr	x19, x7, #1
Ltmp607:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 294 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x0, x21
	adcs	x0, x2, x6
Ltmp608:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: _carry <- undef
	adcs	x2, x1, x19
Ltmp609:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x1, x3, hs
Ltmp610:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	.loc	0 294 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x3, x16, #0x3
Ltmp611:
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	mul	x6, x3, x23
Ltmp612:
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 294 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x6, lsr #6
	b.hs	LBB2_74
Ltmp613:
; %bb.73:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 46                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:46
	mov	x3, #0                          ; =0x0
Ltmp614:
	.loc	0 294 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x7, [x20, x8, lsl #3]
Ltmp615:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp616:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 46                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:46
	b	LBB2_75
Ltmp617:
LBB2_74:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: x2 <- $x19
	;DEBUG_VALUE: x0 <- $x21
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x3, x1
	mov	x1, x2
Ltmp618:
	mov	x2, x0
	mov	x0, x7
Ltmp619:
LBB2_75:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	d21, v21[1]
	mov	d22, v22[1]
	fcvtzu	x7, d21
	fcvtzu	x19, d22
	and	x6, x6, #0x3f
Ltmp620:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x6
	.loc	0 294 46 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp621:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp622:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 294 46 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp623:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp624:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 294 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x6
Ltmp625:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x6, #0x3f
	lsr	x7, x7, x22
Ltmp626:
	lsl	x6, x19, x6
Ltmp627:
	orr	x6, x6, x7, lsr #1
Ltmp628:
	;DEBUG_VALUE: x1 <- $x6
	lsr	x7, x19, x22
	lsr	x19, x7, #1
Ltmp629:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 294 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:294:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x0, x21
	adcs	x0, x2, x6
Ltmp630:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: _carry <- undef
	adcs	x2, x1, x19
Ltmp631:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x1, x3, hs
Ltmp632:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	.loc	0 295 13 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x3, x16, #0x4
Ltmp633:
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	mul	x6, x3, x23
Ltmp634:
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 295 13 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x6, lsr #6
	b.hs	LBB2_77
Ltmp635:
; %bb.76:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 13                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:13
	mov	x3, #0                          ; =0x0
Ltmp636:
	.loc	0 295 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x7, [x20, x8, lsl #3]
Ltmp637:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp638:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 13                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:13
	b	LBB2_78
Ltmp639:
LBB2_77:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: x2 <- $x19
	;DEBUG_VALUE: x0 <- $x21
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x3, x1
	mov	x1, x2
Ltmp640:
	mov	x2, x0
	mov	x0, x7
Ltmp641:
LBB2_78:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	fcvtzu	x7, d18
	fcvtzu	x19, d20
	and	x6, x6, #0x3c
Ltmp642:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x6
	.loc	0 295 13 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp643:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp644:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 295 13 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp645:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp646:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 295 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x6
Ltmp647:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x6, #0x3f
	lsr	x7, x7, x22
Ltmp648:
	lsl	x6, x19, x6
Ltmp649:
	orr	x6, x6, x7, lsr #1
Ltmp650:
	;DEBUG_VALUE: x1 <- $x6
	lsr	x7, x19, x22
	lsr	x19, x7, #1
Ltmp651:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 295 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x0, x21
	adcs	x0, x2, x6
Ltmp652:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: _carry <- undef
	adcs	x2, x1, x19
Ltmp653:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x1, x3, hs
Ltmp654:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	.loc	0 295 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x3, x16, x15
Ltmp655:
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	mul	x6, x3, x23
Ltmp656:
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 295 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x6, lsr #6
	b.hs	LBB2_80
Ltmp657:
; %bb.79:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 24                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:24
	mov	x3, #0                          ; =0x0
Ltmp658:
	.loc	0 295 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x7, [x20, x8, lsl #3]
Ltmp659:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp660:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 24                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:24
	b	LBB2_81
Ltmp661:
LBB2_80:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: x2 <- $x19
	;DEBUG_VALUE: x0 <- $x21
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x3, x1
	mov	x1, x2
Ltmp662:
	mov	x2, x0
	mov	x0, x7
Ltmp663:
LBB2_81:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	d18, v18[1]
	mov	d20, v20[1]
	fcvtzu	x7, d18
	fcvtzu	x19, d20
	and	x6, x6, #0x3f
Ltmp664:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x6
	.loc	0 295 24 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp665:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp666:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 295 24 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp667:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp668:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 295 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x6
Ltmp669:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x6, #0x3f
	lsr	x7, x7, x22
Ltmp670:
	lsl	x6, x19, x6
Ltmp671:
	orr	x6, x6, x7, lsr #1
Ltmp672:
	;DEBUG_VALUE: x1 <- $x6
	lsr	x7, x19, x22
	lsr	x19, x7, #1
Ltmp673:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 295 24                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:24 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x0, x21
	adcs	x0, x2, x6
Ltmp674:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: _carry <- undef
	adcs	x2, x1, x19
Ltmp675:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x1, x3, hs
Ltmp676:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	.loc	0 295 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x3, x16, #0x6
Ltmp677:
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: r1 <- undef
	;DEBUG_VALUE: tt <- undef
	mul	x6, x3, x23
Ltmp678:
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 295 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x6, lsr #6
	b.hs	LBB2_83
Ltmp679:
; %bb.82:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 35                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:35
	mov	x3, #0                          ; =0x0
Ltmp680:
	.loc	0 295 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x7, [x20, x8, lsl #3]
Ltmp681:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	add	x8, x8, #1
Ltmp682:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 0 35                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:35
	b	LBB2_84
Ltmp683:
LBB2_83:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: j <- $x3
	;DEBUG_VALUE: x2 <- $x19
	;DEBUG_VALUE: x0 <- $x21
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x7
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x3, x1
	mov	x1, x2
Ltmp684:
	mov	x2, x0
	mov	x0, x7
Ltmp685:
LBB2_84:                                ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x6
	;DEBUG_VALUE: start <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	fcvtzu	x7, d17
	fcvtzu	x19, d19
	and	x6, x6, #0x3e
Ltmp686:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: sh <- $x6
	.loc	0 295 35 is_stmt 1              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	mul	x21, x19, x10
Ltmp687:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x21
	;DEBUG_VALUE: vlo <- $x21
	umulh	x19, x19, x10
Ltmp688:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x19
	;DEBUG_VALUE: vhi <- $x19
	.loc	0 295 35 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x7, x21, x7
Ltmp689:
	;DEBUG_VALUE: vlo <- $x7
	;DEBUG_VALUE: _carry <- undef
	cinc	x19, x19, hs
Ltmp690:
	;DEBUG_VALUE: vhi <- $x19
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 295 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	lsl	x21, x7, x6
Ltmp691:
	;DEBUG_VALUE: x0 <- $x21
	eor	x22, x6, #0x3f
	lsr	x7, x7, x22
Ltmp692:
	lsl	x6, x19, x6
Ltmp693:
	orr	x7, x6, x7, lsr #1
Ltmp694:
	;DEBUG_VALUE: x1 <- $x7
	lsr	x6, x19, x22
	lsr	x19, x6, #1
Ltmp695:
	;DEBUG_VALUE: x2 <- $x19
	.loc	0 295 35                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:35 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	adds	x6, x0, x21
	adcs	x2, x2, x7
Ltmp696:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x6
	;DEBUG_VALUE: _carry <- undef
	adcs	x1, x1, x19
Ltmp697:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x0, x3, hs
Ltmp698:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	orr	x16, x16, #0x7
Ltmp699:
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: r1 <- $x4
	;DEBUG_VALUE: tt <- $x5
	mul	x3, x16, x23
Ltmp700:
	;DEBUG_VALUE: pos <- $x3
	;DEBUG_VALUE: w <- undef
	;DEBUG_VALUE: sh <- undef
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x3, lsr #6
	b.lo	LBB2_53
Ltmp701:
; %bb.85:                               ;   in Loop: Header=BB2_56 Depth=1
	;DEBUG_VALUE: pos <- $x3
	;DEBUG_VALUE: tt <- $x5
	;DEBUG_VALUE: r1 <- $x4
	;DEBUG_VALUE: j <- $x16
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 46                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:46
	mov	x16, x0
Ltmp702:
	mov	x0, x1
Ltmp703:
	mov	x1, x2
	mov	x2, x6
	.loc	0 295 46                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:295:46 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	b	LBB2_54
Ltmp704:
LBB2_86:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 104] [$sp+0]
	.loc	0 0 46                          ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:46
	ldp	x5, x8, [sp, #96]               ; 16-byte Folded Reload
Ltmp705:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x8
	.loc	0 375 9 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:375:9
	stp	x23, x8, [sp]
	mov	x0, x24
	mov	x1, x20
	ldr	x3, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x4, [sp, #88]                   ; 8-byte Folded Reload
	mov	x6, x21
	mov	x7, x26
	bl	__fft_small_np2_crt_recompose
Ltmp706:
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:9
	b	LBB2_92
Ltmp707:
LBB2_87:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 304 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:304:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x8, x24
	b.hs	LBB2_92
Ltmp708:
; %bb.88:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x3
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x8
	.loc	0 306 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x9, x8, #1
Ltmp709:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 306 16 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x3, [x20, x8, lsl #3]
Ltmp710:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	.loc	0 304 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:304:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x9, x24
	b.eq	LBB2_92
Ltmp711:
; %bb.89:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 306 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x10, x8, #2
Ltmp712:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	.loc	0 306 16 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x2, [x20, x9, lsl #3]
Ltmp713:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	.loc	0 304 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:304:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x10, x24
	b.eq	LBB2_92
Ltmp714:
; %bb.90:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x1
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	.loc	0 306 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x9, x8, #3
Ltmp715:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 306 16 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x1, [x20, x10, lsl #3]
Ltmp716:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	.loc	0 304 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:304:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x9, x24
	b.eq	LBB2_92
Ltmp717:
; %bb.91:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 306 13                        ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:13 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x10, x8, #4
Ltmp718:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	.loc	0 306 16 is_stmt 0              ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	str	x0, [x20, x9, lsl #3]
Ltmp719:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	.loc	0 304 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:304:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	cmp	x10, x24
	b.ne	LBB2_94
Ltmp720:
LBB2_92:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:5
	ldur	x8, [x29, #-96]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB2_96
Ltmp721:
; %bb.93:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 377 1 epilogue_begin is_stmt 1 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:377:1
	ldp	x29, x30, [sp, #352]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #336]            ; 16-byte Folded Reload
Ltmp722:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_LLVM_entry_value 1] $x1
	ldp	x22, x21, [sp, #320]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #304]            ; 16-byte Folded Reload
Ltmp723:
	ldp	x26, x25, [sp, #288]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #272]            ; 16-byte Folded Reload
Ltmp724:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	add	sp, sp, #368
Ltmp725:
	ret
Ltmp726:
LBB2_94:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 1 is_stmt 0                 ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:1
	ldur	x9, [x29, #-96]
Lloh6:
	adrp	x10, ___stack_chk_guard@GOTPAGE
Lloh7:
	ldr	x10, [x10, ___stack_chk_guard@GOTPAGEOFF]
Lloh8:
	ldr	x10, [x10]
	cmp	x10, x9
	b.ne	LBB2_96
Ltmp727:
; %bb.95:
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- $x26
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- $x25
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q5
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- $x23
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	add	x9, x20, x8, lsl #3
	sub	x8, x24, x8
	lsl	x8, x8, #3
	sub	x1, x8, #32
	.loc	0 304 5 is_stmt 1               ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:304:5 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	add	x0, x9, #32
Ltmp728:
	.loc	0 306 16 epilogue_begin         ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:306:16 @[ .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:373:9 ]
	ldp	x29, x30, [sp, #352]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #336]            ; 16-byte Folded Reload
Ltmp729:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_LLVM_entry_value 1] $x1
	ldp	x22, x21, [sp, #320]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #304]            ; 16-byte Folded Reload
Ltmp730:
	ldp	x26, x25, [sp, #288]            ; 16-byte Folded Reload
Ltmp731:
	ldp	x28, x27, [sp, #272]            ; 16-byte Folded Reload
Ltmp732:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	add	sp, sp, #368
Ltmp733:
	b	_bzero
Ltmp734:
LBB2_96:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 96] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 80] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 52, DW_OP_deref_size 4, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 40] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 32] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 72] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 16 is_stmt 0                ; .deps/experiments/ablation-scalar-conversion/src/fft_small/mpn_mul_np2.c:0:16
	bl	___stack_chk_fail
Ltmp735:
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.loh AdrpLdrGotLdr	Lloh6, Lloh7, Lloh8
Lfunc_end2:
	.cfi_endproc
