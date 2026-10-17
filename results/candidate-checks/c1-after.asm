
.deps/experiments/c1-native-lanes/sd_fft.lo:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000006b08 <_sd_fft_basecase_4_0>:
    6b08: d37df069     	lsl	x9, x3, #3
    6b0c: aa0003e8     	mov	x8, x0
    6b10: 4dc9cd00     	ld1r.2d	{ v0 }, [x8], x9
    6b14: fd400401     	ldr	d1, [x0, #0x8]
    6b18: a943a909     	ldp	x9, x10, [x8, #0x38]
    6b1c: fc627924     	ldr	d4, [x9, x2, lsl #3]
    6b20: 8b021149     	add	x9, x10, x2, lsl #4
    6b24: 4ddfcd23     	ld1r.2d	{ v3 }, [x9], #8
    6b28: fd400122     	ldr	d2, [x9]
    6b2c: ad401430     	ldp	q16, q5, [x1]
    6b30: ad411831     	ldp	q17, q6, [x1, #0x20]
    6b34: ad424c32     	ldp	q18, q19, [x1, #0x40]
    6b38: ad431c34     	ldp	q20, q7, [x1, #0x60]
    6b3c: 4fc19215     	fmul.2d	v21, v16, v1[0]
    6b40: 4e618ab5     	frintn.2d	v21, v21
    6b44: 4ef5cc10     	fmls.2d	v16, v0, v21
    6b48: 4fc49255     	fmul.2d	v21, v18, v4[0]
    6b4c: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6b50: 4e618ad6     	frintn.2d	v22, v22
    6b54: 4eb51eb7     	mov.16b	v23, v21
    6b58: 4fc45257     	fmls.2d	v23, v18, v4[0]
    6b5c: 4ef6cc15     	fmls.2d	v21, v0, v22
    6b60: 4ef7d6b2     	fsub.2d	v18, v21, v23
    6b64: 4fc49295     	fmul.2d	v21, v20, v4[0]
    6b68: 4fc192b6     	fmul.2d	v22, v21, v1[0]
    6b6c: 4e618ad6     	frintn.2d	v22, v22
    6b70: 4eb51eb7     	mov.16b	v23, v21
    6b74: 4fc45297     	fmls.2d	v23, v20, v4[0]
    6b78: 4ef6cc15     	fmls.2d	v21, v0, v22
    6b7c: 4ef7d6b4     	fsub.2d	v20, v21, v23
    6b80: 4e72d615     	fadd.2d	v21, v16, v18
    6b84: 4e74d636     	fadd.2d	v22, v17, v20
    6b88: 4ef2d610     	fsub.2d	v16, v16, v18
    6b8c: 4ef4d631     	fsub.2d	v17, v17, v20
    6b90: 6e76dc72     	fmul.2d	v18, v3, v22
    6b94: 4fc19254     	fmul.2d	v20, v18, v1[0]
    6b98: 4e618a94     	frintn.2d	v20, v20
    6b9c: 4eb21e57     	mov.16b	v23, v18
    6ba0: 4ef6cc77     	fmls.2d	v23, v3, v22
    6ba4: 4ef4cc12     	fmls.2d	v18, v0, v20
    6ba8: 4ef7d652     	fsub.2d	v18, v18, v23
    6bac: 4fc29234     	fmul.2d	v20, v17, v2[0]
    6bb0: 4fc19296     	fmul.2d	v22, v20, v1[0]
    6bb4: 4e618ad6     	frintn.2d	v22, v22
    6bb8: 4eb41e97     	mov.16b	v23, v20
    6bbc: 4fc25237     	fmls.2d	v23, v17, v2[0]
    6bc0: 4ef6cc14     	fmls.2d	v20, v0, v22
    6bc4: 4ef7d691     	fsub.2d	v17, v20, v23
    6bc8: 4e72d6b4     	fadd.2d	v20, v21, v18
    6bcc: 4ef2d6b2     	fsub.2d	v18, v21, v18
    6bd0: 4e71d615     	fadd.2d	v21, v16, v17
    6bd4: 4ef1d610     	fsub.2d	v16, v16, v17
    6bd8: 4fc190b1     	fmul.2d	v17, v5, v1[0]
    6bdc: 4e618a31     	frintn.2d	v17, v17
    6be0: 4ef1cc05     	fmls.2d	v5, v0, v17
    6be4: 4fc49271     	fmul.2d	v17, v19, v4[0]
    6be8: 4fc19236     	fmul.2d	v22, v17, v1[0]
    6bec: 4e618ad6     	frintn.2d	v22, v22
    6bf0: 4eb11e37     	mov.16b	v23, v17
    6bf4: 4fc45277     	fmls.2d	v23, v19, v4[0]
    6bf8: 4ef6cc11     	fmls.2d	v17, v0, v22
    6bfc: 4ef7d631     	fsub.2d	v17, v17, v23
    6c00: 4fc490f3     	fmul.2d	v19, v7, v4[0]
    6c04: 4fc19276     	fmul.2d	v22, v19, v1[0]
    6c08: 4e618ad6     	frintn.2d	v22, v22
    6c0c: 4eb31e77     	mov.16b	v23, v19
    6c10: 4fc450f7     	fmls.2d	v23, v7, v4[0]
    6c14: 4ef6cc13     	fmls.2d	v19, v0, v22
    6c18: 4ef7d664     	fsub.2d	v4, v19, v23
    6c1c: 4e71d4a7     	fadd.2d	v7, v5, v17
    6c20: 4e64d4d3     	fadd.2d	v19, v6, v4
    6c24: 4ef1d4a5     	fsub.2d	v5, v5, v17
    6c28: 4ee4d4c4     	fsub.2d	v4, v6, v4
    6c2c: 6e73dc66     	fmul.2d	v6, v3, v19
    6c30: 4fc190d1     	fmul.2d	v17, v6, v1[0]
    6c34: 4e618a31     	frintn.2d	v17, v17
    6c38: 4ea61cd6     	mov.16b	v22, v6
    6c3c: 4ef3cc76     	fmls.2d	v22, v3, v19
    6c40: 4ef1cc06     	fmls.2d	v6, v0, v17
    6c44: 4ef6d4c3     	fsub.2d	v3, v6, v22
    6c48: 4fc29086     	fmul.2d	v6, v4, v2[0]
    6c4c: 4fc190d1     	fmul.2d	v17, v6, v1[0]
    6c50: 4e618a31     	frintn.2d	v17, v17
    6c54: 4ea61cd3     	mov.16b	v19, v6
    6c58: 4fc25093     	fmls.2d	v19, v4, v2[0]
    6c5c: 4ef1cc06     	fmls.2d	v6, v0, v17
    6c60: 4ef3d4c2     	fsub.2d	v2, v6, v19
    6c64: 4e63d4e4     	fadd.2d	v4, v7, v3
    6c68: 4ee3d4e3     	fsub.2d	v3, v7, v3
    6c6c: 4e62d4a6     	fadd.2d	v6, v5, v2
    6c70: 4ee2d4a5     	fsub.2d	v5, v5, v2
    6c74: 4ed23a91     	zip1.2d	v17, v20, v18
    6c78: 4ec33893     	zip1.2d	v19, v4, v3
    6c7c: 4ed27a92     	zip2.2d	v18, v20, v18
    6c80: 4ec37894     	zip2.2d	v20, v4, v3
    6c84: 4ed03aa2     	zip1.2d	v2, v21, v16
    6c88: 4ec538c7     	zip1.2d	v7, v6, v5
    6c8c: 4ed07aa3     	zip2.2d	v3, v21, v16
    6c90: 4ec578c6     	zip2.2d	v6, v6, v5
    6c94: a944a508     	ldp	x8, x9, [x8, #0x48]
    6c98: 8b021929     	add	x9, x9, x2, lsl #6
    6c9c: acc15530     	ldp	q16, q21, [x9], #0x20
    6ca0: 4c408d24     	ld2.2d	{ v4, v5 }, [x9]
    6ca4: 8b021508     	add	x8, x8, x2, lsl #5
    6ca8: ad405d16     	ldp	q22, q23, [x8]
    6cac: 4ed53a18     	zip1.2d	v24, v16, v21
    6cb0: 4ed57a10     	zip2.2d	v16, v16, v21
    6cb4: 4fc19235     	fmul.2d	v21, v17, v1[0]
    6cb8: 4e618ab5     	frintn.2d	v21, v21
    6cbc: 4ef5cc11     	fmls.2d	v17, v0, v21
    6cc0: 6e73ded5     	fmul.2d	v21, v22, v19
    6cc4: 4fc192b9     	fmul.2d	v25, v21, v1[0]
    6cc8: 4e618b39     	frintn.2d	v25, v25
    6ccc: 4eb51eba     	mov.16b	v26, v21
    6cd0: 4ef3ceda     	fmls.2d	v26, v22, v19
    6cd4: 4ef9cc15     	fmls.2d	v21, v0, v25
    6cd8: 4efad6b3     	fsub.2d	v19, v21, v26
    6cdc: 6e74ded5     	fmul.2d	v21, v22, v20
    6ce0: 4fc192b9     	fmul.2d	v25, v21, v1[0]
    6ce4: 4e618b39     	frintn.2d	v25, v25
    6ce8: 4eb51eba     	mov.16b	v26, v21
    6cec: 4ef4ceda     	fmls.2d	v26, v22, v20
    6cf0: 4ef9cc15     	fmls.2d	v21, v0, v25
    6cf4: 4efad6b4     	fsub.2d	v20, v21, v26
    6cf8: 4e73d635     	fadd.2d	v21, v17, v19
    6cfc: 4e74d656     	fadd.2d	v22, v18, v20
    6d00: 4ef3d631     	fsub.2d	v17, v17, v19
    6d04: 4ef4d652     	fsub.2d	v18, v18, v20
    6d08: 6e76df13     	fmul.2d	v19, v24, v22
    6d0c: 4fc19274     	fmul.2d	v20, v19, v1[0]
    6d10: 4e618a94     	frintn.2d	v20, v20
    6d14: 4eb31e79     	mov.16b	v25, v19
    6d18: 4ef6cf19     	fmls.2d	v25, v24, v22
    6d1c: 4ef4cc13     	fmls.2d	v19, v0, v20
    6d20: 4ef9d673     	fsub.2d	v19, v19, v25
    6d24: 6e72de14     	fmul.2d	v20, v16, v18
    6d28: 4fc19296     	fmul.2d	v22, v20, v1[0]
    6d2c: 4e618ad6     	frintn.2d	v22, v22
    6d30: 4eb41e98     	mov.16b	v24, v20
    6d34: 4ef2ce18     	fmls.2d	v24, v16, v18
    6d38: 4ef6cc14     	fmls.2d	v20, v0, v22
    6d3c: 4ef8d690     	fsub.2d	v16, v20, v24
    6d40: 4e73d6b2     	fadd.2d	v18, v21, v19
    6d44: 4ef3d6b3     	fsub.2d	v19, v21, v19
    6d48: 4e70d634     	fadd.2d	v20, v17, v16
    6d4c: 4ef0d630     	fsub.2d	v16, v17, v16
    6d50: 4fc19051     	fmul.2d	v17, v2, v1[0]
    6d54: 4e618a31     	frintn.2d	v17, v17
    6d58: 4ef1cc02     	fmls.2d	v2, v0, v17
    6d5c: 6e67def1     	fmul.2d	v17, v23, v7
    6d60: 4fc19235     	fmul.2d	v21, v17, v1[0]
    6d64: 4e618ab5     	frintn.2d	v21, v21
    6d68: 4eb11e36     	mov.16b	v22, v17
    6d6c: 4ee7cef6     	fmls.2d	v22, v23, v7
    6d70: 4ef5cc11     	fmls.2d	v17, v0, v21
    6d74: 4ef6d627     	fsub.2d	v7, v17, v22
    6d78: 6e66def1     	fmul.2d	v17, v23, v6
    6d7c: 4fc19235     	fmul.2d	v21, v17, v1[0]
    6d80: 4e618ab5     	frintn.2d	v21, v21
    6d84: 4eb11e36     	mov.16b	v22, v17
    6d88: 4ee6cef6     	fmls.2d	v22, v23, v6
    6d8c: 4ef5cc11     	fmls.2d	v17, v0, v21
    6d90: 4ef6d626     	fsub.2d	v6, v17, v22
    6d94: 4e67d451     	fadd.2d	v17, v2, v7
    6d98: 4e66d475     	fadd.2d	v21, v3, v6
    6d9c: 4ee7d442     	fsub.2d	v2, v2, v7
    6da0: 4ee6d463     	fsub.2d	v3, v3, v6
    6da4: 6e75dc86     	fmul.2d	v6, v4, v21
    6da8: 4fc190c7     	fmul.2d	v7, v6, v1[0]
    6dac: 4e6188e7     	frintn.2d	v7, v7
    6db0: 4ea61cd6     	mov.16b	v22, v6
    6db4: 4ef5cc96     	fmls.2d	v22, v4, v21
    6db8: 4ee7cc06     	fmls.2d	v6, v0, v7
    6dbc: 4ef6d4c6     	fsub.2d	v6, v6, v22
    6dc0: 6e63dca7     	fmul.2d	v7, v5, v3
    6dc4: 4fc190e1     	fmul.2d	v1, v7, v1[0]
    6dc8: 4e618821     	frintn.2d	v1, v1
    6dcc: 4ea71cf5     	mov.16b	v21, v7
    6dd0: 4ee3ccb5     	fmls.2d	v21, v5, v3
    6dd4: 4ee1cc07     	fmls.2d	v7, v0, v1
    6dd8: 4ef5d4e0     	fsub.2d	v0, v7, v21
    6ddc: 4e66d621     	fadd.2d	v1, v17, v6
    6de0: 4ee6d623     	fsub.2d	v3, v17, v6
    6de4: 4e60d444     	fadd.2d	v4, v2, v0
    6de8: ad000432     	stp	q18, q1, [x1]
    6dec: ad010c33     	stp	q19, q3, [x1, #0x20]
    6df0: ad021034     	stp	q20, q4, [x1, #0x40]
    6df4: 4ee0d440     	fsub.2d	v0, v2, v0
    6df8: ad030030     	stp	q16, q0, [x1, #0x60]
    6dfc: d65f03c0     	ret
