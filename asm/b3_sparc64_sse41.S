/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Based on BLAKE3 v1.3.1, https://github.com/BLAKE3-team/BLAKE3
 * Copyright (c) 2019-2022 Samuel Neves and Matthew Krupcale
 * Copyright (c) 2022-2023 Tino Reichardt <milky-zfs@mcmilk.de>
 *
 * This is converted assembly: SSE4.1 -> SPARC64 VII
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if defined(__sparc__)
	.section	".text"
	.align 4
	.type	loadu, #function
	.proc	00
loadu:
	.register	%g2, #scratch
	.register	%g3, #scratch
	save	%sp, -192, %sp
	ldub	[%i0+8], %g2
	ldub	[%i0+9], %g1
	sllx	%g2, 56, %g2
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+10], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+11], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i0+12], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i0+13], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i0], %g3
	ldub	[%i0+14], %g1
	sllx	%g3, 56, %g3
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+1], %g2
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%i0+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%i0+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%i0+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%i0+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%i0+6], %g2
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	ldub	[%i0+7], %g3
	or	%g3, %g2, %g2
	stx	%g2, [%fp+2039]
	ldub	[%i0+15], %g4
	ldd	[%fp+2039], %f0
	or	%g4, %g1, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
	return	%i7+8
	 nop
	.size	loadu, .-loadu
	.align 4
	.type	storeu, #function
	.proc	020
storeu:
	save	%sp, -192, %sp
	std	%f0, [%fp+2031]
	std	%f2, [%fp+2039]
	mov	16, %o2
	add	%fp, 2031, %o1
	call	memcpy, 0
	 mov	%i2, %o0
	return	%i7+8
	 nop
	.size	storeu, .-storeu
	.align 4
	.type	addv, #function
	.proc	00
addv:
	save	%sp, -192, %sp
	std	%f0, [%fp+2039]
	ldx	[%fp+2039], %g1
	std	%f2, [%fp+2039]
	ldx	[%fp+2039], %g3
	std	%f4, [%fp+2039]
	srax	%g1, 32, %g2
	ldx	[%fp+2039], %g4
	std	%f6, [%fp+2039]
	srax	%g4, 32, %g5
	add	%g1, %g4, %g1
	ldx	[%fp+2039], %i5
	srl	%g1, 0, %g4
	add	%g2, %g5, %g2
	mov	-1, %g1
	sllx	%g2, 32, %g2
	sllx	%g1, 32, %g5
	and	%g2, %g5, %g2
	or	%g2, %g4, %g2
	stx	%g2, [%fp+2039]
	srax	%g3, 32, %g1
	srax	%i5, 32, %i4
	add	%g3, %i5, %g3
	add	%g1, %i4, %g1
	srl	%g3, 0, %g3
	ldd	[%fp+2039], %f0
	sllx	%g1, 32, %g1
	and	%g1, %g5, %g1
	or	%g1, %g3, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
	return	%i7+8
	 nop
	.size	addv, .-addv
	.align 4
	.type	xorv, #function
	.proc	00
xorv:
	save	%sp, -192, %sp
	std	%f0, [%fp+2039]
	ldx	[%fp+2039], %g1
	std	%f4, [%fp+2039]
	ldx	[%fp+2039], %g2
	xor	%g1, %g2, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f0
	std	%f2, [%fp+2039]
	ldx	[%fp+2039], %g1
	std	%f6, [%fp+2039]
	ldx	[%fp+2039], %g2
	xor	%g1, %g2, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
	return	%i7+8
	 nop
	.size	xorv, .-xorv
	.align 4
	.type	set1, #function
	.proc	00
set1:
	save	%sp, -192, %sp
	sllx	%i0, 32, %g1
	mov	-1, %g2
	sllx	%g2, 32, %g2
	and	%g1, %g2, %g3
	or	%g3, %i0, %g2
	stx	%g2, [%fp+2039]
	ldd	[%fp+2039], %f0
	return	%i7+8
	 fmovd	%f0, %f2
	.size	set1, .-set1
	.align 4
	.type	set4, #function
	.proc	00
set4:
	save	%sp, -192, %sp
	sllx	%i0, 32, %i0
	mov	-1, %g1
	sllx	%g1, 32, %g1
	and	%i0, %g1, %i0
	or	%i0, %i1, %g2
	stx	%g2, [%fp+2039]
	sllx	%i2, 32, %i2
	ldd	[%fp+2039], %f0
	and	%i2, %g1, %g1
	or	%g1, %i3, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
	return	%i7+8
	 nop
	.size	set4, .-set4
	.align 4
	.type	rot16, #function
	.proc	00
rot16:
	save	%sp, -272, %sp
	std	%f2, [%fp+1959]
	mov	3, %g1
	sllx	%g1, 48, %g1
	mov	1, %g5
	mov	255, %g4
	sllx	%g5, 57, %g3
	sllx	%g4, 48, %g2
	xnor	%g0, %g2, %i2
	and	%g3, %i2, %g3
	or	%g3, %g1, %g3
	sllx	%g5, 32, %g1
	sllx	%g4, 40, %g2
	sllx	%g4, 32, %g4
	xnor	%g0, %g2, %i3
	xnor	%g0, %g4, %g4
	and	%g3, %i3, %g3
	and	%g3, %g4, %g3
	or	%g3, %g1, %g3
	sethi	%hi(4278190080), %g1
	xnor	%g0, %g1, %i4
	sethi	%hi(100663296), %g1
	and	%g3, %i4, %g3
	or	%g3, %g1, %g3
	sethi	%hi(16711680), %g1
	xnor	%g0, %g1, %i5
	sethi	%hi(459776), %g1
	and	%g3, %i5, %g3
	mov	5, %g2
	or	%g3, %g1, %g3
	sllx	%g2, 57, %g2
	mov	11, %g1
	and	%g2, %i2, %g2
	sllx	%g1, 48, %g1
	or	%g2, %g1, %g2
	and	%g2, %i3, %g2
	sllx	%g5, 43, %g1
	or	%g2, %g1, %g1
	mov	9, %g2
	sllx	%g2, 32, %g2
	and	%g1, %g4, %g1
	or	%g1, %g2, %g1
	sethi	%hi(234881024), %g2
	and	%g1, %i4, %g1
	or	%g1, %g2, %g1
	ldx	[%fp+1959], %g2
	std	%f0, [%fp+1951]
	stx	%g2, [%fp+2023]
	ldx	[%fp+1951], %g4
	stx	%g2, [%fp+1991]
	sethi	%hi(986112), %g2
	or	%g3, 5, %g3
	and	%g1, %i5, %g1
	stx	%g4, [%fp+2015]
	or	%g1, %g2, %g1
	stx	%g4, [%fp+1983]
	or	%g1, 13, %g1
	stx	%g3, [%fp+1951]
	stx	%g1, [%fp+1959]
	stx	%g3, [%fp+1999]
	stx	%g1, [%fp+2007]
	stx	%g3, [%fp+2031]
	stx	%g1, [%fp+2039]
	mov	0, %g2
	add	%fp, 1999, %g5
	add	%fp, 1967, %g4
	ldub	[%g2+%g5], %g1
	add	%fp, 2047, %i5
.L10:
	and	%g1, 15, %g3
	sll	%g1, 24, %g1
	add	%i5, %g3, %g3
	sra	%g1, 24, %g1
	ldub	[%g3-64], %g3
	xnor	%g0, %g1, %g1
	sra	%g1, 7, %g1
	and	%g1, %g3, %g1
	stb	%g1, [%g2+%g4]
	add	%g2, 1, %g2
	cmp	%g2, 16
	bne,a,pt %xcc, .L10
	 ldub	[%g2+%g5], %g1
	ldd	[%fp+1967], %f0
	ldd	[%fp+1975], %f2
	return	%i7+8
	 nop
	.size	rot16, .-rot16
	.align 4
	.type	rot12, #function
	.proc	00
rot12:
	save	%sp, -192, %sp
	std	%f0, [%fp+2039]
	mov	-1, %g3
	ldx	[%fp+2039], %g2
	std	%f2, [%fp+2039]
	srl	%g2, 12, %g4
	ldx	[%fp+2039], %g1
	sllx	%g3, 32, %g5
	srlx	%g2, 12, %i4
	srl	%g1, 12, %g3
	and	%i4, %g5, %i4
	or	%i4, %g4, %i4
	srax	%g2, 32, %g4
	sll	%g2, 20, %g2
	sllx	%g4, 52, %g4
	srl	%g2, 0, %g2
	and	%g4, %g5, %g4
	or	%g4, %g2, %g2
	xor	%g2, %i4, %g2
	stx	%g2, [%fp+2039]
	srlx	%g1, 12, %i5
	ldd	[%fp+2039], %f0
	and	%i5, %g5, %i5
	or	%i5, %g3, %i5
	srax	%g1, 32, %g3
	sll	%g1, 20, %g1
	sllx	%g3, 52, %g3
	srl	%g1, 0, %g1
	and	%g3, %g5, %g3
	or	%g3, %g1, %g1
	xor	%g1, %i5, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
	return	%i7+8
	 nop
	.size	rot12, .-rot12
	.align 4
	.type	rot8, #function
	.proc	00
rot8:
	save	%sp, -272, %sp
	std	%f0, [%fp+1951]
	mov	1, %g5
	sllx	%g5, 49, %g1
	mov	255, %g4
	sllx	%g5, 56, %g3
	sllx	%g4, 48, %g2
	xnor	%g0, %g2, %i2
	and	%g3, %i2, %g3
	or	%g3, %g1, %g3
	mov	3, %g1
	sllx	%g1, 40, %g1
	sllx	%g4, 40, %g2
	xnor	%g0, %g2, %i3
	and	%g3, %i3, %g3
	or	%g3, %g1, %g3
	sethi	%hi(4278190080), %g1
	xnor	%g0, %g1, %i4
	sethi	%hi(83886080), %g1
	sllx	%g4, 32, %g4
	xnor	%g0, %g4, %g4
	and	%g3, %g4, %g3
	and	%g3, %i4, %g3
	or	%g3, %g1, %g3
	sethi	%hi(16711680), %g1
	xnor	%g0, %g1, %i5
	sethi	%hi(393216), %g1
	and	%g3, %i5, %g3
	mov	9, %g2
	or	%g3, %g1, %g3
	sllx	%g2, 56, %g2
	mov	5, %g1
	and	%g2, %i2, %g2
	sllx	%g1, 49, %g1
	or	%g2, %g1, %g2
	and	%g2, %i3, %g2
	mov	11, %g1
	sllx	%g1, 40, %g1
	or	%g2, %g1, %g1
	sllx	%g5, 35, %g2
	and	%g1, %g4, %g1
	or	%g1, %g2, %g1
	sethi	%hi(218103808), %g2
	and	%g1, %i4, %g1
	or	%g1, %g2, %g1
	sethi	%hi(917504), %g2
	ldx	[%fp+1951], %g4
	std	%f2, [%fp+1959]
	and	%g1, %i5, %g1
	or	%g1, %g2, %g1
	ldx	[%fp+1959], %g2
	or	%g3, 1796, %g3
	or	%g1, 3852, %g1
	stx	%g4, [%fp+2015]
	stx	%g2, [%fp+2023]
	stx	%g4, [%fp+1983]
	stx	%g2, [%fp+1991]
	stx	%g3, [%fp+1951]
	stx	%g1, [%fp+1959]
	stx	%g3, [%fp+1999]
	stx	%g1, [%fp+2007]
	stx	%g3, [%fp+2031]
	stx	%g1, [%fp+2039]
	mov	0, %g2
	add	%fp, 1999, %g5
	add	%fp, 1967, %g4
	ldub	[%g2+%g5], %g1
	add	%fp, 2047, %i5
.L15:
	and	%g1, 15, %g3
	sll	%g1, 24, %g1
	add	%i5, %g3, %g3
	sra	%g1, 24, %g1
	ldub	[%g3-64], %g3
	xnor	%g0, %g1, %g1
	sra	%g1, 7, %g1
	and	%g1, %g3, %g1
	stb	%g1, [%g2+%g4]
	add	%g2, 1, %g2
	cmp	%g2, 16
	bne,a,pt %xcc, .L15
	 ldub	[%g2+%g5], %g1
	ldd	[%fp+1967], %f0
	ldd	[%fp+1975], %f2
	return	%i7+8
	 nop
	.size	rot8, .-rot8
	.align 4
	.type	rot7, #function
	.proc	00
rot7:
	save	%sp, -192, %sp
	std	%f0, [%fp+2039]
	mov	-1, %g3
	ldx	[%fp+2039], %g2
	std	%f2, [%fp+2039]
	srl	%g2, 7, %g4
	ldx	[%fp+2039], %g1
	sllx	%g3, 32, %g5
	srlx	%g2, 7, %i4
	srl	%g1, 7, %g3
	and	%i4, %g5, %i4
	or	%i4, %g4, %i4
	srax	%g2, 32, %g4
	sll	%g2, 25, %g2
	sllx	%g4, 57, %g4
	srl	%g2, 0, %g2
	and	%g4, %g5, %g4
	or	%g4, %g2, %g2
	xor	%g2, %i4, %g2
	stx	%g2, [%fp+2039]
	srlx	%g1, 7, %i5
	ldd	[%fp+2039], %f0
	and	%i5, %g5, %i5
	or	%i5, %g3, %i5
	srax	%g1, 32, %g3
	sll	%g1, 25, %g1
	sllx	%g3, 57, %g3
	srl	%g1, 0, %g1
	and	%g3, %g5, %g3
	or	%g3, %g1, %g1
	xor	%g1, %i5, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
	return	%i7+8
	 nop
	.size	rot7, .-rot7
	.align 4
	.type	g1, #function
	.proc	020
g1:
	save	%sp, -192, %sp
	std	%f8, [%fp+2039]
	ldx	[%i1], %g1
	ldx	[%fp+2039], %i5
	ldx	[%i0], %g4
	srax	%g4, 32, %o7
	add	%g4, %i5, %g4
	add	%g4, %g1, %g4
	srl	%g4, 0, %g4
	std	%f10, [%fp+2039]
	srax	%i5, 32, %g2
	ldx	[%fp+2039], %i4
	add	%g2, %o7, %g2
	mov	-1, %i5
	srax	%g1, 32, %o7
	sllx	%i5, 32, %i5
	add	%g2, %o7, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g4, %g2
	srax	%i4, 32, %g4
	ldx	[%i1+8], %g5
	ldx	[%i0+8], %g3
	srax	%g3, 32, %g1
	add	%g3, %i4, %g3
	add	%g1, %g4, %g1
	add	%g3, %g5, %g3
	srax	%g5, 32, %g4
	srl	%g3, 0, %g3
	stx	%g2, [%i0]
	add	%g1, %g4, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g3, %g1
	stx	%g1, [%i0+8]
	ldx	[%i3], %g4
	ldx	[%i3+8], %g3
	xor	%g4, %g2, %g2
	xor	%g3, %g1, %g1
	stx	%g2, [%fp+2039]
	stx	%g2, [%i3]
	stx	%g1, [%i3+8]
	ldd	[%fp+2039], %f0
	stx	%g1, [%fp+2039]
	call	rot16, 0
	 ldd	[%fp+2039], %f2
	std	%f0, [%fp+2039]
	ldx	[%fp+2039], %g1
	std	%f2, [%fp+2039]
	stx	%g1, [%i3]
	ldx	[%fp+2039], %g5
	srax	%g1, 32, %i4
	stx	%g5, [%i3+8]
	ldx	[%i2], %g4
	srax	%g4, 32, %g2
	add	%g2, %i4, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	ldx	[%i2+8], %g3
	add	%g4, %g1, %g4
	srax	%g3, 32, %g1
	srl	%g4, 0, %g4
	add	%g3, %g5, %g3
	or	%g2, %g4, %g4
	srl	%g3, 0, %g3
	srax	%g5, 32, %g2
	add	%g1, %g2, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g3, %g3
	stx	%g4, [%i2]
	stx	%g3, [%i2+8]
	ldx	[%i1], %g2
	ldx	[%i1+8], %g1
	xor	%g2, %g4, %g2
	xor	%g1, %g3, %g1
	srl	%g2, 12, %g3
	srlx	%g2, 12, %g5
	and	%g5, %i5, %g5
	or	%g5, %g3, %g5
	srl	%g1, 12, %g3
	srlx	%g1, 12, %g4
	and	%g4, %i5, %g4
	or	%g4, %g3, %g4
	srax	%g2, 32, %g3
	sllx	%g3, 52, %g3
	and	%g3, %i5, %g3
	sll	%g2, 20, %g2
	srl	%g2, 0, %g2
	or	%g3, %g2, %g2
	srax	%g1, 32, %g3
	xor	%g2, %g5, %g2
	sllx	%g3, 52, %g3
	sll	%g1, 20, %g1
	and	%g3, %i5, %i5
	srl	%g1, 0, %g1
	stx	%g2, [%i1]
	or	%i5, %g1, %g1
	xor	%g1, %g4, %g1
	stx	%g1, [%i1+8]
	return	%i7+8
	 nop
	.size	g1, .-g1
	.align 4
	.type	g2, #function
	.proc	020
g2:
	save	%sp, -192, %sp
	std	%f8, [%fp+2039]
	ldx	[%i1], %g1
	ldx	[%fp+2039], %i5
	ldx	[%i0], %g4
	srax	%g4, 32, %o7
	add	%g4, %i5, %g4
	add	%g4, %g1, %g4
	srl	%g4, 0, %g4
	std	%f10, [%fp+2039]
	srax	%i5, 32, %g2
	ldx	[%fp+2039], %i4
	add	%g2, %o7, %g2
	mov	-1, %i5
	srax	%g1, 32, %o7
	sllx	%i5, 32, %i5
	add	%g2, %o7, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g4, %g2
	srax	%i4, 32, %g4
	ldx	[%i1+8], %g5
	ldx	[%i0+8], %g3
	srax	%g3, 32, %g1
	add	%g3, %i4, %g3
	add	%g1, %g4, %g1
	add	%g3, %g5, %g3
	srax	%g5, 32, %g4
	srl	%g3, 0, %g3
	stx	%g2, [%i0]
	add	%g1, %g4, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g3, %g1
	stx	%g1, [%i0+8]
	ldx	[%i3], %g4
	ldx	[%i3+8], %g3
	xor	%g4, %g2, %g2
	xor	%g3, %g1, %g1
	stx	%g2, [%fp+2039]
	stx	%g2, [%i3]
	stx	%g1, [%i3+8]
	ldd	[%fp+2039], %f0
	stx	%g1, [%fp+2039]
	call	rot8, 0
	 ldd	[%fp+2039], %f2
	std	%f0, [%fp+2039]
	ldx	[%fp+2039], %g1
	std	%f2, [%fp+2039]
	stx	%g1, [%i3]
	ldx	[%fp+2039], %g5
	srax	%g1, 32, %i4
	stx	%g5, [%i3+8]
	ldx	[%i2], %g4
	srax	%g4, 32, %g2
	add	%g2, %i4, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	ldx	[%i2+8], %g3
	add	%g4, %g1, %g4
	srax	%g3, 32, %g1
	srl	%g4, 0, %g4
	add	%g3, %g5, %g3
	or	%g2, %g4, %g4
	srl	%g3, 0, %g3
	srax	%g5, 32, %g2
	add	%g1, %g2, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g3, %g3
	stx	%g4, [%i2]
	stx	%g3, [%i2+8]
	ldx	[%i1], %g2
	ldx	[%i1+8], %g1
	xor	%g2, %g4, %g2
	xor	%g1, %g3, %g1
	srl	%g2, 7, %g3
	srlx	%g2, 7, %g5
	and	%g5, %i5, %g5
	or	%g5, %g3, %g5
	srl	%g1, 7, %g3
	srlx	%g1, 7, %g4
	and	%g4, %i5, %g4
	or	%g4, %g3, %g4
	srax	%g2, 32, %g3
	sllx	%g3, 57, %g3
	and	%g3, %i5, %g3
	sll	%g2, 25, %g2
	srl	%g2, 0, %g2
	or	%g3, %g2, %g2
	srax	%g1, 32, %g3
	xor	%g2, %g5, %g2
	sllx	%g3, 57, %g3
	sll	%g1, 25, %g1
	and	%g3, %i5, %i5
	srl	%g1, 0, %g1
	stx	%g2, [%i1]
	or	%i5, %g1, %g1
	xor	%g1, %g4, %g1
	stx	%g1, [%i1+8]
	return	%i7+8
	 nop
	.size	g2, .-g2
	.align 4
	.type	diagonalize, #function
	.proc	020
diagonalize:
	save	%sp, -176, %sp
	ldx	[%i0], %g3
	ldx	[%i0+8], %g4
	srlx	%g3, 32, %g5
	sllx	%g4, 32, %g1
	mov	-1, %g2
	srlx	%g4, 32, %g4
	sllx	%g2, 32, %g2
	sllx	%g3, 32, %g3
	and	%g3, %g2, %g3
	or	%g3, %g4, %g3
	and	%g1, %g2, %g1
	stx	%g3, [%i0+8]
	or	%g1, %g5, %g1
	stx	%g1, [%i0]
	ldx	[%i2+8], %g3
	srl	%g3, 0, %g4
	ldx	[%i2], %g1
	and	%g3, %g2, %g3
	or	%g3, %g4, %g3
	srl	%g1, 0, %g4
	stx	%g3, [%i2]
	and	%g1, %g2, %g1
	or	%g1, %g4, %g1
	stx	%g1, [%i2+8]
	ldx	[%i1], %g4
	ldx	[%i1+8], %g1
	sllx	%g4, 32, %g3
	srlx	%g1, 32, %g5
	and	%g3, %g2, %g3
	sllx	%g1, 32, %g1
	or	%g3, %g5, %g3
	srlx	%g4, 32, %g4
	and	%g1, %g2, %g1
	stx	%g3, [%i1]
	or	%g1, %g4, %g1
	stx	%g1, [%i1+8]
	return	%i7+8
	 nop
	.size	diagonalize, .-diagonalize
	.align 4
	.type	undiagonalize, #function
	.proc	020
undiagonalize:
	save	%sp, -176, %sp
	ldx	[%i0], %g4
	ldx	[%i0+8], %g3
	sllx	%g4, 32, %g1
	srlx	%g3, 32, %g5
	srlx	%g4, 32, %g4
	mov	-1, %g2
	sllx	%g3, 32, %g3
	sllx	%g2, 32, %g2
	and	%g3, %g2, %g3
	or	%g3, %g4, %g3
	and	%g1, %g2, %g1
	stx	%g3, [%i0+8]
	or	%g1, %g5, %g1
	stx	%g1, [%i0]
	ldx	[%i2+8], %g3
	srl	%g3, 0, %g4
	ldx	[%i2], %g1
	and	%g3, %g2, %g3
	or	%g3, %g4, %g3
	srl	%g1, 0, %g4
	stx	%g3, [%i2]
	and	%g1, %g2, %g1
	or	%g1, %g4, %g1
	stx	%g1, [%i2+8]
	ldx	[%i1], %g1
	ldx	[%i1+8], %g4
	srlx	%g1, 32, %g5
	sllx	%g4, 32, %g3
	sllx	%g1, 32, %g1
	and	%g3, %g2, %g3
	srlx	%g4, 32, %g4
	or	%g3, %g5, %g3
	and	%g1, %g2, %g1
	stx	%g3, [%i1]
	or	%g1, %g4, %g1
	stx	%g1, [%i1+8]
	return	%i7+8
	 nop
	.size	undiagonalize, .-undiagonalize
	.align 4
	.type	compress_pre, #function
	.proc	020
compress_pre:
	save	%sp, -528, %sp
	ldub	[%i1+8], %g2
	ldub	[%i1+9], %g1
	sllx	%g2, 56, %g2
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+10], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+11], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i1+12], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i1+13], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+14], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+15], %g3
	ldub	[%i1], %g2
	or	%g3, %g1, %g3
	sllx	%g2, 56, %g2
	ldub	[%i1+1], %g1
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+2], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+3], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i1+4], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i1+5], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+6], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+7], %g2
	or	%g2, %g1, %g1
	stx	%g3, [%i0+8]
	stx	%g1, [%i0]
	ldub	[%i1+24], %g2
	ldub	[%i1+25], %g1
	sllx	%g2, 56, %g2
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+26], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+27], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i1+28], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i1+29], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+30], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+31], %g3
	ldub	[%i1+16], %g2
	or	%g3, %g1, %g3
	sllx	%g2, 56, %g2
	ldub	[%i1+17], %g1
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+18], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+19], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i1+20], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i1+21], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i1+22], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i1+23], %g2
	or	%g2, %g1, %g1
	stx	%g3, [%i0+24]
	stx	%g1, [%i0+16]
	sethi	%hi(2773480448), %o3
	sethi	%hi(1013903360), %o2
	or	%o3, 314, %o3
	or	%o2, 882, %o2
	sethi	%hi(3144133632), %o1
	sethi	%hi(1779033088), %o0
	or	%o1, 645, %o1
	call	set4, 0
	 or	%o0, 615, %o0
	mov	%i5, %o3
	mov	%i3, %o2
	srlx	%i4, 32, %o1
	srl	%i4, 0, %o0
	std	%f0, [%i0+32]
	call	set4, 0
	 std	%f2, [%i0+40]
	std	%f0, [%i0+48]
	std	%f2, [%i0+56]
	ldub	[%i2+8], %g3
	ldub	[%i2+9], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%i2+10], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%i2+11], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%i2+14], %g1
	ldub	[%i2+12], %g3
	sllx	%g1, 8, %g1
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%i2+13], %g2
	sllx	%g2, 16, %g2
	ldub	[%i2+1], %g5
	or	%g2, %g3, %g3
	sllx	%g5, 48, %g5
	or	%g1, %g3, %g2
	ldub	[%i2], %g1
	sllx	%g1, 56, %g1
	or	%g5, %g1, %g1
	ldub	[%i2+2], %g5
	sllx	%g5, 40, %g5
	or	%g5, %g1, %g5
	ldub	[%i2+3], %g1
	sllx	%g1, 32, %g1
	or	%g1, %g5, %g5
	ldub	[%i2+4], %g1
	sllx	%g1, 24, %g1
	or	%g1, %g5, %g1
	ldub	[%i2+5], %g5
	sllx	%g5, 16, %g5
	or	%g5, %g1, %g1
	ldub	[%i2+25], %g4
	ldub	[%i2+6], %g5
	sllx	%g4, 48, %g4
	sllx	%g5, 8, %g5
	or	%g5, %g1, %g5
	ldub	[%i2+24], %g1
	sllx	%g1, 56, %g1
	or	%g4, %g1, %g1
	ldub	[%i2+26], %g4
	sllx	%g4, 40, %g4
	or	%g4, %g1, %g4
	ldub	[%i2+27], %g1
	sllx	%g1, 32, %g1
	or	%g1, %g4, %g4
	ldub	[%i2+16], %i5
	ldub	[%i2+28], %g1
	ldub	[%i2+17], %g3
	sllx	%g1, 24, %g1
	sllx	%g3, 48, %g3
	or	%g1, %g4, %g1
	sllx	%i5, 56, %i5
	ldub	[%i2+29], %g4
	or	%g3, %i5, %i5
	sllx	%g4, 16, %g4
	ldub	[%i2+15], %l1
	ldub	[%i2+7], %l4
	or	%g4, %g1, %g1
	ldub	[%i2+31], %i3
	ldub	[%i2+30], %g4
	ldub	[%i2+18], %g3
	sllx	%g3, 40, %g3
	or	%g3, %i5, %g3
	ldub	[%i2+19], %i5
	sllx	%i5, 32, %i5
	or	%i5, %g3, %g3
	sllx	%g4, 8, %g4
	ldub	[%i2+20], %i5
	or	%g4, %g1, %g4
	sllx	%i5, 24, %i5
	ldub	[%i2+22], %g1
	or	%i5, %g3, %i5
	sllx	%g1, 8, %g1
	ldub	[%i2+21], %g3
	sllx	%g3, 16, %g3
	or	%g3, %i5, %i5
	or	%g1, %i5, %g3
	ldub	[%i2+40], %g1
	sllx	%g1, 56, %i4
	ldub	[%i2+41], %g1
	sllx	%g1, 48, %g1
	or	%g1, %i4, %g1
	ldub	[%i2+42], %i4
	sllx	%i4, 40, %i4
	or	%i4, %g1, %g1
	ldub	[%i2+43], %i4
	sllx	%i4, 32, %i4
	or	%i4, %g1, %i4
	ldub	[%i2+44], %g1
	sllx	%g1, 24, %g1
	or	%g1, %i4, %i4
	ldub	[%i2+45], %g1
	sllx	%g1, 16, %g1
	or	%g1, %i4, %g1
	ldub	[%i2+46], %i4
	sllx	%i4, 8, %i4
	or	%i4, %g1, %g1
	ldub	[%i2+47], %i4
	or	%i4, %g1, %i4
	ldub	[%i2+32], %g1
	sllx	%g1, 56, %l3
	ldub	[%i2+33], %g1
	sllx	%g1, 48, %g1
	or	%g1, %l3, %g1
	ldub	[%i2+34], %l3
	sllx	%l3, 40, %l3
	or	%l3, %g1, %g1
	ldub	[%i2+35], %l3
	sllx	%l3, 32, %l3
	or	%l3, %g1, %l3
	ldub	[%i2+36], %g1
	sllx	%g1, 24, %g1
	or	%g1, %l3, %l3
	ldub	[%i2+37], %g1
	sllx	%g1, 16, %g1
	or	%g1, %l3, %g1
	ldub	[%i2+38], %l3
	sllx	%l3, 8, %l3
	or	%l3, %g1, %g1
	ldub	[%i2+39], %l3
	or	%l3, %g1, %l3
	ldub	[%i2+56], %g1
	sllx	%g1, 56, %i5
	ldub	[%i2+57], %g1
	sllx	%g1, 48, %g1
	or	%g1, %i5, %g1
	ldub	[%i2+58], %i5
	sllx	%i5, 40, %i5
	or	%i5, %g1, %g1
	ldub	[%i2+59], %i5
	sllx	%i5, 32, %i5
	or	%i5, %g1, %i5
	ldub	[%i2+60], %g1
	sllx	%g1, 24, %g1
	or	%g1, %i5, %i5
	ldub	[%i2+61], %g1
	sllx	%g1, 16, %g1
	or	%g1, %i5, %g1
	ldub	[%i2+62], %i5
	sllx	%i5, 8, %i5
	or	%i5, %g1, %g1
	ldub	[%i2+48], %i1
	ldub	[%i2+63], %i5
	sllx	%i1, 56, %i1
	or	%i5, %g1, %i5
	ldub	[%i2+49], %g1
	sllx	%g1, 48, %g1
	or	%g1, %i1, %i1
	ldub	[%i2+23], %l2
	ldub	[%i2+50], %g1
	sllx	%g1, 40, %g1
	or	%g1, %i1, %g1
	ldub	[%i2+51], %i1
	sllx	%i1, 32, %i1
	or	%i1, %g1, %g1
	ldub	[%i2+52], %i1
	sllx	%i1, 24, %i1
	or	%i1, %g1, %i1
	ldub	[%i2+53], %g1
	sllx	%g1, 16, %g1
	or	%g1, %i1, %i1
	ldub	[%i2+54], %g1
	sllx	%g1, 8, %g1
	or	%g1, %i1, %g1
	ldub	[%i2+55], %i2
	or	%i2, %g1, %i2
	srlx	%g2, 32, %g1
	st	%g1, [%fp+1767]
	srlx	%g3, 32, %g1
	ld	[%fp+1767], %f12
	or	%l4, %g5, %l4
	st	%f12, [%fp+1779]
	srlx	%g5, 32, %g5
	st	%g1, [%fp+1767]
	st	%g5, [%fp+1775]
	ldx	[%fp+1775], %g1
	ld	[%fp+1767], %f13
	or	%i3, %g4, %i3
	st	%f13, [%fp+1783]
	srlx	%g4, 32, %g4
	stx	%g1, [%fp+1791]
	st	%g4, [%fp+1787]
	ldx	[%fp+1783], %g1
	add	%i0, 32, %i1
	add	%i0, 16, %l0
	or	%l1, %g2, %l5
	st	%f12, [%fp+1711]
	add	%i0, 48, %l1
	st	%f13, [%fp+1719]
	or	%l2, %g3, %l2
	stx	%g1, [%fp+1799]
	ldd	[%fp+1791], %f8
	ldd	[%fp+1799], %f10
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	call	g1, 0
	 mov	%i0, %o0
	st	%l4, [%fp+1751]
	ld	[%fp+1751], %f8
	st	%l5, [%fp+1767]
	st	%f8, [%fp+1775]
	ld	[%fp+1767], %f8
	st	%l2, [%fp+1751]
	st	%f8, [%fp+1779]
	ld	[%fp+1751], %f8
	ldx	[%fp+1775], %g1
	st	%i3, [%fp+1759]
	st	%f8, [%fp+1783]
	stx	%g1, [%fp+1807]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	ldd	[%fp+1807], %f8
	stx	%g1, [%fp+1815]
	mov	%l1, %o3
	ldd	[%fp+1815], %f10
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	srlx	%l3, 32, %g1
	st	%g1, [%fp+1775]
	srlx	%i4, 32, %g1
	st	%g1, [%fp+1779]
	srlx	%i2, 32, %g1
	st	%g1, [%fp+1783]
	srlx	%i5, 32, %g1
	st	%g1, [%fp+1787]
	ldx	[%fp+1775], %g1
	ldx	[%fp+1783], %g2
	stx	%g1, [%fp+1823]
	srl	%g2, 0, %g1
	lduw	[%fp+1823], %g4
	mov	-1, %o5
	stx	%g2, [%fp+1831]
	sllx	%o5, 32, %i3
	lduw	[%fp+1831], %g3
	stx	%g1, [%fp+1695]
	sllx	%g2, 32, %g2
	and	%g2, %i3, %g2
	or	%g2, %g4, %g1
	stx	%g1, [%fp+1751]
	stx	%g4, [%fp+1735]
	stx	%o5, [%fp+1727]
	ldd	[%fp+1751], %f8
	lduw	[%fp+1827], %l2
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%l2, 32, %l2
	and	%l2, %i3, %l2
	or	%l2, %g3, %l2
	stx	%l2, [%fp+1751]
	call	g1, 0
	 ldd	[%fp+1751], %f10
	st	%l3, [%fp+1751]
	ld	[%fp+1751], %f8
	st	%i4, [%fp+1751]
	st	%f8, [%fp+1775]
	ld	[%fp+1751], %f8
	st	%i2, [%fp+1751]
	st	%f8, [%fp+1779]
	ld	[%fp+1751], %f8
	ldx	[%fp+1775], %g2
	st	%i5, [%fp+1751]
	srl	%g2, 0, %g1
	st	%f8, [%fp+1783]
	stx	%g2, [%fp+1839]
	ld	[%fp+1751], %f8
	lduw	[%fp+1839], %g3
	st	%f8, [%fp+1787]
	sllx	%g2, 32, %i5
	ldx	[%fp+1783], %i4
	stx	%i4, [%fp+1847]
	sllx	%i4, 32, %i4
	lduw	[%fp+1847], %g2
	and	%i4, %i3, %i4
	or	%i4, %g3, %i4
	stx	%i4, [%fp+1743]
	stx	%g1, [%fp+1751]
	ldd	[%fp+1743], %f8
	mov	%l1, %o3
	and	%i5, %i3, %i5
	mov	%i1, %o2
	or	%i5, %g2, %i5
	mov	%l0, %o1
	stx	%i5, [%fp+1743]
	mov	%i0, %o0
	call	g2, 0
	 ldd	[%fp+1743], %f10
	sethi	%hi(67107840), %l5
	mov	%l1, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ld	[%fp+1767], %f8
	ld	[%fp+1719], %f13
	ld	[%fp+1711], %f12
	st	%f13, [%fp+1775]
	st	%f12, [%fp+1779]
	st	%f8, [%fp+1783]
	ldx	[%fp+1775], %g5
	ld	[%fp+1759], %f8
	stx	%g5, [%fp+1855]
	st	%f8, [%fp+1787]
	sllx	%g5, 32, %g5
	ldx	[%fp+1783], %g2
	and	%g5, %i3, %g5
	stx	%g2, [%fp+1863]
	lduw	[%fp+1863], %l7
	or	%g5, %l7, %l7
	stx	%l7, [%fp+1767]
	stx	%g5, [%fp+1703]
	ldd	[%fp+1767], %f8
	lduw	[%fp+1855], %l6
	lduw	[%fp+1867], %l4
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%l4, 32, %l4
	and	%l4, %i3, %l4
	or	%l4, %l6, %l4
	stx	%l4, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	sllx	%l5, 22, %l5
	srlx	%l2, 32, %g2
	st	%g2, [%fp+1767]
	ld	[%fp+1767], %f9
	st	%f9, [%fp+1775]
	st	%f9, [%fp+1779]
	ldx	[%fp+1775], %g2
	st	%i5, [%fp+1767]
	stx	%g2, [%fp+1871]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1783]
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g2
	lduw	[%fp+1803], %g3
	stx	%g2, [%fp+1879]
	sllx	%g3, 32, %g3
	lduw	[%fp+1791], %g2
	and	%g3, %i3, %g3
	sllx	%g2, 32, %g2
	srlx	%g3, 48, %i5
	and	%g2, %i3, %g2
	sllx	%g3, 16, %g3
	srlx	%g2, 48, %l3
	srlx	%g3, 48, %g3
	sllx	%g2, 16, %g2
	sllx	%g3, 32, %g3
	srlx	%g2, 48, %g2
	sllx	%g2, 32, %g2
	xnor	%g0, %l5, %l5
	sllx	%i5, 48, %i5
	sllx	%l3, 48, %l3
	and	%i5, %l5, %i5
	and	%l3, %l5, %l3
	or	%i5, %g3, %i5
	or	%l3, %g2, %l3
	lduh	[%fp+1875], %g3
	lduh	[%fp+1883], %g2
	sllx	%g3, 16, %g3
	sllx	%g2, 16, %g2
	ldx	[%fp+1727], %o5
	sethi	%hi(4294901760), %i2
	sllx	%o5, 16, %o4
	xnor	%g0, %i2, %i2
	and	%i5, %i2, %i5
	and	%l3, %i2, %l3
	or	%i5, %g3, %i5
	or	%l3, %g2, %l3
	lduh	[%fp+1877], %g3
	and	%i5, %o4, %i5
	lduh	[%fp+1885], %g2
	or	%i5, %g3, %i5
	stx	%i5, [%fp+1767]
	and	%l3, %o4, %l3
	ldd	[%fp+1767], %f8
	or	%l3, %g2, %l3
	stx	%o4, [%fp+1759]
	stx	%l3, [%fp+1767]
	mov	%l1, %o3
	ldd	[%fp+1767], %f10
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	sllx	%i4, 16, %o7
	srlx	%o7, 48, %o7
	sllx	%o7, 32, %o7
	ldx	[%fp+1759], %o4
	ldx	[%fp+1807], %g3
	srlx	%i4, 48, %g2
	srlx	%g3, 48, %o5
	sllx	%g2, 48, %g2
	sllx	%g3, 16, %g3
	and	%g2, %l5, %g2
	srlx	%g3, 48, %g3
	or	%g2, %o7, %g2
	sllx	%g3, 32, %g3
	and	%g2, %i2, %g2
	sethi	%hi(4294901760), %o7
	and	%i4, %o7, %o7
	or	%g2, %o7, %g2
	and	%g2, %o4, %g2
	srlx	%g2, 32, %g1
	sllx	%i4, 48, %o7
	stx	%g1, [%fp+1767]
	sllx	%l2, 48, %i4
	srlx	%o7, 48, %o7
	sllx	%o5, 48, %o5
	or	%g2, %o7, %o7
	and	%o5, %l5, %o5
	srl	%o7, 0, %o7
	and	%g2, %i3, %g2
	or	%o5, %g3, %o5
	srlx	%i4, 48, %i4
	and	%o5, %i2, %o5
	sethi	%hi(4294901760), %g3
	and	%l2, %g3, %g3
	or	%o5, %g3, %o5
	and	%o5, %o4, %o5
	or	%o5, %i4, %i4
	srlx	%o5, 32, %o5
	or	%g2, %o5, %g1
	stx	%g1, [%fp+1759]
	stx	%o5, [%fp+1711]
	stx	%o4, [%fp+1743]
	ldd	[%fp+1759], %f8
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%i4, 32, %i4
	and	%i4, %i3, %i4
	or	%i4, %o7, %i4
	stx	%i4, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	ldx	[%fp+1735], %g4
	ldx	[%fp+1751], %g1
	lduw	[%fp+1815], %g3
	sllx	%g4, 32, %g2
	sllx	%g3, 32, %g4
	and	%g2, %i3, %g2
	and	%g4, %i3, %g4
	or	%g2, %g1, %g2
	ldx	[%fp+1695], %g1
	stx	%g2, [%fp+1759]
	or	%g4, %g1, %g4
	stx	%g3, [%fp+1719]
	stx	%g2, [%fp+1735]
	ldd	[%fp+1759], %f8
	stx	%g4, [%fp+1751]
	stx	%g4, [%fp+1759]
	mov	%l1, %o3
	ldd	[%fp+1759], %f10
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	st	%l7, [%fp+1759]
	ld	[%fp+1759], %f8
	st	%i5, [%fp+1759]
	st	%f8, [%fp+1779]
	ld	[%fp+1759], %f8
	st	%l3, [%fp+1759]
	st	%f8, [%fp+1783]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	srlx	%l4, 32, %l4
	stx	%g1, [%fp+1895]
	st	%l4, [%fp+1775]
	lduw	[%fp+1895], %g1
	ldx	[%fp+1775], %l2
	stx	%l2, [%fp+1887]
	sllx	%l2, 32, %l2
	and	%l2, %i3, %l2
	or	%l2, %g1, %g1
	stx	%g1, [%fp+1759]
	stx	%g1, [%fp+1727]
	ldd	[%fp+1759], %f8
	lduw	[%fp+1887], %l4
	lduw	[%fp+1899], %l7
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%l7, 32, %l7
	and	%l7, %i3, %l7
	or	%l7, %l4, %l7
	stx	%l7, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	ldx	[%fp+1751], %g4
	srlx	%i4, 32, %o7
	st	%o7, [%fp+1759]
	ld	[%fp+1759], %f9
	st	%g4, [%fp+1759]
	st	%f9, [%fp+1775]
	st	%f9, [%fp+1779]
	ldx	[%fp+1775], %g4
	ld	[%fp+1759], %f8
	stx	%g4, [%fp+1903]
	st	%f8, [%fp+1783]
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g4
	sllx	%l6, 32, %l6
	stx	%g4, [%fp+1911]
	and	%l6, %i3, %l6
	srlx	%l6, 48, %g4
	sllx	%l6, 16, %l6
	srlx	%l6, 48, %l6
	sllx	%l6, 32, %l6
	ldx	[%fp+1703], %g5
	sllx	%g4, 48, %g4
	and	%g4, %l5, %g4
	or	%g4, %l6, %g4
	srlx	%g5, 48, %l6
	sllx	%g5, 16, %g5
	srlx	%g5, 16, %g5
	lduh	[%fp+1907], %o7
	sllx	%l6, 48, %l6
	sllx	%o7, 16, %o7
	and	%l6, %l5, %l6
	or	%l6, %g5, %l6
	lduh	[%fp+1915], %g5
	sllx	%g5, 16, %g5
	ldx	[%fp+1743], %o4
	and	%g4, %i2, %g4
	and	%l6, %i2, %l6
	or	%g4, %o7, %g4
	or	%l6, %g5, %l6
	lduh	[%fp+1909], %o7
	and	%g4, %o4, %g4
	lduh	[%fp+1917], %g5
	or	%g4, %o7, %g4
	stx	%g4, [%fp+1759]
	stx	%g4, [%fp+1743]
	and	%l6, %o4, %l6
	ldd	[%fp+1759], %f8
	or	%l6, %g5, %l6
	stx	%o4, [%fp+1751]
	stx	%l6, [%fp+1759]
	mov	%l1, %o3
	ldd	[%fp+1759], %f10
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1735], %g2
	sllx	%g2, 16, %g5
	srlx	%g5, 48, %g5
	sllx	%g5, 32, %g5
	srlx	%g2, 48, %o7
	sllx	%o7, 48, %o7
	and	%o7, %l5, %o7
	or	%o7, %g5, %o7
	sethi	%hi(4294901760), %g5
	and	%g2, %g5, %g5
	and	%o7, %i2, %o7
	sllx	%g2, 48, %o2
	or	%o7, %g5, %o7
	sethi	%hi(4294901760), %g2
	srlx	%i5, 48, %g5
	and	%i4, %g2, %g2
	sllx	%i5, 16, %i5
	srlx	%i5, 48, %i5
	sllx	%i5, 32, %i5
	ldx	[%fp+1751], %o4
	srlx	%o2, 48, %o2
	and	%o7, %o4, %o7
	sllx	%g5, 48, %g5
	or	%o7, %o2, %o2
	and	%g5, %l5, %g5
	srl	%o2, 0, %o2
	or	%g5, %i5, %g5
	sllx	%i4, 48, %i5
	and	%g5, %i2, %g5
	srlx	%i5, 48, %i5
	or	%g5, %g2, %g5
	srlx	%o7, 32, %g2
	and	%g5, %o4, %g5
	and	%o7, %i3, %o7
	or	%g5, %i5, %i5
	srlx	%g5, 32, %g5
	or	%o7, %g5, %g1
	stx	%g1, [%fp+1759]
	stx	%g2, [%fp+1695]
	stx	%g5, [%fp+1703]
	stx	%o4, [%fp+1735]
	ldd	[%fp+1759], %f8
	mov	%l1, %o3
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%i5, 32, %i5
	and	%i5, %i3, %i5
	or	%i5, %o2, %i5
	mov	%i1, %o2
	stx	%i5, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	ldx	[%fp+1711], %o5
	srlx	%l3, 32, %g1
	ldx	[%fp+1719], %g3
	and	%l3, %i3, %l3
	sllx	%o5, 32, %i4
	stx	%g1, [%fp+1759]
	and	%i4, %i3, %i4
	ldx	[%fp+1767], %g1
	or	%i4, %g3, %i4
	or	%l3, %g1, %o5
	stx	%i4, [%fp+1767]
	stx	%o5, [%fp+1751]
	ldd	[%fp+1767], %f8
	mov	%l1, %o3
	stx	%o5, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1727], %g1
	st	%g1, [%fp+1767]
	ld	[%fp+1767], %f8
	ldx	[%fp+1743], %g4
	st	%f8, [%fp+1779]
	st	%g4, [%fp+1767]
	ld	[%fp+1767], %f8
	st	%l6, [%fp+1767]
	st	%f8, [%fp+1783]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	srlx	%l7, 32, %l7
	stx	%g1, [%fp+1927]
	st	%l7, [%fp+1775]
	lduw	[%fp+1927], %g1
	ldx	[%fp+1775], %g3
	stx	%g3, [%fp+1919]
	sllx	%g3, 32, %g3
	and	%g3, %i3, %g3
	or	%g3, %g1, %g1
	stx	%g1, [%fp+1767]
	stx	%g3, [%fp+1711]
	stx	%g1, [%fp+1727]
	ldd	[%fp+1767], %f8
	lduw	[%fp+1919], %l3
	lduw	[%fp+1931], %l7
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%l7, 32, %l7
	and	%l7, %i3, %l7
	or	%l7, %l3, %l7
	stx	%l7, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	sllx	%l4, 32, %l4
	srlx	%i5, 32, %o7
	st	%o7, [%fp+1767]
	ld	[%fp+1767], %f9
	st	%f9, [%fp+1775]
	st	%f9, [%fp+1779]
	ldx	[%fp+1775], %o7
	ldx	[%fp+1751], %o5
	stx	%o7, [%fp+1935]
	st	%o5, [%fp+1767]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1783]
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %o7
	stx	%o7, [%fp+1943]
	and	%l4, %i3, %o7
	srlx	%o7, 48, %l4
	sllx	%o7, 16, %o7
	srlx	%o7, 48, %o7
	sllx	%o7, 32, %o7
	sllx	%l4, 48, %l4
	and	%l4, %l5, %l4
	or	%l4, %o7, %l4
	lduh	[%fp+1939], %o7
	sllx	%o7, 16, %o7
	and	%l4, %i2, %l4
	or	%l4, %o7, %l4
	lduh	[%fp+1941], %o7
	ldx	[%fp+1735], %o4
	and	%l4, %o4, %l4
	or	%l4, %o7, %l4
	srlx	%l2, 48, %o7
	sllx	%l2, 16, %l2
	sllx	%o7, 48, %o7
	srlx	%l2, 16, %o5
	and	%o7, %l5, %l2
	lduh	[%fp+1947], %o7
	sllx	%o7, 16, %o7
	stx	%l4, [%fp+1767]
	or	%l2, %o5, %l2
	and	%l2, %i2, %l2
	or	%l2, %o7, %l2
	lduh	[%fp+1949], %o7
	and	%l2, %o4, %l2
	ldd	[%fp+1767], %f8
	or	%l2, %o7, %l2
	stx	%o4, [%fp+1751]
	stx	%l2, [%fp+1767]
	mov	%l1, %o3
	ldd	[%fp+1767], %f10
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	srlx	%l7, 32, %l7
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	sllx	%i4, 16, %o5
	srlx	%o5, 48, %o5
	sllx	%o5, 32, %o5
	srlx	%i4, 48, %o7
	sllx	%o7, 48, %o7
	and	%o7, %l5, %o7
	or	%o7, %o5, %o7
	sethi	%hi(4294901760), %o5
	and	%i4, %o5, %o5
	ldx	[%fp+1743], %g4
	and	%o7, %i2, %o7
	or	%o7, %o5, %o7
	srlx	%g4, 48, %o5
	sllx	%g4, 16, %g4
	srlx	%g4, 48, %g4
	sllx	%g4, 32, %g4
	sllx	%o5, 48, %o5
	and	%o5, %l5, %o5
	or	%o5, %g4, %o5
	sethi	%hi(4294901760), %g4
	and	%i5, %g4, %g4
	ldx	[%fp+1751], %o4
	sllx	%i4, 48, %o2
	and	%o7, %o4, %o7
	and	%o5, %i2, %o5
	sllx	%i5, 48, %i4
	or	%o5, %g4, %o5
	srlx	%o2, 48, %o2
	srlx	%o7, 32, %g4
	and	%o5, %o4, %o5
	or	%o7, %o2, %o2
	srlx	%i4, 48, %i4
	and	%o7, %i3, %o7
	or	%o5, %i4, %i4
	srl	%o2, 0, %o2
	srlx	%o5, 32, %o5
	or	%o7, %o5, %g1
	stx	%g1, [%fp+1767]
	stx	%g4, [%fp+1719]
	stx	%o5, [%fp+1743]
	stx	%o4, [%fp+1735]
	ldd	[%fp+1767], %f8
	mov	%l1, %o3
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%i4, 32, %i4
	and	%i4, %i3, %i4
	or	%i4, %o2, %i4
	mov	%i1, %o2
	stx	%i4, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	ldx	[%fp+1759], %g1
	ldx	[%fp+1703], %g5
	ldx	[%fp+1695], %g2
	sllx	%g5, 32, %i5
	and	%i5, %i3, %i5
	or	%i5, %g1, %i5
	srlx	%l6, 32, %g1
	stx	%i5, [%fp+1767]
	and	%l6, %i3, %l6
	or	%l6, %g2, %g5
	ldd	[%fp+1767], %f8
	stx	%g5, [%fp+1751]
	stx	%g5, [%fp+1767]
	stx	%g1, [%fp+1759]
	ldd	[%fp+1767], %f10
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1727], %g1
	st	%g1, [%fp+1767]
	ld	[%fp+1767], %f8
	st	%l4, [%fp+1767]
	st	%f8, [%fp+1779]
	ld	[%fp+1767], %f8
	st	%l2, [%fp+1767]
	st	%f8, [%fp+1783]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	stx	%g1, [%fp+1959]
	lduw	[%fp+1959], %g1
	st	%l7, [%fp+1775]
	ldx	[%fp+1775], %l6
	stx	%l6, [%fp+1951]
	sllx	%l6, 32, %l6
	and	%l6, %i3, %g2
	or	%g2, %g1, %g2
	lduw	[%fp+1951], %g1
	stx	%g2, [%fp+1767]
	stx	%g2, [%fp+1727]
	ldd	[%fp+1767], %f8
	lduw	[%fp+1963], %l7
	stx	%g1, [%fp+1695]
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%l7, 32, %l7
	and	%l7, %i3, %l7
	or	%l7, %g1, %l7
	stx	%l7, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	sllx	%l3, 32, %l3
	srlx	%i4, 32, %o7
	ldx	[%fp+1751], %g5
	st	%o7, [%fp+1767]
	ld	[%fp+1767], %f9
	st	%g5, [%fp+1767]
	st	%f9, [%fp+1775]
	st	%f9, [%fp+1779]
	ldx	[%fp+1775], %g5
	ld	[%fp+1767], %f8
	stx	%g5, [%fp+1967]
	st	%f8, [%fp+1783]
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g5
	stx	%g5, [%fp+1975]
	lduh	[%fp+1971], %g5
	sllx	%g5, 16, %g5
	and	%l3, %i3, %i3
	srlx	%i3, 48, %l3
	sllx	%i3, 16, %i3
	sllx	%l3, 48, %l3
	srlx	%i3, 48, %i3
	and	%l3, %l5, %l3
	sllx	%i3, 32, %i3
	or	%l3, %i3, %l3
	and	%l3, %i2, %l3
	or	%l3, %g5, %l3
	lduh	[%fp+1973], %g5
	ldx	[%fp+1735], %o4
	ldx	[%fp+1711], %g3
	and	%l3, %o4, %l3
	or	%l3, %g5, %l3
	srlx	%g3, 48, %g5
	sllx	%g3, 16, %g3
	srlx	%g3, 16, %g3
	sllx	%g5, 48, %g5
	and	%g5, %l5, %l5
	or	%l5, %g3, %l5
	lduh	[%fp+1979], %g3
	sllx	%g3, 16, %g3
	and	%l5, %i2, %i2
	or	%i2, %g3, %i2
	lduh	[%fp+1981], %g3
	and	%i2, %o4, %g5
	or	%g5, %g3, %g1
	stx	%l3, [%fp+1751]
	stx	%g1, [%fp+1767]
	ldd	[%fp+1751], %f8
	ldd	[%fp+1767], %f10
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	srlx	%l4, 48, %i3
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	sllx	%i5, 16, %g3
	srlx	%g3, 48, %g3
	sllx	%g3, 32, %g3
	srlx	%i5, 48, %o7
	sethi	%hi(67107840), %l5
	sllx	%o7, 48, %o7
	sllx	%l5, 22, %l5
	sllx	%l4, 16, %l4
	xnor	%g0, %l5, %l5
	srlx	%l4, 48, %l4
	and	%o7, %l5, %o7
	sllx	%l4, 32, %l4
	or	%o7, %g3, %o7
	sethi	%hi(4294901760), %g5
	sethi	%hi(4294901760), %g3
	and	%i4, %g5, %g5
	and	%i5, %g3, %g3
	mov	-1, %o1
	sllx	%i5, 48, %o2
	sethi	%hi(4294901760), %i2
	sllx	%i4, 48, %i5
	xnor	%g0, %i2, %i2
	srlx	%o2, 48, %o2
	and	%o7, %i2, %o7
	sllx	%i3, 48, %i3
	or	%o7, %g3, %o7
	and	%i3, %l5, %i3
	sllx	%o1, 16, %g3
	or	%i3, %l4, %i3
	and	%o7, %g3, %o7
	sllx	%o1, 32, %l4
	or	%o7, %o2, %o2
	and	%i3, %i2, %i3
	srl	%o2, 0, %o2
	or	%i3, %g5, %i3
	srlx	%i5, 48, %i5
	srlx	%o7, 32, %g5
	and	%i3, %g3, %i3
	and	%o7, %l4, %o7
	or	%i3, %i5, %i5
	srlx	%i3, 32, %i3
	or	%o7, %i3, %g1
	stx	%g1, [%fp+1751]
	stx	%g5, [%fp+1703]
	stx	%g3, [%fp+1735]
	ldd	[%fp+1751], %f8
	mov	%l1, %o3
	mov	%l0, %o1
	mov	%i0, %o0
	sllx	%i5, 32, %i5
	and	%i5, %l4, %i5
	or	%i5, %o2, %i5
	mov	%i1, %o2
	stx	%i5, [%fp+1751]
	call	g1, 0
	 ldd	[%fp+1751], %f10
	ldx	[%fp+1743], %o5
	ldx	[%fp+1759], %g1
	ldx	[%fp+1719], %g4
	sllx	%o5, 32, %i4
	srlx	%l2, 32, %o5
	and	%i4, %l4, %i4
	or	%i4, %g1, %i4
	stx	%i4, [%fp+1759]
	stx	%o5, [%fp+1743]
	ldd	[%fp+1759], %f8
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	and	%l2, %l4, %l2
	or	%l2, %g4, %l2
	stx	%l2, [%fp+1759]
	call	g2, 0
	 ldd	[%fp+1759], %f10
	srlx	%l7, 32, %l7
	mov	%l1, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1727], %g2
	st	%g2, [%fp+1759]
	ld	[%fp+1759], %f8
	st	%l3, [%fp+1759]
	st	%f8, [%fp+1779]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1783]
	ld	[%fp+1771], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g4
	st	%l7, [%fp+1775]
	stx	%g4, [%fp+1991]
	ldx	[%fp+1775], %g2
	lduw	[%fp+1991], %o4
	stx	%g2, [%fp+1983]
	lduw	[%fp+1995], %g4
	lduw	[%fp+1983], %l7
	sllx	%g2, 32, %g2
	sllx	%g4, 32, %g4
	and	%g2, %l4, %g2
	and	%g4, %l4, %g4
	or	%g2, %o4, %o4
	or	%g4, %l7, %g4
	stx	%o4, [%fp+1759]
	stx	%o4, [%fp+1719]
	stx	%g4, [%fp+1727]
	stx	%g2, [%fp+1711]
	ldd	[%fp+1759], %f8
	mov	%l1, %o3
	stx	%g4, [%fp+1759]
	mov	%i1, %o2
	ldd	[%fp+1759], %f10
	mov	%l0, %o1
	call	g1, 0
	 mov	%i0, %o0
	sllx	%i3, 32, %i3
	srlx	%i5, 32, %o7
	st	%o7, [%fp+1759]
	ld	[%fp+1759], %f9
	st	%f9, [%fp+1775]
	st	%f9, [%fp+1779]
	ldx	[%fp+1775], %o7
	st	%l2, [%fp+1759]
	stx	%o7, [%fp+1999]
	ld	[%fp+1759], %f8
	ldx	[%fp+1695], %g1
	st	%f8, [%fp+1783]
	st	%f8, [%fp+1787]
	sllx	%g1, 32, %g1
	ldx	[%fp+1783], %o7
	ldx	[%fp+1735], %g3
	stx	%o7, [%fp+2007]
	and	%g1, %l4, %o2
	and	%l6, %l4, %o7
	srlx	%o2, 48, %g1
	lduh	[%fp+2003], %l6
	sllx	%g1, 48, %g1
	sllx	%l6, 16, %l6
	and	%g1, %l5, %g1
	sllx	%o2, 16, %o2
	srlx	%o2, 48, %o2
	sllx	%o2, 32, %o2
	or	%g1, %o2, %g1
	and	%g1, %i2, %g1
	or	%g1, %l6, %g1
	and	%g1, %g3, %g1
	lduh	[%fp+2005], %l6
	or	%g1, %l6, %l6
	lduh	[%fp+2011], %g1
	sllx	%g1, 16, %g1
	stx	%l6, [%fp+1759]
	srlx	%o7, 48, %l2
	sllx	%o7, 16, %o7
	sllx	%l2, 48, %l2
	srlx	%o7, 48, %o7
	and	%l2, %l5, %l2
	sllx	%o7, 32, %o7
	or	%l2, %o7, %l2
	and	%l2, %i2, %l2
	or	%l2, %g1, %l2
	lduh	[%fp+2013], %g1
	and	%l2, %g3, %l2
	ldd	[%fp+1759], %f8
	or	%l2, %g1, %l2
	stx	%g3, [%fp+1751]
	stx	%l2, [%fp+1759]
	mov	%l1, %o3
	ldd	[%fp+1759], %f10
	mov	%i1, %o2
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	sllx	%i4, 16, %o7
	srlx	%o7, 48, %o7
	sllx	%o7, 32, %o7
	srlx	%i4, 48, %g1
	sllx	%g1, 48, %g1
	and	%g1, %l5, %g1
	or	%g1, %o7, %g1
	sethi	%hi(4294901760), %o7
	and	%i4, %o7, %o7
	and	%g1, %i2, %g1
	or	%g1, %o7, %g1
	sllx	%i4, 48, %o7
	srlx	%l3, 48, %i4
	sllx	%l3, 16, %l3
	sllx	%i4, 48, %i4
	srlx	%l3, 48, %l3
	ldx	[%fp+1751], %g3
	sllx	%l3, 32, %o2
	and	%g1, %g3, %g1
	and	%i4, %l5, %l3
	srlx	%g1, 32, %g2
	or	%l3, %o2, %l3
	srlx	%o7, 48, %o7
	and	%l3, %i2, %l3
	or	%g1, %o7, %o7
	sethi	%hi(4294901760), %i4
	srl	%o7, 0, %o7
	and	%i5, %i4, %i4
	and	%g1, %l4, %g1
	or	%l3, %i4, %l3
	sllx	%i5, 48, %i5
	and	%l3, %g3, %l3
	srlx	%i5, 48, %i5
	or	%l3, %i5, %i5
	srlx	%l3, 32, %l3
	or	%g1, %l3, %g1
	stx	%g1, [%fp+1751]
	stx	%g3, [%fp+1735]
	stx	%g2, [%fp+1759]
	ldd	[%fp+1751], %f8
	mov	%l1, %o3
	mov	%i1, %o2
	mov	%l0, %o1
	mov	%i0, %o0
	and	%i3, %l4, %i3
	sllx	%i5, 32, %i5
	and	%i5, %l4, %i5
	or	%i5, %o7, %i5
	stx	%i5, [%fp+1751]
	call	g1, 0
	 ldd	[%fp+1751], %f10
	sllx	%l7, 32, %l7
	ldx	[%fp+1767], %g1
	ldx	[%fp+1703], %g5
	ldx	[%fp+1743], %o5
	or	%i3, %o5, %o5
	srlx	%g1, 32, %i3
	stx	%o5, [%fp+1767]
	and	%g1, %l4, %g1
	stx	%o5, [%fp+1743]
	or	%g1, %g5, %i4
	ldd	[%fp+1767], %f8
	mov	%l1, %o3
	stx	%i4, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%l0, %o1
	call	g2, 0
	 mov	%i0, %o0
	and	%l7, %l4, %l7
	mov	%l1, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1719], %o4
	st	%o4, [%fp+1767]
	ld	[%fp+1767], %f8
	ldx	[%fp+1727], %g4
	st	%l6, [%fp+1767]
	st	%f8, [%fp+1779]
	srlx	%g4, 32, %g4
	ld	[%fp+1767], %f8
	st	%g4, [%fp+1775]
	st	%l2, [%fp+1767]
	st	%f8, [%fp+1783]
	ldx	[%fp+1775], %g1
	ld	[%fp+1767], %f8
	stx	%g1, [%fp+2015]
	st	%f8, [%fp+1787]
	sllx	%g1, 32, %g1
	ldx	[%fp+1783], %g4
	and	%g1, %l4, %g1
	stx	%g4, [%fp+2023]
	lduw	[%fp+2023], %o7
	or	%g1, %o7, %g1
	lduw	[%fp+2015], %g5
	stx	%g1, [%fp+1767]
	lduw	[%fp+2027], %g4
	sllx	%g4, 32, %g4
	and	%g4, %l4, %g4
	or	%g4, %g5, %g1
	ldd	[%fp+1767], %f8
	mov	%l1, %o3
	stx	%g1, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%l0, %o1
	call	g1, 0
	 mov	%i0, %o0
	sllx	%l3, 32, %l3
	srlx	%i5, 32, %g1
	st	%g1, [%fp+1767]
	ld	[%fp+1767], %f9
	st	%f9, [%fp+1775]
	st	%f9, [%fp+1779]
	ldx	[%fp+1775], %g1
	st	%i4, [%fp+1767]
	stx	%g1, [%fp+2031]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1783]
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	ldx	[%fp+1711], %g2
	stx	%g1, [%fp+2039]
	srlx	%g2, 48, %g1
	sllx	%g2, 16, %g2
	srlx	%g2, 16, %g2
	ldx	[%fp+1735], %g3
	srlx	%l7, 48, %g4
	sllx	%g1, 48, %g1
	sllx	%l7, 16, %l7
	and	%g1, %l5, %g1
	srlx	%l7, 48, %l7
	or	%g1, %g2, %g1
	sllx	%l7, 32, %l7
	lduh	[%fp+2043], %g2
	sllx	%g2, 16, %g2
	lduh	[%fp+2037], %g5
	and	%g1, %i2, %g1
	stx	%g3, [%fp+1751]
	or	%g1, %g2, %g1
	sllx	%g4, 48, %g4
	lduh	[%fp+2045], %g2
	and	%g4, %l5, %g4
	and	%g1, %g3, %g1
	or	%g4, %l7, %g4
	or	%g1, %g2, %g1
	lduh	[%fp+2035], %l7
	and	%g4, %i2, %g4
	sllx	%l7, 16, %l7
	or	%g4, %l7, %g4
	and	%g4, %g3, %g4
	or	%g4, %g5, %g3
	stx	%g3, [%fp+1767]
	mov	%l1, %o3
	ldd	[%fp+1767], %f8
	mov	%i1, %o2
	stx	%g1, [%fp+1767]
	mov	%l0, %o1
	ldd	[%fp+1767], %f10
	call	g2, 0
	 mov	%i0, %o0
	mov	%l1, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1743], %o5
	sllx	%o5, 16, %g1
	srlx	%g1, 48, %g1
	sllx	%g1, 32, %g1
	srlx	%o5, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %l5, %g2
	or	%g2, %g1, %g2
	sethi	%hi(4294901760), %g1
	and	%o5, %g1, %g1
	and	%g2, %i2, %g2
	or	%g2, %g1, %g2
	srlx	%l6, 48, %g1
	sllx	%g1, 48, %g1
	and	%g1, %l5, %l5
	sethi	%hi(4294901760), %g1
	and	%i5, %g1, %g1
	ldx	[%fp+1751], %g3
	sllx	%o5, 48, %o5
	and	%g2, %g3, %g2
	srlx	%o5, 48, %o5
	sllx	%l6, 16, %l6
	or	%g2, %o5, %o5
	srlx	%l6, 48, %l6
	srl	%o5, 0, %o5
	sllx	%l6, 32, %l6
	and	%g2, %l4, %g2
	or	%l5, %l6, %l5
	and	%l5, %i2, %i2
	or	%i2, %g1, %i2
	sllx	%i5, 48, %g1
	and	%i2, %g3, %g3
	srlx	%g1, 48, %g1
	or	%g3, %g1, %g1
	srlx	%g3, 32, %g3
	sllx	%g1, 32, %g1
	or	%g2, %g3, %g2
	and	%g1, %l4, %g1
	stx	%g2, [%fp+1767]
	or	%g1, %o5, %g1
	ldd	[%fp+1767], %f8
	mov	%l1, %o3
	stx	%g1, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%l0, %o1
	call	g1, 0
	 mov	%i0, %o0
	and	%l3, %l4, %l3
	or	%l3, %i3, %g1
	and	%l2, %l4, %l2
	stx	%g1, [%fp+1767]
	ldx	[%fp+1759], %g1
	or	%l2, %g1, %g1
	ldd	[%fp+1767], %f8
	mov	%l1, %o3
	stx	%g1, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%l0, %o1
	mov	%i0, %o0
	call	g2, 0
	 mov	%l1, %i2
	call	undiagonalize, 0
	 restore
	.size	compress_pre, .-compress_pre
	.align 4
	.global _blake3_compress_in_place_sse41
	.type	_blake3_compress_in_place_sse41, #function
	.proc	020
_blake3_compress_in_place_sse41:
	save	%sp, -256, %sp
	mov	%i4, %o5
	mov	%i3, %o4
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i0, %o1
	call	compress_pre, 0
	 add	%fp, 1983, %o0
	ldx	[%fp+1983], %g2
	ldx	[%fp+2015], %g1
	xor	%g2, %g1, %g1
	ldx	[%fp+1991], %g2
	stx	%g1, [%fp+1975]
	ldx	[%fp+2023], %g1
	xor	%g2, %g1, %g1
	ldd	[%fp+1975], %f0
	mov	%i0, %o2
	stx	%g1, [%fp+1975]
	call	storeu, 0
	 ldd	[%fp+1975], %f2
	ldx	[%fp+1999], %g2
	ldx	[%fp+2031], %g1
	xor	%g2, %g1, %g1
	ldx	[%fp+2007], %g2
	stx	%g1, [%fp+1975]
	ldx	[%fp+2039], %g1
	xor	%g2, %g1, %g1
	ldd	[%fp+1975], %f0
	add	%i0, 16, %o2
	stx	%g1, [%fp+1975]
	call	storeu, 0
	 ldd	[%fp+1975], %f2
	return	%i7+8
	 nop
	.size	_blake3_compress_in_place_sse41, .-_blake3_compress_in_place_sse41
	.align 4
	.global _blake3_compress_xof_sse41
	.type	_blake3_compress_xof_sse41, #function
	.proc	020
_blake3_compress_xof_sse41:
	save	%sp, -256, %sp
	mov	%i4, %o5
	mov	%i3, %o4
	mov	%i2, %o3
	mov	%i0, %o1
	add	%fp, 1983, %o0
	call	compress_pre, 0
	 mov	%i1, %o2
	ldx	[%fp+1983], %g2
	ldx	[%fp+2015], %g1
	xor	%g2, %g1, %g1
	ldx	[%fp+1991], %g2
	stx	%g1, [%fp+1975]
	ldx	[%fp+2023], %g1
	xor	%g2, %g1, %g1
	ldd	[%fp+1975], %f0
	mov	%i5, %o2
	stx	%g1, [%fp+1975]
	call	storeu, 0
	 ldd	[%fp+1975], %f2
	ldx	[%fp+1999], %g2
	ldx	[%fp+2031], %g1
	xor	%g2, %g1, %g1
	ldx	[%fp+2007], %g2
	stx	%g1, [%fp+1975]
	ldx	[%fp+2039], %g1
	xor	%g2, %g1, %g1
	ldd	[%fp+1975], %f0
	add	%i5, 16, %o2
	stx	%g1, [%fp+1975]
	call	storeu, 0
	 ldd	[%fp+1975], %f2
	ldub	[%i0+8], %g2
	ldub	[%i0+9], %g1
	sllx	%g2, 56, %g2
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+10], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+11], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i0+12], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i0+13], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+14], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+15], %g3
	ldub	[%i0], %g2
	or	%g3, %g1, %g3
	sllx	%g2, 56, %g2
	ldub	[%i0+1], %g1
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+2], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+3], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i0+4], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i0+5], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+6], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+7], %g2
	or	%g2, %g1, %g1
	ldx	[%fp+2015], %g2
	xor	%g2, %g1, %g1
	stx	%g1, [%fp+1975]
	ldx	[%fp+2023], %g1
	xor	%g1, %g3, %g1
	ldd	[%fp+1975], %f0
	add	%i5, 32, %o2
	stx	%g1, [%fp+1975]
	call	storeu, 0
	 ldd	[%fp+1975], %f2
	ldub	[%i0+24], %g2
	ldub	[%i0+25], %g1
	sllx	%g2, 56, %g2
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+26], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+27], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i0+28], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i0+29], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+30], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+31], %g3
	ldub	[%i0+16], %g2
	or	%g3, %g1, %g3
	sllx	%g2, 56, %g2
	ldub	[%i0+17], %g1
	sllx	%g1, 48, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+18], %g1
	sllx	%g1, 40, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+19], %g2
	sllx	%g2, 32, %g2
	or	%g2, %g1, %g1
	ldub	[%i0+20], %g2
	sllx	%g2, 24, %g2
	or	%g2, %g1, %g2
	ldub	[%i0+21], %g1
	sllx	%g1, 16, %g1
	or	%g1, %g2, %g2
	ldub	[%i0+22], %g1
	sllx	%g1, 8, %g1
	or	%g1, %g2, %g1
	ldub	[%i0+23], %g2
	or	%g2, %g1, %g1
	ldx	[%fp+2031], %g2
	xor	%g2, %g1, %g1
	stx	%g1, [%fp+1975]
	ldx	[%fp+2039], %g1
	xor	%g1, %g3, %g1
	ldd	[%fp+1975], %f0
	add	%i5, 48, %o2
	stx	%g1, [%fp+1975]
	call	storeu, 0
	 ldd	[%fp+1975], %f2
	return	%i7+8
	 nop
	.size	_blake3_compress_xof_sse41, .-_blake3_compress_xof_sse41
	.align 4
	.type	round_fn, #function
	.proc	020
round_fn:
	save	%sp, -224, %sp
	sllx	%i2, 4, %g3
	sethi	%hi(_GLOBAL_OFFSET_TABLE_-4), %l7
	call	__sparc_get_pc_thunk.l7
	 add	%l7, %lo(_GLOBAL_OFFSET_TABLE_+4), %l7
	sethi	%gdop_hix22(MSG_SCHEDULE), %i4
	xor	%i4, %gdop_lox10(MSG_SCHEDULE), %i4
	ldx	[%l7 + %i4], %i4, %gdop(MSG_SCHEDULE)
	ldub	[%i4+%g3], %g1
	sllx	%g1, 4, %g1
	ldx	[%i1+%g1], %g2
	add	%i1, %g1, %g4
	ldx	[%g4+8], %g1
	ldx	[%i0], %l5
	ldx	[%i0+8], %l4
	srax	%g2, 32, %g4
	srax	%l5, 32, %o4
	srax	%l4, 32, %o5
	add	%l5, %g2, %l5
	add	%l4, %g1, %l4
	srax	%g1, 32, %g2
	srl	%l5, 0, %g1
	add	%o4, %g4, %o4
	add	%o5, %g2, %o5
	srl	%l4, 0, %g4
	sllx	%o4, 32, %g2
	mov	-1, %i5
	sllx	%i5, 32, %i5
	and	%g2, %i5, %g2
	or	%g2, %g1, %g2
	sllx	%o5, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g4, %g1
	add	%i4, %g3, %i4
	stx	%g1, [%i0+8]
	ldub	[%i4+2], %g1
	sllx	%g1, 4, %g1
	stx	%g2, [%i0]
	add	%i1, %g1, %g3
	ldx	[%i1+%g1], %g2
	ldx	[%g3+8], %g1
	ldx	[%i0+16], %l3
	ldx	[%i0+24], %l2
	srax	%g2, 32, %g3
	stx	%i2, [%fp+2007]
	srax	%l3, 32, %o1
	srax	%l2, 32, %i2
	add	%l3, %g2, %l3
	add	%l2, %g1, %l2
	srax	%g1, 32, %g2
	srl	%l3, 0, %g1
	add	%o1, %g3, %o1
	add	%i2, %g2, %g2
	sllx	%o1, 32, %g3
	srl	%l2, 0, %g4
	and	%g3, %i5, %g3
	or	%g3, %g1, %g3
	sllx	%g2, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g4, %g1
	stx	%g3, [%i0+16]
	stx	%g1, [%i0+24]
	ldub	[%i4+4], %g4
	ldx	[%i0+40], %g1
	sllx	%g4, 4, %g4
	add	%i1, %g4, %g3
	ldx	[%i1+%g4], %g4
	srax	%g4, 32, %g5
	ldx	[%g3+8], %g3
	ldx	[%i0+32], %l1
	srax	%l1, 32, %i3
	add	%l1, %g4, %l1
	add	%i3, %g5, %i3
	srax	%g3, 32, %g4
	srax	%g1, 32, %g5
	add	%g1, %g3, %g3
	srl	%l1, 0, %g1
	add	%g5, %g4, %g4
	srl	%g3, 0, %i2
	sllx	%i3, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %g1, %g5
	sllx	%g4, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %i2, %g1
	stx	%g5, [%i0+32]
	stx	%g1, [%i0+40]
	ldub	[%i4+6], %g1
	sllx	%g1, 4, %g1
	add	%i1, %g1, %g5
	ldx	[%g5+8], %o2
	ldx	[%i0+64], %g5
	ldx	[%i1+%g1], %l0
	srax	%g5, 32, %i2
	ldx	[%i0+72], %g1
	add	%l5, %g5, %l5
	srax	%g1, 32, %g5
	ldx	[%i0+48], %o0
	ldx	[%i0+56], %o3
	stx	%l7, [%fp+2015]
	add	%o4, %i2, %o4
	srl	%l5, 0, %l5
	add	%o5, %g5, %o5
	add	%l4, %g1, %l4
	sllx	%o4, 32, %o4
	srl	%l4, 0, %l4
	and	%o4, %i5, %o4
	sllx	%o5, 32, %o5
	or	%o4, %l5, %o4
	and	%o5, %i5, %o5
	stx	%o4, [%i0]
	or	%o5, %l4, %o5
	stx	%o5, [%i0+8]
	ldx	[%i0+80], %g5
	ldx	[%i0+88], %g1
	srax	%g1, 32, %i2
	add	%l2, %g1, %l2
	add	%g2, %i2, %i2
	ldx	[%i0+96], %g1
	ldx	[%i0+104], %g2
	srax	%g5, 32, %o7
	add	%l3, %g5, %l3
	add	%l1, %g1, %l1
	srax	%g1, 32, %g5
	add	%g3, %g2, %g3
	srax	%g2, 32, %g1
	srl	%g3, 0, %g3
	srax	%l0, 32, %g2
	add	%i3, %g5, %g5
	add	%g4, %g1, %g1
	ldx	[%i0+112], %i3
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g3, %g1
	srax	%o0, 32, %g3
	add	%g3, %g2, %g3
	srax	%i3, 32, %g2
	ldx	[%i0+120], %g4
	add	%g3, %g2, %g3
	add	%o0, %l0, %g2
	add	%g2, %i3, %g2
	srax	%o2, 32, %i3
	srl	%g2, 0, %g2
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g2, %g3
	srax	%o3, 32, %g2
	add	%o3, %o2, %o3
	add	%g2, %i3, %g2
	add	%o3, %g4, %o3
	srax	%g4, 32, %i3
	ldx	[%i0+200], %g4
	add	%g2, %i3, %g2
	xor	%g4, %o5, %o5
	ldx	[%i0+192], %i3
	ldx	[%i0+216], %g4
	xor	%i3, %o4, %o4
	srl	%l2, 0, %l2
	ldx	[%i0+208], %i3
	stx	%g1, [%i0+40]
	sllx	%i2, 32, %i2
	and	%i2, %i5, %i2
	or	%i2, %l2, %i2
	stx	%i2, [%i0+24]
	xor	%g4, %i2, %i2
	ldx	[%i0+232], %g4
	xor	%g4, %g1, %g1
	stx	%o4, [%fp+2039]
	ldx	[%i0+240], %g4
	add	%o1, %o7, %o7
	srl	%o3, 0, %o3
	srl	%l3, 0, %l3
	srl	%l1, 0, %l1
	stx	%g3, [%i0+48]
	stx	%g1, [%i0+232]
	xor	%g4, %g3, %g3
	ldx	[%i0+248], %g1
	sllx	%o7, 32, %o7
	sllx	%g5, 32, %g5
	and	%o7, %i5, %o7
	and	%g5, %i5, %g5
	or	%o7, %l3, %o7
	or	%g5, %l1, %g5
	stx	%o7, [%i0+16]
	stx	%g5, [%i0+32]
	xor	%i3, %o7, %o7
	sllx	%g2, 32, %g2
	ldx	[%i0+224], %i3
	and	%g2, %i5, %g2
	xor	%i3, %g5, %g5
	or	%g2, %o3, %g2
	stx	%g2, [%i0+56]
	xor	%g1, %g2, %g2
	stx	%o4, [%i0+192]
	stx	%o5, [%i0+200]
	stx	%o7, [%i0+208]
	stx	%g5, [%i0+224]
	stx	%g3, [%i0+240]
	stx	%g2, [%i0+248]
	stx	%i2, [%i0+216]
	ldd	[%fp+2039], %f0
	stx	%o5, [%fp+2039]
	call	rot16, 0
	 ldd	[%fp+2039], %f2
	std	%f0, [%i0+192]
	std	%f2, [%i0+200]
	ldd	[%i0+208], %f0
	call	rot16, 0
	 ldd	[%i0+216], %f2
	std	%f0, [%i0+208]
	std	%f2, [%i0+216]
	ldd	[%i0+224], %f0
	call	rot16, 0
	 ldd	[%i0+232], %f2
	std	%f0, [%i0+224]
	std	%f2, [%i0+232]
	ldd	[%i0+240], %f0
	call	rot16, 0
	 ldd	[%i0+248], %f2
	std	%f0, [%fp+2039]
	ldx	[%i0+192], %g3
	srax	%g3, 32, %g3
	ldx	[%i0+128], %g2
	srax	%g2, 32, %o7
	add	%o7, %g3, %o7
	ldx	[%i0+192], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	sllx	%o7, 32, %o7
	and	%o7, %i5, %o7
	or	%o7, %g2, %o7
	ldx	[%i0+200], %g2
	srax	%g2, 32, %g2
	ldx	[%i0+136], %g1
	ldx	[%i0+208], %g3
	srax	%g1, 32, %i2
	srax	%g3, 32, %g3
	add	%i2, %g2, %i2
	ldx	[%i0+200], %g2
	add	%g1, %g2, %g1
	ldx	[%i0+144], %g2
	srax	%g2, 32, %i3
	add	%i3, %g3, %i3
	ldx	[%i0+208], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	srl	%g1, 0, %g1
	sllx	%i3, 32, %i3
	and	%i3, %i5, %i3
	or	%i3, %g2, %i3
	ldx	[%i0+216], %g2
	srax	%g2, 32, %g2
	ldx	[%i0+224], %g3
	sllx	%i2, 32, %i2
	srax	%g3, 32, %g3
	and	%i2, %i5, %i2
	or	%i2, %g1, %i2
	ldx	[%i0+152], %g1
	srax	%g1, 32, %g5
	add	%g5, %g2, %g5
	ldx	[%i0+216], %g2
	add	%g1, %g2, %g1
	ldx	[%i0+160], %g2
	srax	%g2, 32, %g4
	add	%g4, %g3, %g4
	ldx	[%i0+224], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	srl	%g1, 0, %g1
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %g2, %g4
	ldx	[%i0+232], %g2
	srax	%g2, 32, %g2
	sllx	%g5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %g1, %g5
	ldx	[%i0+168], %g1
	srax	%g1, 32, %g3
	add	%g3, %g2, %g3
	ldx	[%i0+232], %g2
	add	%g1, %g2, %g1
	srl	%g1, 0, %g1
	ldx	[%fp+2039], %l4
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g1, %g3
	ldx	[%i0+176], %g1
	srax	%g1, 32, %g2
	add	%g1, %l4, %g1
	srl	%g1, 0, %g1
	std	%f2, [%fp+2039]
	ldx	[%i0+184], %o5
	ldx	[%fp+2039], %l3
	srax	%l4, 32, %o4
	stx	%l4, [%i0+240]
	stx	%l3, [%i0+248]
	stx	%o7, [%i0+128]
	stx	%i2, [%i0+136]
	stx	%i3, [%i0+144]
	stx	%g5, [%i0+152]
	stx	%g4, [%i0+160]
	stx	%g3, [%i0+168]
	add	%g2, %o4, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g1, %g2
	srax	%o5, 32, %g1
	add	%o5, %l3, %o5
	srl	%o5, 0, %o5
	stx	%g2, [%i0+176]
	srax	%l3, 32, %o4
	add	%g1, %o4, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %o5, %g1
	ldx	[%i0+64], %o5
	xor	%o5, %o7, %o7
	ldx	[%i0+96], %o5
	xor	%o5, %g4, %g4
	ldx	[%i0+120], %o5
	stx	%g1, [%i0+184]
	ldx	[%i0+72], %l0
	xor	%o5, %g1, %g1
	ldx	[%i0+88], %o3
	ldx	[%i0+104], %o4
	srl	%o7, 12, %o5
	srlx	%o7, 12, %l2
	and	%l2, %i5, %l2
	xor	%o3, %g5, %g5
	xor	%o4, %g3, %g3
	xor	%l0, %i2, %i2
	ldx	[%i0+112], %o4
	or	%l2, %o5, %o3
	srlx	%i2, 12, %l0
	srl	%i2, 12, %o5
	and	%l0, %i5, %l0
	srax	%o7, 32, %l2
	sll	%o7, 20, %o7
	srl	%o7, 0, %o7
	xor	%o4, %g2, %g2
	sllx	%l2, 52, %l2
	or	%l0, %o5, %o4
	and	%l2, %i5, %l2
	or	%l2, %o7, %o5
	srax	%i2, 32, %o7
	sll	%i2, 20, %i2
	sllx	%o7, 52, %o7
	srl	%i2, 0, %i2
	and	%o7, %i5, %l0
	or	%l0, %i2, %i2
	ldx	[%i0+80], %o1
	xor	%o4, %i2, %l0
	xor	%o1, %i3, %i3
	srl	%i3, 12, %i2
	srlx	%i3, 12, %o7
	and	%o7, %i5, %o1
	or	%o1, %i2, %o1
	srl	%g5, 12, %i2
	xor	%o3, %o5, %l2
	srlx	%g5, 12, %o3
	srax	%i3, 32, %o5
	and	%o3, %i5, %o3
	sll	%i3, 20, %i3
	or	%o3, %i2, %o7
	srl	%i3, 0, %i2
	sllx	%o5, 52, %o5
	and	%o5, %i5, %i3
	or	%i3, %i2, %i3
	srax	%g5, 32, %i2
	sll	%g5, 20, %g5
	sllx	%i2, 52, %i2
	srl	%g5, 0, %g5
	and	%i2, %i5, %o3
	or	%o3, %g5, %g5
	xor	%o7, %g5, %o3
	srl	%g4, 12, %g5
	xor	%o1, %i3, %o1
	srlx	%g4, 12, %i3
	and	%i3, %i5, %o5
	or	%o5, %g5, %o5
	srl	%g3, 12, %g5
	srlx	%g3, 12, %i3
	srax	%g4, 32, %i2
	and	%i3, %i5, %i3
	sll	%g4, 20, %g4
	or	%i3, %g5, %i3
	srl	%g4, 0, %g5
	sllx	%i2, 52, %i2
	and	%i2, %i5, %g4
	or	%g4, %g5, %g4
	srax	%g3, 32, %g5
	sll	%g3, 20, %g3
	sllx	%g5, 52, %g5
	srl	%g3, 0, %g3
	and	%g5, %i5, %g5
	or	%g5, %g3, %g3
	xor	%i3, %g3, %g3
	stx	%g3, [%i0+104]
	stx	%g3, [%fp+2039]
	srl	%g2, 12, %g3
	srlx	%g2, 12, %g5
	and	%g5, %i5, %g5
	or	%g5, %g3, %g5
	srl	%g1, 12, %g3
	xor	%o5, %g4, %o5
	srax	%g2, 32, %i3
	srlx	%g1, 12, %g4
	sll	%g2, 20, %g2
	and	%g4, %i5, %g4
	or	%g4, %g3, %g4
	srl	%g2, 0, %g3
	sllx	%i3, 52, %i3
	and	%i3, %i5, %g2
	or	%g2, %g3, %g2
	srax	%g1, 32, %g3
	xor	%g5, %g2, %g2
	sllx	%g3, 52, %g3
	sll	%g1, 20, %g1
	and	%g3, %i5, %g3
	srl	%g1, 0, %g1
	or	%g3, %g1, %g1
	xor	%g4, %g1, %g1
	stx	%g2, [%i0+112]
	stx	%g2, [%fp+2031]
	stx	%g1, [%fp+2023]
	ldub	[%i4+1], %g2
	ldx	[%fp+2023], %g1
	sllx	%g2, 4, %g2
	stx	%o1, [%i0+80]
	stx	%o3, [%i0+88]
	stx	%l2, [%i0+64]
	stx	%l0, [%i0+72]
	stx	%o5, [%i0+96]
	stx	%g1, [%i0+120]
	add	%i1, %g2, %g1
	ldx	[%i1+%g2], %g3
	ldx	[%g1+8], %g2
	ldx	[%i0], %l1
	ldx	[%i0+8], %o0
	srax	%l1, 32, %g4
	srax	%g3, 32, %g1
	add	%l1, %g3, %l1
	srax	%o0, 32, %i3
	srax	%g2, 32, %g3
	add	%o0, %g2, %o0
	srl	%l1, 0, %g2
	add	%g4, %g1, %g1
	add	%i3, %g3, %i3
	srl	%o0, 0, %g4
	sllx	%g1, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g2, %g3
	sllx	%i3, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g4, %g2
	stx	%g3, [%i0]
	stx	%g2, [%i0+8]
	ldx	[%i0+16], %o2
	ldx	[%i0+24], %o4
	ldub	[%i4+3], %g3
	sllx	%g3, 4, %g3
	add	%i1, %g3, %g2
	ldx	[%i1+%g3], %g3
	ldx	[%g2+8], %g2
	srax	%g3, 32, %g4
	srax	%o2, 32, %g5
	add	%o2, %g3, %o2
	add	%g5, %g4, %g5
	srax	%g2, 32, %g3
	srax	%o4, 32, %g4
	add	%o4, %g2, %o4
	srl	%o2, 0, %g2
	add	%g4, %g3, %g4
	srl	%o4, 0, %i2
	sllx	%g5, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g2, %g3
	sllx	%g4, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %i2, %g2
	stx	%g3, [%i0+16]
	stx	%g2, [%i0+24]
	ldx	[%i0+40], %l5
	ldx	[%i0+32], %o7
	ldub	[%i4+5], %g2
	srax	%o7, 32, %l6
	sllx	%g2, 4, %g2
	add	%i1, %g2, %g3
	ldx	[%i1+%g2], %g2
	ldx	[%g3+8], %i2
	add	%o2, %o1, %o2
	add	%o4, %o3, %o4
	add	%o7, %g2, %o7
	srax	%g2, 32, %g3
	add	%l1, %l2, %l1
	add	%l6, %g3, %g3
	srax	%i2, 32, %g2
	srax	%l5, 32, %l6
	add	%l5, %i2, %i2
	srl	%l1, 0, %l1
	srl	%o7, 0, %l5
	srl	%i2, 0, %l7
	add	%o0, %l0, %o0
	srl	%o2, 0, %o2
	srl	%o0, 0, %o0
	srl	%o4, 0, %o4
	add	%o7, %o5, %o7
	srl	%o7, 0, %o7
	add	%l6, %g2, %g2
	sllx	%g3, 32, %l6
	and	%l6, %i5, %l6
	or	%l6, %l5, %l6
	sllx	%g2, 32, %l5
	and	%l5, %i5, %l5
	or	%l5, %l7, %l5
	srax	%l2, 32, %l7
	add	%g1, %l7, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %l1, %g1
	srax	%l0, 32, %l1
	add	%i3, %l1, %i3
	sllx	%i3, 32, %i3
	and	%i3, %i5, %i3
	or	%i3, %o0, %i3
	srax	%o1, 32, %o0
	add	%g5, %o0, %g5
	sllx	%g5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %o2, %g5
	srax	%o3, 32, %o2
	add	%g4, %o2, %g4
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %o4, %g4
	srax	%o5, 32, %o4
	add	%g3, %o4, %g3
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %o7, %g3
	ldx	[%fp+2039], %o7
	srax	%o7, 32, %o7
	add	%g2, %o7, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	ldx	[%fp+2039], %o7
	add	%i2, %o7, %i2
	srl	%i2, 0, %i2
	or	%g2, %i2, %i2
	ldx	[%i0+48], %g2
	srax	%g2, 32, %g2
	stx	%l6, [%i0+32]
	stx	%l5, [%i0+40]
	ldub	[%i4+7], %l6
	sllx	%l6, 4, %l6
	add	%i1, %l6, %l5
	ldx	[%i1+%l6], %l6
	srax	%l6, 32, %o5
	add	%g2, %o5, %o5
	ldx	[%fp+2031], %g2
	srax	%g2, 32, %g2
	add	%o5, %g2, %o5
	ldx	[%i0+48], %g2
	add	%g2, %l6, %l6
	ldx	[%fp+2031], %g2
	add	%l6, %g2, %l6
	ldx	[%i0+56], %g2
	ldx	[%l5+8], %l5
	srax	%g2, 32, %o7
	srax	%l5, 32, %g2
	add	%o7, %g2, %o7
	ldx	[%fp+2023], %g2
	srax	%g2, 32, %g2
	add	%o7, %g2, %o7
	ldx	[%i0+56], %g2
	add	%g2, %l5, %l5
	ldx	[%fp+2023], %g2
	add	%l5, %g2, %l5
	ldx	[%i0+192], %g2
	stx	%g1, [%i0]
	stx	%i3, [%i0+8]
	xor	%g2, %g1, %g1
	stx	%g5, [%i0+16]
	stx	%g4, [%i0+24]
	stx	%g3, [%i0+32]
	stx	%i2, [%i0+40]
	srl	%l6, 0, %l6
	sllx	%o5, 32, %o5
	sllx	%o7, 32, %o7
	and	%o5, %i5, %o5
	and	%o7, %i5, %o7
	or	%o5, %l6, %o5
	srl	%l5, 0, %l5
	stx	%o5, [%i0+48]
	or	%o7, %l5, %l5
	stx	%l5, [%i0+56]
	ldx	[%i0+200], %g2
	xor	%g2, %i3, %i3
	ldx	[%i0+208], %g2
	xor	%g2, %g5, %g5
	ldx	[%i0+216], %g2
	xor	%g2, %g4, %g4
	ldx	[%i0+224], %g2
	stx	%g1, [%fp+2039]
	xor	%g2, %g3, %g3
	xor	%l4, %o5, %o5
	ldx	[%i0+232], %g2
	stx	%g1, [%i0+192]
	xor	%g2, %i2, %i2
	stx	%g5, [%i0+208]
	stx	%g4, [%i0+216]
	stx	%g3, [%i0+224]
	stx	%o5, [%i0+240]
	xor	%l3, %l5, %l3
	stx	%i3, [%i0+200]
	stx	%i2, [%i0+232]
	stx	%l3, [%i0+248]
	ldd	[%fp+2039], %f0
	stx	%i3, [%fp+2039]
	call	rot8, 0
	 ldd	[%fp+2039], %f2
	std	%f0, [%i0+192]
	std	%f2, [%i0+200]
	ldd	[%i0+208], %f0
	call	rot8, 0
	 ldd	[%i0+216], %f2
	std	%f0, [%i0+208]
	std	%f2, [%i0+216]
	ldd	[%i0+224], %f0
	call	rot8, 0
	 ldd	[%i0+232], %f2
	std	%f0, [%i0+224]
	std	%f2, [%i0+232]
	ldd	[%i0+240], %f0
	call	rot8, 0
	 ldd	[%i0+248], %f2
	std	%f0, [%fp+2039]
	ldx	[%i0+192], %g3
	srax	%g3, 32, %g3
	ldx	[%i0+128], %g2
	srax	%g2, 32, %o7
	add	%o7, %g3, %o7
	ldx	[%i0+192], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	sllx	%o7, 32, %o7
	and	%o7, %i5, %o7
	or	%o7, %g2, %o7
	ldx	[%i0+200], %g2
	srax	%g2, 32, %g2
	ldx	[%i0+136], %g1
	ldx	[%i0+208], %g3
	srax	%g1, 32, %i2
	srax	%g3, 32, %g3
	add	%i2, %g2, %i2
	ldx	[%i0+200], %g2
	add	%g1, %g2, %g1
	ldx	[%i0+144], %g2
	srax	%g2, 32, %i3
	add	%i3, %g3, %i3
	ldx	[%i0+208], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	srl	%g1, 0, %g1
	sllx	%i3, 32, %i3
	and	%i3, %i5, %i3
	or	%i3, %g2, %i3
	ldx	[%i0+216], %g2
	srax	%g2, 32, %g2
	ldx	[%i0+224], %g3
	sllx	%i2, 32, %i2
	srax	%g3, 32, %g3
	and	%i2, %i5, %i2
	or	%i2, %g1, %i2
	ldx	[%i0+152], %g1
	srax	%g1, 32, %g5
	add	%g5, %g2, %g5
	ldx	[%i0+216], %g2
	add	%g1, %g2, %g1
	ldx	[%i0+160], %g2
	srax	%g2, 32, %g4
	add	%g4, %g3, %g4
	ldx	[%i0+224], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	srl	%g1, 0, %g1
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %g2, %g4
	ldx	[%i0+232], %g2
	srax	%g2, 32, %g2
	sllx	%g5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %g1, %g5
	ldx	[%i0+168], %g1
	srax	%g1, 32, %g3
	add	%g3, %g2, %g3
	ldx	[%i0+232], %g2
	add	%g1, %g2, %g1
	srl	%g1, 0, %g1
	ldx	[%fp+2039], %l6
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g1, %g3
	ldx	[%i0+176], %g1
	srax	%g1, 32, %g2
	add	%g1, %l6, %g1
	srl	%g1, 0, %g1
	std	%f2, [%fp+2039]
	ldx	[%i0+184], %o5
	ldx	[%fp+2039], %l3
	srax	%l6, 32, %o4
	stx	%l6, [%i0+240]
	stx	%l3, [%i0+248]
	stx	%o7, [%i0+128]
	stx	%i2, [%i0+136]
	stx	%i3, [%i0+144]
	stx	%g5, [%i0+152]
	stx	%g4, [%i0+160]
	stx	%g3, [%i0+168]
	add	%g2, %o4, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g1, %g2
	srax	%o5, 32, %g1
	add	%o5, %l3, %o5
	srl	%o5, 0, %o5
	stx	%g2, [%i0+176]
	srax	%l3, 32, %o4
	add	%g1, %o4, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %o5, %g1
	ldx	[%i0+64], %o5
	xor	%o5, %o7, %o7
	ldx	[%i0+112], %o5
	ldx	[%i0+72], %o4
	xor	%o5, %g2, %g2
	ldx	[%i0+104], %o3
	srl	%o7, 7, %o5
	xor	%o4, %i2, %i2
	xor	%o3, %g3, %g3
	ldx	[%i0+120], %o4
	srlx	%o7, 7, %o3
	srax	%o7, 32, %o2
	and	%o3, %i5, %o3
	sll	%o7, 25, %o7
	or	%o3, %o5, %o3
	srl	%o7, 0, %o7
	srl	%i2, 7, %o5
	stx	%g1, [%i0+184]
	sllx	%o2, 57, %o2
	xor	%o4, %g1, %g1
	srlx	%i2, 7, %o4
	and	%o4, %i5, %o4
	or	%o4, %o5, %o4
	and	%o2, %i5, %o5
	or	%o5, %o7, %o5
	srax	%i2, 32, %o7
	sll	%i2, 25, %i2
	sllx	%o7, 57, %o7
	srl	%i2, 0, %i2
	and	%o7, %i5, %o7
	or	%o7, %i2, %i2
	ldx	[%i0+80], %l2
	xor	%o4, %i2, %l7
	xor	%l2, %i3, %i3
	xor	%o3, %o5, %o7
	srl	%i3, 7, %i2
	stx	%o7, [%i0+64]
	ldx	[%i0+88], %l0
	stx	%o7, [%fp+2039]
	xor	%l0, %g5, %g5
	srlx	%i3, 7, %o7
	and	%o7, %i5, %l2
	or	%l2, %i2, %l2
	srl	%g5, 7, %i2
	srlx	%g5, 7, %l0
	srax	%i3, 32, %o5
	and	%l0, %i5, %l0
	sll	%i3, 25, %i3
	or	%l0, %i2, %o7
	srl	%i3, 0, %i2
	sllx	%o5, 57, %o5
	and	%o5, %i5, %i3
	or	%i3, %i2, %i3
	srax	%g5, 32, %i2
	sll	%g5, 25, %g5
	sllx	%i2, 57, %i2
	srl	%g5, 0, %g5
	and	%i2, %i5, %l0
	or	%l0, %g5, %g5
	ldx	[%i0+96], %o1
	xor	%o7, %g5, %l0
	xor	%o1, %g4, %g4
	srl	%g4, 7, %g5
	xor	%l2, %i3, %l2
	srlx	%g4, 7, %i3
	and	%i3, %i5, %o1
	or	%o1, %g5, %o1
	srl	%g3, 7, %g5
	srlx	%g3, 7, %o3
	srax	%g4, 32, %i2
	and	%o3, %i5, %o3
	sll	%g4, 25, %g4
	or	%o3, %g5, %i3
	srl	%g4, 0, %g5
	sllx	%i2, 57, %i2
	and	%i2, %i5, %g4
	or	%g4, %g5, %g4
	srax	%g3, 32, %g5
	sll	%g3, 25, %g3
	sllx	%g5, 57, %g5
	srl	%g3, 0, %g3
	and	%g5, %i5, %o3
	or	%o3, %g3, %g3
	xor	%i3, %g3, %o3
	srl	%g2, 7, %g3
	xor	%o1, %g4, %o1
	srax	%g2, 32, %g5
	srlx	%g2, 7, %g4
	sll	%g2, 25, %g2
	and	%g4, %i5, %o5
	or	%o5, %g3, %o5
	srl	%g1, 7, %g3
	srlx	%g1, 7, %g4
	sllx	%g5, 57, %g5
	and	%g4, %i5, %g4
	or	%g4, %g3, %g4
	srl	%g2, 0, %g3
	and	%g5, %i5, %g2
	or	%g2, %g3, %g2
	srax	%g1, 32, %g3
	xor	%o5, %g2, %o5
	sllx	%g3, 57, %g3
	ldub	[%i4+8], %g2
	and	%g3, %i5, %g3
	sllx	%g2, 4, %g2
	sll	%g1, 25, %g1
	srl	%g1, 0, %g1
	or	%g3, %g1, %g1
	xor	%g4, %g1, %g1
	stx	%o1, [%i0+96]
	stx	%o3, [%i0+104]
	stx	%l7, [%i0+72]
	stx	%l2, [%i0+80]
	stx	%l0, [%i0+88]
	stx	%o5, [%i0+112]
	stx	%g1, [%i0+120]
	stx	%g1, [%fp+2031]
	ldx	[%i1+%g2], %g3
	add	%i1, %g2, %g1
	ldx	[%g1+8], %g2
	ldx	[%i0], %l1
	ldx	[%i0+8], %o0
	srax	%l1, 32, %g4
	srax	%g3, 32, %g1
	add	%l1, %g3, %l1
	srax	%o0, 32, %i3
	srax	%g2, 32, %g3
	add	%o0, %g2, %o0
	srl	%l1, 0, %g2
	add	%g4, %g1, %g1
	add	%i3, %g3, %i3
	srl	%o0, 0, %g4
	sllx	%g1, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g2, %g3
	sllx	%i3, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g4, %g2
	stx	%g3, [%i0]
	stx	%g2, [%i0+8]
	ldub	[%i4+10], %g3
	sllx	%g3, 4, %g3
	add	%i1, %g3, %g2
	ldx	[%i1+%g3], %g3
	ldx	[%g2+8], %g2
	srax	%g3, 32, %g4
	ldx	[%i0+16], %o2
	ldx	[%i0+24], %o4
	srax	%o2, 32, %g5
	add	%o2, %g3, %o2
	add	%g5, %g4, %g5
	srax	%g2, 32, %g3
	srax	%o4, 32, %g4
	add	%o4, %g2, %o4
	srl	%o2, 0, %g2
	add	%g4, %g3, %g4
	srl	%o4, 0, %i2
	sllx	%g5, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g2, %g3
	sllx	%g4, 32, %g2
	stx	%g3, [%i0+16]
	and	%g2, %i5, %g2
	or	%g2, %i2, %g2
	stx	%g2, [%i0+24]
	ldx	[%i0+32], %o7
	ldub	[%i4+12], %g2
	srax	%o7, 32, %l5
	sllx	%g2, 4, %g2
	add	%i1, %g2, %g3
	ldx	[%i0+40], %l4
	ldx	[%i1+%g2], %g2
	ldx	[%g3+8], %i2
	srax	%g2, 32, %g3
	add	%l5, %g3, %g3
	srax	%l4, 32, %l5
	add	%o7, %g2, %o7
	srax	%i2, 32, %g2
	add	%l5, %g2, %g2
	sllx	%g3, 32, %l5
	and	%l5, %i5, %l5
	add	%l4, %i2, %i2
	srl	%o7, 0, %l4
	or	%l5, %l4, %l4
	srl	%i2, 0, %l5
	add	%o2, %o1, %o2
	add	%o4, %o3, %o4
	stx	%l4, [%fp+2023]
	add	%l1, %l2, %l1
	sllx	%g2, 32, %l4
	srl	%l1, 0, %l1
	and	%l4, %i5, %l4
	add	%o0, %l0, %o0
	or	%l4, %l5, %l4
	srl	%o0, 0, %o0
	ldx	[%fp+2023], %l5
	srl	%o2, 0, %o2
	srl	%o4, 0, %o4
	add	%o7, %o5, %o7
	srl	%o7, 0, %o7
	stx	%l5, [%i0+32]
	srax	%l2, 32, %l5
	add	%g1, %l5, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %l1, %g1
	srax	%l0, 32, %l1
	add	%i3, %l1, %i3
	sllx	%i3, 32, %i3
	and	%i3, %i5, %i3
	or	%i3, %o0, %i3
	srax	%o1, 32, %o0
	add	%g5, %o0, %g5
	sllx	%g5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %o2, %g5
	srax	%o3, 32, %o2
	add	%g4, %o2, %g4
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %o4, %g4
	srax	%o5, 32, %o4
	add	%g3, %o4, %g3
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %o7, %g3
	ldx	[%fp+2031], %o7
	srax	%o7, 32, %o7
	add	%g2, %o7, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	ldx	[%fp+2031], %o7
	add	%i2, %o7, %i2
	srl	%i2, 0, %i2
	or	%g2, %i2, %i2
	ldx	[%i0+48], %g2
	srax	%g2, 32, %g2
	stx	%l4, [%i0+40]
	ldub	[%i4+14], %l4
	sllx	%l4, 4, %l4
	add	%i1, %l4, %i4
	ldx	[%i1+%l4], %l4
	srax	%l4, 32, %o5
	add	%g2, %o5, %o5
	ldx	[%fp+2039], %g2
	srax	%g2, 32, %g2
	add	%o5, %g2, %o5
	ldx	[%i0+48], %g2
	sllx	%o5, 32, %o5
	add	%g2, %l4, %l4
	ldx	[%fp+2039], %g2
	ldx	[%i4+8], %i4
	add	%l4, %g2, %l4
	and	%o5, %i5, %g2
	srax	%i4, 32, %o5
	ldx	[%i0+56], %o7
	srax	%o7, 32, %o7
	add	%o7, %o5, %o7
	srax	%l7, 32, %o5
	add	%o7, %o5, %o7
	sllx	%o7, 32, %o7
	and	%o7, %i5, %o7
	ldx	[%i0+56], %o5
	add	%o5, %i4, %i4
	add	%i4, %l7, %i4
	srl	%i4, 0, %i4
	or	%o7, %i4, %i4
	ldx	[%i0+192], %o7
	stx	%g1, [%i0]
	stx	%i3, [%i0+8]
	xor	%l6, %g1, %g1
	xor	%l3, %i3, %i3
	stx	%g1, [%i0+240]
	stx	%g5, [%i0+16]
	stx	%g4, [%i0+24]
	xor	%o7, %g5, %g5
	stx	%g3, [%i0+32]
	ldx	[%i0+200], %o7
	stx	%i2, [%i0+40]
	xor	%o7, %g4, %g4
	srl	%l4, 0, %l4
	stx	%i4, [%i0+56]
	or	%g2, %l4, %g2
	stx	%i3, [%i0+248]
	stx	%g2, [%i0+48]
	sethi	%gdop_hix22(MSG_SCHEDULE), %l7
	stx	%g5, [%i0+192]
	stx	%g4, [%i0+200]
	ldx	[%i0+208], %g4
	xor	%g4, %g3, %g3
	stx	%g3, [%i0+208]
	ldx	[%i0+224], %g3
	stx	%g1, [%fp+2039]
	ldx	[%i0+216], %g4
	xor	%g3, %g2, %g2
	ldx	[%i0+232], %g3
	xor	%g4, %i2, %i2
	xor	%g3, %i4, %i4
	stx	%g2, [%i0+224]
	stx	%i2, [%i0+216]
	stx	%i4, [%i0+232]
	ldd	[%fp+2039], %f0
	stx	%i3, [%fp+2039]
	call	rot16, 0
	 ldd	[%fp+2039], %f2
	std	%f0, [%i0+240]
	std	%f2, [%i0+248]
	ldd	[%i0+192], %f0
	call	rot16, 0
	 ldd	[%i0+200], %f2
	std	%f0, [%i0+192]
	std	%f2, [%i0+200]
	ldd	[%i0+208], %f0
	call	rot16, 0
	 ldd	[%i0+216], %f2
	std	%f0, [%i0+208]
	std	%f2, [%i0+216]
	ldd	[%i0+224], %f0
	call	rot16, 0
	 ldd	[%i0+232], %f2
	ldx	[%i0+240], %g3
	srax	%g3, 32, %g3
	ldx	[%i0+160], %g2
	srax	%g2, 32, %i3
	add	%i3, %g3, %i3
	ldx	[%i0+240], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	sllx	%i3, 32, %i3
	and	%i3, %i5, %i3
	or	%i3, %g2, %i3
	ldx	[%i0+248], %g2
	srax	%g2, 32, %g2
	ldx	[%i0+168], %g1
	ldx	[%i0+192], %g3
	srax	%g1, 32, %i4
	srax	%g3, 32, %g3
	add	%i4, %g2, %i4
	ldx	[%i0+248], %g2
	add	%g1, %g2, %g1
	ldx	[%i0+176], %g2
	srax	%g2, 32, %i2
	add	%i2, %g3, %i2
	ldx	[%i0+192], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	srl	%g1, 0, %g1
	sllx	%i2, 32, %i2
	and	%i2, %i5, %i2
	or	%i2, %g2, %i2
	ldx	[%i0+200], %g2
	srax	%g2, 32, %g2
	ldx	[%i0+208], %g3
	sllx	%i4, 32, %i4
	srax	%g3, 32, %g3
	and	%i4, %i5, %i4
	or	%i4, %g1, %i4
	ldx	[%i0+184], %g1
	srax	%g1, 32, %g5
	add	%g5, %g2, %g5
	ldx	[%i0+200], %g2
	add	%g1, %g2, %g1
	ldx	[%i0+128], %g2
	srax	%g2, 32, %g4
	add	%g4, %g3, %g4
	ldx	[%i0+208], %g3
	add	%g2, %g3, %g2
	srl	%g2, 0, %g2
	srl	%g1, 0, %g1
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %g2, %g4
	ldx	[%i0+216], %g2
	srax	%g2, 32, %g2
	sllx	%g5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %g1, %g5
	ldx	[%i0+136], %g1
	srax	%g1, 32, %g3
	add	%g3, %g2, %g3
	ldx	[%i0+216], %g2
	add	%g1, %g2, %g1
	srl	%g1, 0, %g1
	std	%f0, [%fp+2039]
	sllx	%g3, 32, %g3
	ldx	[%fp+2039], %l3
	and	%g3, %i5, %g3
	or	%g3, %g1, %g3
	ldx	[%i0+144], %g1
	srax	%g1, 32, %g2
	add	%g1, %l3, %g1
	srl	%g1, 0, %g1
	std	%f2, [%fp+2039]
	ldx	[%i0+152], %o7
	ldx	[%fp+2039], %l2
	stx	%i3, [%i0+160]
	stx	%i4, [%i0+168]
	stx	%i2, [%i0+176]
	stx	%g5, [%i0+184]
	stx	%g4, [%i0+128]
	stx	%g3, [%i0+136]
	srax	%l3, 32, %o5
	stx	%l3, [%i0+224]
	add	%g2, %o5, %g2
	stx	%l2, [%i0+232]
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g1, %g2
	srax	%o7, 32, %g1
	add	%o7, %l2, %o7
	srl	%o7, 0, %o7
	stx	%g2, [%i0+144]
	srax	%l2, 32, %o5
	add	%g1, %o5, %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %o7, %g1
	ldx	[%i0+120], %o7
	xor	%o7, %g3, %g3
	ldx	[%i0+72], %o7
	stx	%g1, [%i0+152]
	ldx	[%i0+80], %l1
	xor	%o7, %g1, %g1
	xor	%l1, %i3, %i3
	ldx	[%i0+64], %o5
	srl	%i3, 12, %o7
	xor	%o5, %g2, %g2
	ldx	[%i0+88], %o0
	srlx	%i3, 12, %o5
	xor	%o0, %i4, %i4
	and	%o5, %i5, %l1
	or	%l1, %o7, %l1
	srl	%i4, 12, %o7
	srlx	%i4, 12, %o5
	and	%o5, %i5, %o0
	or	%o0, %o7, %o0
	srax	%i3, 32, %o7
	sllx	%o7, 52, %o7
	and	%o7, %i5, %o7
	sll	%i3, 20, %i3
	srl	%i3, 0, %i3
	or	%o7, %i3, %i3
	srax	%i4, 32, %o7
	sll	%i4, 20, %i4
	sllx	%o7, 52, %o7
	srl	%i4, 0, %i4
	and	%o7, %i5, %o7
	or	%o7, %i4, %i4
	ldx	[%i0+96], %o2
	xor	%o0, %i4, %o0
	xor	%o2, %i2, %i2
	srl	%i2, 12, %i4
	ldx	[%i0+104], %o3
	xor	%l1, %i3, %l1
	xor	%o3, %g5, %g5
	srlx	%i2, 12, %i3
	and	%i3, %i5, %o2
	or	%o2, %i4, %o2
	srl	%g5, 12, %i4
	srlx	%g5, 12, %i3
	and	%i3, %i5, %o3
	or	%o3, %i4, %o3
	srax	%i2, 32, %i4
	sllx	%i4, 52, %i4
	and	%i4, %i5, %i4
	sll	%i2, 20, %i2
	srl	%i2, 0, %i2
	or	%i4, %i2, %i2
	srax	%g5, 32, %i4
	sll	%g5, 20, %g5
	sllx	%i4, 52, %i4
	srl	%g5, 0, %g5
	and	%i4, %i5, %i4
	or	%i4, %g5, %g5
	ldx	[%i0+112], %o4
	xor	%o3, %g5, %o3
	xor	%o4, %g4, %g4
	srl	%g4, 12, %g5
	srlx	%g4, 12, %i4
	and	%i4, %i5, %o4
	or	%o4, %g5, %o4
	srl	%g3, 12, %g5
	srlx	%g3, 12, %i4
	and	%i4, %i5, %o7
	or	%o7, %g5, %o7
	srax	%g4, 32, %g5
	sllx	%g5, 52, %g5
	and	%g5, %i5, %g5
	sll	%g4, 20, %g4
	srl	%g4, 0, %g4
	or	%g5, %g4, %g4
	srax	%g3, 32, %g5
	sllx	%g5, 52, %g5
	and	%g5, %i5, %i5
	srlx	%g2, 12, %i3
	sll	%g3, 20, %g3
	srl	%g3, 0, %g3
	or	%i5, %g3, %g3
	mov	-1, %i5
	sllx	%i5, 32, %i5
	and	%i3, %i5, %i3
	xor	%o4, %g4, %o4
	xor	%o7, %g3, %o7
	srl	%g2, 12, %g3
	or	%i3, %g3, %g4
	srax	%g2, 32, %i3
	sll	%g2, 20, %g2
	sllx	%i3, 52, %i3
	srl	%g2, 0, %g2
	and	%i3, %i5, %i3
	or	%i3, %g2, %g2
	xor	%g2, %g4, %i3
	ldx	[%fp+2015], %g2
	srlx	%g1, 12, %i4
	xor	%l7, %gdop_lox10(MSG_SCHEDULE), %l7
	and	%i4, %i5, %i4
	ldx	[%g2 + %l7], %l7, %gdop(MSG_SCHEDULE)
	ldx	[%fp+2007], %g2
	xor	%o2, %i2, %o2
	srl	%g1, 12, %g5
	sllx	%g2, 4, %i2
	or	%i4, %g5, %g3
	add	%l7, %i2, %l7
	srax	%g1, 32, %i4
	ldub	[%l7+9], %g2
	sllx	%i4, 52, %i4
	sllx	%g2, 4, %g2
	and	%i4, %i5, %i4
	sll	%g1, 20, %g1
	srl	%g1, 0, %g1
	or	%i4, %g1, %g1
	stx	%o0, [%i0+88]
	stx	%o2, [%i0+96]
	stx	%o3, [%i0+104]
	stx	%o4, [%i0+112]
	stx	%o7, [%i0+120]
	stx	%i3, [%i0+64]
	stx	%l1, [%i0+80]
	xor	%g1, %g3, %i4
	add	%i1, %g2, %g4
	stx	%i4, [%i0+72]
	ldx	[%i0], %g3
	ldx	[%i1+%g2], %l0
	ldx	[%i0+8], %g1
	srax	%g3, 32, %g2
	ldx	[%g4+8], %o1
	srax	%l0, 32, %g5
	srax	%o1, 32, %g4
	add	%g5, %g2, %g5
	add	%l0, %g3, %l0
	srax	%g1, 32, %g2
	add	%o1, %g1, %o1
	srl	%l0, 0, %g1
	srl	%o1, 0, %g3
	add	%g4, %g2, %g4
	sllx	%g5, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g1, %g2
	sllx	%g4, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g3, %g1
	ldub	[%l7+11], %g3
	sllx	%g3, 4, %g3
	stx	%g2, [%i0]
	stx	%g1, [%i0+8]
	ldx	[%i0+16], %i2
	ldx	[%i1+%g3], %o5
	add	%i1, %g3, %g2
	srax	%i2, 32, %g3
	add	%o5, %i2, %i2
	ldx	[%g2+8], %g2
	ldx	[%i0+24], %g1
	st	%i2, [%fp+2039]
	srax	%g1, 32, %i2
	add	%g2, %g1, %g1
	srax	%o5, 32, %l4
	srax	%g2, 32, %o5
	add	%o5, %i2, %i2
	st	%i2, [%fp+2035]
	st	%g1, [%fp+2023]
	lduw	[%fp+2039], %g1
	add	%l4, %g3, %g3
	lduw	[%fp+2023], %i2
	sllx	%g3, 32, %g2
	and	%g2, %i5, %g2
	or	%g2, %g1, %g2
	ldx	[%fp+2031], %g1
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %i2, %g1
	stx	%g2, [%i0+16]
	stx	%g1, [%i0+24]
	ldub	[%l7+13], %o5
	ldx	[%i0+32], %g1
	sllx	%o5, 4, %o5
	add	%i1, %o5, %g2
	ldx	[%i1+%o5], %o5
	ldx	[%g2+8], %l4
	srax	%o5, 32, %l5
	ldx	[%i0+40], %i2
	add	%o5, %g1, %o5
	srax	%g1, 32, %g2
	srax	%i2, 32, %g1
	add	%l5, %g2, %g2
	add	%l4, %i2, %i2
	srax	%l4, 32, %l5
	srl	%o5, 0, %l4
	add	%l5, %g1, %g1
	srl	%i2, 0, %l6
	sllx	%g2, 32, %l5
	and	%l5, %i5, %l5
	or	%l5, %l4, %l5
	sllx	%g1, 32, %l4
	and	%l4, %i5, %l4
	or	%l4, %l6, %l4
	stx	%l5, [%i0+32]
	stx	%l4, [%i0+40]
	add	%o1, %o0, %o1
	ldub	[%l7+15], %l4
	srl	%o1, 0, %o1
	sllx	%l4, 4, %l4
	add	%l0, %l1, %l0
	add	%i1, %l4, %l5
	srl	%l0, 0, %l0
	ldx	[%i1+%l4], %l4
	ldx	[%l5+8], %i1
	srax	%l1, 32, %l5
	add	%g5, %l5, %g5
	sllx	%g5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %l0, %g5
	srax	%o0, 32, %l0
	add	%g4, %l0, %g4
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %o1, %g4
	srax	%o2, 32, %o1
	add	%g3, %o1, %g3
	lduw	[%fp+2039], %o1
	add	%o1, %o2, %o2
	lduw	[%fp+2035], %o1
	srl	%o2, 0, %o2
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %o2, %g3
	srax	%o3, 32, %o2
	add	%o1, %o2, %o2
	lduw	[%fp+2023], %o1
	add	%o1, %o3, %o3
	srl	%o3, 0, %o3
	add	%o5, %o4, %o5
	sllx	%o2, 32, %o2
	and	%o2, %i5, %o2
	or	%o2, %o3, %o2
	srax	%o4, 32, %o3
	add	%g2, %o3, %g2
	sllx	%g2, 32, %g2
	and	%g2, %i5, %g2
	srl	%o5, 0, %o4
	or	%g2, %o4, %o5
	srax	%o7, 32, %g2
	add	%i2, %o7, %i2
	add	%g1, %g2, %g1
	ldx	[%i0+48], %g2
	sllx	%g1, 32, %g1
	srax	%g2, 32, %g2
	srl	%i2, 0, %o7
	and	%g1, %i5, %i2
	srax	%l4, 32, %g1
	add	%g1, %g2, %g1
	srax	%i3, 32, %g2
	add	%g1, %g2, %g1
	ldx	[%i0+48], %g2
	sllx	%g1, 32, %g1
	add	%l4, %g2, %l4
	add	%l4, %i3, %i3
	ldx	[%i0+56], %l6
	srl	%i3, 0, %l4
	and	%g1, %i5, %i3
	srax	%l6, 32, %g1
	srax	%i1, 32, %g2
	add	%g2, %g1, %g2
	srax	%i4, 32, %g1
	add	%i1, %l6, %i1
	add	%g2, %g1, %g2
	add	%i1, %i4, %i4
	ldx	[%i0+240], %g1
	or	%i2, %o7, %i2
	sllx	%g2, 32, %g2
	srl	%i4, 0, %i1
	stx	%g5, [%i0]
	and	%g2, %i5, %i4
	xor	%g1, %g5, %g5
	or	%i4, %i1, %i4
	ldx	[%i0+248], %g1
	stx	%g4, [%i0+8]
	stx	%g3, [%i0+16]
	stx	%o2, [%i0+24]
	stx	%o5, [%i0+32]
	stx	%i2, [%i0+40]
	or	%i3, %l4, %i3
	stx	%i4, [%i0+56]
	stx	%i3, [%i0+48]
	xor	%g1, %g4, %g4
	stx	%g5, [%i0+240]
	ldx	[%i0+192], %g1
	xor	%g1, %g3, %g3
	ldx	[%i0+200], %g1
	xor	%g1, %o2, %o2
	ldx	[%i0+208], %g1
	stx	%g5, [%fp+2039]
	xor	%g1, %o5, %o5
	ldx	[%i0+216], %g1
	stx	%g4, [%i0+248]
	xor	%g1, %i2, %i2
	stx	%g3, [%i0+192]
	stx	%o2, [%i0+200]
	stx	%o5, [%i0+208]
	stx	%i2, [%i0+216]
	xor	%l3, %i3, %i3
	xor	%l2, %i4, %i4
	stx	%i3, [%i0+224]
	stx	%i4, [%i0+232]
	ldd	[%fp+2039], %f0
	stx	%g4, [%fp+2039]
	call	rot8, 0
	 ldd	[%fp+2039], %f2
	std	%f0, [%i0+240]
	std	%f2, [%i0+248]
	ldd	[%i0+192], %f0
	call	rot8, 0
	 ldd	[%i0+200], %f2
	std	%f0, [%i0+192]
	std	%f2, [%i0+200]
	ldd	[%i0+208], %f0
	call	rot8, 0
	 ldd	[%i0+216], %f2
	std	%f0, [%i0+208]
	std	%f2, [%i0+216]
	ldd	[%i0+224], %f0
	call	rot8, 0
	 ldd	[%i0+232], %f2
	ldx	[%i0+160], %g3
	ldx	[%i0+168], %g1
	ldx	[%i0+240], %i2
	srax	%g3, 32, %g4
	srax	%i2, 32, %i1
	add	%i2, %g3, %i2
	srax	%g1, 32, %g3
	ldx	[%i0+248], %i3
	srax	%i3, 32, %o4
	add	%o4, %g3, %o4
	ldx	[%i0+176], %g3
	ldx	[%i0+192], %i4
	add	%i1, %g4, %i1
	add	%i3, %g1, %i3
	srax	%g3, 32, %g4
	ldx	[%i0+184], %g1
	srax	%i4, 32, %o5
	sllx	%i1, 32, %i1
	add	%i4, %g3, %i4
	and	%i1, %i5, %i1
	srax	%g1, 32, %g3
	ldx	[%i0+200], %g5
	add	%o5, %g4, %o5
	srax	%g5, 32, %o7
	srl	%i2, 0, %i2
	add	%o7, %g3, %o7
	or	%i1, %i2, %i2
	ldx	[%i0+128], %g3
	ldx	[%i0+208], %i1
	sllx	%o5, 32, %o5
	srax	%i1, 32, %g4
	and	%o5, %i5, %o5
	add	%i1, %g3, %i1
	sllx	%o7, 32, %o7
	srl	%i1, 0, %i1
	and	%o7, %i5, %o7
	add	%g5, %g1, %g5
	srl	%i4, 0, %i4
	ldx	[%i0+216], %g1
	or	%o5, %i4, %i4
	srl	%g5, 0, %g5
	srax	%g3, 32, %o5
	or	%o7, %g5, %g5
	add	%g4, %o5, %g4
	ldx	[%i0+136], %o7
	srax	%g1, 32, %g3
	sllx	%g4, 32, %g4
	add	%g1, %o7, %g1
	and	%g4, %i5, %g4
	srl	%g1, 0, %g1
	or	%g4, %i1, %g4
	srax	%o7, 32, %i1
	ldx	[%i0+144], %o2
	std	%f0, [%fp+2039]
	add	%g3, %i1, %g3
	ldx	[%fp+2039], %g2
	ldx	[%i0+152], %i1
	stx	%g2, [%i0+224]
	srax	%i1, 32, %o7
	srax	%g2, 32, %o1
	sllx	%o4, 32, %o4
	add	%g2, %o2, %g2
	and	%o4, %i5, %o4
	sllx	%g3, 32, %g3
	and	%g3, %i5, %g3
	or	%g3, %g1, %g3
	srax	%o2, 32, %g1
	std	%f2, [%fp+2039]
	stx	%i2, [%i0+160]
	ldx	[%fp+2039], %o3
	stx	%g5, [%i0+184]
	stx	%o3, [%i0+232]
	stx	%g4, [%i0+128]
	stx	%g3, [%i0+136]
	add	%o1, %g1, %o1
	srl	%g2, 0, %o2
	srax	%o3, 32, %g1
	ldx	[%i0+96], %o5
	add	%g1, %o7, %g1
	xor	%o5, %i4, %o5
	add	%o3, %i1, %o3
	ldx	[%i0+104], %o7
	ldx	[%i0+80], %i1
	xor	%o7, %g5, %o7
	srl	%i3, 0, %i3
	stx	%i4, [%i0+176]
	or	%o4, %i3, %i3
	sllx	%o1, 32, %o1
	stx	%i3, [%i0+168]
	and	%o1, %i5, %g2
	ldx	[%i0+88], %o4
	or	%g2, %o2, %g2
	sllx	%g1, 32, %g1
	stx	%g2, [%i0+144]
	and	%g1, %i5, %g1
	srl	%o3, 0, %o3
	or	%g1, %o3, %g1
	stx	%g1, [%i0+152]
	ldx	[%i0+112], %i4
	ldx	[%i0+120], %g5
	xor	%g5, %g3, %g3
	ldx	[%i0+72], %g5
	xor	%i4, %g4, %g4
	xor	%g5, %g1, %g1
	xor	%i1, %i2, %i1
	ldx	[%i0+64], %i4
	srl	%i1, 7, %g5
	xor	%i4, %g2, %g2
	xor	%o4, %i3, %o4
	srlx	%i1, 7, %i2
	srlx	%o4, 7, %i3
	and	%i2, %i5, %i2
	and	%i3, %i5, %i3
	or	%i2, %g5, %i4
	srl	%o4, 7, %g5
	or	%i3, %g5, %g5
	srax	%o4, 32, %i3
	sll	%o4, 25, %o4
	sllx	%i3, 57, %i3
	srl	%o4, 0, %o4
	and	%i3, %i5, %i3
	or	%i3, %o4, %i3
	xor	%i3, %g5, %i3
	srlx	%o7, 7, %g5
	and	%g5, %i5, %g5
	srax	%i1, 32, %i2
	stx	%i3, [%i0+88]
	sllx	%i2, 57, %i2
	srl	%o7, 7, %i3
	and	%i2, %i5, %i2
	or	%g5, %i3, %i3
	sll	%i1, 25, %i1
	srax	%o7, 32, %g5
	srl	%i1, 0, %i1
	sllx	%g5, 57, %g5
	or	%i2, %i1, %i2
	and	%g5, %i5, %g5
	xor	%i2, %i4, %i2
	sll	%o7, 25, %o7
	srl	%o7, 0, %o7
	or	%g5, %o7, %g5
	xor	%g5, %i3, %g5
	srlx	%o5, 7, %i4
	stx	%i2, [%i0+80]
	and	%i4, %i5, %i4
	srl	%o5, 7, %i2
	stx	%g5, [%i0+104]
	or	%i4, %i2, %i2
	srl	%g4, 7, %g5
	srax	%o5, 32, %i4
	sll	%o5, 25, %o5
	sllx	%i4, 57, %i4
	srl	%o5, 0, %o5
	and	%i4, %i5, %i4
	or	%i4, %o5, %i4
	xor	%i4, %i2, %i4
	srlx	%g4, 7, %i2
	and	%i2, %i5, %i2
	or	%i2, %g5, %i2
	srl	%g3, 7, %g5
	srlx	%g3, 7, %i3
	and	%i3, %i5, %i3
	or	%i3, %g5, %i3
	srax	%g4, 32, %g5
	sll	%g4, 25, %g4
	sllx	%g5, 57, %g5
	stx	%i4, [%i0+96]
	srl	%g4, 0, %i4
	and	%g5, %i5, %g4
	srax	%g3, 32, %g5
	sll	%g3, 25, %g3
	or	%g4, %i4, %g4
	sllx	%g5, 57, %g5
	srl	%g3, 0, %i4
	and	%g5, %i5, %g3
	or	%g3, %i4, %g3
	xor	%g3, %i3, %g3
	stx	%g3, [%i0+120]
	srl	%g2, 7, %g3
	srlx	%g2, 7, %i4
	and	%i4, %i5, %i4
	or	%i4, %g3, %i4
	srl	%g1, 7, %g3
	xor	%g4, %i2, %g4
	srlx	%g1, 7, %g5
	and	%g5, %i5, %g5
	or	%g5, %g3, %g5
	srax	%g2, 32, %g3
	sll	%g2, 25, %g2
	sllx	%g3, 57, %g3
	stx	%g4, [%i0+112]
	srl	%g2, 0, %g4
	and	%g3, %i5, %g2
	srax	%g1, 32, %g3
	or	%g2, %g4, %g2
	sllx	%g3, 57, %g3
	sll	%g1, 25, %g1
	and	%g3, %i5, %i5
	srl	%g1, 0, %g1
	xor	%g2, %i4, %g2
	or	%i5, %g1, %i5
	stx	%g2, [%i0+64]
	xor	%i5, %g5, %i5
	stx	%i5, [%i0+72]
	return	%i7+8
	 nop
	.size	round_fn, .-round_fn
	.align 4
	.type	transpose_vecs, #function
	.proc	020
transpose_vecs:
	save	%sp, -176, %sp
	ldx	[%i0+16], %g3
	srlx	%g3, 32, %g5
	srl	%g3, 0, %g3
	ldx	[%i0], %g4
	ldx	[%i0+8], %g2
	ldx	[%i0+24], %i5
	ldx	[%i0+48], %i4
	mov	-1, %g1
	srlx	%i4, 32, %o7
	sllx	%g1, 32, %g1
	srl	%i4, 0, %i4
	and	%g4, %g1, %i3
	or	%i3, %g5, %i3
	sllx	%g4, 32, %g5
	and	%g5, %g1, %g5
	or	%g5, %g3, %g5
	srlx	%i5, 32, %g3
	srl	%i5, 0, %i5
	and	%g2, %g1, %i2
	ldx	[%i0+32], %g4
	or	%i2, %g3, %i2
	and	%g4, %g1, %i1
	sllx	%g2, 32, %g3
	or	%i1, %o7, %i1
	ldx	[%i0+40], %g2
	and	%g3, %g1, %g3
	sllx	%g4, 32, %g4
	or	%g3, %i5, %g3
	and	%g4, %g1, %g4
	ldx	[%i0+56], %i5
	or	%g4, %i4, %g4
	srlx	%i5, 32, %o7
	and	%g2, %g1, %i4
	srl	%i5, 0, %i5
	or	%i4, %o7, %i4
	sllx	%g2, 32, %g2
	stx	%i3, [%i0]
	and	%g2, %g1, %g1
	stx	%i1, [%i0+8]
	or	%g1, %i5, %g1
	stx	%g5, [%i0+16]
	stx	%g4, [%i0+24]
	stx	%i2, [%i0+32]
	stx	%i4, [%i0+40]
	stx	%g3, [%i0+48]
	stx	%g1, [%i0+56]
	return	%i7+8
	 nop
	.size	transpose_vecs, .-transpose_vecs
	.align 4
	.type	transpose_msg_vecs, #function
	.proc	020
transpose_msg_vecs:
	save	%sp, -176, %sp
	ldx	[%i0], %g5
	add	%g5, %i1, %g1
	ldub	[%g1+8], %g3
	ldub	[%g1+9], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+10], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+11], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+12], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+13], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+14], %g2
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+15], %g4
	ldub	[%g5+%i1], %g3
	or	%g4, %g2, %g4
	sllx	%g3, 56, %g3
	ldub	[%g1+1], %g2
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	or	%g1, %g2, %g2
	stx	%g4, [%i2+8]
	stx	%g2, [%i2]
	ldx	[%i0+8], %g5
	add	%g5, %i1, %g1
	ldub	[%g1+8], %g3
	ldub	[%g1+9], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+10], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+11], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+12], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+13], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+14], %g2
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+15], %g4
	ldub	[%g5+%i1], %g3
	or	%g4, %g2, %g4
	sllx	%g3, 56, %g3
	ldub	[%g1+1], %g2
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	or	%g1, %g2, %g2
	stx	%g4, [%i2+24]
	stx	%g2, [%i2+16]
	ldx	[%i0+16], %g5
	add	%g5, %i1, %g1
	ldub	[%g1+8], %g3
	ldub	[%g1+9], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+10], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+11], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+12], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+13], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+14], %g2
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+15], %g4
	ldub	[%g5+%i1], %g3
	or	%g4, %g2, %g4
	sllx	%g3, 56, %g3
	ldub	[%g1+1], %g2
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	or	%g1, %g2, %g2
	stx	%g4, [%i2+40]
	stx	%g2, [%i2+32]
	ldx	[%i0+24], %g5
	add	%g5, %i1, %g1
	ldub	[%g1+8], %g3
	ldub	[%g1+9], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+10], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+11], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+12], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+13], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+14], %g2
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+15], %g4
	ldub	[%g5+%i1], %g3
	or	%g4, %g2, %g4
	sllx	%g3, 56, %g3
	ldub	[%g1+1], %g2
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	or	%g1, %g2, %g2
	stx	%g4, [%i2+56]
	stx	%g2, [%i2+48]
	add	%i1, 16, %g2
	ldx	[%i0], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+72]
	stx	%g3, [%i2+64]
	ldx	[%i0+8], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+88]
	stx	%g3, [%i2+80]
	ldx	[%i0+16], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+104]
	stx	%g3, [%i2+96]
	ldx	[%i0+24], %g5
	add	%g5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g4
	or	%g4, %g3, %g4
	ldub	[%g5+%g2], %g3
	ldub	[%g1+1], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	or	%g1, %g2, %g2
	stx	%g4, [%i2+120]
	stx	%g2, [%i2+112]
	add	%i1, 32, %g2
	ldx	[%i0], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+136]
	stx	%g3, [%i2+128]
	ldx	[%i0+8], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+152]
	stx	%g3, [%i2+144]
	ldx	[%i0+16], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+168]
	stx	%g3, [%i2+160]
	ldx	[%i0+24], %g5
	add	%g5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g4
	or	%g4, %g3, %g4
	ldub	[%g5+%g2], %g3
	ldub	[%g1+1], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	or	%g2, %g3, %g2
	or	%g1, %g2, %g2
	stx	%g4, [%i2+184]
	stx	%g2, [%i2+176]
	add	%i1, 48, %g2
	ldx	[%i0], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+200]
	stx	%g3, [%i2+192]
	ldx	[%i0+8], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+216]
	stx	%g3, [%i2+208]
	ldx	[%i0+16], %i5
	add	%i5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g5
	ldub	[%i5+%g2], %g4
	or	%g5, %g3, %g5
	sllx	%g4, 56, %g4
	ldub	[%g1+1], %g3
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+2], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+3], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+4], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+5], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+6], %g3
	ldub	[%g1+7], %g1
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	or	%g1, %g3, %g3
	stx	%g5, [%i2+232]
	stx	%g3, [%i2+224]
	ldx	[%i0+24], %g5
	add	%g5, %g2, %g1
	ldub	[%g1+8], %g4
	ldub	[%g1+9], %g3
	sllx	%g4, 56, %g4
	sllx	%g3, 48, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+10], %g3
	sllx	%g3, 40, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+11], %g4
	sllx	%g4, 32, %g4
	or	%g4, %g3, %g3
	ldub	[%g1+12], %g4
	sllx	%g4, 24, %g4
	or	%g4, %g3, %g4
	ldub	[%g1+13], %g3
	sllx	%g3, 16, %g3
	or	%g3, %g4, %g4
	ldub	[%g1+14], %g3
	sllx	%g3, 8, %g3
	or	%g3, %g4, %g3
	ldub	[%g1+15], %g4
	or	%g4, %g3, %g4
	ldub	[%g5+%g2], %g3
	ldub	[%g1+1], %g2
	sllx	%g3, 56, %g3
	sllx	%g2, 48, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+2], %g2
	sllx	%g2, 40, %g2
	or	%g2, %g3, %g2
	ldub	[%g1+3], %g3
	sllx	%g3, 32, %g3
	or	%g3, %g2, %g2
	ldub	[%g1+4], %g3
	sllx	%g3, 24, %g3
	or	%g3, %g2, %g3
	ldub	[%g1+5], %g2
	sllx	%g2, 16, %g2
	or	%g2, %g3, %g3
	ldub	[%g1+6], %g2
	ldub	[%g1+7], %g1
	sllx	%g2, 8, %g2
	stx	%g4, [%i2+248]
	or	%g2, %g3, %g2
	add	%i1, 256, %i1
	or	%g1, %g2, %g2
	add	%i0, 32, %g1
	stx	%g2, [%i2+240]
.L27:
	ldx	[%i0], %g2
	add	%i0, 8, %i0
	cmp	%i0, %g1
	bne,pt	%xcc, .L27
	 prefetch	[%g2+%i1], 0
	call	transpose_vecs, 0
	 mov	%i2, %o0
	call	transpose_vecs, 0
	 add	%i2, 64, %o0
	add	%i2, 128, %o0
	call	transpose_vecs, 0
	 add	%i2, 192, %i0
	call	transpose_vecs, 0
	 restore
	.size	transpose_msg_vecs, .-transpose_msg_vecs
	.align 4
	.type	load_counters, #function
	.proc	020
load_counters:
	save	%sp, -176, %sp
	sub	%g0, %i1, %i1
	mov	-1, %g1
	srl	%i1, 0, %g5
	sllx	%g1, 32, %g4
	sllx	%i1, 32, %g2
	mov	1, %g1
	sllx	%g1, 33, %g1
	and	%g1, %g4, %g1
	or	%g1, 3, %g1
	sethi	%hi(2147483648), %i5
	and	%i1, 1, %i1
	and	%g2, %g4, %g3
	add	%i0, %i1, %g2
	or	%g3, %g5, %g3
	srl	%g2, 0, %g2
	and	%g3, %g1, %g3
	sllx	%i0, 32, %g1
	add	%i0, %g3, %g5
	and	%g1, %g4, %g1
	srl	%g5, 0, %g5
	or	%g1, %g2, %g1
	srax	%g3, 32, %g2
	stx	%g1, [%i2]
	add	%i0, %g2, %g2
	sllx	%g2, 32, %g2
	and	%g2, %g4, %g2
	or	%g2, %g5, %g2
	sllx	%i5, 32, %g5
	add	%g5, %i5, %g5
	xor	%g1, %g5, %i5
	xor	%i1, %g5, %i1
	srax	%i5, 32, %i4
	srax	%i1, 32, %g1
	cmp	%i4, %g1
	xor	%g3, %g5, %g3
	stx	%g2, [%i2+8]
	xor	%g2, %g5, %g5
	mov	0, %g2
	movl	%icc, -1, %g2
	cmp	%i5, %i1
	srlx	%i0, 32, %i0
	srax	%g3, 32, %i5
	mov	0, %g1
	srax	%g5, 32, %i4
	movl	%icc, -1, %g1
	cmp	%i4, %i5
	sub	%i0, %g1, %g1
	srl	%g1, 0, %g1
	sub	%i0, %g2, %g2
	mov	0, %i5
	sllx	%g2, 32, %g2
	and	%g2, %g4, %g2
	or	%g2, %g1, %g2
	mov	0, %g1
	stx	%g2, [%i3]
	movl	%icc, -1, %g1
	cmp	%g3, %g5
	sub	%i0, %g1, %g1
	movg	%icc, -1, %i5
	sllx	%g1, 32, %g1
	sub	%i0, %i5, %i0
	and	%g1, %g4, %g1
	srl	%i0, 0, %i0
	or	%g1, %i0, %i0
	stx	%i0, [%i3+8]
	return	%i7+8
	 nop
	.size	load_counters, .-load_counters
	.align 4
	.type	blake3_hash4_sse41, #function
	.proc	020
blake3_hash4_sse41:
	save	%sp, -880, %sp
	call	set1, 0
	 lduw	[%i2], %o0
	std	%f0, [%fp+1407]
	lduw	[%i2+4], %o0
	call	set1, 0
	 std	%f2, [%fp+1415]
	std	%f0, [%fp+1423]
	lduw	[%i2+8], %o0
	call	set1, 0
	 std	%f2, [%fp+1431]
	std	%f0, [%fp+1439]
	lduw	[%i2+12], %o0
	call	set1, 0
	 std	%f2, [%fp+1447]
	std	%f0, [%fp+1455]
	lduw	[%i2+16], %o0
	call	set1, 0
	 std	%f2, [%fp+1463]
	std	%f0, [%fp+1471]
	lduw	[%i2+20], %o0
	call	set1, 0
	 std	%f2, [%fp+1479]
	std	%f0, [%fp+1487]
	lduw	[%i2+24], %o0
	call	set1, 0
	 std	%f2, [%fp+1495]
	ldub	[%fp+2230], %l1
	lduw	[%i2+28], %o0
	std	%f0, [%fp+1503]
	call	set1, 0
	 std	%f2, [%fp+1511]
	mov	%i4, %o1
	mov	%i3, %o0
	ldx	[%fp+2239], %l0
	ldub	[%fp+2238], %l5
	std	%f0, [%fp+1519]
	std	%f2, [%fp+1527]
	add	%fp, 1391, %o3
	add	%fp, 1375, %o2
	or	%i5, %l1, %i2
	sethi	%hi(1779033088), %l2
	sethi	%hi(3144133632), %l3
	sethi	%hi(1013903360), %l4
	call	load_counters, 0
	 sethi	%hi(2773480448), %l6
	mov	0, %l1
	add	%fp, 1535, %i4
	or	%l2, 615, %l2
	or	%l3, 645, %l3
	or	%l4, 882, %l4
	or	%l6, 314, %l6
	add	%fp, 1791, %i3
.L31:
	cmp	%l1, %i1
	bne,a,pt %xcc, .L33
	 add	%l1, 1, %l1
	call	transpose_vecs, 0
	 add	%fp, 1407, %o0
	call	transpose_vecs, 0
	 add	%fp, 1471, %o0
	mov	%l0, %o2
	ldd	[%fp+1407], %f0
	call	storeu, 0
	 ldd	[%fp+1415], %f2
	add	%l0, 16, %o2
	ldd	[%fp+1471], %f0
	call	storeu, 0
	 ldd	[%fp+1479], %f2
	add	%l0, 32, %o2
	ldd	[%fp+1423], %f0
	call	storeu, 0
	 ldd	[%fp+1431], %f2
	add	%l0, 48, %o2
	ldd	[%fp+1487], %f0
	call	storeu, 0
	 ldd	[%fp+1495], %f2
	add	%l0, 64, %o2
	ldd	[%fp+1439], %f0
	call	storeu, 0
	 ldd	[%fp+1447], %f2
	add	%l0, 80, %o2
	ldd	[%fp+1503], %f0
	call	storeu, 0
	 ldd	[%fp+1511], %f2
	add	%l0, 96, %o2
	ldd	[%fp+1455], %f0
	call	storeu, 0
	 ldd	[%fp+1463], %f2
	add	%l0, 112, %o2
	ldd	[%fp+1519], %f0
	call	storeu, 0
	 ldd	[%fp+1527], %f2
	return	%i7+8
	 nop
.L33:
	cmp	%l1, %i1
	be,a,pn	%xcc, .L32
	 or	%i2, %l5, %i2
.L32:
	call	set1, 0
	 mov	64, %o0
	std	%f0, [%fp+1367]
	std	%f2, [%fp+1359]
	ldx	[%fp+1367], %g2
	ldx	[%fp+1359], %g1
	stx	%g2, [%fp+1343]
	stx	%g1, [%fp+1351]
	call	set1, 0
	 and	%i2, 0xff, %o0
	mov	%i4, %o2
	std	%f0, [%fp+1367]
	std	%f2, [%fp+1359]
	ldx	[%fp+1367], %l7
	ldx	[%fp+1359], %i2
	mov	%i0, %o0
	sllx	%l1, 6, %o1
	call	transpose_msg_vecs, 0
	 add	%o1, -64, %o1
	ldx	[%fp+1407], %g4
	ldx	[%fp+1415], %g5
	stx	%g4, [%fp+1791]
	stx	%g5, [%fp+1799]
	ldx	[%fp+1423], %g4
	ldx	[%fp+1431], %g5
	stx	%g4, [%fp+1807]
	stx	%g5, [%fp+1815]
	ldx	[%fp+1439], %g4
	ldx	[%fp+1447], %g5
	stx	%g4, [%fp+1823]
	stx	%g5, [%fp+1831]
	ldx	[%fp+1455], %g4
	ldx	[%fp+1463], %g5
	stx	%g4, [%fp+1839]
	stx	%g5, [%fp+1847]
	ldx	[%fp+1471], %g4
	ldx	[%fp+1479], %g5
	stx	%g4, [%fp+1855]
	stx	%g5, [%fp+1863]
	ldx	[%fp+1487], %g4
	ldx	[%fp+1495], %g5
	stx	%g4, [%fp+1871]
	stx	%g5, [%fp+1879]
	ldx	[%fp+1503], %g4
	ldx	[%fp+1511], %g5
	stx	%g4, [%fp+1887]
	stx	%g5, [%fp+1895]
	ldx	[%fp+1519], %g4
	ldx	[%fp+1527], %g5
	stx	%g4, [%fp+1903]
	stx	%g5, [%fp+1911]
	call	set1, 0
	 mov	%l2, %o0
	mov	%l3, %o0
	std	%f0, [%fp+1919]
	call	set1, 0
	 std	%f2, [%fp+1927]
	mov	%l4, %o0
	std	%f0, [%fp+1935]
	call	set1, 0
	 std	%f2, [%fp+1943]
	mov	%l6, %o0
	std	%f0, [%fp+1951]
	call	set1, 0
	 std	%f2, [%fp+1959]
	ldx	[%fp+1375], %g4
	ldx	[%fp+1383], %g5
	ldx	[%fp+1343], %g2
	ldx	[%fp+1351], %g1
	stx	%g4, [%fp+1983]
	stx	%g5, [%fp+1991]
	ldx	[%fp+1391], %g4
	ldx	[%fp+1399], %g5
	stx	%g2, [%fp+2015]
	stx	%g1, [%fp+2023]
	std	%f0, [%fp+1967]
	std	%f2, [%fp+1975]
	stx	%g4, [%fp+1999]
	stx	%g5, [%fp+2007]
	stx	%i2, [%fp+2039]
	mov	0, %o2
	mov	%i4, %o1
	mov	%i3, %o0
	call	round_fn, 0
	 stx	%l7, [%fp+2031]
	mov	1, %o2
	mov	%i4, %o1
	call	round_fn, 0
	 mov	%i3, %o0
	mov	2, %o2
	mov	%i4, %o1
	call	round_fn, 0
	 mov	%i3, %o0
	mov	3, %o2
	mov	%i4, %o1
	call	round_fn, 0
	 mov	%i3, %o0
	mov	4, %o2
	mov	%i4, %o1
	call	round_fn, 0
	 mov	%i3, %o0
	mov	5, %o2
	mov	%i4, %o1
	call	round_fn, 0
	 mov	%i3, %o0
	mov	6, %o2
	mov	%i4, %o1
	call	round_fn, 0
	 mov	%i3, %o0
	ldx	[%fp+1919], %g1
	ldx	[%fp+1927], %g3
	ldx	[%fp+1791], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1799], %g1
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1415]
	ldx	[%fp+1935], %g1
	ldx	[%fp+1943], %g3
	stx	%g2, [%fp+1407]
	ldx	[%fp+1807], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1815], %g1
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1431]
	ldx	[%fp+1951], %g1
	ldx	[%fp+1959], %g3
	stx	%g2, [%fp+1423]
	ldx	[%fp+1823], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1831], %g1
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1447]
	ldx	[%fp+1967], %g1
	ldx	[%fp+1975], %g3
	stx	%g2, [%fp+1439]
	ldx	[%fp+1839], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1847], %g1
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1463]
	ldx	[%fp+1983], %g1
	ldx	[%fp+1991], %g3
	stx	%g2, [%fp+1455]
	ldx	[%fp+1855], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1863], %g1
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1479]
	ldx	[%fp+1999], %g1
	stx	%g2, [%fp+1471]
	ldx	[%fp+1871], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1879], %g1
	ldx	[%fp+2007], %g3
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1495]
	ldx	[%fp+2015], %g1
	ldx	[%fp+2023], %g3
	stx	%g2, [%fp+1487]
	ldx	[%fp+1887], %g2
	xor	%g2, %g1, %g2
	ldx	[%fp+1895], %g1
	xor	%g1, %g3, %g1
	stx	%g1, [%fp+1511]
	ldx	[%fp+2031], %g1
	stx	%g2, [%fp+1503]
	ldx	[%fp+2039], %g3
	ldx	[%fp+1903], %g2
	mov	%i5, %i2
	xor	%g2, %g1, %g2
	ldx	[%fp+1911], %g1
	stx	%g2, [%fp+1519]
	xor	%g1, %g3, %g1
	ba,pt	%xcc, .L31
	 stx	%g1, [%fp+1527]
	.size	blake3_hash4_sse41, .-blake3_hash4_sse41
	.align 4
	.global hash_one_sse41
	.type	hash_one_sse41, #function
	.proc	020
hash_one_sse41:
	save	%sp, -208, %sp
	ldub	[%fp+2230], %l1
	add	%fp, 2015, %l0
	mov	32, %o2
	mov	%i2, %o1
	call	memcpy, 0
	 mov	%l0, %o0
	or	%i4, %i5, %o4
.L35:
	brnz,pt	%i1, .L37
	 cmp	%i1, 1
	mov	32, %o2
	mov	%l0, %o1
	call	memcpy, 0
	 ldx	[%fp+2231], %o0
	return	%i7+8
	 nop
.L37:
	be,a,pn	%xcc, .L36
	 or	%o4, %l1, %o4
.L36:
	and	%o4, 0xff, %o4
	mov	%i0, %o1
	mov	%i3, %o3
	mov	64, %o2
	call	_blake3_compress_in_place_sse41, 0
	 mov	%l0, %o0
	add	%i0, 64, %i0
	add	%i1, -1, %i1
	ba,pt	%xcc, .L35
	 mov	%i4, %o4
	.size	hash_one_sse41, .-hash_one_sse41
	.align 4
	.global _blake3_hash_many_sse41
	.type	_blake3_hash_many_sse41, #function
	.proc	020
_blake3_hash_many_sse41:
	save	%sp, -208, %sp
	ldx	[%fp+2247], %l0
	ldub	[%fp+2230], %l6
	ldub	[%fp+2238], %l3
	ldub	[%fp+2246], %l4
	mov	%l0, %l5
	mov	%i1, %l1
	mov	%i0, %l2
.L39:
	cmp	%l1, 3
	bgu,a,pt %xcc, .L41
	 stx	%l5, [%sp+2239]
	srlx	%i1, 2, %g1
	sllx	%g1, 5, %g2
	add	%i0, %g2, %i0
	sllx	%g1, 2, %g2
	sllx	%g1, 7, %g1
	sub	%i1, %g2, %i1
	add	%l0, %g1, %l0
.L42:
	brnz,a,pt %i1, .L44
	 stx	%l0, [%sp+2231]
	return	%i7+8
	 nop
.L41:
	stx	%l4, [%sp+2231]
	stx	%l3, [%sp+2223]
	mov	%l6, %o5
	mov	%i5, %o4
	mov	%i4, %o3
	mov	%i3, %o2
	mov	%i2, %o1
	call	blake3_hash4_sse41, 0
	 mov	%l2, %o0
	brnz,a,pt %i5, .L40
	 add	%i4, 4, %i4
.L40:
	add	%l2, 32, %l2
	add	%l1, -4, %l1
	ba,pt	%xcc, .L39
	 add	%l5, 128, %l5
.L44:
	stx	%l4, [%sp+2223]
	mov	%l3, %o5
	mov	%l6, %o4
	mov	%i4, %o3
	mov	%i3, %o2
	mov	%i2, %o1
	call	hash_one_sse41, 0
	 ldx	[%i0], %o0
	brnz,a,pt %i5, .L43
	 add	%i4, 1, %i4
.L43:
	add	%i0, 8, %i0
	add	%i1, -1, %i1
	ba,pt	%xcc, .L42
	 add	%l0, 32, %l0
	.size	_blake3_hash_many_sse41, .-_blake3_hash_many_sse41
	.section	".rodata"
	.type	MSG_SCHEDULE, #object
	.size	MSG_SCHEDULE, 112
MSG_SCHEDULE:
	.asciz	""
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017"
	.asciz	"\002\006\003\n\007"
	.ascii	"\004\r\001\013\f\005\t\016\017\b"
	.asciz	"\003\004\n\f\r\002\007\016\006\005\t"
	.ascii	"\013\017\b\001"
	.asciz	"\n\007\f\t\016\003\r\017\004"
	.ascii	"\013\002\005\b\001\006"
	.asciz	"\f\r\t\013\017\n\016\b\007\002\005\003"
	.ascii	"\001\006\004"
	.asciz	"\t\016\013\005\b\f\017\001\r\003"
	.ascii	"\n\002\006\004\007"
	.asciz	"\013\017\005"
	.ascii	"\001\t\b\006\016\n\002\f\003\004\007\r"
	.section	.text.__sparc_get_pc_thunk.l7,"axG",@progbits,__sparc_get_pc_thunk.l7,comdat
	.align 4
	.weak	__sparc_get_pc_thunk.l7
	.hidden	__sparc_get_pc_thunk.l7
	.type	__sparc_get_pc_thunk.l7, #function
	.proc	020
__sparc_get_pc_thunk.l7:
	jmp	%o7+8
	 add	%o7, %l7, %l7
	.section	.note.GNU-stack,"",@progbits
#endif
