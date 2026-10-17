__mpn_ctx_mpn_mul_window_np2:           ; @_mpn_ctx_mpn_mul_window_np2
Lfunc_begin2:
	.loc	0 298 0                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:298:0
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
	sub	sp, sp, #480
	stp	x28, x27, [sp, #384]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #400]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #416]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #432]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #448]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #464]            ; 16-byte Folded Spill
	add	x29, sp, #464
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
	mov	x23, x7
Ltmp91:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- $x23
	mov	x28, x6
Ltmp92:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x21, x5
Ltmp93:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	mov	x24, x4
Ltmp94:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	str	x3, [sp, #24]                   ; 8-byte Folded Spill
Ltmp95:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	str	x2, [sp, #176]                  ; 8-byte Folded Spill
Ltmp96:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	str	x1, [sp, #192]                  ; 8-byte Folded Spill
Ltmp97:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	mov	x20, x0
Ltmp98:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- $x20
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-96]
Ltmp99:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zn <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 232, DW_OP_deref] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- [DW_OP_plus_uconst 224, DW_OP_deref] $sp
	mov	w22, #1                         ; =0x1
Ltmp100:
	.loc	0 305 18 prologue_end           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:305:18
	add	x4, sp, #232
	add	x5, sp, #224
	mov	x1, x21
	mov	x2, x7
	mov	w3, #1                          ; =0x1
	bl	__fft_small_np2_choose
Ltmp101:
	;DEBUG_VALUE: ok <- undef
	.loc	0 309 16                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:309:16
	lsl	x25, x21, #6
	.loc	0 309 23 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:309:23
	ldr	x26, [sp, #232]
Ltmp102:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x26
	.loc	0 309 21                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:309:21
	sub	x8, x26, #1
	.loc	0 309 28                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:309:28
	add	x9, x8, x25
	.loc	0 309 33                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:309:33
	udiv	x19, x9, x26
Ltmp103:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	.loc	0 310 16 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:310:16
	lsl	x9, x23, #6
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	.loc	0 310 28 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:310:28
	add	x8, x8, x9
	.loc	0 310 33                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:310:33
	udiv	x8, x8, x26
Ltmp104:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- $x8
	.loc	0 0 33                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:33
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
Ltmp105:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	.loc	0 311 17 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:311:17
	add	x8, x8, x19
Ltmp106:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: n_round_up:a <- $x19
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- $x19
	;DEBUG_VALUE: n_cdiv:b <- 256
	.file	5 ".deps/flint/src" "fft_small.h" md5 0x44ba70fc45bdb60a6adc33bc1fb33a25
	.loc	5 72 19                         ; .deps/flint/src/fft_small.h:72:19 @[ .deps/flint/src/fft_small.h:77:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:312:17 ] ]
	add	x9, x19, #255
Ltmp107:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- undef
	;DEBUG_VALUE: n_round_up:a <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	.loc	5 0 19 is_stmt 0                ; .deps/flint/src/fft_small.h:0:19
	str	x8, [sp, #160]                  ; 8-byte Folded Spill
Ltmp108:
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:b <- 256
	.loc	5 72 19                         ; .deps/flint/src/fft_small.h:72:19 @[ .deps/flint/src/fft_small.h:77:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:314:17 ] ]
	add	x8, x8, #254
Ltmp109:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- undef
	.loc	5 0 19                          ; .deps/flint/src/fft_small.h:0:19
	stp	x8, x9, [sp, #208]              ; 16-byte Folded Spill
Ltmp110:
	.loc	0 315 18 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:315:18
	cmp	x24, x28
	cset	w8, eq
	str	x23, [sp, #128]                 ; 8-byte Folded Spill
Ltmp111:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	.loc	0 315 23 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:315:23
	cmp	x21, x23
	cset	w9, eq
	.loc	0 323 46 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:323:46
	ands	w8, w8, w9
Ltmp112:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $w8
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q1 <- undef
	.loc	0 0 46 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:46
	str	w8, [sp, #144]                  ; 4-byte Folded Spill
Ltmp113:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	.loc	0 317 38 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:317:38
	ldr	x8, [sp, #224]
Ltmp114:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x8
	.loc	0 0 38 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:38
	mov	x23, x8
Ltmp115:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x23
	;DEBUG_VALUE: sd_fft_ctx_data_size:L <- $x23
	;DEBUG_VALUE: n_pow2:k <- $x23
	.loc	5 56 21 is_stmt 1               ; .deps/flint/src/fft_small.h:56:21 @[ .deps/flint/src/fft_small.h:240:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:317:17 ] ]
	lsl	x27, x22, x8
Ltmp116:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	.loc	0 323 46                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:323:46
	cinc	x8, x22, eq
	lsl	x8, x27, x8
	.loc	0 323 52 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:323:52
	lsl	x1, x8, #3
	str	x20, [sp, #64]                  ; 8-byte Folded Spill
Ltmp117:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	.loc	0 323 10                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:323:10
	mov	x0, x20
	bl	_mpn_ctx_fit_buffer
Ltmp118:
	mov	x16, x0
Ltmp119:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	.loc	0 0 10                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:10
	mov	x15, x26
Ltmp120:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	.loc	0 324 13 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:324:13
	add	x14, x0, x27, lsl #3
Ltmp121:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	.loc	0 0 13 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:13
	mov	x8, #-1                         ; =0xffffffffffffffff
Ltmp122:
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- undef
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	.loc	0 143 37 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:143:37 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsl	x8, x8, x26
	mvn	x22, x8
Ltmp123:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	.loc	0 145 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:145:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	cmp	x21, #2
	b.lo	LBB2_4
Ltmp124:
; %bb.1:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 145 25 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:145:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	sub	x8, x25, #65
	udiv	x8, x8, x15
	add	x9, x8, #1
	cmp	x9, x19
	csinc	x8, x19, x8, hs
Ltmp125:
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	.loc	0 0 25                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:25
	mov	x20, x23
Ltmp126:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	.loc	0 146 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	cbz	x8, LBB2_5
Ltmp127:
; %bb.2:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x9, #0                          ; =0x0
	mov	x10, #0                         ; =0x0
Ltmp128:
LBB2_3:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x10
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_mul, DW_OP_stack_value] $x10, $x15
	;DEBUG_VALUE: _fft_small_np2_pack:w <- undef
	.loc	0 151 18 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:151:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	and	x11, x9, #0x3f
Ltmp129:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x11
	.loc	0 152 26                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:26 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsr	x12, x9, #6
	add	x12, x24, x12, lsl #3
	ldp	x13, x12, [x12]
	.loc	0 152 31 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:31 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsr	x13, x13, x9
	.loc	0 153 43 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:153:43 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	eor	x11, x11, #0x3f
Ltmp130:
	.loc	0 153 36 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:153:36 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsl	x11, x12, x11
	.loc	0 152 38 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:38 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	orr	x11, x13, x11, lsl #1
	.loc	0 153 58                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:153:58 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	and	x11, x11, x22
	.loc	0 152 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	ucvtf	d0, x11
Ltmp131:
	;DEBUG_VALUE: e <- $d0
	.loc	0 154 14                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:154:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	str	d0, [x16, x10, lsl #3]
	.loc	0 154 25 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:154:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	str	d0, [x14, x10, lsl #3]
Ltmp132:
	.loc	0 146 29 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:29 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x10, x10, #1
Ltmp133:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x10
	.loc	0 146 19 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:19 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x9, x9, x15
Ltmp134:
	.loc	0 146 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	cmp	x8, x10
	b.ne	LBB2_3
	b	LBB2_5
Ltmp135:
LBB2_4:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: n_pow2:k <- $x23
	;DEBUG_VALUE: sd_fft_ctx_data_size:L <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x23
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_round_up:a <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: n_cdiv:b <- 256
	;DEBUG_VALUE: n_cdiv:a <- $x19
	;DEBUG_VALUE: n_round_up:b <- 256
	;DEBUG_VALUE: n_round_up:a <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x8, #0                          ; =0x0
	mov	x20, x23
Ltmp136:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
LBB2_5:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	ldp	x9, x10, [sp, #208]             ; 16-byte Folded Reload
	and	x25, x10, #0xffffffffffffff00
Ltmp137:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	and	x26, x9, #0xffffffffffffff00
Ltmp138:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	mov	w23, w20
Ltmp139:
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 156 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	subs	x9, x19, x8
	str	x14, [sp, #216]                 ; 8-byte Folded Spill
Ltmp140:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	b.ls	LBB2_12
Ltmp141:
; %bb.6:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $x14, $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	w10, #64                        ; =0x40
	sub	x10, x10, x15
	.loc	0 156 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x11, x16, x8, lsl #3
	mul	x8, x8, x15
Ltmp142:
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	b	LBB2_8
Ltmp143:
LBB2_7:                                 ;   in Loop: Header=BB2_8 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	.loc	0 165 25 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:165:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	and	x12, x12, x22
Ltmp144:
	.loc	0 165 13 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:165:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	ucvtf	d0, x12
Ltmp145:
	;DEBUG_VALUE: e <- $d0
	.loc	0 166 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:166:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	str	d0, [x11]
	.loc	0 166 25 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:166:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	str	d0, [x11, x27, lsl #3]
Ltmp146:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 156 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x11, x11, #8
	add	x8, x8, x15
	subs	x9, x9, #1
Ltmp147:
	.loc	0 156 5 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	b.eq	LBB2_11
Ltmp148:
LBB2_8:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 160 17 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:160:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsr	x14, x8, #6
Ltmp149:
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x14
	.loc	0 161 18                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:161:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	and	x13, x8, #0x3f
Ltmp150:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x13
	.loc	0 162 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:162:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	ldr	x12, [x24, x14, lsl #3]
	.loc	0 162 18 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:162:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsr	x12, x12, x8
Ltmp151:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	.loc	0 163 28 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	cmp	x13, x10
	b.ls	LBB2_7
Ltmp152:
; %bb.9:                                ;   in Loop: Header=BB2_8 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x14
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 163 33 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:163:33 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x14, x14, #1
Ltmp153:
	.loc	0 163 28                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	cmp	x14, x21
	b.hs	LBB2_7
Ltmp154:
; %bb.10:                               ;   in Loop: Header=BB2_8 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x13
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 164 18 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:164:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	ldr	x14, [x24, x14, lsl #3]
	.loc	0 164 27 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:164:27 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	neg	x13, x13
Ltmp155:
	lsl	x13, x14, x13
	.loc	0 164 15                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:164:15 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	orr	x12, x13, x12
Ltmp156:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x12
	.loc	0 0 15                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:15
	b	LBB2_7
Ltmp157:
LBB2_11:
	;DEBUG_VALUE: e <- $d0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x8, x19
Ltmp158:
LBB2_12:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x19
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x15
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:alen <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	str	x15, [sp, #200]                 ; 8-byte Folded Spill
Ltmp159:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	subs	x9, x25, x8
	ldr	x19, [sp, #64]                  ; 8-byte Folded Reload
Ltmp160:
	b.ls	LBB2_21
Ltmp161:
; %bb.13:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	cmp	x9, #8
	b.lo	LBB2_18
Ltmp162:
; %bb.14:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #8                         ; =0x8
	.loc	0 168 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsl	x10, x10, x23
	cmp	x10, #64
	b.lo	LBB2_18
Ltmp163:
; %bb.15:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x12, #0                         ; =0x0
	.loc	0 168 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	and	x11, x9, #0xfffffffffffffff8
	add	x10, x8, x11
	movi.2d	v0, #0000000000000000
	mov	x13, x11
	ldr	x17, [sp, #216]                 ; 8-byte Folded Reload
Ltmp164:
LBB2_16:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	add	x14, x8, x12
Ltmp165:
	.loc	0 170 9 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	lsl	x14, x14, #3
	add	x15, x16, x14
	.loc	0 170 14 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	stp	q0, q0, [x15]
	stp	q0, q0, [x15, #32]
	.loc	0 170 21                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:21 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x14, x17, x14
	.loc	0 170 27                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	stp	q0, q0, [x14]
	stp	q0, q0, [x14, #32]
	add	x12, x12, #8
	subs	x13, x13, #8
	b.ne	LBB2_16
Ltmp166:
; %bb.17:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	cmp	x9, x11
	b.ne	LBB2_19
	b	LBB2_21
Ltmp167:
LBB2_18:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x10, x8
Ltmp168:
LBB2_19:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	sub	x8, x25, x10
Ltmp169:
	add	x9, x16, x10, lsl #3
Ltmp170:
LBB2_20:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 170 14                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	str	xzr, [x9]
	.loc	0 170 27 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	str	xzr, [x9, x27, lsl #3]
Ltmp171:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 168 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	add	x9, x9, #8
	subs	x8, x8, #1
Ltmp172:
	.loc	0 168 5 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:328:5 ]
	b.ne	LBB2_20
Ltmp173:
LBB2_21:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:atr <- $x25
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- $x16
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	;DEBUG_VALUE: n_round_up:a <- undef
	;DEBUG_VALUE: n_cdiv:a <- undef
	.loc	0 329 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:329:5
	mov	x0, x19
	str	x16, [sp, #208]                 ; 8-byte Folded Spill
Ltmp174:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x1, x16
	.loc	0 329 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:329:5
	mov	x2, x20
	mov	x3, x25
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp175:
	.loc	0 316 58 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:316:58
	add	x0, x19, #440
	ldr	x1, [sp, #216]                  ; 8-byte Folded Reload
	.loc	0 330 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:330:5
	mov	x2, x20
	mov	x3, x25
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp176:
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	ldr	x1, [sp, #208]                  ; 8-byte Folded Reload
	lsl	x25, x27, #3
Ltmp177:
	mov	x21, x1
Ltmp178:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	ldr	w8, [sp, #144]                  ; 4-byte Folded Reload
Ltmp179:
	.loc	0 332 9 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:332:9
	tbnz	w8, #0, LBB2_44
Ltmp180:
; %bb.22:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:9
	ldr	x0, [sp, #112]                  ; 8-byte Folded Reload
	add	x9, x0, #255
Ltmp181:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- undef
	ldr	x8, [sp, #216]                  ; 8-byte Folded Reload
	.loc	0 325 13 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:325:13
	add	x21, x8, x25
Ltmp182:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 326 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:326:13
	add	x24, x21, x25
Ltmp183:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- undef
	.loc	0 0 13 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:13
	ldr	x17, [sp, #128]                 ; 8-byte Folded Reload
Ltmp184:
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	.loc	0 145 13 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:145:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	cmp	x17, #2
	b.lo	LBB2_32
Ltmp185:
; %bb.23:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 13 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:13
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 145 25                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:145:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	sub	x8, x8, #65
	ldr	x16, [sp, #200]                 ; 8-byte Folded Reload
	udiv	x8, x8, x16
	add	x10, x8, #1
	cmp	x10, x0
	csinc	x8, x0, x8, hs
Ltmp186:
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	.loc	0 146 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	cbz	x8, LBB2_26
Ltmp187:
; %bb.24:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- 0
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x10, #0                         ; =0x0
	mov	x11, #0                         ; =0x0
Ltmp188:
LBB2_25:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x11
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x11, $sp
	;DEBUG_VALUE: _fft_small_np2_pack:w <- undef
	.loc	0 151 18 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:151:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	and	x12, x10, #0x3f
Ltmp189:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x12
	.loc	0 152 26                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:26 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsr	x13, x10, #6
	add	x13, x28, x13, lsl #3
	ldp	x14, x13, [x13]
	.loc	0 152 31 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:31 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsr	x14, x14, x10
	.loc	0 153 43 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:153:43 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	eor	x12, x12, #0x3f
Ltmp190:
	.loc	0 153 36 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:153:36 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsl	x12, x13, x12
	.loc	0 152 38 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:38 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	orr	x12, x14, x12, lsl #1
	.loc	0 153 58                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:153:58 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	and	x12, x12, x22
	.loc	0 152 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:152:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	ucvtf	d0, x12
Ltmp191:
	;DEBUG_VALUE: e <- $d0
	.loc	0 154 14                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:154:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	str	d0, [x21, x11, lsl #3]
	.loc	0 154 25 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:154:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	str	d0, [x24, x11, lsl #3]
Ltmp192:
	.loc	0 146 29 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:29 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	add	x11, x11, #1
Ltmp193:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x11
	.loc	0 146 19 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:19 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	add	x10, x10, x16
Ltmp194:
	.loc	0 146 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:146:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	cmp	x8, x11
	b.ne	LBB2_25
Ltmp195:
LBB2_26:
	;DEBUG_VALUE: _fft_small_np2_pack:jsafe <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 0                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0
	and	x3, x9, #0xffffffffffffff00
Ltmp196:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 156 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	subs	x9, x0, x8
	b.ls	LBB2_33
Ltmp197:
LBB2_27:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #64                        ; =0x40
	sub	x10, x10, x16
	mov	w11, #24                        ; =0x18
	.loc	0 156 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsl	x12, x8, #3
	madd	x11, x27, x11, x12
	add	x11, x1, x11
	add	x12, x12, x27, lsl #4
	add	x12, x1, x12
	mul	x8, x8, x16
Ltmp198:
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	b	LBB2_29
Ltmp199:
LBB2_28:                                ;   in Loop: Header=BB2_29 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	.loc	0 165 25 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:165:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	and	x13, x13, x22
Ltmp200:
	.loc	0 165 13 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:165:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	ucvtf	d0, x13
Ltmp201:
	;DEBUG_VALUE: e <- $d0
	.loc	0 166 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:166:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	str	d0, [x12], #8
	.loc	0 166 25 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:166:25 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	str	d0, [x11], #8
Ltmp202:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 156 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	add	x8, x8, x16
	subs	x9, x9, #1
Ltmp203:
	.loc	0 156 5 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	b.eq	LBB2_34
Ltmp204:
LBB2_29:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	;DEBUG_VALUE: _fft_small_np2_pack:pos <- [DW_OP_LLVM_arg 0, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 160 17 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:160:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsr	x15, x8, #6
Ltmp205:
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x15
	.loc	0 161 18                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:161:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	and	x14, x8, #0x3f
Ltmp206:
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x14
	.loc	0 162 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:162:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	ldr	x13, [x28, x15, lsl #3]
	.loc	0 162 18 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:162:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsr	x13, x13, x8
Ltmp207:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	.loc	0 163 28 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	cmp	x14, x10
	b.ls	LBB2_28
Ltmp208:
; %bb.30:                               ;   in Loop: Header=BB2_29 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:w <- $x15
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 163 33 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:163:33 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	add	x15, x15, #1
Ltmp209:
	.loc	0 163 28                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:163:28 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	cmp	x15, x17
	b.hs	LBB2_28
Ltmp210:
; %bb.31:                               ;   in Loop: Header=BB2_29 Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	;DEBUG_VALUE: _fft_small_np2_pack:sh <- $x14
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 164 18 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:164:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	ldr	x15, [x28, x15, lsl #3]
	.loc	0 164 27 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:164:27 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	neg	x14, x14
Ltmp211:
	lsl	x14, x15, x14
	.loc	0 164 15                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:164:15 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	orr	x13, x14, x13
Ltmp212:
	;DEBUG_VALUE: _fft_small_np2_pack:v <- $x13
	.loc	0 0 15                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:15
	b	LBB2_28
Ltmp213:
LBB2_32:
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	mov	x8, #0                          ; =0x0
	ldr	x16, [sp, #200]                 ; 8-byte Folded Reload
	and	x3, x9, #0xffffffffffffff00
Ltmp214:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 156 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:156:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	subs	x9, x0, x8
	b.hi	LBB2_27
Ltmp215:
LBB2_33:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 168 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	subs	x9, x3, x8
	b.hi	LBB2_35
	b	LBB2_43
Ltmp216:
LBB2_34:
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x8, x0
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
Ltmp217:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	subs	x9, x3, x0
	b.ls	LBB2_43
Ltmp218:
LBB2_35:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	cmp	x9, #8
	b.lo	LBB2_40
Ltmp219:
; %bb.36:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	w10, #8                         ; =0x8
	.loc	0 168 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsl	x10, x10, x23
	cmp	x10, #64
	b.lo	LBB2_40
Ltmp220:
; %bb.37:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x12, #0                         ; =0x0
	.loc	0 168 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	and	x11, x9, #0xfffffffffffffff8
	add	x10, x8, x11
	movi.2d	v0, #0000000000000000
	mov	x13, x11
Ltmp221:
LBB2_38:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	add	x14, x8, x12
Ltmp222:
	.loc	0 170 9 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsl	x14, x14, #3
	add	x15, x21, x14
	.loc	0 170 14 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	stp	q0, q0, [x15]
	stp	q0, q0, [x15, #32]
	.loc	0 170 21                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:21 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	add	x14, x24, x14
	.loc	0 170 27                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	stp	q0, q0, [x14]
	stp	q0, q0, [x14, #32]
	add	x12, x12, #8
	subs	x13, x13, #8
	b.ne	LBB2_38
Ltmp223:
; %bb.39:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	cmp	x9, x11
	b.ne	LBB2_41
	b	LBB2_43
Ltmp224:
LBB2_40:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x10, x8
Ltmp225:
LBB2_41:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- $x8
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	.loc	0 168 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	sub	x8, x3, x10
Ltmp226:
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	w9, #24                         ; =0x18
	.loc	0 168 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	lsl	x10, x10, #3
	madd	x9, x27, x9, x10
	add	x9, x1, x9
	add	x10, x10, x27, lsl #4
	add	x10, x1, x10
Ltmp227:
LBB2_42:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: _fft_small_np2_pack:itrunc <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _fft_small_np2_pack:mask <- $x22
	;DEBUG_VALUE: _fft_small_np2_pack:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _fft_small_np2_pack:len <- $x0
	;DEBUG_VALUE: _fft_small_np2_pack:xn <- $x17
	;DEBUG_VALUE: _fft_small_np2_pack:x <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:d2 <- $x24
	;DEBUG_VALUE: _fft_small_np2_pack:d <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 170 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	str	xzr, [x10], #8
	.loc	0 170 27 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:170:27 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	str	xzr, [x9], #8
Ltmp228:
	;DEBUG_VALUE: _fft_small_np2_pack:j <- [DW_OP_LLVM_arg 0, DW_OP_consts 256, DW_OP_consts 255, DW_OP_consts 18446744073709551615, DW_OP_consts 64, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_div, DW_OP_plus, DW_OP_consts 256, DW_OP_div, DW_OP_mul, DW_OP_consts 18446744073709551615, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_plus, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 168 14 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:14 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	subs	x8, x8, #1
Ltmp229:
	.loc	0 168 5 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:168:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:334:9 ]
	b.ne	LBB2_42
Ltmp230:
LBB2_43:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:btr <- $x3
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:a <- [DW_OP_LLVM_entry_value 1] $x4
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	.loc	0 335 9 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:335:9
	mov	x0, x19
	mov	x1, x21
	mov	x2, x20
	mov	x22, x3
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp231:
	.loc	0 316 58                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:316:58
	add	x0, x19, #440
Ltmp232:
	.loc	0 336 9                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:336:9
	mov	x1, x24
	mov	x2, x20
	mov	x3, x22
	mov	x4, x26
	bl	_sd_fft_trunc
Ltmp233:
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:9
	ldr	x1, [sp, #208]                  ; 8-byte Folded Reload
Ltmp234:
LBB2_44:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	sub	x24, x8, #1
Ltmp235:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: n_round_up:a <- $x24
	;DEBUG_VALUE: n_cdiv:a <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e1 <- undef
	;DEBUG_VALUE: k <- 0
	cbz	x26, LBB2_49
Ltmp236:
; %bb.45:
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: Q <- $x19
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	mov	x8, #0                          ; =0x0
Ltmp237:
	.file	6 ".deps/flint/src" "machine_vectors.h" md5 0x6bfd5c413c5e868bcddcf8e634130c6b
	.loc	6 1566 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:347:20 ] ] ]
	ldp	d0, d1, [x19]
Ltmp238:
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
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: Y <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- 0
	.loc	0 349 9                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:349:9
	add	x9, x1, #32
	add	x10, x21, #32
Ltmp239:
LBB2_46:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: Y <- $x21
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: Q <- $x19
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:45 ] ] ]
	ldp	q2, q3, [x9, #-32]
Ltmp240:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:45 ] ] ]
	ldp	q4, q5, [x9]
Ltmp241:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
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
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:351:45 ] ] ]
	ldp	q6, q7, [x10, #-32]
Ltmp242:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $x21, $x8
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q6
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:351:45 ] ] ]
	ldp	q16, q17, [x10], #64
Ltmp243:
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
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v18, v2, v6
Ltmp244:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp245:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v19, v19
Ltmp246:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v20, v18
	fmls.2d	v20, v6, v2
Ltmp247:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v18, v19, v0[0]
Ltmp248:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v2, v18, v20
Ltmp249:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v6, v3, v7
Ltmp250:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v18, v6, v1[0]
Ltmp251:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v18, v18
Ltmp252:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v19, v6
Ltmp253:
	fmls.2d	v19, v7, v3
Ltmp254:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v6, v18, v0[0]
Ltmp255:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v3, v6, v19
Ltmp256:
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
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v6, v4, v16
Ltmp257:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp258:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp259:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v18, v6
Ltmp260:
	fmls.2d	v18, v16, v4
Ltmp261:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp262:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v4, v6, v18
Ltmp263:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v6, v5, v17
Ltmp264:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp265:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp266:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v16, v6
Ltmp267:
	fmls.2d	v16, v17, v5
Ltmp268:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp269:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v5, v6, v16
Ltmp270:
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
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	.loc	6 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:13 ] ] ]
	stp	q2, q3, [x9, #-32]
Ltmp271:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	.loc	6 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:13 ] ] ]
	stp	q4, q5, [x9], #64
Ltmp272:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 208, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	.loc	0 349 32 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:349:32
	add	x8, x8, #8
Ltmp273:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	.loc	0 349 9 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:349:9
	cmp	x8, x26
	b.lo	LBB2_46
Ltmp274:
; %bb.47:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	;DEBUG_VALUE: Y <- $x21
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: Q <- $x19
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: k <- 1
	;DEBUG_VALUE: Q <- undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	.loc	0 0 9                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:9
	mov	x8, #0                          ; =0x0
Ltmp275:
	.loc	6 1566 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1566:12 @[ .deps/flint/src/machine_vectors.h:1877:16 @[ .deps/flint/src/machine_vectors.h:2104:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:347:20 ] ] ]
	ldp	d0, d1, [x19, #440]
Ltmp276:
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
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: Y <- undef
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- 0
	.loc	0 349 9                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:349:9
	add	x10, x25, #32
	add	x9, x1, x10
	add	x10, x21, x10
Ltmp277:
LBB2_48:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: X <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: k <- 1
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	;DEBUG_VALUE: vec8d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:45 ] ] ]
	ldp	q2, q3, [x9, #-32]
Ltmp278:
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q2
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:45 ] ] ]
	ldp	q4, q5, [x9]
Ltmp279:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
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
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:351:45 ] ] ]
	ldp	q6, q7, [x10, #-32]
Ltmp280:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] undef
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg 0, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] undef
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q6
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:351:45 ] ] ]
	ldp	q16, q17, [x10], #64
Ltmp281:
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
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v18, v2, v6
Ltmp282:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q18
	;DEBUG_VALUE: vec2d_mul:a <- $q18
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v19, v18, v1[0]
Ltmp283:
	;DEBUG_VALUE: vec2d_round:a <- $q19
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v19, v19
Ltmp284:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v20, v18
	fmls.2d	v20, v6, v2
Ltmp285:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q20
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q18
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v18, v19, v0[0]
Ltmp286:
	;DEBUG_VALUE: vec2d_sub:a <- $q18
	;DEBUG_VALUE: vec2d_sub:b <- $q20
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v2, v18, v20
Ltmp287:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- $q7
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v6, v3, v7
Ltmp288:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v18, v6, v1[0]
Ltmp289:
	;DEBUG_VALUE: vec2d_round:a <- $q18
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v18, v18
Ltmp290:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v19, v6
Ltmp291:
	fmls.2d	v19, v7, v3
Ltmp292:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q19
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v6, v18, v0[0]
Ltmp293:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q19
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v3, v6, v19
Ltmp294:
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
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v6, v4, v16
Ltmp295:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp296:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp297:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v18, v6
Ltmp298:
	fmls.2d	v18, v16, v4
Ltmp299:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp300:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v4, v6, v18
Ltmp301:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:n <- undef
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mulmod:b <- $q17
	;DEBUG_VALUE: vec2d_mul:b <- $q17
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v6, v5, v17
Ltmp302:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmul.2d	v7, v6, v1[0]
Ltmp303:
	;DEBUG_VALUE: vec2d_round:a <- $q7
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	frintn.2d	v7, v7
Ltmp304:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	mov.16b	v16, v6
Ltmp305:
	fmls.2d	v16, v17, v5
Ltmp306:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fmls.2d	v6, v7, v0[0]
Ltmp307:
	;DEBUG_VALUE: vec2d_sub:a <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- $q16
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:32 ] ] ] ]
	fsub.2d	v5, v6, v16
Ltmp308:
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
	;DEBUG_VALUE: vec8d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	.loc	6 1586 5                        ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2110:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:13 ] ] ]
	stp	q2, q3, [x9, #-32]
Ltmp309:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 16, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q3
	;DEBUG_VALUE: __s1 <- $q3
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_store:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 32, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q4
	;DEBUG_VALUE: __s1 <- $q4
	.loc	6 1586 5 is_stmt 0              ; .deps/flint/src/machine_vectors.h:1586:5 @[ .deps/flint/src/machine_vectors.h:1883:5 @[ .deps/flint/src/machine_vectors.h:2111:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:350:13 ] ] ]
	stp	q4, q5, [x9], #64
Ltmp310:
	;DEBUG_VALUE: vec2d_store:z <- [DW_OP_LLVM_arg 0, DW_OP_plus_uconst 216, DW_OP_deref, DW_OP_LLVM_arg 1, DW_OP_constu 8, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst 48, DW_OP_stack_value] $sp, $x8
	;DEBUG_VALUE: vec2d_store:a <- $q5
	;DEBUG_VALUE: __s1 <- $q5
	.loc	0 349 32 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:349:32
	add	x8, x8, #8
Ltmp311:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:j <- $x8
	.loc	0 349 9 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:349:9
	cmp	x8, x26
	b.lo	LBB2_48
Ltmp312:
LBB2_49:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	.loc	0 354 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:354:5
	mov	x0, x19
	mov	x2, x20
	mov	x3, x26
	bl	_sd_ifft_trunc
Ltmp313:
	.loc	0 316 58                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:316:58
	add	x0, x19, #440
	ldr	x1, [sp, #216]                  ; 8-byte Folded Reload
	.loc	0 355 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:355:5
	mov	x2, x20
	mov	x3, x26
	bl	_sd_ifft_trunc
Ltmp314:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	ldr	x0, [sp, #200]                  ; 8-byte Folded Reload
	ldr	x2, [sp, #176]                  ; 8-byte Folded Reload
Ltmp315:
	.loc	0 357 17 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:357:17
	cbnz	x2, LBB2_69
Ltmp316:
; %bb.50:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	cmp	x0, #63
	b.hi	LBB2_69
Ltmp317:
; %bb.51:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: bf_np2_crt_tiled:R <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:nchunks <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:navail8 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:depth <- $x20
	;DEBUG_VALUE: bf_np2_crt_tiled:Q0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:Q1 <- undef
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- undef
	;DEBUG_VALUE: vec4d_set_d:z1 <- undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] undef
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
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P1i <- [DW_OP_LLVM_fragment 384 128] undef
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
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] undef
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
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:P2i <- [DW_OP_LLVM_fragment 384 128] undef
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
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S1 <- [DW_OP_LLVM_fragment 384 128] undef
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
	;DEBUG_VALUE: vec8d_set_d:a <- undef
	;DEBUG_VALUE: vec4d_set_d:a <- undef
	;DEBUG_VALUE: vec2d_set_d:a <- undef
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
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: bf_np2_crt_tiled:S2 <- [DW_OP_LLVM_fragment 384 128] undef
	.loc	0 0 17 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:17
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
Ltmp318:
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- $x8
	.loc	0 262 16 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:262:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	lsl	x8, x8, #6
Ltmp319:
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	udiv	x8, x8, x0
	add	x9, x8, #1
	cmp	x24, x9
	csinc	x28, x24, x8, lo
Ltmp320:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- 0
	.loc	0 0 16 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:16
	ldr	x17, [sp, #192]                 ; 8-byte Folded Reload
Ltmp321:
	;DEBUG_VALUE: start <- 0
	.loc	0 274 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:274:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cbz	x24, LBB2_70
Ltmp322:
; %bb.52:
	;DEBUG_VALUE: start <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:Q0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:depth <- $x20
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:nchunks <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:R <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	mov	x4, #0                          ; =0x0
	mov	x11, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	mov	x10, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
	mov	x12, #0                         ; =0x0
	mov	x6, #0                          ; =0x0
	ldp	d19, d20, [x19]
Ltmp323:
	;DEBUG_VALUE: vec8d_set_d:a <- $d19
	;DEBUG_VALUE: vec4d_set_d:a <- $d19
	;DEBUG_VALUE: vec2d_set_d:a <- $d19
	dup.2d	v21, v19[0]
Ltmp324:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q21
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: bf_np2_crt_tiled:P1 <- [DW_OP_LLVM_fragment 384 128] $q21
	ldp	d22, d23, [x19, #440]
Ltmp325:
	;DEBUG_VALUE: vec8d_set_d:a <- $d22
	;DEBUG_VALUE: vec4d_set_d:a <- $d22
	;DEBUG_VALUE: vec2d_set_d:a <- $d22
	dup.2d	v24, v22[0]
Ltmp326:
	;DEBUG_VALUE: vec4d_set_d:z1 <- $q24
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_set_d:z1 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_set_d:z <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: bf_np2_crt_tiled:P2 <- [DW_OP_LLVM_fragment 384 128] $q24
	ldr	d0, [x19, #5080]
	ucvtf	d25, d0
Ltmp327:
	;DEBUG_VALUE: vec8d_set_d:a <- $d25
	;DEBUG_VALUE: vec4d_set_d:a <- $d25
	;DEBUG_VALUE: vec2d_set_d:a <- $d25
	add	x13, x19, x20, lsl #3
	ldr	d0, [x13, #4568]
	ucvtf	d26, d0
Ltmp328:
	;DEBUG_VALUE: vec8d_set_d:a <- $d26
	;DEBUG_VALUE: vec4d_set_d:a <- $d26
	;DEBUG_VALUE: vec2d_set_d:a <- $d26
	ldr	d0, [x13, #4824]
	ucvtf	d27, d0
Ltmp329:
	;DEBUG_VALUE: vec8d_set_d:a <- $d27
	;DEBUG_VALUE: vec4d_set_d:a <- $d27
	;DEBUG_VALUE: vec2d_set_d:a <- $d27
	.loc	0 274 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:274:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	lsl	x5, x0, #3
Ltmp330:
	.loc	0 255 15 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:255:15 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	fcvtzu	x27, d19
Ltmp331:
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	.loc	0 274 5                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:274:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x13, x17, #32
	stp	x13, x5, [sp, #32]              ; 16-byte Folded Spill
	mov	w7, #8                          ; =0x8
	sub	x25, x29, #160
	sub	x26, x29, #224
Ltmp332:
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	ldp	x1, x2, [sp, #208]              ; 16-byte Folded Reload
	stp	q20, q19, [sp, #160]            ; 32-byte Folded Spill
	stp	q22, q21, [sp, #128]            ; 32-byte Folded Spill
	stp	q24, q23, [sp, #96]             ; 32-byte Folded Spill
	stp	q26, q25, [sp, #64]             ; 32-byte Folded Spill
	str	q27, [sp, #48]                  ; 16-byte Folded Spill
	b	LBB2_55
Ltmp333:
LBB2_53:                                ;   in Loop: Header=BB2_55 Depth=1
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q0
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 48, DW_OP_stack_value] $fp
	;DEBUG_VALUE: __s1 <- $q1
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q1
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z1 <- $q1
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q2
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 16, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q2
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 48, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 16, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- $x13
	;DEBUG_VALUE: vec4d_load:a <- $x13
	;DEBUG_VALUE: vec8d_load:a <- $x13
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- $x14
	;DEBUG_VALUE: vec4d_load:a <- $x14
	;DEBUG_VALUE: vec8d_load:a <- $x14
	;DEBUG_VALUE: start <- $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	mov	x19, x12
Ltmp334:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
LBB2_54:                                ;   in Loop: Header=BB2_55 Depth=1
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 274 40 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:274:40 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x6, x6, #8
Ltmp335:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	;DEBUG_VALUE: start <- $x6
	.loc	0 274 5 is_stmt 0               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:274:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x4, x4, x5
	mov	x12, x19
	cmp	x6, x28
	b.hs	LBB2_71
Ltmp336:
LBB2_55:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_59 Depth 2
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	.loc	0 0 5                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	subs	x13, x28, x6
	cmp	x13, #8
	csel	x22, x13, x7, lo
Ltmp337:
	;DEBUG_VALUE: start <- $x6
	.loc	0 276 44 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:44 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	lsl	x13, x6, #3
	add	x14, x1, x13
Ltmp338:
	;DEBUG_VALUE: vec8d_load:a <- $x14
	;DEBUG_VALUE: vec4d_load:a <- $x14
	;DEBUG_VALUE: vec2d_load:a <- $x14
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:31 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	ldp	q0, q1, [x14]
Ltmp339:
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x14
	;DEBUG_VALUE: __ret <- $q0
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x14
	;DEBUG_VALUE: __ret <- $q1
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q1
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:31 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	ldp	q2, q3, [x14, #32]
Ltmp340:
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x14
	;DEBUG_VALUE: __ret <- $q2
	;DEBUG_VALUE: __ret <- $q3
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec2d_mulmod:a <- $q0
	;DEBUG_VALUE: vec2d_mul:a <- $q0
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v4, v0, v26[0]
Ltmp341:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v5, v4, v20[0]
Ltmp342:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v5, v5
Ltmp343:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q0
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v6, v4
	fmls.2d	v6, v0, v26[0]
Ltmp344:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v4, v5, v19[0]
Ltmp345:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v0, v4, v6
Ltmp346:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q0
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q1
	;DEBUG_VALUE: vec2d_mul:a <- $q1
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v4, v1, v26[0]
Ltmp347:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v5, v4, v20[0]
Ltmp348:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v5, v5
Ltmp349:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q1
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v6, v4
Ltmp350:
	fmls.2d	v6, v1, v26[0]
Ltmp351:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v4, v5, v19[0]
Ltmp352:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v1, v4, v6
Ltmp353:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q1
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec2d_mulmod:a <- $q2
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q3
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v4, v2, v26[0]
Ltmp354:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v5, v4, v20[0]
Ltmp355:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v5, v5
Ltmp356:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q2
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v6, v4
Ltmp357:
	fmls.2d	v6, v2, v26[0]
Ltmp358:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v4, v5, v19[0]
Ltmp359:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v2, v4, v6
Ltmp360:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q2
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q3
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v4, v3, v26[0]
Ltmp361:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v5, v4, v20[0]
Ltmp362:
	;DEBUG_VALUE: vec2d_round:a <- $q5
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v5, v5
Ltmp363:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q3
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v6, v4
Ltmp364:
	fmls.2d	v6, v3, v26[0]
Ltmp365:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v4, v5, v19[0]
Ltmp366:
	;DEBUG_VALUE: vec2d_sub:a <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- $q6
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:276:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v3, v4, v6
Ltmp367:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 256 128] $q2
	.loc	0 277 44                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:44 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x13, x2, x13
Ltmp368:
	;DEBUG_VALUE: vec8d_load:a <- $x13
	;DEBUG_VALUE: vec4d_load:a <- $x13
	;DEBUG_VALUE: vec2d_load:a <- $x13
	.loc	6 1571 12                       ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2129:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:31 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	ldp	q4, q5, [x13]
Ltmp369:
	;DEBUG_VALUE: __ret <- $q4
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x13
	;DEBUG_VALUE: __ret <- $q5
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_load:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x13
	.loc	6 1571 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1571:12 @[ .deps/flint/src/machine_vectors.h:1901:29 @[ .deps/flint/src/machine_vectors.h:2130:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:31 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	ldp	q6, q7, [x13, #32]
Ltmp370:
	;DEBUG_VALUE: __ret <- $q6
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x13
	;DEBUG_VALUE: __ret <- $q7
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_load:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_load:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v4, v27[0]
Ltmp371:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp372:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp373:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
	fmls.2d	v18, v4, v27[0]
Ltmp374:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp375:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v4, v16, v18
Ltmp376:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v5, v27[0]
Ltmp377:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp378:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp379:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp380:
	fmls.2d	v18, v5, v27[0]
Ltmp381:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp382:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v5, v16, v18
Ltmp383:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q7
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v6, v27[0]
Ltmp384:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp385:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp386:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp387:
	fmls.2d	v18, v6, v27[0]
Ltmp388:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp389:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v6, v16, v18
Ltmp390:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v7, v27[0]
Ltmp391:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp392:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp393:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp394:
	fmls.2d	v18, v7, v27[0]
Ltmp395:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp396:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:277:18 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v7, v16, v18
Ltmp397:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q7
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: r2 <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 256 128] $q2
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 384 128] $q3
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q0
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q0
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q0
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v0, v20[0]
Ltmp398:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp399:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q0
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v0, v16, v19[0]
Ltmp400:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q0
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v0, #0.0
Ltmp401:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v21, v0
Ltmp402:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v0, v17, v16
Ltmp403:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q1
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q1
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q1
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v1, v20[0]
Ltmp404:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp405:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q1
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v1, v16, v19[0]
Ltmp406:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q1
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v1, #0.0
Ltmp407:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v21, v1
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v1, v17, v16
Ltmp408:
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q2
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q3
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q2
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q2
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v2, v20[0]
Ltmp409:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp410:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q2
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v2, v16, v19[0]
Ltmp411:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q2
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v2, #0.0
Ltmp412:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v21, v2
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v2, v17, v16
Ltmp413:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q3
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q3
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q3
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v3, v20[0]
Ltmp414:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp415:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q3
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v3, v16, v19[0]
Ltmp416:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q3
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v3, #0.0
Ltmp417:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v21, v3
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:12 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v3, v17, v16
Ltmp418:
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: r1 <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q4
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
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v4, v23[0]
Ltmp419:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp420:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v4, v16, v22[0]
Ltmp421:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v4, #0.0
Ltmp422:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v4
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v4, v17, v16
Ltmp423:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v5, v23[0]
Ltmp424:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp425:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v5, v16, v22[0]
Ltmp426:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v5, #0.0
Ltmp427:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v5
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v5, v17, v16
Ltmp428:
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v6, v23[0]
Ltmp429:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp430:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v6, v16, v22[0]
Ltmp431:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v6, #0.0
Ltmp432:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v6
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v6, v17, v16
Ltmp433:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v7, v23[0]
Ltmp434:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp435:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v7, v16, v22[0]
Ltmp436:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v7, #0.0
Ltmp437:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v7
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:278:45 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v7, v17, v16
Ltmp438:
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
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fsub.2d	v4, v4, v0
Ltmp439:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q4
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	.loc	6 1728 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fsub.2d	v5, v5, v1
Ltmp440:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_sub:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec4d_sub:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	;DEBUG_VALUE: vec4d_sub:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fsub.2d	v6, v6, v2
Ltmp441:
	;DEBUG_VALUE: vec4d_sub:z1 <- $q6
	;DEBUG_VALUE: vec2d_sub:b <- undef
	;DEBUG_VALUE: vec2d_sub:a <- undef
	.loc	6 1728 12                       ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1980:1 @[ .deps/flint/src/machine_vectors.h:2154:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:40 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fsub.2d	v7, v7, v3
Ltmp442:
	;DEBUG_VALUE: vec4d_sub:z2 <- $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec4d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_sub:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_sub:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_add:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_add:a <- $q4
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	6 1723 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fadd.2d	v4, v24, v4
Ltmp443:
	;DEBUG_VALUE: vec4d_add:z1 <- $q4
	;DEBUG_VALUE: vec2d_add:a <- $q5
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	6 1723 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fadd.2d	v5, v24, v5
Ltmp444:
	;DEBUG_VALUE: vec4d_add:z2 <- $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_add:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_add:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec2d_add:a <- $q6
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	6 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fadd.2d	v6, v24, v6
Ltmp445:
	;DEBUG_VALUE: vec4d_add:z1 <- $q6
	;DEBUG_VALUE: vec2d_add:a <- $q7
	;DEBUG_VALUE: vec2d_add:b <- $q24
	.loc	6 1723 12                       ; .deps/flint/src/machine_vectors.h:1723:12 @[ .deps/flint/src/machine_vectors.h:1979:1 @[ .deps/flint/src/machine_vectors.h:2153:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:30 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ]
	fadd.2d	v7, v24, v7
Ltmp446:
	;DEBUG_VALUE: vec4d_add:z2 <- $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec4d_add:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_add:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_add:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:b <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_mulmod:d <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q4
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v4, v25[0]
Ltmp447:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp448:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp449:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q4
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp450:
	fmls.2d	v18, v4, v25[0]
Ltmp451:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp452:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v4, v16, v18
Ltmp453:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q4
	;DEBUG_VALUE: vec2d_mulmod:a <- $q5
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v5, v25[0]
Ltmp454:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp455:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp456:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q5
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp457:
	fmls.2d	v18, v5, v25[0]
Ltmp458:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp459:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v5, v16, v18
Ltmp460:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z1 <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_mulmod:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:b <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_mulmod:d <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_mulmod:a <- $q6
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v6, v25[0]
Ltmp461:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp462:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp463:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q6
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp464:
	fmls.2d	v18, v6, v25[0]
Ltmp465:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp466:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v6, v16, v18
Ltmp467:
	;DEBUG_VALUE: vec4d_mulmod:z1 <- $q6
	;DEBUG_VALUE: vec2d_mulmod:a <- $q7
	;DEBUG_VALUE: vec2d_mulmod:b <- undef
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_mulmod:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v16, v7, v25[0]
Ltmp468:
	;DEBUG_VALUE: vec2d_mulmod:h <- $q16
	;DEBUG_VALUE: vec2d_mul:a <- $q16
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmul.2d	v17, v16, v23[0]
Ltmp469:
	;DEBUG_VALUE: vec2d_round:a <- $q17
	.loc	6 1765 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	frintn.2d	v17, v17
Ltmp470:
	;DEBUG_VALUE: vec2d_mulmod:q <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- undef
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v18, v16
Ltmp471:
	fmls.2d	v18, v7, v25[0]
Ltmp472:
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q17
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q16
	.loc	6 1746 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fmls.2d	v16, v17, v22[0]
Ltmp473:
	;DEBUG_VALUE: vec2d_sub:a <- $q16
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	.loc	6 1728 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1728:12 @[ .deps/flint/src/machine_vectors.h:1841:1 @[ .deps/flint/src/machine_vectors.h:1997:1 @[ .deps/flint/src/machine_vectors.h:2171:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:279:17 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fsub.2d	v7, v16, v18
Ltmp474:
	;DEBUG_VALUE: vec4d_mulmod:z2 <- $q7
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 384 128] $q7
	;DEBUG_VALUE: vec4d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:z2 <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_mulmod:z <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec8d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 256 128] $q6
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q4
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q5
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q4
	;DEBUG_VALUE: vec2d_mul:b <- undef
	.loc	6 1733 12                       ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v4, v23[0]
Ltmp475:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp476:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q4
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v4, v16, v22[0]
Ltmp477:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q4
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v4, #0.0
Ltmp478:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v4
Ltmp479:
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v4, v17, v16
Ltmp480:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q5
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v5, v23[0]
Ltmp481:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp482:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q5
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v5, v16, v22[0]
Ltmp483:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q5
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v5, #0.0
Ltmp484:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v5
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v5, v17, v16
Ltmp485:
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 0 128] $q6
	;DEBUG_VALUE: vec4d_reduce_to_0n:a <- [DW_OP_LLVM_fragment 128 128] $q7
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:c <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q6
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z1 <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v6, v23[0]
Ltmp486:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp487:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q6
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v6, v16, v22[0]
Ltmp488:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q6
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v6, #0.0
Ltmp489:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v6
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	bif.16b	v6, v17, v16
Ltmp490:
	;DEBUG_VALUE: vec2d_reduce_to_0n:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:ninv <- undef
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:ninv <- undef
	;DEBUG_VALUE: vec2d_mul:a <- $q7
	;DEBUG_VALUE: vec2d_mul:b <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z1 <- undef
	.loc	6 1733 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:1733:12 @[ .deps/flint/src/machine_vectors.h:1781:37 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmul.2d	v16, v7, v23[0]
Ltmp491:
	;DEBUG_VALUE: vec2d_round:a <- $q16
	.loc	6 1765 12                       ; .deps/flint/src/machine_vectors.h:1765:12 @[ .deps/flint/src/machine_vectors.h:1781:25 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	frintn.2d	v16, v16
Ltmp492:
	;DEBUG_VALUE: vec2d_fnmadd:a <- $q16
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:c <- $q7
	.loc	6 1746 12                       ; .deps/flint/src/machine_vectors.h:1746:12 @[ .deps/flint/src/machine_vectors.h:1781:12 @[ .deps/flint/src/machine_vectors.h:1820:37 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ] ]
	fmls.2d	v7, v16, v22[0]
Ltmp493:
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q7
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	.loc	6 1812 22                       ; .deps/flint/src/machine_vectors.h:1812:22 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fcmge.2d	v16, v7, #0.0
Ltmp494:
	.loc	6 1812 53 is_stmt 0             ; .deps/flint/src/machine_vectors.h:1812:53 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	fadd.2d	v17, v24, v7
Ltmp495:
	.loc	6 2229 12 is_stmt 1             ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2294:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:282:34 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v0, v0
Ltmp496:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z1 <- $q0
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	.loc	6 2229 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2295:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:282:34 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v1, v1
Ltmp497:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q1
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q1
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 0 128] $q0
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	.loc	6 2225 4 is_stmt 1              ; .deps/flint/src/machine_vectors.h:2225:4 @[ .deps/flint/src/machine_vectors.h:2289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:282:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	stp	q0, q1, [x29, #-160]
Ltmp498:
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 16, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 1812 12                       ; .deps/flint/src/machine_vectors.h:1812:12 @[ .deps/flint/src/machine_vectors.h:1820:12 @[ .deps/flint/src/machine_vectors.h:1991:1 @[ .deps/flint/src/machine_vectors.h:2165:1 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:280:11 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ] ] ]
	mov.16b	v0, v16
Ltmp499:
	bsl.16b	v0, v7, v17
Ltmp500:
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: t <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 256 128] undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z2 <- undef
	;DEBUG_VALUE: vec4d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z2 <- [DW_OP_LLVM_fragment 128 128] undef
	;DEBUG_VALUE: vec8d_reduce_to_0n:z <- [DW_OP_LLVM_fragment 384 128] undef
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 2229 12                       ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2294:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:283:36 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v1, v2
Ltmp501:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z1 <- $q1
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	.loc	6 2229 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2295:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:283:36 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v2, v3
Ltmp502:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	.loc	6 2225 4 is_stmt 1              ; .deps/flint/src/machine_vectors.h:2225:4 @[ .deps/flint/src/machine_vectors.h:2289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:283:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	stp	q1, q2, [x29, #-128]
Ltmp503:
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 48, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 2229 12                       ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2294:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:284:35 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v1, v4
Ltmp504:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z1 <- $q1
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	.loc	6 2229 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2295:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:284:35 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v2, v5
Ltmp505:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	.loc	6 2225 4 is_stmt 1              ; .deps/flint/src/machine_vectors.h:2225:4 @[ .deps/flint/src/machine_vectors.h:2289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:284:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	stp	q1, q2, [x29, #-224]
Ltmp506:
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 16, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q2
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 0 128] undef
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:a <- [DW_OP_LLVM_fragment 128 128] undef
	.loc	6 2229 12                       ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2294:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:285:37 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v1, v6
Ltmp507:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z1 <- $q1
	;DEBUG_VALUE: vec2d_convert_limited_vec2n:a <- undef
	.loc	6 2229 12 is_stmt 0             ; .deps/flint/src/machine_vectors.h:2229:12 @[ .deps/flint/src/machine_vectors.h:2295:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:285:37 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	fcvtnu.2d	v0, v0
Ltmp508:
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q1
	;DEBUG_VALUE: __s1 <- $q1
	.loc	6 2225 4 is_stmt 1              ; .deps/flint/src/machine_vectors.h:2225:4 @[ .deps/flint/src/machine_vectors.h:2289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:285:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ] ] ]
	stp	q1, q0, [x29, #-192]
Ltmp509:
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 48, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q0
	;DEBUG_VALUE: __s1 <- $q0
	.loc	6 0 4 is_stmt 0                 ; .deps/flint/src/machine_vectors.h:0:4
	cmp	x28, x6
Ltmp510:
	;DEBUG_VALUE: k <- 0
	.loc	0 286 9 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	b.eq	LBB2_53
Ltmp511:
; %bb.56:                               ;   in Loop: Header=BB2_55 Depth=1
	;DEBUG_VALUE: k <- 0
	;DEBUG_VALUE: __s1 <- $q0
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q0
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 48, DW_OP_stack_value] $fp
	;DEBUG_VALUE: __s1 <- $q1
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q1
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 0 128] $q1
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q0
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z1 <- $q1
	;DEBUG_VALUE: __s1 <- $q2
	;DEBUG_VALUE: vec2n_store_unaligned:a <- $q2
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_plus_uconst 16, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 224, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:a <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z <- [DW_OP_LLVM_fragment 128 128] $q2
	;DEBUG_VALUE: vec4d_convert_limited_vec4n:z2 <- $q2
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 48, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 32, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_plus_uconst 16, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec4n_store_unaligned:z <- [DW_OP_constu 160, DW_OP_minus, DW_OP_stack_value] $fp
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:a <- $q7
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_sub:b <- $q18
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:l <- $q18
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec2d_add:b <- $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_add:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q24
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_pm1no_to_0n:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_pm1no:n <- $q21
	;DEBUG_VALUE: vec2d_reduce_to_0n:n <- $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_reduce_to_0n:b <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q24
	;DEBUG_VALUE: vec2d_mulmod:n <- $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q24
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q24
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x13
	;DEBUG_VALUE: vec2d_load:a <- $x13
	;DEBUG_VALUE: vec4d_load:a <- $x13
	;DEBUG_VALUE: vec8d_load:a <- $x13
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec2d_fnmadd:b <- $q21
	;DEBUG_VALUE: vec2d_mulmod:n <- $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec4d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 384 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 256 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 128 128] $q21
	;DEBUG_VALUE: vec8d_mulmod:c <- [DW_OP_LLVM_fragment 0 128] $q21
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 48, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec4d_load:a <- [DW_OP_plus_uconst 32, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $x14
	;DEBUG_VALUE: vec2d_load:a <- $x14
	;DEBUG_VALUE: vec4d_load:a <- $x14
	;DEBUG_VALUE: vec8d_load:a <- $x14
	;DEBUG_VALUE: start <- $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:9
	mov	x21, #0                         ; =0x0
	mov	x24, x4
	b	LBB2_59
Ltmp512:
LBB2_57:                                ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	mov	x19, x12
Ltmp513:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	mov	x12, x8
	mov	x13, x10
	mov	x14, x9
	mov	x9, x11
Ltmp514:
LBB2_58:                                ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 286 57 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	and	x8, x24, #0x3f
Ltmp515:
	;DEBUG_VALUE: sh <- $x8
	.loc	0 286 57 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	mul	x10, x23, x27
Ltmp516:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 0 64] $x10
	;DEBUG_VALUE: vlo <- $x10
	umulh	x11, x23, x27
Ltmp517:
	;DEBUG_VALUE: __rx <- [DW_OP_LLVM_fragment 64 64] $x11
	;DEBUG_VALUE: vhi <- $x11
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	adds	x10, x10, x20
Ltmp518:
	;DEBUG_VALUE: vlo <- $x10
	;DEBUG_VALUE: _carry <- undef
	cinc	x11, x11, hs
Ltmp519:
	;DEBUG_VALUE: vhi <- $x11
	;DEBUG_VALUE: _carry <- [DW_OP_stack_value] 0
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	lsl	x15, x10, x8
Ltmp520:
	;DEBUG_VALUE: x0 <- $x15
	eor	x16, x8, #0x3f
	lsr	x10, x10, x16
Ltmp521:
	lsl	x8, x11, x8
Ltmp522:
	orr	x8, x8, x10, lsr #1
Ltmp523:
	;DEBUG_VALUE: x1 <- $x8
	lsr	x10, x11, x16
	lsr	x10, x10, #1
Ltmp524:
	;DEBUG_VALUE: x2 <- $x10
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	adds	x11, x9, x15
Ltmp525:
	adcs	x9, x14, x8
Ltmp526:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- undef
	;DEBUG_VALUE: _carry <- undef
	adcs	x10, x13, x10
Ltmp527:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- undef
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- undef
	cinc	x8, x12, hs
Ltmp528:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	.loc	0 286 51                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:51 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x21, x21, #1
Ltmp529:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	;DEBUG_VALUE: k <- $x21
	.loc	0 286 9                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:9 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x24, x24, x0
	mov	x12, x19
	cmp	x21, x22
	b.hs	LBB2_54
Ltmp530:
LBB2_59:                                ;   Parent Loop BB2_55 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 286 57 is_stmt 1              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	lsr	x19, x24, #6
Ltmp531:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	ldr	x20, [x25, x21, lsl #3]
Ltmp532:
	;DEBUG_VALUE: r1 <- $x20
	ldr	x23, [x26, x21, lsl #3]
Ltmp533:
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: sh <- undef
	cmp	x12, x19
	b.hs	LBB2_57
Ltmp534:
; %bb.60:                               ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	.loc	0 286 57 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x13, x12, #1
Ltmp535:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x13
	str	x11, [x17, x12, lsl #3]
Ltmp536:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x13, x19
	b.ne	LBB2_62
Ltmp537:
; %bb.61:                               ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x13
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 57                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:57
	mov	x12, #0                         ; =0x0
	mov	x13, x8
Ltmp538:
	mov	x14, x10
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	b	LBB2_58
Ltmp539:
LBB2_62:                                ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x13
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x13
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x11, x12, #2
Ltmp540:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	str	x9, [x17, x13, lsl #3]
Ltmp541:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x11, x19
	b.ne	LBB2_64
Ltmp542:
; %bb.63:                               ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 57                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:57
	mov	x12, #0                         ; =0x0
	mov	x13, #0                         ; =0x0
	mov	x14, x8
	mov	x9, x10
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	b	LBB2_58
Ltmp543:
LBB2_64:                                ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x9, x12, #3
Ltmp544:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	str	x10, [x17, x11, lsl #3]
Ltmp545:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x9, x19
	b.ne	LBB2_66
Ltmp546:
; %bb.65:                               ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 57                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:57
	mov	x12, #0                         ; =0x0
	mov	x13, #0                         ; =0x0
	mov	x14, #0                         ; =0x0
	mov	x9, x8
Ltmp547:
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	b	LBB2_58
Ltmp548:
LBB2_66:                                ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x10, x12, #4
Ltmp549:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	str	x8, [x17, x9, lsl #3]
Ltmp550:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x10, x19
	b.eq	LBB2_68
Ltmp551:
; %bb.67:                               ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: pos <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 2, DW_OP_plus, DW_OP_LLVM_arg 1, DW_OP_plus_uconst 200, DW_OP_deref, DW_OP_mul, DW_OP_stack_value] $x21, $sp, $x6
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x6
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 57                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:57
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x0, x8, x12, lsl #3
	sub	x8, x19, x12
	lsl	x8, x8, #3
	sub	x1, x8, #32
	mov	x26, x4
	mov	x25, x6
Ltmp552:
	;DEBUG_VALUE: j <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] $x21, $x25
	;DEBUG_VALUE: start <- $x25
	.loc	0 286 57                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:286:57 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	bl	_bzero
Ltmp553:
	.loc	0 0 57                          ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:57
	mov	w7, #8                          ; =0x8
	mov	x6, x25
	sub	x25, x29, #160
Ltmp554:
	ldr	x5, [sp, #40]                   ; 8-byte Folded Reload
	ldp	q27, q26, [sp, #48]             ; 32-byte Folded Reload
	ldp	q25, q24, [sp, #80]             ; 32-byte Folded Reload
	ldp	q23, q22, [sp, #112]            ; 32-byte Folded Reload
	ldp	q21, q20, [sp, #144]            ; 32-byte Folded Reload
	ldr	q19, [sp, #176]                 ; 16-byte Folded Reload
	mov	x4, x26
	sub	x26, x29, #224
	ldp	x1, x2, [sp, #208]              ; 16-byte Folded Reload
	ldp	x17, x0, [sp, #192]             ; 16-byte Folded Reload
Ltmp555:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- undef
LBB2_68:                                ;   in Loop: Header=BB2_59 Depth=2
	;DEBUG_VALUE: w <- $x19
	;DEBUG_VALUE: tt <- $x23
	;DEBUG_VALUE: r1 <- $x20
	;DEBUG_VALUE: k <- $x21
	;DEBUG_VALUE: bf_np2_crt_tiled:p1u <- $x27
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	mov	x12, #0                         ; =0x0
	mov	x13, #0                         ; =0x0
	mov	x14, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	b	LBB2_58
Ltmp556:
LBB2_69:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- $x0
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	.loc	0 360 9 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:360:9
	stp	x0, x20, [sp]
	mov	x0, x19
Ltmp557:
	.loc	0 0 9 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:9
	ldr	x1, [sp, #192]                  ; 8-byte Folded Reload
	ldr	x3, [sp, #24]                   ; 8-byte Folded Reload
	ldp	x4, x5, [sp, #208]              ; 16-byte Folded Reload
	.loc	0 360 9                         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:360:9
	mov	x6, x24
	mov	x7, x26
	bl	__fft_small_np2_crt_recompose
Ltmp558:
	.loc	0 0 9                           ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:9
	b	LBB2_76
Ltmp559:
LBB2_70:
	;DEBUG_VALUE: start <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:Q0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:depth <- $x20
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:nchunks <- $x24
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:R <- $x19
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zlen <- $x24
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:e0 <- $x21
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:ztr <- $x26
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:depth <- $x20
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:dsz <- $x27
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	mov	x19, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
	mov	x10, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	mov	x11, #0                         ; =0x0
Ltmp560:
LBB2_71:
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	ldr	x13, [sp, #24]                  ; 8-byte Folded Reload
Ltmp561:
	.loc	0 289 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x19, x13
	b.hs	LBB2_76
Ltmp562:
; %bb.72:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x19
	.loc	0 291 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x12, x19, #1
Ltmp563:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	.loc	0 291 16 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	str	x11, [x17, x19, lsl #3]
Ltmp564:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	.loc	0 289 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x12, x13
	b.eq	LBB2_76
Ltmp565:
; %bb.73:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x12
	.loc	0 291 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x11, x19, #2
Ltmp566:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	.loc	0 291 16 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	str	x9, [x17, x12, lsl #3]
Ltmp567:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	.loc	0 289 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x11, x13
	b.eq	LBB2_76
Ltmp568:
; %bb.74:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x11
	.loc	0 291 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x9, x19, #3
Ltmp569:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 291 16 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	str	x10, [x17, x11, lsl #3]
Ltmp570:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	.loc	0 289 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x9, x13
	b.eq	LBB2_76
Ltmp571:
; %bb.75:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- $x8
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x9
	.loc	0 291 13                        ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:13 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x10, x19, #4
Ltmp572:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	.loc	0 291 16 is_stmt 0              ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	str	x8, [x17, x9, lsl #3]
Ltmp573:
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	.loc	0 289 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	cmp	x10, x13
	b.ne	LBB2_78
Ltmp574:
LBB2_76:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 5 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:5
	ldur	x8, [x29, #-96]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB2_80
Ltmp575:
; %bb.77:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 362 1 epilogue_begin is_stmt 1 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:362:1
	ldp	x29, x30, [sp, #464]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #448]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #432]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #416]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #400]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #384]            ; 16-byte Folded Reload
	add	sp, sp, #480
Ltmp576:
	ret
Ltmp577:
LBB2_78:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 1 is_stmt 0                 ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:1
	ldur	x8, [x29, #-96]
Lloh6:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh7:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh8:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB2_80
Ltmp578:
; %bb.79:
	;DEBUG_VALUE: bf_np2_crt_tiled:w0 <- $x10
	;DEBUG_VALUE: bf_np2_crt_tiled:acc3 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc2 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc1 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:acc0 <- 0
	;DEBUG_VALUE: bf_np2_crt_tiled:jtop <- $x28
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:b <- [DW_OP_LLVM_entry_value 1] $x6
	;DEBUG_VALUE: bf_np2_crt_tiled:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	;DEBUG_VALUE: bf_np2_crt_tiled:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bits <- [DW_OP_plus_uconst 200] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	add	x8, x17, x19, lsl #3
	sub	x9, x13, x19
	lsl	x9, x9, #3
	sub	x1, x9, #32
	.loc	0 289 5 is_stmt 1               ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:289:5 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	add	x0, x8, #32
Ltmp579:
	.loc	0 291 16 epilogue_begin         ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:291:16 @[ .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:358:9 ]
	ldp	x29, x30, [sp, #464]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #448]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #432]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #416]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #400]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #384]            ; 16-byte Folded Reload
Ltmp580:
	add	sp, sp, #480
Ltmp581:
	b	_bzero
Ltmp582:
LBB2_80:
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:an <- [DW_OP_LLVM_entry_value 1] $x5
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d0 <- [DW_OP_plus_uconst 208] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:d1 <- [DW_OP_plus_uconst 216] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:Q0 <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:R <- [DW_OP_plus_uconst 64] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:sqr <- [DW_OP_plus_uconst 144, DW_OP_deref_size 16, DW_OP_LLVM_convert 1 7, DW_OP_LLVM_convert 32 7, DW_OP_stack_value] $sp
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:bn <- [DW_OP_plus_uconst 128] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:blen <- [DW_OP_plus_uconst 112] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:z <- [DW_OP_plus_uconst 192] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zl <- [DW_OP_plus_uconst 176] [$sp+0]
	;DEBUG_VALUE: _mpn_ctx_mpn_mul_window_np2:zh <- [DW_OP_plus_uconst 24] [$sp+0]
	.loc	0 0 16 is_stmt 0                ; .deps/experiments/ablation-general-carry/src/fft_small/mpn_mul_np2.c:0:16
	bl	___stack_chk_fail
Ltmp583:
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.loh AdrpLdrGotLdr	Lloh6, Lloh7, Lloh8
Lfunc_end2:
	.cfi_endproc
