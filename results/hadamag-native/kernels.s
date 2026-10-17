	.build_version macos, 26, 0	sdk_version 27, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_hn_iter                        ; -- Begin function hn_iter
	.p2align	2
_hn_iter:                               ; @hn_iter
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w1 killed $w1 def $x1
	cbz	w1, LBB0_21
; %bb.1:
	mov	w8, #1                          ; =0x1
	lsl	x8, x8, x1
	mov	w13, #1                         ; =0x1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	x13, x9
	cmp	x9, x8
	b.hs	LBB0_21
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
                                        ;       Child Loop BB0_17 Depth 3
                                        ;       Child Loop BB0_19 Depth 3
                                        ;     Child Loop BB0_12 Depth 2
                                        ;       Child Loop BB0_13 Depth 3
                                        ;     Child Loop BB0_7 Depth 2
	lsl	x9, x13, #1
	cbz	x13, LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	lsl	x10, x13, #3
	lsl	x11, x13, #4
	cmp	x13, #3
	b.hi	LBB0_10
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x12, x0
	mov	w14, #2                         ; =0x2
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=2
	add	x14, x14, x9
	sub	x15, x14, #2
	add	x12, x12, x11
	cmp	x15, x8
	b.hs	LBB0_2
LBB0_7:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12]
	ldr	d1, [x12, x13, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x12]
	fsub	d0, d0, d1
	str	d0, [x12, x13, lsl #3]
	cmp	x13, #1
	b.eq	LBB0_6
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=2
	ldr	d0, [x12, #8]
	add	x15, x12, x10
	ldr	d1, [x15, #8]
	fadd	d2, d0, d1
	str	d2, [x12, #8]
	fsub	d0, d0, d1
	str	d0, [x15, #8]
	cmp	x13, #2
	b.eq	LBB0_6
; %bb.9:                                ;   in Loop: Header=BB0_7 Depth=2
	ldr	d0, [x12, #16]
	ldr	d1, [x15, #16]
	fadd	d2, d0, d1
	str	d2, [x12, #16]
	fsub	d0, d0, d1
	str	d0, [x15, #16]
	b	LBB0_6
LBB0_10:                                ;   in Loop: Header=BB0_3 Depth=1
	and	x12, x13, #0xfffffffffffffffc
	subs	x13, x13, x12
	b.ne	LBB0_15
; %bb.11:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, x0
LBB0_12:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_13 Depth 3
	mov	x15, x14
	mov	x16, x12
LBB0_13:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_12 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x15]
	add	x17, x15, x10
	ldp	q2, q3, [x17]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x15], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x17]
	subs	x16, x16, #4
	b.ne	LBB0_13
; %bb.14:                               ;   in Loop: Header=BB0_12 Depth=2
	add	x14, x14, x11
	add	x13, x13, x9
	cmp	x13, x8
	b.lo	LBB0_12
	b	LBB0_2
LBB0_15:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, #0                         ; =0x0
	and	x15, x10, #0xffffffffffffffe0
	add	x15, x0, x15
	mov	x16, x0
LBB0_16:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_17 Depth 3
                                        ;       Child Loop BB0_19 Depth 3
	mov	x17, x16
	mov	x1, x12
LBB0_17:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x17]
	add	x2, x17, x10
	ldp	q2, q3, [x2]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x17], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x2]
	subs	x1, x1, #4
	b.ne	LBB0_17
; %bb.18:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	x17, x15
	mov	x1, x13
LBB0_19:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x17]
	ldr	d1, [x17, x10]
	fadd	d2, d0, d1
	str	d2, [x17]
	fsub	d0, d0, d1
	str	d0, [x17, x10]
	add	x17, x17, #8
	subs	x1, x1, #1
	b.ne	LBB0_19
; %bb.20:                               ;   in Loop: Header=BB0_16 Depth=2
	add	x16, x16, x11
	add	x15, x15, x11
	add	x14, x14, x9
	cmp	x14, x8
	b.lo	LBB0_16
	b	LBB0_2
LBB0_21:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_r2                          ; -- Begin function hn_r2
	.p2align	2
_hn_r2:                                 ; @hn_r2
	.cfi_startproc
; %bb.0:
	cbz	w1, LBB1_7
; %bb.1:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	sub	w20, w1, #1
	mov	w8, #1                          ; =0x1
	lsl	x21, x8, x20
	mov	x22, x1
	mov	x1, x20
	bl	_hn_r2
	add	x0, x19, x21, lsl #3
	mov	x1, x20
	bl	_hn_r2
	cmp	w22, #2
	b.hi	LBB1_4
; %bb.2:
	mov	x8, x21
LBB1_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19]
	ldr	d1, [x19, x21, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x19]
	fsub	d0, d0, d1
	str	d0, [x19, x21, lsl #3]
	add	x19, x19, #8
	subs	x8, x8, #1
	b.ne	LBB1_3
	b	LBB1_6
LBB1_4:
	and	x8, x21, #0xfffffffffffffffc
	lsl	x9, x21, #3
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x19]
	add	x10, x19, x9
	ldp	q2, q3, [x10]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x19], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x10]
	subs	x8, x8, #4
	b.ne	LBB1_5
LBB1_6:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
LBB1_7:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_r4                          ; -- Begin function hn_r4
	.p2align	2
_hn_r4:                                 ; @hn_r4
	.cfi_startproc
; %bb.0:
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
                                        ; kill: def $w1 killed $w1 def $x1
	mov	x19, x0
	cmp	w1, #1
	b.gt	LBB2_22
; %bb.1:
	cbz	w1, LBB2_31
; %bb.2:
	mov	w8, #1                          ; =0x1
	lsl	x8, x8, x1
	mov	w13, #1                         ; =0x1
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_4 Depth=1
	mov	x13, x9
	cmp	x9, x8
	b.hs	LBB2_31
LBB2_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_17 Depth 2
                                        ;       Child Loop BB2_18 Depth 3
                                        ;       Child Loop BB2_20 Depth 3
                                        ;     Child Loop BB2_13 Depth 2
                                        ;       Child Loop BB2_14 Depth 3
                                        ;     Child Loop BB2_8 Depth 2
	lsl	x9, x13, #1
	cbz	x13, LBB2_3
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=1
	lsl	x10, x13, #3
	lsl	x11, x13, #4
	cmp	x13, #3
	b.hi	LBB2_11
; %bb.6:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x12, x19
	mov	w14, #2                         ; =0x2
	b	LBB2_8
LBB2_7:                                 ;   in Loop: Header=BB2_8 Depth=2
	add	x14, x14, x9
	sub	x15, x14, #2
	add	x12, x12, x11
	cmp	x15, x8
	b.hs	LBB2_3
LBB2_8:                                 ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12]
	ldr	d1, [x12, x13, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x12]
	fsub	d0, d0, d1
	str	d0, [x12, x13, lsl #3]
	cmp	x13, #1
	b.eq	LBB2_7
; %bb.9:                                ;   in Loop: Header=BB2_8 Depth=2
	ldr	d0, [x12, #8]
	add	x15, x12, x10
	ldr	d1, [x15, #8]
	fadd	d2, d0, d1
	str	d2, [x12, #8]
	fsub	d0, d0, d1
	str	d0, [x15, #8]
	cmp	x13, #2
	b.eq	LBB2_7
; %bb.10:                               ;   in Loop: Header=BB2_8 Depth=2
	ldr	d0, [x12, #16]
	ldr	d1, [x15, #16]
	fadd	d2, d0, d1
	str	d2, [x12, #16]
	fsub	d0, d0, d1
	str	d0, [x15, #16]
	b	LBB2_7
LBB2_11:                                ;   in Loop: Header=BB2_4 Depth=1
	and	x12, x13, #0xfffffffffffffffc
	subs	x13, x13, x12
	b.ne	LBB2_16
; %bb.12:                               ;   in Loop: Header=BB2_4 Depth=1
	mov	x14, x19
LBB2_13:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_14 Depth 3
	mov	x15, x14
	mov	x16, x12
LBB2_14:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_13 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x15]
	add	x17, x15, x10
	ldp	q2, q3, [x17]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x15], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x17]
	subs	x16, x16, #4
	b.ne	LBB2_14
; %bb.15:                               ;   in Loop: Header=BB2_13 Depth=2
	add	x14, x14, x11
	add	x13, x13, x9
	cmp	x13, x8
	b.lo	LBB2_13
	b	LBB2_3
LBB2_16:                                ;   in Loop: Header=BB2_4 Depth=1
	mov	x14, #0                         ; =0x0
	and	x15, x10, #0xffffffffffffffe0
	add	x15, x19, x15
	mov	x16, x19
LBB2_17:                                ;   Parent Loop BB2_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_18 Depth 3
                                        ;       Child Loop BB2_20 Depth 3
	mov	x17, x16
	mov	x0, x12
LBB2_18:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_17 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x17]
	add	x1, x17, x10
	ldp	q2, q3, [x1]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x17], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x1]
	subs	x0, x0, #4
	b.ne	LBB2_18
; %bb.19:                               ;   in Loop: Header=BB2_17 Depth=2
	mov	x17, x15
	mov	x0, x13
LBB2_20:                                ;   Parent Loop BB2_4 Depth=1
                                        ;     Parent Loop BB2_17 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x17]
	ldr	d1, [x17, x10]
	fadd	d2, d0, d1
	str	d2, [x17]
	fsub	d0, d0, d1
	str	d0, [x17, x10]
	add	x17, x17, #8
	subs	x0, x0, #1
	b.ne	LBB2_20
; %bb.21:                               ;   in Loop: Header=BB2_17 Depth=2
	add	x16, x16, x11
	add	x15, x15, x11
	add	x14, x14, x9
	cmp	x14, x8
	b.lo	LBB2_17
	b	LBB2_3
LBB2_22:
	sub	w20, w1, #2
	mov	x0, x19
	mov	x1, x20
	bl	_hn_r4
	mov	w8, #1                          ; =0x1
	lsl	x21, x8, x20
	add	x0, x19, x21, lsl #3
	mov	x1, x20
	bl	_hn_r4
	mov	w8, #2                          ; =0x2
	lsl	x22, x8, x20
	add	x0, x19, x22, lsl #3
	mov	x1, x20
	bl	_hn_r4
	mov	w8, #3                          ; =0x3
	lsl	x23, x8, x20
	add	x0, x19, x23, lsl #3
	mov	x1, x20
	bl	_hn_r4
	cmp	w20, #3
	b.hi	LBB2_25
LBB2_23:
	mov	x8, x21
LBB2_24:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19]
	ldr	d1, [x19, x21, lsl #3]
	ldr	d2, [x19, x22, lsl #3]
	ldr	d3, [x19, x23, lsl #3]
	fadd	d4, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d1
	str	d3, [x19]
	fadd	d3, d0, d2
	str	d3, [x19, x21, lsl #3]
	fsub	d1, d4, d1
	str	d1, [x19, x22, lsl #3]
	fsub	d0, d0, d2
	str	d0, [x19, x23, lsl #3]
	add	x19, x19, #8
	subs	x8, x8, #1
	b.ne	LBB2_24
	b	LBB2_31
LBB2_25:
	mov	w8, #8                          ; =0x8
	lsl	x8, x8, x20
	mov	w9, #16                         ; =0x10
	lsl	x9, x9, x20
	add	x11, x19, x8
	add	x12, x11, x9
	mov	w8, #24                         ; =0x18
	lsl	x8, x8, x20
	add	x10, x11, x8
	cmp	x19, x10
	add	x13, x19, x9
	add	x14, x19, x8
	ccmp	x14, x11, #2, lo
	cset	w8, lo
	cmp	x11, x10
	ccmp	x14, x13, #2, lo
	cset	w9, lo
	cmp	x13, x10
	ccmp	x14, x12, #2, lo
	cset	w10, lo
	cmp	x13, x11
	ccmp	x19, x12, #2, lo
	b.lo	LBB2_23
; %bb.26:
	tbnz	w8, #0, LBB2_23
; %bb.27:
	tbnz	w9, #0, LBB2_23
; %bb.28:
	tbnz	w10, #0, LBB2_23
; %bb.29:
	lsl	x8, x23, #3
	and	x9, x21, #0xfffffffffffffffe
	lsl	x10, x22, #3
	lsl	x11, x21, #3
LBB2_30:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x19, x11]
	ldr	q1, [x19, x10]
	ldr	q2, [x19, x8]
	ldr	q3, [x19]
	fadd.2d	v4, v3, v0
	fsub.2d	v0, v3, v0
	fadd.2d	v3, v1, v2
	fsub.2d	v1, v1, v2
	fadd.2d	v2, v0, v1
	str	q2, [x19, x11]
	fadd.2d	v2, v4, v3
	fsub.2d	v3, v4, v3
	str	q3, [x19, x10]
	str	q2, [x19]
	fsub.2d	v0, v0, v1
	str	q0, [x19, x8]
	add	x19, x19, #16
	subs	x9, x9, #2
	b.ne	LBB2_30
LBB2_31:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_r8                          ; -- Begin function hn_r8
	.p2align	2
_hn_r8:                                 ; @hn_r8
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #192
	stp	x28, x27, [sp, #96]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #112]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #128]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #144]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #160]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #176]            ; 16-byte Folded Spill
	add	x29, sp, #176
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
                                        ; kill: def $w1 killed $w1 def $x1
	mov	x19, x0
	cmp	w1, #2
	b.gt	LBB3_22
; %bb.1:
	cbz	w1, LBB3_53
; %bb.2:
	mov	w8, #1                          ; =0x1
	lsl	x8, x8, x1
	mov	w13, #1                         ; =0x1
	b	LBB3_4
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=1
	mov	x13, x9
	cmp	x9, x8
	b.hs	LBB3_53
LBB3_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_17 Depth 2
                                        ;       Child Loop BB3_18 Depth 3
                                        ;       Child Loop BB3_20 Depth 3
                                        ;     Child Loop BB3_13 Depth 2
                                        ;       Child Loop BB3_14 Depth 3
                                        ;     Child Loop BB3_8 Depth 2
	lsl	x9, x13, #1
	cbz	x13, LBB3_3
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=1
	lsl	x10, x13, #3
	lsl	x11, x13, #4
	cmp	x13, #3
	b.hi	LBB3_11
; %bb.6:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x12, x19
	mov	w14, #2                         ; =0x2
	b	LBB3_8
LBB3_7:                                 ;   in Loop: Header=BB3_8 Depth=2
	add	x14, x14, x9
	sub	x15, x14, #2
	add	x12, x12, x11
	cmp	x15, x8
	b.hs	LBB3_3
LBB3_8:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12]
	ldr	d1, [x12, x13, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x12]
	fsub	d0, d0, d1
	str	d0, [x12, x13, lsl #3]
	cmp	x13, #1
	b.eq	LBB3_7
; %bb.9:                                ;   in Loop: Header=BB3_8 Depth=2
	ldr	d0, [x12, #8]
	add	x15, x12, x10
	ldr	d1, [x15, #8]
	fadd	d2, d0, d1
	str	d2, [x12, #8]
	fsub	d0, d0, d1
	str	d0, [x15, #8]
	cmp	x13, #2
	b.eq	LBB3_7
; %bb.10:                               ;   in Loop: Header=BB3_8 Depth=2
	ldr	d0, [x12, #16]
	ldr	d1, [x15, #16]
	fadd	d2, d0, d1
	str	d2, [x12, #16]
	fsub	d0, d0, d1
	str	d0, [x15, #16]
	b	LBB3_7
LBB3_11:                                ;   in Loop: Header=BB3_4 Depth=1
	and	x12, x13, #0xfffffffffffffffc
	subs	x13, x13, x12
	b.ne	LBB3_16
; %bb.12:                               ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, x19
LBB3_13:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_14 Depth 3
	mov	x15, x14
	mov	x16, x12
LBB3_14:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_13 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x15]
	add	x17, x15, x10
	ldp	q2, q3, [x17]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x15], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x17]
	subs	x16, x16, #4
	b.ne	LBB3_14
; %bb.15:                               ;   in Loop: Header=BB3_13 Depth=2
	add	x14, x14, x11
	add	x13, x13, x9
	cmp	x13, x8
	b.lo	LBB3_13
	b	LBB3_3
LBB3_16:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x14, #0                         ; =0x0
	and	x15, x10, #0xffffffffffffffe0
	add	x15, x19, x15
	mov	x16, x19
LBB3_17:                                ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_18 Depth 3
                                        ;       Child Loop BB3_20 Depth 3
	mov	x17, x16
	mov	x0, x12
LBB3_18:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_17 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x17]
	add	x1, x17, x10
	ldp	q2, q3, [x1]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x17], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x1]
	subs	x0, x0, #4
	b.ne	LBB3_18
; %bb.19:                               ;   in Loop: Header=BB3_17 Depth=2
	mov	x17, x15
	mov	x0, x13
LBB3_20:                                ;   Parent Loop BB3_4 Depth=1
                                        ;     Parent Loop BB3_17 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x17]
	ldr	d1, [x17, x10]
	fadd	d2, d0, d1
	str	d2, [x17]
	fsub	d0, d0, d1
	str	d0, [x17, x10]
	add	x17, x17, #8
	subs	x0, x0, #1
	b.ne	LBB3_20
; %bb.21:                               ;   in Loop: Header=BB3_17 Depth=2
	add	x16, x16, x11
	add	x15, x15, x11
	add	x14, x14, x9
	cmp	x14, x8
	b.lo	LBB3_17
	b	LBB3_3
LBB3_22:
	sub	w27, w1, #3
	mov	x0, x19
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #1                          ; =0x1
	lsl	x28, x8, x27
	add	x20, x19, x28, lsl #3
	mov	x0, x20
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #2                          ; =0x2
	lsl	x8, x8, x27
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	add	x21, x19, x8, lsl #3
	mov	x0, x21
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #3                          ; =0x3
	lsl	x8, x8, x27
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	add	x22, x19, x8, lsl #3
	mov	x0, x22
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #4                          ; =0x4
	lsl	x8, x8, x27
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	add	x23, x19, x8, lsl #3
	mov	x0, x23
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #5                          ; =0x5
	lsl	x8, x8, x27
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	add	x24, x19, x8, lsl #3
	mov	x0, x24
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #6                          ; =0x6
	lsl	x8, x8, x27
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	add	x25, x19, x8, lsl #3
	mov	x0, x25
	mov	x1, x27
	bl	_hn_r8
	mov	w8, #7                          ; =0x7
	lsl	x8, x8, x27
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	add	x26, x19, x8, lsl #3
	mov	x0, x26
	mov	x1, x27
	bl	_hn_r8
	cmp	w27, #4
	b.hi	LBB3_25
LBB3_23:
	mov	x8, #0                          ; =0x0
LBB3_24:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x8, lsl #3]
	ldr	d1, [x20, x8, lsl #3]
	ldr	d2, [x21, x8, lsl #3]
	ldr	d3, [x22, x8, lsl #3]
	ldr	d4, [x23, x8, lsl #3]
	ldr	d5, [x24, x8, lsl #3]
	ldr	d6, [x25, x8, lsl #3]
	ldr	d7, [x26, x8, lsl #3]
	fadd	d16, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d5
	fsub	d4, d4, d5
	fadd	d5, d6, d7
	fsub	d6, d6, d7
	fadd	d7, d16, d1
	fadd	d17, d0, d2
	fsub	d1, d16, d1
	fsub	d0, d0, d2
	fadd	d2, d3, d5
	fadd	d16, d4, d6
	fsub	d3, d3, d5
	fsub	d4, d4, d6
	fadd	d5, d7, d2
	str	d5, [x19, x8, lsl #3]
	fadd	d5, d17, d16
	str	d5, [x20, x8, lsl #3]
	fadd	d5, d1, d3
	str	d5, [x21, x8, lsl #3]
	fadd	d5, d0, d4
	str	d5, [x22, x8, lsl #3]
	fsub	d2, d7, d2
	str	d2, [x23, x8, lsl #3]
	fsub	d2, d17, d16
	str	d2, [x24, x8, lsl #3]
	fsub	d1, d1, d3
	str	d1, [x25, x8, lsl #3]
	fsub	d0, d0, d4
	str	d0, [x26, x8, lsl #3]
	add	x8, x8, #1
	cmp	x28, x8
	b.ne	LBB3_24
	b	LBB3_53
LBB3_25:
	mov	w8, #8                          ; =0x8
	lsl	x8, x8, x27
	mov	w9, #16                         ; =0x10
	lsl	x11, x9, x27
	add	x8, x19, x8
	add	x9, x8, x11
	mov	w10, #24                        ; =0x18
	lsl	x12, x10, x27
	add	x10, x8, x12
	cmp	x19, x10
	add	x11, x19, x11
	mov	w13, #32                        ; =0x20
	lsl	x13, x13, x27
	add	x14, x8, x13
	add	x4, x19, x12
	mov	w12, #40                        ; =0x28
	lsl	x15, x12, x27
	add	x12, x8, x15
	add	x5, x19, x13
	mov	w13, #48                        ; =0x30
	lsl	x16, x13, x27
	add	x13, x8, x16
	add	x30, x19, x15
	mov	w15, #56                        ; =0x38
	lsl	x15, x15, x27
	add	x27, x8, x15
	add	x7, x19, x16
	add	x6, x19, x15
	ccmp	x4, x8, #2, lo
	cset	w15, lo
	cmp	x19, x14
	ccmp	x5, x8, #2, lo
	cset	w16, lo
	cmp	x19, x12
	ccmp	x30, x8, #2, lo
	cset	w17, lo
	cmp	x19, x13
	ccmp	x7, x8, #2, lo
	cset	w0, lo
	cmp	x19, x27
	ccmp	x6, x8, #2, lo
	cset	w1, lo
	cmp	x8, x10
	ccmp	x4, x11, #2, lo
	cset	w2, lo
	cmp	x8, x14
	ccmp	x5, x11, #2, lo
	cset	w3, lo
	str	w3, [sp, #44]                   ; 4-byte Folded Spill
	cmp	x8, x12
	ccmp	x30, x11, #2, lo
	cset	w3, lo
	str	w3, [sp, #40]                   ; 4-byte Folded Spill
	cmp	x8, x13
	ccmp	x7, x11, #2, lo
	cset	w3, lo
	str	w3, [sp, #36]                   ; 4-byte Folded Spill
	cmp	x8, x27
	ccmp	x6, x11, #2, lo
	cset	w3, lo
	str	w3, [sp, #32]                   ; 4-byte Folded Spill
	cmp	x11, x10
	ccmp	x4, x9, #2, lo
	cset	w3, lo
	str	w3, [sp, #28]                   ; 4-byte Folded Spill
	cmp	x11, x14
	ccmp	x5, x9, #2, lo
	cset	w3, lo
	str	w3, [sp, #24]                   ; 4-byte Folded Spill
	cmp	x11, x12
	ccmp	x30, x9, #2, lo
	cset	w3, lo
	str	w3, [sp, #20]                   ; 4-byte Folded Spill
	cmp	x11, x13
	ccmp	x7, x9, #2, lo
	cset	w3, lo
	str	w3, [sp, #16]                   ; 4-byte Folded Spill
	cmp	x11, x27
	ccmp	x6, x9, #2, lo
	cset	w3, lo
	str	w3, [sp, #12]                   ; 4-byte Folded Spill
	cmp	x4, x14
	ccmp	x5, x10, #2, lo
	cset	w3, lo
	str	w3, [sp, #8]                    ; 4-byte Folded Spill
	cmp	x4, x12
	ccmp	x30, x10, #2, lo
	cset	w3, lo
	str	w3, [sp, #4]                    ; 4-byte Folded Spill
	cmp	x4, x13
	ccmp	x7, x10, #2, lo
	cset	w3, lo
	str	w3, [sp]                        ; 4-byte Folded Spill
	cmp	x4, x27
	ccmp	x6, x10, #2, lo
	cset	w10, lo
	cmp	x5, x12
	ccmp	x30, x14, #2, lo
	cset	w3, lo
	cmp	x5, x13
	ccmp	x7, x14, #2, lo
	cset	w4, lo
	cmp	x5, x27
	ccmp	x6, x14, #2, lo
	cset	w14, lo
	cmp	x30, x13
	ccmp	x7, x12, #2, lo
	cset	w5, lo
	cmp	x30, x27
	ccmp	x6, x12, #2, lo
	cset	w12, lo
	cmp	x7, x27
	ccmp	x6, x13, #2, lo
	cset	w13, lo
	cmp	x11, x8
	ccmp	x19, x9, #2, lo
	b.lo	LBB3_23
; %bb.26:
	tbnz	w15, #0, LBB3_23
; %bb.27:
	tbnz	w16, #0, LBB3_23
; %bb.28:
	tbnz	w17, #0, LBB3_23
; %bb.29:
	tbnz	w0, #0, LBB3_23
; %bb.30:
	tbnz	w1, #0, LBB3_23
; %bb.31:
	tbnz	w2, #0, LBB3_23
; %bb.32:
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.33:
	ldr	w8, [sp, #40]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.34:
	ldr	w8, [sp, #36]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.35:
	ldr	w8, [sp, #32]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.36:
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.37:
	ldr	w8, [sp, #24]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.38:
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.39:
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.40:
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.41:
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.42:
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.43:
	ldr	w8, [sp]                        ; 4-byte Folded Reload
	tbnz	w8, #0, LBB3_23
; %bb.44:
	tbnz	w10, #0, LBB3_23
; %bb.45:
	tbnz	w3, #0, LBB3_23
; %bb.46:
	tbnz	w4, #0, LBB3_23
; %bb.47:
	tbnz	w14, #0, LBB3_23
; %bb.48:
	tbnz	w5, #0, LBB3_23
; %bb.49:
	tbnz	w12, #0, LBB3_23
; %bb.50:
	tbnz	w13, #0, LBB3_23
; %bb.51:
	ldp	x8, x10, [sp, #48]              ; 16-byte Folded Reload
	lsl	x8, x8, #3
	and	x9, x28, #0xfffffffffffffffe
	lsl	x10, x10, #3
	ldp	x11, x12, [sp, #64]             ; 16-byte Folded Reload
	lsl	x11, x11, #3
	lsl	x12, x12, #3
	ldp	x13, x14, [sp, #80]             ; 16-byte Folded Reload
	lsl	x13, x13, #3
	lsl	x14, x14, #3
	lsl	x15, x28, #3
LBB3_52:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x19, x15]
	ldr	q1, [x19, x14]
	ldr	q2, [x19, x13]
	ldr	q3, [x19, x12]
	ldr	q4, [x19, x11]
	ldr	q5, [x19, x10]
	ldr	q6, [x19, x8]
	ldr	q7, [x19]
	fadd.2d	v16, v7, v0
	fsub.2d	v0, v7, v0
	fadd.2d	v7, v1, v2
	fsub.2d	v1, v1, v2
	fadd.2d	v2, v3, v4
	fsub.2d	v3, v3, v4
	fadd.2d	v4, v5, v6
	fsub.2d	v5, v5, v6
	fadd.2d	v6, v16, v7
	fadd.2d	v17, v0, v1
	fsub.2d	v7, v16, v7
	fsub.2d	v0, v0, v1
	fadd.2d	v1, v2, v4
	fadd.2d	v16, v3, v5
	fsub.2d	v2, v2, v4
	fsub.2d	v3, v3, v5
	fadd.2d	v4, v6, v1
	fadd.2d	v5, v17, v16
	str	q5, [x19, x15]
	fadd.2d	v5, v7, v2
	str	q5, [x19, x14]
	fadd.2d	v5, v0, v3
	str	q5, [x19, x13]
	fsub.2d	v1, v6, v1
	str	q1, [x19, x12]
	fsub.2d	v1, v17, v16
	str	q1, [x19, x11]
	fsub.2d	v1, v7, v2
	str	q1, [x19, x10]
	str	q4, [x19]
	fsub.2d	v0, v0, v3
	str	q0, [x19, x8]
	add	x19, x19, #16
	subs	x9, x9, #2
	b.ne	LBB3_52
LBB3_53:
	ldp	x29, x30, [sp, #176]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #160]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #192
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_h4                          ; -- Begin function hn_h4
	.p2align	2
_hn_h4:                                 ; @hn_h4
	.cfi_startproc
; %bb.0:
	mov	w2, #0                          ; =0x0
	b	_h4
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function h4
_h4:                                    ; @h4
	.cfi_startproc
; %bb.0:
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
	mov	x21, x2
	mov	x19, x0
	cmp	w1, #1
	b.gt	LBB5_24
; %bb.1:
	mov	w9, #1                          ; =0x1
	lsl	x8, x9, x21
	ucvtf	d0, x8
	mov	w8, w1
	mov	x10, x19
LBB5_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x10]
	fmul	d1, d1, d0
	str	d1, [x10], #8
	lsr	x11, x9, x8
	add	x9, x9, #1
	cbz	x11, LBB5_2
; %bb.3:
	cbz	w1, LBB5_33
; %bb.4:
	mov	w9, #1                          ; =0x1
	lsl	x8, x9, x8
	mov	w13, #1                         ; =0x1
	b	LBB5_6
LBB5_5:                                 ;   in Loop: Header=BB5_6 Depth=1
	mov	x13, x9
	cmp	x9, x8
	b.hs	LBB5_33
LBB5_6:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_19 Depth 2
                                        ;       Child Loop BB5_20 Depth 3
                                        ;       Child Loop BB5_22 Depth 3
                                        ;     Child Loop BB5_15 Depth 2
                                        ;       Child Loop BB5_16 Depth 3
                                        ;     Child Loop BB5_10 Depth 2
	lsl	x9, x13, #1
	cbz	x13, LBB5_5
; %bb.7:                                ;   in Loop: Header=BB5_6 Depth=1
	lsl	x10, x13, #3
	lsl	x11, x13, #4
	cmp	x13, #3
	b.hi	LBB5_13
; %bb.8:                                ;   in Loop: Header=BB5_6 Depth=1
	mov	x12, x19
	mov	w14, #2                         ; =0x2
	b	LBB5_10
LBB5_9:                                 ;   in Loop: Header=BB5_10 Depth=2
	add	x14, x14, x9
	sub	x15, x14, #2
	add	x12, x12, x11
	cmp	x15, x8
	b.hs	LBB5_5
LBB5_10:                                ;   Parent Loop BB5_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12]
	ldr	d1, [x12, x13, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x12]
	fsub	d0, d0, d1
	str	d0, [x12, x13, lsl #3]
	cmp	x13, #1
	b.eq	LBB5_9
; %bb.11:                               ;   in Loop: Header=BB5_10 Depth=2
	ldr	d0, [x12, #8]
	add	x15, x12, x10
	ldr	d1, [x15, #8]
	fadd	d2, d0, d1
	str	d2, [x12, #8]
	fsub	d0, d0, d1
	str	d0, [x15, #8]
	cmp	x13, #2
	b.eq	LBB5_9
; %bb.12:                               ;   in Loop: Header=BB5_10 Depth=2
	ldr	d0, [x12, #16]
	ldr	d1, [x15, #16]
	fadd	d2, d0, d1
	str	d2, [x12, #16]
	fsub	d0, d0, d1
	str	d0, [x15, #16]
	b	LBB5_9
LBB5_13:                                ;   in Loop: Header=BB5_6 Depth=1
	and	x12, x13, #0xfffffffffffffffc
	subs	x13, x13, x12
	b.ne	LBB5_18
; %bb.14:                               ;   in Loop: Header=BB5_6 Depth=1
	mov	x14, x19
LBB5_15:                                ;   Parent Loop BB5_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB5_16 Depth 3
	mov	x15, x14
	mov	x16, x12
LBB5_16:                                ;   Parent Loop BB5_6 Depth=1
                                        ;     Parent Loop BB5_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x15]
	add	x17, x15, x10
	ldp	q2, q3, [x17]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x15], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x17]
	subs	x16, x16, #4
	b.ne	LBB5_16
; %bb.17:                               ;   in Loop: Header=BB5_15 Depth=2
	add	x14, x14, x11
	add	x13, x13, x9
	cmp	x13, x8
	b.lo	LBB5_15
	b	LBB5_5
LBB5_18:                                ;   in Loop: Header=BB5_6 Depth=1
	mov	x14, #0                         ; =0x0
	and	x15, x10, #0xffffffffffffffe0
	add	x15, x19, x15
	mov	x16, x19
LBB5_19:                                ;   Parent Loop BB5_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB5_20 Depth 3
                                        ;       Child Loop BB5_22 Depth 3
	mov	x17, x16
	mov	x0, x12
LBB5_20:                                ;   Parent Loop BB5_6 Depth=1
                                        ;     Parent Loop BB5_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x17]
	add	x1, x17, x10
	ldp	q2, q3, [x1]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x17], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x1]
	subs	x0, x0, #4
	b.ne	LBB5_20
; %bb.21:                               ;   in Loop: Header=BB5_19 Depth=2
	mov	x17, x15
	mov	x0, x13
LBB5_22:                                ;   Parent Loop BB5_6 Depth=1
                                        ;     Parent Loop BB5_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x17]
	ldr	d1, [x17, x10]
	fadd	d2, d0, d1
	str	d2, [x17]
	fsub	d0, d0, d1
	str	d0, [x17, x10]
	add	x17, x17, #8
	subs	x0, x0, #1
	b.ne	LBB5_22
; %bb.23:                               ;   in Loop: Header=BB5_19 Depth=2
	add	x16, x16, x11
	add	x15, x15, x11
	add	x14, x14, x9
	cmp	x14, x8
	b.lo	LBB5_19
	b	LBB5_5
LBB5_24:
	sub	w20, w1, #2
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	bl	_h4
	mov	w8, #1                          ; =0x1
	lsl	x22, x8, x20
	add	x0, x19, x22, lsl #3
	add	w2, w21, #1
	mov	x1, x20
	bl	_h4
	mov	w8, #2                          ; =0x2
	lsl	x23, x8, x20
	add	x0, x19, x23, lsl #3
	add	w2, w21, #1
	mov	x1, x20
	bl	_h4
	mov	w8, #3                          ; =0x3
	lsl	x24, x8, x20
	add	x0, x19, x24, lsl #3
	add	w2, w21, #1
	mov	x1, x20
	bl	_h4
	cmp	w20, #3
	b.hi	LBB5_27
LBB5_25:
	mov	x8, x22
LBB5_26:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x22, lsl #3]
	ldr	d1, [x19]
	ldr	d2, [x19, x23, lsl #3]
	ldr	d3, [x19, x24, lsl #3]
	fadd	d4, d0, d2
	fadd	d4, d4, d3
	fmov	d5, #0.50000000
	fmul	d4, d4, d5
	fsub	d5, d1, d4
	fadd	d1, d1, d4
	str	d1, [x19]
	fadd	d1, d2, d5
	str	d1, [x19, x22, lsl #3]
	fadd	d0, d0, d5
	str	d0, [x19, x23, lsl #3]
	fadd	d0, d3, d5
	str	d0, [x19, x24, lsl #3]
	add	x19, x19, #8
	subs	x8, x8, #1
	b.ne	LBB5_26
	b	LBB5_33
LBB5_27:
	mov	w8, #8                          ; =0x8
	lsl	x8, x8, x20
	mov	w9, #16                         ; =0x10
	lsl	x9, x9, x20
	add	x11, x19, x8
	add	x12, x11, x9
	mov	w8, #24                         ; =0x18
	lsl	x8, x8, x20
	add	x10, x11, x8
	cmp	x19, x10
	add	x13, x19, x9
	add	x14, x19, x8
	ccmp	x14, x11, #2, lo
	cset	w8, lo
	cmp	x11, x10
	ccmp	x14, x13, #2, lo
	cset	w9, lo
	cmp	x13, x10
	ccmp	x14, x12, #2, lo
	cset	w10, lo
	cmp	x13, x11
	ccmp	x19, x12, #2, lo
	b.lo	LBB5_25
; %bb.28:
	tbnz	w8, #0, LBB5_25
; %bb.29:
	tbnz	w9, #0, LBB5_25
; %bb.30:
	tbnz	w10, #0, LBB5_25
; %bb.31:
	and	x8, x22, #0xfffffffffffffffe
	lsl	x9, x24, #3
	lsl	x10, x23, #3
	fmov.2d	v0, #0.50000000
	lsl	x11, x22, #3
LBB5_32:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x19, x11]
	ldr	q2, [x19, x10]
	ldr	q3, [x19, x9]
	ldr	q4, [x19]
	fadd.2d	v5, v1, v2
	fadd.2d	v5, v5, v3
	fmul.2d	v5, v5, v0
	fsub.2d	v6, v4, v5
	fadd.2d	v4, v4, v5
	fadd.2d	v2, v2, v6
	str	q2, [x19, x11]
	fadd.2d	v1, v1, v6
	str	q1, [x19, x10]
	str	q4, [x19]
	fadd.2d	v1, v3, v6
	str	q1, [x19, x9]
	add	x19, x19, #16
	subs	x8, x8, #2
	b.ne	LBB5_32
LBB5_33:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_h8                          ; -- Begin function hn_h8
	.p2align	2
_hn_h8:                                 ; @hn_h8
	.cfi_startproc
; %bb.0:
	mov	w2, #0                          ; =0x0
	b	_h8
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function h8
_h8:                                    ; @h8
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #208
	stp	x28, x27, [sp, #112]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #128]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #144]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #160]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #176]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
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
	mov	x28, x2
	mov	x19, x0
	cmp	w1, #2
	b.gt	LBB7_24
; %bb.1:
	mov	w9, #1                          ; =0x1
	lsl	x8, x9, x28
	ucvtf	d0, x8
	mov	w8, w1
	mov	x10, x19
LBB7_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x10]
	fmul	d1, d1, d0
	str	d1, [x10], #8
	lsr	x11, x9, x8
	add	x9, x9, #1
	cbz	x11, LBB7_2
; %bb.3:
	cbz	w1, LBB7_55
; %bb.4:
	mov	w9, #1                          ; =0x1
	lsl	x8, x9, x8
	mov	w13, #1                         ; =0x1
	b	LBB7_6
LBB7_5:                                 ;   in Loop: Header=BB7_6 Depth=1
	mov	x13, x9
	cmp	x9, x8
	b.hs	LBB7_55
LBB7_6:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_19 Depth 2
                                        ;       Child Loop BB7_20 Depth 3
                                        ;       Child Loop BB7_22 Depth 3
                                        ;     Child Loop BB7_15 Depth 2
                                        ;       Child Loop BB7_16 Depth 3
                                        ;     Child Loop BB7_10 Depth 2
	lsl	x9, x13, #1
	cbz	x13, LBB7_5
; %bb.7:                                ;   in Loop: Header=BB7_6 Depth=1
	lsl	x10, x13, #3
	lsl	x11, x13, #4
	cmp	x13, #3
	b.hi	LBB7_13
; %bb.8:                                ;   in Loop: Header=BB7_6 Depth=1
	mov	x12, x19
	mov	w14, #2                         ; =0x2
	b	LBB7_10
LBB7_9:                                 ;   in Loop: Header=BB7_10 Depth=2
	add	x14, x14, x9
	sub	x15, x14, #2
	add	x12, x12, x11
	cmp	x15, x8
	b.hs	LBB7_5
LBB7_10:                                ;   Parent Loop BB7_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12]
	ldr	d1, [x12, x13, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x12]
	fsub	d0, d0, d1
	str	d0, [x12, x13, lsl #3]
	cmp	x13, #1
	b.eq	LBB7_9
; %bb.11:                               ;   in Loop: Header=BB7_10 Depth=2
	ldr	d0, [x12, #8]
	add	x15, x12, x10
	ldr	d1, [x15, #8]
	fadd	d2, d0, d1
	str	d2, [x12, #8]
	fsub	d0, d0, d1
	str	d0, [x15, #8]
	cmp	x13, #2
	b.eq	LBB7_9
; %bb.12:                               ;   in Loop: Header=BB7_10 Depth=2
	ldr	d0, [x12, #16]
	ldr	d1, [x15, #16]
	fadd	d2, d0, d1
	str	d2, [x12, #16]
	fsub	d0, d0, d1
	str	d0, [x15, #16]
	b	LBB7_9
LBB7_13:                                ;   in Loop: Header=BB7_6 Depth=1
	and	x12, x13, #0xfffffffffffffffc
	subs	x13, x13, x12
	b.ne	LBB7_18
; %bb.14:                               ;   in Loop: Header=BB7_6 Depth=1
	mov	x14, x19
LBB7_15:                                ;   Parent Loop BB7_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_16 Depth 3
	mov	x15, x14
	mov	x16, x12
LBB7_16:                                ;   Parent Loop BB7_6 Depth=1
                                        ;     Parent Loop BB7_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x15]
	add	x17, x15, x10
	ldp	q2, q3, [x17]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x15], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x17]
	subs	x16, x16, #4
	b.ne	LBB7_16
; %bb.17:                               ;   in Loop: Header=BB7_15 Depth=2
	add	x14, x14, x11
	add	x13, x13, x9
	cmp	x13, x8
	b.lo	LBB7_15
	b	LBB7_5
LBB7_18:                                ;   in Loop: Header=BB7_6 Depth=1
	mov	x14, #0                         ; =0x0
	and	x15, x10, #0xffffffffffffffe0
	add	x15, x19, x15
	mov	x16, x19
LBB7_19:                                ;   Parent Loop BB7_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_20 Depth 3
                                        ;       Child Loop BB7_22 Depth 3
	mov	x17, x16
	mov	x0, x12
LBB7_20:                                ;   Parent Loop BB7_6 Depth=1
                                        ;     Parent Loop BB7_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x17]
	add	x1, x17, x10
	ldp	q2, q3, [x1]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x17], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x1]
	subs	x0, x0, #4
	b.ne	LBB7_20
; %bb.21:                               ;   in Loop: Header=BB7_19 Depth=2
	mov	x17, x15
	mov	x0, x13
LBB7_22:                                ;   Parent Loop BB7_6 Depth=1
                                        ;     Parent Loop BB7_19 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x17]
	ldr	d1, [x17, x10]
	fadd	d2, d0, d1
	str	d2, [x17]
	fsub	d0, d0, d1
	str	d0, [x17, x10]
	add	x17, x17, #8
	subs	x0, x0, #1
	b.ne	LBB7_22
; %bb.23:                               ;   in Loop: Header=BB7_19 Depth=2
	add	x16, x16, x11
	add	x15, x15, x11
	add	x14, x14, x9
	cmp	x14, x8
	b.lo	LBB7_19
	b	LBB7_5
LBB7_24:
	sub	w27, w1, #3
	mov	x0, x19
	mov	x1, x27
	mov	x2, x28
	bl	_h8
	mov	w8, #1                          ; =0x1
	lsl	x8, x8, x27
	stur	x8, [x29, #-88]                 ; 8-byte Folded Spill
	add	x20, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x20
	mov	x1, x27
	bl	_h8
	mov	w8, #2                          ; =0x2
	lsl	x8, x8, x27
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	add	x21, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x21
	mov	x1, x27
	bl	_h8
	mov	w8, #3                          ; =0x3
	lsl	x8, x8, x27
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	add	x22, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x22
	mov	x1, x27
	bl	_h8
	mov	w8, #4                          ; =0x4
	lsl	x8, x8, x27
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	add	x23, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x23
	mov	x1, x27
	bl	_h8
	mov	w8, #5                          ; =0x5
	lsl	x8, x8, x27
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	add	x24, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x24
	mov	x1, x27
	bl	_h8
	mov	w8, #6                          ; =0x6
	lsl	x8, x8, x27
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	add	x25, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x25
	mov	x1, x27
	bl	_h8
	mov	w8, #7                          ; =0x7
	lsl	x8, x8, x27
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	add	x26, x19, x8, lsl #3
	add	w2, w28, #1
	mov	x0, x26
	mov	x1, x27
	bl	_h8
	cmp	w27, #4
	b.hi	LBB7_27
LBB7_25:
	mov	x8, #0                          ; =0x0
	fmov	d0, #0.50000000
	ldur	x9, [x29, #-88]                 ; 8-byte Folded Reload
LBB7_26:                                ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x19, x8, lsl #3]
	ldr	d2, [x20, x8, lsl #3]
	ldr	d3, [x21, x8, lsl #3]
	ldr	d4, [x22, x8, lsl #3]
	ldr	d5, [x23, x8, lsl #3]
	ldr	d6, [x24, x8, lsl #3]
	ldr	d7, [x25, x8, lsl #3]
	ldr	d16, [x26, x8, lsl #3]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d1, d1, d20
	str	d1, [x19, x8, lsl #3]
	fadd	d1, d5, d21
	fadd	d5, d3, d1
	fadd	d5, d7, d5
	str	d5, [x20, x8, lsl #3]
	fadd	d5, d2, d1
	fadd	d5, d6, d5
	str	d5, [x21, x8, lsl #3]
	fadd	d1, d18, d1
	str	d1, [x22, x8, lsl #3]
	fadd	d1, d16, d21
	fadd	d5, d17, d4
	str	d5, [x23, x8, lsl #3]
	fadd	d3, d3, d1
	fadd	d3, d6, d3
	str	d3, [x24, x8, lsl #3]
	fadd	d1, d2, d1
	fadd	d1, d7, d1
	str	d1, [x25, x8, lsl #3]
	fadd	d1, d19, d4
	str	d1, [x26, x8, lsl #3]
	add	x8, x8, #1
	cmp	x9, x8
	b.ne	LBB7_26
	b	LBB7_55
LBB7_27:
	mov	w8, #8                          ; =0x8
	lsl	x8, x8, x27
	mov	w9, #16                         ; =0x10
	lsl	x11, x9, x27
	add	x8, x19, x8
	add	x9, x8, x11
	mov	w10, #24                        ; =0x18
	lsl	x12, x10, x27
	add	x10, x8, x12
	cmp	x19, x10
	add	x11, x19, x11
	mov	w13, #32                        ; =0x20
	lsl	x13, x13, x27
	add	x14, x8, x13
	add	x5, x19, x12
	mov	w12, #40                        ; =0x28
	lsl	x15, x12, x27
	add	x12, x8, x15
	add	x6, x19, x13
	mov	w13, #48                        ; =0x30
	lsl	x16, x13, x27
	add	x13, x8, x16
	add	x30, x19, x15
	mov	w15, #56                        ; =0x38
	lsl	x15, x15, x27
	add	x28, x8, x15
	add	x27, x19, x16
	add	x7, x19, x15
	ccmp	x5, x8, #2, lo
	cset	w15, lo
	cmp	x19, x14
	ccmp	x6, x8, #2, lo
	cset	w16, lo
	cmp	x19, x12
	ccmp	x30, x8, #2, lo
	cset	w17, lo
	cmp	x19, x13
	ccmp	x27, x8, #2, lo
	cset	w0, lo
	cmp	x19, x28
	ccmp	x7, x8, #2, lo
	cset	w1, lo
	cmp	x8, x10
	ccmp	x5, x11, #2, lo
	cset	w2, lo
	cmp	x8, x14
	ccmp	x6, x11, #2, lo
	cset	w3, lo
	cmp	x8, x12
	ccmp	x30, x11, #2, lo
	cset	w4, lo
	str	w4, [sp, #52]                   ; 4-byte Folded Spill
	cmp	x8, x13
	ccmp	x27, x11, #2, lo
	cset	w4, lo
	str	w4, [sp, #48]                   ; 4-byte Folded Spill
	cmp	x8, x28
	ccmp	x7, x11, #2, lo
	cset	w4, lo
	str	w4, [sp, #44]                   ; 4-byte Folded Spill
	cmp	x11, x10
	ccmp	x5, x9, #2, lo
	cset	w4, lo
	str	w4, [sp, #40]                   ; 4-byte Folded Spill
	cmp	x11, x14
	ccmp	x6, x9, #2, lo
	cset	w4, lo
	str	w4, [sp, #36]                   ; 4-byte Folded Spill
	cmp	x11, x12
	ccmp	x30, x9, #2, lo
	cset	w4, lo
	str	w4, [sp, #32]                   ; 4-byte Folded Spill
	cmp	x11, x13
	ccmp	x27, x9, #2, lo
	cset	w4, lo
	str	w4, [sp, #28]                   ; 4-byte Folded Spill
	cmp	x11, x28
	ccmp	x7, x9, #2, lo
	cset	w4, lo
	str	w4, [sp, #24]                   ; 4-byte Folded Spill
	cmp	x5, x14
	ccmp	x6, x10, #2, lo
	cset	w4, lo
	str	w4, [sp, #20]                   ; 4-byte Folded Spill
	cmp	x5, x12
	ccmp	x30, x10, #2, lo
	cset	w4, lo
	str	w4, [sp, #16]                   ; 4-byte Folded Spill
	cmp	x5, x13
	ccmp	x27, x10, #2, lo
	cset	w4, lo
	cmp	x5, x28
	ccmp	x7, x10, #2, lo
	cset	w10, lo
	cmp	x6, x12
	ccmp	x30, x14, #2, lo
	cset	w5, lo
	str	w5, [sp, #12]                   ; 4-byte Folded Spill
	cmp	x6, x13
	ccmp	x27, x14, #2, lo
	cset	w5, lo
	str	w5, [sp, #8]                    ; 4-byte Folded Spill
	cmp	x6, x28
	ccmp	x7, x14, #2, lo
	cset	w14, lo
	cmp	x30, x13
	ccmp	x27, x12, #2, lo
	cset	w5, lo
	cmp	x30, x28
	ccmp	x7, x12, #2, lo
	cset	w12, lo
	cmp	x27, x28
	ccmp	x7, x13, #2, lo
	cset	w13, lo
	cmp	x11, x8
	ccmp	x19, x9, #2, lo
	b.lo	LBB7_25
; %bb.28:
	tbnz	w15, #0, LBB7_25
; %bb.29:
	tbnz	w16, #0, LBB7_25
; %bb.30:
	tbnz	w17, #0, LBB7_25
; %bb.31:
	tbnz	w0, #0, LBB7_25
; %bb.32:
	tbnz	w1, #0, LBB7_25
; %bb.33:
	tbnz	w2, #0, LBB7_25
; %bb.34:
	tbnz	w3, #0, LBB7_25
; %bb.35:
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.36:
	ldr	w8, [sp, #48]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.37:
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.38:
	ldr	w8, [sp, #40]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.39:
	ldr	w8, [sp, #36]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.40:
	ldr	w8, [sp, #32]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.41:
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.42:
	ldr	w8, [sp, #24]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.43:
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.44:
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.45:
	tbnz	w4, #0, LBB7_25
; %bb.46:
	tbnz	w10, #0, LBB7_25
; %bb.47:
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.48:
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	tbnz	w8, #0, LBB7_25
; %bb.49:
	tbnz	w14, #0, LBB7_25
; %bb.50:
	tbnz	w5, #0, LBB7_25
; %bb.51:
	tbnz	w12, #0, LBB7_25
; %bb.52:
	tbnz	w13, #0, LBB7_25
; %bb.53:
	ldp	x8, x10, [sp, #56]              ; 16-byte Folded Reload
	lsl	x8, x8, #3
	ldur	x15, [x29, #-88]                ; 8-byte Folded Reload
	and	x9, x15, #0xfffffffffffffffe
	lsl	x10, x10, #3
	ldp	x11, x12, [sp, #72]             ; 16-byte Folded Reload
	lsl	x11, x11, #3
	lsl	x12, x12, #3
	ldp	x13, x14, [sp, #88]             ; 16-byte Folded Reload
	lsl	x13, x13, #3
	lsl	x14, x14, #3
	fmov.2d	v0, #0.50000000
	lsl	x15, x15, #3
LBB7_54:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x19]
	ldr	q2, [x19, x15]
	ldr	q3, [x19, x14]
	ldr	q4, [x19, x13]
	ldr	q5, [x19, x12]
	ldr	q6, [x19, x11]
	ldr	q7, [x19, x10]
	ldr	q16, [x19, x8]
	fadd.2d	v17, v2, v3
	fadd.2d	v18, v4, v16
	fadd.2d	v19, v6, v7
	fadd.2d	v20, v17, v18
	fadd.2d	v20, v19, v20
	fadd.2d	v20, v5, v20
	fmul.2d	v20, v20, v0
	fsub.2d	v21, v1, v20
	fadd.2d	v4, v4, v21
	fadd.2d	v5, v5, v21
	fadd.2d	v16, v16, v21
	fadd.2d	v21, v3, v5
	fadd.2d	v21, v7, v21
	str	q21, [x19, x15]
	fadd.2d	v21, v2, v5
	fadd.2d	v21, v6, v21
	str	q21, [x19, x14]
	fadd.2d	v5, v18, v5
	str	q5, [x19, x13]
	fadd.2d	v1, v1, v20
	fadd.2d	v5, v17, v4
	str	q5, [x19, x12]
	fadd.2d	v3, v3, v16
	fadd.2d	v3, v6, v3
	str	q3, [x19, x11]
	fadd.2d	v2, v2, v16
	fadd.2d	v2, v7, v2
	str	q2, [x19, x10]
	str	q1, [x19]
	fadd.2d	v1, v19, v4
	str	q1, [x19, x8]
	add	x19, x19, #16
	subs	x9, x9, #2
	b.ne	LBB7_54
LBB7_55:
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #176]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #208
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_i4                          ; -- Begin function hn_i4
	.p2align	2
_hn_i4:                                 ; @hn_i4
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 96
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
                                        ; kill: def $w1 killed $w1 def $x1
	mov	w9, #1                          ; =0x1
	lsl	x8, x9, x1
	cmp	w1, #2
	b.ge	LBB8_2
; %bb.1:
	mov	w10, #0                         ; =0x0
	cmp	w10, w1
	b.lt	LBB8_23
	b	LBB8_21
LBB8_2:
	add	x10, x0, #16
	mov	w11, #2                         ; =0x2
	mov	w9, #1                          ; =0x1
	b	LBB8_4
LBB8_3:                                 ;   in Loop: Header=BB8_4 Depth=1
	add	w11, w11, #2
	cmp	w11, w1
	b.gt	LBB8_20
LBB8_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_12 Depth 2
                                        ;       Child Loop BB8_16 Depth 3
                                        ;       Child Loop BB8_19 Depth 3
                                        ;     Child Loop BB8_8 Depth 2
	mov	x12, x9
	lsl	x9, x9, #2
	cbz	x12, LBB8_3
; %bb.5:                                ;   in Loop: Header=BB8_4 Depth=1
	lsl	x13, x12, #4
	add	x14, x12, x12, lsl #1
	lsl	x14, x14, #3
	lsl	x15, x12, #5
	lsl	x16, x12, #3
	cmp	x12, #4
	b.hs	LBB8_10
; %bb.6:                                ;   in Loop: Header=BB8_4 Depth=1
	mov	x17, #0                         ; =0x0
	mov	x2, x10
	b	LBB8_8
LBB8_7:                                 ;   in Loop: Header=BB8_8 Depth=2
	add	x2, x2, x15
	add	x17, x17, x9
	cmp	x17, x8
	b.hs	LBB8_3
LBB8_8:                                 ;   Parent Loop BB8_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	d0, [x2, #-16]
	add	x3, x2, x16
	ldur	d1, [x3, #-16]
	add	x4, x2, x13
	ldur	d2, [x4, #-16]
	add	x5, x2, x14
	ldur	d3, [x5, #-16]
	fadd	d4, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d1
	stur	d3, [x2, #-16]
	fadd	d3, d0, d2
	stur	d3, [x3, #-16]
	fsub	d1, d4, d1
	stur	d1, [x4, #-16]
	fsub	d0, d0, d2
	stur	d0, [x5, #-16]
	cmp	x12, #1
	b.eq	LBB8_7
; %bb.9:                                ;   in Loop: Header=BB8_8 Depth=2
	ldur	d0, [x2, #-8]
	ldur	d1, [x3, #-8]
	ldur	d2, [x4, #-8]
	ldur	d3, [x5, #-8]
	fadd	d4, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d1
	stur	d3, [x2, #-8]
	fadd	d3, d0, d2
	stur	d3, [x3, #-8]
	fsub	d1, d4, d1
	stur	d1, [x4, #-8]
	fsub	d0, d0, d2
	stur	d0, [x5, #-8]
	ldr	d0, [x2]
	ldr	d1, [x3]
	ldr	d2, [x4]
	ldr	d3, [x5]
	fadd	d4, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d1
	str	d3, [x2]
	fadd	d3, d0, d2
	str	d3, [x3]
	fsub	d1, d4, d1
	str	d1, [x4]
	fsub	d0, d0, d2
	str	d0, [x5]
	b	LBB8_7
LBB8_10:                                ;   in Loop: Header=BB8_4 Depth=1
	mov	x17, #0                         ; =0x0
	mov	x2, #0                          ; =0x0
	add	x3, x0, x15
	add	x4, x0, x14
	add	x5, x0, x13
	add	x6, x0, x16
	and	x7, x12, #0xfffffffffffffffc
	mov	x19, x6
	mov	x20, x5
	mov	x21, x4
	mov	x22, x0
	b	LBB8_12
LBB8_11:                                ;   in Loop: Header=BB8_12 Depth=2
	add	x17, x17, #1
	add	x22, x22, x15
	add	x21, x21, x15
	add	x20, x20, x15
	add	x19, x19, x15
	add	x2, x2, x9
	cmp	x2, x8
	b.hs	LBB8_3
LBB8_12:                                ;   Parent Loop BB8_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB8_16 Depth 3
                                        ;       Child Loop BB8_19 Depth 3
	mov	x23, #0                         ; =0x0
	mul	x25, x15, x17
	add	x26, x3, x25
	add	x27, x4, x25
	add	x28, x6, x25
	add	x30, x0, x25
	cmp	x30, x26
	ccmp	x27, x28, #2, lo
	cset	w24, lo
	cmp	x28, x26
	add	x26, x5, x25
	ccmp	x27, x26, #2, lo
	cset	w25, lo
	cmp	x26, x28
	ccmp	x30, x27, #2, lo
	b.lo	LBB8_18
; %bb.13:                               ;   in Loop: Header=BB8_12 Depth=2
	tbnz	w24, #0, LBB8_18
; %bb.14:                               ;   in Loop: Header=BB8_12 Depth=2
	tbnz	w25, #0, LBB8_18
; %bb.15:                               ;   in Loop: Header=BB8_12 Depth=2
	mov	x23, x22
	mov	x24, x7
LBB8_16:                                ;   Parent Loop BB8_4 Depth=1
                                        ;     Parent Loop BB8_12 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q0, [x23, x16]
	ldr	q1, [x23, x13]
	ldr	q2, [x23, x14]
	ldr	q3, [x23]
	fadd.2d	v4, v3, v0
	fsub.2d	v0, v3, v0
	fadd.2d	v3, v1, v2
	fsub.2d	v1, v1, v2
	fadd.2d	v2, v0, v1
	str	q2, [x23, x16]
	fadd.2d	v2, v4, v3
	fsub.2d	v3, v4, v3
	str	q3, [x23, x13]
	str	q2, [x23]
	fsub.2d	v0, v0, v1
	str	q0, [x23, x14]
	add	x23, x23, #16
	subs	x24, x24, #2
	b.ne	LBB8_16
; %bb.17:                               ;   in Loop: Header=BB8_12 Depth=2
	mov	x23, x7
	cmp	x12, x7
	b.eq	LBB8_11
LBB8_18:                                ;   in Loop: Header=BB8_12 Depth=2
	mov	x24, #0                         ; =0x0
	sub	x25, x12, x23
	lsl	x28, x23, #3
	add	x23, x22, x28
	add	x26, x21, x28
	add	x27, x20, x28
	add	x28, x19, x28
LBB8_19:                                ;   Parent Loop BB8_4 Depth=1
                                        ;     Parent Loop BB8_12 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x23, x24, lsl #3]
	ldr	d1, [x28, x24, lsl #3]
	ldr	d2, [x27, x24, lsl #3]
	ldr	d3, [x26, x24, lsl #3]
	fadd	d4, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d1
	str	d3, [x23, x24, lsl #3]
	fadd	d3, d0, d2
	str	d3, [x28, x24, lsl #3]
	fsub	d1, d4, d1
	str	d1, [x27, x24, lsl #3]
	fsub	d0, d0, d2
	str	d0, [x26, x24, lsl #3]
	add	x24, x24, #1
	cmp	x25, x24
	b.ne	LBB8_19
	b	LBB8_11
LBB8_20:
	and	w10, w1, #0x7ffffffe
	cmp	w10, w1
	b.lt	LBB8_23
LBB8_21:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB8_22:                                ;   in Loop: Header=BB8_23 Depth=1
	add	w10, w10, #1
	mov	x9, x11
	cmp	w10, w1
	b.eq	LBB8_21
LBB8_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_36 Depth 2
                                        ;       Child Loop BB8_37 Depth 3
                                        ;       Child Loop BB8_39 Depth 3
                                        ;     Child Loop BB8_32 Depth 2
                                        ;       Child Loop BB8_33 Depth 3
                                        ;     Child Loop BB8_27 Depth 2
	lsl	x11, x9, #1
	cbz	x9, LBB8_22
; %bb.24:                               ;   in Loop: Header=BB8_23 Depth=1
	cmp	x9, #3
	b.hi	LBB8_30
; %bb.25:                               ;   in Loop: Header=BB8_23 Depth=1
	lsl	x12, x9, #3
	lsl	x13, x9, #4
	mov	x14, x0
	mov	w15, #2                         ; =0x2
	b	LBB8_27
LBB8_26:                                ;   in Loop: Header=BB8_27 Depth=2
	add	x15, x15, x11
	sub	x16, x15, #2
	add	x14, x14, x13
	cmp	x16, x8
	b.hs	LBB8_22
LBB8_27:                                ;   Parent Loop BB8_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x14]
	ldr	d1, [x14, x9, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x14]
	fsub	d0, d0, d1
	str	d0, [x14, x9, lsl #3]
	cmp	x9, #1
	b.eq	LBB8_26
; %bb.28:                               ;   in Loop: Header=BB8_27 Depth=2
	ldr	d0, [x14, #8]
	add	x16, x14, x12
	ldr	d1, [x16, #8]
	fadd	d2, d0, d1
	str	d2, [x14, #8]
	fsub	d0, d0, d1
	str	d0, [x16, #8]
	cmp	x9, #2
	b.eq	LBB8_26
; %bb.29:                               ;   in Loop: Header=BB8_27 Depth=2
	ldr	d0, [x14, #16]
	ldr	d1, [x16, #16]
	fadd	d2, d0, d1
	str	d2, [x14, #16]
	fsub	d0, d0, d1
	str	d0, [x16, #16]
	b	LBB8_26
LBB8_30:                                ;   in Loop: Header=BB8_23 Depth=1
	and	x12, x9, #0xfffffffffffffffc
	lsl	x13, x9, #4
	lsl	x14, x9, #3
	subs	x9, x9, x12
	b.ne	LBB8_35
; %bb.31:                               ;   in Loop: Header=BB8_23 Depth=1
	mov	x15, x0
LBB8_32:                                ;   Parent Loop BB8_23 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB8_33 Depth 3
	mov	x16, x15
	mov	x17, x12
LBB8_33:                                ;   Parent Loop BB8_23 Depth=1
                                        ;     Parent Loop BB8_32 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x16]
	add	x2, x16, x14
	ldp	q2, q3, [x2]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x16], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x2]
	subs	x17, x17, #4
	b.ne	LBB8_33
; %bb.34:                               ;   in Loop: Header=BB8_32 Depth=2
	add	x15, x15, x13
	add	x9, x9, x11
	cmp	x9, x8
	b.lo	LBB8_32
	b	LBB8_22
LBB8_35:                                ;   in Loop: Header=BB8_23 Depth=1
	mov	x15, #0                         ; =0x0
	and	x16, x14, #0xffffffffffffffe0
	add	x16, x0, x16
	mov	x17, x0
LBB8_36:                                ;   Parent Loop BB8_23 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB8_37 Depth 3
                                        ;       Child Loop BB8_39 Depth 3
	mov	x2, x17
	mov	x3, x12
LBB8_37:                                ;   Parent Loop BB8_23 Depth=1
                                        ;     Parent Loop BB8_36 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x2]
	add	x4, x2, x14
	ldp	q2, q3, [x4]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x2], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x4]
	subs	x3, x3, #4
	b.ne	LBB8_37
; %bb.38:                               ;   in Loop: Header=BB8_36 Depth=2
	mov	x2, x16
	mov	x3, x9
LBB8_39:                                ;   Parent Loop BB8_23 Depth=1
                                        ;     Parent Loop BB8_36 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x2]
	ldr	d1, [x2, x14]
	fadd	d2, d0, d1
	str	d2, [x2]
	fsub	d0, d0, d1
	str	d0, [x2, x14]
	add	x2, x2, #8
	subs	x3, x3, #1
	b.ne	LBB8_39
; %bb.40:                               ;   in Loop: Header=BB8_36 Depth=2
	add	x17, x17, x13
	add	x16, x16, x13
	add	x15, x15, x11
	cmp	x15, x8
	b.lo	LBB8_36
	b	LBB8_22
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_i8                          ; -- Begin function hn_i8
	.p2align	2
_hn_i8:                                 ; @hn_i8
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #304
	stp	x28, x27, [sp, #208]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #224]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #240]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #256]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #272]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #288]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 304
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
                                        ; kill: def $w1 killed $w1 def $x1
	str	x0, [sp, #112]                  ; 8-byte Folded Spill
	mov	w9, #1                          ; =0x1
	lsl	x19, x9, x1
	subs	w8, w1, #3
	b.ge	LBB9_2
; %bb.1:
	mov	w10, #0                         ; =0x0
	cmp	w10, w1
	b.lt	LBB9_38
	b	LBB9_36
LBB9_2:
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	mov	w8, #3                          ; =0x3
	mov	w11, #1                         ; =0x1
	str	x1, [sp, #24]                   ; 8-byte Folded Spill
	str	x19, [sp, #192]                 ; 8-byte Folded Spill
	b	LBB9_4
LBB9_3:                                 ;   in Loop: Header=BB9_4 Depth=1
	ldr	w8, [sp, #36]                   ; 4-byte Folded Reload
	add	w8, w8, #3
	mov	x11, x9
	ldr	x1, [sp, #24]                   ; 8-byte Folded Reload
	cmp	w8, w1
	b.gt	LBB9_35
LBB9_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_7 Depth 2
                                        ;       Child Loop BB9_33 Depth 3
                                        ;       Child Loop BB9_10 Depth 3
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	lsl	x9, x11, #3
	cbz	x11, LBB9_3
; %bb.5:                                ;   in Loop: Header=BB9_4 Depth=1
	mov	x13, #0                         ; =0x0
	mov	x14, #0                         ; =0x0
	add	x8, x11, x11, lsl #1
	add	x10, x11, x11, lsl #2
	lsl	x15, x11, #5
	lsl	x16, x11, #6
	ldr	x0, [sp, #112]                  ; 8-byte Folded Reload
	add	x12, x0, x16
	str	x12, [sp, #104]                 ; 8-byte Folded Spill
	lsl	x2, x10, #3
	lsl	x3, x8, #4
	sub	x4, x16, x9
	add	x5, x0, x4
	add	x6, x0, x3
	add	x7, x0, x2
	add	x30, x0, x15
	lsl	x20, x8, #3
	add	x28, x0, x20
	lsl	x22, x11, #4
	add	x27, x0, x22
	add	x26, x0, x9
	and	x8, x11, #0xfffffffffffffff8
	stp	x8, x26, [sp, #40]              ; 16-byte Folded Spill
	stp	x27, x28, [sp, #56]             ; 16-byte Folded Spill
	stp	x30, x7, [sp, #72]              ; 16-byte Folded Spill
	stp	x6, x5, [sp, #88]               ; 16-byte Folded Spill
	str	x11, [sp, #200]                 ; 8-byte Folded Spill
	b	LBB9_7
LBB9_6:                                 ;   in Loop: Header=BB9_7 Depth=2
	add	x13, x13, #1
	add	x0, x0, x16
	add	x5, x5, x16
	add	x6, x6, x16
	add	x7, x7, x16
	add	x30, x30, x16
	add	x28, x28, x16
	add	x27, x27, x16
	add	x26, x26, x16
	add	x14, x14, x9
	ldp	x19, x11, [sp, #192]            ; 16-byte Folded Reload
	cmp	x14, x19
	b.hs	LBB9_3
LBB9_7:                                 ;   Parent Loop BB9_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_33 Depth 3
                                        ;       Child Loop BB9_10 Depth 3
	cmp	x11, #8
	b.hs	LBB9_11
; %bb.8:                                ;   in Loop: Header=BB9_7 Depth=2
	mov	x25, #0                         ; =0x0
LBB9_9:                                 ;   in Loop: Header=BB9_7 Depth=2
	mov	x1, #0                          ; =0x0
	ldr	x8, [sp, #200]                  ; 8-byte Folded Reload
	sub	x11, x8, x25
	lsl	x24, x25, #3
	add	x10, x0, x24
	add	x19, x5, x24
	add	x17, x6, x24
	add	x8, x7, x24
	add	x12, x30, x24
	add	x21, x28, x24
	add	x23, x27, x24
	add	x24, x26, x24
LBB9_10:                                ;   Parent Loop BB9_4 Depth=1
                                        ;     Parent Loop BB9_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x10, x1, lsl #3]
	ldr	d1, [x24, x1, lsl #3]
	ldr	d2, [x23, x1, lsl #3]
	ldr	d3, [x21, x1, lsl #3]
	ldr	d4, [x12, x1, lsl #3]
	ldr	d5, [x8, x1, lsl #3]
	ldr	d6, [x17, x1, lsl #3]
	ldr	d7, [x19, x1, lsl #3]
	fadd	d16, d0, d1
	fsub	d0, d0, d1
	fadd	d1, d2, d3
	fsub	d2, d2, d3
	fadd	d3, d4, d5
	fsub	d4, d4, d5
	fadd	d5, d6, d7
	fsub	d6, d6, d7
	fadd	d7, d16, d1
	fadd	d17, d0, d2
	fsub	d1, d16, d1
	fsub	d0, d0, d2
	fadd	d2, d3, d5
	fadd	d16, d4, d6
	fsub	d3, d3, d5
	fsub	d4, d4, d6
	fadd	d5, d7, d2
	str	d5, [x10, x1, lsl #3]
	fadd	d5, d17, d16
	str	d5, [x24, x1, lsl #3]
	fadd	d5, d1, d3
	str	d5, [x23, x1, lsl #3]
	fadd	d5, d0, d4
	str	d5, [x21, x1, lsl #3]
	fsub	d2, d7, d2
	str	d2, [x12, x1, lsl #3]
	fsub	d2, d17, d16
	str	d2, [x8, x1, lsl #3]
	fsub	d1, d1, d3
	str	d1, [x17, x1, lsl #3]
	fsub	d0, d0, d4
	str	d0, [x19, x1, lsl #3]
	add	x1, x1, #1
	cmp	x11, x1
	b.ne	LBB9_10
	b	LBB9_6
LBB9_11:                                ;   in Loop: Header=BB9_7 Depth=2
	mov	x25, #0                         ; =0x0
	mul	x8, x16, x13
	ldr	x10, [sp, #72]                  ; 8-byte Folded Reload
	add	x1, x10, x8
	ldr	x10, [sp, #112]                 ; 8-byte Folded Reload
	add	x11, x10, x8
	cmp	x11, x1
	ldr	x10, [sp, #88]                  ; 8-byte Folded Reload
	add	x23, x10, x8
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	add	x19, x10, x8
	ldr	x10, [sp, #48]                  ; 8-byte Folded Reload
	add	x24, x10, x8
	ccmp	x19, x24, #2, lo
	cset	w10, lo
	str	w10, [sp, #188]                 ; 4-byte Folded Spill
	ldr	x10, [sp, #80]                  ; 8-byte Folded Reload
	add	x17, x10, x8
	cmp	x11, x17
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	add	x10, x10, x8
	ccmp	x1, x24, #2, lo
	cset	w12, lo
	str	w12, [sp, #184]                 ; 4-byte Folded Spill
	cmp	x11, x23
	ccmp	x17, x24, #2, lo
	cset	w12, lo
	str	w12, [sp, #180]                 ; 4-byte Folded Spill
	ldr	x12, [sp, #96]                  ; 8-byte Folded Reload
	add	x21, x12, x8
	cmp	x11, x21
	ccmp	x23, x24, #2, lo
	cset	w12, lo
	str	w12, [sp, #176]                 ; 4-byte Folded Spill
	ldr	x12, [sp, #104]                 ; 8-byte Folded Reload
	add	x8, x12, x8
	cmp	x11, x8
	ccmp	x21, x24, #2, lo
	cset	w12, lo
	str	w12, [sp, #172]                 ; 4-byte Folded Spill
	cmp	x24, x1
	ccmp	x19, x10, #2, lo
	cset	w12, lo
	str	w12, [sp, #168]                 ; 4-byte Folded Spill
	cmp	x24, x17
	ccmp	x1, x10, #2, lo
	cset	w12, lo
	str	w12, [sp, #164]                 ; 4-byte Folded Spill
	cmp	x24, x23
	ccmp	x17, x10, #2, lo
	cset	w12, lo
	str	w12, [sp, #160]                 ; 4-byte Folded Spill
	cmp	x24, x21
	ccmp	x23, x10, #2, lo
	cset	w12, lo
	str	w12, [sp, #156]                 ; 4-byte Folded Spill
	cmp	x24, x8
	ccmp	x21, x10, #2, lo
	cset	w12, lo
	str	w12, [sp, #152]                 ; 4-byte Folded Spill
	cmp	x10, x17
	ccmp	x1, x19, #2, lo
	cset	w12, lo
	str	w12, [sp, #148]                 ; 4-byte Folded Spill
	cmp	x10, x23
	ccmp	x17, x19, #2, lo
	cset	w12, lo
	str	w12, [sp, #144]                 ; 4-byte Folded Spill
	cmp	x10, x21
	ccmp	x23, x19, #2, lo
	cset	w12, lo
	str	w12, [sp, #140]                 ; 4-byte Folded Spill
	cmp	x10, x8
	ccmp	x21, x19, #2, lo
	cset	w12, lo
	str	w12, [sp, #136]                 ; 4-byte Folded Spill
	cmp	x19, x23
	ccmp	x17, x1, #2, lo
	cset	w12, lo
	str	w12, [sp, #132]                 ; 4-byte Folded Spill
	cmp	x19, x21
	ccmp	x23, x1, #2, lo
	cset	w12, lo
	str	w12, [sp, #128]                 ; 4-byte Folded Spill
	cmp	x19, x8
	ccmp	x21, x1, #2, lo
	cset	w12, lo
	str	w12, [sp, #124]                 ; 4-byte Folded Spill
	cmp	x1, x21
	ccmp	x23, x17, #2, lo
	cset	w12, lo
	str	w12, [sp, #120]                 ; 4-byte Folded Spill
	cmp	x1, x8
	ccmp	x21, x17, #2, lo
	cset	w1, lo
	cmp	x17, x8
	ccmp	x21, x23, #2, lo
	cset	w23, lo
	cmp	x10, x24
	ccmp	x11, x19, #2, lo
	b.lo	LBB9_9
; %bb.12:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #188]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.13:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #184]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.14:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #180]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.15:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #176]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.16:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #172]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.17:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #168]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.18:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #164]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.19:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #160]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.20:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #156]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.21:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #152]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.22:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #148]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.23:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #144]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.24:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #140]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.25:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #136]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.26:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #132]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.27:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #128]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.28:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #124]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.29:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	w8, [sp, #120]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB9_9
; %bb.30:                               ;   in Loop: Header=BB9_7 Depth=2
	tbnz	w1, #0, LBB9_9
; %bb.31:                               ;   in Loop: Header=BB9_7 Depth=2
	tbnz	w23, #0, LBB9_9
; %bb.32:                               ;   in Loop: Header=BB9_7 Depth=2
	mov	x8, x0
	ldr	x10, [sp, #40]                  ; 8-byte Folded Reload
LBB9_33:                                ;   Parent Loop BB9_4 Depth=1
                                        ;     Parent Loop BB9_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q0, [x8, x9]
	ldr	q1, [x8, x22]
	ldr	q2, [x8, x20]
	ldr	q3, [x8, x15]
	ldr	q4, [x8, x2]
	ldr	q5, [x8, x3]
	ldr	q6, [x8, x4]
	ldr	q7, [x8]
	fadd.2d	v16, v7, v0
	fsub.2d	v0, v7, v0
	fadd.2d	v7, v1, v2
	fsub.2d	v1, v1, v2
	fadd.2d	v2, v3, v4
	fsub.2d	v3, v3, v4
	fadd.2d	v4, v5, v6
	fsub.2d	v5, v5, v6
	fadd.2d	v6, v16, v7
	fadd.2d	v17, v0, v1
	fsub.2d	v7, v16, v7
	fsub.2d	v0, v0, v1
	fadd.2d	v1, v2, v4
	fadd.2d	v16, v3, v5
	fsub.2d	v2, v2, v4
	fsub.2d	v3, v3, v5
	fadd.2d	v4, v6, v1
	fadd.2d	v5, v17, v16
	str	q5, [x8, x9]
	fadd.2d	v5, v7, v2
	str	q5, [x8, x22]
	fadd.2d	v5, v0, v3
	str	q5, [x8, x20]
	fsub.2d	v1, v6, v1
	str	q1, [x8, x15]
	fsub.2d	v1, v17, v16
	str	q1, [x8, x2]
	fsub.2d	v1, v7, v2
	str	q1, [x8, x3]
	str	q4, [x8]
	fsub.2d	v0, v0, v3
	str	q0, [x8, x4]
	add	x8, x8, #16
	subs	x10, x10, #2
	b.ne	LBB9_33
; %bb.34:                               ;   in Loop: Header=BB9_7 Depth=2
	ldr	x10, [sp, #40]                  ; 8-byte Folded Reload
	mov	x25, x10
	ldr	x8, [sp, #200]                  ; 8-byte Folded Reload
	cmp	x8, x10
	b.eq	LBB9_6
	b	LBB9_9
LBB9_35:
	mov	w8, #43691                      ; =0xaaab
	movk	w8, #43690, lsl #16
	ldr	w10, [sp, #20]                  ; 4-byte Folded Reload
	umull	x8, w10, w8
	lsr	x8, x8, #33
	add	w8, w8, w8, lsl #1
	add	w10, w8, #3
	cmp	w10, w1
	b.lt	LBB9_38
LBB9_36:
	ldp	x29, x30, [sp, #288]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #272]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #256]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #240]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #224]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #208]            ; 16-byte Folded Reload
	add	sp, sp, #304
	ret
LBB9_37:                                ;   in Loop: Header=BB9_38 Depth=1
	add	w10, w10, #1
	mov	x9, x11
	cmp	w10, w1
	b.eq	LBB9_36
LBB9_38:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_51 Depth 2
                                        ;       Child Loop BB9_52 Depth 3
                                        ;       Child Loop BB9_54 Depth 3
                                        ;     Child Loop BB9_47 Depth 2
                                        ;       Child Loop BB9_48 Depth 3
                                        ;     Child Loop BB9_42 Depth 2
	lsl	x11, x9, #1
	cbz	x9, LBB9_37
; %bb.39:                               ;   in Loop: Header=BB9_38 Depth=1
	cmp	x9, #3
	b.hi	LBB9_45
; %bb.40:                               ;   in Loop: Header=BB9_38 Depth=1
	lsl	x8, x9, #3
	lsl	x12, x9, #4
	ldr	x13, [sp, #112]                 ; 8-byte Folded Reload
	mov	w14, #2                         ; =0x2
	b	LBB9_42
LBB9_41:                                ;   in Loop: Header=BB9_42 Depth=2
	add	x14, x14, x11
	sub	x15, x14, #2
	add	x13, x13, x12
	cmp	x15, x19
	b.hs	LBB9_37
LBB9_42:                                ;   Parent Loop BB9_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x13]
	ldr	d1, [x13, x9, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x13]
	fsub	d0, d0, d1
	str	d0, [x13, x9, lsl #3]
	cmp	x9, #1
	b.eq	LBB9_41
; %bb.43:                               ;   in Loop: Header=BB9_42 Depth=2
	ldr	d0, [x13, #8]
	add	x15, x13, x8
	ldr	d1, [x15, #8]
	fadd	d2, d0, d1
	str	d2, [x13, #8]
	fsub	d0, d0, d1
	str	d0, [x15, #8]
	cmp	x9, #2
	b.eq	LBB9_41
; %bb.44:                               ;   in Loop: Header=BB9_42 Depth=2
	ldr	d0, [x13, #16]
	ldr	d1, [x15, #16]
	fadd	d2, d0, d1
	str	d2, [x13, #16]
	fsub	d0, d0, d1
	str	d0, [x15, #16]
	b	LBB9_41
LBB9_45:                                ;   in Loop: Header=BB9_38 Depth=1
	and	x12, x9, #0xfffffffffffffffc
	subs	x13, x9, x12
	b.ne	LBB9_50
; %bb.46:                               ;   in Loop: Header=BB9_38 Depth=1
	mov	x8, #0                          ; =0x0
	lsl	x13, x9, #4
	lsl	x9, x9, #3
	ldr	x14, [sp, #112]                 ; 8-byte Folded Reload
LBB9_47:                                ;   Parent Loop BB9_38 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_48 Depth 3
	mov	x15, x14
	mov	x16, x12
LBB9_48:                                ;   Parent Loop BB9_38 Depth=1
                                        ;     Parent Loop BB9_47 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x15]
	add	x17, x15, x9
	ldp	q2, q3, [x17]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x15], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x17]
	subs	x16, x16, #4
	b.ne	LBB9_48
; %bb.49:                               ;   in Loop: Header=BB9_47 Depth=2
	add	x14, x14, x13
	add	x8, x8, x11
	cmp	x8, x19
	b.lo	LBB9_47
	b	LBB9_37
LBB9_50:                                ;   in Loop: Header=BB9_38 Depth=1
	mov	x14, #0                         ; =0x0
	lsl	x15, x9, #4
	lsl	x9, x9, #3
	and	x8, x9, #0xffffffffffffffe0
	ldr	x17, [sp, #112]                 ; 8-byte Folded Reload
	add	x16, x17, x8
LBB9_51:                                ;   Parent Loop BB9_38 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_52 Depth 3
                                        ;       Child Loop BB9_54 Depth 3
	mov	x8, x17
	mov	x0, x12
LBB9_52:                                ;   Parent Loop BB9_38 Depth=1
                                        ;     Parent Loop BB9_51 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	q0, q1, [x8]
	add	x2, x8, x9
	ldp	q2, q3, [x2]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x8], #32
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x2]
	subs	x0, x0, #4
	b.ne	LBB9_52
; %bb.53:                               ;   in Loop: Header=BB9_51 Depth=2
	mov	x8, x16
	mov	x0, x13
LBB9_54:                                ;   Parent Loop BB9_38 Depth=1
                                        ;     Parent Loop BB9_51 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x8]
	ldr	d1, [x8, x9]
	fadd	d2, d0, d1
	str	d2, [x8]
	fsub	d0, d0, d1
	str	d0, [x8, x9]
	add	x8, x8, #8
	subs	x0, x0, #1
	b.ne	LBB9_54
; %bb.55:                               ;   in Loop: Header=BB9_51 Depth=2
	add	x17, x17, x15
	add	x16, x16, x15
	add	x14, x14, x11
	cmp	x14, x19
	b.lo	LBB9_51
	b	LBB9_37
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_h4i                         ; -- Begin function hn_h4i
	.p2align	2
_hn_h4i:                                ; @hn_h4i
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
                                        ; kill: def $w1 killed $w1 def $x1
	mov	w9, #1                          ; =0x1
	lsl	x8, x9, x1
	and	w10, w1, #0x1
	cmp	w1, #0
	cneg	w11, w10, lt
	lsl	x9, x9, x11
	cbz	w11, LBB10_27
; %bb.1:
	mov	x12, #0                         ; =0x0
	add	x10, x0, #32
	lsl	x13, x9, #3
	add	x14, x0, #16
	mov	w15, #1                         ; =0x1
	mov	x16, x0
	b	LBB10_3
LBB10_2:                                ;   in Loop: Header=BB10_3 Depth=1
	add	x10, x10, x13
	add	x16, x16, x13
	add	x14, x14, x13
	add	x12, x12, x9
	cmp	x12, x8
	b.hs	LBB10_31
LBB10_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_5 Depth 2
                                        ;     Child Loop BB10_8 Depth 2
                                        ;       Child Loop BB10_21 Depth 3
                                        ;         Child Loop BB10_22 Depth 4
                                        ;         Child Loop BB10_24 Depth 4
                                        ;       Child Loop BB10_17 Depth 3
                                        ;         Child Loop BB10_18 Depth 4
                                        ;       Child Loop BB10_12 Depth 3
	lsr	x17, x12, x11
	orr	x17, x17, x17, lsr #1
	and	x17, x17, #0x5555555555555555
	fmov	d0, x17
	cnt.8b	v0, v0
	addv.8b	b0, v0
	fmov	x17, d0
	lsl	x17, x15, x17
	ucvtf	d0, x17
	tbnz	w11, #31, LBB10_26
; %bb.4:                                ;   in Loop: Header=BB10_3 Depth=1
	mov	x17, #0                         ; =0x0
LBB10_5:                                ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x16, x17, lsl #3]
	fmul	d1, d1, d0
	str	d1, [x16, x17, lsl #3]
	add	x17, x17, #1
	cmp	x9, x17
	b.ne	LBB10_5
; %bb.6:                                ;   in Loop: Header=BB10_3 Depth=1
	mov	w4, #1                          ; =0x1
	b	LBB10_8
LBB10_7:                                ;   in Loop: Header=BB10_8 Depth=2
	mov	x4, x17
	cmp	x17, x9
	b.hs	LBB10_2
LBB10_8:                                ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB10_21 Depth 3
                                        ;         Child Loop BB10_22 Depth 4
                                        ;         Child Loop BB10_24 Depth 4
                                        ;       Child Loop BB10_17 Depth 3
                                        ;         Child Loop BB10_18 Depth 4
                                        ;       Child Loop BB10_12 Depth 3
	lsl	x17, x4, #1
	cbz	x4, LBB10_7
; %bb.9:                                ;   in Loop: Header=BB10_8 Depth=2
	lsl	x1, x4, #3
	lsl	x2, x4, #4
	cmp	x4, #3
	b.hi	LBB10_15
; %bb.10:                               ;   in Loop: Header=BB10_8 Depth=2
	mov	x3, x16
	mov	w5, #2                          ; =0x2
	b	LBB10_12
LBB10_11:                               ;   in Loop: Header=BB10_12 Depth=3
	add	x5, x5, x17
	sub	x6, x5, #2
	add	x3, x3, x2
	cmp	x6, x9
	b.hs	LBB10_7
LBB10_12:                               ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x3]
	ldr	d1, [x3, x4, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x3]
	fsub	d0, d0, d1
	str	d0, [x3, x4, lsl #3]
	cmp	x4, #1
	b.eq	LBB10_11
; %bb.13:                               ;   in Loop: Header=BB10_12 Depth=3
	ldr	d0, [x3, #8]
	add	x6, x3, x1
	ldr	d1, [x6, #8]
	fadd	d2, d0, d1
	str	d2, [x3, #8]
	fsub	d0, d0, d1
	str	d0, [x6, #8]
	cmp	x4, #2
	b.eq	LBB10_11
; %bb.14:                               ;   in Loop: Header=BB10_12 Depth=3
	ldr	d0, [x3, #16]
	ldr	d1, [x6, #16]
	fadd	d2, d0, d1
	str	d2, [x3, #16]
	fsub	d0, d0, d1
	str	d0, [x6, #16]
	b	LBB10_11
LBB10_15:                               ;   in Loop: Header=BB10_8 Depth=2
	and	x3, x4, #0xfffffffffffffffc
	subs	x4, x4, x3
	b.ne	LBB10_20
; %bb.16:                               ;   in Loop: Header=BB10_8 Depth=2
	mov	x5, x14
LBB10_17:                               ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_8 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB10_18 Depth 4
	mov	x6, x5
	mov	x7, x3
LBB10_18:                               ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_8 Depth=2
                                        ;       Parent Loop BB10_17 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	q0, q1, [x6, #-16]
	add	x19, x6, x1
	ldp	q2, q3, [x19, #-16]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x6, #-16]
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x19, #-16]
	add	x6, x6, #32
	subs	x7, x7, #4
	b.ne	LBB10_18
; %bb.19:                               ;   in Loop: Header=BB10_17 Depth=3
	add	x5, x5, x2
	add	x4, x4, x17
	cmp	x4, x9
	b.lo	LBB10_17
	b	LBB10_7
LBB10_20:                               ;   in Loop: Header=BB10_8 Depth=2
	mov	x5, #0                          ; =0x0
	and	x6, x1, #0xffffffffffffffe0
	add	x6, x16, x6
	mov	x7, x14
LBB10_21:                               ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_8 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB10_22 Depth 4
                                        ;         Child Loop BB10_24 Depth 4
	mov	x19, x7
	mov	x20, x3
LBB10_22:                               ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_8 Depth=2
                                        ;       Parent Loop BB10_21 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	q0, q1, [x19, #-16]
	add	x21, x19, x1
	ldp	q2, q3, [x21, #-16]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x19, #-16]
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x21, #-16]
	add	x19, x19, #32
	subs	x20, x20, #4
	b.ne	LBB10_22
; %bb.23:                               ;   in Loop: Header=BB10_21 Depth=3
	mov	x19, x6
	mov	x20, x4
LBB10_24:                               ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_8 Depth=2
                                        ;       Parent Loop BB10_21 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	d0, [x19]
	ldr	d1, [x19, x1]
	fadd	d2, d0, d1
	str	d2, [x19]
	fsub	d0, d0, d1
	str	d0, [x19, x1]
	add	x19, x19, #8
	subs	x20, x20, #1
	b.ne	LBB10_24
; %bb.25:                               ;   in Loop: Header=BB10_21 Depth=3
	add	x7, x7, x2
	add	x6, x6, x2
	add	x5, x5, x17
	cmp	x5, x9
	b.lo	LBB10_21
	b	LBB10_7
LBB10_26:                               ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x10, #-32]
	ldp	q3, q4, [x10]
	fmul.2d	v1, v1, v0[0]
	fmul.2d	v2, v2, v0[0]
	fmul.2d	v3, v3, v0[0]
	fmul.2d	v4, v4, v0[0]
	stp	q1, q2, [x10, #-32]
	stp	q3, q4, [x10], #64
	b	LBB10_26
LBB10_27:
	mov	x10, #0                         ; =0x0
	lsl	x11, x9, #3
	mov	w12, #1                         ; =0x1
	mov	x13, x0
LBB10_28:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_29 Depth 2
	orr	x14, x10, x10, lsr #1
	and	x14, x14, #0x5555555555555555
	fmov	d0, x14
	cnt.8b	v0, v0
	addv.8b	b0, v0
	fmov	x14, d0
	lsl	x14, x12, x14
	ucvtf	d0, x14
	mov	x14, x13
	mov	x15, x9
LBB10_29:                               ;   Parent Loop BB10_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x14]
	fmul	d1, d1, d0
	str	d1, [x14], #8
	subs	x15, x15, #1
	b.ne	LBB10_29
; %bb.30:                               ;   in Loop: Header=BB10_28 Depth=1
	add	x13, x13, x11
	add	x10, x10, x9
	cmp	x10, x8
	b.lo	LBB10_28
LBB10_31:
	cmp	x9, x8
	b.hs	LBB10_51
; %bb.32:
	add	x10, x0, #16
	fmov	d0, #0.50000000
	fmov.2d	v1, #0.50000000
	b	LBB10_34
LBB10_33:                               ;   in Loop: Header=BB10_34 Depth=1
	mov	x9, x11
	cmp	x11, x8
	b.hs	LBB10_51
LBB10_34:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_43 Depth 2
                                        ;       Child Loop BB10_47 Depth 3
                                        ;       Child Loop BB10_50 Depth 3
                                        ;     Child Loop BB10_38 Depth 2
	lsl	x11, x9, #2
	cbz	x9, LBB10_33
; %bb.35:                               ;   in Loop: Header=BB10_34 Depth=1
	lsl	x12, x9, #4
	add	x13, x9, x9, lsl #1
	lsl	x13, x13, #3
	lsl	x14, x9, #5
	lsl	x15, x9, #3
	cmp	x9, #4
	b.hs	LBB10_41
; %bb.36:                               ;   in Loop: Header=BB10_34 Depth=1
	mov	x16, #0                         ; =0x0
	mov	x17, x10
	b	LBB10_38
LBB10_37:                               ;   in Loop: Header=BB10_38 Depth=2
	add	x17, x17, x14
	add	x16, x16, x11
	cmp	x16, x8
	b.hs	LBB10_33
LBB10_38:                               ;   Parent Loop BB10_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	d2, [x17, #-16]
	add	x1, x17, x15
	ldur	d3, [x1, #-16]
	add	x2, x17, x12
	ldur	d4, [x2, #-16]
	add	x3, x17, x13
	ldur	d5, [x3, #-16]
	fadd	d6, d3, d4
	fadd	d6, d6, d5
	fmul	d6, d6, d0
	fsub	d7, d2, d6
	fadd	d2, d2, d6
	stur	d2, [x17, #-16]
	fadd	d2, d4, d7
	stur	d2, [x1, #-16]
	fadd	d2, d3, d7
	stur	d2, [x2, #-16]
	fadd	d2, d5, d7
	stur	d2, [x3, #-16]
	cmp	x9, #1
	b.eq	LBB10_37
; %bb.39:                               ;   in Loop: Header=BB10_38 Depth=2
	ldur	d2, [x17, #-8]
	ldur	d3, [x1, #-8]
	ldur	d4, [x2, #-8]
	ldur	d5, [x3, #-8]
	fadd	d6, d3, d4
	fadd	d6, d6, d5
	fmul	d6, d6, d0
	fsub	d7, d2, d6
	fadd	d2, d2, d6
	stur	d2, [x17, #-8]
	fadd	d2, d4, d7
	stur	d2, [x1, #-8]
	fadd	d2, d3, d7
	stur	d2, [x2, #-8]
	fadd	d2, d5, d7
	stur	d2, [x3, #-8]
	cmp	x9, #2
	b.eq	LBB10_37
; %bb.40:                               ;   in Loop: Header=BB10_38 Depth=2
	ldr	d2, [x17, x15]
	ldr	d3, [x17, x12]
	ldr	d4, [x17]
	ldr	d5, [x17, x13]
	fadd	d6, d2, d3
	fadd	d6, d6, d5
	fmul	d6, d6, d0
	fsub	d7, d4, d6
	fadd	d4, d4, d6
	str	d4, [x17]
	fadd	d3, d3, d7
	str	d3, [x17, x15]
	fadd	d2, d2, d7
	str	d2, [x17, x12]
	fadd	d2, d5, d7
	str	d2, [x17, x13]
	b	LBB10_37
LBB10_41:                               ;   in Loop: Header=BB10_34 Depth=1
	mov	x16, #0                         ; =0x0
	mov	x17, #0                         ; =0x0
	add	x1, x0, x14
	add	x2, x0, x13
	add	x3, x0, x12
	add	x4, x0, x15
	and	x5, x9, #0xfffffffffffffffe
	mov	x6, x4
	mov	x7, x3
	mov	x19, x2
	mov	x20, x0
	b	LBB10_43
LBB10_42:                               ;   in Loop: Header=BB10_43 Depth=2
	add	x16, x16, #1
	add	x20, x20, x14
	add	x19, x19, x14
	add	x7, x7, x14
	add	x6, x6, x14
	add	x17, x17, x11
	cmp	x17, x8
	b.hs	LBB10_33
LBB10_43:                               ;   Parent Loop BB10_34 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB10_47 Depth 3
                                        ;       Child Loop BB10_50 Depth 3
	mov	x21, #0                         ; =0x0
	mul	x23, x14, x16
	add	x24, x1, x23
	add	x25, x2, x23
	add	x26, x4, x23
	add	x27, x0, x23
	cmp	x27, x24
	ccmp	x25, x26, #2, lo
	cset	w22, lo
	cmp	x26, x24
	add	x24, x3, x23
	ccmp	x25, x24, #2, lo
	cset	w23, lo
	cmp	x24, x26
	ccmp	x27, x25, #2, lo
	b.lo	LBB10_49
; %bb.44:                               ;   in Loop: Header=BB10_43 Depth=2
	tbnz	w22, #0, LBB10_49
; %bb.45:                               ;   in Loop: Header=BB10_43 Depth=2
	tbnz	w23, #0, LBB10_49
; %bb.46:                               ;   in Loop: Header=BB10_43 Depth=2
	mov	x21, x20
	mov	x22, x5
LBB10_47:                               ;   Parent Loop BB10_34 Depth=1
                                        ;     Parent Loop BB10_43 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q2, [x21, x15]
	ldr	q3, [x21, x12]
	ldr	q4, [x21, x13]
	ldr	q5, [x21]
	fadd.2d	v6, v2, v3
	fadd.2d	v6, v6, v4
	fmul.2d	v6, v6, v1
	fsub.2d	v7, v5, v6
	fadd.2d	v5, v5, v6
	fadd.2d	v3, v3, v7
	str	q3, [x21, x15]
	fadd.2d	v2, v2, v7
	str	q2, [x21, x12]
	str	q5, [x21]
	fadd.2d	v2, v4, v7
	str	q2, [x21, x13]
	add	x21, x21, #16
	subs	x22, x22, #2
	b.ne	LBB10_47
; %bb.48:                               ;   in Loop: Header=BB10_43 Depth=2
	mov	x21, x5
	cmp	x9, x5
	b.eq	LBB10_42
LBB10_49:                               ;   in Loop: Header=BB10_43 Depth=2
	mov	x22, #0                         ; =0x0
	sub	x23, x9, x21
	lsl	x26, x21, #3
	add	x21, x20, x26
	add	x24, x19, x26
	add	x25, x7, x26
	add	x26, x6, x26
LBB10_50:                               ;   Parent Loop BB10_34 Depth=1
                                        ;     Parent Loop BB10_43 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d2, [x21, x22, lsl #3]
	ldr	d3, [x26, x22, lsl #3]
	ldr	d4, [x25, x22, lsl #3]
	ldr	d5, [x24, x22, lsl #3]
	fadd	d6, d3, d4
	fadd	d6, d6, d5
	fmul	d6, d6, d0
	fsub	d7, d2, d6
	fadd	d2, d2, d6
	str	d2, [x21, x22, lsl #3]
	fadd	d2, d4, d7
	str	d2, [x26, x22, lsl #3]
	fadd	d2, d3, d7
	str	d2, [x25, x22, lsl #3]
	fadd	d2, d5, d7
	str	d2, [x24, x22, lsl #3]
	add	x22, x22, #1
	cmp	x23, x22
	b.ne	LBB10_50
	b	LBB10_42
LBB10_51:
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_hn_h8i                         ; -- Begin function hn_h8i
	.p2align	2
_hn_h8i:                                ; @hn_h8i
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #320
	stp	x28, x27, [sp, #224]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #240]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #256]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #272]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #288]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #304]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 320
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
                                        ; kill: def $w1 killed $w1 def $x1
	mov	x22, x0
	mov	w8, #1                          ; =0x1
	lsl	x23, x8, x1
	mov	w9, #21846                      ; =0x5556
	movk	w9, #21845, lsl #16
	smull	x9, w1, w9
	lsr	x10, x9, #63
	lsr	x9, x9, #32
	add	w9, w9, w10
	add	w9, w9, w9, lsl #1
	subs	w11, w1, w9
	lsl	x9, x8, x11
	b.eq	LBB11_27
; %bb.1:
	mov	x12, #0                         ; =0x0
	mov	x13, #37449                     ; =0x9249
	movk	x13, #18724, lsl #16
	movk	x13, #9362, lsl #32
	movk	x13, #37449, lsl #48
	add	x10, x22, #32
	lsl	x14, x9, #3
	add	x15, x22, #16
	mov	w16, #1                         ; =0x1
	mov	x17, x22
	b	LBB11_3
LBB11_2:                                ;   in Loop: Header=BB11_3 Depth=1
	add	x10, x10, x14
	add	x17, x17, x14
	add	x15, x15, x14
	add	x12, x12, x9
	cmp	x12, x23
	b.hs	LBB11_31
LBB11_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_5 Depth 2
                                        ;     Child Loop BB11_8 Depth 2
                                        ;       Child Loop BB11_21 Depth 3
                                        ;         Child Loop BB11_22 Depth 4
                                        ;         Child Loop BB11_24 Depth 4
                                        ;       Child Loop BB11_17 Depth 3
                                        ;         Child Loop BB11_18 Depth 4
                                        ;       Child Loop BB11_12 Depth 3
	lsr	x8, x12, x11
	lsr	x0, x8, #2
	orr	x0, x0, x8, lsr #1
	orr	x8, x0, x8
	and	x8, x8, x13
	fmov	d0, x8
	cnt.8b	v0, v0
	addv.8b	b0, v0
	fmov	x8, d0
	lsl	x8, x16, x8
	ucvtf	d0, x8
	tbnz	w11, #31, LBB11_26
; %bb.4:                                ;   in Loop: Header=BB11_3 Depth=1
	mov	x8, #0                          ; =0x0
LBB11_5:                                ;   Parent Loop BB11_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x17, x8, lsl #3]
	fmul	d1, d1, d0
	str	d1, [x17, x8, lsl #3]
	add	x8, x8, #1
	cmp	x9, x8
	b.ne	LBB11_5
; %bb.6:                                ;   in Loop: Header=BB11_3 Depth=1
	mov	w3, #1                          ; =0x1
	b	LBB11_8
LBB11_7:                                ;   in Loop: Header=BB11_8 Depth=2
	mov	x3, x8
	cmp	x8, x9
	b.hs	LBB11_2
LBB11_8:                                ;   Parent Loop BB11_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB11_21 Depth 3
                                        ;         Child Loop BB11_22 Depth 4
                                        ;         Child Loop BB11_24 Depth 4
                                        ;       Child Loop BB11_17 Depth 3
                                        ;         Child Loop BB11_18 Depth 4
                                        ;       Child Loop BB11_12 Depth 3
	lsl	x8, x3, #1
	cbz	x3, LBB11_7
; %bb.9:                                ;   in Loop: Header=BB11_8 Depth=2
	lsl	x21, x3, #3
	lsl	x1, x3, #4
	cmp	x3, #3
	b.hi	LBB11_15
; %bb.10:                               ;   in Loop: Header=BB11_8 Depth=2
	mov	x2, x17
	mov	w4, #2                          ; =0x2
	b	LBB11_12
LBB11_11:                               ;   in Loop: Header=BB11_12 Depth=3
	add	x4, x4, x8
	sub	x5, x4, #2
	add	x2, x2, x1
	cmp	x5, x9
	b.hs	LBB11_7
LBB11_12:                               ;   Parent Loop BB11_3 Depth=1
                                        ;     Parent Loop BB11_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x2]
	ldr	d1, [x2, x3, lsl #3]
	fadd	d2, d0, d1
	str	d2, [x2]
	fsub	d0, d0, d1
	str	d0, [x2, x3, lsl #3]
	cmp	x3, #1
	b.eq	LBB11_11
; %bb.13:                               ;   in Loop: Header=BB11_12 Depth=3
	ldr	d0, [x2, #8]
	add	x5, x2, x21
	ldr	d1, [x5, #8]
	fadd	d2, d0, d1
	str	d2, [x2, #8]
	fsub	d0, d0, d1
	str	d0, [x5, #8]
	cmp	x3, #2
	b.eq	LBB11_11
; %bb.14:                               ;   in Loop: Header=BB11_12 Depth=3
	ldr	d0, [x2, #16]
	ldr	d1, [x5, #16]
	fadd	d2, d0, d1
	str	d2, [x2, #16]
	fsub	d0, d0, d1
	str	d0, [x5, #16]
	b	LBB11_11
LBB11_15:                               ;   in Loop: Header=BB11_8 Depth=2
	and	x2, x3, #0xfffffffffffffffc
	subs	x3, x3, x2
	b.ne	LBB11_20
; %bb.16:                               ;   in Loop: Header=BB11_8 Depth=2
	mov	x4, x15
LBB11_17:                               ;   Parent Loop BB11_3 Depth=1
                                        ;     Parent Loop BB11_8 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB11_18 Depth 4
	mov	x5, x4
	mov	x6, x2
LBB11_18:                               ;   Parent Loop BB11_3 Depth=1
                                        ;     Parent Loop BB11_8 Depth=2
                                        ;       Parent Loop BB11_17 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	q0, q1, [x5, #-16]
	add	x7, x5, x21
	ldp	q2, q3, [x7, #-16]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x5, #-16]
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x7, #-16]
	add	x5, x5, #32
	subs	x6, x6, #4
	b.ne	LBB11_18
; %bb.19:                               ;   in Loop: Header=BB11_17 Depth=3
	add	x4, x4, x1
	add	x3, x3, x8
	cmp	x3, x9
	b.lo	LBB11_17
	b	LBB11_7
LBB11_20:                               ;   in Loop: Header=BB11_8 Depth=2
	mov	x4, #0                          ; =0x0
	and	x5, x21, #0xffffffffffffffe0
	add	x5, x17, x5
	mov	x6, x15
LBB11_21:                               ;   Parent Loop BB11_3 Depth=1
                                        ;     Parent Loop BB11_8 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB11_22 Depth 4
                                        ;         Child Loop BB11_24 Depth 4
	mov	x7, x6
	mov	x19, x2
LBB11_22:                               ;   Parent Loop BB11_3 Depth=1
                                        ;     Parent Loop BB11_8 Depth=2
                                        ;       Parent Loop BB11_21 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	q0, q1, [x7, #-16]
	add	x20, x7, x21
	ldp	q2, q3, [x20, #-16]
	fadd.2d	v4, v0, v2
	fadd.2d	v5, v1, v3
	stp	q4, q5, [x7, #-16]
	fsub.2d	v0, v0, v2
	fsub.2d	v1, v1, v3
	stp	q0, q1, [x20, #-16]
	add	x7, x7, #32
	subs	x19, x19, #4
	b.ne	LBB11_22
; %bb.23:                               ;   in Loop: Header=BB11_21 Depth=3
	mov	x7, x5
	mov	x19, x3
LBB11_24:                               ;   Parent Loop BB11_3 Depth=1
                                        ;     Parent Loop BB11_8 Depth=2
                                        ;       Parent Loop BB11_21 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	d0, [x7]
	ldr	d1, [x7, x21]
	fadd	d2, d0, d1
	str	d2, [x7]
	fsub	d0, d0, d1
	str	d0, [x7, x21]
	add	x7, x7, #8
	subs	x19, x19, #1
	b.ne	LBB11_24
; %bb.25:                               ;   in Loop: Header=BB11_21 Depth=3
	add	x6, x6, x1
	add	x5, x5, x1
	add	x4, x4, x8
	cmp	x4, x9
	b.lo	LBB11_21
	b	LBB11_7
LBB11_26:                               ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x10, #-32]
	ldp	q3, q4, [x10]
	fmul.2d	v1, v1, v0[0]
	fmul.2d	v2, v2, v0[0]
	fmul.2d	v3, v3, v0[0]
	fmul.2d	v4, v4, v0[0]
	stp	q1, q2, [x10, #-32]
	stp	q3, q4, [x10], #64
	b	LBB11_26
LBB11_27:
	mov	x8, #0                          ; =0x0
	mov	x10, #37449                     ; =0x9249
	movk	x10, #18724, lsl #16
	movk	x10, #9362, lsl #32
	movk	x10, #37449, lsl #48
	lsl	x11, x9, #3
	mov	w12, #1                         ; =0x1
	mov	x13, x22
LBB11_28:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_29 Depth 2
	lsr	x14, x8, #2
	orr	x14, x14, x8, lsr #1
	orr	x14, x14, x8
	and	x14, x14, x10
	fmov	d0, x14
	cnt.8b	v0, v0
	addv.8b	b0, v0
	fmov	x14, d0
	lsl	x14, x12, x14
	ucvtf	d0, x14
	mov	x14, x13
	mov	x15, x9
LBB11_29:                               ;   Parent Loop BB11_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x14]
	fmul	d1, d1, d0
	str	d1, [x14], #8
	subs	x15, x15, #1
	b.ne	LBB11_29
; %bb.30:                               ;   in Loop: Header=BB11_28 Depth=1
	add	x13, x13, x11
	add	x8, x8, x9
	cmp	x8, x23
	b.lo	LBB11_28
LBB11_31:
	cmp	x9, x23
	b.hs	LBB11_73
; %bb.32:
	add	x8, x22, #48
	stp	x8, x23, [sp, #8]               ; 16-byte Folded Spill
	fmov	d0, #0.50000000
	b	LBB11_34
LBB11_33:                               ;   in Loop: Header=BB11_34 Depth=1
	cmp	x9, x23
	b.hs	LBB11_73
LBB11_34:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_44 Depth 2
                                        ;       Child Loop BB11_66 Depth 3
                                        ;       Child Loop BB11_72 Depth 3
                                        ;     Child Loop BB11_38 Depth 2
	mov	x21, x9
	lsl	x9, x9, #3
	cbz	x21, LBB11_33
; %bb.35:                               ;   in Loop: Header=BB11_34 Depth=1
	lsl	x12, x21, #4
	add	x8, x21, x21, lsl #1
	lsl	x13, x8, #3
	lsl	x14, x21, #5
	add	x10, x21, x21, lsl #2
	lsl	x24, x21, #6
	sub	x16, x24, x9
	lsl	x17, x10, #3
	lsl	x1, x8, #4
	cmp	x21, #8
	b.hs	LBB11_42
; %bb.36:                               ;   in Loop: Header=BB11_34 Depth=1
	mov	x10, #0                         ; =0x0
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	b	LBB11_38
LBB11_37:                               ;   in Loop: Header=BB11_38 Depth=2
	add	x11, x11, x24
	add	x10, x10, x9
	cmp	x10, x23
	b.hs	LBB11_33
LBB11_38:                               ;   Parent Loop BB11_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	d1, [x11, #-48]
	add	x7, x11, x9
	ldur	d2, [x7, #-48]
	add	x4, x11, x12
	ldur	d3, [x4, #-48]
	add	x5, x11, x13
	ldur	d4, [x5, #-48]
	add	x6, x11, x14
	ldur	d5, [x6, #-48]
	add	x3, x11, x17
	ldur	d6, [x3, #-48]
	add	x8, x11, x1
	ldur	d7, [x8, #-48]
	add	x2, x11, x16
	ldur	d16, [x2, #-48]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	stur	d1, [x11, #-48]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	stur	d1, [x7, #-48]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	stur	d1, [x4, #-48]
	fadd	d1, d18, d5
	stur	d1, [x5, #-48]
	fadd	d1, d17, d4
	stur	d1, [x6, #-48]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	stur	d1, [x3, #-48]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	stur	d1, [x8, #-48]
	fadd	d1, d19, d4
	stur	d1, [x2, #-48]
	cmp	x21, #1
	b.eq	LBB11_37
; %bb.39:                               ;   in Loop: Header=BB11_38 Depth=2
	ldur	d1, [x11, #-40]
	ldur	d2, [x7, #-40]
	ldur	d3, [x4, #-40]
	ldur	d4, [x5, #-40]
	ldur	d5, [x6, #-40]
	ldur	d6, [x3, #-40]
	ldur	d7, [x8, #-40]
	ldur	d16, [x2, #-40]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	stur	d1, [x11, #-40]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	stur	d1, [x7, #-40]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	stur	d1, [x4, #-40]
	fadd	d1, d18, d5
	stur	d1, [x5, #-40]
	fadd	d1, d17, d4
	stur	d1, [x6, #-40]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	stur	d1, [x3, #-40]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	stur	d1, [x8, #-40]
	fadd	d1, d19, d4
	stur	d1, [x2, #-40]
	cmp	x21, #2
	b.eq	LBB11_37
; %bb.40:                               ;   in Loop: Header=BB11_38 Depth=2
	ldur	d1, [x11, #-32]
	add	x7, x11, x9
	ldur	d2, [x7, #-32]
	add	x4, x11, x12
	ldur	d3, [x4, #-32]
	add	x5, x11, x13
	ldur	d4, [x5, #-32]
	add	x6, x11, x14
	ldur	d5, [x6, #-32]
	add	x3, x11, x17
	ldur	d6, [x3, #-32]
	add	x8, x11, x1
	ldur	d7, [x8, #-32]
	add	x2, x11, x16
	ldur	d16, [x2, #-32]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	stur	d1, [x11, #-32]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	stur	d1, [x7, #-32]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	stur	d1, [x4, #-32]
	fadd	d1, d18, d5
	stur	d1, [x5, #-32]
	fadd	d1, d17, d4
	stur	d1, [x6, #-32]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	stur	d1, [x3, #-32]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	stur	d1, [x8, #-32]
	fadd	d1, d19, d4
	stur	d1, [x2, #-32]
	ldur	d1, [x11, #-24]
	ldur	d2, [x7, #-24]
	ldur	d3, [x4, #-24]
	ldur	d4, [x5, #-24]
	ldur	d5, [x6, #-24]
	ldur	d6, [x3, #-24]
	ldur	d7, [x8, #-24]
	ldur	d16, [x2, #-24]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	stur	d1, [x11, #-24]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	stur	d1, [x7, #-24]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	stur	d1, [x4, #-24]
	fadd	d1, d18, d5
	stur	d1, [x5, #-24]
	fadd	d1, d17, d4
	stur	d1, [x6, #-24]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	stur	d1, [x3, #-24]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	stur	d1, [x8, #-24]
	fadd	d1, d19, d4
	stur	d1, [x2, #-24]
	cmp	x21, #4
	b.eq	LBB11_37
; %bb.41:                               ;   in Loop: Header=BB11_38 Depth=2
	ldur	d1, [x11, #-16]
	ldur	d2, [x7, #-16]
	ldur	d3, [x4, #-16]
	ldur	d4, [x5, #-16]
	ldur	d5, [x6, #-16]
	ldur	d6, [x3, #-16]
	ldur	d7, [x8, #-16]
	ldur	d16, [x2, #-16]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	stur	d1, [x11, #-16]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	stur	d1, [x7, #-16]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	stur	d1, [x4, #-16]
	fadd	d1, d18, d5
	stur	d1, [x5, #-16]
	fadd	d1, d17, d4
	stur	d1, [x6, #-16]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	stur	d1, [x3, #-16]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	stur	d1, [x8, #-16]
	fadd	d1, d19, d4
	stur	d1, [x2, #-16]
	ldur	d1, [x11, #-8]
	ldur	d2, [x7, #-8]
	ldur	d3, [x4, #-8]
	ldur	d4, [x5, #-8]
	ldur	d5, [x6, #-8]
	ldur	d6, [x3, #-8]
	ldur	d7, [x8, #-8]
	ldur	d16, [x2, #-8]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	stur	d1, [x11, #-8]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	stur	d1, [x7, #-8]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	stur	d1, [x4, #-8]
	fadd	d1, d18, d5
	stur	d1, [x5, #-8]
	fadd	d1, d17, d4
	stur	d1, [x6, #-8]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	stur	d1, [x3, #-8]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	stur	d1, [x8, #-8]
	fadd	d1, d19, d4
	stur	d1, [x2, #-8]
	ldr	d1, [x11]
	ldr	d2, [x7]
	ldr	d3, [x4]
	ldr	d4, [x5]
	ldr	d5, [x6]
	ldr	d6, [x3]
	ldr	d7, [x8]
	ldr	d16, [x2]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d5, d5, d21
	fadd	d16, d16, d21
	fadd	d1, d1, d20
	str	d1, [x11]
	fadd	d1, d3, d5
	fadd	d1, d7, d1
	str	d1, [x7]
	fadd	d1, d2, d5
	fadd	d1, d6, d1
	str	d1, [x4]
	fadd	d1, d18, d5
	str	d1, [x5]
	fadd	d1, d17, d4
	str	d1, [x6]
	fadd	d1, d3, d16
	fadd	d1, d6, d1
	str	d1, [x3]
	fadd	d1, d2, d16
	fadd	d1, d7, d1
	str	d1, [x8]
	fadd	d1, d19, d4
	str	d1, [x2]
	b	LBB11_37
LBB11_42:                               ;   in Loop: Header=BB11_34 Depth=1
	mov	x5, #0                          ; =0x0
	mov	x25, #0                         ; =0x0
	add	x8, x22, x24
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x22, x16
	add	x10, x22, x1
	add	x11, x22, x17
	add	x30, x22, x14
	add	x28, x22, x13
	add	x27, x22, x12
	add	x26, x22, x9
	and	x4, x21, #0xfffffffffffffffe
	stp	x4, x26, [sp, #24]              ; 16-byte Folded Spill
	stp	x27, x28, [sp, #40]             ; 16-byte Folded Spill
	stp	x30, x11, [sp, #56]             ; 16-byte Folded Spill
	stp	x10, x11, [sp, #200]            ; 16-byte Folded Spill
	stp	x10, x8, [sp, #72]              ; 16-byte Folded Spill
	str	x8, [sp, #192]                  ; 8-byte Folded Spill
	str	x22, [sp, #216]                 ; 8-byte Folded Spill
	stp	x24, x21, [sp, #96]             ; 16-byte Folded Spill
	b	LBB11_44
LBB11_43:                               ;   in Loop: Header=BB11_44 Depth=2
	add	x5, x5, #1
	ldr	x8, [sp, #216]                  ; 8-byte Folded Reload
	add	x8, x8, x24
	str	x8, [sp, #216]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #192]                  ; 8-byte Folded Reload
	add	x8, x8, x24
	str	x8, [sp, #192]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #200]                  ; 8-byte Folded Reload
	add	x8, x8, x24
	str	x8, [sp, #200]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #208]                  ; 8-byte Folded Reload
	add	x8, x8, x24
	str	x8, [sp, #208]                  ; 8-byte Folded Spill
	add	x30, x30, x24
	add	x28, x28, x24
	add	x27, x27, x24
	add	x26, x26, x24
	add	x25, x25, x9
	cmp	x25, x23
	b.hs	LBB11_33
LBB11_44:                               ;   Parent Loop BB11_34 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB11_66 Depth 3
                                        ;       Child Loop BB11_72 Depth 3
	stp	x30, x28, [sp, #144]            ; 16-byte Folded Spill
	stp	x27, x26, [sp, #160]            ; 16-byte Folded Spill
	stp	x25, x5, [sp, #176]             ; 16-byte Folded Spill
	str	xzr, [sp, #136]                 ; 8-byte Folded Spill
	mul	x11, x24, x5
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	add	x4, x8, x11
	mov	x0, x22
	add	x10, x22, x11
	cmp	x10, x4
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	add	x20, x8, x11
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	add	x7, x8, x11
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	add	x21, x8, x11
	ccmp	x7, x21, #2, lo
	cset	w8, lo
	str	w8, [sp, #132]                  ; 4-byte Folded Spill
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	add	x22, x8, x11
	cmp	x10, x22
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x23, x8, x11
	ccmp	x4, x21, #2, lo
	cset	w8, lo
	str	w8, [sp, #128]                  ; 4-byte Folded Spill
	cmp	x10, x20
	ccmp	x22, x21, #2, lo
	cset	w8, lo
	str	w8, [sp, #124]                  ; 4-byte Folded Spill
	ldr	x8, [sp, #80]                   ; 8-byte Folded Reload
	add	x8, x8, x11
	cmp	x10, x8
	ccmp	x20, x21, #2, lo
	cset	w15, lo
	str	w15, [sp, #120]                 ; 4-byte Folded Spill
	ldr	x15, [sp, #88]                  ; 8-byte Folded Reload
	add	x11, x15, x11
	cmp	x10, x11
	ccmp	x8, x21, #2, lo
	cset	w15, lo
	str	w15, [sp, #116]                 ; 4-byte Folded Spill
	cmp	x21, x4
	ccmp	x7, x23, #2, lo
	cset	w15, lo
	str	w15, [sp, #112]                 ; 4-byte Folded Spill
	cmp	x21, x22
	ccmp	x4, x23, #2, lo
	cset	w2, lo
	cmp	x21, x20
	ccmp	x22, x23, #2, lo
	cset	w3, lo
	cmp	x21, x8
	ccmp	x20, x23, #2, lo
	cset	w24, lo
	cmp	x21, x11
	ccmp	x8, x23, #2, lo
	cset	w25, lo
	cmp	x23, x22
	ccmp	x4, x7, #2, lo
	cset	w26, lo
	cmp	x23, x20
	ccmp	x22, x7, #2, lo
	cset	w27, lo
	cmp	x23, x8
	ccmp	x20, x7, #2, lo
	cset	w28, lo
	cmp	x23, x11
	ccmp	x8, x7, #2, lo
	cset	w30, lo
	cmp	x7, x20
	ccmp	x22, x4, #2, lo
	cset	w5, lo
	cmp	x7, x8
	ccmp	x20, x4, #2, lo
	cset	w15, lo
	cmp	x7, x11
	ccmp	x8, x4, #2, lo
	cset	w6, lo
	cmp	x4, x8
	ccmp	x20, x22, #2, lo
	cset	w19, lo
	cmp	x4, x11
	ccmp	x8, x22, #2, lo
	cset	w4, lo
	cmp	x22, x11
	ccmp	x8, x20, #2, lo
	cset	w20, lo
	cmp	x23, x21
	ccmp	x10, x7, #2, lo
	b.lo	LBB11_68
; %bb.45:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	w8, [sp, #132]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB11_68
; %bb.46:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	w8, [sp, #128]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB11_68
; %bb.47:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	w8, [sp, #124]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB11_68
; %bb.48:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	w8, [sp, #120]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB11_68
; %bb.49:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	w8, [sp, #116]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB11_68
; %bb.50:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	w8, [sp, #112]                  ; 4-byte Folded Reload
	tbnz	w8, #0, LBB11_68
; %bb.51:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w2, #0, LBB11_68
; %bb.52:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w3, #0, LBB11_68
; %bb.53:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w24, #0, LBB11_68
; %bb.54:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w25, #0, LBB11_68
; %bb.55:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w26, #0, LBB11_68
; %bb.56:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w27, #0, LBB11_68
; %bb.57:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w28, #0, LBB11_68
; %bb.58:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w30, #0, LBB11_68
; %bb.59:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w5, #0, LBB11_68
; %bb.60:                               ;   in Loop: Header=BB11_44 Depth=2
	mov	x22, x0
	ldr	x23, [sp, #16]                  ; 8-byte Folded Reload
	ldp	x24, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #168]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #152]            ; 16-byte Folded Reload
	ldr	x30, [sp, #144]                 ; 8-byte Folded Reload
	tbnz	w15, #0, LBB11_69
; %bb.61:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	x5, [sp, #184]                  ; 8-byte Folded Reload
	tbnz	w6, #0, LBB11_70
; %bb.62:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w19, #0, LBB11_70
; %bb.63:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	x11, [sp, #136]                 ; 8-byte Folded Reload
	tbnz	w4, #0, LBB11_71
; %bb.64:                               ;   in Loop: Header=BB11_44 Depth=2
	tbnz	w20, #0, LBB11_71
; %bb.65:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	x8, [sp, #216]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
LBB11_66:                               ;   Parent Loop BB11_34 Depth=1
                                        ;     Parent Loop BB11_44 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	q1, [x8, x9]
	ldr	q2, [x8, x12]
	ldr	q3, [x8, x13]
	ldr	q4, [x8, x14]
	ldr	q5, [x8, x17]
	ldr	q6, [x8, x1]
	ldr	q7, [x8, x16]
	ldr	q16, [x8]
	fadd.2d	v17, v1, v2
	fadd.2d	v18, v3, v7
	fadd.2d	v19, v5, v6
	fadd.2d	v20, v17, v18
	fadd.2d	v20, v19, v20
	fadd.2d	v20, v4, v20
	fmov.2d	v21, #0.50000000
	fmul.2d	v20, v20, v21
	fsub.2d	v21, v16, v20
	fadd.2d	v3, v3, v21
	fadd.2d	v4, v4, v21
	fadd.2d	v7, v7, v21
	fadd.2d	v21, v2, v4
	fadd.2d	v21, v6, v21
	str	q21, [x8, x9]
	fadd.2d	v21, v1, v4
	fadd.2d	v21, v5, v21
	str	q21, [x8, x12]
	fadd.2d	v4, v18, v4
	str	q4, [x8, x13]
	fadd.2d	v4, v16, v20
	fadd.2d	v16, v17, v3
	str	q16, [x8, x14]
	fadd.2d	v2, v2, v7
	fadd.2d	v2, v5, v2
	str	q2, [x8, x17]
	fadd.2d	v1, v1, v7
	fadd.2d	v1, v6, v1
	str	q1, [x8, x1]
	str	q4, [x8]
	fadd.2d	v1, v19, v3
	str	q1, [x8, x16]
	add	x8, x8, #16
	subs	x10, x10, #2
	b.ne	LBB11_66
; %bb.67:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	mov	x11, x8
	cmp	x21, x8
	b.eq	LBB11_43
	b	LBB11_71
LBB11_68:                               ;   in Loop: Header=BB11_44 Depth=2
	mov	x22, x0
	ldr	x23, [sp, #16]                  ; 8-byte Folded Reload
	ldp	x24, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x25, x5, [sp, #176]             ; 16-byte Folded Reload
	ldp	x27, x26, [sp, #160]            ; 16-byte Folded Reload
	ldp	x30, x28, [sp, #144]            ; 16-byte Folded Reload
	b	LBB11_70
LBB11_69:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	x5, [sp, #184]                  ; 8-byte Folded Reload
LBB11_70:                               ;   in Loop: Header=BB11_44 Depth=2
	ldr	x11, [sp, #136]                 ; 8-byte Folded Reload
LBB11_71:                               ;   in Loop: Header=BB11_44 Depth=2
	mov	x4, #0                          ; =0x0
	sub	x10, x21, x11
	lsl	x0, x11, #3
	ldr	x8, [sp, #216]                  ; 8-byte Folded Reload
	add	x6, x8, x0
	ldp	x11, x8, [sp, #192]             ; 16-byte Folded Reload
	add	x7, x11, x0
	add	x19, x8, x0
	ldr	x8, [sp, #208]                  ; 8-byte Folded Reload
	add	x8, x8, x0
	add	x11, x30, x0
	add	x15, x28, x0
	add	x2, x27, x0
	add	x3, x26, x0
LBB11_72:                               ;   Parent Loop BB11_34 Depth=1
                                        ;     Parent Loop BB11_44 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d1, [x6, x4, lsl #3]
	ldr	d2, [x3, x4, lsl #3]
	ldr	d3, [x2, x4, lsl #3]
	ldr	d4, [x15, x4, lsl #3]
	ldr	d5, [x11, x4, lsl #3]
	ldr	d6, [x8, x4, lsl #3]
	ldr	d7, [x19, x4, lsl #3]
	ldr	d16, [x7, x4, lsl #3]
	fadd	d17, d2, d3
	fadd	d18, d4, d16
	fadd	d19, d6, d7
	fadd	d20, d17, d18
	fadd	d20, d19, d20
	fadd	d20, d5, d20
	fmul	d20, d20, d0
	fsub	d21, d1, d20
	fadd	d4, d4, d21
	fadd	d1, d1, d20
	str	d1, [x6, x4, lsl #3]
	fadd	d1, d5, d21
	fadd	d5, d3, d1
	fadd	d5, d7, d5
	str	d5, [x3, x4, lsl #3]
	fadd	d5, d2, d1
	fadd	d5, d6, d5
	str	d5, [x2, x4, lsl #3]
	fadd	d1, d18, d1
	str	d1, [x15, x4, lsl #3]
	fadd	d1, d16, d21
	fadd	d5, d17, d4
	str	d5, [x11, x4, lsl #3]
	fadd	d3, d3, d1
	fadd	d3, d6, d3
	str	d3, [x8, x4, lsl #3]
	fadd	d1, d2, d1
	fadd	d1, d7, d1
	str	d1, [x19, x4, lsl #3]
	fadd	d1, d19, d4
	str	d1, [x7, x4, lsl #3]
	add	x4, x4, #1
	cmp	x10, x4
	b.ne	LBB11_72
	b	LBB11_43
LBB11_73:
	ldp	x29, x30, [sp, #304]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #288]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #272]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #256]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #240]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #320
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
