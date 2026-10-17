
.deps/flint/build/fft_small/sd_fft.lo:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000006b08 <_sd_fft_basecase_4_0>:
    6b08: d37df069     	lsl	x9, x3, #3
    6b0c: aa0003e8     	mov	x8, x0
    6b10: 4dc9cd00     	ld1r.2d	{ v0 }, [x8], x9
    6b14: fd400401     	ldr	d1, [x0, #0x8]
    6b18: ad401424     	ldp	q4, q5, [x1]
    6b1c: ad411c26     	ldp	q6, q7, [x1, #0x20]
    6b20: ad424430     	ldp	q16, q17, [x1, #0x40]
    6b24: ad434c32     	ldp	q18, q19, [x1, #0x60]
    6b28: a943a909     	ldp	x9, x10, [x8, #0x38]
    6b2c: fc627934     	ldr	d20, [x9, x2, lsl #3]
    6b30: 8b021149     	add	x9, x10, x2, lsl #4
    6b34: 4ddfcd23     	ld1r.2d	{ v3 }, [x9], #8
    6b38: fd400122     	ldr	d2, [x9]
    6b3c: 4fc19095     	fmul.2d	v21, v4, v1[0]
    6b40: 4e618ab5     	frintn.2d	v21, v21
    6b44: 4ef5cc04     	fmls.2d	v4, v0, v21
    6b48: 4fc190b5     	fmul.2d	v21, v5, v1[0]
    6b4c: 4e618ab5     	frintn.2d	v21, v21
    6b50: 4ef5cc05     	fmls.2d	v5, v0, v21
    6b54: 4fd49215     	fmul.2d	v21, v16, v20[0]
    6b58: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6b5c: 4e618ad6     	frintn.2d	v22, v22
    6b60: 4eb51eb7     	mov.16b	v23, v21
    6b64: 4fd45217     	fmls.2d	v23, v16, v20[0]
    6b68: 4ef6cc15     	fmls.2d	v21, v0, v22
    6b6c: 4ef7d6b0     	fsub.2d	v16, v21, v23
    6b70: 4fd49235     	fmul.2d	v21, v17, v20[0]
    6b74: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6b78: 4e618ad6     	frintn.2d	v22, v22
    6b7c: 4eb51eb7     	mov.16b	v23, v21
    6b80: 4fd45237     	fmls.2d	v23, v17, v20[0]
    6b84: 4ef6cc15     	fmls.2d	v21, v0, v22
    6b88: 4ef7d6b1     	fsub.2d	v17, v21, v23
    6b8c: 4fd49255     	fmul.2d	v21, v18, v20[0]
    6b90: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6b94: 4e618ad6     	frintn.2d	v22, v22
    6b98: 4eb51eb7     	mov.16b	v23, v21
    6b9c: 4fd45257     	fmls.2d	v23, v18, v20[0]
    6ba0: 4ef6cc15     	fmls.2d	v21, v0, v22
    6ba4: 4ef7d6b2     	fsub.2d	v18, v21, v23
    6ba8: 4fd49275     	fmul.2d	v21, v19, v20[0]
    6bac: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6bb0: 4e618ad6     	frintn.2d	v22, v22
    6bb4: 4eb51eb7     	mov.16b	v23, v21
    6bb8: 4fd45277     	fmls.2d	v23, v19, v20[0]
    6bbc: 4ef6cc15     	fmls.2d	v21, v0, v22
    6bc0: 4ef7d6b3     	fsub.2d	v19, v21, v23
    6bc4: 4e70d494     	fadd.2d	v20, v4, v16
    6bc8: 4e71d4b5     	fadd.2d	v21, v5, v17
    6bcc: 4e72d4d6     	fadd.2d	v22, v6, v18
    6bd0: 4e73d4f7     	fadd.2d	v23, v7, v19
    6bd4: 4ef0d484     	fsub.2d	v4, v4, v16
    6bd8: 4ef1d4a5     	fsub.2d	v5, v5, v17
    6bdc: 4ef2d4c6     	fsub.2d	v6, v6, v18
    6be0: 4ef3d4e7     	fsub.2d	v7, v7, v19
    6be4: 6e76dc70     	fmul.2d	v16, v3, v22
    6be8: 4fc19211     	fmul.2d	v17, v16, v1[0]
    6bec: 4e618a31     	frintn.2d	v17, v17
    6bf0: 4eb01e12     	mov.16b	v18, v16
    6bf4: 4ef6cc72     	fmls.2d	v18, v3, v22
    6bf8: 4ef1cc10     	fmls.2d	v16, v0, v17
    6bfc: 4ef2d610     	fsub.2d	v16, v16, v18
    6c00: 6e77dc71     	fmul.2d	v17, v3, v23
    6c04: 4fc19232     	fmul.2d	v18, v17, v1[0]
    6c08: 4e618a52     	frintn.2d	v18, v18
    6c0c: 4eb11e33     	mov.16b	v19, v17
    6c10: 4ef7cc73     	fmls.2d	v19, v3, v23
    6c14: 4ef2cc11     	fmls.2d	v17, v0, v18
    6c18: 4ef3d623     	fsub.2d	v3, v17, v19
    6c1c: 4fc290d1     	fmul.2d	v17, v6, v2[0]
    6c20: 4fc19232     	fmul.2d	v18, v17, v1[0]
    6c24: 4e618a52     	frintn.2d	v18, v18
    6c28: 4eb11e33     	mov.16b	v19, v17
    6c2c: 4fc250d3     	fmls.2d	v19, v6, v2[0]
    6c30: 4ef2cc11     	fmls.2d	v17, v0, v18
    6c34: 4ef3d626     	fsub.2d	v6, v17, v19
    6c38: 4fc290f1     	fmul.2d	v17, v7, v2[0]
    6c3c: 4fc19232     	fmul.2d	v18, v17, v1[0]
    6c40: 4e618a52     	frintn.2d	v18, v18
    6c44: 4eb11e33     	mov.16b	v19, v17
    6c48: 4fc250f3     	fmls.2d	v19, v7, v2[0]
    6c4c: 4ef2cc11     	fmls.2d	v17, v0, v18
    6c50: 4ef3d627     	fsub.2d	v7, v17, v19
    6c54: 4e70d691     	fadd.2d	v17, v20, v16
    6c58: 4e63d6b2     	fadd.2d	v18, v21, v3
    6c5c: 4ef0d690     	fsub.2d	v16, v20, v16
    6c60: 4ee3d6b3     	fsub.2d	v19, v21, v3
    6c64: 4e66d494     	fadd.2d	v20, v4, v6
    6c68: 4e67d4b5     	fadd.2d	v21, v5, v7
    6c6c: 4ee6d486     	fsub.2d	v6, v4, v6
    6c70: a944a508     	ldp	x8, x9, [x8, #0x48]
    6c74: 8b021929     	add	x9, x9, x2, lsl #6
    6c78: 9100812a     	add	x10, x9, #0x20
    6c7c: 4c408d42     	ld2.2d	{ v2, v3 }, [x10]
    6c80: 4ee7d4a5     	fsub.2d	v5, v5, v7
    6c84: ad401d24     	ldp	q4, q7, [x9]
    6c88: 8b021508     	add	x8, x8, x2, lsl #5
    6c8c: ad405d16     	ldp	q22, q23, [x8]
    6c90: 4ec73898     	zip1.2d	v24, v4, v7
    6c94: 4ec77884     	zip2.2d	v4, v4, v7
    6c98: 4ed03a27     	zip1.2d	v7, v17, v16
    6c9c: 4ed33a59     	zip1.2d	v25, v18, v19
    6ca0: 4ed07a30     	zip2.2d	v16, v17, v16
    6ca4: 4ed37a51     	zip2.2d	v17, v18, v19
    6ca8: 4ec63a92     	zip1.2d	v18, v20, v6
    6cac: 4ec53ab3     	zip1.2d	v19, v21, v5
    6cb0: 4ec67a86     	zip2.2d	v6, v20, v6
    6cb4: 4ec57aa5     	zip2.2d	v5, v21, v5
    6cb8: 4fc190f4     	fmul.2d	v20, v7, v1[0]
    6cbc: 4e618a94     	frintn.2d	v20, v20
    6cc0: 4ef4cc07     	fmls.2d	v7, v0, v20
    6cc4: 4fc19254     	fmul.2d	v20, v18, v1[0]
    6cc8: 4e618a94     	frintn.2d	v20, v20
    6ccc: 4ef4cc12     	fmls.2d	v18, v0, v20
    6cd0: 6e79ded4     	fmul.2d	v20, v22, v25
    6cd4: 4fc19295     	fmul.2d	v21, v20, v1[0]
    6cd8: 4e618ab5     	frintn.2d	v21, v21
    6cdc: 4eb41e9a     	mov.16b	v26, v20
    6ce0: 4ef9ceda     	fmls.2d	v26, v22, v25
    6ce4: 4ef5cc14     	fmls.2d	v20, v0, v21
    6ce8: 4efad694     	fsub.2d	v20, v20, v26
    6cec: 6e73def5     	fmul.2d	v21, v23, v19
    6cf0: 4fc192b9     	fmul.2d	v25, v21, v1[0]
    6cf4: 4e618b39     	frintn.2d	v25, v25
    6cf8: 4eb51eba     	mov.16b	v26, v21
    6cfc: 4ef3cefa     	fmls.2d	v26, v23, v19
    6d00: 4ef9cc15     	fmls.2d	v21, v0, v25
    6d04: 4efad6b3     	fsub.2d	v19, v21, v26
    6d08: 6e71ded5     	fmul.2d	v21, v22, v17
    6d0c: 4fc192b9     	fmul.2d	v25, v21, v1[0]
    6d10: 4e618b39     	frintn.2d	v25, v25
    6d14: 4eb51eba     	mov.16b	v26, v21
    6d18: 4ef1ceda     	fmls.2d	v26, v22, v17
    6d1c: 4ef9cc15     	fmls.2d	v21, v0, v25
    6d20: 4efad6b1     	fsub.2d	v17, v21, v26
    6d24: 6e65def5     	fmul.2d	v21, v23, v5
    6d28: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6d2c: 4e618ad6     	frintn.2d	v22, v22
    6d30: 4eb51eb9     	mov.16b	v25, v21
    6d34: 4ee5cef9     	fmls.2d	v25, v23, v5
    6d38: 4ef6cc15     	fmls.2d	v21, v0, v22
    6d3c: 4ef9d6a5     	fsub.2d	v5, v21, v25
    6d40: 4e74d4f5     	fadd.2d	v21, v7, v20
    6d44: 4e73d656     	fadd.2d	v22, v18, v19
    6d48: 4e71d617     	fadd.2d	v23, v16, v17
    6d4c: 4e65d4d9     	fadd.2d	v25, v6, v5
    6d50: 4ef4d4e7     	fsub.2d	v7, v7, v20
    6d54: 4ef3d652     	fsub.2d	v18, v18, v19
    6d58: 4ef1d610     	fsub.2d	v16, v16, v17
    6d5c: 4ee5d4c5     	fsub.2d	v5, v6, v5
    6d60: 6e77df06     	fmul.2d	v6, v24, v23
    6d64: 4fc190d1     	fmul.2d	v17, v6, v1[0]
    6d68: 4e618a31     	frintn.2d	v17, v17
    6d6c: 4ea61cd3     	mov.16b	v19, v6
    6d70: 4ef7cf13     	fmls.2d	v19, v24, v23
    6d74: 4ef1cc06     	fmls.2d	v6, v0, v17
    6d78: 4ef3d4c6     	fsub.2d	v6, v6, v19
    6d7c: 6e79dc51     	fmul.2d	v17, v2, v25
    6d80: 4fc19233     	fmul.2d	v19, v17, v1[0]
    6d84: 4e618a73     	frintn.2d	v19, v19
    6d88: 4eb11e34     	mov.16b	v20, v17
    6d8c: 4ef9cc54     	fmls.2d	v20, v2, v25
    6d90: 4ef3cc11     	fmls.2d	v17, v0, v19
    6d94: 4ef4d631     	fsub.2d	v17, v17, v20
    6d98: 6e70dc93     	fmul.2d	v19, v4, v16
    6d9c: 4fc19274     	fmul.2d	v20, v19, v1[0]
    6da0: 4e618a94     	frintn.2d	v20, v20
    6da4: 4eb31e77     	mov.16b	v23, v19
    6da8: 4ef0cc97     	fmls.2d	v23, v4, v16
    6dac: 4ef4cc13     	fmls.2d	v19, v0, v20
    6db0: 4ef7d664     	fsub.2d	v4, v19, v23
    6db4: 6e65dc70     	fmul.2d	v16, v3, v5
    6db8: 4fc19201     	fmul.2d	v1, v16, v1[0]
    6dbc: 4e618821     	frintn.2d	v1, v1
    6dc0: 4eb01e13     	mov.16b	v19, v16
    6dc4: 4ee5cc73     	fmls.2d	v19, v3, v5
    6dc8: 4ee1cc10     	fmls.2d	v16, v0, v1
    6dcc: 4ef3d600     	fsub.2d	v0, v16, v19
    6dd0: 4e66d6a1     	fadd.2d	v1, v21, v6
    6dd4: 4e71d6c2     	fadd.2d	v2, v22, v17
    6dd8: 4ee6d6a3     	fsub.2d	v3, v21, v6
    6ddc: 4ef1d6c5     	fsub.2d	v5, v22, v17
    6de0: 4e64d4e6     	fadd.2d	v6, v7, v4
    6de4: 4e60d650     	fadd.2d	v16, v18, v0
    6de8: 4ee4d4e4     	fsub.2d	v4, v7, v4
    6dec: ad000821     	stp	q1, q2, [x1]
    6df0: ad011423     	stp	q3, q5, [x1, #0x20]
    6df4: ad024026     	stp	q6, q16, [x1, #0x40]
    6df8: 4ee0d640     	fsub.2d	v0, v18, v0
    6dfc: ad030024     	stp	q4, q0, [x1, #0x60]
    6e00: d65f03c0     	ret
