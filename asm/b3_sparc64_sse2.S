/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Based on BLAKE3 v1.3.1, https://github.com/BLAKE3-team/BLAKE3
 * Copyright (c) 2019-2022 Samuel Neves and Matthew Krupcale
 * Copyright (c) 2022 Tino Reichardt <milky-zfs@mcmilk.de>
 *
 * This is converted assembly: SSE2 -> SPARC64 VII
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
	save	%sp, -192, %sp
	std	%f0, [%fp+2039]
	sethi	%hi(67107840), %g1
	ldx	[%fp+2039], %g2
	sllx	%g1, 22, %g1
	srlx	%g2, 48, %g5
	sllx	%g5, 32, %g5
	xnor	%g0, %g1, %i5
	sllx	%g2, 16, %g3
	sethi	%hi(4294901760), %g1
	srlx	%g3, 48, %g3
	sllx	%g3, 48, %g3
	and	%g3, %i5, %g3
	or	%g3, %g5, %g3
	sllx	%g2, 48, %g5
	sllx	%g2, 32, %g2
	srlx	%g5, 32, %g5
	std	%f2, [%fp+2039]
	xnor	%g0, %g1, %i3
	ldx	[%fp+2039], %g4
	and	%g3, %i3, %g3
	srlx	%g4, 48, %g1
	or	%g3, %g5, %g3
	srlx	%g2, 48, %g5
	sllx	%g4, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	sllx	%g1, 32, %i2
	and	%g2, %i5, %g1
	sllx	%g4, 48, %g2
	srlx	%g2, 32, %g2
	or	%g1, %i2, %g1
	mov	-1, %i4
	and	%g1, %i3, %g1
	sllx	%i4, 16, %i4
	or	%g1, %g2, %g1
	and	%g3, %i4, %g3
	or	%g3, %g5, %g2
	stx	%g2, [%fp+2039]
	and	%g1, %i4, %g1
	ldd	[%fp+2039], %f0
	sllx	%g4, 32, %g4
	srlx	%g4, 48, %g4
	or	%g1, %g4, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
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
	save	%sp, -192, %sp
	std	%f0, [%fp+2039]
	mov	-1, %g3
	ldx	[%fp+2039], %g2
	std	%f2, [%fp+2039]
	srl	%g2, 8, %g4
	ldx	[%fp+2039], %g1
	sllx	%g3, 32, %g5
	srlx	%g2, 8, %i4
	srl	%g1, 8, %g3
	and	%i4, %g5, %i4
	or	%i4, %g4, %i4
	srax	%g2, 32, %g4
	sll	%g2, 24, %g2
	sllx	%g4, 56, %g4
	srl	%g2, 0, %g2
	and	%g4, %g5, %g4
	or	%g4, %g2, %g2
	xor	%g2, %i4, %g2
	stx	%g2, [%fp+2039]
	srlx	%g1, 8, %i5
	ldd	[%fp+2039], %f0
	and	%i5, %g5, %i5
	or	%i5, %g3, %i5
	srax	%g1, 32, %g3
	sll	%g1, 24, %g1
	sllx	%g3, 56, %g3
	srl	%g1, 0, %g1
	and	%g3, %g5, %g3
	or	%g3, %g1, %g1
	xor	%g1, %i5, %g1
	stx	%g1, [%fp+2039]
	ldd	[%fp+2039], %f2
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
	ldx	[%i0], %g4
	srax	%g4, 32, %i4
	ldx	[%i1], %g2
	std	%f8, [%fp+2039]
	ldx	[%fp+2039], %g5
	srax	%g5, 32, %g3
	add	%g4, %g5, %g5
	add	%g3, %i4, %g3
	add	%g5, %g2, %g5
	srax	%g2, 32, %i4
	srl	%g5, 0, %g5
	add	%g3, %i4, %g3
	std	%f10, [%fp+2039]
	mov	-1, %i4
	ldx	[%fp+2039], %o7
	sllx	%i4, 32, %g4
	sllx	%g3, 32, %g3
	and	%g3, %g4, %g3
	or	%g3, %g5, %g3
	srax	%o7, 32, %g5
	ldx	[%i0+8], %g1
	ldx	[%i1+8], %i5
	srax	%g1, 32, %g2
	add	%g1, %o7, %g1
	add	%g2, %g5, %g2
	add	%g1, %i5, %g1
	srax	%i5, 32, %g5
	srl	%g1, 0, %g1
	add	%g2, %g5, %g2
	sllx	%g2, 32, %g2
	and	%g2, %g4, %g2
	or	%g2, %g1, %g2
	stx	%g3, [%i0]
	stx	%g2, [%i0+8]
	sethi	%hi(67107840), %g1
	ldx	[%i3], %i5
	ldx	[%i3+8], %g5
	xor	%i5, %g3, %i5
	xor	%g5, %g2, %g5
	sllx	%g1, 22, %g1
	srlx	%i5, 48, %g2
	sllx	%g2, 32, %g2
	xnor	%g0, %g1, %i0
	sllx	%i5, 16, %g3
	sethi	%hi(4294901760), %g1
	srlx	%g3, 48, %g3
	sllx	%g3, 48, %g3
	and	%g3, %i0, %g3
	or	%g3, %g2, %g3
	sllx	%i5, 48, %g2
	srlx	%g2, 32, %g2
	xnor	%g0, %g1, %o7
	sllx	%i5, 32, %i5
	srlx	%g5, 48, %g1
	srlx	%i5, 48, %i5
	and	%g3, %o7, %g3
	or	%g3, %g2, %g3
	sllx	%g5, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	sllx	%i4, 16, %i4
	and	%g3, %i4, %g3
	or	%g3, %i5, %g3
	sllx	%g1, 32, %i5
	and	%g2, %i0, %g1
	sllx	%g5, 48, %g2
	srlx	%g2, 32, %g2
	or	%g1, %i5, %g1
	and	%g1, %o7, %g1
	or	%g1, %g2, %g1
	sllx	%g5, 32, %g2
	srlx	%g2, 48, %g2
	stx	%g3, [%i3]
	and	%g1, %i4, %g1
	srax	%g3, 32, %i4
	or	%g1, %g2, %g1
	stx	%g1, [%i3+8]
	ldx	[%i2], %g2
	srax	%g2, 32, %g5
	add	%g2, %g3, %g2
	add	%g5, %i4, %g5
	srl	%g2, 0, %g2
	sllx	%g5, 32, %g5
	and	%g5, %g4, %g3
	ldx	[%i2+8], %i5
	or	%g3, %g2, %g5
	srax	%g1, 32, %g3
	srax	%i5, 32, %g2
	add	%g2, %g3, %g2
	sllx	%g2, 32, %g2
	add	%i5, %g1, %i5
	and	%g2, %g4, %g1
	srl	%i5, 0, %i5
	or	%g1, %i5, %g2
	stx	%g5, [%i2]
	stx	%g2, [%i2+8]
	ldx	[%i1], %g3
	ldx	[%i1+8], %g1
	xor	%g3, %g5, %g3
	xor	%g1, %g2, %g1
	srl	%g3, 12, %g2
	srlx	%g3, 12, %i5
	and	%i5, %g4, %i5
	or	%i5, %g2, %i5
	srl	%g1, 12, %g2
	srlx	%g1, 12, %g5
	and	%g5, %g4, %g5
	or	%g5, %g2, %g5
	srax	%g3, 32, %g2
	sllx	%g2, 52, %g2
	and	%g2, %g4, %g2
	sll	%g3, 20, %g3
	srl	%g3, 0, %g3
	or	%g2, %g3, %g3
	srax	%g1, 32, %g2
	xor	%g3, %i5, %g3
	sllx	%g2, 52, %g2
	sll	%g1, 20, %g1
	and	%g2, %g4, %g4
	srl	%g1, 0, %g1
	stx	%g3, [%i1]
	or	%g4, %g1, %g1
	xor	%g1, %g5, %g1
	stx	%g1, [%i1+8]
	return	%i7+8
	 nop
	.size	g1, .-g1
	.align 4
	.type	g2, #function
	.proc	020
g2:
	save	%sp, -192, %sp
	ldx	[%i0], %g1
	ldx	[%i1], %g2
	std	%f8, [%fp+2039]
	srax	%g1, 32, %o7
	ldx	[%fp+2039], %g5
	srax	%g5, 32, %g3
	add	%g1, %g5, %g5
	add	%g5, %g2, %g5
	srl	%g5, 0, %g5
	add	%g3, %o7, %g3
	std	%f10, [%fp+2039]
	srax	%g2, 32, %o7
	ldx	[%fp+2039], %i4
	add	%g3, %o7, %g3
	mov	-1, %g1
	sllx	%g3, 32, %g3
	sllx	%g1, 32, %g1
	and	%g3, %g1, %g3
	or	%g3, %g5, %g3
	srax	%i4, 32, %g5
	ldx	[%i1+8], %i5
	ldx	[%i0+8], %g4
	srax	%g4, 32, %g2
	add	%g4, %i4, %g4
	add	%g2, %g5, %g2
	add	%g4, %i5, %g4
	srax	%i5, 32, %g5
	srl	%g4, 0, %g4
	stx	%g3, [%i0]
	add	%g2, %g5, %g2
	sllx	%g2, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g4, %g2
	stx	%g2, [%i0+8]
	ldx	[%i3], %g5
	ldx	[%i3+8], %g4
	xor	%g5, %g3, %g3
	xor	%g4, %g2, %g2
	srl	%g3, 8, %g5
	srl	%g2, 8, %g4
	srlx	%g3, 8, %i4
	srlx	%g2, 8, %i5
	and	%i4, %g1, %i4
	and	%i5, %g1, %i5
	or	%i4, %g5, %i4
	or	%i5, %g4, %i5
	srax	%g3, 32, %g5
	srax	%g2, 32, %g4
	sllx	%g5, 56, %g5
	sll	%g3, 24, %g3
	and	%g5, %g1, %g5
	srl	%g3, 0, %g3
	sllx	%g4, 56, %g4
	or	%g5, %g3, %g3
	and	%g4, %g1, %g4
	sll	%g2, 24, %g2
	srl	%g2, 0, %g2
	or	%g4, %g2, %g2
	xor	%i4, %g3, %i4
	xor	%i5, %g2, %i5
	stx	%i4, [%i3]
	stx	%i5, [%i3+8]
	srax	%i4, 32, %g2
	ldx	[%i2], %g5
	srax	%g5, 32, %g3
	add	%g3, %g2, %g3
	sllx	%g3, 32, %g3
	and	%g3, %g1, %g3
	ldx	[%i2+8], %g4
	add	%g5, %i4, %g5
	srax	%g4, 32, %g2
	srl	%g5, 0, %g5
	add	%g4, %i5, %g4
	or	%g3, %g5, %g5
	srl	%g4, 0, %g4
	srax	%i5, 32, %g3
	add	%g2, %g3, %g2
	sllx	%g2, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g4, %g4
	stx	%g5, [%i2]
	stx	%g4, [%i2+8]
	ldx	[%i1], %g3
	ldx	[%i1+8], %g2
	xor	%g3, %g5, %g3
	xor	%g2, %g4, %g2
	srl	%g3, 7, %g4
	srlx	%g3, 7, %i5
	and	%i5, %g1, %i5
	or	%i5, %g4, %i5
	srl	%g2, 7, %g4
	srlx	%g2, 7, %g5
	and	%g5, %g1, %g5
	or	%g5, %g4, %g5
	srax	%g3, 32, %g4
	sllx	%g4, 57, %g4
	and	%g4, %g1, %g4
	sll	%g3, 25, %g3
	srl	%g3, 0, %g3
	or	%g4, %g3, %g3
	srax	%g2, 32, %g4
	xor	%g3, %i5, %g3
	sllx	%g4, 57, %g4
	sll	%g2, 25, %g2
	and	%g4, %g1, %g1
	srl	%g2, 0, %g2
	stx	%g3, [%i1]
	or	%g1, %g2, %g2
	xor	%g2, %g5, %g2
	stx	%g2, [%i1+8]
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
	.type	blend_epi16, #function
	.proc	00
blend_epi16:
	save	%sp, -208, %sp
	sth	%i4, [%fp+2031]
	mov	1, %i0
	sllx	%i0, 33, %g1
	sllx	%i0, 48, %i5
	sethi	%hi(67107840), %g2
	sllx	%g2, 22, %g2
	xnor	%g0, %g2, %i1
	and	%i5, %i1, %i5
	or	%i5, %g1, %i5
	sethi	%hi(262144), %g1
	sethi	%hi(4294901760), %g2
	xnor	%g0, %g2, %i2
	and	%i5, %i2, %i5
	or	%i5, %g1, %i5
	mov	-1, %g1
	sllx	%g1, 16, %i3
	sethi	%hi(4194304), %g1
	sth	%i4, [%fp+2033]
	sth	%i4, [%fp+2035]
	sth	%i4, [%fp+2037]
	and	%i5, %i3, %i5
	sllx	%i0, 52, %g3
	or	%i5, 8, %i5
	and	%g3, %i1, %g3
	sllx	%i0, 37, %i0
	or	%g3, %i0, %g3
	and	%g3, %i2, %g3
	or	%g3, %g1, %g3
	ldx	[%fp+2031], %g1
	and	%g3, %i3, %g3
	and	%g1, %i5, %i5
	or	%g3, 128, %g3
	srax	%i5, 48, %g2
	cmp	%g2, 1
	sth	%i4, [%fp+2039]
	sth	%i4, [%fp+2041]
	sth	%i4, [%fp+2043]
	sth	%i4, [%fp+2045]
	sllx	%i5, 16, %i4
	ldx	[%fp+2039], %g1
	srax	%i4, 48, %i4
	and	%g3, %g1, %g1
	mov	0, %g3
	move	%icc, -1, %g3
	cmp	%i4, 2
	mov	0, %g2
	sra	%i5, 16, %i4
	move	%icc, -1, %g2
	cmp	%i4, 4
	sllx	%g2, 48, %g2
	srlx	%g2, 16, %g2
	sllx	%g3, 48, %g3
	sll	%i5, 16, %i5
	and	%g3, %i1, %g3
	sra	%i5, 16, %i5
	or	%g3, %g2, %g3
	mov	0, %g2
	move	%icc, -1, %g2
	cmp	%i5, 8
	sllx	%g2, 48, %g2
	srlx	%g2, 32, %g2
	srax	%g1, 48, %i5
	and	%g3, %i2, %g3
	or	%g3, %g2, %g3
	mov	0, %g2
	move	%icc, -1, %g2
	cmp	%i5, 16
	sllx	%g2, 48, %g2
	srlx	%g2, 48, %g2
	std	%f0, [%fp+2023]
	and	%g3, %i3, %g3
	sllx	%g1, 16, %i4
	or	%g3, %g2, %g3
	srax	%i4, 48, %i4
	mov	0, %g2
	mov	0, %i5
	move	%icc, -1, %g2
	cmp	%i4, 32
	move	%icc, -1, %i5
	sllx	%i5, 48, %i5
	srlx	%i5, 16, %i5
	ldx	[%fp+2023], %g5
	srl	%g1, 16, %i4
	std	%f2, [%fp+2023]
	cmp	%i4, 64
	and	%g1, 128, %g1
	sllx	%g2, 48, %g2
	and	%g2, %i1, %g2
	or	%g2, %i5, %g2
	mov	0, %i5
	and	%g2, %i2, %g2
	move	%icc, -1, %i5
	sllx	%i5, 48, %i5
	srlx	%i5, 32, %i5
	or	%g2, %i5, %g2
	ldx	[%fp+2023], %g4
	cmp	%g1, 128
	std	%f4, [%fp+2023]
	and	%g2, %i3, %g1
	ldx	[%fp+2023], %g2
	xor	%g5, %g2, %g2
	std	%f6, [%fp+2023]
	and	%g2, %g3, %g3
	ldx	[%fp+2023], %g2
	xor	%g4, %g2, %g2
	mov	0, %i5
	move	%icc, -1, %i5
	sllx	%i5, 48, %i5
	srlx	%i5, 48, %i5
	or	%g1, %i5, %g1
	and	%g2, %g1, %g1
	xor	%g3, %g5, %g2
	stx	%g2, [%fp+2023]
	xor	%g1, %g4, %g1
	ldd	[%fp+2023], %f0
	stx	%g1, [%fp+2023]
	ldd	[%fp+2023], %f2
	return	%i7+8
	 nop
	.size	blend_epi16, .-blend_epi16
	.align 4
	.type	compress_pre, #function
	.proc	020
compress_pre:
	save	%sp, -544, %sp
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
	ldub	[%i2+16], %i4
	ldub	[%i2+28], %g1
	ldub	[%i2+17], %g3
	sllx	%g1, 24, %g1
	sllx	%g3, 48, %g3
	or	%g1, %g4, %g1
	sllx	%i4, 56, %i4
	ldub	[%i2+29], %g4
	or	%g3, %i4, %i4
	sllx	%g4, 16, %g4
	ldub	[%i2+15], %i3
	ldub	[%i2+7], %l3
	or	%g4, %g1, %g1
	ldub	[%i2+31], %i5
	ldub	[%i2+30], %g4
	ldub	[%i2+18], %g3
	sllx	%g3, 40, %g3
	or	%g3, %i4, %g3
	ldub	[%i2+19], %i4
	sllx	%i4, 32, %i4
	or	%i4, %g3, %g3
	sllx	%g4, 8, %g4
	ldub	[%i2+20], %i4
	or	%g4, %g1, %g4
	sllx	%i4, 24, %i4
	ldub	[%i2+22], %g1
	or	%i4, %g3, %i4
	sllx	%g1, 8, %g1
	ldub	[%i2+21], %g3
	sllx	%g3, 16, %g3
	or	%g3, %i4, %i4
	or	%g1, %i4, %g3
	ldub	[%i2+40], %g1
	sllx	%g1, 56, %l2
	ldub	[%i2+41], %g1
	sllx	%g1, 48, %g1
	or	%g1, %l2, %g1
	ldub	[%i2+42], %l2
	sllx	%l2, 40, %l2
	or	%l2, %g1, %g1
	ldub	[%i2+43], %l2
	sllx	%l2, 32, %l2
	or	%l2, %g1, %l2
	ldub	[%i2+44], %g1
	sllx	%g1, 24, %g1
	or	%g1, %l2, %l2
	ldub	[%i2+45], %g1
	sllx	%g1, 16, %g1
	or	%g1, %l2, %g1
	ldub	[%i2+46], %l2
	sllx	%l2, 8, %l2
	or	%l2, %g1, %g1
	ldub	[%i2+47], %l2
	or	%l2, %g1, %l2
	ldub	[%i2+32], %g1
	sllx	%g1, 56, %l4
	ldub	[%i2+33], %g1
	sllx	%g1, 48, %g1
	or	%g1, %l4, %g1
	ldub	[%i2+34], %l4
	sllx	%l4, 40, %l4
	or	%l4, %g1, %g1
	ldub	[%i2+35], %l4
	sllx	%l4, 32, %l4
	or	%l4, %g1, %l4
	ldub	[%i2+36], %g1
	sllx	%g1, 24, %g1
	or	%g1, %l4, %l4
	ldub	[%i2+37], %g1
	sllx	%g1, 16, %g1
	or	%g1, %l4, %g1
	ldub	[%i2+38], %l4
	sllx	%l4, 8, %l4
	or	%l4, %g1, %g1
	ldub	[%i2+39], %l4
	or	%l4, %g1, %l4
	ldub	[%i2+56], %g1
	sllx	%g1, 56, %l0
	ldub	[%i2+57], %g1
	sllx	%g1, 48, %g1
	or	%g1, %l0, %g1
	ldub	[%i2+58], %l0
	sllx	%l0, 40, %l0
	or	%l0, %g1, %g1
	ldub	[%i2+59], %l0
	sllx	%l0, 32, %l0
	or	%l0, %g1, %l0
	ldub	[%i2+60], %g1
	sllx	%g1, 24, %g1
	or	%g1, %l0, %l0
	ldub	[%i2+61], %g1
	sllx	%g1, 16, %g1
	or	%g1, %l0, %g1
	ldub	[%i2+62], %l0
	sllx	%l0, 8, %l0
	or	%l0, %g1, %g1
	ldub	[%i2+63], %l0
	or	%l0, %g1, %l0
	ldub	[%i2+48], %g1
	sllx	%g1, 56, %l5
	ldub	[%i2+23], %l1
	ldub	[%i2+49], %g1
	sllx	%g1, 48, %g1
	or	%g1, %l5, %g1
	ldub	[%i2+50], %l5
	sllx	%l5, 40, %l5
	or	%l5, %g1, %g1
	ldub	[%i2+51], %l5
	sllx	%l5, 32, %l5
	or	%l5, %g1, %l5
	ldub	[%i2+52], %g1
	sllx	%g1, 24, %g1
	or	%g1, %l5, %l5
	ldub	[%i2+53], %g1
	sllx	%g1, 16, %g1
	or	%g1, %l5, %g1
	ldub	[%i2+54], %l5
	sllx	%l5, 8, %l5
	or	%l5, %g1, %g1
	ldub	[%i2+55], %l5
	or	%l5, %g1, %l5
	srlx	%g2, 32, %g1
	st	%g1, [%fp+1767]
	srlx	%g3, 32, %g1
	ld	[%fp+1767], %f16
	or	%l3, %g5, %l3
	st	%f16, [%fp+1779]
	srlx	%g5, 32, %g5
	st	%g1, [%fp+1767]
	st	%g5, [%fp+1775]
	ldx	[%fp+1775], %g1
	ld	[%fp+1767], %f17
	stx	%g1, [%fp+1791]
	st	%f17, [%fp+1783]
	or	%i5, %g4, %i5
	srlx	%g4, 32, %g4
	st	%g4, [%fp+1787]
	ldx	[%fp+1783], %g1
	add	%i0, 32, %i1
	add	%i0, 48, %i2
	add	%i0, 16, %i4
	st	%f16, [%fp+1711]
	st	%f17, [%fp+1719]
	or	%i3, %g2, %i3
	or	%l1, %g3, %l1
	stx	%g1, [%fp+1799]
	ldd	[%fp+1791], %f8
	ldd	[%fp+1799], %f10
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	call	g1, 0
	 mov	%i0, %o0
	st	%l3, [%fp+1751]
	ld	[%fp+1751], %f8
	st	%i3, [%fp+1767]
	st	%f8, [%fp+1775]
	ld	[%fp+1767], %f8
	st	%l1, [%fp+1751]
	st	%f8, [%fp+1779]
	ld	[%fp+1751], %f8
	ldx	[%fp+1775], %g1
	st	%i5, [%fp+1759]
	st	%f8, [%fp+1783]
	stx	%g1, [%fp+1807]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	ldd	[%fp+1807], %f8
	stx	%g1, [%fp+1815]
	mov	%i2, %o3
	ldd	[%fp+1815], %f10
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	srlx	%l4, 32, %g1
	st	%g1, [%fp+1775]
	srlx	%l2, 32, %g1
	st	%g1, [%fp+1779]
	srlx	%l5, 32, %g1
	st	%g1, [%fp+1783]
	srlx	%l0, 32, %g1
	st	%g1, [%fp+1787]
	ldx	[%fp+1775], %g1
	mov	-1, %i5
	stx	%g1, [%fp+1823]
	sllx	%i5, 32, %i5
	ldx	[%fp+1783], %g1
	lduw	[%fp+1823], %i3
	stx	%g1, [%fp+1831]
	srl	%g1, 0, %l3
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %i3, %g1
	stx	%g1, [%fp+1751]
	lduw	[%fp+1831], %g1
	ldd	[%fp+1751], %f12
	lduw	[%fp+1827], %l1
	fmovd	%f12, %f8
	std	%f12, [%fp+1735]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	sllx	%l1, 32, %l1
	and	%l1, %i5, %l1
	or	%l1, %g1, %l1
	stx	%l1, [%fp+1751]
	call	g1, 0
	 ldd	[%fp+1751], %f10
	st	%l4, [%fp+1751]
	ld	[%fp+1751], %f8
	st	%l2, [%fp+1751]
	st	%f8, [%fp+1775]
	ld	[%fp+1751], %f8
	st	%l5, [%fp+1751]
	st	%f8, [%fp+1779]
	ld	[%fp+1751], %f8
	ldx	[%fp+1775], %g3
	st	%l0, [%fp+1751]
	stx	%g3, [%fp+1839]
	lduw	[%fp+1839], %g2
	st	%f8, [%fp+1783]
	sllx	%g3, 32, %l0
	ld	[%fp+1751], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	stx	%g1, [%fp+1847]
	sllx	%g1, 32, %g1
	and	%g1, %i5, %g1
	or	%g1, %g2, %g1
	srl	%g3, 0, %g2
	stx	%g1, [%fp+1751]
	lduw	[%fp+1847], %g3
	ldd	[%fp+1751], %f14
	stx	%g2, [%fp+1727]
	fmovd	%f14, %f8
	std	%f14, [%fp+1743]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l0, %i5, %l0
	or	%l0, %g3, %l0
	stx	%l0, [%fp+1751]
	call	g2, 0
	 ldd	[%fp+1751], %f10
	mov	%i2, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1783]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	ld	[%fp+1711], %f16
	ld	[%fp+1719], %f17
	st	%f16, [%fp+1779]
	st	%f17, [%fp+1775]
	stx	%g1, [%fp+1863]
	ldx	[%fp+1775], %l4
	lduw	[%fp+1863], %g3
	srl	%l4, 0, %g4
	stx	%l4, [%fp+1855]
	sllx	%l4, 32, %l4
	lduw	[%fp+1855], %g1
	and	%l4, %i5, %l4
	or	%l4, %g3, %g3
	stx	%g3, [%fp+1767]
	stx	%g4, [%fp+1703]
	stx	%g3, [%fp+1751]
	ldd	[%fp+1767], %f8
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	lduw	[%fp+1867], %l7
	stx	%g1, [%fp+1711]
	mov	%i2, %o3
	sllx	%l7, 32, %l7
	and	%l7, %i5, %l7
	or	%l7, %g1, %l7
	stx	%l7, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	srlx	%l1, 32, %g5
	st	%g5, [%fp+1767]
	lduw	[%fp+1803], %o3
	ld	[%fp+1767], %f9
	sllx	%o3, 32, %o7
	st	%l0, [%fp+1767]
	and	%o7, %i5, %o7
	or	%o7, %o3, %g1
	ld	[%fp+1767], %f8
	lduw	[%fp+1791], %o5
	stx	%g1, [%fp+1767]
	sllx	%o5, 32, %g5
	and	%g5, %i5, %g5
	or	%g5, %o5, %g1
	ldd	[%fp+1767], %f0
	st	%f9, [%fp+1775]
	stx	%g1, [%fp+1767]
	st	%f9, [%fp+1779]
	st	%f8, [%fp+1783]
	ldd	[%fp+1775], %f4
	st	%f8, [%fp+1787]
	mov	204, %o4
	ldd	[%fp+1783], %f6
	call	blend_epi16, 0
	 ldd	[%fp+1767], %f2
	std	%f2, [%fp+1759]
	fmovd	%f0, %f8
	ldx	[%fp+1759], %l0
	fmovd	%f2, %f10
	mov	%i2, %o3
	std	%f0, [%fp+1767]
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	sllx	%i3, 32, %i3
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldd	[%fp+1735], %f12
	ldd	[%fp+1743], %f14
	fmovd	%f12, %f4
	mov	192, %o4
	stx	%l1, [%fp+1759]
	ldd	[%fp+1807], %f2
	ldd	[%fp+1759], %f6
	call	blend_epi16, 0
	 fmovd	%f14, %f0
	std	%f0, [%fp+1759]
	ldx	[%fp+1759], %o7
	std	%f2, [%fp+1759]
	and	%o7, %i5, %o5
	ldx	[%fp+1759], %g5
	srlx	%o7, 32, %l6
	srlx	%g5, 32, %l5
	srl	%o7, 0, %o7
	or	%o5, %l5, %g1
	stx	%g1, [%fp+1759]
	ldd	[%fp+1759], %f14
	sllx	%g5, 32, %l2
	fmovd	%f14, %f8
	std	%f14, [%fp+1735]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l2, %i5, %l2
	or	%l2, %o7, %l2
	stx	%l2, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	ldx	[%fp+1727], %g2
	and	%i3, %i5, %i3
	or	%i3, %g2, %g1
	lduw	[%fp+1815], %g2
	stx	%g1, [%fp+1759]
	ldd	[%fp+1759], %f12
	sllx	%g2, 32, %i3
	stx	%g2, [%fp+1719]
	fmovd	%f12, %f8
	std	%f12, [%fp+1743]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%i3, %i5, %i3
	or	%i3, %l3, %i3
	stx	%i3, [%fp+1759]
	call	g2, 0
	 ldd	[%fp+1759], %f10
	srlx	%l7, 32, %l7
	mov	%i2, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1751], %g3
	st	%g3, [%fp+1759]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1779]
	ld	[%fp+1771], %f8
	st	%l0, [%fp+1759]
	st	%f8, [%fp+1783]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g3
	st	%l7, [%fp+1775]
	stx	%g3, [%fp+1895]
	ldx	[%fp+1775], %l3
	lduw	[%fp+1895], %g3
	srl	%l3, 0, %g5
	stx	%l3, [%fp+1887]
	sllx	%l3, 32, %l3
	and	%l3, %i5, %l3
	or	%l3, %g3, %g3
	stx	%g3, [%fp+1759]
	stx	%g5, [%fp+1695]
	stx	%g3, [%fp+1727]
	lduw	[%fp+1887], %l7
	ldd	[%fp+1759], %f8
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	lduw	[%fp+1899], %l1
	sllx	%l1, 32, %l1
	and	%l1, %i5, %l1
	or	%l1, %l7, %l1
	stx	%l1, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	sllx	%l5, 32, %l5
	srlx	%l2, 32, %o7
	st	%o7, [%fp+1759]
	ldx	[%fp+1711], %g1
	ld	[%fp+1759], %f9
	st	%i3, [%fp+1759]
	sllx	%g1, 32, %i3
	and	%i3, %i5, %i3
	or	%i3, %g1, %g1
	ld	[%fp+1759], %f8
	ldx	[%fp+1703], %g4
	stx	%g1, [%fp+1759]
	or	%l4, %g4, %g1
	ldd	[%fp+1759], %f0
	st	%f9, [%fp+1775]
	stx	%g1, [%fp+1759]
	st	%f9, [%fp+1779]
	st	%f8, [%fp+1783]
	ldd	[%fp+1775], %f4
	st	%f8, [%fp+1787]
	mov	204, %o4
	ldd	[%fp+1783], %f6
	call	blend_epi16, 0
	 ldd	[%fp+1759], %f2
	std	%f2, [%fp+1751]
	fmovd	%f0, %f8
	ldx	[%fp+1751], %i3
	fmovd	%f2, %f10
	mov	%i2, %o3
	std	%f0, [%fp+1759]
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	and	%l5, %i5, %l5
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldd	[%fp+1735], %f14
	ldd	[%fp+1743], %f12
	fmovd	%f14, %f4
	ldd	[%fp+1767], %f2
	mov	192, %o4
	stx	%l2, [%fp+1751]
	fmovd	%f12, %f0
	call	blend_epi16, 0
	 ldd	[%fp+1751], %f6
	std	%f0, [%fp+1767]
	ldx	[%fp+1767], %o7
	std	%f2, [%fp+1767]
	srlx	%o7, 32, %g1
	and	%o7, %i5, %o5
	ldx	[%fp+1767], %g4
	srl	%o7, 0, %o7
	srlx	%g4, 32, %l4
	stx	%g1, [%fp+1703]
	or	%o5, %l4, %g1
	stx	%g1, [%fp+1767]
	ldd	[%fp+1767], %f14
	sllx	%g4, 32, %l2
	fmovd	%f14, %f8
	std	%f14, [%fp+1735]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l2, %i5, %l2
	or	%l2, %o7, %l2
	stx	%l2, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	srlx	%l1, 32, %l1
	ldx	[%fp+1719], %g2
	or	%l5, %g2, %g1
	srlx	%l0, 32, %g2
	stx	%g1, [%fp+1767]
	ldd	[%fp+1767], %f12
	stx	%g2, [%fp+1711]
	fmovd	%f12, %f8
	std	%f12, [%fp+1743]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l0, %i5, %l0
	or	%l0, %l6, %l0
	stx	%l0, [%fp+1767]
	call	g2, 0
	 ldd	[%fp+1767], %f10
	sllx	%l4, 32, %l4
	mov	%i2, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1727], %g3
	st	%g3, [%fp+1767]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1779]
	ld	[%fp+1763], %f8
	st	%i3, [%fp+1767]
	st	%f8, [%fp+1783]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g3
	st	%l1, [%fp+1775]
	stx	%g3, [%fp+1927]
	ldx	[%fp+1775], %l5
	lduw	[%fp+1927], %g4
	srl	%l5, 0, %g3
	stx	%l5, [%fp+1919]
	sllx	%l5, 32, %l5
	and	%l5, %i5, %l5
	or	%l5, %g4, %g4
	stx	%g4, [%fp+1767]
	stx	%g3, [%fp+1719]
	stx	%g4, [%fp+1727]
	lduw	[%fp+1919], %l6
	ldd	[%fp+1767], %f8
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	lduw	[%fp+1931], %l1
	sllx	%l1, 32, %l1
	and	%l1, %i5, %l1
	or	%l1, %l6, %l1
	stx	%l1, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	and	%l4, %i5, %l4
	srlx	%l2, 32, %o7
	st	%o7, [%fp+1767]
	sllx	%l7, 32, %o7
	ld	[%fp+1767], %f9
	and	%o7, %i5, %o7
	st	%l0, [%fp+1767]
	or	%o7, %l7, %g1
	ld	[%fp+1767], %f8
	ldx	[%fp+1695], %g5
	stx	%g1, [%fp+1767]
	or	%l3, %g5, %g1
	ldd	[%fp+1767], %f0
	st	%f9, [%fp+1775]
	stx	%g1, [%fp+1767]
	st	%f9, [%fp+1779]
	st	%f8, [%fp+1783]
	ldd	[%fp+1775], %f4
	st	%f8, [%fp+1787]
	mov	204, %o4
	ldd	[%fp+1783], %f6
	call	blend_epi16, 0
	 ldd	[%fp+1767], %f2
	mov	%i2, %o3
	std	%f2, [%fp+1751]
	fmovd	%f0, %f8
	ldx	[%fp+1751], %l0
	fmovd	%f2, %f10
	std	%f0, [%fp+1767]
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldd	[%fp+1735], %f14
	ldd	[%fp+1743], %f12
	fmovd	%f14, %f4
	ldd	[%fp+1759], %f2
	mov	192, %o4
	stx	%l2, [%fp+1751]
	fmovd	%f12, %f0
	call	blend_epi16, 0
	 ldd	[%fp+1751], %f6
	std	%f0, [%fp+1759]
	ldx	[%fp+1759], %o7
	std	%f2, [%fp+1759]
	and	%o7, %i5, %o5
	ldx	[%fp+1759], %g5
	srlx	%o7, 32, %l7
	srlx	%g5, 32, %l3
	srl	%o7, 0, %o7
	or	%o5, %l3, %g1
	stx	%g1, [%fp+1759]
	ldd	[%fp+1759], %f14
	sllx	%g5, 32, %l2
	fmovd	%f14, %f8
	std	%f14, [%fp+1735]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l2, %i5, %l2
	or	%l2, %o7, %l2
	stx	%l2, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	ldx	[%fp+1711], %g2
	or	%l4, %g2, %g1
	stx	%g1, [%fp+1759]
	ldx	[%fp+1703], %g1
	ldd	[%fp+1759], %f12
	mov	%i2, %o3
	fmovd	%f12, %f8
	std	%f12, [%fp+1743]
	srlx	%i3, 32, %l4
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%i3, %i5, %i3
	or	%i3, %g1, %i3
	stx	%i3, [%fp+1759]
	call	g2, 0
	 ldd	[%fp+1759], %f10
	srlx	%l1, 32, %l1
	mov	%i2, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1727], %g4
	st	%g4, [%fp+1759]
	ld	[%fp+1759], %f8
	st	%l0, [%fp+1759]
	st	%f8, [%fp+1779]
	ld	[%fp+1771], %f8
	st	%l1, [%fp+1775]
	st	%f8, [%fp+1783]
	ldx	[%fp+1775], %g2
	ld	[%fp+1759], %f8
	srl	%g2, 0, %g5
	st	%f8, [%fp+1787]
	stx	%g2, [%fp+1951]
	ldx	[%fp+1783], %g1
	lduw	[%fp+1951], %g4
	stx	%g1, [%fp+1959]
	sllx	%g2, 32, %g2
	lduw	[%fp+1959], %o5
	and	%g2, %i5, %g2
	or	%g2, %o5, %o5
	stx	%o5, [%fp+1759]
	stx	%g5, [%fp+1679]
	stx	%g4, [%fp+1695]
	stx	%o5, [%fp+1727]
	stx	%g2, [%fp+1687]
	ldd	[%fp+1759], %f8
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	lduw	[%fp+1963], %l1
	sllx	%l1, 32, %l1
	and	%l1, %i5, %l1
	or	%l1, %g4, %l1
	stx	%l1, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	sllx	%l3, 32, %l3
	srlx	%l2, 32, %g1
	st	%g1, [%fp+1759]
	sllx	%l6, 32, %g1
	ld	[%fp+1759], %f9
	and	%g1, %i5, %g1
	st	%i3, [%fp+1759]
	or	%g1, %l6, %g1
	ld	[%fp+1759], %f8
	ldx	[%fp+1719], %g3
	stx	%g1, [%fp+1759]
	or	%l5, %g3, %g1
	ldd	[%fp+1759], %f0
	st	%f9, [%fp+1775]
	stx	%g1, [%fp+1759]
	st	%f9, [%fp+1779]
	st	%f8, [%fp+1783]
	ldd	[%fp+1775], %f4
	st	%f8, [%fp+1787]
	mov	204, %o4
	ldd	[%fp+1783], %f6
	call	blend_epi16, 0
	 ldd	[%fp+1759], %f2
	mov	%i2, %o3
	std	%f2, [%fp+1751]
	fmovd	%f0, %f8
	ldx	[%fp+1751], %i3
	fmovd	%f2, %f10
	std	%f0, [%fp+1759]
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldd	[%fp+1735], %f14
	ldd	[%fp+1743], %f12
	fmovd	%f14, %f4
	ldd	[%fp+1767], %f2
	mov	192, %o4
	stx	%l2, [%fp+1751]
	fmovd	%f12, %f0
	call	blend_epi16, 0
	 ldd	[%fp+1751], %f6
	std	%f0, [%fp+1767]
	ldx	[%fp+1767], %g3
	std	%f2, [%fp+1767]
	and	%g3, %i5, %o7
	ldx	[%fp+1767], %g1
	srlx	%g3, 32, %l6
	srlx	%g1, 32, %l5
	srl	%g3, 0, %g3
	or	%o7, %l5, %g2
	stx	%g2, [%fp+1767]
	ldd	[%fp+1767], %f14
	sllx	%g1, 32, %l2
	fmovd	%f14, %f8
	std	%f14, [%fp+1735]
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l2, %i5, %l2
	or	%l2, %g3, %l2
	stx	%l2, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	and	%l3, %i5, %l3
	or	%l3, %l4, %g1
	stx	%g1, [%fp+1767]
	ldd	[%fp+1767], %f12
	mov	%i2, %o3
	fmovd	%f12, %f8
	std	%f12, [%fp+1743]
	srlx	%l0, 32, %l4
	mov	%i1, %o2
	and	%l0, %i5, %l0
	mov	%i4, %o1
	or	%l0, %l7, %l7
	mov	%i0, %o0
	stx	%l7, [%fp+1767]
	call	g2, 0
	 ldd	[%fp+1767], %f10
	mov	%i2, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1727], %o5
	st	%o5, [%fp+1767]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1779]
	ld	[%fp+1763], %f8
	st	%i3, [%fp+1767]
	st	%f8, [%fp+1783]
	ld	[%fp+1767], %f8
	st	%f8, [%fp+1787]
	ldx	[%fp+1783], %g1
	srlx	%l1, 32, %l1
	stx	%g1, [%fp+1991]
	st	%l1, [%fp+1775]
	lduw	[%fp+1991], %g1
	ldx	[%fp+1775], %l3
	srl	%l3, 0, %o5
	stx	%l3, [%fp+1983]
	sllx	%l3, 32, %l3
	lduw	[%fp+1983], %g3
	and	%l3, %i5, %l3
	or	%l3, %g1, %g1
	stx	%g1, [%fp+1767]
	stx	%o5, [%fp+1703]
	stx	%g3, [%fp+1711]
	ldd	[%fp+1767], %f8
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	lduw	[%fp+1995], %l1
	stx	%g1, [%fp+1719]
	sllx	%l1, 32, %l1
	and	%l1, %i5, %l1
	or	%l1, %g3, %l1
	stx	%l1, [%fp+1767]
	call	g1, 0
	 ldd	[%fp+1767], %f10
	sllx	%l5, 32, %l5
	srlx	%l2, 32, %o7
	st	%o7, [%fp+1767]
	ldx	[%fp+1695], %g4
	ld	[%fp+1767], %f9
	sllx	%g4, 32, %o7
	st	%l7, [%fp+1767]
	and	%o7, %i5, %o7
	or	%o7, %g4, %g1
	ld	[%fp+1767], %f8
	ldx	[%fp+1687], %g2
	ldx	[%fp+1679], %g5
	stx	%g1, [%fp+1767]
	or	%g2, %g5, %g1
	ldd	[%fp+1767], %f0
	st	%f9, [%fp+1775]
	stx	%g1, [%fp+1767]
	st	%f9, [%fp+1779]
	st	%f8, [%fp+1783]
	ldd	[%fp+1775], %f4
	st	%f8, [%fp+1787]
	mov	204, %o4
	ldd	[%fp+1783], %f6
	call	blend_epi16, 0
	 ldd	[%fp+1767], %f2
	mov	%i2, %o3
	std	%f2, [%fp+1751]
	fmovd	%f0, %f8
	fmovd	%f2, %f10
	std	%f0, [%fp+1767]
	ldx	[%fp+1751], %l7
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldd	[%fp+1735], %f14
	ldd	[%fp+1743], %f12
	fmovd	%f14, %f4
	ldd	[%fp+1759], %f2
	mov	192, %o4
	stx	%l2, [%fp+1751]
	fmovd	%f12, %f0
	call	blend_epi16, 0
	 ldd	[%fp+1751], %f6
	std	%f0, [%fp+1759]
	ldx	[%fp+1759], %g5
	std	%f2, [%fp+1759]
	and	%g5, %i5, %o7
	srlx	%g5, 32, %g2
	ldx	[%fp+1759], %g4
	srl	%g5, 0, %g5
	srlx	%g4, 32, %l2
	or	%o7, %l2, %g1
	stx	%g1, [%fp+1759]
	ldd	[%fp+1759], %f14
	stx	%g2, [%fp+1727]
	fmovd	%f14, %f8
	std	%f14, [%fp+1735]
	sllx	%g4, 32, %l0
	mov	%i2, %o3
	mov	%i1, %o2
	mov	%i4, %o1
	mov	%i0, %o0
	and	%l0, %i5, %l0
	or	%l0, %g5, %l0
	stx	%l0, [%fp+1759]
	call	g1, 0
	 ldd	[%fp+1759], %f10
	and	%l5, %i5, %l5
	or	%l5, %l4, %g1
	stx	%g1, [%fp+1759]
	ldd	[%fp+1759], %f12
	mov	%i2, %o3
	fmovd	%f12, %f8
	std	%f12, [%fp+1743]
	srlx	%i3, 32, %l4
	mov	%i1, %o2
	and	%i3, %i5, %i3
	mov	%i4, %o1
	or	%i3, %l6, %l6
	mov	%i0, %o0
	stx	%l6, [%fp+1759]
	call	g2, 0
	 ldd	[%fp+1759], %f10
	srlx	%l1, 32, %l1
	mov	%i2, %o2
	mov	%i1, %o1
	call	undiagonalize, 0
	 mov	%i0, %o0
	ldx	[%fp+1719], %g1
	st	%g1, [%fp+1759]
	ld	[%fp+1759], %f8
	st	%f8, [%fp+1779]
	ld	[%fp+1771], %f8
	st	%l7, [%fp+1759]
	st	%f8, [%fp+1783]
	st	%l1, [%fp+1775]
	ld	[%fp+1759], %f8
	ldx	[%fp+1775], %g1
	st	%f8, [%fp+1787]
	stx	%g1, [%fp+2015]
	ldx	[%fp+1783], %g4
	sllx	%g1, 32, %g1
	stx	%g4, [%fp+2023]
	and	%g1, %i5, %g1
	lduw	[%fp+2023], %i3
	or	%g1, %i3, %g1
	lduw	[%fp+2015], %g5
	stx	%g1, [%fp+1759]
	lduw	[%fp+2027], %g4
	sllx	%g4, 32, %g4
	and	%g4, %i5, %g4
	or	%g4, %g5, %g1
	ldd	[%fp+1759], %f8
	mov	%i2, %o3
	stx	%g1, [%fp+1759]
	mov	%i1, %o2
	ldd	[%fp+1759], %f10
	mov	%i4, %o1
	call	g1, 0
	 mov	%i0, %o0
	srlx	%l0, 32, %g1
	st	%g1, [%fp+1759]
	ldx	[%fp+1711], %g3
	ld	[%fp+1759], %f9
	sllx	%g3, 32, %g1
	st	%l6, [%fp+1759]
	and	%g1, %i5, %g1
	or	%g1, %g3, %g1
	ld	[%fp+1759], %f8
	ldx	[%fp+1703], %o5
	stx	%g1, [%fp+1759]
	or	%l3, %o5, %g1
	ldd	[%fp+1759], %f0
	st	%f9, [%fp+1775]
	stx	%g1, [%fp+1759]
	st	%f9, [%fp+1779]
	st	%f8, [%fp+1783]
	ldd	[%fp+1775], %f4
	st	%f8, [%fp+1787]
	mov	204, %o4
	ldd	[%fp+1783], %f6
	call	blend_epi16, 0
	 ldd	[%fp+1759], %f2
	fmovd	%f0, %f8
	fmovd	%f2, %f10
	mov	%i2, %o3
	std	%f0, [%fp+1759]
	std	%f2, [%fp+1751]
	mov	%i1, %o2
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	mov	%i2, %o2
	mov	%i1, %o1
	call	diagonalize, 0
	 mov	%i0, %o0
	ldd	[%fp+1735], %f14
	ldd	[%fp+1743], %f12
	ldd	[%fp+1767], %f2
	mov	192, %o4
	fmovd	%f14, %f4
	stx	%l0, [%fp+1759]
	fmovd	%f12, %f0
	call	blend_epi16, 0
	 ldd	[%fp+1759], %f6
	std	%f0, [%fp+1767]
	ldx	[%fp+1767], %g3
	std	%f2, [%fp+1767]
	and	%g3, %i5, %g5
	ldx	[%fp+1767], %g1
	srl	%g3, 0, %g3
	srlx	%g1, 32, %g4
	sllx	%g1, 32, %g1
	or	%g5, %g4, %g2
	and	%g1, %i5, %g1
	stx	%g2, [%fp+1767]
	or	%g1, %g3, %g1
	ldd	[%fp+1767], %f8
	mov	%i2, %o3
	stx	%g1, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%i4, %o1
	call	g1, 0
	 mov	%i0, %o0
	sllx	%l2, 32, %l2
	and	%l2, %i5, %l2
	or	%l2, %l4, %g1
	and	%l7, %i5, %i5
	stx	%g1, [%fp+1767]
	ldx	[%fp+1727], %g2
	or	%i5, %g2, %g1
	ldd	[%fp+1767], %f8
	mov	%i2, %o3
	stx	%g1, [%fp+1767]
	mov	%i1, %o2
	ldd	[%fp+1767], %f10
	mov	%i4, %o1
	call	g2, 0
	 mov	%i0, %o0
	call	undiagonalize, 0
	 restore
	.size	compress_pre, .-compress_pre
	.align 4
	.global _blake3_compress_in_place_sse2
	.type	_blake3_compress_in_place_sse2, #function
	.proc	020
_blake3_compress_in_place_sse2:
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
	.size	_blake3_compress_in_place_sse2, .-_blake3_compress_in_place_sse2
	.align 4
	.global _blake3_compress_xof_sse2
	.type	_blake3_compress_xof_sse2, #function
	.proc	020
_blake3_compress_xof_sse2:
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
	.size	_blake3_compress_xof_sse2, .-_blake3_compress_xof_sse2
	.align 4
	.type	round_fn, #function
	.proc	020
round_fn:
	save	%sp, -464, %sp
	sllx	%i2, 4, %g4
	sethi	%hi(_GLOBAL_OFFSET_TABLE_-4), %l7
	call	__sparc_get_pc_thunk.l7
	 add	%l7, %lo(_GLOBAL_OFFSET_TABLE_+4), %l7
	sethi	%gdop_hix22(MSG_SCHEDULE), %i3
	xor	%i3, %gdop_lox10(MSG_SCHEDULE), %i3
	ldx	[%l7 + %i3], %i3, %gdop(MSG_SCHEDULE)
	ldub	[%i3+%g4], %g1
	sllx	%g1, 4, %g1
	ldx	[%i1+%g1], %g2
	add	%i1, %g1, %g3
	ldx	[%i0], %l4
	ldx	[%g3+8], %g1
	srax	%l4, 32, %o7
	srax	%g2, 32, %g3
	add	%l4, %g2, %l4
	srax	%g1, 32, %g2
	ldx	[%i0+8], %l3
	srax	%l3, 32, %l6
	add	%l6, %g2, %l6
	srl	%l4, 0, %g2
	add	%l3, %g1, %l3
	add	%o7, %g3, %o7
	srl	%l3, 0, %g5
	sllx	%o7, 32, %g3
	mov	-1, %o4
	sllx	%o4, 32, %g1
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%l6, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g5, %g2
	add	%i3, %g4, %i3
	stx	%g2, [%i0+8]
	ldub	[%i3+2], %g2
	sllx	%g2, 4, %g2
	stx	%g3, [%i0]
	add	%i1, %g2, %g4
	ldx	[%i1+%g2], %g3
	ldx	[%g4+8], %g2
	ldx	[%i0+16], %i4
	ldx	[%i0+24], %l1
	srax	%g3, 32, %g4
	srax	%i4, 32, %l5
	srax	%l1, 32, %o1
	add	%i4, %g3, %i4
	add	%l1, %g2, %l1
	srax	%g2, 32, %g3
	srl	%i4, 0, %g2
	add	%l5, %g4, %l5
	add	%o1, %g3, %o1
	srl	%l1, 0, %g4
	sllx	%l5, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%o1, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g4, %g2
	stx	%g2, [%i0+24]
	ldub	[%i3+4], %g2
	sllx	%g2, 4, %g2
	stx	%g3, [%i0+16]
	add	%i1, %g2, %g5
	ldx	[%i1+%g2], %g3
	ldx	[%g5+8], %g2
	ldx	[%i0+32], %g4
	ldx	[%i0+40], %o0
	srax	%g3, 32, %g5
	srax	%g4, 32, %o2
	srax	%o0, 32, %o3
	add	%g4, %g3, %g4
	add	%o0, %g2, %o0
	srax	%g2, 32, %g3
	srl	%g4, 0, %g2
	add	%o2, %g5, %o2
	add	%o3, %g3, %o3
	srl	%o0, 0, %g5
	sllx	%o2, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%o3, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g5, %g2
	stx	%g2, [%i0+40]
	ldub	[%i3+6], %g2
	sllx	%g2, 4, %g2
	add	%i1, %g2, %i5
	stx	%g3, [%i0+32]
	ldx	[%i1+%g2], %g3
	ldx	[%i5+8], %g2
	ldx	[%i0+64], %i5
	srax	%i5, 32, %i5
	add	%o7, %i5, %o7
	ldx	[%i0+64], %i5
	add	%l4, %i5, %l4
	ldx	[%i0+72], %i5
	srax	%i5, 32, %i5
	stx	%i2, [%fp+1767]
	add	%l6, %i5, %l6
	srl	%l4, 0, %i2
	ldx	[%i0+72], %i5
	stx	%l7, [%fp+1967]
	add	%l3, %i5, %l7
	sllx	%o7, 32, %i5
	and	%i5, %g1, %i5
	or	%i5, %i2, %i5
	srl	%l7, 0, %i2
	ldx	[%i0+56], %g5
	ldx	[%i0+48], %o5
	sllx	%l6, 32, %l2
	stx	%i5, [%i0]
	and	%l2, %g1, %l2
	or	%l2, %i2, %l2
	ldx	[%i0+80], %i2
	srax	%i2, 32, %i2
	add	%l5, %i2, %i2
	st	%i2, [%fp+1963]
	ldx	[%i0+80], %i2
	add	%i4, %i2, %i4
	st	%i4, [%fp+1951]
	ldx	[%i0+88], %i4
	srax	%i4, 32, %i4
	add	%o1, %i4, %i4
	st	%i4, [%fp+1947]
	ldx	[%i0+88], %i4
	add	%l1, %i4, %i4
	st	%i4, [%fp+1935]
	ldx	[%fp+1959], %i4
	sllx	%i4, 32, %l1
	lduw	[%fp+1951], %i4
	ldx	[%i0+96], %l3
	and	%l1, %g1, %l1
	add	%g4, %l3, %g4
	or	%l1, %i4, %l1
	ldx	[%fp+1943], %i4
	ldx	[%i0+104], %l5
	st	%g4, [%fp+1919]
	sllx	%i4, 32, %l0
	srax	%l5, 32, %g4
	lduw	[%fp+1935], %i4
	add	%o3, %g4, %g4
	and	%l0, %g1, %l0
	st	%g4, [%fp+1915]
	or	%l0, %i4, %l0
	add	%o0, %l5, %g4
	srax	%l3, 32, %i4
	add	%o2, %i4, %i4
	st	%g4, [%fp+1903]
	st	%i4, [%fp+1931]
	lduw	[%fp+1919], %i4
	ldx	[%fp+1927], %g4
	ldx	[%i0+112], %i2
	srax	%o5, 32, %o2
	sllx	%g4, 32, %o0
	srax	%g3, 32, %o3
	and	%o0, %g1, %o0
	add	%o5, %g3, %o5
	or	%o0, %i4, %g4
	add	%o5, %i2, %g3
	ldx	[%fp+1911], %i4
	st	%g3, [%fp+1891]
	sllx	%i4, 32, %o1
	srax	%g5, 32, %g3
	lduw	[%fp+1903], %i4
	stx	%l2, [%i0+8]
	stx	%l1, [%i0+16]
	stx	%l0, [%i0+24]
	and	%o1, %g1, %o1
	stx	%g4, [%i0+32]
	or	%o1, %i4, %o1
	add	%o2, %o3, %o3
	ldx	[%i0+120], %i4
	srax	%i2, 32, %o2
	stx	%o1, [%i0+40]
	add	%o3, %o2, %o3
	srax	%g2, 32, %o5
	st	%o3, [%fp+1899]
	add	%g3, %o5, %o5
	add	%g5, %g2, %g2
	srax	%i4, 32, %g3
	add	%g2, %i4, %g2
	add	%o5, %g3, %g3
	st	%g3, [%fp+1883]
	st	%g2, [%fp+1887]
	ldx	[%fp+1895], %g2
	sllx	%g2, 32, %o2
	lduw	[%fp+1891], %g2
	and	%o2, %g1, %o2
	or	%o2, %g2, %g3
	ldx	[%fp+1879], %g2
	sllx	%g2, 32, %g5
	lduw	[%fp+1887], %g2
	and	%g5, %g1, %g5
	or	%g5, %g2, %g5
	ldx	[%i0+192], %g2
	xor	%g2, %i5, %i5
	ldx	[%i0+208], %g2
	ldx	[%i0+200], %o5
	xor	%g2, %l1, %l1
	ldx	[%i0+232], %g2
	xor	%o5, %l2, %l2
	xor	%g2, %o1, %o1
	ldx	[%i0+216], %o5
	ldx	[%i0+248], %g2
	ldx	[%i0+240], %o2
	stx	%g3, [%i0+48]
	xor	%o2, %g3, %o2
	srlx	%i5, 48, %g3
	sllx	%g3, 32, %g3
	xor	%o5, %l0, %l0
	stx	%g5, [%i0+56]
	sethi	%hi(67107840), %o5
	xor	%g2, %g5, %g5
	sllx	%o5, 22, %o5
	sllx	%i5, 16, %g2
	xnor	%g0, %o5, %o5
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %o5, %g2
	or	%g2, %g3, %g2
	sllx	%i5, 48, %g3
	srlx	%g3, 32, %g3
	sllx	%o4, 16, %o4
	sethi	%hi(4294901760), %o3
	sllx	%i5, 32, %i5
	xnor	%g0, %o3, %o3
	srlx	%i5, 48, %i5
	and	%g2, %o3, %g2
	or	%g2, %g3, %g2
	srlx	%l2, 48, %g3
	and	%g2, %o4, %g2
	sllx	%g3, 32, %g3
	or	%g2, %i5, %g2
	stx	%g2, [%fp+2007]
	sllx	%l2, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %o5, %g2
	or	%g2, %g3, %g2
	sllx	%l2, 48, %g3
	and	%g2, %o3, %g2
	srlx	%g3, 32, %g3
	sllx	%l2, 32, %l2
	or	%g2, %g3, %g2
	srlx	%l2, 48, %l2
	and	%g2, %o4, %g2
	or	%g2, %l2, %g2
	stx	%g2, [%fp+1999]
	ldx	[%fp+2007], %g2
	srlx	%l1, 48, %g3
	stx	%g2, [%i0+192]
	sllx	%g3, 32, %g3
	ldx	[%fp+1999], %g2
	stx	%g2, [%i0+200]
	sllx	%l1, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %o5, %g2
	or	%g2, %g3, %g2
	sllx	%l1, 48, %g3
	srlx	%g3, 32, %g3
	and	%g2, %o3, %g2
	sllx	%l1, 32, %l1
	or	%g2, %g3, %g2
	srlx	%l1, 48, %l1
	and	%g2, %o4, %g2
	srlx	%l0, 48, %g3
	or	%g2, %l1, %g2
	sllx	%g3, 32, %g3
	stx	%g2, [%fp+1991]
	sllx	%l0, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %o5, %g2
	or	%g2, %g3, %g2
	sllx	%l0, 48, %g3
	and	%g2, %o3, %g2
	srlx	%g3, 32, %g3
	sllx	%l0, 32, %l0
	or	%g2, %g3, %g2
	srlx	%l0, 48, %l0
	and	%g2, %o4, %g2
	or	%g2, %l0, %g2
	stx	%g2, [%fp+1983]
	ldx	[%fp+1991], %g2
	ldx	[%i0+224], %o0
	stx	%g2, [%i0+208]
	xor	%o0, %g4, %o0
	ldx	[%fp+1983], %g2
	sllx	%o0, 48, %g3
	srlx	%g3, 32, %g3
	stx	%g2, [%i0+216]
	srlx	%o0, 48, %g4
	sllx	%o0, 16, %g2
	sllx	%g4, 32, %g4
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %o5, %g2
	or	%g2, %g4, %g2
	and	%g2, %o3, %g2
	or	%g2, %g3, %g2
	srlx	%o1, 48, %g3
	and	%g2, %o4, %g2
	sllx	%g3, 32, %g3
	sllx	%o0, 32, %o0
	srlx	%o0, 48, %o0
	or	%g2, %o0, %g4
	sllx	%o1, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %o5, %g2
	or	%g2, %g3, %g2
	sllx	%o1, 48, %g3
	and	%g2, %o3, %g2
	srlx	%g3, 32, %g3
	sllx	%o1, 32, %o1
	or	%g2, %g3, %g2
	srlx	%o1, 48, %o1
	and	%g2, %o4, %g2
	or	%g2, %o1, %g2
	srlx	%o2, 48, %g3
	stx	%g2, [%fp+1975]
	stx	%g2, [%i0+232]
	sllx	%g3, 32, %g3
	sllx	%o2, 16, %g2
	sllx	%o2, 48, %i5
	srlx	%g2, 48, %g2
	srlx	%i5, 32, %i5
	sllx	%g2, 48, %g2
	sllx	%o2, 32, %o2
	and	%g2, %o5, %g2
	srlx	%o2, 48, %o2
	or	%g2, %g3, %g2
	and	%g2, %o3, %g2
	or	%g2, %i5, %g2
	and	%g2, %o4, %g2
	sllx	%g5, 16, %i5
	or	%g2, %o2, %g3
	srlx	%i5, 48, %i5
	srlx	%g5, 48, %g2
	sllx	%g5, 48, %o2
	sllx	%i5, 48, %i5
	sllx	%g5, 32, %g5
	and	%i5, %o5, %i5
	srlx	%g5, 48, %g5
	stx	%g4, [%i0+224]
	srlx	%o2, 32, %o2
	stx	%g3, [%i0+240]
	sllx	%g2, 32, %g2
	or	%i5, %g2, %g2
	ldx	[%i0+128], %i5
	and	%g2, %o3, %g2
	or	%g2, %o2, %g2
	and	%g2, %o4, %g2
	srax	%i5, 32, %o4
	or	%g2, %g5, %g2
	stx	%g2, [%i0+248]
	ldx	[%i0+136], %g5
	ldx	[%fp+2007], %o5
	srax	%o5, 32, %o5
	add	%o4, %o5, %o5
	st	%o5, [%fp+1875]
	ldx	[%fp+2007], %o5
	add	%i5, %o5, %i5
	srax	%g5, 32, %o5
	st	%i5, [%fp+1867]
	ldx	[%fp+1999], %i5
	srax	%i5, 32, %i5
	add	%o5, %i5, %i5
	st	%i5, [%fp+1859]
	ldx	[%fp+1999], %i5
	add	%g5, %i5, %g5
	st	%g5, [%fp+1863]
	ldx	[%fp+1871], %g5
	sllx	%g5, 32, %l1
	lduw	[%fp+1867], %g5
	ldx	[%i0+144], %i5
	and	%l1, %g1, %l1
	srax	%i5, 32, %o4
	or	%l1, %g5, %l1
	ldx	[%fp+1991], %o5
	ldx	[%fp+1855], %g5
	srax	%o5, 32, %o5
	add	%o4, %o5, %o5
	sllx	%g5, 32, %l0
	st	%o5, [%fp+1851]
	lduw	[%fp+1863], %g5
	ldx	[%fp+1991], %o5
	add	%i5, %o5, %i5
	and	%l0, %g1, %l0
	st	%i5, [%fp+1843]
	or	%l0, %g5, %l0
	ldx	[%fp+1983], %i5
	ldx	[%i0+152], %g5
	srax	%i5, 32, %i5
	srax	%g5, 32, %o5
	add	%o5, %i5, %i5
	st	%i5, [%fp+1835]
	ldx	[%fp+1983], %i5
	add	%g5, %i5, %g5
	st	%g5, [%fp+1839]
	ldx	[%fp+1847], %g5
	sllx	%g5, 32, %o2
	lduw	[%fp+1843], %g5
	and	%o2, %g1, %o2
	or	%o2, %g5, %o2
	ldx	[%fp+1831], %g5
	ldx	[%i0+160], %i5
	sllx	%g5, 32, %o3
	srax	%i5, 32, %o4
	lduw	[%fp+1839], %g5
	add	%i5, %g4, %i5
	srax	%g4, 32, %o5
	add	%o4, %o5, %o5
	stx	%l1, [%i0+128]
	stx	%l0, [%i0+136]
	and	%o3, %g1, %o3
	stx	%o2, [%i0+144]
	or	%o3, %g5, %o3
	stx	%o3, [%i0+152]
	ldx	[%i0+168], %g5
	st	%o5, [%fp+1827]
	st	%i5, [%fp+1819]
	srax	%g5, 32, %o5
	ldx	[%fp+1975], %i5
	srax	%i5, 32, %i5
	add	%o5, %i5, %i5
	st	%i5, [%fp+1811]
	ldx	[%fp+1975], %i5
	add	%g5, %i5, %g5
	st	%g5, [%fp+1815]
	ldx	[%fp+1823], %g5
	sllx	%g5, 32, %o4
	lduw	[%fp+1819], %g5
	and	%o4, %g1, %o4
	or	%o4, %g5, %o4
	ldx	[%fp+1807], %g5
	ldx	[%i0+176], %i5
	sllx	%g5, 32, %o5
	srax	%i5, 32, %o0
	lduw	[%fp+1815], %g5
	srax	%g3, 32, %o1
	add	%o0, %o1, %o1
	and	%o5, %g1, %o5
	st	%o1, [%fp+1803]
	or	%o5, %g5, %o5
	ldx	[%i0+184], %g5
	srax	%g5, 32, %o1
	add	%g5, %g2, %g5
	add	%i5, %g3, %i5
	st	%g5, [%fp+1791]
	ldx	[%fp+1799], %g5
	st	%i5, [%fp+1795]
	sllx	%g5, 32, %o0
	srax	%g2, 32, %i5
	lduw	[%fp+1795], %g5
	add	%o1, %i5, %i5
	and	%o0, %g1, %o0
	st	%i5, [%fp+1787]
	or	%o0, %g5, %i5
	ldx	[%fp+1783], %g5
	sllx	%g5, 32, %o1
	and	%o1, %g1, %o1
	lduw	[%fp+1791], %o0
	or	%o1, %o0, %g5
	ldx	[%i0+64], %o1
	xor	%o1, %l1, %l1
	ldx	[%i0+72], %o1
	xor	%o1, %l0, %l0
	ldx	[%i0+80], %o1
	xor	%o1, %o2, %o2
	ldx	[%i0+88], %o1
	stx	%g5, [%i0+184]
	xor	%o1, %o3, %o3
	xor	%i4, %g5, %o1
	srl	%l1, 12, %g5
	srlx	%l1, 12, %i4
	and	%i4, %g1, %i4
	or	%i4, %g5, %i4
	srl	%l0, 12, %g5
	xor	%i2, %i5, %o0
	stx	%i5, [%i0+176]
	srlx	%l0, 12, %i5
	and	%i5, %g1, %i5
	or	%i5, %g5, %i5
	srax	%l1, 32, %g5
	sllx	%g5, 52, %g5
	and	%g5, %g1, %g5
	sll	%l1, 20, %l1
	srl	%l1, 0, %l1
	or	%g5, %l1, %l1
	xor	%i4, %l1, %g5
	srax	%l0, 32, %i2
	stx	%g5, [%fp+2039]
	sllx	%i2, 52, %i2
	sll	%l0, 20, %l0
	and	%i2, %g1, %i2
	srl	%l0, 0, %l0
	or	%i2, %l0, %l0
	xor	%i5, %l0, %g5
	stx	%o4, [%i0+160]
	stx	%o5, [%i0+168]
	stx	%g5, [%fp+2031]
	ldx	[%fp+2039], %g5
	stx	%g5, [%i0+64]
	ldx	[%fp+2031], %g5
	stx	%g5, [%i0+72]
	srl	%o2, 12, %g5
	srlx	%o2, 12, %i4
	and	%i4, %g1, %i4
	or	%i4, %g5, %i4
	srl	%o3, 12, %g5
	srlx	%o3, 12, %i5
	and	%i5, %g1, %i5
	or	%i5, %g5, %i5
	srax	%o2, 32, %g5
	sllx	%g5, 52, %g5
	and	%g5, %g1, %g5
	sll	%o2, 20, %o2
	srl	%o2, 0, %o2
	or	%g5, %o2, %o2
	xor	%i4, %o2, %g5
	srax	%o3, 32, %i2
	stx	%g5, [%fp+2023]
	sllx	%i2, 52, %i2
	sll	%o3, 20, %o3
	and	%i2, %g1, %i2
	srl	%o3, 0, %o3
	or	%i2, %o3, %o3
	xor	%i5, %o3, %g5
	stx	%g5, [%fp+2015]
	ldx	[%fp+2023], %g5
	stx	%g5, [%i0+80]
	ldx	[%fp+2015], %g5
	xor	%l3, %o4, %o4
	stx	%g5, [%i0+88]
	srl	%o4, 12, %g5
	xor	%l5, %o5, %o5
	srlx	%o4, 12, %i2
	and	%i2, %g1, %i2
	or	%i2, %g5, %i2
	srl	%o5, 12, %g5
	srlx	%o5, 12, %i4
	srax	%o5, 32, %i5
	and	%i4, %g1, %i4
	sllx	%i5, 52, %i5
	or	%i4, %g5, %i4
	and	%i5, %g1, %i5
	srax	%o4, 32, %g5
	sll	%o5, 20, %o5
	sllx	%g5, 52, %g5
	srl	%o5, 0, %o5
	and	%g5, %g1, %g5
	or	%i5, %o5, %o5
	sll	%o4, 20, %o4
	xor	%i4, %o5, %i4
	srl	%o4, 0, %o4
	srl	%o1, 12, %o5
	or	%g5, %o4, %o4
	srl	%o0, 12, %g5
	srlx	%o0, 12, %i5
	and	%i5, %g1, %i5
	or	%i5, %g5, %i5
	srlx	%o1, 12, %g5
	and	%g5, %g1, %g5
	or	%g5, %o5, %g5
	srax	%o0, 32, %o5
	sllx	%o5, 52, %o5
	and	%o5, %g1, %o5
	sll	%o0, 20, %o0
	srl	%o0, 0, %o0
	or	%o5, %o0, %o0
	srax	%o1, 32, %o5
	sllx	%o5, 52, %o5
	and	%o5, %g1, %o5
	stx	%i4, [%i0+104]
	xor	%i2, %o4, %i2
	xor	%i5, %o0, %i5
	stx	%i2, [%i0+96]
	stx	%i5, [%i0+112]
	sll	%o1, 20, %o1
	srl	%o1, 0, %o1
	or	%o5, %o1, %o1
	ldub	[%i3+1], %o5
	xor	%g5, %o1, %g5
	sllx	%o5, 4, %o5
	stx	%g5, [%i0+120]
	add	%i1, %o5, %o4
	ldx	[%i1+%o5], %o5
	ldx	[%o4+8], %l3
	add	%l4, %o5, %l4
	srax	%o5, 32, %o4
	srax	%l3, 32, %o5
	add	%l6, %o5, %l6
	srl	%l4, 0, %o5
	add	%l7, %l3, %l3
	add	%o7, %o4, %o7
	srl	%l3, 0, %o3
	sllx	%o7, 32, %o4
	and	%o4, %g1, %o4
	or	%o4, %o5, %o4
	sllx	%l6, 32, %o5
	and	%o5, %g1, %o5
	or	%o5, %o3, %o5
	stx	%o4, [%i0]
	stx	%o5, [%i0+8]
	ldub	[%i3+3], %o4
	sllx	%o4, 4, %o4
	add	%i1, %o4, %o5
	ldx	[%o5+8], %l1
	lduw	[%fp+1963], %o5
	ldx	[%i1+%o4], %l2
	srax	%l2, 32, %l5
	add	%o5, %l5, %l5
	lduw	[%fp+1951], %o5
	add	%o5, %l2, %l2
	lduw	[%fp+1947], %o5
	srax	%l1, 32, %o1
	add	%o5, %o1, %o1
	lduw	[%fp+1935], %o5
	add	%o5, %l1, %l1
	srl	%l2, 0, %o5
	srl	%l1, 0, %o3
	sllx	%l5, 32, %o4
	and	%o4, %g1, %o4
	or	%o4, %o5, %o4
	sllx	%o1, 32, %o5
	and	%o5, %g1, %o5
	or	%o5, %o3, %o5
	stx	%o4, [%i0+16]
	stx	%o5, [%i0+24]
	ldub	[%i3+5], %o4
	sllx	%o4, 4, %o4
	add	%i1, %o4, %o5
	ldx	[%o5+8], %o0
	lduw	[%fp+1931], %o5
	ldx	[%i1+%o4], %l0
	srax	%l0, 32, %o2
	add	%o5, %o2, %o2
	lduw	[%fp+1919], %o5
	add	%o5, %l0, %l0
	lduw	[%fp+1915], %o5
	srax	%o0, 32, %o3
	add	%o5, %o3, %o3
	lduw	[%fp+1903], %o5
	sllx	%o2, 32, %o4
	add	%o5, %o0, %o0
	and	%o4, %g1, %o4
	srl	%l0, 0, %o5
	or	%o4, %o5, %o4
	stx	%o4, [%i0+32]
	ldx	[%fp+2039], %o4
	srax	%o4, 32, %o4
	add	%o7, %o4, %o7
	st	%o7, [%fp+1963]
	ldx	[%fp+2039], %o7
	add	%l4, %o7, %l4
	ldx	[%fp+2031], %o7
	srax	%o7, 32, %o7
	add	%l6, %o7, %l6
	ldx	[%fp+2031], %o7
	add	%l3, %o7, %o7
	st	%o7, [%fp+1951]
	ldx	[%fp+1959], %o7
	lduw	[%fp+1951], %l3
	sllx	%o7, 32, %o4
	srl	%l4, 0, %o7
	and	%o4, %g1, %o4
	or	%o4, %o7, %o4
	sllx	%l6, 32, %o7
	and	%o7, %g1, %o7
	or	%o7, %l3, %o7
	ldx	[%fp+2023], %l3
	srax	%l3, 32, %l3
	add	%l5, %l3, %l3
	st	%l3, [%fp+1947]
	ldx	[%fp+2023], %l3
	add	%l2, %l3, %l2
	st	%l2, [%fp+1935]
	ldx	[%fp+2015], %l2
	srax	%l2, 32, %l2
	add	%o1, %l2, %o1
	st	%o1, [%fp+1931]
	ldx	[%fp+2015], %o1
	add	%l1, %o1, %o1
	st	%o1, [%fp+1919]
	ldx	[%fp+1943], %o1
	sllx	%o1, 32, %l2
	lduw	[%fp+1935], %o1
	and	%l2, %g1, %l2
	or	%l2, %o1, %l2
	ldx	[%fp+1927], %o1
	sllx	%o1, 32, %l1
	lduw	[%fp+1919], %o1
	srl	%o0, 0, %l7
	sllx	%o3, 32, %o5
	and	%l1, %g1, %l1
	and	%o5, %g1, %o5
	or	%l1, %o1, %l1
	or	%o5, %l7, %o5
	srax	%i4, 32, %o1
	add	%o3, %o1, %o3
	stx	%o5, [%i0+40]
	srax	%i2, 32, %l5
	ldub	[%i3+7], %o5
	add	%o2, %l5, %l5
	sllx	%o5, 4, %o5
	add	%l0, %i2, %o2
	add	%i1, %o5, %i3
	st	%o2, [%fp+1911]
	ldx	[%i1+%o5], %o5
	ldx	[%i3+8], %i3
	st	%o3, [%fp+1907]
	stx	%o4, [%i0]
	add	%o0, %i4, %o3
	stx	%o7, [%i0+8]
	stx	%l2, [%i0+16]
	stx	%l1, [%i0+24]
	sllx	%l5, 32, %o1
	st	%o3, [%fp+1779]
	srl	%o2, 0, %o3
	and	%o1, %g1, %o1
	or	%o1, %o3, %o1
	ldx	[%fp+1903], %o3
	lduw	[%fp+1899], %o0
	sllx	%o3, 32, %o2
	lduw	[%fp+1779], %o3
	and	%o2, %g1, %o2
	or	%o2, %o3, %o2
	srax	%o5, 32, %o3
	add	%o0, %o3, %o3
	srax	%i5, 32, %o0
	add	%o3, %o0, %o3
	st	%o3, [%fp+1899]
	lduw	[%fp+1891], %o3
	add	%o3, %o5, %o5
	lduw	[%fp+1883], %o3
	add	%o5, %i5, %o5
	st	%o5, [%fp+1891]
	srax	%i3, 32, %o5
	add	%o3, %o5, %o5
	srax	%g5, 32, %o3
	add	%o5, %o3, %o5
	st	%o5, [%fp+1883]
	lduw	[%fp+1887], %o5
	add	%o5, %i3, %i3
	add	%i3, %g5, %i3
	st	%i3, [%fp+1887]
	ldx	[%fp+1895], %i3
	lduw	[%fp+1887], %o3
	sllx	%i3, 32, %o5
	lduw	[%fp+1891], %i3
	and	%o5, %g1, %o5
	or	%o5, %i3, %o5
	ldx	[%fp+1879], %i3
	sllx	%i3, 32, %i3
	and	%i3, %g1, %i3
	or	%i3, %o3, %i3
	ldx	[%fp+2007], %o3
	xor	%o4, %o3, %o4
	ldx	[%fp+1999], %o3
	xor	%o7, %o3, %o7
	ldx	[%fp+1991], %o3
	xor	%l2, %o3, %l2
	ldx	[%fp+1983], %o3
	xor	%i3, %g2, %g2
	xor	%l1, %o3, %l1
	stx	%i3, [%i0+56]
	ldx	[%fp+1975], %o3
	srl	%o4, 8, %i3
	stx	%o2, [%i0+40]
	xor	%o2, %o3, %o2
	srlx	%o4, 8, %o3
	and	%o3, %g1, %o3
	or	%o3, %i3, %o3
	srl	%o7, 8, %i3
	xor	%o5, %g3, %g3
	stx	%o5, [%i0+48]
	srlx	%o7, 8, %o5
	and	%o5, %g1, %o5
	or	%o5, %i3, %o5
	srax	%o4, 32, %i3
	sllx	%i3, 56, %i3
	and	%i3, %g1, %i3
	sll	%o4, 24, %o4
	srl	%o4, 0, %o4
	or	%i3, %o4, %o4
	xor	%o3, %o4, %i3
	xor	%o1, %g4, %g4
	stx	%i3, [%fp+2007]
	stx	%o1, [%i0+32]
	srax	%o7, 32, %o1
	sll	%o7, 24, %o7
	sllx	%o1, 56, %o1
	srl	%o7, 0, %o7
	and	%o1, %g1, %o1
	or	%o1, %o7, %o7
	xor	%o5, %o7, %i3
	stx	%i3, [%fp+1999]
	ldx	[%fp+2007], %i3
	stx	%i3, [%i0+192]
	ldx	[%fp+1999], %i3
	stx	%i3, [%i0+200]
	srl	%l2, 8, %i3
	srlx	%l2, 8, %o3
	and	%o3, %g1, %o3
	or	%o3, %i3, %o3
	srl	%l1, 8, %i3
	srlx	%l1, 8, %o7
	and	%o7, %g1, %o7
	or	%o7, %i3, %o7
	srax	%l2, 32, %i3
	sllx	%i3, 56, %i3
	and	%i3, %g1, %i3
	srax	%l1, 32, %o5
	sll	%l2, 24, %l2
	sllx	%o5, 56, %o5
	srl	%l2, 0, %l2
	and	%o5, %g1, %o5
	or	%i3, %l2, %l2
	sll	%l1, 24, %l1
	srl	%l1, 0, %l1
	or	%o5, %l1, %l1
	xor	%o7, %l1, %i3
	stx	%i3, [%fp+1991]
	stx	%i3, [%i0+216]
	srl	%g4, 8, %i3
	srlx	%g4, 8, %o4
	srax	%g4, 32, %o7
	and	%o4, %g1, %o4
	sllx	%o7, 56, %o7
	or	%o4, %i3, %o4
	and	%o7, %g1, %o7
	srl	%o2, 8, %i3
	sll	%g4, 24, %g4
	srl	%g4, 0, %g4
	or	%o7, %g4, %g4
	srlx	%o2, 8, %l7
	xor	%o4, %g4, %o4
	and	%l7, %g1, %l7
	srl	%g3, 8, %g4
	or	%l7, %i3, %l7
	srax	%o2, 32, %i3
	sll	%o2, 24, %o2
	sllx	%i3, 56, %i3
	srl	%o2, 0, %o2
	and	%i3, %g1, %i3
	or	%i3, %o2, %o2
	xor	%l7, %o2, %l7
	srlx	%g3, 8, %o2
	and	%o2, %g1, %o2
	or	%o2, %g4, %o2
	srl	%g2, 8, %g4
	xor	%o3, %l2, %o3
	srlx	%g2, 8, %i3
	stx	%o3, [%i0+208]
	and	%i3, %g1, %i3
	srax	%g2, 32, %o1
	or	%i3, %g4, %o7
	sll	%g2, 24, %g2
	srax	%g3, 32, %g4
	srl	%g2, 0, %g2
	sllx	%g4, 56, %g4
	sll	%g3, 24, %g3
	and	%g4, %g1, %g4
	srl	%g3, 0, %g3
	or	%g4, %g3, %g3
	stx	%o4, [%i0+224]
	xor	%o2, %g3, %o2
	sllx	%o1, 56, %o1
	lduw	[%fp+1875], %g3
	and	%o1, %g1, %i3
	or	%i3, %g2, %i3
	ldx	[%fp+2007], %g2
	srax	%g2, 32, %g2
	add	%g3, %g2, %g2
	ldx	[%fp+2007], %g3
	st	%g2, [%fp+1875]
	lduw	[%fp+1867], %g2
	add	%g2, %g3, %g2
	lduw	[%fp+1859], %g3
	st	%g2, [%fp+1867]
	ldx	[%fp+1999], %g2
	srax	%g2, 32, %g2
	add	%g3, %g2, %g2
	ldx	[%fp+1999], %g3
	st	%g2, [%fp+1859]
	lduw	[%fp+1863], %g2
	add	%g2, %g3, %g2
	st	%g2, [%fp+1863]
	ldx	[%fp+1871], %g2
	sllx	%g2, 32, %o5
	lduw	[%fp+1867], %g2
	and	%o5, %g1, %o5
	or	%o5, %g2, %o5
	ldx	[%fp+1855], %g2
	xor	%o7, %i3, %i3
	sllx	%g2, 32, %o7
	lduw	[%fp+1863], %g2
	lduw	[%fp+1851], %g3
	and	%o7, %g1, %o7
	or	%o7, %g2, %o7
	srax	%o3, 32, %g2
	add	%g3, %g2, %g2
	st	%g2, [%fp+1851]
	lduw	[%fp+1843], %g2
	add	%g2, %o3, %g2
	lduw	[%fp+1835], %g3
	st	%g2, [%fp+1843]
	ldx	[%fp+1991], %g2
	srax	%g2, 32, %g2
	add	%g3, %g2, %g2
	ldx	[%fp+1991], %g3
	st	%g2, [%fp+1835]
	lduw	[%fp+1839], %g2
	add	%g2, %g3, %g2
	st	%g2, [%fp+1839]
	ldx	[%fp+1847], %g2
	stx	%l7, [%i0+232]
	stx	%o2, [%i0+240]
	stx	%i3, [%i0+248]
	stx	%o5, [%i0+128]
	stx	%o7, [%i0+136]
	sllx	%g2, 32, %g4
	lduw	[%fp+1843], %g2
	and	%g4, %g1, %g4
	or	%g4, %g2, %g4
	ldx	[%fp+1831], %g2
	sllx	%g2, 32, %g3
	lduw	[%fp+1839], %g2
	lduw	[%fp+1827], %o1
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	srax	%o4, 32, %g2
	add	%o1, %g2, %g2
	st	%g2, [%fp+1827]
	lduw	[%fp+1819], %g2
	add	%g2, %o4, %g2
	lduw	[%fp+1811], %o1
	st	%g2, [%fp+1819]
	srax	%l7, 32, %g2
	add	%o1, %g2, %g2
	lduw	[%fp+1819], %o1
	st	%g2, [%fp+1811]
	lduw	[%fp+1815], %g2
	add	%g2, %l7, %g2
	st	%g2, [%fp+1815]
	ldx	[%fp+1823], %g2
	sllx	%g2, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %o1, %g2
	ldx	[%fp+1807], %o1
	sllx	%o1, 32, %l0
	lduw	[%fp+1815], %o1
	lduw	[%fp+1803], %o0
	and	%l0, %g1, %l0
	or	%l0, %o1, %l0
	srax	%o2, 32, %o1
	add	%o0, %o1, %o1
	st	%o1, [%fp+1803]
	lduw	[%fp+1795], %o1
	add	%o1, %o2, %o1
	lduw	[%fp+1787], %o0
	st	%o1, [%fp+1795]
	srax	%i3, 32, %o1
	add	%o0, %o1, %o1
	st	%o1, [%fp+1787]
	lduw	[%fp+1791], %o1
	add	%o1, %i3, %o1
	st	%o1, [%fp+1791]
	ldx	[%fp+1799], %o1
	lduw	[%fp+1791], %l1
	stx	%g4, [%i0+144]
	stx	%g3, [%i0+152]
	stx	%g2, [%i0+160]
	stx	%l0, [%i0+168]
	sllx	%o1, 32, %o0
	lduw	[%fp+1795], %o1
	and	%o0, %g1, %o0
	or	%o0, %o1, %o0
	stx	%o0, [%i0+176]
	ldx	[%fp+1783], %o1
	sllx	%o1, 32, %o1
	and	%o1, %g1, %o1
	or	%o1, %l1, %o1
	stx	%o1, [%i0+184]
	xor	%g5, %o1, %o1
	ldx	[%fp+2039], %l1
	xor	%l1, %o5, %o5
	srl	%o5, 7, %g5
	xor	%i5, %o0, %i5
	ldx	[%fp+2031], %l1
	srlx	%o5, 7, %o0
	xor	%l1, %o7, %o7
	and	%o0, %g1, %o0
	or	%o0, %g5, %o0
	srl	%o7, 7, %g5
	xor	%i2, %g2, %g2
	srlx	%o7, 7, %i2
	and	%i2, %g1, %i2
	or	%i2, %g5, %i2
	srax	%o5, 32, %g5
	sllx	%g5, 57, %g5
	and	%g5, %g1, %g5
	sll	%o5, 25, %o5
	srl	%o5, 0, %o5
	or	%g5, %o5, %o5
	xor	%o0, %o5, %g5
	xor	%i4, %l0, %i4
	stx	%g5, [%fp+2039]
	srax	%o7, 32, %l0
	sll	%o7, 25, %o7
	sllx	%l0, 57, %l0
	srl	%o7, 0, %o7
	and	%l0, %g1, %l0
	or	%l0, %o7, %o7
	xor	%i2, %o7, %g5
	stx	%g5, [%fp+2031]
	ldx	[%fp+2039], %g5
	stx	%g5, [%i0+64]
	ldx	[%fp+2031], %g5
	xor	%l3, %g4, %g4
	stx	%g5, [%i0+72]
	srl	%g4, 7, %g5
	ldx	[%fp+2015], %l1
	srlx	%g4, 7, %o7
	xor	%l1, %g3, %g3
	and	%o7, %g1, %o7
	srlx	%g3, 7, %i2
	or	%o7, %g5, %o7
	and	%i2, %g1, %i2
	srl	%g3, 7, %g5
	srax	%g3, 32, %o5
	or	%i2, %g5, %i2
	sllx	%o5, 57, %o5
	sll	%g3, 25, %g3
	and	%o5, %g1, %o5
	srl	%g3, 0, %g3
	or	%o5, %g3, %g3
	xor	%i2, %g3, %g3
	stx	%g3, [%fp+2015]
	ldx	[%fp+2015], %g3
	srax	%g4, 32, %g5
	stx	%g3, [%i0+88]
	sllx	%g5, 57, %g5
	srl	%g2, 7, %g3
	and	%g5, %g1, %g5
	sll	%g4, 25, %g4
	srl	%g4, 0, %g4
	or	%g5, %g4, %g4
	srlx	%g2, 7, %g5
	xor	%o7, %g4, %g4
	and	%g5, %g1, %g5
	or	%g5, %g3, %g5
	srl	%i4, 7, %g3
	stx	%g4, [%i0+80]
	stx	%g4, [%fp+2023]
	srlx	%i4, 7, %g4
	and	%g4, %g1, %g4
	or	%g4, %g3, %g4
	srax	%g2, 32, %g3
	sll	%g2, 25, %g2
	sllx	%g3, 57, %g3
	srl	%g2, 0, %g2
	and	%g3, %g1, %g3
	or	%g3, %g2, %g2
	xor	%g5, %g2, %g2
	srax	%i4, 32, %o7
	stx	%g2, [%fp+1983]
	sllx	%o7, 57, %o7
	sll	%i4, 25, %i4
	and	%o7, %g1, %o7
	srl	%i4, 0, %i4
	or	%o7, %i4, %i4
	xor	%g4, %i4, %g2
	stx	%g2, [%fp+1975]
	ldx	[%fp+1983], %g2
	stx	%g2, [%i0+96]
	ldx	[%fp+1975], %g2
	stx	%g2, [%i0+104]
	srl	%i5, 7, %g2
	srlx	%i5, 7, %o7
	and	%o7, %g1, %o7
	or	%o7, %g2, %o7
	srl	%o1, 7, %g2
	srlx	%o1, 7, %o5
	and	%o5, %g1, %o5
	or	%o5, %g2, %o5
	srax	%i5, 32, %g2
	sll	%i5, 25, %i5
	sllx	%g2, 57, %g2
	srl	%i5, 0, %o0
	and	%g2, %g1, %i5
	srax	%o1, 32, %g2
	sllx	%g2, 57, %g2
	and	%g2, %g1, %g2
	sll	%o1, 25, %o1
	srl	%o1, 0, %o1
	or	%g2, %o1, %o1
	ldx	[%fp+1967], %g2
	sethi	%gdop_hix22(MSG_SCHEDULE), %i2
	xor	%i2, %gdop_lox10(MSG_SCHEDULE), %i2
	ldx	[%g2 + %i2], %i2, %gdop(MSG_SCHEDULE)
	ldx	[%fp+1767], %g2
	sllx	%g2, 4, %g2
	xor	%o5, %o1, %o5
	add	%i2, %g2, %i2
	stx	%o5, [%i0+120]
	or	%i5, %o0, %i5
	ldub	[%i2+8], %g2
	xor	%o7, %i5, %o7
	sllx	%g2, 4, %g2
	stx	%o7, [%i0+112]
	add	%i1, %g2, %g3
	ldx	[%i1+%g2], %g2
	add	%l4, %g2, %l4
	srax	%g2, 32, %i4
	lduw	[%fp+1951], %g2
	ldx	[%g3+8], %l3
	lduw	[%fp+1963], %g3
	srax	%l3, 32, %i5
	add	%g2, %l3, %l3
	srl	%l4, 0, %g2
	add	%g3, %i4, %i4
	add	%l6, %i5, %l6
	srl	%l3, 0, %g4
	sllx	%i4, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%l6, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g4, %g2
	stx	%g3, [%i0]
	stx	%g2, [%i0+8]
	ldub	[%i2+10], %g3
	sllx	%g3, 4, %g3
	add	%i1, %g3, %g2
	ldx	[%i1+%g3], %l2
	ldx	[%g2+8], %l1
	lduw	[%fp+1947], %g2
	srax	%l2, 32, %g5
	add	%g2, %g5, %g5
	lduw	[%fp+1935], %g2
	add	%g2, %l2, %l2
	lduw	[%fp+1931], %g2
	srax	%l1, 32, %g4
	add	%g2, %g4, %g4
	lduw	[%fp+1919], %g2
	add	%g2, %l1, %l1
	srl	%l2, 0, %g2
	srl	%l1, 0, %i5
	sllx	%g5, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%g4, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %i5, %g2
	stx	%g3, [%i0+16]
	stx	%g2, [%i0+24]
	ldub	[%i2+12], %g3
	sllx	%g3, 4, %g3
	add	%i1, %g3, %g2
	ldx	[%i1+%g3], %l0
	ldx	[%g2+8], %o0
	srax	%l0, 32, %g2
	add	%l5, %g2, %l5
	lduw	[%fp+1911], %g2
	add	%g2, %l0, %l0
	lduw	[%fp+1907], %g2
	srax	%o0, 32, %o1
	add	%g2, %o1, %o1
	lduw	[%fp+1779], %g2
	add	%g2, %o0, %o0
	srl	%l0, 0, %g2
	srl	%o0, 0, %i5
	sllx	%l5, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%o1, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %i5, %g2
	ldx	[%fp+2023], %i5
	srax	%i5, 32, %i5
	add	%i4, %i5, %i5
	st	%i5, [%fp+1939]
	ldx	[%fp+2023], %i5
	add	%l4, %i5, %l4
	ldx	[%fp+2015], %i5
	srax	%i5, 32, %i5
	add	%l6, %i5, %l6
	ldx	[%fp+2015], %i5
	add	%l3, %i5, %i5
	st	%i5, [%fp+1927]
	ldx	[%fp+1935], %i5
	lduw	[%fp+1927], %l3
	sllx	%i5, 32, %i4
	srl	%l4, 0, %i5
	and	%i4, %g1, %i4
	or	%i4, %i5, %i4
	sllx	%l6, 32, %i5
	and	%i5, %g1, %i5
	or	%i5, %l3, %i5
	ldx	[%fp+1983], %l3
	srax	%l3, 32, %l3
	add	%g5, %l3, %g5
	stx	%g3, [%i0+32]
	stx	%g2, [%i0+40]
	ldub	[%i2+14], %g3
	st	%g5, [%fp+1923]
	sllx	%g3, 4, %g3
	ldx	[%fp+1983], %g5
	add	%i1, %g3, %g2
	add	%l2, %g5, %g5
	ldx	[%i1+%g3], %g3
	ldx	[%g2+8], %g2
	stx	%i4, [%i0]
	stx	%i5, [%i0+8]
	st	%g5, [%fp+1911]
	ldx	[%fp+1975], %g5
	srax	%g5, 32, %g5
	add	%g4, %g5, %g4
	st	%g4, [%fp+1907]
	ldx	[%fp+1975], %g4
	add	%l1, %g4, %g4
	add	%l0, %o7, %l0
	st	%g4, [%fp+1779]
	ldx	[%fp+1919], %g4
	lduw	[%fp+1779], %l1
	st	%l0, [%fp+1767]
	sllx	%g4, 32, %g5
	srax	%o5, 32, %l0
	lduw	[%fp+1911], %g4
	add	%o1, %l0, %o1
	and	%g5, %g1, %g5
	st	%o1, [%fp+1763]
	or	%g5, %g4, %g5
	add	%o0, %o5, %o1
	ldx	[%fp+1903], %g4
	sllx	%g4, 32, %g4
	and	%g4, %g1, %g4
	or	%g4, %l1, %g4
	srax	%o7, 32, %l1
	st	%o1, [%fp+1775]
	add	%l5, %l1, %l5
	lduw	[%fp+1767], %o1
	lduw	[%fp+1899], %l1
	lduw	[%fp+1775], %o0
	sllx	%l5, 32, %l0
	and	%l0, %g1, %l0
	or	%l0, %o1, %l0
	ldx	[%fp+1759], %o1
	sllx	%o1, 32, %o1
	and	%o1, %g1, %o1
	or	%o1, %o0, %o1
	srax	%g3, 32, %o0
	add	%l1, %o0, %o0
	ldx	[%fp+2039], %l1
	srax	%l1, 32, %l1
	add	%o0, %l1, %o0
	st	%o0, [%fp+1899]
	lduw	[%fp+1891], %o0
	add	%o0, %g3, %g3
	ldx	[%fp+2039], %o0
	add	%g3, %o0, %g3
	lduw	[%fp+1883], %o0
	st	%g3, [%fp+1891]
	srax	%g2, 32, %g3
	add	%o0, %g3, %g3
	ldx	[%fp+2031], %o0
	srax	%o0, 32, %o0
	add	%g3, %o0, %g3
	st	%g3, [%fp+1883]
	lduw	[%fp+1887], %g3
	add	%g3, %g2, %g2
	ldx	[%fp+2031], %g3
	add	%g2, %g3, %g2
	xor	%i3, %i5, %i5
	lduw	[%fp+1891], %g3
	stx	%g5, [%i0+16]
	stx	%g4, [%i0+24]
	stx	%l0, [%i0+32]
	stx	%o1, [%i0+40]
	st	%g2, [%fp+1887]
	ldx	[%fp+1895], %g2
	sllx	%g2, 32, %g2
	and	%g2, %g1, %g2
	ldx	[%fp+1879], %g1
	ldx	[%fp+2007], %i3
	xor	%i3, %g5, %g5
	ldx	[%fp+1999], %i3
	xor	%o2, %i4, %i4
	xor	%i3, %g4, %g4
	or	%g2, %g3, %g2
	ldx	[%fp+1991], %i3
	lduw	[%fp+1887], %l1
	stx	%g2, [%i0+48]
	xor	%o4, %g2, %g2
	srlx	%i4, 48, %o4
	sllx	%o4, 32, %o4
	xor	%i3, %o1, %o1
	sllx	%g1, 32, %o0
	mov	-1, %g3
	sllx	%i4, 16, %i3
	sllx	%g3, 32, %g1
	srlx	%i3, 48, %i3
	sllx	%g3, 16, %g3
	and	%o0, %g1, %o0
	sllx	%i3, 48, %i3
	or	%o0, %l1, %o0
	sethi	%hi(4294901760), %l2
	sethi	%hi(67107840), %l1
	xnor	%g0, %l2, %l2
	sllx	%l1, 22, %l1
	xnor	%g0, %l1, %l1
	and	%i3, %l1, %i3
	or	%i3, %o4, %i3
	sllx	%i4, 48, %o4
	and	%i3, %l2, %i3
	srlx	%o4, 32, %o4
	or	%i3, %o4, %i3
	and	%i3, %g3, %i3
	sllx	%i4, 32, %i4
	srlx	%i4, 48, %i4
	or	%i3, %i4, %i4
	srlx	%i5, 48, %i3
	sllx	%i3, 32, %i3
	stx	%i4, [%fp+2007]
	sllx	%i5, 16, %i4
	srlx	%i4, 48, %i4
	sllx	%i4, 48, %i4
	and	%i4, %l1, %i4
	or	%i4, %i3, %i4
	sllx	%i5, 48, %i3
	and	%i4, %l2, %i4
	srlx	%i3, 32, %i3
	sllx	%i5, 32, %i5
	or	%i4, %i3, %i4
	srlx	%i5, 48, %i5
	and	%i4, %g3, %i4
	or	%i4, %i5, %i5
	stx	%i5, [%fp+1999]
	ldx	[%fp+2007], %i5
	srlx	%g5, 48, %i4
	stx	%i5, [%i0+240]
	sllx	%i4, 32, %i4
	ldx	[%fp+1999], %i5
	stx	%i5, [%i0+248]
	sllx	%g5, 16, %i5
	srlx	%i5, 48, %i5
	sllx	%i5, 48, %i5
	and	%i5, %l1, %i5
	or	%i5, %i4, %i5
	sllx	%g5, 48, %i4
	and	%i5, %l2, %i5
	srlx	%i4, 32, %i4
	or	%i5, %i4, %i5
	and	%i5, %g3, %i5
	sllx	%g5, 32, %g5
	srlx	%g5, 48, %g5
	or	%i5, %g5, %g5
	srlx	%g4, 48, %i5
	sllx	%i5, 32, %i5
	stx	%g5, [%fp+1991]
	sllx	%g4, 16, %g5
	srlx	%g5, 48, %g5
	sllx	%g5, 48, %g5
	and	%g5, %l1, %g5
	or	%g5, %i5, %g5
	sllx	%g4, 48, %i5
	and	%g5, %l2, %g5
	srlx	%i5, 32, %i5
	sllx	%g4, 32, %g4
	or	%g5, %i5, %g5
	srlx	%g4, 48, %g4
	and	%g5, %g3, %g5
	or	%g5, %g4, %g4
	stx	%g4, [%fp+1967]
	ldx	[%fp+1991], %g4
	xor	%o3, %l0, %o3
	stx	%g4, [%i0+192]
	srlx	%o3, 48, %g5
	ldx	[%fp+1967], %g4
	sllx	%g5, 32, %g5
	stx	%g4, [%i0+200]
	sllx	%o3, 16, %g4
	srlx	%g4, 48, %g4
	sllx	%g4, 48, %g4
	and	%g4, %l1, %g4
	or	%g4, %g5, %g4
	sllx	%o3, 48, %g5
	srlx	%g5, 32, %g5
	and	%g4, %l2, %g4
	sllx	%o3, 32, %o3
	or	%g4, %g5, %g4
	srlx	%o3, 48, %o3
	and	%g4, %g3, %g4
	srlx	%o1, 48, %g5
	or	%g4, %o3, %g4
	sllx	%g5, 32, %g5
	stx	%g4, [%fp+1959]
	sllx	%o1, 16, %g4
	srlx	%g4, 48, %g4
	sllx	%g4, 48, %g4
	and	%g4, %l1, %g4
	or	%g4, %g5, %g4
	sllx	%o1, 48, %g5
	and	%g4, %l2, %g4
	srlx	%g5, 32, %g5
	sllx	%o1, 32, %o1
	or	%g4, %g5, %g4
	srlx	%o1, 48, %o1
	and	%g4, %g3, %g4
	or	%g4, %o1, %g4
	stx	%g4, [%fp+1951]
	ldx	[%fp+1959], %g4
	srlx	%g2, 48, %g5
	stx	%g4, [%i0+208]
	sllx	%g5, 32, %g5
	ldx	[%fp+1951], %g4
	stx	%g4, [%i0+216]
	sllx	%g2, 16, %g4
	srlx	%g4, 48, %g4
	sllx	%g4, 48, %g4
	and	%g4, %l1, %g4
	or	%g4, %g5, %g4
	sllx	%g2, 48, %g5
	and	%g4, %l2, %g4
	srlx	%g5, 32, %g5
	sllx	%g2, 32, %g2
	or	%g4, %g5, %g4
	srlx	%g2, 48, %g2
	and	%g4, %g3, %g4
	or	%g4, %g2, %g2
	stx	%o0, [%i0+56]
	stx	%g2, [%fp+1943]
	xor	%l7, %o0, %o0
	sllx	%o0, 16, %g2
	srlx	%g2, 48, %g2
	sllx	%g2, 48, %g2
	and	%g2, %l1, %g2
	srlx	%o0, 48, %g4
	sllx	%g4, 32, %g4
	or	%g2, %g4, %g4
	ldx	[%fp+1943], %g2
	sllx	%o0, 48, %g5
	and	%g4, %l2, %g4
	srlx	%g5, 32, %g5
	stx	%g2, [%i0+224]
	or	%g4, %g5, %g4
	ldx	[%fp+2007], %g2
	and	%g4, %g3, %g4
	srax	%g2, 32, %g2
	lduw	[%fp+1827], %g3
	add	%g3, %g2, %g2
	sllx	%o0, 32, %o0
	st	%g2, [%fp+1827]
	srlx	%o0, 48, %o0
	or	%g4, %o0, %i3
	stx	%i3, [%i0+232]
	lduw	[%fp+1819], %g2
	ldx	[%fp+2007], %g3
	add	%g2, %g3, %g2
	lduw	[%fp+1811], %g3
	st	%g2, [%fp+1819]
	ldx	[%fp+1999], %g2
	srax	%g2, 32, %g2
	add	%g3, %g2, %g2
	ldx	[%fp+1999], %g3
	st	%g2, [%fp+1811]
	lduw	[%fp+1815], %g2
	add	%g2, %g3, %g2
	st	%g2, [%fp+1815]
	ldx	[%fp+1823], %g2
	sllx	%g2, 32, %i5
	lduw	[%fp+1819], %g2
	and	%i5, %g1, %i5
	or	%i5, %g2, %i5
	ldx	[%fp+1807], %g2
	sllx	%g2, 32, %g5
	lduw	[%fp+1815], %g2
	and	%g5, %g1, %g5
	or	%g5, %g2, %g5
	ldx	[%fp+1991], %g2
	srax	%g2, 32, %o1
	lduw	[%fp+1803], %g2
	add	%g2, %o1, %g2
	ldx	[%fp+1991], %g3
	st	%g2, [%fp+1803]
	lduw	[%fp+1795], %g2
	add	%g2, %g3, %g2
	st	%g2, [%fp+1795]
	ldx	[%fp+1967], %g2
	srax	%g2, 32, %o1
	lduw	[%fp+1787], %g2
	add	%g2, %o1, %g2
	ldx	[%fp+1967], %g3
	st	%g2, [%fp+1787]
	lduw	[%fp+1791], %g2
	add	%g2, %g3, %g2
	st	%g2, [%fp+1791]
	ldx	[%fp+1799], %g2
	sllx	%g2, 32, %g4
	lduw	[%fp+1795], %g2
	stx	%i5, [%i0+160]
	stx	%g5, [%i0+168]
	and	%g4, %g1, %g4
	or	%g4, %g2, %g4
	ldx	[%fp+1783], %g2
	stx	%g4, [%i0+176]
	sllx	%g2, 32, %g3
	lduw	[%fp+1791], %g2
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	stx	%g3, [%i0+184]
	lduw	[%fp+1875], %i4
	ldx	[%fp+1959], %g2
	srax	%g2, 32, %g2
	add	%i4, %g2, %g2
	ldx	[%fp+1959], %i4
	st	%g2, [%fp+1875]
	lduw	[%fp+1867], %g2
	add	%g2, %i4, %g2
	lduw	[%fp+1859], %i4
	st	%g2, [%fp+1867]
	ldx	[%fp+1951], %g2
	srax	%g2, 32, %g2
	add	%i4, %g2, %g2
	ldx	[%fp+1951], %i4
	st	%g2, [%fp+1859]
	lduw	[%fp+1863], %g2
	add	%g2, %i4, %g2
	lduw	[%fp+1867], %i4
	st	%g2, [%fp+1863]
	ldx	[%fp+1871], %g2
	sllx	%g2, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %i4, %g2
	ldx	[%fp+1855], %i4
	sllx	%i4, 32, %o4
	lduw	[%fp+1863], %i4
	lduw	[%fp+1851], %o3
	and	%o4, %g1, %o4
	or	%o4, %i4, %o4
	ldx	[%fp+1943], %i4
	srax	%i4, 32, %i4
	add	%o3, %i4, %i4
	ldx	[%fp+1943], %o3
	st	%i4, [%fp+1851]
	lduw	[%fp+1843], %i4
	add	%i4, %o3, %i4
	lduw	[%fp+1835], %o3
	st	%i4, [%fp+1843]
	srax	%i3, 32, %i4
	add	%o3, %i4, %i4
	st	%i4, [%fp+1835]
	lduw	[%fp+1839], %i4
	add	%i4, %i3, %i4
	st	%i4, [%fp+1839]
	ldx	[%fp+1847], %i4
	lduw	[%fp+1839], %o3
	stx	%g2, [%i0+128]
	stx	%o4, [%i0+136]
	sllx	%i4, 32, %o0
	lduw	[%fp+1843], %i4
	and	%o0, %g1, %o0
	or	%o0, %i4, %o0
	ldx	[%fp+1831], %i4
	stx	%o0, [%i0+144]
	sllx	%i4, 32, %i4
	and	%i4, %g1, %i4
	or	%i4, %o3, %i4
	ldx	[%fp+2023], %o3
	xor	%o7, %g2, %g2
	xor	%o3, %i5, %i5
	ldx	[%fp+2039], %o7
	ldx	[%fp+2015], %o3
	xor	%o7, %o0, %o0
	xor	%o3, %g5, %g5
	ldx	[%fp+2031], %o7
	ldx	[%fp+1983], %o3
	stx	%i4, [%i0+152]
	xor	%o3, %g4, %g4
	xor	%o7, %i4, %i4
	ldx	[%fp+1975], %o3
	srl	%i5, 12, %o7
	xor	%o3, %g3, %g3
	xor	%o5, %o4, %o5
	srlx	%i5, 12, %o3
	srlx	%g5, 12, %o4
	and	%o3, %g1, %o3
	srax	%g5, 32, %o2
	or	%o3, %o7, %o3
	sllx	%o2, 52, %o2
	srl	%g5, 12, %o7
	and	%o2, %g1, %o2
	sll	%g5, 20, %g5
	srl	%g5, 0, %g5
	or	%o2, %g5, %g5
	and	%o4, %g1, %o4
	or	%o4, %o7, %o4
	srax	%i5, 32, %o7
	xor	%o4, %g5, %l7
	sllx	%o7, 52, %o7
	srl	%g4, 12, %g5
	and	%o7, %g1, %o7
	sll	%i5, 20, %i5
	srl	%i5, 0, %i5
	or	%o7, %i5, %i5
	xor	%o3, %i5, %i5
	srlx	%g4, 12, %o1
	stx	%i5, [%i0+80]
	stx	%i5, [%fp+2039]
	and	%o1, %g1, %o1
	srlx	%g3, 12, %o2
	or	%o1, %g5, %o1
	srax	%g3, 32, %i5
	srl	%g3, 12, %g5
	sllx	%i5, 52, %i5
	sll	%g3, 20, %g3
	and	%i5, %g1, %i5
	srl	%g3, 0, %g3
	or	%i5, %g3, %g3
	and	%o2, %g1, %o2
	or	%o2, %g5, %o2
	xor	%o2, %g3, %o2
	srl	%g2, 12, %g3
	srax	%g4, 32, %g5
	srlx	%g2, 12, %o3
	sllx	%g5, 52, %g5
	and	%o3, %g1, %o3
	and	%g5, %g1, %g5
	or	%o3, %g3, %o3
	sll	%g4, 20, %g4
	srl	%o5, 12, %g3
	srl	%g4, 0, %g4
	or	%g5, %g4, %g4
	srlx	%o5, 12, %o4
	xor	%o1, %g4, %o1
	and	%o4, %g1, %o4
	or	%o4, %g3, %g4
	srax	%g2, 32, %g3
	sll	%g2, 20, %g2
	sllx	%g3, 52, %g3
	srl	%g2, 0, %g2
	and	%g3, %g1, %g3
	or	%g3, %g2, %g2
	srax	%o5, 32, %g5
	xor	%o3, %g2, %o3
	sll	%o5, 20, %o5
	srl	%o0, 12, %g2
	srl	%o5, 0, %o5
	sllx	%g5, 52, %g5
	and	%g5, %g1, %o4
	or	%o4, %o5, %o4
	srlx	%o0, 12, %o5
	and	%o5, %g1, %o5
	or	%o5, %g2, %o5
	srl	%i4, 12, %g2
	srlx	%i4, 12, %o7
	and	%o7, %g1, %o7
	or	%o7, %g2, %o7
	srax	%o0, 32, %g2
	sllx	%g2, 52, %g2
	and	%g2, %g1, %g2
	sll	%o0, 20, %o0
	srl	%o0, 0, %o0
	or	%g2, %o0, %o0
	srax	%i4, 32, %g2
	sllx	%g2, 52, %g2
	and	%g2, %g1, %g2
	stx	%l7, [%i0+88]
	stx	%o1, [%i0+96]
	stx	%o2, [%i0+104]
	xor	%g4, %o4, %o4
	stx	%o3, [%i0+112]
	stx	%o4, [%i0+120]
	xor	%o5, %o0, %o5
	sll	%i4, 20, %i4
	stx	%o5, [%i0+64]
	srl	%i4, 0, %i4
	or	%g2, %i4, %i4
	ldub	[%i2+9], %g2
	xor	%o7, %i4, %o7
	sllx	%g2, 4, %g2
	stx	%o7, [%i0+72]
	add	%i1, %g2, %g3
	ldx	[%i1+%g2], %g2
	add	%l4, %g2, %l4
	srax	%g2, 32, %i4
	lduw	[%fp+1927], %g2
	ldx	[%g3+8], %l3
	lduw	[%fp+1939], %g3
	srax	%l3, 32, %i5
	add	%g2, %l3, %l3
	srl	%l4, 0, %g2
	add	%l6, %i5, %i5
	srl	%l3, 0, %g4
	add	%g3, %i4, %i4
	sllx	%i4, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%i5, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %g4, %g2
	stx	%g3, [%i0]
	stx	%g2, [%i0+8]
	ldub	[%i2+11], %g3
	sllx	%g3, 4, %g3
	add	%i1, %g3, %g2
	ldx	[%g2+8], %l1
	lduw	[%fp+1923], %g2
	ldx	[%i1+%g3], %l2
	srax	%l2, 32, %g5
	add	%g2, %g5, %g5
	lduw	[%fp+1911], %g2
	add	%g2, %l2, %l2
	lduw	[%fp+1907], %g2
	srax	%l1, 32, %g4
	add	%g2, %g4, %g4
	lduw	[%fp+1779], %g2
	add	%g2, %l1, %l1
	srl	%l2, 0, %g2
	srl	%l1, 0, %o0
	sllx	%g5, 32, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	sllx	%g4, 32, %g2
	and	%g2, %g1, %g2
	or	%g2, %o0, %g2
	stx	%g3, [%i0+16]
	stx	%g2, [%i0+24]
	ldub	[%i2+13], %g3
	sllx	%g3, 4, %g3
	add	%i1, %g3, %g2
	ldx	[%i1+%g3], %l0
	ldx	[%g2+8], %o0
	srax	%l0, 32, %g3
	lduw	[%fp+1767], %g2
	add	%l5, %g3, %g3
	lduw	[%fp+1763], %l5
	add	%g2, %l0, %l0
	srax	%o0, 32, %g2
	add	%l5, %g2, %g2
	lduw	[%fp+1775], %l5
	sllx	%g3, 32, %l6
	add	%l5, %o0, %o0
	and	%l6, %g1, %l6
	srl	%l0, 0, %l5
	or	%l6, %l5, %l5
	srl	%o0, 0, %l6
	stx	%l5, [%fp+2031]
	sllx	%g2, 32, %l5
	and	%l5, %g1, %l5
	or	%l5, %l6, %l5
	ldub	[%i2+15], %i2
	stx	%l5, [%i0+40]
	sllx	%i2, 4, %i2
	add	%i1, %i2, %l5
	ldx	[%fp+2031], %l6
	stx	%l6, [%i0+32]
	ldx	[%i1+%i2], %i1
	ldx	[%l5+8], %i2
	ldx	[%fp+2039], %l5
	srax	%l5, 32, %l5
	add	%i4, %l5, %i4
	sllx	%i4, 32, %i4
	and	%i4, %g1, %i4
	ldx	[%fp+2039], %l5
	srax	%o4, 32, %l6
	add	%l4, %l5, %l4
	add	%g2, %l6, %g2
	srl	%l4, 0, %l4
	sllx	%g2, 32, %g2
	or	%i4, %l4, %l4
	srax	%l7, 32, %i4
	add	%i5, %i4, %i5
	sllx	%i5, 32, %i5
	and	%i5, %g1, %i5
	and	%g2, %g1, %l6
	add	%l3, %l7, %l3
	lduw	[%fp+1899], %g2
	srl	%l3, 0, %l3
	add	%o0, %o4, %o0
	or	%i5, %l3, %l3
	srl	%o0, 0, %o0
	srax	%o1, 32, %i5
	add	%g5, %i5, %g5
	sllx	%g5, 32, %g5
	and	%g5, %g1, %g5
	or	%l6, %o0, %l6
	add	%l2, %o1, %l2
	srax	%i1, 32, %o0
	srl	%l2, 0, %l2
	add	%g2, %o0, %o0
	or	%g5, %l2, %l2
	srax	%o5, 32, %g2
	srax	%o2, 32, %g5
	add	%g4, %g5, %g4
	sllx	%g4, 32, %g4
	and	%g4, %g1, %g4
	add	%o0, %g2, %o0
	add	%l1, %o2, %l1
	lduw	[%fp+1891], %g2
	srl	%l1, 0, %l1
	or	%g4, %l1, %l1
	srax	%o3, 32, %g4
	add	%g3, %g4, %g3
	sllx	%g3, 32, %g3
	and	%g3, %g1, %g3
	add	%g2, %i1, %i1
	add	%l0, %o3, %l0
	add	%i1, %o5, %i1
	lduw	[%fp+1883], %g2
	srl	%l0, 0, %l0
	or	%g3, %l0, %l0
	srl	%i1, 0, %g3
	sllx	%o0, 32, %o0
	and	%o0, %g1, %o0
	or	%o0, %g3, %i1
	srax	%i2, 32, %g3
	add	%g2, %g3, %g3
	lduw	[%fp+1887], %g2
	add	%g2, %i2, %i2
	ldx	[%fp+2007], %g2
	stx	%l4, [%i0]
	xor	%l4, %g2, %l4
	ldx	[%fp+1999], %g2
	stx	%l3, [%i0+8]
	xor	%l3, %g2, %l3
	ldx	[%fp+1991], %g2
	stx	%l2, [%i0+16]
	xor	%l2, %g2, %l2
	ldx	[%fp+1967], %g2
	stx	%l1, [%i0+24]
	xor	%l1, %g2, %l1
	ldx	[%fp+1959], %g2
	stx	%l0, [%i0+32]
	stx	%l6, [%i0+40]
	xor	%l0, %g2, %l0
	srax	%o7, 32, %o0
	add	%i2, %o7, %i2
	add	%g3, %o0, %o0
	stx	%i1, [%i0+48]
	sllx	%o0, 32, %o0
	srl	%i2, 0, %i2
	and	%o0, %g1, %o0
	or	%o0, %i2, %o0
	stx	%o0, [%i0+56]
	ldx	[%fp+1951], %g2
	xor	%l6, %g2, %l6
	ldx	[%fp+1943], %g2
	xor	%i1, %g2, %i1
	srl	%l4, 8, %g2
	srlx	%l4, 8, %g4
	and	%g4, %g1, %g4
	or	%g4, %g2, %g4
	srl	%l3, 8, %g2
	srlx	%l3, 8, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	srax	%l4, 32, %g2
	sllx	%g2, 56, %g2
	and	%g2, %g1, %g2
	sll	%l4, 24, %l4
	srl	%l4, 0, %l4
	or	%g2, %l4, %l4
	srl	%l2, 8, %g2
	xor	%l4, %g4, %l4
	srlx	%l2, 8, %g4
	and	%g4, %g1, %g4
	or	%g4, %g2, %g4
	srl	%l1, 8, %g2
	srax	%l3, 32, %g5
	sll	%l3, 24, %l3
	sllx	%g5, 56, %g5
	srl	%l3, 0, %l3
	and	%g5, %g1, %g5
	or	%g5, %l3, %l3
	xor	%l3, %g3, %l3
	srlx	%l1, 8, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	srax	%l2, 32, %g2
	sllx	%g2, 56, %g2
	and	%g2, %g1, %g2
	srax	%l1, 32, %g5
	sll	%l2, 24, %l2
	sllx	%g5, 56, %g5
	srl	%l2, 0, %l2
	and	%g5, %g1, %g5
	or	%g2, %l2, %l2
	srl	%l0, 8, %g2
	srlx	%l0, 8, %i4
	sll	%l1, 24, %l1
	and	%i4, %g1, %i4
	srl	%l1, 0, %l1
	or	%g5, %l1, %l1
	or	%i4, %g2, %g5
	srl	%l6, 8, %g2
	xor	%l2, %g4, %l2
	xor	%l1, %g3, %l1
	srlx	%l6, 8, %g4
	and	%g4, %g1, %g4
	or	%g4, %g2, %g3
	srax	%l0, 32, %g2
	sllx	%g2, 56, %g2
	and	%g2, %g1, %i4
	srl	%i1, 8, %g2
	xor	%o0, %i3, %o0
	srax	%l6, 32, %i5
	sll	%l0, 24, %l0
	sllx	%i5, 56, %i5
	srl	%l0, 0, %l0
	and	%i5, %g1, %g4
	or	%i4, %l0, %l0
	xor	%l0, %g5, %i4
	srlx	%i1, 8, %g5
	and	%g5, %g1, %g5
	or	%g5, %g2, %g5
	srl	%o0, 8, %g2
	sll	%l6, 24, %l6
	srl	%l6, 0, %l6
	or	%g4, %l6, %l6
	xor	%l6, %g3, %g4
	srlx	%o0, 8, %g3
	and	%g3, %g1, %g3
	or	%g3, %g2, %g3
	srax	%i1, 32, %g2
	sllx	%g2, 56, %g2
	and	%g2, %g1, %g2
	sll	%i1, 24, %i1
	srl	%i1, 0, %i1
	or	%g2, %i1, %i1
	srax	%o0, 32, %g2
	sll	%o0, 24, %o0
	srl	%o0, 0, %o0
	sllx	%g2, 56, %g2
	and	%g2, %g1, %g2
	or	%g2, %o0, %g2
	xor	%g2, %g3, %o0
	lduw	[%fp+1827], %g3
	srax	%l4, 32, %g2
	add	%g3, %g2, %g2
	lduw	[%fp+1819], %g3
	stx	%l4, [%i0+240]
	sllx	%g2, 32, %g2
	add	%g3, %l4, %l4
	and	%g2, %g1, %g2
	lduw	[%fp+1811], %g3
	srl	%l4, 0, %l4
	or	%g2, %l4, %l4
	srax	%l3, 32, %g2
	add	%g3, %g2, %g2
	lduw	[%fp+1815], %g3
	stx	%l3, [%i0+248]
	add	%g3, %l3, %l3
	srl	%l3, 0, %g3
	sllx	%g2, 32, %g2
	and	%g2, %g1, %l3
	or	%l3, %g3, %l3
	lduw	[%fp+1803], %g3
	srax	%l2, 32, %g2
	add	%g3, %g2, %g2
	lduw	[%fp+1795], %g3
	stx	%l2, [%i0+192]
	sllx	%g2, 32, %g2
	add	%g3, %l2, %l2
	and	%g2, %g1, %g2
	lduw	[%fp+1787], %g3
	srl	%l2, 0, %l2
	or	%g2, %l2, %l2
	srax	%l1, 32, %g2
	add	%g3, %g2, %g2
	lduw	[%fp+1791], %g3
	stx	%l1, [%i0+200]
	sllx	%g2, 32, %g2
	add	%g3, %l1, %l1
	lduw	[%fp+1875], %g3
	xor	%i1, %g5, %i1
	srl	%l1, 0, %g5
	and	%g2, %g1, %l1
	srax	%i4, 32, %g2
	add	%g3, %g2, %g2
	lduw	[%fp+1867], %g3
	stx	%i4, [%i0+208]
	sllx	%g2, 32, %g2
	add	%g3, %i4, %i4
	and	%g2, %g1, %g2
	lduw	[%fp+1859], %g3
	stx	%g4, [%i0+216]
	srl	%i4, 0, %i4
	or	%g2, %i4, %i3
	srax	%g4, 32, %g2
	add	%g3, %g2, %g2
	lduw	[%fp+1863], %g3
	sllx	%g2, 32, %g2
	add	%g3, %g4, %g4
	srl	%g4, 0, %g3
	and	%g2, %g1, %g4
	lduw	[%fp+1851], %g2
	srax	%i1, 32, %i4
	add	%g2, %i4, %i4
	lduw	[%fp+1843], %g2
	stx	%i1, [%i0+224]
	sllx	%i4, 32, %i4
	add	%g2, %i1, %i1
	lduw	[%fp+1835], %g2
	or	%l1, %g5, %l1
	srl	%i1, 0, %g5
	and	%i4, %g1, %i1
	srax	%o0, 32, %i4
	add	%g2, %i4, %i4
	lduw	[%fp+1839], %g2
	add	%g2, %o0, %g2
	srl	%g2, 0, %g2
	stx	%o0, [%i0+232]
	stx	%l4, [%i0+160]
	sllx	%i4, 32, %i4
	xor	%l5, %l4, %l4
	and	%i4, %g1, %o0
	or	%o0, %g2, %o0
	srlx	%l4, 7, %g2
	and	%g2, %g1, %g2
	or	%g4, %g3, %g4
	stx	%l3, [%i0+168]
	srl	%l4, 7, %g3
	xor	%l7, %l3, %l3
	or	%g2, %g3, %i5
	srl	%l3, 7, %g2
	or	%i1, %g5, %i1
	stx	%l2, [%i0+176]
	stx	%l1, [%i0+184]
	stx	%i3, [%i0+128]
	stx	%g4, [%i0+136]
	srlx	%l3, 7, %g5
	srax	%l3, 32, %g3
	and	%g5, %g1, %g5
	sllx	%g3, 57, %g3
	or	%g5, %g2, %g5
	sll	%l3, 25, %l3
	srax	%l4, 32, %g2
	srl	%l3, 0, %l3
	sllx	%g2, 57, %g2
	sll	%l4, 25, %l4
	and	%g2, %g1, %g2
	srl	%l4, 0, %l4
	and	%g3, %g1, %g1
	or	%g2, %l4, %g2
	or	%g1, %l3, %g1
	xor	%g2, %i5, %g2
	xor	%g1, %g5, %g1
	stx	%i1, [%i0+144]
	xor	%o2, %l1, %l1
	stx	%g2, [%i0+80]
	srlx	%l1, 7, %g5
	srl	%l1, 7, %g2
	stx	%g1, [%i0+88]
	mov	-1, %g1
	sllx	%g1, 32, %g1
	and	%g5, %g1, %g5
	or	%g5, %g2, %g2
	xor	%o4, %g4, %g4
	srax	%l1, 32, %g5
	sll	%l1, 25, %l1
	sllx	%g5, 57, %g5
	srl	%l1, 0, %l1
	and	%g5, %g1, %g5
	or	%g5, %l1, %g5
	xor	%g5, %g2, %g5
	srlx	%g4, 7, %g2
	and	%g2, %g1, %g2
	stx	%g5, [%i0+104]
	srl	%g4, 7, %g5
	or	%g2, %g5, %g5
	srax	%g4, 32, %g2
	sll	%g4, 25, %g4
	sllx	%g2, 57, %g2
	srl	%g4, 0, %g4
	and	%g2, %g1, %g2
	or	%g2, %g4, %g2
	xor	%g2, %g5, %g2
	xor	%o1, %l2, %l2
	xor	%o5, %i1, %o5
	srlx	%l2, 7, %i5
	srl	%l2, 7, %g3
	and	%i5, %g1, %i5
	stx	%g2, [%i0+120]
	or	%i5, %g3, %g3
	srl	%o5, 7, %g2
	xor	%o3, %i3, %i3
	xor	%o7, %o0, %o7
	srax	%l2, 32, %i5
	srlx	%o5, 7, %g5
	sllx	%i5, 57, %i5
	and	%g5, %g1, %g5
	and	%i5, %g1, %i5
	or	%g5, %g2, %g5
	sll	%l2, 25, %l2
	srl	%o7, 7, %g2
	srl	%l2, 0, %l2
	or	%i5, %l2, %i5
	xor	%i5, %g3, %i5
	srlx	%i3, 7, %g3
	and	%g3, %g1, %g3
	srlx	%o7, 7, %g4
	stx	%i5, [%i0+96]
	and	%g4, %g1, %g4
	srl	%i3, 7, %i5
	or	%g4, %g2, %g4
	or	%g3, %i5, %i5
	srax	%o5, 32, %g2
	srax	%i3, 32, %g3
	sllx	%g2, 57, %g2
	sll	%o5, 25, %o5
	sllx	%g3, 57, %g3
	sll	%i3, 25, %i3
	and	%g3, %g1, %g3
	srl	%i3, 0, %i3
	or	%g3, %i3, %g3
	xor	%g3, %i5, %g3
	stx	%o0, [%i0+152]
	stx	%g3, [%i0+112]
	srl	%o5, 0, %g3
	and	%g2, %g1, %o5
	srax	%o7, 32, %g2
	or	%o5, %g3, %o5
	sllx	%g2, 57, %g2
	sll	%o7, 25, %o7
	and	%g2, %g1, %g1
	srl	%o7, 0, %o7
	xor	%o5, %g5, %o5
	or	%g1, %o7, %g1
	stx	%o5, [%i0+64]
	xor	%g1, %g4, %g1
	stx	%g1, [%i0+72]
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
.L22:
	ldx	[%i0], %g2
	add	%i0, 8, %i0
	cmp	%i0, %g1
	bne,pt	%xcc, .L22
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
	.type	blake3_hash4_sse2, #function
	.proc	020
blake3_hash4_sse2:
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
.L26:
	cmp	%l1, %i1
	bne,a,pt %xcc, .L28
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
.L28:
	cmp	%l1, %i1
	be,a,pn	%xcc, .L27
	 or	%i2, %l5, %i2
.L27:
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
	ba,pt	%xcc, .L26
	 stx	%g1, [%fp+1527]
	.size	blake3_hash4_sse2, .-blake3_hash4_sse2
	.align 4
	.global hash_one_sse2
	.type	hash_one_sse2, #function
	.proc	020
hash_one_sse2:
	save	%sp, -208, %sp
	ldub	[%fp+2230], %l1
	add	%fp, 2015, %l0
	mov	32, %o2
	mov	%i2, %o1
	call	memcpy, 0
	 mov	%l0, %o0
	or	%i4, %i5, %o4
.L30:
	brnz,pt	%i1, .L32
	 cmp	%i1, 1
	mov	32, %o2
	mov	%l0, %o1
	call	memcpy, 0
	 ldx	[%fp+2231], %o0
	return	%i7+8
	 nop
.L32:
	be,a,pn	%xcc, .L31
	 or	%o4, %l1, %o4
.L31:
	and	%o4, 0xff, %o4
	mov	%i0, %o1
	mov	%i3, %o3
	mov	64, %o2
	call	_blake3_compress_in_place_sse2, 0
	 mov	%l0, %o0
	add	%i0, 64, %i0
	add	%i1, -1, %i1
	ba,pt	%xcc, .L30
	 mov	%i4, %o4
	.size	hash_one_sse2, .-hash_one_sse2
	.align 4
	.global _blake3_hash_many_sse2
	.type	_blake3_hash_many_sse2, #function
	.proc	020
_blake3_hash_many_sse2:
	save	%sp, -208, %sp
	ldx	[%fp+2247], %l0
	ldub	[%fp+2230], %l6
	ldub	[%fp+2238], %l3
	ldub	[%fp+2246], %l4
	mov	%l0, %l5
	mov	%i1, %l1
	mov	%i0, %l2
.L34:
	cmp	%l1, 3
	bgu,a,pt %xcc, .L36
	 stx	%l5, [%sp+2239]
	srlx	%i1, 2, %g1
	sllx	%g1, 5, %g2
	add	%i0, %g2, %i0
	sllx	%g1, 2, %g2
	sllx	%g1, 7, %g1
	sub	%i1, %g2, %i1
	add	%l0, %g1, %l0
.L37:
	brnz,a,pt %i1, .L39
	 stx	%l0, [%sp+2231]
	return	%i7+8
	 nop
.L36:
	stx	%l4, [%sp+2231]
	stx	%l3, [%sp+2223]
	mov	%l6, %o5
	mov	%i5, %o4
	mov	%i4, %o3
	mov	%i3, %o2
	mov	%i2, %o1
	call	blake3_hash4_sse2, 0
	 mov	%l2, %o0
	brnz,a,pt %i5, .L35
	 add	%i4, 4, %i4
.L35:
	add	%l2, 32, %l2
	add	%l1, -4, %l1
	ba,pt	%xcc, .L34
	 add	%l5, 128, %l5
.L39:
	stx	%l4, [%sp+2223]
	mov	%l3, %o5
	mov	%l6, %o4
	mov	%i4, %o3
	mov	%i3, %o2
	mov	%i2, %o1
	call	hash_one_sse2, 0
	 ldx	[%i0], %o0
	brnz,a,pt %i5, .L38
	 add	%i4, 1, %i4
.L38:
	add	%i0, 8, %i0
	add	%i1, -1, %i1
	ba,pt	%xcc, .L37
	 add	%l0, 32, %l0
	.size	_blake3_hash_many_sse2, .-_blake3_hash_many_sse2
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
