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
 * This is converted assembly: SSE2 -> SPARC64 (V9)
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if defined(__SPARC64__)

.text
	.globl	_blake3_compress_in_place_sse2
	.p2align	2
	.type	_blake3_compress_in_place_sse2,@function
_blake3_compress_in_place_sse2:
	.register %g2, #scratch
	.register %g3, #scratch
	save %sp, -880, %sp
	ldub [%i0+6], %i5
	ldub [%i0+7], %g2
	ldub [%i0+4], %g3
	ldub [%i0+5], %g4
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %g3
	ldub [%i0+2], %i5
	ldub [%i0+3], %g2
	ldub [%i0], %g4
	ldub [%i0+1], %g5
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %l4
	ldub [%i0+14], %i5
	ldub [%i0+15], %g2
	ldub [%i0+12], %g4
	ldub [%i0+13], %g5
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %l6
	ldub [%i0+10], %i5
	ldub [%i0+11], %g2
	ldub [%i0+8], %g4
	ldub [%i0+9], %g5
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %l7
	ldub [%i0+18], %i5
	ldub [%i0+19], %g2
	ldub [%i0+16], %g4
	ldub [%i0+17], %g5
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %l1
	ldub [%i0+22], %i5
	ldub [%i0+23], %g2
	ldub [%i0+20], %g4
	ldub [%i0+21], %g5
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %l0
	ldub [%i0+27], %l2
	ldub [%i0+26], %l3
	ldub [%i0+25], %l5
	ldub [%i0+24], %o0
	ldub [%i0+31], %g2
	ldub [%i0+30], %g4
	ldub [%i0+29], %i5
	stx %i0, [%fp+1391]
	ldub [%i0+28], %g5
	ldub [%i1+6], %o1
	ldub [%i1+7], %o2
	ldub [%i1+4], %o3
	ldub [%i1+5], %o4
	sll %o1, 8, %o1
	or %o1, %o2, %o1
	sll %o3, 8, %o2
	or %o2, %o4, %o2
	sll %o2, 16, %o2
	or %o2, %o1, %o1
	st %o1, [%fp+1947]
	ld [%fp+1947], %f0
	sll %l3, 8, %l3
	or %l3, %l2, %l2
	sll %o0, 8, %l3
	st %f0, [%fp+2015]
	ldub [%i1+2], %o0
	ldub [%i1+3], %o1
	ldub [%i1], %o2
	ldub [%i1+1], %o3
	sll %o0, 8, %o0
	or %o0, %o1, %o0
	sll %o2, 8, %o1
	or %o1, %o3, %o1
	sll %o1, 16, %o1
	or %o1, %o0, %o0
	st %o0, [%fp+1979]
	ld [%fp+2015], %o4
	ld [%fp+1979], %f5
	ldub [%i1+14], %o0
	ldub [%i1+15], %o1
	ldub [%i1+12], %o2
	ldub [%i1+13], %o3
	sll %o0, 8, %o0
	or %o0, %o1, %o0
	sll %o2, 8, %o1
	or %o1, %o3, %o1
	sll %o1, 16, %o1
	or %o1, %o0, %o0
	st %o0, [%fp+1975]
	ld [%fp+1975], %f0
	or %l3, %l5, %l3
	sll %l3, 16, %l3
	or %l3, %l2, %l2
	st %f0, [%fp+1987]
	ldub [%i1+10], %l3
	ldub [%i1+11], %l5
	ldub [%i1+8], %o0
	ldub [%i1+9], %o1
	sll %l3, 8, %l3
	or %l3, %l5, %l3
	sll %o0, 8, %l5
	or %l5, %o1, %l5
	sll %l5, 16, %l5
	or %l5, %l3, %l3
	st %l3, [%fp+1919]
	ld [%fp+1987], %o5
	ld [%fp+1919], %f7
	ldub [%i1+22], %l3
	ldub [%i1+23], %l5
	ldub [%i1+20], %o0
	ldub [%i1+21], %o1
	sll %l3, 8, %l3
	or %l3, %l5, %l3
	sll %o0, 8, %l5
	or %l5, %o1, %l5
	sll %l5, 16, %l5
	or %l5, %l3, %l3
	st %l3, [%fp+1971]
	ld [%fp+1971], %f0
	sll %g4, 8, %g4
	or %g4, %g2, %g2
	sll %g5, 8, %g4
	st %f0, [%fp+1991]
	ldub [%i1+18], %g5
	ldub [%i1+19], %l3
	ldub [%i1+16], %l5
	ldub [%i1+17], %o0
	sll %g5, 8, %g5
	or %g5, %l3, %g5
	sll %l5, 8, %l3
	or %l3, %o0, %l3
	sll %l3, 16, %l3
	or %l3, %g5, %g5
	st %g5, [%fp+1923]
	ld [%fp+1991], %o1
	ld [%fp+1923], %f0
	ldub [%i1+30], %g5
	ldub [%i1+31], %l3
	ldub [%i1+28], %l5
	ldub [%i1+29], %o0
	sll %g5, 8, %g5
	or %g5, %l3, %g5
	sll %l5, 8, %l3
	or %l3, %o0, %l3
	sll %l3, 16, %l3
	or %l3, %g5, %g5
	st %g5, [%fp+1967]
	ld [%fp+1967], %f1
	or %g4, %i5, %i5
	sll %i5, 16, %i5
	or %i5, %g2, %g4
	st %f1, [%fp+1995]
	ldub [%i1+26], %i5
	ldub [%i1+27], %g2
	ldub [%i1+24], %g5
	ldub [%i1+25], %l3
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g5, 8, %g2
	or %g2, %l3, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %i5
	st %i5, [%fp+1927]
	ld [%fp+1995], %i5
	st %f0, [%fp+2039]
	ld [%fp+2039], %o3
	ld [%fp+1927], %f10
	ldub [%i1+38], %g2
	ldub [%i1+39], %g5
	ldub [%i1+36], %l3
	ldub [%i1+37], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1963]
	ldub [%i1+34], %g2
	ldub [%i1+35], %g5
	ldub [%i1+32], %l3
	ldub [%i1+33], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1931]
	ld [%fp+1963], %f2
	ld [%fp+1931], %f4
	ldub [%i1+46], %g2
	ldub [%i1+47], %g5
	ldub [%i1+44], %l3
	ldub [%i1+45], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1959]
	ldub [%i1+42], %g2
	ldub [%i1+43], %g5
	ldub [%i1+40], %l3
	ldub [%i1+41], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1935]
	ld [%fp+1959], %f3
	ld [%fp+1935], %f0
	ldub [%i1+54], %g2
	ldub [%i1+55], %g5
	ldub [%i1+52], %l3
	ldub [%i1+53], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1955]
	ldub [%i1+50], %g2
	ldub [%i1+51], %g5
	ldub [%i1+48], %l3
	ldub [%i1+49], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1939]
	ld [%fp+1955], %f1
	ld [%fp+1939], %f8
	ldub [%i1+62], %g2
	ldub [%i1+63], %g5
	ldub [%i1+60], %l3
	ldub [%i1+61], %l5
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %l5, %g5
	sll %g5, 16, %g5
	or %g5, %g2, %g2
	st %g2, [%fp+1951]
	ldub [%i1+58], %g2
	ldub [%i1+59], %g5
	ldub [%i1+56], %l3
	ldub [%i1+57], %i1
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %l3, 8, %g5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g2, %i1
	st %i1, [%fp+1943]
	ld [%fp+1951], %f6
	ld [%fp+1943], %f9
	st %f7, [%fp+2043]
	st %f5, [%fp+1983]
	st %f10, [%fp+2035]
	ld [%fp+1983], %i1
	srlx %i3, 32, %g5
	ld [%fp+2043], %o7
	ld [%fp+2035], %g2
	srl %i1, 0, %l3
	sllx %i1, 32, %l5
	or %l3, %l5, %i0
	stx %i0, [%fp+1447]
	srl %g2, 0, %l3
	sllx %g2, 32, %l5
	or %l3, %l5, %i0
	stx %i0, [%fp+1503]
	add %o3, %l7, %l3
	add %g2, %l6, %l5
	add %i1, %l4, %g2
	add %o7, %g3, %i1
	add %i1, %l0, %i1
	add %g2, %l1, %g2
	add %l5, %g4, %g3
	add %l3, %l2, %l3
	xor %l3, %i2, %i2
	sll %i2, 16, %l4
	srl %i2, 16, %i2
	or %i2, %l4, %l4
	xor %g3, %i4, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i4
	xor %g2, %i3, %i2
	sll %i2, 16, %i3
	srl %i2, 16, %i2
	or %i2, %i3, %i3
	xor %i1, %g5, %i2
	sll %i2, 16, %g5
	srl %i2, 16, %i2
	or %i2, %g5, %g5
	sethi 1737337, %i2
	or %i2, 615, %i2
	add %i3, %i2, %i2
	sethi 2708477, %l5
	or %l5, 314, %l5
	add %i4, %l5, %l5
	sethi 990140, %l6
	or %l6, 882, %l6
	add %l4, %l6, %l6
	xor %l6, %l2, %l2
	xor %l5, %g4, %g4
	xor %i2, %l1, %l1
	srl %l2, 12, %l7
	sll %l2, 20, %l2
	or %l2, %l7, %l2
	srl %g4, 12, %l7
	sll %g4, 20, %g4
	or %g4, %l7, %g4
	srl %l1, 12, %l7
	sll %l1, 20, %l1
	or %l1, %l7, %l1
	sethi 3070443, %l7
	or %l7, 645, %l7
	add %g5, %l7, %l7
	xor %l7, %l0, %l0
	srl %l0, 12, %o0
	sll %l0, 20, %l0
	or %l0, %o0, %l0
	st %o1, [%fp+1519]
	add %l3, %o1, %l3
	add %l2, %l3, %l3
	xor %l3, %l4, %l4
	srl %l4, 8, %o0
	sll %l4, 24, %l4
	or %l4, %o0, %l4
	add %g3, %i5, %g3
	add %g4, %g3, %g3
	xor %g3, %i4, %i4
	srl %i4, 8, %o0
	sll %i4, 24, %i4
	or %i4, %o0, %i4
	st %o4, [%fp+1479]
	add %g2, %o4, %g2
	add %l1, %g2, %g2
	xor %g2, %i3, %i3
	srl %i3, 8, %o0
	sll %i3, 24, %i3
	or %i3, %o0, %i3
	add %i1, %o5, %i1
	add %l0, %i1, %o0
	xor %o0, %g5, %i1
	srl %i1, 8, %g5
	sll %i1, 24, %i1
	or %i1, %g5, %g5
	add %l4, %l6, %i1
	xor %i1, %l2, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %l2
	add %i4, %l5, %l5
	xor %l5, %g4, %g4
	srl %g4, 7, %l6
	sll %g4, 25, %g4
	or %g4, %l6, %g4
	add %i3, %i2, %i2
	xor %i2, %l1, %l1
	srl %l1, 7, %l6
	sll %l1, 25, %l1
	or %l1, %l6, %l1
	add %g5, %l7, %l6
	xor %l6, %l0, %l0
	st %f4, [%fp+2031]
	st %f9, [%fp+2019]
	st %f8, [%fp+2023]
	st %f0, [%fp+2027]
	ld [%fp+2027], %o1
	srl %l0, 7, %l7
	sll %l0, 25, %l0
	or %l0, %l7, %l0
	st %o1, [%fp+1415]
	add %o0, %o1, %l7
	add %l2, %l7, %l7
	xor %l7, %i3, %i3
	ld [%fp+2023], %i0
	sll %i3, 16, %o0
	srl %i3, 16, %i3
	or %i3, %o0, %i3
	st %i0, [%fp+1351]
	add %l3, %i0, %l3
	add %g4, %l3, %l3
	xor %l3, %g5, %g5
	ld [%fp+2019], %o1
	sll %g5, 16, %o0
	srl %g5, 16, %g5
	or %g5, %o0, %g5
	st %o1, [%fp+1443]
	add %g3, %o1, %g3
	add %l1, %g3, %g3
	xor %g3, %l4, %l4
	ld [%fp+2031], %o1
	sll %l4, 16, %o0
	srl %l4, 16, %l4
	or %l4, %o0, %l4
	st %o1, [%fp+1487]
	add %g2, %o1, %g2
	add %l0, %g2, %g2
	xor %g2, %i4, %i4
	sll %i4, 16, %o0
	srl %i4, 16, %i4
	or %i4, %o0, %i4
	add %i3, %l5, %l5
	xor %l5, %l2, %l2
	srl %l2, 12, %o0
	sll %l2, 20, %l2
	or %l2, %o0, %l2
	add %g5, %i2, %i2
	xor %i2, %g4, %g4
	srl %g4, 12, %o0
	sll %g4, 20, %g4
	or %g4, %o0, %g4
	add %l4, %l6, %l6
	xor %l6, %l1, %l1
	srl %l1, 12, %o0
	sll %l1, 20, %l1
	or %l1, %o0, %l1
	add %i4, %i1, %i1
	xor %i1, %l0, %l0
	st %f2, [%fp+1999]
	st %f6, [%fp+2011]
	st %f1, [%fp+2007]
	st %f3, [%fp+2003]
	srl %l0, 12, %o0
	ld [%fp+2007], %o1
	ld [%fp+2003], %o2
	sll %l0, 20, %l0
	or %l0, %o0, %l0
	add %l3, %o1, %l3
	st %o2, [%fp+1467]
	add %l7, %o2, %l7
	add %l2, %l7, %l7
	xor %l7, %i3, %i3
	srl %i3, 8, %o0
	sll %i3, 24, %i3
	or %i3, %o0, %i3
	add %g4, %l3, %l3
	xor %l3, %g5, %g5
	ld [%fp+2011], %o1
	srl %g5, 8, %o0
	sll %g5, 24, %g5
	or %g5, %o0, %g5
	st %o1, [%fp+1383]
	add %g3, %o1, %g3
	add %l1, %g3, %g3
	xor %g3, %l4, %l4
	ld [%fp+1999], %o1
	srl %l4, 8, %o0
	sll %l4, 24, %l4
	or %l4, %o0, %l4
	st %o1, [%fp+1375]
	add %g2, %o1, %g2
	add %l0, %g2, %g2
	xor %g2, %i4, %i4
	srl %i4, 8, %o0
	sll %i4, 24, %i4
	or %i4, %o0, %i4
	add %i3, %l5, %l5
	xor %l5, %l2, %l2
	srl %l2, 7, %o0
	sll %l2, 25, %l2
	or %l2, %o0, %l2
	add %g5, %i2, %i2
	xor %i2, %g4, %g4
	srl %g4, 7, %o0
	sll %g4, 25, %g4
	or %g4, %o0, %o4
	add %l4, %l6, %g4
	xor %g4, %l1, %l1
	srl %l1, 7, %l6
	sll %l1, 25, %l1
	or %l1, %l6, %l1
	add %i4, %i1, %i1
	xor %i1, %l0, %l0
	srl %l0, 7, %l6
	sll %l0, 25, %l0
	or %l0, %l6, %l0
	add %l3, %i5, %l3
	add %l2, %l3, %l3
	st %l3, [%fp+1431]
	xor %l3, %l4, %l3
	sll %l3, 16, %l4
	srl %l3, 16, %l3
	or %l3, %l4, %l3
	add %g3, %o3, %g3
	add %o4, %g3, %o0
	xor %o0, %i4, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %o2
	add %g2, %o7, %i4
	add %l1, %i4, %i0
	st %i0, [%fp+1331]
	xor %i0, %i3, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %l6
	add %l7, %o5, %i3
	add %l0, %i3, %i0
	st %i0, [%fp+1343]
	xor %i0, %g5, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %i0
	sllx %i5, 32, %i3
	stx %o3, [%fp+1511]
	srl %o3, 0, %i4
	stx %i4, [%fp+1423]
	or %i4, %i3, %i3
	stx %i3, [%fp+1399]
	st %o5, [%fp+1471]
	srl %o5, 0, %i3
	stx %o7, [%fp+1455]
	sllx %o7, 32, %i4
	stx %i4, [%fp+1407]
	or %i3, %i4, %i3
	stx %i3, [%fp+1495]
	st %i0, [%fp+1327]
	add %i0, %g4, %o3
	add %l6, %i2, %i4
	add %o2, %l5, %i3
	mov	%l3, %i0
	add %l3, %i1, %g4
	xor %g4, %l2, %i2
	st %i3, [%fp+1339]
	xor %i3, %o4, %i3
	st %i4, [%fp+1335]
	xor %i4, %l1, %i4
	xor %o3, %l0, %i5
	srl %i3, 12, %i1
	sll %i3, 20, %l7
	srl %i2, 12, %g2
	sll %i2, 20, %g3
	srl %i5, 12, %i2
	sll %i5, 20, %l5
	srl %i4, 12, %o7
	sll %i4, 20, %l3
	mov	0, %o5
.LBB0_1:
	add %fp, 1903, %i5
	or %i5, 2, %o1
	sth %i3, [%o1]
	or %i5, 4, %i3
	sth %l4, [%i3]
	or %i5, 6, %l4
	sth %g5, [%l4]
	or %i5, 8, %g5
	sth %l1, [%g5]
	or %i5, 10, %l1
	sth %i4, [%l1]
	or %i5, 12, %i4
	sth %l0, [%i4]
	or %i5, 14, %l0
	sth %l2, [%l0]
	sth %o4, [%fp+1903]
	and %o5, 7, %l2
	sllx %l2, 1, %l2
	or %i5, %l2, %l2
	mov	204, %i5
	sth %i5, [%l2]
	lduh [%l0], %l2
	lduh [%i4], %l0
	lduh [%l1], %i4
	lduh [%g5], %l1
	lduh [%l4], %g5
	lduh [%i3], %l4
	lduh [%o1], %i3
	add %o5, 1, %o5
	cmp %o5, 8
	bne %xcc, .LBB0_1
	lduh [%fp+1903], %o4
	ba .LBB0_2
	nop
.LBB0_2:
	xor %l7, %i1, %o5
	xor %l3, %o7, %o7
	xor %g3, %g2, %g3
	xor %l5, %i2, %g2
	sll %l1, 16, %i1
	and %i4, 32, %i2
	or %i2, %i1, %i1
	sllx %i1, 32, %i1
	sll %l0, 16, %i2
	and %l2, 128, %i4
	or %i4, %i2, %i2
	srl %i2, 0, %i2
	or %i2, %i1, %i1
	sll %o4, 16, %i2
	and %i3, 2, %i3
	or %i3, %i2, %i2
	sllx %i2, 32, %i2
	sll %l4, 16, %i3
	and %g5, 8, %i4
	or %i4, %i3, %i3
	srl %i3, 0, %i3
	or %i3, %i2, %i2
	sethi 256, %i3
	or %i3, 8, %i3
	sethi 64, %i4
	or %i4, 2, %i4
	sllx %i4, 32, %i4
	or %i4, %i3, %i3
	stx %i3, [%fp+1543]
	and %i2, %i3, %i3
	sethi 4096, %i2
	or %i2, 128, %i2
	sethi 1024, %i4
	or %i4, 32, %i4
	sllx %i4, 32, %i4
	or %i4, %i2, %i2
	stx %i2, [%fp+1535]
	and %i1, %i2, %i4
	srl %i4, 16, %i2
	srlx %i4, 48, %g5
	mov	%g0, %i1
	cmp %g5, 16
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %i2, 64
	mov	%i1, %l0
	move	%icc, 1, %l0
	srlx %i3, 48, %i2
	cmp %i2, 1
	mov	%i1, %l1
	move	%icc, 1, %l1
	srl %i3, 16, %i2
	cmp %i2, 4
	mov	%i1, %l2
	move	%icc, 1, %l2
	srl %i3, 3, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %l3
	sethi 63, %i2
	or %i2, 1023, %i2
	and %l3, %i2, %l3
	sll %l2, 16, %l2
	sub %l3, %l2, %l2
	srlx %i3, 33, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %l1, 16, %l1
	sub %i3, %l1, %i3
	srl %i4, 7, %l1
	and %l1, 1, %l1
	sub %i1, %l1, %l1
	and %l1, %i2, %l1
	sll %l0, 16, %l0
	sub %l1, %l0, %l0
	st %f0, [%fp+1891]
	st %f0, [%fp+1887]
	st %f1, [%fp+1899]
	st %f1, [%fp+1895]
	srlx %i4, 37, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	ld [%fp+1895], %l1
	and %i4, %i2, %i4
	sll %g5, 16, %g5
	sub %i4, %g5, %i4
	and %i4, %l1, %g5
	ld [%fp+1899], %l1
	ldx [%fp+1447], %l4
	srlx %l4, 32, %l3
	andn %l3, %i4, %i4
	ld [%fp+1887], %l3
	and %l0, %l1, %l1
	andn %l4, %l0, %l0
	ld [%fp+1891], %l4
	and %i3, %l3, %l3
	ldx [%fp+1503], %l7
	srlx %l7, 32, %l5
	andn %l5, %i3, %i3
	and %l2, %l4, %l4
	andn %l7, %l2, %l2
	or %l2, %l4, %l7
	or %i3, %l3, %l4
	srl %l7, 0, %i3
	sllx %l4, 32, %l2
	or %i3, %l2, %i3
	stx %i3, [%fp+1359]
	or %l0, %l1, %i3
	or %i4, %g5, %l0
	srl %i3, 0, %i4
	sllx %l0, 32, %g5
	or %i4, %g5, %i4
	stx %i4, [%fp+1367]
	add %i3, %o0, %i3
	add %i3, %o5, %i3
	st %i3, [%fp+1323]
	xor %i3, %o2, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l3
	stx %l4, [%fp+1447]
	ld [%fp+1331], %i3
	add %l4, %i3, %i3
	add %i3, %o7, %l5
	xor %l5, %l6, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l6
	stx %l0, [%fp+1503]
	ld [%fp+1431], %i3
	add %l0, %i3, %i3
	add %i3, %g3, %l2
	xor %l2, %i0, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l1
	st %l7, [%fp+1431]
	ld [%fp+1343], %i0
	add %l7, %i0, %i3
	add %i3, %g2, %o2
	ld [%fp+1327], %i0
	xor %o2, %i0, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l4
	add %l4, %o3, %i4
	add %l1, %g4, %g4
	sllx %i4, 32, %i3
	srl %g4, 0, %g5
	or %g5, %i3, %i0
	stx %i0, [%fp+1343]
	ld [%fp+1335], %i0
	add %l6, %i0, %g5
	ld [%fp+1339], %i0
	add %l3, %i0, %l0
	srl %g5, 0, %i3
	sllx %l0, 32, %l7
	or %i3, %l7, %i3
	xor %i4, %g2, %i4
	xor %g5, %o7, %g2
	xor %l0, %o5, %g5
	xor %g4, %g3, %g3
	srl %g3, 7, %g4
	srl %i4, 7, %l0
	sll %i4, 25, %i4
	or %i4, %l0, %i4
	srl %g2, 7, %l0
	sll %g2, 25, %g2
	or %g2, %l0, %g2
	srl %g5, 7, %l0
	sll %g3, 25, %g3
	sll %g5, 25, %g5
	srl %i4, 0, %i4
	sllx %g2, 32, %g2
	or %i4, %g2, %i4
	or %g5, %l0, %g2
	srl %g2, 0, %g2
	or %g3, %g4, %g3
	sllx %g3, 32, %g3
	or %g2, %g3, %l0
	mov	0, %g3
.LBB0_3:
	add %fp, 1871, %g2
	or %g2, 2, %o0
	sth %g5, [%o0]
	or %g2, 4, %g5
	sth %o5, [%g5]
	or %g2, 6, %o5
	sth %o1, [%o5]
	or %g2, 8, %o1
	sth %g4, [%o1]
	or %g2, 10, %g4
	sth %o4, [%g4]
	or %g2, 12, %o4
	sth %o7, [%o4]
	or %g2, 14, %o7
	sth %o3, [%o7]
	sth %l7, [%fp+1871]
	and %g3, 7, %l7
	sllx %l7, 1, %l7
	or %g2, %l7, %l7
	mov	192, %g2
	sth %g2, [%l7]
	lduh [%o7], %o3
	lduh [%o4], %o7
	lduh [%g4], %o4
	lduh [%o1], %g4
	lduh [%o5], %o1
	lduh [%g5], %o5
	lduh [%o0], %g5
	add %g3, 1, %g3
	cmp %g3, 8
	bne %xcc, .LBB0_3
	lduh [%fp+1871], %l7
	ba .LBB0_4
	nop
.LBB0_4:
	sll %g4, 16, %g3
	and %o4, 32, %g4
	or %g4, %g3, %g3
	sll %o7, 16, %g4
	and %o3, 128, %o0
	or %o0, %g4, %g4
	sllx %g3, 32, %g3
	srl %g4, 0, %g4
	or %g4, %g3, %g3
	sll %l7, 16, %g4
	and %g5, 2, %g5
	or %g5, %g4, %g4
	sll %o5, 16, %g5
	and %o1, 8, %l7
	or %l7, %g5, %g5
	sllx %g4, 32, %g4
	srl %g5, 0, %g5
	or %g5, %g4, %g4
	ldx [%fp+1535], %g5
	and %g3, %g5, %g3
	srl %g3, 16, %g5
	cmp %g5, 64
	ldx [%fp+1543], %g5
	and %g4, %g5, %g4
	mov	%i1, %g5
	move	%icc, 1, %g5
	srl %g4, 16, %l7
	cmp %l7, 4
	mov	%i1, %l7
	move	%icc, 1, %l7
	srlx %g3, 48, %o0
	cmp %o0, 16
	mov	%i1, %o0
	move	%icc, 1, %o0
	srlx %g4, 48, %o1
	cmp %o1, 1
	mov	%i1, %o1
	move	%icc, 1, %o1
	srlx %g4, 33, %o3
	and %o3, 1, %o3
	sub %i1, %o3, %o3
	and %o3, %i2, %o3
	sll %o1, 16, %o1
	sub %o3, %o1, %o1
	srlx %g3, 37, %o3
	and %o3, 1, %o3
	sub %i1, %o3, %o3
	and %o3, %i2, %o3
	sll %o0, 16, %o0
	sub %o3, %o0, %o0
	srl %g4, 3, %g4
	and %g4, 1, %g4
	sub %i1, %g4, %g4
	and %g4, %i2, %g4
	sll %l7, 16, %l7
	sub %g4, %l7, %g4
	srl %g3, 7, %g3
	and %g3, 1, %g3
	sub %i1, %g3, %g3
	st %i2, [%fp+1531]
	and %g3, %i2, %g3
	sll %g5, 16, %g5
	sub %g3, %g5, %g3
	ld [%fp+1351], %i0
	and %g3, %i0, %g5
	ld [%fp+1471], %l7
	andn %l7, %g3, %g3
	ld [%fp+1415], %i2
	and %o0, %i2, %l7
	ld [%fp+1479], %o3
	andn %o3, %o0, %o0
	ld [%fp+1383], %i0
	andn %i0, %o1, %o3
	ld [%fp+1443], %o7
	and %o1, %o7, %o1
	or %o3, %o1, %i2
	or %o0, %l7, %o0
	ld [%fp+1375], %i0
	andn %i0, %g4, %l7
	ld [%fp+1487], %o5
	and %g4, %o5, %g4
	or %l7, %g4, %l7
	or %g3, %g5, %i0
	add %i0, %o2, %g3
	srlx %l0, 32, %g4
	add %g3, %g4, %g3
	xor %g3, %l6, %g5
	sll %g5, 16, %l6
	srl %g5, 16, %g5
	or %g5, %l6, %g5
	st %l7, [%fp+1383]
	add %l7, %l2, %l2
	add %l2, %l0, %l2
	xor %l2, %l4, %l4
	sll %l4, 16, %l6
	srl %l4, 16, %l4
	or %l4, %l6, %l4
	st %o0, [%fp+1471]
	add %o0, %l5, %l5
	add %l5, %i4, %l5
	xor %l5, %l3, %l3
	sll %l3, 16, %l6
	srl %l3, 16, %l3
	or %l3, %l6, %l3
	st %i2, [%fp+1415]
	ld [%fp+1323], %l6
	add %i2, %l6, %l6
	srlx %i4, 32, %l7
	add %l6, %l7, %l6
	xor %l6, %l1, %l1
	sll %l1, 16, %o0
	srl %l1, 16, %l1
	or %l1, %o0, %l1
	srlx %i3, 32, %o0
	add %g5, %o0, %o0
	xor %o0, %g4, %g4
	srl %g4, 12, %o1
	sll %g4, 20, %g4
	or %g4, %o1, %g4
	add %l4, %i3, %o1
	xor %o1, %l0, %i3
	srl %i3, 12, %l0
	sll %i3, 20, %i3
	or %i3, %l0, %l0
	ldx [%fp+1343], %i2
	add %l3, %i2, %o2
	xor %o2, %i4, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o3
	srlx %i2, 32, %i3
	add %l1, %i3, %o4
	xor %o4, %l7, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %l7
	ld [%fp+1519], %i3
	add %g3, %i3, %i3
	add %g4, %i3, %g3
	xor %g3, %g5, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %g5
	add %l2, %o7, %i3
	add %l0, %i3, %l2
	xor %l2, %l4, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l4
	ld [%fp+1467], %i3
	add %l5, %i3, %i3
	add %o3, %i3, %l5
	xor %l5, %l3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l3
	add %l6, %o5, %i3
	add %l7, %i3, %l6
	xor %l6, %l1, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l1
	add %g5, %o0, %i3
	xor %i3, %g4, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %i4
	add %l4, %o1, %o1
	xor %o1, %l0, %g4
	srl %g4, 7, %l0
	sll %g4, 25, %g4
	or %g4, %l0, %o0
	add %l3, %o2, %l0
	xor %l0, %o3, %g4
	srl %g4, 7, %o2
	sll %g4, 25, %g4
	or %g4, %o2, %o3
	add %l1, %o4, %o2
	xor %o2, %l7, %g4
	srl %g4, 7, %l7
	sll %g4, 25, %g4
	or %g4, %l7, %l7
	ldx [%fp+1495], %o5
	sllx %o5, 32, %g4
	ldx [%fp+1359], %i2
	srl %i2, 0, %o4
	or %o4, %g4, %g4
	stx %g4, [%fp+1479]
	add %g3, %i2, %g3
	ldx [%fp+1367], %o4
	add %l2, %o4, %g4
	add %i4, %g4, %i2
	st %i2, [%fp+1359]
	xor %i2, %l1, %g4
	sll %g4, 16, %l1
	srl %g4, 16, %g4
	or %g4, %l1, %l2
	ldx [%fp+1399], %i2
	srlx %i2, 32, %i2
	add %l6, %i2, %g4
	add %o0, %g4, %g4
	st %g4, [%fp+1335]
	xor %g4, %l3, %g4
	sll %g4, 16, %l1
	srl %g4, 16, %g4
	or %g4, %l1, %l1
	add %o3, %g3, %g3
	st %g3, [%fp+1339]
	xor %g3, %l4, %g3
	sll %g3, 16, %g4
	srl %g3, 16, %g3
	or %g3, %g4, %l3
	add %l5, %o5, %g3
	add %l7, %g3, %g3
	st %g3, [%fp+1327]
	xor %g3, %g5, %g3
	sll %g3, 16, %g4
	srl %g3, 16, %g3
	or %g3, %g4, %l4
	st %i0, [%fp+1351]
	st %i0, [%fp+1867]
	ld [%fp+1867], %f0
	st %o7, [%fp+1863]
	ldx [%fp+1455], %g3
	srl %g3, 0, %g3
	ldx [%fp+1407], %g4
	or %g3, %g4, %g4
	ldx [%fp+1511], %g3
	sllx %g3, 32, %g3
	ldx [%fp+1423], %g5
	or %g5, %g3, %i0
	sllx %o4, 32, %g5
	stx %i2, [%fp+1407]
	or %i2, %g5, %i2
	stx %i2, [%fp+1399]
	st %l4, [%fp+1331]
	add %l4, %o1, %g3
	st %l3, [%fp+1343]
	add %l3, %o2, %l3
	st %l1, [%fp+1307]
	add %l1, %i3, %i2
	st %l2, [%fp+1423]
	add %l2, %l0, %i3
	st %i3, [%fp+1315]
	xor %i3, %i4, %g5
	st %i2, [%fp+1323]
	xor %i2, %o0, %i3
	st %l3, [%fp+1311]
	xor %l3, %o3, %l2
	st %g3, [%fp+1319]
	xor %g3, %l7, %i4
	srl %i3, 12, %o4
	sll %i3, 20, %o5
	srl %i4, 12, %i3
	sll %i4, 20, %l0
	srl %g5, 12, %i4
	sll %g5, 20, %l1
	ld [%fp+1863], %f1
	srl %l2, 12, %l6
	sll %l2, 20, %l2
	mov	0, %l5
.LBB0_5:
	add %fp, 1839, %o2
	or %o2, 2, %g3
	sth %o3, [%g3]
	or %o2, 4, %o3
	sth %l3, [%o3]
	or %o2, 6, %l3
	sth %l7, [%l3]
	or %o2, 8, %l7
	sth %o7, [%l7]
	or %o2, 10, %o7
	sth %o1, [%o7]
	or %o2, 12, %o1
	sth %l4, [%o1]
	or %o2, 14, %l4
	sth %o0, [%l4]
	sth %g5, [%fp+1839]
	and %l5, 7, %g5
	sllx %g5, 1, %g5
	or %o2, %g5, %g5
	sth %i5, [%g5]
	lduh [%l4], %o0
	lduh [%o1], %l4
	lduh [%o7], %o1
	lduh [%l7], %o7
	lduh [%l3], %l7
	lduh [%o3], %l3
	lduh [%g3], %o3
	add %l5, 1, %l5
	cmp %l5, 8
	bne %xcc, .LBB0_5
	lduh [%fp+1839], %g5
	ba .LBB0_6
	nop
.LBB0_6:
	xor %o5, %o4, %o5
	xor %l0, %i3, %i3
	xor %l1, %i4, %o4
	xor %l2, %l6, %i4
	sll %o7, 16, %g3
	and %o1, 32, %l0
	or %l0, %g3, %g3
	st %f0, [%fp+1827]
	st %f0, [%fp+1823]
	st %f1, [%fp+1835]
	st %f1, [%fp+1831]
	sllx %g3, 32, %g3
	sll %l4, 16, %l0
	and %o0, 128, %l1
	or %l1, %l0, %l0
	srl %l0, 0, %l0
	or %l0, %g3, %g3
	sll %g5, 16, %g5
	and %o3, 2, %l0
	or %l0, %g5, %g5
	sllx %g5, 32, %g5
	sll %l3, 16, %l0
	and %l7, 8, %l1
	or %l1, %l0, %l0
	srl %l0, 0, %l0
	or %l0, %g5, %g5
	ldx [%fp+1543], %l0
	and %g5, %l0, %g5
	srl %g5, 16, %l0
	srlx %g5, 48, %l1
	ldx [%fp+1535], %l2
	and %g3, %l2, %g3
	srl %g3, 16, %l2
	srlx %g3, 48, %l3
	cmp %l3, 16
	mov	%i1, %l3
	move	%icc, 1, %l3
	cmp %l2, 64
	mov	%i1, %l2
	move	%icc, 1, %l2
	cmp %l1, 1
	mov	%i1, %l1
	move	%icc, 1, %l1
	cmp %l0, 4
	mov	%i1, %l0
	move	%icc, 1, %l0
	srl %g5, 3, %l4
	and %l4, 1, %l4
	sub %i1, %l4, %l4
	ld [%fp+1531], %i2
	and %l4, %i2, %l4
	sll %l0, 16, %l0
	sub %l4, %l0, %l0
	ld [%fp+1835], %l4
	srlx %g5, 33, %g5
	and %g5, 1, %g5
	sub %i1, %g5, %g5
	and %g5, %i2, %g5
	sll %l1, 16, %l1
	sub %g5, %l1, %g5
	srl %g3, 7, %l1
	and %l1, 1, %l1
	sub %i1, %l1, %l1
	and %l1, %i2, %l1
	sll %l2, 16, %l2
	sub %l1, %l2, %l1
	ld [%fp+1831], %l2
	srlx %g3, 37, %g3
	and %g3, 1, %g3
	sub %i1, %g3, %g3
	and %g3, %i2, %g3
	sll %l3, 16, %l3
	sub %g3, %l3, %g3
	and %g3, %l2, %l2
	srlx %g4, 32, %l3
	andn %l3, %g3, %g3
	ld [%fp+1823], %l3
	and %l1, %l4, %l4
	andn %g4, %l1, %g4
	ld [%fp+1827], %l1
	and %g5, %l3, %l3
	srlx %i0, 32, %l5
	andn %l5, %g5, %g5
	and %l0, %l1, %l1
	andn %i0, %l0, %l0
	or %l0, %l1, %l5
	srl %l5, 0, %l0
	or %g5, %l3, %l1
	sllx %l1, 32, %g5
	or %l0, %g5, %g5
	stx %g5, [%fp+1367]
	or %g4, %l4, %g4
	srl %g4, 0, %g5
	or %g3, %l2, %l0
	sllx %l0, 32, %g3
	or %g5, %g3, %g3
	stx %g3, [%fp+1375]
	ld [%fp+1335], %g3
	add %g4, %g3, %g3
	stx %l1, [%fp+1455]
	ld [%fp+1327], %g4
	add %l1, %g4, %g4
	stx %l0, [%fp+1511]
	ld [%fp+1359], %g5
	add %l0, %g5, %g5
	st %l5, [%fp+1443]
	ld [%fp+1339], %l0
	add %l5, %l0, %l0
	add %l0, %i4, %l6
	add %g5, %o4, %o0
	add %g4, %i3, %l4
	add %g3, %o5, %l2
	ld [%fp+1307], %i0
	xor %l2, %i0, %g3
	ld [%fp+1331], %i0
	xor %l4, %i0, %g4
	ld [%fp+1423], %i0
	xor %o0, %i0, %g5
	ld [%fp+1343], %i0
	xor %l6, %i0, %l0
	srl %l0, 8, %l1
	srl %g5, 8, %l3
	srl %g4, 8, %l5
	srl %g3, 8, %l7
	sll %l0, 24, %o1
	sll %g5, 24, %g5
	sll %g4, 24, %g4
	sll %g3, 24, %g3
	or %g3, %l7, %l0
	or %g4, %l5, %l7
	or %g5, %l3, %i0
	or %o1, %l1, %l3
	ld [%fp+1311], %g3
	add %l3, %g3, %g3
	sllx %g3, 32, %g4
	st %i0, [%fp+1339]
	ld [%fp+1315], %g5
	add %i0, %g5, %l1
	srl %l1, 0, %l5
	or %l5, %g4, %g4
	stx %g4, [%fp+1359]
	ld [%fp+1319], %i0
	add %l7, %i0, %g4
	srl %g4, 0, %l5
	ld [%fp+1323], %i0
	add %l0, %i0, %o2
	sllx %o2, 32, %o1
	or %l5, %o1, %i0
	stx %i0, [%fp+1343]
	xor %g3, %i4, %i4
	xor %g4, %i3, %i3
	xor %o2, %o5, %g3
	xor %l1, %o4, %g4
	srl %g4, 7, %l5
	srl %g3, 7, %o2
	srl %i3, 7, %l1
	srl %i4, 7, %o3
	sll %g4, 25, %g4
	sll %g3, 25, %g3
	sll %i3, 25, %i3
	sll %i4, 25, %i4
	or %i4, %o3, %i4
	srl %i4, 0, %i4
	or %i3, %l1, %i3
	sllx %i3, 32, %i3
	or %i4, %i3, %l1
	or %g3, %o2, %i3
	srl %i3, 0, %i3
	or %g4, %l5, %i4
	sllx %i4, 32, %i4
	or %i3, %i4, %l5
	mov	0, %i3
.LBB0_7:
	add %fp, 1807, %o1
	or %o1, 2, %g5
	sth %g3, [%g5]
	or %o1, 4, %g3
	sth %o5, [%g3]
	or %o1, 6, %o5
	sth %o3, [%o5]
	or %o1, 8, %o3
	sth %o2, [%o3]
	or %o1, 10, %o2
	sth %g4, [%o2]
	or %o1, 12, %g4
	sth %o7, [%g4]
	or %o1, 14, %o7
	sth %o4, [%o7]
	sth %i4, [%fp+1807]
	and %i3, 7, %i4
	sllx %i4, 1, %i4
	or %o1, %i4, %i4
	sth %g2, [%i4]
	lduh [%o7], %o4
	lduh [%g4], %o7
	lduh [%o2], %g4
	lduh [%o3], %o2
	lduh [%o5], %o3
	lduh [%g3], %o5
	lduh [%g5], %g3
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB0_7
	lduh [%fp+1807], %i4
	ba .LBB0_8
	nop
.LBB0_8:
	sll %o2, 16, %i3
	and %g4, 32, %g4
	or %g4, %i3, %i3
	sll %o7, 16, %g4
	and %o4, 128, %g5
	or %g5, %g4, %g4
	sllx %i3, 32, %i3
	srl %g4, 0, %g4
	or %g4, %i3, %i3
	sll %i4, 16, %i4
	and %g3, 2, %g3
	or %g3, %i4, %i4
	sll %o5, 16, %g3
	and %o3, 8, %g4
	or %g4, %g3, %g3
	sllx %i4, 32, %i4
	srl %g3, 0, %g3
	or %g3, %i4, %i4
	ldx [%fp+1535], %g3
	and %i3, %g3, %i3
	srl %i3, 16, %g3
	cmp %g3, 64
	ldx [%fp+1543], %g3
	and %i4, %g3, %i4
	mov	%i1, %g3
	move	%icc, 1, %g3
	srl %i4, 16, %g4
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srlx %i3, 48, %g5
	cmp %g5, 16
	mov	%i1, %g5
	move	%icc, 1, %g5
	srlx %i4, 48, %o1
	cmp %o1, 1
	mov	%i1, %o1
	move	%icc, 1, %o1
	srlx %i4, 33, %o2
	and %o2, 1, %o2
	sub %i1, %o2, %o2
	and %o2, %i2, %o2
	sll %o1, 16, %o1
	sub %o2, %o1, %o1
	srlx %i3, 37, %o2
	and %o2, 1, %o2
	sub %i1, %o2, %o2
	and %o2, %i2, %o2
	sll %g5, 16, %g5
	sub %o2, %g5, %g5
	srl %i4, 3, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %g3, 16, %g3
	sub %i3, %g3, %i3
	ld [%fp+1383], %i2
	and %i3, %i2, %g3
	ld [%fp+1431], %g4
	andn %g4, %i3, %i3
	ld [%fp+1351], %i0
	and %g5, %i0, %g4
	ldx [%fp+1447], %o2
	andn %o2, %g5, %g5
	ld [%fp+1487], %o2
	andn %o2, %o1, %o2
	ld [%fp+1415], %i2
	and %o1, %i2, %o1
	or %o2, %o1, %o2
	ld [%fp+1467], %o1
	andn %o1, %i4, %o1
	ld [%fp+1471], %o3
	and %i4, %o3, %i4
	or %g5, %g4, %g5
	or %o1, %i4, %i4
	or %i3, %g3, %i0
	add %i0, %l6, %g3
	st %i4, [%fp+1383]
	add %i4, %o0, %g4
	st %g5, [%fp+1467]
	add %g5, %l4, %i4
	st %o2, [%fp+1423]
	add %o2, %l2, %i3
	srlx %l5, 32, %g5
	srlx %l1, 32, %l2
	add %i3, %l2, %i3
	add %i4, %l1, %i4
	add %g4, %l5, %g4
	add %g3, %g5, %g3
	xor %g3, %l7, %l4
	sll %l4, 16, %l6
	srl %l4, 16, %l4
	or %l4, %l6, %l4
	xor %g4, %l3, %l3
	sll %l3, 16, %l6
	srl %l3, 16, %l3
	or %l3, %l6, %l3
	xor %i4, %l0, %l0
	sll %l0, 16, %l6
	srl %l0, 16, %l0
	or %l0, %l6, %l0
	ld [%fp+1339], %l6
	xor %i3, %l6, %l6
	sll %l6, 16, %l7
	srl %l6, 16, %l6
	or %l6, %l7, %l6
	ldx [%fp+1343], %o1
	srlx %o1, 32, %l7
	add %l4, %l7, %l7
	xor %l7, %g5, %g5
	srl %g5, 12, %o0
	sll %g5, 20, %g5
	or %g5, %o0, %g5
	add %l3, %o1, %o0
	xor %o0, %l5, %l5
	srl %l5, 12, %o1
	sll %l5, 20, %l5
	or %l5, %o1, %l5
	ldx [%fp+1359], %o4
	add %l0, %o4, %o2
	xor %o2, %l1, %l1
	srl %l1, 12, %o1
	sll %l1, 20, %l1
	or %l1, %o1, %l1
	srlx %o4, 32, %o1
	add %l6, %o1, %o5
	xor %o5, %l2, %l2
	srl %l2, 12, %o1
	sll %l2, 20, %l2
	or %l2, %o1, %l2
	ldx [%fp+1503], %o1
	add %g3, %o1, %g3
	add %g5, %g3, %g3
	xor %g3, %l4, %l4
	srl %l4, 8, %o1
	sll %l4, 24, %l4
	or %l4, %o1, %l4
	add %g4, %i2, %g4
	add %l5, %g4, %g4
	xor %g4, %l3, %l3
	srl %l3, 8, %o1
	sll %l3, 24, %l3
	or %l3, %o1, %l3
	ld [%fp+1519], %o1
	add %i4, %o1, %i4
	add %l1, %i4, %i4
	xor %i4, %l0, %l0
	srl %l0, 8, %o1
	sll %l0, 24, %l0
	or %l0, %o1, %l0
	add %i3, %o3, %i3
	add %l2, %i3, %i3
	xor %i3, %l6, %l6
	srl %l6, 8, %o1
	sll %l6, 24, %l6
	or %l6, %o1, %o7
	add %l4, %l7, %l7
	xor %l7, %g5, %g5
	srl %g5, 7, %l6
	sll %g5, 25, %g5
	or %g5, %l6, %o1
	add %l3, %o0, %l6
	xor %l6, %l5, %g5
	srl %g5, 7, %l5
	sll %g5, 25, %g5
	or %g5, %l5, %o3
	add %l0, %o2, %o0
	xor %o0, %l1, %g5
	srl %g5, 7, %l1
	sll %g5, 25, %g5
	or %g5, %l1, %o4
	add %o7, %o5, %g5
	xor %g5, %l2, %l1
	srl %l1, 7, %l2
	sll %l1, 25, %l1
	or %l1, %l2, %l1
	ldx [%fp+1479], %o2
	sllx %o2, 32, %l2
	ldx [%fp+1367], %o5
	srl %o5, 0, %l5
	or %l5, %l2, %l2
	stx %l2, [%fp+1487]
	add %g3, %o5, %g3
	ldx [%fp+1375], %o5
	add %g4, %o5, %g4
	add %o1, %g4, %g4
	st %g4, [%fp+1431]
	xor %g4, %o7, %g4
	sll %g4, 16, %l2
	srl %g4, 16, %g4
	or %g4, %l2, %o7
	ldx [%fp+1399], %g4
	srlx %g4, 32, %l2
	add %i3, %l2, %i3
	add %o3, %i3, %i3
	st %i3, [%fp+1447]
	xor %i3, %l0, %i3
	sll %i3, 16, %g4
	srl %i3, 16, %i3
	or %i3, %g4, %g4
	add %o4, %g3, %i3
	st %i3, [%fp+1339]
	xor %i3, %l3, %i3
	sll %i3, 16, %g3
	srl %i3, 16, %i3
	or %i3, %g3, %g3
	add %i4, %o2, %i3
	add %l1, %i3, %i3
	st %i3, [%fp+1331]
	xor %i3, %l4, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %l0
	st %i0, [%fp+1399]
	st %i0, [%fp+1803]
	ld [%fp+1803], %f0
	st %i2, [%fp+1799]
	ldx [%fp+1495], %i4
	srl %i4, 0, %i3
	sllx %i4, 32, %i4
	or %i3, %i4, %i0
	stx %i0, [%fp+1495]
	ldx [%fp+1407], %i2
	srl %i2, 0, %i3
	sllx %i2, 32, %i4
	or %i3, %i4, %l5
	sllx %o5, 32, %i3
	stx %l2, [%fp+1407]
	or %l2, %i3, %i0
	stx %i0, [%fp+1375]
	st %l0, [%fp+1335]
	add %l0, %l6, %i2
	st %g3, [%fp+1343]
	add %g3, %g5, %g3
	st %g4, [%fp+1351]
	add %g4, %l7, %i0
	st %o7, [%fp+1415]
	add %o7, %o0, %i3
	st %i3, [%fp+1319]
	xor %i3, %o1, %i3
	st %i0, [%fp+1327]
	xor %i0, %o3, %i4
	st %g3, [%fp+1315]
	xor %g3, %o4, %l2
	st %i2, [%fp+1323]
	xor %i2, %l1, %g5
	srl %i4, 12, %o1
	sll %i4, 20, %l0
	srl %g5, 12, %g3
	sll %g5, 20, %o5
	srl %i3, 12, %o3
	sll %i3, 20, %g5
	ld [%fp+1799], %f1
	srl %l2, 12, %i4
	sll %l2, 20, %l1
	mov	0, %l3
.LBB0_9:
	add %fp, 1775, %o7
	or %o7, 2, %g4
	sth %l6, [%g4]
	or %o7, 4, %l6
	sth %l4, [%l6]
	or %o7, 6, %l4
	sth %i3, [%l4]
	or %o7, 8, %i3
	sth %o0, [%i3]
	or %o7, 10, %o0
	sth %o2, [%o0]
	or %o7, 12, %o2
	sth %l2, [%o2]
	or %o7, 14, %l2
	sth %o4, [%l2]
	sth %l7, [%fp+1775]
	and %l3, 7, %l7
	sllx %l7, 1, %l7
	or %o7, %l7, %l7
	sth %i5, [%l7]
	lduh [%l2], %o4
	lduh [%o2], %l2
	lduh [%o0], %o2
	lduh [%i3], %o0
	lduh [%l4], %i3
	lduh [%l6], %l4
	lduh [%g4], %l6
	add %l3, 1, %l3
	cmp %l3, 8
	bne %xcc, .LBB0_9
	lduh [%fp+1775], %l7
	ba .LBB0_10
	nop
.LBB0_10:
	xor %l0, %o1, %o1
	xor %o5, %g3, %g3
	xor %g5, %o3, %o5
	xor %l1, %i4, %o3
	sll %o0, 16, %i4
	and %o2, 32, %g4
	or %g4, %i4, %i4
	st %f0, [%fp+1763]
	st %f0, [%fp+1759]
	st %f1, [%fp+1771]
	st %f1, [%fp+1767]
	sllx %i4, 32, %i4
	sll %l2, 16, %g4
	and %o4, 128, %g5
	or %g5, %g4, %g4
	srl %g4, 0, %g4
	or %g4, %i4, %i4
	sll %l7, 16, %g4
	and %l6, 2, %g5
	or %g5, %g4, %g4
	sllx %g4, 32, %g4
	sll %l4, 16, %g5
	and %i3, 8, %i3
	or %i3, %g5, %i3
	srl %i3, 0, %i3
	or %i3, %g4, %i3
	ldx [%fp+1543], %g4
	and %i3, %g4, %i3
	srl %i3, 16, %g4
	srlx %i3, 48, %g5
	ldx [%fp+1535], %l0
	and %i4, %l0, %i4
	srl %i4, 16, %l0
	srlx %i4, 48, %l1
	cmp %l1, 16
	mov	%i1, %l1
	move	%icc, 1, %l1
	cmp %l0, 64
	mov	%i1, %l0
	move	%icc, 1, %l0
	cmp %g5, 1
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srl %i3, 3, %l2
	and %l2, 1, %l2
	sub %i1, %l2, %l2
	ld [%fp+1531], %i2
	and %l2, %i2, %l2
	sll %g4, 16, %g4
	sub %l2, %g4, %g4
	ld [%fp+1771], %l2
	srlx %i3, 33, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %g5, 16, %g5
	sub %i3, %g5, %i3
	srl %i4, 7, %g5
	and %g5, 1, %g5
	sub %i1, %g5, %g5
	and %g5, %i2, %g5
	sll %l0, 16, %l0
	sub %g5, %l0, %g5
	ld [%fp+1767], %l0
	srlx %i4, 37, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %l1, 16, %l1
	sub %i4, %l1, %i4
	and %i4, %l0, %l0
	ldx [%fp+1495], %i0
	srlx %i0, 32, %l1
	andn %l1, %i4, %i4
	ld [%fp+1759], %l1
	and %g5, %l2, %l2
	andn %i0, %g5, %g5
	ld [%fp+1763], %l3
	and %i3, %l1, %l1
	srlx %l5, 32, %l4
	andn %l4, %i3, %i3
	and %g4, %l3, %l3
	andn %l5, %g4, %g4
	or %g4, %l3, %l3
	srl %l3, 0, %g4
	or %i3, %l1, %l1
	sllx %l1, 32, %i3
	or %g4, %i3, %i0
	stx %i0, [%fp+1359]
	or %g5, %l2, %i3
	srl %i3, 0, %g4
	or %i4, %l0, %g5
	sllx %g5, 32, %i4
	or %g4, %i4, %i0
	stx %i0, [%fp+1367]
	ld [%fp+1447], %i0
	add %i3, %i0, %i3
	stx %l1, [%fp+1447]
	ld [%fp+1331], %i0
	add %l1, %i0, %i4
	stx %g5, [%fp+1495]
	ld [%fp+1431], %i0
	add %g5, %i0, %g4
	st %l3, [%fp+1431]
	ld [%fp+1339], %i0
	add %l3, %i0, %g5
	add %g5, %o3, %o4
	add %g4, %o5, %l5
	add %i4, %g3, %l3
	add %i3, %o1, %l2
	ld [%fp+1351], %i0
	xor %l2, %i0, %i3
	ld [%fp+1335], %i0
	xor %l3, %i0, %i4
	ld [%fp+1415], %i0
	xor %l5, %i0, %g4
	ld [%fp+1343], %i0
	xor %o4, %i0, %g5
	srl %g5, 8, %l1
	srl %g4, 8, %l4
	srl %i4, 8, %l6
	srl %i3, 8, %l0
	sll %g5, 24, %o0
	sll %g4, 24, %g4
	sll %i4, 24, %i4
	sll %i3, 24, %i3
	or %i3, %l0, %l0
	or %i4, %l6, %l7
	or %g4, %l4, %i0
	or %o0, %l1, %l4
	ld [%fp+1315], %i3
	add %l4, %i3, %i3
	sllx %i3, 32, %i4
	st %i0, [%fp+1339]
	ld [%fp+1319], %g4
	add %i0, %g4, %g4
	srl %g4, 0, %l1
	or %l1, %i4, %i0
	stx %i0, [%fp+1351]
	ld [%fp+1323], %i0
	add %l7, %i0, %l1
	srl %l1, 0, %i4
	ld [%fp+1327], %i0
	add %l0, %i0, %l6
	sllx %l6, 32, %o0
	or %i4, %o0, %i0
	stx %i0, [%fp+1343]
	xor %i3, %o3, %i3
	xor %l1, %g3, %g3
	xor %l6, %o1, %l1
	xor %g4, %o5, %g4
	srl %g4, 7, %l6
	srl %l1, 7, %o0
	srl %g3, 7, %o1
	srl %i3, 7, %o2
	sll %g4, 25, %g4
	sll %l1, 25, %o3
	sll %g3, 25, %g3
	sll %i3, 25, %i3
	or %i3, %o2, %i3
	srl %i3, 0, %i3
	or %g3, %o1, %g3
	sllx %g3, 32, %g3
	or %i3, %g3, %l1
	or %o3, %o0, %i3
	srl %i3, 0, %i3
	or %g4, %l6, %g3
	sllx %g3, 32, %g3
	or %i3, %g3, %l6
	mov	0, %g3
.LBB0_11:
	add %fp, 1743, %i4
	or %i4, 2, %g5
	sth %o7, [%g5]
	or %i4, 4, %o7
	sth %o3, [%o7]
	or %i4, 6, %o3
	sth %o1, [%o3]
	or %i4, 8, %o1
	sth %i3, [%o1]
	or %i4, 10, %i3
	sth %g4, [%i3]
	or %i4, 12, %g4
	sth %o5, [%g4]
	or %i4, 14, %o5
	sth %o2, [%o5]
	sth %o0, [%fp+1743]
	and %g3, 7, %o0
	sllx %o0, 1, %o0
	or %i4, %o0, %i4
	sth %g2, [%i4]
	lduh [%o5], %o2
	lduh [%g4], %o5
	lduh [%i3], %g4
	lduh [%o1], %i3
	lduh [%o3], %o1
	lduh [%o7], %o3
	lduh [%g5], %o7
	add %g3, 1, %g3
	cmp %g3, 8
	bne %xcc, .LBB0_11
	lduh [%fp+1743], %o0
	ba .LBB0_12
	nop
.LBB0_12:
	sll %i3, 16, %i3
	and %g4, 32, %i4
	or %i4, %i3, %i3
	sll %o5, 16, %i4
	and %o2, 128, %g3
	or %g3, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	sll %o0, 16, %i4
	and %o7, 2, %g3
	or %g3, %i4, %i4
	sll %o3, 16, %g3
	and %o1, 8, %g4
	or %g4, %g3, %g3
	sllx %i4, 32, %i4
	srl %g3, 0, %g3
	or %g3, %i4, %i4
	ldx [%fp+1535], %g3
	and %i3, %g3, %i3
	srl %i3, 16, %g3
	cmp %g3, 64
	ldx [%fp+1543], %g3
	and %i4, %g3, %i4
	mov	%i1, %g3
	move	%icc, 1, %g3
	srl %i4, 16, %g4
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srlx %i3, 48, %g5
	cmp %g5, 16
	mov	%i1, %g5
	move	%icc, 1, %g5
	srlx %i4, 48, %o0
	cmp %o0, 1
	mov	%i1, %o0
	move	%icc, 1, %o0
	srlx %i4, 33, %o1
	and %o1, 1, %o1
	sub %i1, %o1, %o1
	and %o1, %i2, %o1
	sll %o0, 16, %o0
	sub %o1, %o0, %o0
	srlx %i3, 37, %o1
	and %o1, 1, %o1
	sub %i1, %o1, %o1
	and %o1, %i2, %o1
	sll %g5, 16, %g5
	sub %o1, %g5, %g5
	srl %i4, 3, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %g3, 16, %g3
	sub %i3, %g3, %i3
	ld [%fp+1383], %i0
	and %i3, %i0, %g3
	ld [%fp+1443], %g4
	andn %g4, %i3, %i3
	ld [%fp+1399], %i0
	and %g5, %i0, %g4
	ldx [%fp+1455], %o1
	andn %o1, %g5, %g5
	ld [%fp+1471], %o1
	andn %o1, %o0, %o1
	ld [%fp+1423], %i2
	and %o0, %i2, %o0
	or %o1, %o0, %o1
	ld [%fp+1519], %o0
	andn %o0, %i4, %o0
	ld [%fp+1467], %o2
	and %i4, %o2, %i4
	or %g5, %g4, %g4
	or %o0, %i4, %i4
	or %i3, %g3, %o7
	add %o7, %o4, %i3
	st %i4, [%fp+1399]
	add %i4, %l5, %i4
	st %g4, [%fp+1455]
	add %g4, %l3, %g4
	st %o1, [%fp+1415]
	add %o1, %l2, %g3
	srlx %l6, 32, %g5
	srlx %l1, 32, %l3
	add %g3, %l3, %g3
	add %g4, %l1, %l2
	add %i4, %l6, %i4
	add %i3, %g5, %i3
	xor %i3, %l7, %g4
	sll %g4, 16, %l5
	srl %g4, 16, %g4
	or %g4, %l5, %g4
	xor %i4, %l4, %l4
	sll %l4, 16, %l5
	srl %l4, 16, %l4
	or %l4, %l5, %l4
	xor %l2, %l0, %l0
	sll %l0, 16, %l5
	srl %l0, 16, %l0
	or %l0, %l5, %l0
	ld [%fp+1339], %i0
	xor %g3, %i0, %l5
	sll %l5, 16, %l7
	srl %l5, 16, %l5
	or %l5, %l7, %l5
	ldx [%fp+1343], %i0
	srlx %i0, 32, %l7
	add %g4, %l7, %l7
	xor %l7, %g5, %g5
	srl %g5, 12, %o0
	sll %g5, 20, %g5
	or %g5, %o0, %g5
	add %l4, %i0, %o0
	xor %o0, %l6, %l6
	srl %l6, 12, %o1
	sll %l6, 20, %l6
	or %l6, %o1, %o1
	ldx [%fp+1351], %i0
	add %l0, %i0, %o3
	xor %o3, %l1, %l1
	srl %l1, 12, %l6
	sll %l1, 20, %l1
	or %l1, %l6, %l1
	srlx %i0, 32, %l6
	add %l5, %l6, %o4
	xor %o4, %l3, %l3
	srl %l3, 12, %l6
	sll %l3, 20, %l3
	or %l3, %l6, %l3
	ldx [%fp+1511], %l6
	add %i3, %l6, %i3
	add %g5, %i3, %o5
	xor %o5, %g4, %i3
	srl %i3, 8, %g4
	sll %i3, 24, %i3
	or %i3, %g4, %g4
	add %i4, %i2, %i3
	add %o1, %i3, %i4
	xor %i4, %l4, %i3
	srl %i3, 8, %l4
	sll %i3, 24, %i3
	or %i3, %l4, %l4
	ldx [%fp+1503], %i3
	add %l2, %i3, %i3
	add %l1, %i3, %l2
	xor %l2, %l0, %i3
	srl %i3, 8, %l0
	sll %i3, 24, %i3
	or %i3, %l0, %l0
	add %g3, %o2, %i3
	add %l3, %i3, %g3
	xor %g3, %l5, %i3
	srl %i3, 8, %l5
	sll %i3, 24, %i3
	or %i3, %l5, %l5
	add %g4, %l7, %i3
	xor %i3, %g5, %g5
	srl %g5, 7, %l6
	sll %g5, 25, %g5
	or %g5, %l6, %l7
	add %l4, %o0, %l6
	xor %l6, %o1, %g5
	srl %g5, 7, %o0
	sll %g5, 25, %g5
	or %g5, %o0, %o2
	add %l0, %o3, %o0
	xor %o0, %l1, %g5
	srl %g5, 7, %l1
	sll %g5, 25, %g5
	or %g5, %l1, %o3
	add %l5, %o4, %g5
	xor %g5, %l3, %l1
	srl %l1, 7, %l3
	sll %l1, 25, %l1
	or %l1, %l3, %l1
	ldx [%fp+1487], %o4
	sllx %o4, 32, %l3
	ldx [%fp+1359], %i0
	srl %i0, 0, %o1
	or %o1, %l3, %l3
	stx %l3, [%fp+1471]
	add %o5, %i0, %l3
	ldx [%fp+1367], %o1
	add %i4, %o1, %i4
	add %l7, %i4, %i0
	st %i0, [%fp+1443]
	xor %i0, %l5, %i4
	sll %i4, 16, %l5
	srl %i4, 16, %i4
	or %i4, %l5, %i0
	ldx [%fp+1375], %i4
	srlx %i4, 32, %l5
	add %g3, %l5, %i4
	add %o2, %i4, %i4
	st %i4, [%fp+1519]
	xor %i4, %l0, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %o5
	add %o3, %l3, %i4
	st %i4, [%fp+1343]
	xor %i4, %l4, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %l3
	add %l2, %o4, %i4
	add %l1, %i4, %i4
	st %i4, [%fp+1335]
	xor %i4, %g4, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %g4
	st %o7, [%fp+1359]
	st %o7, [%fp+1739]
	ld [%fp+1739], %f0
	st %i2, [%fp+1735]
	ldx [%fp+1479], %g3
	srl %g3, 0, %i4
	sllx %g3, 32, %g3
	or %i4, %g3, %i2
	stx %i2, [%fp+1479]
	ldx [%fp+1407], %g3
	srl %g3, 0, %i4
	sllx %g3, 32, %g3
	or %i4, %g3, %l0
	sllx %o1, 32, %i4
	stx %l5, [%fp+1423]
	or %l5, %i4, %i4
	stx %i4, [%fp+1383]
	st %g4, [%fp+1339]
	add %g4, %l6, %g4
	st %l3, [%fp+1351]
	add %l3, %g5, %g3
	st %o5, [%fp+1407]
	add %o5, %i3, %i3
	add %i0, %o0, %i4
	st %i4, [%fp+1323]
	xor %i4, %l7, %i4
	st %i3, [%fp+1331]
	xor %i3, %o2, %i3
	st %g3, [%fp+1319]
	xor %g3, %o3, %g3
	st %g4, [%fp+1327]
	xor %g4, %l1, %g5
	srl %i3, 12, %o2
	sll %i3, 20, %l1
	srl %g5, 12, %i3
	sll %g5, 20, %o4
	srl %i4, 12, %o5
	sll %i4, 20, %g5
	ld [%fp+1735], %f1
	srl %g3, 12, %i4
	sll %g3, 20, %l3
	mov	0, %l2
.LBB0_13:
	add %fp, 1711, %o7
	or %o7, 2, %g4
	sth %l6, [%g4]
	or %o7, 4, %l6
	sth %l5, [%l6]
	or %o7, 6, %l5
	sth %g3, [%l5]
	or %o7, 8, %g3
	sth %o0, [%g3]
	or %o7, 10, %o0
	sth %o1, [%o0]
	or %o7, 12, %o1
	sth %l4, [%o1]
	or %o7, 14, %l4
	sth %o3, [%l4]
	sth %l7, [%fp+1711]
	and %l2, 7, %l7
	sllx %l7, 1, %l7
	or %o7, %l7, %l7
	sth %i5, [%l7]
	lduh [%l4], %o3
	lduh [%o1], %l4
	lduh [%o0], %o1
	lduh [%g3], %o0
	lduh [%l5], %g3
	lduh [%l6], %l5
	lduh [%g4], %l6
	add %l2, 1, %l2
	cmp %l2, 8
	bne %xcc, .LBB0_13
	lduh [%fp+1711], %l7
	ba .LBB0_14
	nop
.LBB0_14:
	xor %l1, %o2, %o2
	xor %o4, %i3, %o4
	xor %g5, %o5, %o5
	xor %l3, %i4, %i3
	sll %o0, 16, %i4
	and %o1, 32, %g4
	or %g4, %i4, %i4
	st %f0, [%fp+1699]
	st %f0, [%fp+1695]
	st %f1, [%fp+1707]
	st %f1, [%fp+1703]
	sllx %i4, 32, %i4
	sll %l4, 16, %g4
	and %o3, 128, %g5
	or %g5, %g4, %g4
	srl %g4, 0, %g4
	or %g4, %i4, %i4
	sll %l7, 16, %g4
	and %l6, 2, %g5
	or %g5, %g4, %g4
	sllx %g4, 32, %g4
	sll %l5, 16, %g5
	and %g3, 8, %g3
	or %g3, %g5, %g3
	srl %g3, 0, %g3
	or %g3, %g4, %g3
	ldx [%fp+1543], %g4
	and %g3, %g4, %g3
	srl %g3, 16, %g4
	srlx %g3, 48, %g5
	ldx [%fp+1535], %l1
	and %i4, %l1, %i4
	srl %i4, 16, %l1
	srlx %i4, 48, %l2
	cmp %l2, 16
	mov	%i1, %l2
	move	%icc, 1, %l2
	cmp %l1, 64
	mov	%i1, %l1
	move	%icc, 1, %l1
	cmp %g5, 1
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srl %g3, 3, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	ld [%fp+1531], %i2
	and %l3, %i2, %l3
	sll %g4, 16, %g4
	sub %l3, %g4, %g4
	ld [%fp+1707], %l3
	srlx %g3, 33, %g3
	and %g3, 1, %g3
	sub %i1, %g3, %g3
	and %g3, %i2, %g3
	sll %g5, 16, %g5
	sub %g3, %g5, %g3
	srl %i4, 7, %g5
	and %g5, 1, %g5
	sub %i1, %g5, %g5
	and %g5, %i2, %g5
	sll %l1, 16, %l1
	sub %g5, %l1, %g5
	ld [%fp+1703], %l1
	srlx %i4, 37, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %l2, 16, %l2
	sub %i4, %l2, %i4
	and %i4, %l1, %l1
	ldx [%fp+1479], %l4
	srlx %l4, 32, %l2
	andn %l2, %i4, %i4
	ld [%fp+1695], %l2
	and %g5, %l3, %l3
	andn %l4, %g5, %g5
	ld [%fp+1699], %l4
	and %g3, %l2, %l2
	srlx %l0, 32, %l5
	andn %l5, %g3, %g3
	and %g4, %l4, %l4
	andn %l0, %g4, %g4
	or %g4, %l4, %l4
	srl %l4, 0, %g4
	or %g3, %l2, %l0
	sllx %l0, 32, %g3
	or %g4, %g3, %g3
	stx %g3, [%fp+1367]
	or %g5, %l3, %g3
	srl %g3, 0, %g4
	or %i4, %l1, %g5
	sllx %g5, 32, %i4
	or %g4, %i4, %i4
	stx %i4, [%fp+1375]
	ld [%fp+1519], %i4
	add %g3, %i4, %i4
	stx %l0, [%fp+1479]
	ld [%fp+1335], %g3
	add %l0, %g3, %g3
	stx %g5, [%fp+1519]
	ld [%fp+1443], %g4
	add %g5, %g4, %g4
	st %l4, [%fp+1443]
	ld [%fp+1343], %g5
	add %l4, %g5, %g5
	add %g5, %i3, %l4
	add %g4, %o5, %o3
	add %g3, %o4, %l3
	add %i4, %o2, %l2
	ld [%fp+1407], %i4
	xor %l2, %i4, %i4
	ld [%fp+1339], %g3
	xor %l3, %g3, %g3
	xor %o3, %i0, %g4
	ld [%fp+1351], %i0
	xor %l4, %i0, %g5
	srl %g5, 8, %l0
	srl %g4, 8, %l1
	srl %g3, 8, %l5
	srl %i4, 8, %l6
	sll %g5, 24, %o0
	sll %g4, 24, %g4
	sll %g3, 24, %g3
	sll %i4, 24, %i4
	or %i4, %l6, %g5
	or %g3, %l5, %l7
	or %g4, %l1, %i0
	or %o0, %l0, %l5
	ld [%fp+1319], %i4
	add %l5, %i4, %g4
	sllx %g4, 32, %i4
	st %i0, [%fp+1351]
	ld [%fp+1323], %g3
	add %i0, %g3, %l0
	srl %l0, 0, %l1
	or %l1, %i4, %i0
	stx %i0, [%fp+1407]
	ld [%fp+1327], %i0
	add %l7, %i0, %l1
	srl %l1, 0, %i4
	ld [%fp+1331], %i0
	add %g5, %i0, %l6
	sllx %l6, 32, %o0
	or %i4, %o0, %i0
	xor %g4, %i3, %i3
	xor %l1, %o4, %g4
	xor %l6, %o2, %l1
	xor %l0, %o5, %l0
	srl %l0, 7, %l6
	srl %l1, 7, %o0
	srl %g4, 7, %o1
	srl %i3, 7, %o2
	sll %l0, 25, %l0
	sll %l1, 25, %o4
	sll %g4, 25, %g4
	sll %i3, 25, %i3
	or %i3, %o2, %i3
	srl %i3, 0, %i3
	or %g4, %o1, %g4
	sllx %g4, 32, %g4
	or %i3, %g4, %l1
	or %o4, %o0, %i3
	srl %i3, 0, %i3
	or %l0, %l6, %g4
	sllx %g4, 32, %g4
	or %i3, %g4, %l6
	mov	0, %i3
.LBB0_15:
	add %fp, 1679, %i4
	or %i4, 2, %g3
	sth %g4, [%g3]
	or %i4, 4, %g4
	sth %o5, [%g4]
	or %i4, 6, %o5
	sth %o2, [%o5]
	or %i4, 8, %o2
	sth %o0, [%o2]
	or %i4, 10, %o0
	sth %l0, [%o0]
	or %i4, 12, %l0
	sth %o7, [%l0]
	or %i4, 14, %o7
	sth %o4, [%o7]
	sth %o1, [%fp+1679]
	and %i3, 7, %o1
	sllx %o1, 1, %o1
	or %i4, %o1, %i4
	sth %g2, [%i4]
	lduh [%o7], %o4
	lduh [%l0], %o7
	lduh [%o0], %l0
	lduh [%o2], %o0
	lduh [%o5], %o2
	lduh [%g4], %o5
	lduh [%g3], %g4
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB0_15
	lduh [%fp+1679], %o1
	ba .LBB0_16
	nop
.LBB0_16:
	sll %o0, 16, %i3
	and %l0, 32, %i4
	or %i4, %i3, %i3
	sll %o7, 16, %i4
	and %o4, 128, %g3
	or %g3, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	sll %o1, 16, %i4
	and %g4, 2, %g3
	or %g3, %i4, %i4
	sll %o5, 16, %g3
	and %o2, 8, %g4
	or %g4, %g3, %g3
	sllx %i4, 32, %i4
	srl %g3, 0, %g3
	or %g3, %i4, %i4
	ldx [%fp+1535], %g3
	and %i3, %g3, %i3
	srl %i3, 16, %g3
	cmp %g3, 64
	ldx [%fp+1543], %g3
	and %i4, %g3, %i4
	mov	%i1, %g3
	move	%icc, 1, %g3
	srl %i4, 16, %g4
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srlx %i3, 48, %l0
	cmp %l0, 16
	mov	%i1, %l0
	move	%icc, 1, %l0
	srlx %i4, 48, %o0
	cmp %o0, 1
	mov	%i1, %o0
	move	%icc, 1, %o0
	srlx %i4, 33, %o1
	and %o1, 1, %o1
	sub %i1, %o1, %o1
	and %o1, %i2, %o1
	sll %o0, 16, %o0
	sub %o1, %o0, %o0
	srlx %i3, 37, %o1
	and %o1, 1, %o1
	sub %i1, %o1, %o1
	and %o1, %i2, %o1
	sll %l0, 16, %l0
	sub %o1, %l0, %l0
	srl %i4, 3, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %g3, 16, %g3
	sub %i3, %g3, %i3
	ld [%fp+1399], %g3
	and %i3, %g3, %g3
	ld [%fp+1431], %g4
	andn %g4, %i3, %i3
	ld [%fp+1359], %i2
	and %l0, %i2, %g4
	ldx [%fp+1447], %o1
	andn %o1, %l0, %l0
	ld [%fp+1467], %o1
	andn %o1, %o0, %o1
	ld [%fp+1415], %o7
	and %o0, %o7, %o0
	or %o1, %o0, %o1
	ldx [%fp+1503], %o0
	andn %o0, %i4, %o0
	ld [%fp+1455], %o4
	and %i4, %o4, %i4
	or %l0, %g4, %g4
	or %o0, %i4, %l0
	or %i3, %g3, %i2
	add %i2, %l4, %i4
	st %l0, [%fp+1399]
	add %l0, %o3, %g3
	st %g4, [%fp+1503]
	add %g4, %l3, %g4
	st %o1, [%fp+1431]
	add %o1, %l2, %i3
	srlx %l6, 32, %l0
	srlx %l1, 32, %l3
	add %i3, %l3, %i3
	add %g4, %l1, %l2
	add %g3, %l6, %g3
	add %i4, %l0, %i4
	xor %i4, %l7, %g4
	sll %g4, 16, %l4
	srl %g4, 16, %g4
	or %g4, %l4, %g4
	xor %g3, %l5, %l4
	sll %l4, 16, %l5
	srl %l4, 16, %l4
	or %l4, %l5, %l4
	xor %l2, %g5, %g5
	sll %g5, 16, %l5
	srl %g5, 16, %g5
	or %g5, %l5, %g5
	ld [%fp+1351], %l5
	xor %i3, %l5, %l5
	sll %l5, 16, %l7
	srl %l5, 16, %l5
	or %l5, %l7, %l5
	srlx %i0, 32, %l7
	add %g4, %l7, %l7
	xor %l7, %l0, %l0
	srl %l0, 12, %o0
	sll %l0, 20, %l0
	or %l0, %o0, %l0
	add %l4, %i0, %o0
	xor %o0, %l6, %l6
	srl %l6, 12, %o1
	sll %l6, 20, %l6
	or %l6, %o1, %l6
	ldx [%fp+1407], %i0
	add %g5, %i0, %o1
	xor %o1, %l1, %l1
	srl %l1, 12, %o2
	sll %l1, 20, %l1
	or %l1, %o2, %l1
	srlx %i0, 32, %o2
	add %l5, %o2, %o2
	xor %o2, %l3, %l3
	srl %l3, 12, %o3
	sll %l3, 20, %l3
	or %l3, %o3, %l3
	ldx [%fp+1495], %o3
	add %i4, %o3, %i4
	add %l0, %i4, %i4
	xor %i4, %g4, %g4
	srl %g4, 8, %o3
	sll %g4, 24, %g4
	or %g4, %o3, %g4
	add %g3, %o7, %g3
	add %l6, %g3, %g3
	xor %g3, %l4, %l4
	srl %l4, 8, %o3
	sll %l4, 24, %l4
	or %l4, %o3, %o3
	ldx [%fp+1511], %l4
	add %l2, %l4, %l2
	add %l1, %l2, %l2
	xor %l2, %g5, %g5
	srl %g5, 8, %l4
	sll %g5, 24, %g5
	or %g5, %l4, %g5
	add %i3, %o4, %i3
	add %l3, %i3, %o4
	xor %o4, %l5, %i3
	srl %i3, 8, %l4
	sll %i3, 24, %i3
	or %i3, %l4, %l5
	add %g4, %l7, %i3
	xor %i3, %l0, %l0
	srl %l0, 7, %l4
	sll %l0, 25, %l0
	or %l0, %l4, %l4
	add %o3, %o0, %l7
	xor %l7, %l6, %l0
	srl %l0, 7, %l6
	sll %l0, 25, %l0
	or %l0, %l6, %l6
	add %g5, %o1, %o0
	xor %o0, %l1, %l0
	srl %l0, 7, %l1
	sll %l0, 25, %l0
	or %l0, %l1, %o1
	add %l5, %o2, %o2
	xor %o2, %l3, %l0
	srl %l0, 7, %l1
	sll %l0, 25, %l0
	or %l0, %l1, %l3
	ldx [%fp+1471], %o5
	sllx %o5, 32, %l0
	ldx [%fp+1367], %i0
	srl %i0, 0, %l1
	or %l1, %l0, %l0
	stx %l0, [%fp+1407]
	add %i4, %i0, %i4
	ldx [%fp+1375], %i0
	add %g3, %i0, %g3
	add %l4, %g3, %g3
	st %g3, [%fp+1467]
	xor %g3, %l5, %g3
	sll %g3, 16, %l0
	srl %g3, 16, %g3
	or %g3, %l0, %l5
	ldx [%fp+1383], %g3
	srlx %g3, 32, %l0
	add %o4, %l0, %g3
	add %l6, %g3, %g3
	st %g3, [%fp+1447]
	xor %g3, %g5, %g3
	sll %g3, 16, %g5
	srl %g3, 16, %g3
	or %g3, %g5, %g5
	add %o1, %i4, %i4
	st %i4, [%fp+1339]
	xor %i4, %o3, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %o3
	add %l2, %o5, %i4
	add %l3, %i4, %i4
	st %i4, [%fp+1331]
	xor %i4, %g4, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %g4
	st %i2, [%fp+1383]
	st %i2, [%fp+1675]
	ld [%fp+1675], %f0
	st %o7, [%fp+1671]
	ldx [%fp+1487], %g3
	srl %g3, 0, %i4
	sllx %g3, 32, %g3
	or %i4, %g3, %i2
	stx %i2, [%fp+1487]
	ldx [%fp+1423], %g3
	srl %g3, 0, %i4
	sllx %g3, 32, %g3
	or %i4, %g3, %l1
	sllx %i0, 32, %i4
	stx %l0, [%fp+1423]
	or %l0, %i4, %i4
	stx %i4, [%fp+1415]
	st %g4, [%fp+1335]
	add %g4, %l7, %i2
	st %o3, [%fp+1343]
	add %o3, %o2, %g3
	st %g5, [%fp+1351]
	add %g5, %i3, %i0
	st %l5, [%fp+1359]
	add %l5, %o0, %i3
	st %i3, [%fp+1319]
	xor %i3, %l4, %i4
	st %i0, [%fp+1327]
	xor %i0, %l6, %i3
	st %g3, [%fp+1315]
	xor %g3, %o1, %g4
	st %i2, [%fp+1323]
	xor %i2, %l3, %g5
	srl %i3, 12, %o0
	sll %i3, 20, %g3
	srl %g5, 12, %i3
	sll %g5, 20, %o1
	srl %i4, 12, %o5
	sll %i4, 20, %o3
	ld [%fp+1671], %f1
	srl %g4, 12, %i4
	sll %g4, 20, %l3
	mov	0, %l2
.LBB0_17:
	add %fp, 1647, %o4
	or %o4, 2, %l0
	sth %l7, [%l0]
	or %o4, 4, %l7
	sth %g5, [%l7]
	or %o4, 6, %g5
	sth %o2, [%g5]
	or %o4, 8, %o2
	sth %o7, [%o2]
	or %o4, 10, %o7
	sth %g4, [%o7]
	or %o4, 12, %g4
	sth %l5, [%g4]
	or %o4, 14, %l5
	sth %l6, [%l5]
	sth %l4, [%fp+1647]
	and %l2, 7, %l4
	sllx %l4, 1, %l4
	or %o4, %l4, %l4
	sth %i5, [%l4]
	lduh [%l5], %l6
	lduh [%g4], %l5
	lduh [%o7], %g4
	lduh [%o2], %o7
	lduh [%g5], %o2
	lduh [%l7], %g5
	lduh [%l0], %l7
	add %l2, 1, %l2
	cmp %l2, 8
	bne %xcc, .LBB0_17
	lduh [%fp+1647], %l4
	ba .LBB0_18
	nop
.LBB0_18:
	xor %g3, %o0, %o0
	xor %o1, %i3, %o1
	xor %o3, %o5, %o5
	xor %l3, %i4, %i3
	sll %o7, 16, %i4
	and %g4, 32, %g3
	or %g3, %i4, %i4
	st %f0, [%fp+1635]
	st %f0, [%fp+1631]
	st %f1, [%fp+1643]
	st %f1, [%fp+1639]
	sllx %i4, 32, %i4
	sll %l5, 16, %g3
	and %l6, 128, %g4
	or %g4, %g3, %g3
	srl %g3, 0, %g3
	or %g3, %i4, %i4
	sll %l4, 16, %g3
	and %l7, 2, %g4
	or %g4, %g3, %g3
	sllx %g3, 32, %g3
	sll %g5, 16, %g4
	and %o2, 8, %g5
	or %g5, %g4, %g4
	srl %g4, 0, %g4
	or %g4, %g3, %g3
	ldx [%fp+1543], %g4
	and %g3, %g4, %g3
	srl %g3, 16, %g4
	srlx %g3, 48, %g5
	ldx [%fp+1535], %l0
	and %i4, %l0, %i4
	srl %i4, 16, %l0
	srlx %i4, 48, %l2
	cmp %l2, 16
	mov	%i1, %l2
	move	%icc, 1, %l2
	cmp %l0, 64
	mov	%i1, %l0
	move	%icc, 1, %l0
	cmp %g5, 1
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srl %g3, 3, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	ld [%fp+1531], %i2
	and %l3, %i2, %l3
	sll %g4, 16, %g4
	sub %l3, %g4, %g4
	ld [%fp+1643], %l3
	srlx %g3, 33, %g3
	and %g3, 1, %g3
	sub %i1, %g3, %g3
	and %g3, %i2, %g3
	sll %g5, 16, %g5
	sub %g3, %g5, %g3
	srl %i4, 7, %g5
	and %g5, 1, %g5
	sub %i1, %g5, %g5
	and %g5, %i2, %g5
	sll %l0, 16, %l0
	sub %g5, %l0, %g5
	ld [%fp+1639], %l0
	srlx %i4, 37, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %l2, 16, %l2
	sub %i4, %l2, %i4
	and %i4, %l0, %l0
	ldx [%fp+1487], %i0
	srlx %i0, 32, %l2
	andn %l2, %i4, %i4
	ld [%fp+1631], %l2
	and %g5, %l3, %l3
	andn %i0, %g5, %g5
	ld [%fp+1635], %l4
	and %g3, %l2, %l2
	srlx %l1, 32, %l5
	andn %l5, %g3, %g3
	and %g4, %l4, %l4
	andn %l1, %g4, %g4
	or %g4, %l4, %l1
	srl %l1, 0, %g4
	or %g3, %l2, %l2
	sllx %l2, 32, %g3
	or %g4, %g3, %i0
	stx %i0, [%fp+1375]
	or %g5, %l3, %g3
	srl %g3, 0, %g4
	or %i4, %l0, %g5
	sllx %g5, 32, %i4
	or %g4, %i4, %i0
	stx %i0, [%fp+1367]
	ld [%fp+1447], %i0
	add %g3, %i0, %i4
	stx %l2, [%fp+1447]
	ld [%fp+1331], %i0
	add %l2, %i0, %g3
	stx %g5, [%fp+1487]
	ld [%fp+1467], %i0
	add %g5, %i0, %g4
	st %l1, [%fp+1467]
	ld [%fp+1339], %i0
	add %l1, %i0, %g5
	add %g5, %i3, %l4
	add %g4, %o5, %l6
	add %g3, %o1, %l1
	add %i4, %o0, %o2
	ld [%fp+1351], %i0
	xor %o2, %i0, %i4
	ld [%fp+1335], %i0
	xor %l1, %i0, %g3
	ld [%fp+1359], %i0
	xor %l6, %i0, %g4
	ld [%fp+1343], %i0
	xor %l4, %i0, %g5
	srl %g5, 8, %l2
	srl %g4, 8, %l3
	srl %g3, 8, %l0
	srl %i4, 8, %l5
	sll %g5, 24, %l7
	sll %g4, 24, %g4
	sll %g3, 24, %g3
	sll %i4, 24, %i4
	or %i4, %l5, %g5
	or %g3, %l0, %l0
	or %g4, %l3, %i0
	or %l7, %l2, %o3
	ld [%fp+1315], %i4
	add %o3, %i4, %g4
	sllx %g4, 32, %i4
	st %i0, [%fp+1343]
	ld [%fp+1319], %g3
	add %i0, %g3, %l2
	srl %l2, 0, %l3
	or %l3, %i4, %i0
	stx %i0, [%fp+1359]
	ld [%fp+1323], %i0
	add %l0, %i0, %l3
	srl %l3, 0, %i4
	ld [%fp+1327], %i0
	add %g5, %i0, %l5
	sllx %l5, 32, %l7
	or %i4, %l7, %i0
	stx %i0, [%fp+1351]
	xor %g4, %i3, %i3
	xor %l3, %o1, %g4
	xor %l5, %o0, %l3
	xor %l2, %o5, %l2
	srl %l2, 7, %l5
	srl %l3, 7, %l7
	srl %g4, 7, %o0
	srl %i3, 7, %o1
	sll %l2, 25, %l2
	sll %l3, 25, %o4
	sll %g4, 25, %g4
	sll %i3, 25, %i3
	or %i3, %o1, %i3
	srl %i3, 0, %i3
	or %g4, %o0, %g4
	sllx %g4, 32, %g4
	or %i3, %g4, %l3
	or %o4, %l7, %i3
	srl %i3, 0, %i3
	or %l2, %l5, %g4
	sllx %g4, 32, %g4
	or %i3, %g4, %o7
	mov	0, %i3
.LBB0_19:
	add %fp, 1615, %i4
	or %i4, 2, %g3
	sth %o1, [%g3]
	or %i4, 4, %o1
	sth %l7, [%o1]
	or %i4, 6, %l7
	sth %l2, [%l7]
	or %i4, 8, %l2
	sth %o4, [%l2]
	or %i4, 10, %o4
	sth %o5, [%o4]
	or %i4, 12, %o5
	sth %o0, [%o5]
	or %i4, 14, %o0
	sth %l5, [%o0]
	sth %g4, [%fp+1615]
	and %i3, 7, %g4
	sllx %g4, 1, %g4
	or %i4, %g4, %i4
	sth %g2, [%i4]
	lduh [%o0], %l5
	lduh [%o5], %o0
	lduh [%o4], %o5
	lduh [%l2], %o4
	lduh [%l7], %l2
	lduh [%o1], %l7
	lduh [%g3], %o1
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB0_19
	lduh [%fp+1615], %g4
	ba .LBB0_20
	nop
.LBB0_20:
	sll %o4, 16, %i3
	and %o5, 32, %i4
	or %i4, %i3, %i3
	sll %o0, 16, %i4
	and %l5, 128, %g3
	or %g3, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	sll %g4, 16, %i4
	and %o1, 2, %g3
	or %g3, %i4, %i4
	sll %l7, 16, %g3
	and %l2, 8, %g4
	or %g4, %g3, %g3
	sllx %i4, 32, %i4
	srl %g3, 0, %g3
	or %g3, %i4, %i4
	ldx [%fp+1535], %g3
	and %i3, %g3, %i3
	srl %i3, 16, %g3
	cmp %g3, 64
	ldx [%fp+1543], %g3
	and %i4, %g3, %i4
	mov	%i1, %g3
	move	%icc, 1, %g3
	srl %i4, 16, %g4
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srlx %i3, 48, %l2
	cmp %l2, 16
	mov	%i1, %l2
	move	%icc, 1, %l2
	srlx %i4, 48, %l5
	cmp %l5, 1
	mov	%i1, %l5
	move	%icc, 1, %l5
	srlx %i4, 33, %l7
	and %l7, 1, %l7
	sub %i1, %l7, %l7
	and %l7, %i2, %l7
	sll %l5, 16, %l5
	sub %l7, %l5, %l5
	srlx %i3, 37, %l7
	and %l7, 1, %l7
	sub %i1, %l7, %l7
	and %l7, %i2, %l7
	sll %l2, 16, %l2
	sub %l7, %l2, %l2
	srl %i4, 3, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %g3, 16, %g3
	sub %i3, %g3, %i3
	ld [%fp+1399], %g3
	and %i3, %g3, %g3
	ld [%fp+1443], %g4
	andn %g4, %i3, %i3
	ld [%fp+1383], %i0
	and %l2, %i0, %g4
	ldx [%fp+1479], %l7
	andn %l7, %l2, %l2
	ld [%fp+1455], %l7
	andn %l7, %l5, %l7
	ld [%fp+1431], %o5
	and %l5, %o5, %l5
	or %l7, %l5, %l5
	or %l2, %g4, %l2
	ldx [%fp+1511], %g4
	andn %g4, %i4, %g4
	ld [%fp+1503], %o4
	and %i4, %o4, %i4
	or %g4, %i4, %i4
	or %i3, %g3, %i0
	add %i0, %l4, %i3
	st %i4, [%fp+1455]
	add %i4, %l6, %i4
	st %l2, [%fp+1479]
	add %l2, %l1, %g3
	st %l5, [%fp+1511]
	add %l5, %o2, %g4
	srlx %o7, 32, %l1
	add %g3, %l3, %g3
	add %i4, %o7, %i4
	add %i3, %l1, %i3
	xor %i3, %l0, %l0
	sll %l0, 16, %l2
	srl %l0, 16, %l0
	or %l0, %l2, %l0
	xor %i4, %o3, %l2
	sll %l2, 16, %l4
	srl %l2, 16, %l2
	or %l2, %l4, %l2
	xor %g3, %g5, %g5
	sll %g5, 16, %l4
	srl %g5, 16, %g5
	or %g5, %l4, %g5
	srlx %l3, 32, %l4
	add %g4, %l4, %g4
	ld [%fp+1343], %l5
	xor %g4, %l5, %l5
	sll %l5, 16, %l6
	srl %l5, 16, %l5
	or %l5, %l6, %l5
	ldx [%fp+1351], %o0
	srlx %o0, 32, %l6
	add %l0, %l6, %l6
	xor %l6, %l1, %l1
	srl %l1, 12, %l7
	sll %l1, 20, %l1
	or %l1, %l7, %l1
	add %l2, %o0, %l7
	xor %l7, %o7, %o0
	srl %o0, 12, %o1
	sll %o0, 20, %o0
	or %o0, %o1, %o0
	ldx [%fp+1359], %o3
	add %g5, %o3, %o1
	xor %o1, %l3, %l3
	srl %l3, 12, %o2
	sll %l3, 20, %l3
	or %l3, %o2, %l3
	srlx %o3, 32, %o2
	add %l5, %o2, %o2
	xor %o2, %l4, %l4
	srl %l4, 12, %o3
	sll %l4, 20, %l4
	or %l4, %o3, %l4
	ldx [%fp+1519], %o3
	add %i3, %o3, %i3
	add %l1, %i3, %i3
	xor %i3, %l0, %l0
	srl %l0, 8, %o3
	sll %l0, 24, %l0
	or %l0, %o3, %l0
	add %i4, %o5, %i4
	add %o0, %i4, %i4
	xor %i4, %l2, %l2
	srl %l2, 8, %o3
	sll %l2, 24, %l2
	or %l2, %o3, %l2
	ldx [%fp+1495], %o3
	add %g3, %o3, %g3
	add %l3, %g3, %g3
	xor %g3, %g5, %g5
	srl %g5, 8, %o3
	sll %g5, 24, %g5
	or %g5, %o3, %g5
	add %g4, %o4, %g4
	add %l4, %g4, %g4
	xor %g4, %l5, %l5
	srl %l5, 8, %o3
	sll %l5, 24, %l5
	or %l5, %o3, %l5
	add %l0, %l6, %l6
	xor %l6, %l1, %l1
	srl %l1, 7, %o3
	sll %l1, 25, %l1
	or %l1, %o3, %o3
	add %l2, %l7, %l7
	xor %l7, %o0, %l1
	srl %l1, 7, %o0
	sll %l1, 25, %l1
	or %l1, %o0, %o0
	add %g5, %o1, %o1
	xor %o1, %l3, %l1
	srl %l1, 7, %l3
	sll %l1, 25, %l1
	or %l1, %l3, %l3
	add %l5, %o2, %o2
	xor %o2, %l4, %l1
	srl %l1, 7, %l4
	sll %l1, 25, %l1
	or %l1, %l4, %l4
	ldx [%fp+1367], %l1
	add %i4, %l1, %i4
	ldx [%fp+1415], %l1
	srlx %l1, 32, %l1
	add %g4, %l1, %g4
	ldx [%fp+1375], %l1
	add %i3, %l1, %i3
	ldx [%fp+1407], %l1
	add %g3, %l1, %g3
	add %l4, %g3, %o4
	add %l3, %i3, %l1
	add %o0, %g4, %g4
	add %o3, %i4, %i3
	st %i3, [%fp+1351]
	xor %i3, %l5, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %g3
	st %g4, [%fp+1343]
	xor %g4, %g5, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %l5
	st %l1, [%fp+1367]
	xor %l1, %l2, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %g5
	st %o4, [%fp+1359]
	xor %o4, %l0, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %i3
	st %i3, [%fp+1331]
	add %i3, %l7, %g4
	st %g5, [%fp+1335]
	add %g5, %o2, %g5
	st %l5, [%fp+1339]
	add %l5, %l6, %i4
	st %g3, [%fp+1399]
	add %g3, %o1, %i3
	st %i3, [%fp+1375]
	xor %i3, %o3, %i3
	st %i4, [%fp+1407]
	xor %i4, %o0, %i4
	st %g5, [%fp+1383]
	xor %g5, %l3, %g3
	st %g4, [%fp+1415]
	xor %g4, %l4, %g4
	srl %g4, 12, %l2
	srl %i4, 12, %l5
	st %i0, [%fp+1443]
	st %i0, [%fp+1611]
	ld [%fp+1611], %f0
	st %o5, [%fp+1607]
	ldx [%fp+1471], %l0
	srl %l0, 0, %g5
	sllx %l0, 32, %l0
	or %g5, %l0, %i0
	ldx [%fp+1423], %l0
	srl %l0, 0, %g5
	sllx %l0, 32, %l0
	or %g5, %l0, %l6
	srl %i3, 12, %l7
	sll %i4, 20, %o1
	sll %g4, 20, %o2
	sll %i3, 20, %l0
	ld [%fp+1607], %f1
	srl %g3, 12, %i4
	sll %g3, 20, %o3
	mov	0, %o5
.LBB0_21:
	add %fp, 1583, %l1
	or %l1, 2, %l4
	sth %o7, [%l4]
	or %l1, 4, %o7
	sth %o4, [%o7]
	or %l1, 6, %o4
	sth %g4, [%o4]
	or %l1, 8, %g4
	sth %g5, [%g4]
	or %l1, 10, %g5
	sth %l3, [%g5]
	or %l1, 12, %l3
	sth %g3, [%l3]
	or %l1, 14, %g3
	sth %i3, [%g3]
	sth %o0, [%fp+1583]
	and %o5, 7, %i3
	sllx %i3, 1, %i3
	or %l1, %i3, %i3
	sth %i5, [%i3]
	lduh [%g3], %i3
	lduh [%l3], %g3
	lduh [%g5], %l3
	lduh [%g4], %g5
	lduh [%o4], %g4
	lduh [%o7], %o4
	lduh [%l4], %o7
	add %o5, 1, %o5
	cmp %o5, 8
	bne %xcc, .LBB0_21
	lduh [%fp+1583], %o0
	ba .LBB0_22
	nop
.LBB0_22:
	xor %o1, %l5, %o1
	xor %o2, %l2, %l2
	xor %l0, %l7, %l7
	xor %o3, %i4, %l5
	sll %g5, 16, %i4
	and %l3, 32, %i5
	or %i5, %i4, %i4
	st %f0, [%fp+1571]
	st %f1, [%fp+1575]
	st %f0, [%fp+1567]
	st %f1, [%fp+1579]
	sllx %i4, 32, %i4
	sll %g3, 16, %i5
	and %i3, 128, %i3
	or %i3, %i5, %i3
	srl %i3, 0, %i3
	or %i3, %i4, %i3
	sll %o0, 16, %i4
	and %o7, 2, %i5
	or %i5, %i4, %i4
	sllx %i4, 32, %i4
	sll %o4, 16, %i5
	and %g4, 8, %g3
	or %g3, %i5, %i5
	srl %i5, 0, %i5
	or %i5, %i4, %i4
	ldx [%fp+1543], %i5
	and %i4, %i5, %i4
	srl %i4, 16, %i5
	ldx [%fp+1535], %g3
	and %i3, %g3, %i3
	srlx %i3, 48, %g3
	srlx %i4, 48, %g4
	srl %i3, 16, %g5
	cmp %g5, 64
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %g4, 1
	mov	%i1, %g4
	move	%icc, 1, %g4
	cmp %g3, 16
	mov	%i1, %g3
	move	%icc, 1, %g3
	cmp %i5, 4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srl %i4, 3, %l0
	and %l0, 1, %l0
	sub %i1, %l0, %l0
	and %l0, %i2, %l0
	sll %i5, 16, %i5
	sub %l0, %i5, %i5
	srlx %i3, 37, %l0
	and %l0, 1, %l0
	sub %i1, %l0, %l0
	and %l0, %i2, %l0
	sll %g3, 16, %g3
	sub %l0, %g3, %g3
	ld [%fp+1575], %l0
	srlx %i4, 33, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i2, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	ld [%fp+1567], %g4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i2, %i3
	sll %g5, 16, %g5
	sub %i3, %g5, %i3
	ld [%fp+1579], %g5
	and %i4, %g4, %g4
	srlx %l6, 32, %l1
	andn %l1, %i4, %i4
	and %i3, %g5, %g5
	and %g3, %l0, %l0
	ld [%fp+1571], %l1
	andn %i0, %i3, %i3
	srlx %i0, 32, %l3
	andn %l3, %g3, %g3
	and %i5, %l1, %l1
	andn %l6, %i5, %i5
	or %i5, %l1, %i5
	or %g3, %l0, %g3
	or %i4, %g4, %i4
	or %i3, %g5, %i3
	ld [%fp+1343], %i0
	add %i3, %i0, %i3
	ld [%fp+1359], %i0
	add %i4, %i0, %i4
	ld [%fp+1351], %i0
	add %g3, %i0, %g3
	ld [%fp+1367], %i0
	add %i5, %i0, %i5
	add %i5, %l5, %l3
	add %g3, %l7, %l4
	add %i4, %l2, %o0
	add %i3, %o1, %l6
	ld [%fp+1339], %i0
	xor %l6, %i0, %i3
	ld [%fp+1331], %i0
	xor %o0, %i0, %i4
	ld [%fp+1399], %i0
	xor %l4, %i0, %i5
	ld [%fp+1335], %i0
	xor %l3, %i0, %g3
	srl %g3, 8, %g4
	srl %i5, 8, %l0
	srl %i4, 8, %g5
	srl %i3, 8, %l1
	sll %g3, 24, %g3
	sll %i5, 24, %o2
	sll %i4, 24, %i4
	sll %i3, 24, %i3
	or %i3, %l1, %i5
	or %i4, %g5, %g5
	or %o2, %l0, %l0
	or %g3, %g4, %l1
	ld [%fp+1383], %i0
	add %l1, %i0, %i4
	sllx %i4, 32, %i3
	ld [%fp+1375], %i0
	add %l0, %i0, %g4
	srl %g4, 0, %g3
	or %g3, %i3, %i0
	stx %i0, [%fp+1431]
	ld [%fp+1415], %i0
	add %g5, %i0, %o2
	srl %o2, 0, %i3
	ld [%fp+1407], %i0
	st %i5, [%fp+1471]
	add %i5, %i0, %o3
	sllx %o3, 32, %o4
	or %i3, %o4, %i3
	xor %i4, %l5, %i4
	xor %o2, %l2, %l2
	xor %o3, %o1, %l5
	xor %g4, %l7, %g4
	srl %g4, 7, %l7
	srl %l5, 7, %o1
	srl %l2, 7, %o2
	srl %i4, 7, %o3
	sll %g4, 25, %g4
	sll %l5, 25, %l5
	sll %l2, 25, %l2
	sll %i4, 25, %i4
	or %i4, %o3, %i4
	srl %i4, 0, %i4
	or %l2, %o2, %l2
	sllx %l2, 32, %l2
	or %i4, %l2, %i4
	or %l5, %o1, %l2
	srl %l2, 0, %l2
	or %g4, %l7, %g4
	sllx %g4, 32, %g4
	or %l2, %g4, %o1
	mov	0, %l2
.LBB0_23:
	add %fp, 1551, %i5
	or %i5, 2, %g3
	sth %o7, [%g3]
	or %i5, 4, %o7
	sth %o5, [%o7]
	or %i5, 6, %o5
	sth %o4, [%o5]
	or %i5, 8, %o4
	sth %o2, [%o4]
	or %i5, 10, %o2
	sth %l7, [%o2]
	or %i5, 12, %l7
	sth %l5, [%l7]
	or %i5, 14, %l5
	sth %g4, [%l5]
	sth %o3, [%fp+1551]
	and %l2, 7, %g4
	sllx %g4, 1, %g4
	or %i5, %g4, %i5
	sth %g2, [%i5]
	lduh [%l5], %g4
	lduh [%l7], %l5
	lduh [%o2], %l7
	lduh [%o4], %o2
	lduh [%o5], %o4
	lduh [%o7], %o5
	lduh [%g3], %o7
	add %l2, 1, %l2
	cmp %l2, 8
	bne %xcc, .LBB0_23
	lduh [%fp+1551], %o3
	ba .LBB0_24
	nop
.LBB0_24:
	sll %o3, 16, %i5
	and %o7, 2, %g2
	or %g2, %i5, %i5
	sll %o5, 16, %g2
	and %o4, 8, %g3
	or %g3, %g2, %g2
	sllx %i5, 32, %i5
	srl %g2, 0, %g2
	or %g2, %i5, %i5
	sll %o2, 16, %g2
	and %l7, 32, %g3
	or %g3, %g2, %g2
	sll %l5, 16, %g3
	and %g4, 128, %g4
	or %g4, %g3, %g3
	sllx %g2, 32, %g2
	srl %g3, 0, %g3
	or %g3, %g2, %g2
	ldx [%fp+1535], %g3
	and %g2, %g3, %g2
	ldx [%fp+1543], %g3
	and %i5, %g3, %i5
	srl %i5, 16, %g3
	cmp %g3, 4
	mov	%i1, %g3
	move	%icc, 1, %g3
	srlx %i5, 48, %g4
	cmp %g4, 1
	mov	%i1, %g4
	move	%icc, 1, %g4
	srl %g2, 16, %l2
	cmp %l2, 64
	mov	%i1, %l2
	move	%icc, 1, %l2
	srlx %g2, 48, %l5
	cmp %l5, 16
	mov	%i1, %l5
	move	%icc, 1, %l5
	srlx %g2, 37, %l7
	and %l7, 1, %l7
	sub %i1, %l7, %l7
	and %l7, %i2, %l7
	sll %l5, 16, %l5
	sub %l7, %l5, %l5
	srl %g2, 7, %g2
	and %g2, 1, %g2
	sub %i1, %g2, %g2
	and %g2, %i2, %g2
	sll %l2, 16, %l2
	sub %g2, %l2, %g2
	srlx %i5, 33, %l2
	and %l2, 1, %l2
	sub %i1, %l2, %l2
	and %l2, %i2, %l2
	sll %g4, 16, %g4
	sub %l2, %g4, %g4
	srl %i5, 3, %i5
	and %i5, 1, %i5
	sub %i1, %i5, %i1
	and %i1, %i2, %i1
	sll %g3, 16, %i2
	sub %i1, %i2, %i1
	ld [%fp+1455], %i2
	and %g2, %i2, %i2
	ld [%fp+1467], %i5
	andn %i5, %g2, %i5
	ld [%fp+1443], %i0
	and %l5, %i0, %g2
	ldx [%fp+1447], %g3
	andn %g3, %l5, %g3
	or %g3, %g2, %g2
	or %i5, %i2, %i2
	ld [%fp+1503], %i5
	andn %i5, %g4, %i5
	ld [%fp+1511], %o2
	and %g4, %o2, %g3
	or %i5, %g3, %i5
	ldx [%fp+1495], %g3
	andn %g3, %i1, %g3
	ld [%fp+1479], %o3
	and %i1, %o3, %i1
	or %g3, %i1, %i1
	add %i1, %l4, %i1
	add %i5, %l6, %i5
	add %i2, %l3, %i2
	add %g2, %o0, %g2
	srlx %i4, 32, %g3
	srlx %o1, 32, %g4
	add %g2, %i4, %g2
	add %i2, %g4, %i2
	add %i5, %g3, %i5
	add %i1, %o1, %i1
	xor %i1, %l1, %l1
	sll %l1, 16, %l2
	srl %l1, 16, %l1
	or %l1, %l2, %l1
	xor %i5, %l0, %l0
	sll %l0, 16, %l2
	srl %l0, 16, %l0
	or %l0, %l2, %l0
	xor %i2, %g5, %g5
	sll %g5, 16, %l2
	srl %g5, 16, %g5
	or %g5, %l2, %g5
	ld [%fp+1471], %i0
	xor %g2, %i0, %l2
	sll %l2, 16, %l3
	srl %l2, 16, %l2
	or %l2, %l3, %l2
	ldx [%fp+1431], %i0
	srlx %i0, 32, %l3
	srlx %i3, 32, %l4
	add %l2, %i0, %l5
	add %g5, %l4, %l4
	add %l0, %l3, %l3
	add %l1, %i3, %i3
	xor %i3, %o1, %l6
	xor %l3, %g3, %g3
	xor %l4, %g4, %g4
	xor %l5, %i4, %i4
	srl %l6, 12, %l7
	sll %l6, 20, %l6
	or %l6, %l7, %l6
	srl %g3, 12, %l7
	sll %g3, 20, %g3
	or %g3, %l7, %g3
	srl %g4, 12, %l7
	sll %g4, 20, %g4
	or %g4, %l7, %g4
	srl %i4, 12, %l7
	sll %i4, 20, %i4
	or %i4, %l7, %i4
	add %i1, %o2, %i1
	add %i5, %o3, %i5
	ldx [%fp+1487], %l7
	add %i2, %l7, %i2
	ldx [%fp+1519], %l7
	add %g2, %l7, %g2
	add %i4, %g2, %g2
	add %g4, %i2, %i2
	add %g3, %i5, %i5
	add %l6, %i1, %i1
	xor %i1, %l1, %l1
	xor %i5, %l0, %l0
	xor %i2, %g5, %g5
	xor %g2, %l2, %l2
	srl %l1, 8, %l7
	sll %l1, 24, %l1
	or %l1, %l7, %l1
	srl %l0, 8, %l7
	sll %l0, 24, %l0
	or %l0, %l7, %l0
	srl %g5, 8, %l7
	sll %g5, 24, %g5
	or %g5, %l7, %g5
	srl %l2, 8, %l7
	sll %l2, 24, %l2
	or %l2, %l7, %l2
	add %l2, %l5, %l5
	add %g5, %l4, %l4
	add %l0, %l3, %l3
	add %l1, %i3, %i3
	xor %i3, %l6, %l6
	xor %l3, %g3, %g3
	xor %l4, %g4, %g4
	xor %l5, %i4, %i4
	srl %l6, 7, %l7
	sll %l6, 25, %l6
	or %l6, %l7, %l6
	srl %g3, 7, %l7
	sll %g3, 25, %g3
	or %g3, %l7, %g3
	srl %g4, 7, %l7
	sll %g4, 25, %g4
	or %g4, %l7, %g4
	srl %i4, 7, %l7
	sll %i4, 25, %i4
	or %i4, %l7, %i4
	xor %l5, %i1, %i1
	xor %l4, %i5, %i5
	xor %i3, %g2, %i3
	xor %l3, %i2, %i2
	srl %i2, 8, %g2
	ldx [%fp+1391], %i0
	stb %g2, [%i0+6]
	srl %i2, 16, %g2
	stb %g2, [%i0+5]
	stb %i2, [%i0+7]
	srl %i2, 24, %i2
	stb %i2, [%i0+4]
	srl %i3, 8, %i2
	stb %i2, [%i0+2]
	srl %i3, 16, %i2
	stb %i2, [%i0+1]
	stb %i3, [%i0+3]
	srl %i3, 24, %i2
	stb %i2, [%i0]
	srl %i5, 8, %i2
	stb %i2, [%i0+14]
	srl %i5, 16, %i2
	stb %i2, [%i0+13]
	stb %i5, [%i0+15]
	srl %i5, 24, %i2
	stb %i2, [%i0+12]
	srl %i1, 8, %i2
	stb %i2, [%i0+10]
	srl %i1, 16, %i2
	stb %i2, [%i0+9]
	stb %i1, [%i0+11]
	srl %i1, 24, %i1
	stb %i1, [%i0+8]
	xor %i4, %l1, %i1
	xor %g4, %l0, %i2
	xor %g3, %g5, %i3
	xor %l6, %l2, %i4
	srl %i4, 8, %i5
	stb %i5, [%i0+30]
	srl %i4, 16, %i5
	stb %i5, [%i0+29]
	stb %i4, [%i0+31]
	srl %i4, 24, %i4
	stb %i4, [%i0+28]
	srl %i3, 8, %i4
	stb %i4, [%i0+18]
	srl %i3, 16, %i4
	stb %i4, [%i0+17]
	stb %i3, [%i0+19]
	srl %i3, 24, %i3
	stb %i3, [%i0+16]
	srl %i2, 8, %i3
	stb %i3, [%i0+26]
	srl %i2, 16, %i3
	stb %i3, [%i0+25]
	stb %i2, [%i0+27]
	srl %i2, 24, %i2
	stb %i2, [%i0+24]
	srl %i1, 8, %i2
	stb %i2, [%i0+22]
	srl %i1, 16, %i2
	stb %i2, [%i0+21]
	stb %i1, [%i0+23]
	srl %i1, 24, %i1
	stb %i1, [%i0+20]
	ret
	restore
.Lfunc_end0:
	.size	_blake3_compress_in_place_sse2, .Lfunc_end0-_blake3_compress_in_place_sse2

	.globl	_blake3_compress_xof_sse2
	.p2align	2
	.type	_blake3_compress_xof_sse2,@function
_blake3_compress_xof_sse2:
	.register %g2, #scratch
	.register %g3, #scratch
	save %sp, -880, %sp
	stx %i5, [%fp+1439]
	ldub [%i0+6], %g2
	ldub [%i0+7], %g3
	ldub [%i0+4], %g4
	ldub [%i0+5], %g5
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g4, 8, %g3
	or %g3, %g5, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %l1
	ldub [%i0+2], %g2
	ldub [%i0+3], %g3
	ldub [%i0], %g4
	ldub [%i0+1], %g5
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g4, 8, %g3
	or %g3, %g5, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %l2
	ldub [%i0+14], %g2
	ldub [%i0+15], %g3
	ldub [%i0+12], %g4
	ldub [%i0+13], %g5
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g4, 8, %g3
	or %g3, %g5, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %l5
	ldub [%i0+10], %g2
	ldub [%i0+11], %g3
	ldub [%i0+8], %g4
	ldub [%i0+9], %g5
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g4, 8, %g3
	or %g3, %g5, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %o0
	ldub [%i0+18], %g2
	ldub [%i0+19], %g3
	ldub [%i0+16], %g4
	ldub [%i0+17], %g5
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g4, 8, %g3
	or %g3, %g5, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %g4
	ldub [%i0+22], %g2
	ldub [%i0+23], %g3
	ldub [%i0+20], %g5
	ldub [%i0+21], %l0
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g5, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %l0
	ldub [%i0+27], %l3
	ldub [%i0+26], %l6
	ldub [%i0+25], %l7
	ldub [%i0+24], %o1
	ldub [%i0+31], %g3
	ldub [%i0+30], %g5
	ldub [%i0+29], %g2
	stx %i0, [%fp+1431]
	ldub [%i0+28], %l4
	ldub [%i1+6], %o2
	ldub [%i1+7], %o3
	ldub [%i1+4], %o4
	ldub [%i1+5], %o5
	sll %o2, 8, %o2
	or %o2, %o3, %o2
	sll %o4, 8, %o3
	or %o3, %o5, %o3
	sll %o3, 16, %o3
	or %o3, %o2, %o2
	st %o2, [%fp+1947]
	ld [%fp+1947], %f0
	sll %l6, 8, %l6
	or %l6, %l3, %l3
	sll %o1, 8, %l6
	st %f0, [%fp+2015]
	ldub [%i1+2], %o1
	ldub [%i1+3], %o2
	ldub [%i1], %o3
	ldub [%i1+1], %o4
	sll %o1, 8, %o1
	or %o1, %o2, %o1
	sll %o3, 8, %o2
	or %o2, %o4, %o2
	sll %o2, 16, %o2
	or %o2, %o1, %o1
	st %o1, [%fp+1979]
	ld [%fp+2015], %o5
	ld [%fp+1979], %f5
	ldub [%i1+14], %o1
	ldub [%i1+15], %o2
	ldub [%i1+12], %o3
	ldub [%i1+13], %o4
	sll %o1, 8, %o1
	or %o1, %o2, %o1
	sll %o3, 8, %o2
	or %o2, %o4, %o2
	sll %o2, 16, %o2
	or %o2, %o1, %o1
	st %o1, [%fp+1975]
	ld [%fp+1975], %f0
	or %l6, %l7, %l6
	sll %l6, 16, %l6
	or %l6, %l3, %l3
	st %f0, [%fp+1987]
	ldub [%i1+10], %l6
	ldub [%i1+11], %l7
	ldub [%i1+8], %o1
	ldub [%i1+9], %o2
	sll %l6, 8, %l6
	or %l6, %l7, %l6
	sll %o1, 8, %l7
	or %l7, %o2, %l7
	sll %l7, 16, %l7
	or %l7, %l6, %l6
	st %l6, [%fp+1919]
	ld [%fp+1987], %o4
	ld [%fp+1919], %f7
	ldub [%i1+22], %l6
	ldub [%i1+23], %l7
	ldub [%i1+20], %o1
	ldub [%i1+21], %o2
	sll %l6, 8, %l6
	or %l6, %l7, %l6
	sll %o1, 8, %l7
	or %l7, %o2, %l7
	sll %l7, 16, %l7
	or %l7, %l6, %l6
	st %l6, [%fp+1971]
	ld [%fp+1971], %f0
	sll %g5, 8, %g5
	or %g5, %g3, %g3
	sll %l4, 8, %g5
	st %f0, [%fp+1991]
	ldub [%i1+18], %l4
	ldub [%i1+19], %l6
	ldub [%i1+16], %l7
	ldub [%i1+17], %o1
	sll %l4, 8, %l4
	or %l4, %l6, %l4
	sll %l7, 8, %l6
	or %l6, %o1, %l6
	sll %l6, 16, %l6
	or %l6, %l4, %l4
	st %l4, [%fp+1923]
	ld [%fp+1991], %i0
	ld [%fp+1923], %f0
	ldub [%i1+30], %l4
	ldub [%i1+31], %l6
	ldub [%i1+28], %l7
	ldub [%i1+29], %o1
	sll %l4, 8, %l4
	or %l4, %l6, %l4
	sll %l7, 8, %l6
	or %l6, %o1, %l6
	sll %l6, 16, %l6
	or %l6, %l4, %l4
	st %l4, [%fp+1967]
	ld [%fp+1967], %f1
	or %g5, %g2, %g2
	sll %g2, 16, %g2
	or %g2, %g3, %g5
	st %f1, [%fp+1995]
	ldub [%i1+26], %g2
	ldub [%i1+27], %g3
	ldub [%i1+24], %l4
	ldub [%i1+25], %l6
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %l4, 8, %g3
	or %g3, %l6, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %g2
	st %g2, [%fp+1927]
	ld [%fp+1995], %g2
	st %f0, [%fp+2039]
	ld [%fp+2039], %i5
	ld [%fp+1927], %f10
	ldub [%i1+38], %g3
	ldub [%i1+39], %l4
	ldub [%i1+36], %l6
	ldub [%i1+37], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1963]
	ldub [%i1+34], %g3
	ldub [%i1+35], %l4
	ldub [%i1+32], %l6
	ldub [%i1+33], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1931]
	ld [%fp+1963], %f2
	ld [%fp+1931], %f4
	ldub [%i1+46], %g3
	ldub [%i1+47], %l4
	ldub [%i1+44], %l6
	ldub [%i1+45], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1959]
	ldub [%i1+42], %g3
	ldub [%i1+43], %l4
	ldub [%i1+40], %l6
	ldub [%i1+41], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1935]
	ld [%fp+1959], %f3
	ld [%fp+1935], %f0
	ldub [%i1+54], %g3
	ldub [%i1+55], %l4
	ldub [%i1+52], %l6
	ldub [%i1+53], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1955]
	ldub [%i1+50], %g3
	ldub [%i1+51], %l4
	ldub [%i1+48], %l6
	ldub [%i1+49], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1939]
	ld [%fp+1955], %f1
	ld [%fp+1939], %f8
	ldub [%i1+62], %g3
	ldub [%i1+63], %l4
	ldub [%i1+60], %l6
	ldub [%i1+61], %l7
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %l7, %l4
	sll %l4, 16, %l4
	or %l4, %g3, %g3
	st %g3, [%fp+1951]
	ldub [%i1+58], %g3
	ldub [%i1+59], %l4
	ldub [%i1+56], %l6
	ldub [%i1+57], %i1
	sll %g3, 8, %g3
	or %g3, %l4, %g3
	sll %l6, 8, %l4
	or %l4, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g3, %i1
	st %i1, [%fp+1943]
	ld [%fp+1951], %f6
	ld [%fp+1943], %f9
	st %f7, [%fp+2043]
	st %f5, [%fp+1983]
	st %f10, [%fp+2035]
	ld [%fp+1983], %i1
	srlx %i3, 32, %l4
	ld [%fp+2043], %o7
	ld [%fp+2035], %g3
	srl %i1, 0, %l6
	sllx %i1, 32, %l7
	or %l6, %l7, %l6
	stx %l6, [%fp+1503]
	srl %g3, 0, %l6
	sllx %g3, 32, %l7
	or %l6, %l7, %l6
	stx %l6, [%fp+1527]
	add %i5, %o0, %l6
	add %g3, %l5, %l5
	add %i1, %l2, %g3
	add %o7, %l1, %i1
	add %i1, %l0, %i1
	add %g3, %g4, %g3
	add %l5, %g5, %l1
	add %l6, %l3, %l2
	xor %l2, %i2, %i2
	sll %i2, 16, %l5
	srl %i2, 16, %i2
	or %i2, %l5, %i2
	xor %l1, %i4, %i4
	sll %i4, 16, %l5
	srl %i4, 16, %i4
	or %i4, %l5, %i4
	xor %g3, %i3, %i3
	sll %i3, 16, %l5
	srl %i3, 16, %i3
	or %i3, %l5, %i3
	xor %i1, %l4, %l4
	sll %l4, 16, %l5
	srl %l4, 16, %l4
	or %l4, %l5, %l4
	sethi 2708477, %l5
	or %l5, 314, %l5
	add %i4, %l5, %l5
	sethi 990140, %l6
	or %l6, 882, %l6
	add %i2, %l6, %l6
	xor %l6, %l3, %l3
	xor %l5, %g5, %g5
	srl %l3, 12, %l7
	sll %l3, 20, %l3
	or %l3, %l7, %l3
	srl %g5, 12, %l7
	sll %g5, 20, %g5
	or %g5, %l7, %g5
	sethi 1737337, %l7
	or %l7, 615, %l7
	add %i3, %l7, %l7
	xor %l7, %g4, %g4
	srl %g4, 12, %o0
	sll %g4, 20, %g4
	or %g4, %o0, %g4
	sethi 3070443, %o0
	or %o0, 645, %o0
	add %l4, %o0, %o0
	xor %o0, %l0, %l0
	srl %l0, 12, %o1
	sll %l0, 20, %l0
	or %l0, %o1, %l0
	st %i0, [%fp+1519]
	add %l2, %i0, %l2
	add %l3, %l2, %l2
	xor %l2, %i2, %i2
	srl %i2, 8, %o1
	sll %i2, 24, %i2
	or %i2, %o1, %i2
	add %l1, %g2, %l1
	add %g5, %l1, %l1
	xor %l1, %i4, %i4
	srl %i4, 8, %o1
	sll %i4, 24, %i4
	or %i4, %o1, %i4
	st %o5, [%fp+1479]
	add %g3, %o5, %g3
	add %g4, %g3, %g3
	xor %g3, %i3, %i3
	srl %i3, 8, %o1
	sll %i3, 24, %i3
	or %i3, %o1, %i3
	add %i1, %o4, %i1
	add %l0, %i1, %o1
	xor %o1, %l4, %i1
	srl %i1, 8, %l4
	sll %i1, 24, %i1
	or %i1, %l4, %l4
	add %i2, %l6, %i1
	xor %i1, %l3, %l3
	srl %l3, 7, %l6
	sll %l3, 25, %l3
	or %l3, %l6, %l3
	add %i4, %l5, %l5
	xor %l5, %g5, %g5
	srl %g5, 7, %l6
	sll %g5, 25, %g5
	or %g5, %l6, %g5
	add %i3, %l7, %l6
	xor %l6, %g4, %g4
	srl %g4, 7, %l7
	sll %g4, 25, %g4
	or %g4, %l7, %g4
	add %l4, %o0, %l7
	xor %l7, %l0, %l0
	st %f4, [%fp+2031]
	st %f9, [%fp+2019]
	st %f8, [%fp+2023]
	st %f0, [%fp+2027]
	ld [%fp+2027], %i0
	srl %l0, 7, %o0
	sll %l0, 25, %l0
	or %l0, %o0, %l0
	st %i0, [%fp+1463]
	add %o1, %i0, %o0
	add %l3, %o0, %o0
	xor %o0, %i3, %i3
	ld [%fp+2023], %i0
	sll %i3, 16, %o1
	srl %i3, 16, %i3
	or %i3, %o1, %i3
	st %i0, [%fp+1455]
	add %l2, %i0, %l2
	add %g5, %l2, %l2
	xor %l2, %l4, %l4
	ld [%fp+2019], %i0
	sll %l4, 16, %o1
	srl %l4, 16, %l4
	or %l4, %o1, %l4
	st %i0, [%fp+1511]
	add %l1, %i0, %l1
	add %g4, %l1, %l1
	xor %l1, %i2, %i2
	ld [%fp+2031], %i0
	sll %i2, 16, %o1
	srl %i2, 16, %i2
	or %i2, %o1, %i2
	st %i0, [%fp+1487]
	add %g3, %i0, %g3
	add %l0, %g3, %g3
	xor %g3, %i4, %i4
	sll %i4, 16, %o1
	srl %i4, 16, %i4
	or %i4, %o1, %i4
	add %i3, %l5, %l5
	xor %l5, %l3, %l3
	srl %l3, 12, %o1
	sll %l3, 20, %l3
	or %l3, %o1, %l3
	add %l4, %l6, %l6
	xor %l6, %g5, %g5
	srl %g5, 12, %o1
	sll %g5, 20, %g5
	or %g5, %o1, %g5
	add %i2, %l7, %l7
	xor %l7, %g4, %g4
	srl %g4, 12, %o1
	sll %g4, 20, %g4
	or %g4, %o1, %g4
	add %i4, %i1, %i1
	xor %i1, %l0, %l0
	st %f2, [%fp+1999]
	st %f6, [%fp+2011]
	st %f1, [%fp+2007]
	st %f3, [%fp+2003]
	srl %l0, 12, %o1
	ld [%fp+2007], %o2
	ld [%fp+2003], %i0
	sll %l0, 20, %l0
	or %l0, %o1, %l0
	add %l2, %o2, %l2
	st %i0, [%fp+1467]
	add %o0, %i0, %o0
	add %l3, %o0, %o0
	xor %o0, %i3, %i3
	srl %i3, 8, %o1
	sll %i3, 24, %i3
	or %i3, %o1, %i3
	add %g5, %l2, %l2
	xor %l2, %l4, %l4
	ld [%fp+2011], %i0
	srl %l4, 8, %o1
	sll %l4, 24, %l4
	or %l4, %o1, %o1
	st %i0, [%fp+1375]
	add %l1, %i0, %l1
	add %g4, %l1, %l1
	xor %l1, %i2, %i2
	ld [%fp+1999], %i0
	srl %i2, 8, %l4
	sll %i2, 24, %i2
	or %i2, %l4, %i2
	st %i0, [%fp+1367]
	add %g3, %i0, %g3
	add %l0, %g3, %g3
	xor %g3, %i4, %i4
	srl %i4, 8, %l4
	sll %i4, 24, %i4
	or %i4, %l4, %i4
	add %i3, %l5, %l5
	xor %l5, %l3, %l3
	srl %l3, 7, %l4
	sll %l3, 25, %l3
	or %l3, %l4, %l3
	add %o1, %l6, %l6
	xor %l6, %g5, %g5
	srl %g5, 7, %l4
	sll %g5, 25, %g5
	or %g5, %l4, %o2
	add %i2, %l7, %g5
	xor %g5, %g4, %g4
	srl %g4, 7, %l4
	sll %g4, 25, %g4
	or %g4, %l4, %l7
	add %i4, %i1, %i1
	xor %i1, %l0, %g4
	srl %g4, 7, %l0
	sll %g4, 25, %g4
	or %g4, %l0, %l0
	add %l2, %g2, %g4
	add %l3, %g4, %i0
	st %i0, [%fp+1399]
	xor %i0, %i2, %i2
	sll %i2, 16, %g4
	srl %i2, 16, %i2
	or %i2, %g4, %l2
	add %l1, %i5, %i2
	add %o2, %i2, %l4
	xor %l4, %i4, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %g4
	add %g3, %o7, %i2
	add %l7, %i2, %i0
	st %i0, [%fp+1327]
	xor %i0, %i3, %i2
	sll %i2, 16, %i3
	srl %i2, 16, %i2
	or %i2, %i3, %o3
	add %o0, %o4, %i2
	add %l0, %i2, %i0
	st %i0, [%fp+1343]
	xor %i0, %o1, %i2
	sll %i2, 16, %i3
	srl %i2, 16, %i2
	or %i2, %i3, %i3
	sllx %g2, 32, %i2
	stx %i5, [%fp+1447]
	srl %i5, 0, %i0
	mov	%l2, %i5
	stx %i0, [%fp+1407]
	or %i0, %i2, %i0
	stx %i0, [%fp+1383]
	st %o4, [%fp+1471]
	srl %o4, 0, %i2
	stx %o7, [%fp+1423]
	sllx %o7, 32, %i0
	stx %i0, [%fp+1391]
	or %i2, %i0, %i0
	stx %i0, [%fp+1495]
	st %i3, [%fp+1323]
	add %i3, %g5, %g2
	add %o3, %l6, %i4
	add %g4, %l5, %i0
	add %l2, %i1, %o1
	xor %o1, %l3, %i2
	st %i0, [%fp+1335]
	xor %i0, %o2, %i3
	st %i4, [%fp+1331]
	xor %i4, %l7, %i4
	st %g2, [%fp+1319]
	xor %g2, %l0, %g2
	srl %i3, 12, %i1
	sll %i3, 20, %l6
	srl %i2, 12, %g3
	sll %i2, 20, %l0
	srl %g2, 12, %i2
	sll %g2, 20, %l5
	srl %i4, 12, %o7
	sll %i4, 20, %o5
	mov	0, %i3
.LBB1_1:
	add %fp, 1903, %g2
	or %g2, 2, %g5
	sth %l2, [%g5]
	or %g2, 4, %l2
	sth %l1, [%l2]
	or %g2, 6, %l1
	sth %l7, [%l1]
	or %g2, 8, %l7
	sth %o4, [%l7]
	or %g2, 10, %o4
	sth %o2, [%o4]
	or %g2, 12, %o2
	sth %i4, [%o2]
	or %g2, 14, %i4
	sth %l3, [%i4]
	sth %o0, [%fp+1903]
	and %i3, 7, %l3
	sllx %l3, 1, %l3
	or %g2, %l3, %l3
	mov	204, %g2
	sth %g2, [%l3]
	lduh [%i4], %l3
	lduh [%o2], %i4
	lduh [%o4], %o2
	lduh [%l7], %o4
	lduh [%l1], %l7
	lduh [%l2], %l1
	lduh [%g5], %l2
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB1_1
	lduh [%fp+1903], %o0
	ba .LBB1_2
	nop
.LBB1_2:
	xor %l6, %i1, %l6
	xor %o5, %o7, %o7
	xor %l0, %g3, %l0
	xor %l5, %i2, %g3
	sll %o4, 16, %i1
	and %o2, 32, %i2
	or %i2, %i1, %i1
	sllx %i1, 32, %i1
	sll %i4, 16, %i2
	and %l3, 128, %i3
	or %i3, %i2, %i2
	srl %i2, 0, %i2
	or %i2, %i1, %i1
	sll %o0, 16, %i2
	and %l2, 2, %i3
	or %i3, %i2, %i2
	sllx %i2, 32, %i2
	sll %l1, 16, %i3
	and %l7, 8, %i4
	or %i4, %i3, %i3
	srl %i3, 0, %i3
	or %i3, %i2, %i2
	sethi 256, %i3
	or %i3, 8, %i3
	sethi 64, %i4
	or %i4, 2, %i4
	sllx %i4, 32, %i4
	or %i4, %i3, %i0
	stx %i0, [%fp+1543]
	and %i2, %i0, %i3
	sethi 4096, %i2
	or %i2, 128, %i2
	sethi 1024, %i4
	or %i4, 32, %i4
	sllx %i4, 32, %i4
	or %i4, %i2, %i0
	stx %i0, [%fp+1535]
	and %i1, %i0, %i4
	srl %i4, 16, %i2
	srlx %i4, 48, %g5
	mov	%g0, %i1
	cmp %g5, 16
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %i2, 64
	mov	%i1, %l1
	move	%icc, 1, %l1
	srlx %i3, 48, %i2
	cmp %i2, 1
	mov	%i1, %l2
	move	%icc, 1, %l2
	srl %i3, 16, %i2
	cmp %i2, 4
	mov	%i1, %l3
	move	%icc, 1, %l3
	srl %i3, 3, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %l5
	sethi 63, %i2
	or %i2, 1023, %i0
	and %l5, %i0, %l5
	sll %l3, 16, %l3
	sub %l5, %l3, %l3
	srlx %i3, 33, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i0, %i3
	sll %l2, 16, %l2
	sub %i3, %l2, %i3
	srl %i4, 7, %l2
	and %l2, 1, %l2
	sub %i1, %l2, %l2
	and %l2, %i0, %l2
	sll %l1, 16, %l1
	sub %l2, %l1, %l1
	st %f0, [%fp+1891]
	st %f0, [%fp+1887]
	st %f1, [%fp+1899]
	st %f1, [%fp+1895]
	srlx %i4, 37, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	ld [%fp+1895], %l2
	and %i4, %i0, %i4
	sll %g5, 16, %g5
	sub %i4, %g5, %i4
	and %i4, %l2, %g5
	ld [%fp+1899], %l2
	ldx [%fp+1503], %i2
	srlx %i2, 32, %l5
	andn %l5, %i4, %i4
	ld [%fp+1887], %l5
	and %l1, %l2, %l2
	andn %i2, %l1, %l1
	ld [%fp+1891], %l7
	and %i3, %l5, %l5
	ldx [%fp+1527], %i2
	srlx %i2, 32, %o0
	andn %o0, %i3, %i3
	and %l3, %l7, %l7
	andn %i2, %l3, %l3
	or %l3, %l7, %l7
	or %i3, %l5, %l5
	srl %l7, 0, %i3
	sllx %l5, 32, %l3
	or %i3, %l3, %i2
	stx %i2, [%fp+1351]
	or %l1, %l2, %i3
	or %i4, %g5, %i2
	srl %i3, 0, %i4
	sllx %i2, 32, %g5
	or %i4, %g5, %i4
	stx %i4, [%fp+1359]
	add %i3, %l4, %i3
	add %i3, %l6, %i3
	st %i3, [%fp+1315]
	xor %i3, %g4, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l4
	stx %l5, [%fp+1415]
	ld [%fp+1327], %i3
	add %l5, %i3, %i3
	add %i3, %o7, %o2
	xor %o2, %o3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %g4
	stx %i2, [%fp+1503]
	ld [%fp+1399], %i3
	add %i2, %i3, %i3
	add %i3, %l0, %l3
	xor %l3, %i5, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l1
	st %l7, [%fp+1399]
	ld [%fp+1343], %i2
	add %l7, %i2, %i3
	add %i3, %g3, %o3
	ld [%fp+1323], %i2
	xor %o3, %i2, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o4
	ld [%fp+1319], %i2
	add %o4, %i2, %i3
	add %l1, %o1, %g5
	sllx %i3, 32, %i4
	srl %g5, 0, %l2
	or %l2, %i4, %i2
	stx %i2, [%fp+1343]
	ld [%fp+1331], %i2
	add %g4, %i2, %l2
	ld [%fp+1335], %i2
	add %l4, %i2, %l5
	srl %l2, 0, %i4
	sllx %l5, 32, %l7
	or %i4, %l7, %i2
	stx %i2, [%fp+1335]
	xor %i3, %g3, %i3
	xor %l2, %o7, %g3
	xor %l5, %l6, %l2
	xor %g5, %l0, %g5
	srl %g5, 7, %l0
	srl %i3, 7, %l5
	sll %i3, 25, %i3
	or %i3, %l5, %i3
	srl %g3, 7, %l5
	sll %g3, 25, %g3
	or %g3, %l5, %g3
	srl %l2, 7, %l5
	sll %g5, 25, %l6
	sll %l2, 25, %l2
	srl %i3, 0, %i3
	sllx %g3, 32, %g3
	or %i3, %g3, %g5
	or %l2, %l5, %i3
	srl %i3, 0, %i3
	or %l6, %l0, %g3
	sllx %g3, 32, %g3
	or %i3, %g3, %l2
	mov	0, %l0
.LBB1_3:
	add %fp, 1871, %g3
	or %g3, 2, %i4
	sth %o5, [%i4]
	or %g3, 4, %o5
	sth %o7, [%o5]
	or %g3, 6, %o7
	sth %o0, [%o7]
	or %g3, 8, %o0
	sth %l7, [%o0]
	or %g3, 10, %l7
	sth %i3, [%l7]
	or %g3, 12, %i3
	sth %l5, [%i3]
	or %g3, 14, %l5
	sth %o1, [%l5]
	sth %l6, [%fp+1871]
	and %l0, 7, %l6
	sllx %l6, 1, %l6
	or %g3, %l6, %l6
	mov	192, %g3
	sth %g3, [%l6]
	lduh [%l5], %o1
	lduh [%i3], %l5
	lduh [%l7], %i3
	lduh [%o0], %l7
	lduh [%o7], %o0
	lduh [%o5], %o7
	lduh [%i4], %o5
	add %l0, 1, %l0
	cmp %l0, 8
	bne %xcc, .LBB1_3
	lduh [%fp+1871], %l6
	ba .LBB1_4
	nop
.LBB1_4:
	sll %l7, 16, %i4
	and %i3, 32, %i3
	or %i3, %i4, %i3
	sll %l5, 16, %i4
	and %o1, 128, %l0
	or %l0, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	sll %l6, 16, %i4
	and %o5, 2, %l0
	or %l0, %i4, %i4
	sll %o7, 16, %l0
	and %o0, 8, %l5
	or %l5, %l0, %l0
	sllx %i4, 32, %i4
	srl %l0, 0, %l0
	or %l0, %i4, %i4
	ldx [%fp+1535], %i2
	and %i3, %i2, %i3
	srl %i3, 16, %l0
	cmp %l0, 64
	ldx [%fp+1543], %i2
	and %i4, %i2, %i4
	mov	%i1, %l0
	move	%icc, 1, %l0
	srl %i4, 16, %l5
	cmp %l5, 4
	mov	%i1, %l5
	move	%icc, 1, %l5
	srlx %i3, 48, %l6
	cmp %l6, 16
	mov	%i1, %l6
	move	%icc, 1, %l6
	srlx %i4, 48, %l7
	cmp %l7, 1
	mov	%i1, %l7
	move	%icc, 1, %l7
	srlx %i4, 33, %o0
	and %o0, 1, %o0
	sub %i1, %o0, %o0
	and %o0, %i0, %o0
	sll %l7, 16, %l7
	sub %o0, %l7, %l7
	srlx %i3, 37, %o0
	and %o0, 1, %o0
	sub %i1, %o0, %o0
	and %o0, %i0, %o0
	sll %l6, 16, %l6
	sub %o0, %l6, %l6
	srl %i4, 3, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i0, %i4
	sll %l5, 16, %l5
	sub %i4, %l5, %i4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	st %i0, [%fp+1527]
	and %i3, %i0, %i3
	sll %l0, 16, %l0
	sub %i3, %l0, %i3
	ld [%fp+1455], %i2
	and %i3, %i2, %l0
	ld [%fp+1471], %i2
	andn %i2, %i3, %i3
	ld [%fp+1463], %i2
	and %l6, %i2, %l5
	ld [%fp+1479], %i2
	andn %i2, %l6, %l6
	ld [%fp+1375], %i2
	andn %i2, %l7, %o0
	ld [%fp+1511], %i0
	and %l7, %i0, %l7
	or %o0, %l7, %l7
	or %l6, %l5, %i2
	ld [%fp+1367], %i5
	andn %i5, %i4, %l5
	ld [%fp+1487], %o7
	and %i4, %o7, %i4
	or %l5, %i4, %l5
	or %i3, %l0, %i0
	st %i0, [%fp+1455]
	add %i0, %o3, %i3
	srlx %l2, 32, %i4
	add %i3, %i4, %i3
	xor %i3, %g4, %g4
	sll %g4, 16, %l0
	srl %g4, 16, %g4
	or %g4, %l0, %g4
	st %l5, [%fp+1375]
	add %l5, %l3, %l0
	add %l0, %l2, %l0
	xor %l0, %o4, %l3
	sll %l3, 16, %l5
	srl %l3, 16, %l3
	or %l3, %l5, %l3
	st %i2, [%fp+1471]
	add %i2, %o2, %l5
	add %l5, %g5, %l5
	xor %l5, %l4, %l4
	sll %l4, 16, %l6
	srl %l4, 16, %l4
	or %l4, %l6, %l4
	st %l7, [%fp+1463]
	ld [%fp+1315], %i0
	add %l7, %i0, %l6
	srlx %g5, 32, %l7
	add %l6, %l7, %l6
	xor %l6, %l1, %l1
	sll %l1, 16, %o0
	srl %l1, 16, %l1
	or %l1, %o0, %l1
	ldx [%fp+1335], %i0
	srlx %i0, 32, %o0
	add %g4, %o0, %o0
	xor %o0, %i4, %i4
	srl %i4, 12, %o1
	sll %i4, 20, %i4
	or %i4, %o1, %i4
	add %l3, %i0, %o1
	xor %o1, %l2, %l2
	srl %l2, 12, %o2
	sll %l2, 20, %l2
	or %l2, %o2, %l2
	ldx [%fp+1343], %i0
	add %l4, %i0, %o2
	xor %o2, %g5, %g5
	srl %g5, 12, %o3
	sll %g5, 20, %g5
	or %g5, %o3, %g5
	srlx %i0, 32, %o3
	add %l1, %o3, %o3
	xor %o3, %l7, %l7
	srl %l7, 12, %o4
	sll %l7, 20, %l7
	or %l7, %o4, %l7
	ld [%fp+1519], %i2
	add %i3, %i2, %i3
	add %i4, %i3, %o5
	xor %o5, %g4, %i3
	srl %i3, 8, %g4
	sll %i3, 24, %i3
	or %i3, %g4, %g4
	ld [%fp+1511], %i5
	add %l0, %i5, %i3
	add %l2, %i3, %l0
	xor %l0, %l3, %i3
	srl %i3, 8, %l3
	sll %i3, 24, %i3
	or %i3, %l3, %l3
	ld [%fp+1467], %i2
	add %l5, %i2, %i3
	add %g5, %i3, %l5
	xor %l5, %l4, %i3
	srl %i3, 8, %l4
	sll %i3, 24, %i3
	or %i3, %l4, %l4
	add %l6, %o7, %i3
	add %l7, %i3, %l6
	xor %l6, %l1, %i3
	srl %i3, 8, %l1
	sll %i3, 24, %i3
	or %i3, %l1, %l1
	add %g4, %o0, %i3
	xor %i3, %i4, %i4
	srl %i4, 7, %o0
	sll %i4, 25, %i4
	or %i4, %o0, %o4
	add %l3, %o1, %i4
	xor %i4, %l2, %l2
	srl %l2, 7, %o0
	sll %l2, 25, %l2
	or %l2, %o0, %o7
	add %l4, %o2, %l2
	xor %l2, %g5, %g5
	srl %g5, 7, %o0
	sll %g5, 25, %g5
	or %g5, %o0, %g5
	add %l1, %o3, %o0
	xor %o0, %l7, %l7
	srl %l7, 7, %o1
	sll %l7, 25, %l7
	or %l7, %o1, %l7
	ldx [%fp+1495], %o3
	sllx %o3, 32, %o1
	ldx [%fp+1351], %i0
	srl %i0, 0, %o2
	or %o2, %o1, %i2
	stx %i2, [%fp+1479]
	add %o5, %i0, %o1
	ldx [%fp+1359], %o5
	add %l0, %o5, %l0
	add %o4, %l0, %i0
	st %i0, [%fp+1343]
	xor %i0, %l1, %l0
	sll %l0, 16, %l1
	srl %l0, 16, %l0
	or %l0, %l1, %i0
	ldx [%fp+1383], %i2
	srlx %i2, 32, %o2
	add %l6, %o2, %l0
	add %o7, %l0, %i2
	st %i2, [%fp+1327]
	xor %i2, %l4, %l0
	sll %l0, 16, %l1
	srl %l0, 16, %l0
	or %l0, %l1, %l4
	add %g5, %o1, %i2
	st %i2, [%fp+1331]
	xor %i2, %l3, %l0
	sll %l0, 16, %l1
	srl %l0, 16, %l0
	or %l0, %l1, %l1
	add %l5, %o3, %l0
	add %l7, %l0, %i2
	st %i2, [%fp+1319]
	xor %i2, %g4, %g4
	sll %g4, 16, %l0
	srl %g4, 16, %g4
	or %g4, %l0, %l0
	ld [%fp+1455], %i2
	st %i2, [%fp+1867]
	ld [%fp+1867], %f0
	st %i5, [%fp+1863]
	ldx [%fp+1423], %i2
	srl %i2, 0, %g4
	ldx [%fp+1391], %i2
	or %g4, %i2, %i5
	ldx [%fp+1447], %i2
	sllx %i2, 32, %g4
	ldx [%fp+1407], %i2
	or %i2, %g4, %i2
	stx %i2, [%fp+1511]
	sllx %o5, 32, %g4
	stx %o2, [%fp+1391]
	or %o2, %g4, %i2
	stx %i2, [%fp+1367]
	st %l0, [%fp+1323]
	add %l0, %i4, %l0
	st %l1, [%fp+1335]
	add %l1, %o0, %g4
	st %l4, [%fp+1383]
	add %l4, %i3, %i2
	st %i0, [%fp+1447]
	add %i0, %l2, %i0
	st %i0, [%fp+1307]
	xor %i0, %o4, %i4
	st %i2, [%fp+1315]
	xor %i2, %o7, %i3
	st %g4, [%fp+1303]
	xor %g4, %g5, %g4
	st %l0, [%fp+1311]
	xor %l0, %l7, %g5
	srl %i3, 12, %o4
	sll %i3, 20, %o7
	srl %g5, 12, %i3
	sll %g5, 20, %l2
	srl %i4, 12, %o5
	sll %i4, 20, %l3
	ld [%fp+1863], %f1
	srl %g4, 12, %l1
	sll %g4, 20, %l4
	mov	0, %o2
.LBB1_5:
	add %fp, 1839, %l0
	or %l0, 2, %l6
	sth %g4, [%l6]
	or %l0, 4, %g4
	sth %o1, [%g4]
	or %l0, 6, %o1
	sth %i4, [%o1]
	or %l0, 8, %i4
	sth %o3, [%i4]
	or %l0, 10, %o3
	sth %g5, [%o3]
	or %l0, 12, %g5
	sth %l7, [%g5]
	or %l0, 14, %l7
	sth %o0, [%l7]
	sth %l5, [%fp+1839]
	and %o2, 7, %l5
	sllx %l5, 1, %l5
	or %l0, %l5, %l0
	sth %g2, [%l0]
	lduh [%l7], %o0
	lduh [%g5], %l7
	lduh [%o3], %g5
	lduh [%i4], %o3
	lduh [%o1], %i4
	lduh [%g4], %o1
	lduh [%l6], %g4
	add %o2, 1, %o2
	cmp %o2, 8
	bne %xcc, .LBB1_5
	lduh [%fp+1839], %l5
	ba .LBB1_6
	nop
.LBB1_6:
	xor %o7, %o4, %o7
	xor %l2, %i3, %o4
	xor %l3, %o5, %o5
	xor %l4, %l1, %i3
	sll %o3, 16, %l0
	and %g5, 32, %g5
	or %g5, %l0, %g5
	st %f0, [%fp+1827]
	st %f0, [%fp+1823]
	st %f1, [%fp+1835]
	st %f1, [%fp+1831]
	sllx %g5, 32, %g5
	sll %l7, 16, %l0
	and %o0, 128, %l1
	or %l1, %l0, %l0
	srl %l0, 0, %l0
	or %l0, %g5, %g5
	sll %l5, 16, %l0
	and %g4, 2, %g4
	or %g4, %l0, %g4
	sllx %g4, 32, %g4
	sll %o1, 16, %l0
	and %i4, 8, %i4
	or %i4, %l0, %i4
	srl %i4, 0, %i4
	or %i4, %g4, %i4
	ldx [%fp+1543], %i2
	and %i4, %i2, %i4
	srl %i4, 16, %g4
	srlx %i4, 48, %l0
	ldx [%fp+1535], %i2
	and %g5, %i2, %g5
	srl %g5, 16, %l1
	srlx %g5, 48, %l2
	cmp %l2, 16
	mov	%i1, %l2
	move	%icc, 1, %l2
	cmp %l1, 64
	mov	%i1, %l1
	move	%icc, 1, %l1
	cmp %l0, 1
	mov	%i1, %l0
	move	%icc, 1, %l0
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srl %i4, 3, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	ld [%fp+1527], %i0
	and %l3, %i0, %l3
	sll %g4, 16, %g4
	sub %l3, %g4, %g4
	ld [%fp+1835], %l3
	srlx %i4, 33, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i0, %i4
	sll %l0, 16, %l0
	sub %i4, %l0, %i4
	srl %g5, 7, %l0
	and %l0, 1, %l0
	sub %i1, %l0, %l0
	and %l0, %i0, %l0
	sll %l1, 16, %l1
	sub %l0, %l1, %l0
	ld [%fp+1831], %l1
	srlx %g5, 37, %g5
	and %g5, 1, %g5
	sub %i1, %g5, %g5
	and %g5, %i0, %g5
	sll %l2, 16, %l2
	sub %g5, %l2, %g5
	and %g5, %l1, %l1
	srlx %i5, 32, %l2
	andn %l2, %g5, %g5
	ld [%fp+1823], %l2
	and %l0, %l3, %l3
	andn %i5, %l0, %i5
	ld [%fp+1827], %l0
	and %i4, %l2, %l2
	ldx [%fp+1511], %i2
	srlx %i2, 32, %l4
	andn %l4, %i4, %i4
	and %g4, %l0, %l0
	andn %i2, %g4, %g4
	or %g4, %l0, %l4
	srl %l4, 0, %g4
	or %i4, %l2, %l0
	sllx %l0, 32, %i4
	or %g4, %i4, %i2
	stx %i2, [%fp+1351]
	or %i5, %l3, %i4
	srl %i4, 0, %i5
	or %g5, %l1, %i2
	sllx %i2, 32, %g4
	or %i5, %g4, %i5
	stx %i5, [%fp+1359]
	ld [%fp+1327], %i5
	add %i4, %i5, %i4
	stx %l0, [%fp+1423]
	ld [%fp+1319], %i5
	add %l0, %i5, %i5
	stx %i2, [%fp+1511]
	ld [%fp+1343], %g4
	add %i2, %g4, %g4
	st %l4, [%fp+1407]
	ld [%fp+1331], %i2
	add %l4, %i2, %g5
	add %g5, %i3, %l6
	add %g4, %o5, %o1
	add %i5, %o4, %l5
	add %i4, %o7, %l4
	ld [%fp+1383], %i2
	xor %l4, %i2, %i4
	ld [%fp+1323], %i2
	xor %l5, %i2, %i5
	ld [%fp+1447], %i2
	xor %o1, %i2, %g4
	ld [%fp+1335], %i2
	xor %l6, %i2, %g5
	srl %g5, 8, %l0
	srl %g4, 8, %l1
	srl %i5, 8, %l3
	srl %i4, 8, %l2
	sll %g5, 24, %g5
	sll %g4, 24, %g4
	sll %i5, 24, %i5
	sll %i4, 24, %i4
	or %i4, %l2, %l2
	or %i5, %l3, %o0
	or %g4, %l1, %i2
	or %g5, %l0, %l7
	ld [%fp+1303], %i4
	add %l7, %i4, %i4
	sllx %i4, 32, %i5
	st %i2, [%fp+1331]
	ld [%fp+1307], %g4
	add %i2, %g4, %g4
	srl %g4, 0, %g5
	or %g5, %i5, %i2
	stx %i2, [%fp+1343]
	ld [%fp+1311], %i2
	add %o0, %i2, %i5
	srl %i5, 0, %g5
	ld [%fp+1315], %i2
	add %l2, %i2, %l0
	sllx %l0, 32, %l3
	or %g5, %l3, %i2
	stx %i2, [%fp+1335]
	xor %i4, %i3, %i3
	xor %i5, %o4, %i4
	xor %l0, %o7, %i5
	xor %g4, %o5, %g4
	srl %g4, 7, %g5
	srl %i5, 7, %l0
	srl %i4, 7, %l3
	srl %i3, 7, %o2
	sll %g4, 25, %g4
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	sll %i3, 25, %i3
	or %i3, %o2, %i3
	srl %i3, 0, %i3
	or %i4, %l3, %i4
	sllx %i4, 32, %i4
	or %i3, %i4, %l3
	or %i5, %l0, %i3
	srl %i3, 0, %i3
	or %g4, %g5, %i4
	sllx %i4, 32, %i4
	or %i3, %i4, %g5
	mov	0, %i3
.LBB1_7:
	add %fp, 1807, %i5
	or %i5, 2, %l1
	sth %l0, [%l1]
	or %i5, 4, %l0
	sth %o5, [%l0]
	or %i5, 6, %o5
	sth %o3, [%o5]
	or %i5, 8, %o3
	sth %i4, [%o3]
	or %i5, 10, %i4
	sth %g4, [%i4]
	or %i5, 12, %g4
	sth %o7, [%g4]
	or %i5, 14, %o7
	sth %o4, [%o7]
	sth %o2, [%fp+1807]
	and %i3, 7, %o2
	sllx %o2, 1, %o2
	or %i5, %o2, %i5
	sth %g3, [%i5]
	lduh [%o7], %o4
	lduh [%g4], %o7
	lduh [%i4], %g4
	lduh [%o3], %i4
	lduh [%o5], %o3
	lduh [%l0], %o5
	lduh [%l1], %l0
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB1_7
	lduh [%fp+1807], %o2
	ba .LBB1_8
	nop
.LBB1_8:
	sll %i4, 16, %i3
	and %g4, 32, %i4
	or %i4, %i3, %i3
	sll %o7, 16, %i4
	and %o4, 128, %i5
	or %i5, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	sll %o2, 16, %i4
	and %l0, 2, %i5
	or %i5, %i4, %i4
	sll %o5, 16, %i5
	and %o3, 8, %g4
	or %g4, %i5, %i5
	sllx %i4, 32, %i4
	srl %i5, 0, %i5
	or %i5, %i4, %i4
	ldx [%fp+1535], %i2
	and %i3, %i2, %i3
	srl %i3, 16, %i5
	cmp %i5, 64
	ldx [%fp+1543], %i2
	and %i4, %i2, %i4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srl %i4, 16, %g4
	cmp %g4, 4
	mov	%i1, %g4
	move	%icc, 1, %g4
	srlx %i3, 48, %l0
	cmp %l0, 16
	mov	%i1, %l0
	move	%icc, 1, %l0
	srlx %i4, 48, %l1
	cmp %l1, 1
	mov	%i1, %l1
	move	%icc, 1, %l1
	srlx %i4, 33, %o2
	and %o2, 1, %o2
	sub %i1, %o2, %o2
	and %o2, %i0, %o2
	sll %l1, 16, %l1
	sub %o2, %l1, %l1
	srlx %i3, 37, %o2
	and %o2, 1, %o2
	sub %i1, %o2, %o2
	and %o2, %i0, %o2
	sll %l0, 16, %l0
	sub %o2, %l0, %l0
	srl %i4, 3, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i0, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	srl %i3, 7, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i0, %i3
	sll %i5, 16, %i5
	sub %i3, %i5, %i3
	ld [%fp+1375], %i0
	and %i3, %i0, %i5
	ld [%fp+1399], %i2
	andn %i2, %i3, %i3
	ld [%fp+1455], %i0
	and %l0, %i0, %g4
	ldx [%fp+1415], %i2
	andn %i2, %l0, %l0
	ld [%fp+1487], %i2
	andn %i2, %l1, %o2
	ld [%fp+1463], %i0
	and %l1, %i0, %l1
	mov	%i0, %o5
	or %o2, %l1, %i0
	ld [%fp+1467], %i2
	andn %i2, %i4, %l1
	ld [%fp+1471], %o4
	and %i4, %o4, %i4
	or %l0, %g4, %i2
	or %l1, %i4, %g4
	or %i3, %i5, %i3
	st %i3, [%fp+1447]
	add %i3, %l6, %i4
	st %g4, [%fp+1383]
	add %g4, %o1, %i5
	st %i2, [%fp+1467]
	add %i2, %l5, %g4
	st %i0, [%fp+1455]
	add %i0, %l4, %i3
	srlx %g5, 32, %l0
	srlx %l3, 32, %l1
	add %i3, %l1, %i3
	add %g4, %l3, %l4
	add %i5, %g5, %i5
	add %i4, %l0, %i4
	xor %i4, %o0, %g4
	sll %g4, 16, %l5
	srl %g4, 16, %g4
	or %g4, %l5, %g4
	xor %i5, %l7, %l5
	sll %l5, 16, %l6
	srl %l5, 16, %l5
	or %l5, %l6, %l5
	xor %l4, %l2, %l2
	sll %l2, 16, %l6
	srl %l2, 16, %l2
	or %l2, %l6, %l2
	ld [%fp+1331], %i0
	xor %i3, %i0, %l6
	sll %l6, 16, %l7
	srl %l6, 16, %l6
	or %l6, %l7, %l6
	ldx [%fp+1335], %i0
	srlx %i0, 32, %l7
	add %g4, %l7, %l7
	xor %l7, %l0, %l0
	srl %l0, 12, %o0
	sll %l0, 20, %l0
	or %l0, %o0, %l0
	add %l5, %i0, %o0
	xor %o0, %g5, %g5
	srl %g5, 12, %o1
	sll %g5, 20, %g5
	or %g5, %o1, %g5
	ldx [%fp+1343], %i0
	add %l2, %i0, %o1
	xor %o1, %l3, %l3
	srl %l3, 12, %o2
	sll %l3, 20, %l3
	or %l3, %o2, %l3
	srlx %i0, 32, %o2
	add %l6, %o2, %o3
	xor %o3, %l1, %l1
	srl %l1, 12, %o2
	sll %l1, 20, %l1
	or %l1, %o2, %l1
	ldx [%fp+1503], %i2
	add %i4, %i2, %i4
	add %l0, %i4, %o7
	xor %o7, %g4, %i4
	srl %i4, 8, %g4
	sll %i4, 24, %i4
	or %i4, %g4, %g4
	add %i5, %o5, %i4
	add %g5, %i4, %i5
	xor %i5, %l5, %i4
	srl %i4, 8, %l5
	sll %i4, 24, %i4
	or %i4, %l5, %l5
	ld [%fp+1519], %i2
	add %l4, %i2, %i4
	add %l3, %i4, %l4
	xor %l4, %l2, %i4
	srl %i4, 8, %l2
	sll %i4, 24, %i4
	or %i4, %l2, %l2
	add %i3, %o4, %i3
	add %l1, %i3, %i2
	xor %i2, %l6, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l6
	add %g4, %l7, %i3
	xor %i3, %l0, %i4
	srl %i4, 7, %l0
	sll %i4, 25, %i4
	or %i4, %l0, %i4
	add %l5, %o0, %o0
	xor %o0, %g5, %g5
	srl %g5, 7, %l0
	sll %g5, 25, %g5
	or %g5, %l0, %o4
	add %l2, %o1, %o2
	xor %o2, %l3, %g5
	srl %g5, 7, %l0
	sll %g5, 25, %g5
	or %g5, %l0, %o5
	add %l6, %o3, %g5
	xor %g5, %l1, %l0
	srl %l0, 7, %l1
	sll %l0, 25, %l0
	or %l0, %l1, %l0
	ldx [%fp+1479], %l7
	sllx %l7, 32, %l1
	ldx [%fp+1351], %i0
	srl %i0, 0, %l3
	or %l3, %l1, %l1
	stx %l1, [%fp+1487]
	add %o7, %i0, %l1
	ldx [%fp+1359], %o1
	add %i5, %o1, %i5
	add %i4, %i5, %i0
	st %i0, [%fp+1399]
	xor %i0, %l6, %i5
	sll %i5, 16, %l3
	srl %i5, 16, %i5
	or %i5, %l3, %l3
	ldx [%fp+1367], %i0
	srlx %i0, 32, %i0
	add %i2, %i0, %i2
	add %o4, %i2, %i2
	st %i2, [%fp+1415]
	xor %i2, %l2, %i2
	sll %i2, 16, %i5
	srl %i2, 16, %i2
	or %i2, %i5, %l2
	add %o5, %l1, %i2
	st %i2, [%fp+1335]
	xor %i2, %l5, %i2
	sll %i2, 16, %i5
	srl %i2, 16, %i2
	or %i2, %i5, %l5
	add %l4, %l7, %i2
	add %l0, %i2, %i2
	st %i2, [%fp+1327]
	xor %i2, %g4, %i2
	sll %i2, 16, %i5
	srl %i2, 16, %i2
	or %i2, %i5, %l4
	ld [%fp+1447], %i2
	st %i2, [%fp+1803]
	ld [%fp+1803], %f0
	ld [%fp+1463], %i2
	st %i2, [%fp+1799]
	ldx [%fp+1495], %i5
	srl %i5, 0, %i2
	sllx %i5, 32, %i5
	or %i2, %i5, %g4
	ldx [%fp+1391], %i5
	srl %i5, 0, %i2
	sllx %i5, 32, %i5
	or %i2, %i5, %l1
	sllx %o1, 32, %i2
	stx %i0, [%fp+1391]
	or %i0, %i2, %i0
	stx %i0, [%fp+1367]
	st %l4, [%fp+1331]
	add %l4, %o0, %l4
	st %l5, [%fp+1343]
	add %l5, %g5, %i5
	st %l2, [%fp+1375]
	add %l2, %i3, %i0
	st %l3, [%fp+1463]
	add %l3, %o2, %i2
	st %i2, [%fp+1315]
	xor %i2, %i4, %i2
	st %i0, [%fp+1323]
	xor %i0, %o4, %i3
	st %i5, [%fp+1311]
	xor %i5, %o5, %i5
	st %l4, [%fp+1319]
	xor %l4, %l0, %i4
	srl %i3, 12, %l0
	sll %i3, 20, %l3
	srl %i4, 12, %i3
	sll %i4, 20, %o4
	srl %i2, 12, %i4
	sll %i2, 20, %l2
	ld [%fp+1799], %f1
	srl %i5, 12, %g5
	sll %i5, 20, %l5
	mov	0, %o3
.LBB1_9:
	add %fp, 1775, %i2
	or %i2, 2, %i5
	sth %o2, [%i5]
	or %i2, 4, %o2
	sth %l6, [%o2]
	or %i2, 6, %l6
	sth %l7, [%l6]
	or %i2, 8, %l7
	sth %o7, [%l7]
	or %i2, 10, %o7
	sth %o0, [%o7]
	or %i2, 12, %o0
	sth %l4, [%o0]
	or %i2, 14, %l4
	sth %o1, [%l4]
	sth %o5, [%fp+1775]
	and %o3, 7, %o1
	sllx %o1, 1, %o1
	or %i2, %o1, %i2
	sth %g2, [%i2]
	lduh [%l4], %o1
	lduh [%o0], %l4
	lduh [%o7], %o0
	lduh [%l7], %o7
	lduh [%l6], %l7
	lduh [%o2], %l6
	lduh [%i5], %o2
	add %o3, 1, %o3
	cmp %o3, 8
	bne %xcc, .LBB1_9
	lduh [%fp+1775], %o5
	ba .LBB1_10
	nop
.LBB1_10:
	xor %l3, %l0, %l0
	xor %o4, %i3, %i3
	xor %l2, %i4, %o4
	xor %l5, %g5, %i4
	sll %o7, 16, %i2
	and %o0, 32, %i5
	or %i5, %i2, %i2
	st %f0, [%fp+1763]
	st %f0, [%fp+1759]
	st %f1, [%fp+1771]
	st %f1, [%fp+1767]
	sllx %i2, 32, %i2
	sll %l4, 16, %i5
	and %o1, 128, %g5
	or %g5, %i5, %i5
	srl %i5, 0, %i5
	or %i5, %i2, %i2
	sll %o5, 16, %i5
	and %o2, 2, %g5
	or %g5, %i5, %i5
	sllx %i5, 32, %i5
	sll %l6, 16, %g5
	and %l7, 8, %l2
	or %l2, %g5, %g5
	srl %g5, 0, %g5
	or %g5, %i5, %i5
	ldx [%fp+1543], %g5
	and %i5, %g5, %i5
	srl %i5, 16, %g5
	srlx %i5, 48, %l2
	ldx [%fp+1535], %l3
	and %i2, %l3, %i2
	srl %i2, 16, %l3
	srlx %i2, 48, %l4
	cmp %l4, 16
	mov	%i1, %l4
	move	%icc, 1, %l4
	cmp %l3, 64
	mov	%i1, %l3
	move	%icc, 1, %l3
	cmp %l2, 1
	mov	%i1, %l2
	move	%icc, 1, %l2
	cmp %g5, 4
	mov	%i1, %g5
	move	%icc, 1, %g5
	srl %i5, 3, %l5
	and %l5, 1, %l5
	sub %i1, %l5, %l5
	ld [%fp+1527], %i0
	and %l5, %i0, %l5
	sll %g5, 16, %g5
	sub %l5, %g5, %g5
	ld [%fp+1771], %l5
	srlx %i5, 33, %i5
	and %i5, 1, %i5
	sub %i1, %i5, %i5
	and %i5, %i0, %i5
	sll %l2, 16, %l2
	sub %i5, %l2, %i5
	srl %i2, 7, %l2
	and %l2, 1, %l2
	sub %i1, %l2, %l2
	and %l2, %i0, %l2
	sll %l3, 16, %l3
	sub %l2, %l3, %l2
	ld [%fp+1767], %l3
	srlx %i2, 37, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %i0, %i2
	sll %l4, 16, %l4
	sub %i2, %l4, %i2
	and %i2, %l3, %l3
	srlx %g4, 32, %l4
	andn %l4, %i2, %i2
	ld [%fp+1759], %l4
	and %l2, %l5, %l5
	andn %g4, %l2, %g4
	ld [%fp+1763], %l2
	and %i5, %l4, %l4
	srlx %l1, 32, %l6
	andn %l6, %i5, %i5
	and %g5, %l2, %l2
	andn %l1, %g5, %g5
	or %g5, %l2, %l2
	srl %l2, 0, %g5
	or %i5, %l4, %l1
	sllx %l1, 32, %i5
	or %g5, %i5, %i5
	stx %i5, [%fp+1351]
	or %g4, %l5, %i5
	srl %i5, 0, %g4
	or %i2, %l3, %g5
	sllx %g5, 32, %i2
	or %g4, %i2, %i2
	stx %i2, [%fp+1359]
	ld [%fp+1415], %i2
	add %i5, %i2, %i2
	stx %l1, [%fp+1415]
	ld [%fp+1327], %i5
	add %l1, %i5, %i5
	stx %g5, [%fp+1495]
	ld [%fp+1399], %g4
	add %g5, %g4, %g4
	st %l2, [%fp+1399]
	ld [%fp+1335], %g5
	add %l2, %g5, %g5
	add %g5, %i4, %o5
	add %g4, %o4, %l7
	add %i5, %i3, %l6
	add %i2, %l0, %l5
	ld [%fp+1375], %i2
	xor %l5, %i2, %i2
	ld [%fp+1331], %i5
	xor %l6, %i5, %i5
	ld [%fp+1463], %g4
	xor %l7, %g4, %g4
	ld [%fp+1343], %g5
	xor %o5, %g5, %g5
	srl %g5, 8, %l1
	srl %g4, 8, %l2
	srl %i5, 8, %l4
	srl %i2, 8, %l3
	sll %g5, 24, %g5
	sll %g4, 24, %o0
	sll %i5, 24, %i5
	sll %i2, 24, %i2
	or %i2, %l3, %l3
	or %i5, %l4, %g4
	or %o0, %l2, %l2
	or %g5, %l1, %o1
	ld [%fp+1311], %i2
	add %o1, %i2, %i2
	sllx %i2, 32, %i5
	ld [%fp+1315], %g5
	add %l2, %g5, %g5
	srl %g5, 0, %l1
	or %l1, %i5, %i5
	stx %i5, [%fp+1343]
	ld [%fp+1319], %i5
	add %g4, %i5, %i5
	srl %i5, 0, %l1
	ld [%fp+1323], %l4
	add %l3, %l4, %l4
	sllx %l4, 32, %o0
	or %l1, %o0, %l1
	stx %l1, [%fp+1335]
	xor %i2, %i4, %i2
	xor %i5, %i3, %i3
	xor %l4, %l0, %i4
	xor %g5, %o4, %i5
	srl %i5, 7, %g5
	srl %i4, 7, %l0
	srl %i3, 7, %l1
	srl %i2, 7, %l4
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	sll %i3, 25, %i3
	sll %i2, 25, %i2
	or %i2, %l4, %i2
	srl %i2, 0, %i2
	or %i3, %l1, %i3
	sllx %i3, 32, %i3
	or %i2, %i3, %l4
	or %i4, %l0, %i2
	srl %i2, 0, %i2
	or %i5, %g5, %i3
	sllx %i3, 32, %i3
	or %i2, %i3, %o0
	mov	0, %i3
.LBB1_11:
	add %fp, 1743, %i2
	or %i2, 2, %i5
	sth %l1, [%i5]
	or %i2, 4, %l1
	sth %o4, [%l1]
	or %i2, 6, %o4
	sth %l0, [%o4]
	or %i2, 8, %l0
	sth %o2, [%l0]
	or %i2, 10, %o2
	sth %g5, [%o2]
	or %i2, 12, %g5
	sth %o7, [%g5]
	or %i2, 14, %o7
	sth %o3, [%o7]
	sth %i4, [%fp+1743]
	and %i3, 7, %i4
	sllx %i4, 1, %i4
	or %i2, %i4, %i2
	sth %g3, [%i2]
	lduh [%o7], %o3
	lduh [%g5], %o7
	lduh [%o2], %g5
	lduh [%l0], %o2
	lduh [%o4], %l0
	lduh [%l1], %o4
	lduh [%i5], %l1
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB1_11
	lduh [%fp+1743], %i4
	ba .LBB1_12
	nop
.LBB1_12:
	sll %o2, 16, %i2
	and %g5, 32, %i3
	or %i3, %i2, %i2
	sll %o7, 16, %i3
	and %o3, 128, %i5
	or %i5, %i3, %i3
	sllx %i2, 32, %i2
	srl %i3, 0, %i3
	or %i3, %i2, %i2
	sll %i4, 16, %i3
	and %l1, 2, %i4
	or %i4, %i3, %i3
	sll %o4, 16, %i4
	and %l0, 8, %i5
	or %i5, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	ldx [%fp+1535], %i4
	and %i2, %i4, %i2
	srl %i2, 16, %i4
	cmp %i4, 64
	ldx [%fp+1543], %i4
	and %i3, %i4, %i3
	mov	%i1, %i4
	move	%icc, 1, %i4
	srl %i3, 16, %i5
	cmp %i5, 4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srlx %i2, 48, %g5
	cmp %g5, 16
	mov	%i1, %g5
	move	%icc, 1, %g5
	srlx %i3, 48, %l0
	cmp %l0, 1
	mov	%i1, %l0
	move	%icc, 1, %l0
	srlx %i3, 33, %l1
	and %l1, 1, %l1
	sub %i1, %l1, %l1
	and %l1, %i0, %l1
	sll %l0, 16, %l0
	sub %l1, %l0, %l0
	srlx %i2, 37, %l1
	and %l1, 1, %l1
	sub %i1, %l1, %l1
	and %l1, %i0, %l1
	sll %g5, 16, %g5
	sub %l1, %g5, %g5
	srl %i3, 3, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i0, %i3
	sll %i5, 16, %i5
	sub %i3, %i5, %i3
	srl %i2, 7, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %i0, %i2
	sll %i4, 16, %i4
	sub %i2, %i4, %i2
	ld [%fp+1383], %i0
	and %i2, %i0, %i4
	ld [%fp+1407], %i5
	andn %i5, %i2, %i2
	ld [%fp+1447], %i0
	and %g5, %i0, %i5
	ldx [%fp+1423], %l1
	andn %l1, %g5, %g5
	ld [%fp+1471], %l1
	andn %l1, %l0, %l1
	ld [%fp+1455], %i0
	and %l0, %i0, %l0
	mov	%i0, %o7
	or %l1, %l0, %l1
	ld [%fp+1519], %l0
	andn %l0, %i3, %l0
	ld [%fp+1467], %o4
	and %i3, %o4, %i3
	or %g5, %i5, %g5
	or %l0, %i3, %i3
	or %i2, %i4, %i0
	add %i0, %o5, %i2
	st %i3, [%fp+1375]
	add %i3, %l7, %i5
	st %g5, [%fp+1463]
	add %g5, %l6, %i4
	st %l1, [%fp+1447]
	add %l1, %l5, %i3
	srlx %o0, 32, %g5
	srlx %l4, 32, %l0
	add %i3, %l0, %i3
	add %i4, %l4, %i4
	add %i5, %o0, %i5
	add %i2, %g5, %i2
	xor %i2, %g4, %g4
	sll %g4, 16, %l1
	srl %g4, 16, %g4
	or %g4, %l1, %g4
	xor %i5, %o1, %l1
	sll %l1, 16, %l5
	srl %l1, 16, %l1
	or %l1, %l5, %l1
	xor %i4, %l3, %l3
	sll %l3, 16, %l5
	srl %l3, 16, %l3
	or %l3, %l5, %l3
	xor %i3, %l2, %l2
	sll %l2, 16, %l5
	srl %l2, 16, %l2
	or %l2, %l5, %l2
	ldx [%fp+1335], %l7
	srlx %l7, 32, %l5
	add %g4, %l5, %l5
	xor %l5, %g5, %g5
	srl %g5, 12, %l6
	sll %g5, 20, %g5
	or %g5, %l6, %g5
	add %l1, %l7, %l6
	xor %l6, %o0, %l7
	srl %l7, 12, %o0
	sll %l7, 20, %l7
	or %l7, %o0, %o1
	ldx [%fp+1343], %o0
	add %l3, %o0, %o2
	xor %o2, %l4, %l4
	srl %l4, 12, %l7
	sll %l4, 20, %l4
	or %l4, %l7, %l4
	srlx %o0, 32, %l7
	add %l2, %l7, %o3
	xor %o3, %l0, %l0
	srl %l0, 12, %l7
	sll %l0, 20, %l0
	or %l0, %l7, %l0
	ldx [%fp+1511], %l7
	add %i2, %l7, %i2
	add %g5, %i2, %i2
	xor %i2, %g4, %g4
	srl %g4, 8, %l7
	sll %g4, 24, %g4
	or %g4, %l7, %g4
	add %i5, %o7, %i5
	add %o1, %i5, %i5
	xor %i5, %l1, %l1
	srl %l1, 8, %l7
	sll %l1, 24, %l1
	or %l1, %l7, %l1
	ldx [%fp+1503], %l7
	add %i4, %l7, %i4
	add %l4, %i4, %i4
	xor %i4, %l3, %l3
	srl %l3, 8, %l7
	sll %l3, 24, %l3
	or %l3, %l7, %l3
	add %i3, %o4, %i3
	add %l0, %i3, %o7
	xor %o7, %l2, %i3
	srl %i3, 8, %l2
	sll %i3, 24, %i3
	or %i3, %l2, %l2
	add %g4, %l5, %i3
	xor %i3, %g5, %g5
	srl %g5, 7, %l5
	sll %g5, 25, %g5
	or %g5, %l5, %l7
	add %l1, %l6, %o0
	xor %o0, %o1, %g5
	srl %g5, 7, %l5
	sll %g5, 25, %g5
	or %g5, %l5, %o4
	add %l3, %o2, %o1
	xor %o1, %l4, %g5
	srl %g5, 7, %l4
	sll %g5, 25, %g5
	or %g5, %l4, %o5
	add %l2, %o3, %l4
	xor %l4, %l0, %g5
	srl %g5, 7, %l0
	sll %g5, 25, %g5
	or %g5, %l0, %l0
	ldx [%fp+1487], %l6
	sllx %l6, 32, %g5
	ldx [%fp+1351], %o2
	srl %o2, 0, %l5
	or %l5, %g5, %g5
	stx %g5, [%fp+1471]
	add %i2, %o2, %i2
	ldx [%fp+1359], %l5
	add %i5, %l5, %i5
	add %l7, %i5, %i5
	st %i5, [%fp+1423]
	xor %i5, %l2, %i5
	sll %i5, 16, %g5
	srl %i5, 16, %i5
	or %i5, %g5, %o2
	ldx [%fp+1367], %i5
	srlx %i5, 32, %l2
	add %o7, %l2, %i5
	add %o4, %i5, %i5
	st %i5, [%fp+1519]
	xor %i5, %l3, %i5
	sll %i5, 16, %g5
	srl %i5, 16, %i5
	or %i5, %g5, %l3
	add %o5, %i2, %i2
	st %i2, [%fp+1335]
	xor %i2, %l1, %i2
	sll %i2, 16, %i5
	srl %i2, 16, %i2
	or %i2, %i5, %i5
	add %i4, %l6, %i2
	add %l0, %i2, %i2
	st %i2, [%fp+1327]
	xor %i2, %g4, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %g4
	st %i0, [%fp+1383]
	st %i0, [%fp+1739]
	ld [%fp+1739], %f0
	ld [%fp+1455], %i0
	st %i0, [%fp+1735]
	ldx [%fp+1479], %i4
	srl %i4, 0, %i2
	sllx %i4, 32, %i4
	or %i2, %i4, %g5
	ldx [%fp+1391], %i0
	srl %i0, 0, %i2
	sllx %i0, 32, %i4
	or %i2, %i4, %l1
	sllx %l5, 32, %i2
	stx %l2, [%fp+1407]
	or %l2, %i2, %i0
	stx %i0, [%fp+1367]
	st %g4, [%fp+1331]
	add %g4, %o0, %g4
	st %i5, [%fp+1343]
	add %i5, %l4, %i4
	st %l3, [%fp+1391]
	add %l3, %i3, %i0
	st %o2, [%fp+1479]
	add %o2, %o1, %i2
	st %i2, [%fp+1315]
	xor %i2, %l7, %i2
	st %i0, [%fp+1323]
	xor %i0, %o4, %i3
	st %i4, [%fp+1311]
	xor %i4, %o5, %i4
	st %g4, [%fp+1319]
	xor %g4, %l0, %i5
	srl %i3, 12, %o4
	sll %i3, 20, %o7
	srl %i5, 12, %i3
	sll %i5, 20, %l2
	srl %i2, 12, %o5
	sll %i2, 20, %l4
	ld [%fp+1735], %f1
	srl %i4, 12, %g4
	sll %i4, 20, %l5
	mov	0, %o2
.LBB1_13:
	add %fp, 1711, %i2
	or %i2, 2, %i5
	sth %o1, [%i5]
	or %i2, 4, %o1
	sth %l3, [%o1]
	or %i2, 6, %l3
	sth %i4, [%l3]
	or %i2, 8, %i4
	sth %o3, [%i4]
	or %i2, 10, %o3
	sth %o0, [%o3]
	or %i2, 12, %o0
	sth %l6, [%o0]
	or %i2, 14, %l6
	sth %l0, [%l6]
	sth %l7, [%fp+1711]
	and %o2, 7, %l0
	sllx %l0, 1, %l0
	or %i2, %l0, %i2
	sth %g2, [%i2]
	lduh [%l6], %l0
	lduh [%o0], %l6
	lduh [%o3], %o0
	lduh [%i4], %o3
	lduh [%l3], %i4
	lduh [%o1], %l3
	lduh [%i5], %o1
	add %o2, 1, %o2
	cmp %o2, 8
	bne %xcc, .LBB1_13
	lduh [%fp+1711], %l7
	ba .LBB1_14
	nop
.LBB1_14:
	xor %o7, %o4, %o7
	xor %l2, %i3, %o4
	xor %l4, %o5, %o5
	xor %l5, %g4, %i3
	sll %o3, 16, %i2
	and %o0, 32, %i5
	or %i5, %i2, %i2
	st %f0, [%fp+1699]
	st %f0, [%fp+1695]
	st %f1, [%fp+1707]
	st %f1, [%fp+1703]
	sllx %i2, 32, %i2
	sll %l6, 16, %i5
	and %l0, 128, %g4
	or %g4, %i5, %i5
	srl %i5, 0, %i5
	or %i5, %i2, %i2
	sll %l7, 16, %i5
	and %o1, 2, %g4
	or %g4, %i5, %i5
	sllx %i5, 32, %i5
	sll %l3, 16, %g4
	and %i4, 8, %i4
	or %i4, %g4, %i4
	srl %i4, 0, %i4
	or %i4, %i5, %i4
	ldx [%fp+1543], %i5
	and %i4, %i5, %i4
	srl %i4, 16, %i5
	srlx %i4, 48, %g4
	ldx [%fp+1535], %l0
	and %i2, %l0, %i2
	srl %i2, 16, %l0
	srlx %i2, 48, %l2
	cmp %l2, 16
	mov	%i1, %l2
	move	%icc, 1, %l2
	cmp %l0, 64
	mov	%i1, %l0
	move	%icc, 1, %l0
	cmp %g4, 1
	mov	%i1, %g4
	move	%icc, 1, %g4
	cmp %i5, 4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srl %i4, 3, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	ld [%fp+1527], %i0
	and %l3, %i0, %l3
	sll %i5, 16, %i5
	sub %l3, %i5, %i5
	ld [%fp+1707], %l3
	srlx %i4, 33, %i4
	and %i4, 1, %i4
	sub %i1, %i4, %i4
	and %i4, %i0, %i4
	sll %g4, 16, %g4
	sub %i4, %g4, %i4
	srl %i2, 7, %g4
	and %g4, 1, %g4
	sub %i1, %g4, %g4
	and %g4, %i0, %g4
	sll %l0, 16, %l0
	sub %g4, %l0, %g4
	ld [%fp+1703], %l0
	srlx %i2, 37, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %i0, %i2
	sll %l2, 16, %l2
	sub %i2, %l2, %i2
	and %i2, %l0, %l0
	srlx %g5, 32, %l2
	andn %l2, %i2, %i2
	ld [%fp+1695], %l2
	and %g4, %l3, %l3
	andn %g5, %g4, %g4
	ld [%fp+1699], %g5
	and %i4, %l2, %l2
	srlx %l1, 32, %l4
	andn %l4, %i4, %i4
	and %i5, %g5, %g5
	andn %l1, %i5, %i5
	or %i5, %g5, %l1
	srl %l1, 0, %i5
	or %i4, %l2, %g5
	sllx %g5, 32, %i4
	or %i5, %i4, %i4
	stx %i4, [%fp+1351]
	or %g4, %l3, %i4
	srl %i4, 0, %i5
	or %i2, %l0, %g4
	sllx %g4, 32, %i2
	or %i5, %i2, %i2
	stx %i2, [%fp+1359]
	ld [%fp+1519], %i2
	add %i4, %i2, %i2
	stx %g5, [%fp+1455]
	ld [%fp+1327], %i4
	add %g5, %i4, %i4
	stx %g4, [%fp+1519]
	ld [%fp+1423], %i5
	add %g4, %i5, %i5
	st %l1, [%fp+1423]
	ld [%fp+1335], %g4
	add %l1, %g4, %g4
	add %g4, %i3, %l5
	add %i5, %o5, %l7
	add %i4, %o4, %l4
	add %i2, %o7, %l3
	ld [%fp+1391], %i2
	xor %l3, %i2, %i2
	ld [%fp+1331], %i4
	xor %l4, %i4, %i4
	ld [%fp+1479], %i5
	xor %l7, %i5, %i5
	ld [%fp+1343], %g4
	xor %l5, %g4, %g4
	srl %g4, 8, %l1
	srl %i5, 8, %l2
	srl %i4, 8, %g5
	srl %i2, 8, %l0
	sll %g4, 24, %l6
	sll %i5, 24, %i5
	sll %i4, 24, %i4
	sll %i2, 24, %i2
	or %i2, %l0, %l0
	or %i4, %g5, %g5
	or %i5, %l2, %g4
	or %l6, %l1, %l6
	ld [%fp+1311], %i2
	add %l6, %i2, %i2
	sllx %i2, 32, %i4
	ld [%fp+1315], %i5
	add %g4, %i5, %i5
	srl %i5, 0, %l1
	or %l1, %i4, %i4
	stx %i4, [%fp+1343]
	ld [%fp+1319], %i4
	add %g5, %i4, %i4
	srl %i4, 0, %l1
	ld [%fp+1323], %l2
	add %l0, %l2, %l2
	sllx %l2, 32, %o0
	or %l1, %o0, %l1
	stx %l1, [%fp+1335]
	xor %i2, %i3, %i2
	xor %i4, %o4, %i3
	xor %l2, %o7, %i4
	xor %i5, %o5, %i5
	srl %i5, 7, %l1
	srl %i4, 7, %o0
	srl %i3, 7, %l2
	srl %i2, 7, %o1
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	sll %i3, 25, %i3
	sll %i2, 25, %i2
	or %i2, %o1, %i2
	srl %i2, 0, %i2
	or %i3, %l2, %i3
	sllx %i3, 32, %i3
	or %i2, %i3, %l2
	or %i4, %o0, %i2
	srl %i2, 0, %i2
	or %i5, %l1, %i3
	sllx %i3, 32, %i3
	or %i2, %i3, %o0
	mov	0, %i3
.LBB1_15:
	add %fp, 1679, %i2
	or %i2, 2, %i5
	sth %l1, [%i5]
	or %i2, 4, %l1
	sth %o5, [%l1]
	or %i2, 6, %o5
	sth %o3, [%o5]
	or %i2, 8, %o3
	sth %i4, [%o3]
	or %i2, 10, %i4
	sth %o1, [%i4]
	or %i2, 12, %o1
	sth %o7, [%o1]
	or %i2, 14, %o7
	sth %o4, [%o7]
	sth %o2, [%fp+1679]
	and %i3, 7, %o2
	sllx %o2, 1, %o2
	or %i2, %o2, %i2
	sth %g3, [%i2]
	lduh [%o7], %o4
	lduh [%o1], %o7
	lduh [%i4], %o1
	lduh [%o3], %i4
	lduh [%o5], %o3
	lduh [%l1], %o5
	lduh [%i5], %l1
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB1_15
	lduh [%fp+1679], %o2
	ba .LBB1_16
	nop
.LBB1_16:
	sll %i4, 16, %i2
	and %o1, 32, %i3
	or %i3, %i2, %i2
	sll %o7, 16, %i3
	and %o4, 128, %i4
	or %i4, %i3, %i3
	sllx %i2, 32, %i2
	srl %i3, 0, %i3
	or %i3, %i2, %i2
	sll %o2, 16, %i3
	and %l1, 2, %i4
	or %i4, %i3, %i3
	sll %o5, 16, %i4
	and %o3, 8, %i5
	or %i5, %i4, %i4
	sllx %i3, 32, %i3
	srl %i4, 0, %i4
	or %i4, %i3, %i3
	ldx [%fp+1535], %i4
	and %i2, %i4, %i2
	srl %i2, 16, %i4
	cmp %i4, 64
	ldx [%fp+1543], %i4
	and %i3, %i4, %i3
	mov	%i1, %i4
	move	%icc, 1, %i4
	srl %i3, 16, %i5
	cmp %i5, 4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srlx %i2, 48, %l1
	cmp %l1, 16
	mov	%i1, %l1
	move	%icc, 1, %l1
	srlx %i3, 48, %o1
	cmp %o1, 1
	mov	%i1, %o1
	move	%icc, 1, %o1
	srlx %i3, 33, %o2
	and %o2, 1, %o2
	sub %i1, %o2, %o2
	and %o2, %i0, %o2
	sll %o1, 16, %o1
	sub %o2, %o1, %o1
	srlx %i2, 37, %o2
	and %o2, 1, %o2
	sub %i1, %o2, %o2
	and %o2, %i0, %o2
	sll %l1, 16, %l1
	sub %o2, %l1, %l1
	srl %i3, 3, %i3
	and %i3, 1, %i3
	sub %i1, %i3, %i3
	and %i3, %i0, %i3
	sll %i5, 16, %i5
	sub %i3, %i5, %i3
	srl %i2, 7, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %i0, %i2
	sll %i4, 16, %i4
	sub %i2, %i4, %i2
	ld [%fp+1375], %i0
	and %i2, %i0, %i4
	ld [%fp+1399], %i0
	andn %i0, %i2, %i2
	ld [%fp+1383], %i0
	and %l1, %i0, %i5
	ldx [%fp+1415], %i0
	andn %i0, %l1, %l1
	ld [%fp+1467], %i0
	andn %i0, %o1, %o2
	ld [%fp+1447], %i0
	and %o1, %i0, %o1
	mov	%i0, %o3
	or %o2, %o1, %o2
	ldx [%fp+1503], %i0
	andn %i0, %i3, %o1
	ld [%fp+1463], %o4
	and %i3, %o4, %i3
	or %l1, %i5, %i0
	or %o1, %i3, %i3
	or %i2, %i4, %i2
	st %i2, [%fp+1479]
	add %i2, %l5, %i2
	st %i3, [%fp+1391]
	add %i3, %l7, %i4
	st %i0, [%fp+1503]
	add %i0, %l4, %i5
	st %o2, [%fp+1415]
	add %o2, %l3, %i3
	srlx %o0, 32, %l1
	srlx %l2, 32, %l4
	add %i3, %l4, %i3
	add %i5, %l2, %l3
	add %i4, %o0, %i4
	add %i2, %l1, %i2
	xor %i2, %g5, %i5
	sll %i5, 16, %g5
	srl %i5, 16, %i5
	or %i5, %g5, %i5
	xor %i4, %l6, %g5
	sll %g5, 16, %l5
	srl %g5, 16, %g5
	or %g5, %l5, %g5
	xor %l3, %l0, %l0
	sll %l0, 16, %l5
	srl %l0, 16, %l0
	or %l0, %l5, %l0
	xor %i3, %g4, %g4
	sll %g4, 16, %l5
	srl %g4, 16, %g4
	or %g4, %l5, %g4
	ldx [%fp+1335], %i0
	srlx %i0, 32, %l5
	add %i5, %l5, %l5
	xor %l5, %l1, %l1
	srl %l1, 12, %l6
	sll %l1, 20, %l1
	or %l1, %l6, %l1
	add %g5, %i0, %l6
	xor %l6, %o0, %l7
	srl %l7, 12, %o0
	sll %l7, 20, %l7
	or %l7, %o0, %l7
	ldx [%fp+1343], %i0
	add %l0, %i0, %o0
	xor %o0, %l2, %l2
	srl %l2, 12, %o1
	sll %l2, 20, %l2
	or %l2, %o1, %l2
	srlx %i0, 32, %o1
	add %g4, %o1, %o1
	xor %o1, %l4, %l4
	srl %l4, 12, %o2
	sll %l4, 20, %l4
	or %l4, %o2, %l4
	ldx [%fp+1495], %i0
	add %i2, %i0, %i2
	add %l1, %i2, %i2
	xor %i2, %i5, %i5
	srl %i5, 8, %o2
	sll %i5, 24, %i5
	or %i5, %o2, %i5
	add %i4, %o3, %i4
	add %l7, %i4, %o3
	xor %o3, %g5, %i4
	srl %i4, 8, %g5
	sll %i4, 24, %i4
	or %i4, %g5, %o7
	ldx [%fp+1511], %i0
	add %l3, %i0, %i4
	add %l2, %i4, %l3
	xor %l3, %l0, %i4
	srl %i4, 8, %g5
	sll %i4, 24, %i4
	or %i4, %g5, %l0
	add %i3, %o4, %i3
	add %l4, %i3, %i0
	xor %i0, %g4, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %g4
	add %i5, %l5, %i3
	xor %i3, %l1, %i4
	srl %i4, 7, %g5
	sll %i4, 25, %i4
	or %i4, %g5, %i4
	add %o7, %l6, %g5
	xor %g5, %l7, %l1
	srl %l1, 7, %l5
	sll %l1, 25, %l1
	or %l1, %l5, %o2
	add %l0, %o0, %o4
	xor %o4, %l2, %l1
	srl %l1, 7, %l2
	sll %l1, 25, %l1
	or %l1, %l2, %o5
	add %g4, %o1, %l1
	xor %l1, %l4, %l2
	srl %l2, 7, %l4
	sll %l2, 25, %l2
	or %l2, %l4, %l2
	ldx [%fp+1471], %l6
	sllx %l6, 32, %l4
	ldx [%fp+1351], %l7
	srl %l7, 0, %l5
	or %l5, %l4, %l4
	stx %l4, [%fp+1399]
	add %i2, %l7, %i2
	ldx [%fp+1359], %o0
	add %o3, %o0, %l4
	add %i4, %l4, %l4
	st %l4, [%fp+1467]
	xor %l4, %g4, %g4
	sll %g4, 16, %l4
	srl %g4, 16, %g4
	or %g4, %l4, %o1
	ldx [%fp+1367], %g4
	srlx %g4, 32, %l4
	add %i0, %l4, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1331]
	xor %i0, %l0, %i0
	sll %i0, 16, %g4
	srl %i0, 16, %i0
	or %i0, %g4, %g4
	add %o5, %i2, %i0
	st %i0, [%fp+1335]
	xor %i0, %o7, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %l0
	add %l3, %l6, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1323]
	xor %i0, %i5, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %i5
	ld [%fp+1479], %i0
	st %i0, [%fp+1675]
	ld [%fp+1675], %f0
	ld [%fp+1447], %i0
	st %i0, [%fp+1671]
	ldx [%fp+1487], %i2
	srl %i2, 0, %i0
	sllx %i2, 32, %i2
	or %i0, %i2, %l5
	ldx [%fp+1407], %i2
	srl %i2, 0, %i0
	sllx %i2, 32, %i2
	or %i0, %i2, %l7
	sllx %o0, 32, %i0
	stx %l4, [%fp+1407]
	or %l4, %i0, %i0
	stx %i0, [%fp+1383]
	st %i5, [%fp+1327]
	add %i5, %g5, %g5
	st %l0, [%fp+1343]
	add %l0, %l1, %i5
	st %g4, [%fp+1351]
	add %g4, %i3, %i2
	st %o1, [%fp+1359]
	add %o1, %o4, %i0
	st %i0, [%fp+1311]
	xor %i0, %i4, %i0
	st %i2, [%fp+1319]
	xor %i2, %o2, %i2
	st %i5, [%fp+1307]
	xor %i5, %o5, %i5
	st %g5, [%fp+1315]
	xor %g5, %l2, %i4
	srl %i2, 12, %o2
	sll %i2, 20, %o7
	srl %i4, 12, %i3
	sll %i4, 20, %l4
	srl %i0, 12, %i4
	sll %i0, 20, %l0
	ld [%fp+1671], %f1
	srl %i5, 12, %g4
	sll %i5, 20, %l6
	mov	0, %o0
.LBB1_17:
	add %fp, 1647, %i0
	or %i0, 2, %i2
	sth %o4, [%i2]
	or %i0, 4, %i5
	sth %l3, [%i5]
	or %i0, 6, %l3
	sth %o3, [%l3]
	or %i0, 8, %o3
	sth %o1, [%o3]
	or %i0, 10, %o1
	sth %g5, [%o1]
	or %i0, 12, %g5
	sth %l2, [%g5]
	or %i0, 14, %l2
	sth %l1, [%l2]
	sth %o5, [%fp+1647]
	and %o0, 7, %l1
	sllx %l1, 1, %l1
	or %i0, %l1, %i0
	sth %g2, [%i0]
	lduh [%l2], %l1
	lduh [%g5], %l2
	lduh [%o1], %g5
	lduh [%o3], %o1
	lduh [%l3], %o3
	lduh [%i5], %l3
	lduh [%i2], %o4
	add %o0, 1, %o0
	cmp %o0, 8
	bne %xcc, .LBB1_17
	lduh [%fp+1647], %o5
	ba .LBB1_18
	nop
.LBB1_18:
	xor %o7, %o2, %o7
	xor %l4, %i3, %i3
	xor %l0, %i4, %o2
	xor %l6, %g4, %i4
	sll %o1, 16, %i0
	and %g5, 32, %i2
	or %i2, %i0, %i0
	st %f0, [%fp+1635]
	st %f0, [%fp+1631]
	st %f1, [%fp+1643]
	st %f1, [%fp+1639]
	sllx %i0, 32, %i0
	sll %l2, 16, %i2
	and %l1, 128, %i5
	or %i5, %i2, %i2
	srl %i2, 0, %i2
	or %i2, %i0, %i0
	sll %o5, 16, %i2
	and %o4, 2, %i5
	or %i5, %i2, %i2
	sllx %i2, 32, %i2
	sll %l3, 16, %i5
	and %o3, 8, %g4
	or %g4, %i5, %i5
	srl %i5, 0, %i5
	or %i5, %i2, %i2
	ldx [%fp+1543], %i5
	and %i2, %i5, %i2
	srl %i2, 16, %i5
	srlx %i2, 48, %g4
	ldx [%fp+1535], %g5
	and %i0, %g5, %i0
	srl %i0, 16, %g5
	srlx %i0, 48, %l0
	cmp %l0, 16
	mov	%i1, %l0
	move	%icc, 1, %l0
	cmp %g5, 64
	mov	%i1, %g5
	move	%icc, 1, %g5
	cmp %g4, 1
	mov	%i1, %g4
	move	%icc, 1, %g4
	cmp %i5, 4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srl %i2, 3, %l1
	and %l1, 1, %l1
	sub %i1, %l1, %l1
	ld [%fp+1527], %l2
	and %l1, %l2, %l1
	sll %i5, 16, %i5
	sub %l1, %i5, %i5
	ld [%fp+1643], %l1
	srlx %i2, 33, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %l2, %i2
	sll %g4, 16, %g4
	sub %i2, %g4, %i2
	srl %i0, 7, %g4
	and %g4, 1, %g4
	sub %i1, %g4, %g4
	and %g4, %l2, %g4
	sll %g5, 16, %g5
	sub %g4, %g5, %g4
	ld [%fp+1639], %g5
	srlx %i0, 37, %i0
	and %i0, 1, %i0
	sub %i1, %i0, %i0
	and %i0, %l2, %i0
	sll %l0, 16, %l0
	sub %i0, %l0, %i0
	and %i0, %g5, %g5
	srlx %l5, 32, %l0
	andn %l0, %i0, %i0
	ld [%fp+1631], %l0
	and %g4, %l1, %l1
	andn %l5, %g4, %g4
	ld [%fp+1635], %l2
	and %i2, %l0, %l0
	srlx %l7, 32, %l3
	andn %l3, %i2, %i2
	and %i5, %l2, %l2
	andn %l7, %i5, %i5
	or %i5, %l2, %l2
	srl %l2, 0, %i5
	or %i2, %l0, %l0
	sllx %l0, 32, %i2
	or %i5, %i2, %i2
	stx %i2, [%fp+1375]
	or %g4, %l1, %i2
	srl %i2, 0, %i5
	or %i0, %g5, %g4
	sllx %g4, 32, %i0
	or %i5, %i0, %i0
	stx %i0, [%fp+1367]
	ld [%fp+1331], %i0
	add %i2, %i0, %i0
	stx %l0, [%fp+1447]
	ld [%fp+1323], %i2
	add %l0, %i2, %i2
	stx %g4, [%fp+1487]
	ld [%fp+1467], %i5
	add %g4, %i5, %i5
	st %l2, [%fp+1467]
	ld [%fp+1335], %g4
	add %l2, %g4, %g4
	add %g4, %i4, %l5
	add %i5, %o2, %l7
	add %i2, %i3, %o3
	add %i0, %o7, %o5
	ld [%fp+1351], %i0
	xor %o5, %i0, %i0
	ld [%fp+1327], %i2
	xor %o3, %i2, %i2
	ld [%fp+1359], %i5
	xor %l7, %i5, %i5
	ld [%fp+1343], %g4
	xor %l5, %g4, %g4
	srl %g4, 8, %g5
	srl %i5, 8, %l2
	srl %i2, 8, %l1
	srl %i0, 8, %l0
	sll %g4, 24, %l3
	sll %i5, 24, %i5
	sll %i2, 24, %i2
	sll %i0, 24, %i0
	or %i0, %l0, %l0
	or %i2, %l1, %l1
	or %i5, %l2, %g4
	or %l3, %g5, %l4
	ld [%fp+1307], %i0
	add %l4, %i0, %i0
	sllx %i0, 32, %i2
	ld [%fp+1311], %i5
	add %g4, %i5, %i5
	srl %i5, 0, %g5
	or %g5, %i2, %i2
	stx %i2, [%fp+1359]
	ld [%fp+1315], %i2
	add %l1, %i2, %i2
	srl %i2, 0, %g5
	ld [%fp+1319], %l2
	add %l0, %l2, %l2
	sllx %l2, 32, %l3
	or %g5, %l3, %g5
	stx %g5, [%fp+1351]
	xor %i0, %i4, %i0
	xor %i2, %i3, %i2
	xor %l2, %o7, %i3
	xor %i5, %o2, %i4
	srl %i4, 7, %i5
	srl %i3, 7, %g5
	srl %i2, 7, %l2
	srl %i0, 7, %l3
	sll %i4, 25, %i4
	sll %i3, 25, %i3
	sll %i2, 25, %i2
	sll %i0, 25, %i0
	or %i0, %l3, %i0
	srl %i0, 0, %i0
	or %i2, %l2, %i2
	sllx %i2, 32, %i2
	or %i0, %i2, %l2
	or %i3, %g5, %i0
	srl %i0, 0, %i0
	or %i4, %i5, %i2
	sllx %i2, 32, %i2
	or %i0, %i2, %o0
	mov	0, %i3
.LBB1_19:
	add %fp, 1615, %i0
	or %i0, 2, %i2
	sth %o7, [%i2]
	or %i0, 4, %i5
	sth %l6, [%i5]
	or %i0, 6, %l6
	sth %g5, [%l6]
	or %i0, 8, %g5
	sth %o4, [%g5]
	or %i0, 10, %o4
	sth %o1, [%o4]
	or %i0, 12, %o1
	sth %o2, [%o1]
	or %i0, 14, %o2
	sth %l3, [%o2]
	sth %i4, [%fp+1615]
	and %i3, 7, %i4
	sllx %i4, 1, %i4
	or %i0, %i4, %i0
	sth %g3, [%i0]
	lduh [%o2], %l3
	lduh [%o1], %o2
	lduh [%o4], %o1
	lduh [%g5], %o4
	lduh [%l6], %g5
	lduh [%i5], %l6
	lduh [%i2], %o7
	add %i3, 1, %i3
	cmp %i3, 8
	bne %xcc, .LBB1_19
	lduh [%fp+1615], %i4
	ba .LBB1_20
	nop
.LBB1_20:
	sll %o4, 16, %i0
	and %o1, 32, %i2
	or %i2, %i0, %i0
	sll %o2, 16, %i2
	and %l3, 128, %i3
	or %i3, %i2, %i2
	sllx %i0, 32, %i0
	srl %i2, 0, %i2
	or %i2, %i0, %i0
	sll %i4, 16, %i2
	and %o7, 2, %i3
	or %i3, %i2, %i2
	sll %l6, 16, %i3
	and %g5, 8, %i4
	or %i4, %i3, %i3
	sllx %i2, 32, %i2
	srl %i3, 0, %i3
	or %i3, %i2, %i2
	ldx [%fp+1535], %i3
	and %i0, %i3, %i0
	srl %i0, 16, %i3
	cmp %i3, 64
	ldx [%fp+1543], %i3
	and %i2, %i3, %i2
	mov	%i1, %i3
	move	%icc, 1, %i3
	srl %i2, 16, %i4
	cmp %i4, 4
	mov	%i1, %i4
	move	%icc, 1, %i4
	srlx %i0, 48, %i5
	cmp %i5, 16
	mov	%i1, %i5
	move	%icc, 1, %i5
	srlx %i2, 48, %g5
	cmp %g5, 1
	mov	%i1, %g5
	move	%icc, 1, %g5
	srlx %i2, 33, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	ld [%fp+1527], %l6
	and %l3, %l6, %l3
	sll %g5, 16, %g5
	sub %l3, %g5, %g5
	srlx %i0, 37, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	and %l3, %l6, %l3
	sll %i5, 16, %i5
	sub %l3, %i5, %i5
	srl %i2, 3, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %l6, %i2
	sll %i4, 16, %i4
	sub %i2, %i4, %i2
	srl %i0, 7, %i0
	and %i0, 1, %i0
	sub %i1, %i0, %i0
	and %i0, %l6, %i0
	sll %i3, 16, %i3
	sub %i0, %i3, %i0
	ld [%fp+1391], %i3
	and %i0, %i3, %i3
	ld [%fp+1423], %i4
	andn %i4, %i0, %i0
	ld [%fp+1479], %i4
	and %i5, %i4, %i4
	ldx [%fp+1455], %l3
	andn %l3, %i5, %i5
	ld [%fp+1463], %l3
	andn %l3, %g5, %l3
	ld [%fp+1415], %o4
	and %g5, %o4, %g5
	or %l3, %g5, %g5
	or %i5, %i4, %i5
	ldx [%fp+1511], %i4
	andn %i4, %i2, %i4
	ld [%fp+1503], %o2
	and %i2, %o2, %i2
	or %i4, %i2, %i2
	or %i0, %i3, %o7
	add %o7, %l5, %i0
	st %i2, [%fp+1455]
	add %i2, %l7, %i2
	st %i5, [%fp+1479]
	add %i5, %o3, %i3
	st %g5, [%fp+1511]
	add %g5, %o5, %i4
	srlx %o0, 32, %i5
	add %i3, %l2, %i3
	add %i2, %o0, %i2
	add %i0, %i5, %i0
	xor %i0, %l1, %g5
	sll %g5, 16, %l1
	srl %g5, 16, %g5
	or %g5, %l1, %g5
	xor %i2, %l4, %l1
	sll %l1, 16, %l3
	srl %l1, 16, %l1
	or %l1, %l3, %l1
	xor %i3, %l0, %l0
	sll %l0, 16, %l3
	srl %l0, 16, %l0
	or %l0, %l3, %l0
	srlx %l2, 32, %l3
	add %i4, %l3, %i4
	xor %i4, %g4, %g4
	sll %g4, 16, %l4
	srl %g4, 16, %g4
	or %g4, %l4, %g4
	ldx [%fp+1351], %l6
	srlx %l6, 32, %l4
	add %g5, %l4, %l4
	xor %l4, %i5, %i5
	srl %i5, 12, %l5
	sll %i5, 20, %i5
	or %i5, %l5, %i5
	add %l1, %l6, %l5
	xor %l5, %o0, %l6
	srl %l6, 12, %l7
	sll %l6, 20, %l6
	or %l6, %l7, %l6
	ldx [%fp+1359], %o1
	add %l0, %o1, %l7
	xor %l7, %l2, %l2
	srl %l2, 12, %o0
	sll %l2, 20, %l2
	or %l2, %o0, %l2
	srlx %o1, 32, %o0
	add %g4, %o0, %o0
	xor %o0, %l3, %l3
	srl %l3, 12, %o1
	sll %l3, 20, %l3
	or %l3, %o1, %l3
	ldx [%fp+1519], %o1
	add %i0, %o1, %i0
	add %i5, %i0, %i0
	xor %i0, %g5, %g5
	srl %g5, 8, %o1
	sll %g5, 24, %g5
	or %g5, %o1, %g5
	add %i2, %o4, %i2
	add %l6, %i2, %i2
	xor %i2, %l1, %l1
	srl %l1, 8, %o1
	sll %l1, 24, %l1
	or %l1, %o1, %l1
	ldx [%fp+1495], %o1
	add %i3, %o1, %i3
	add %l2, %i3, %i3
	xor %i3, %l0, %l0
	srl %l0, 8, %o1
	sll %l0, 24, %l0
	or %l0, %o1, %l0
	add %i4, %o2, %i4
	add %l3, %i4, %i4
	xor %i4, %g4, %g4
	srl %g4, 8, %o1
	sll %g4, 24, %g4
	or %g4, %o1, %g4
	add %g5, %l4, %l4
	xor %l4, %i5, %i5
	srl %i5, 7, %o1
	sll %i5, 25, %i5
	or %i5, %o1, %i5
	add %l1, %l5, %l5
	xor %l5, %l6, %l6
	srl %l6, 7, %o1
	sll %l6, 25, %l6
	or %l6, %o1, %l6
	add %l0, %l7, %l7
	xor %l7, %l2, %l2
	srl %l2, 7, %o1
	sll %l2, 25, %l2
	or %l2, %o1, %l2
	add %g4, %o0, %o0
	xor %o0, %l3, %l3
	srl %l3, 7, %o1
	sll %l3, 25, %l3
	or %l3, %o1, %l3
	ldx [%fp+1367], %o1
	add %i2, %o1, %i2
	ldx [%fp+1383], %o1
	srlx %o1, 32, %o1
	add %i4, %o1, %i4
	ldx [%fp+1375], %o1
	add %i0, %o1, %i0
	ldx [%fp+1399], %o1
	add %i3, %o1, %i3
	add %l3, %i3, %o1
	add %l2, %i0, %i3
	add %l6, %i4, %o2
	add %i5, %i2, %i0
	st %i0, [%fp+1351]
	xor %i0, %g4, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %i4
	st %o2, [%fp+1343]
	xor %o2, %l0, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %l0
	st %i3, [%fp+1367]
	xor %i3, %l1, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %g4
	st %o1, [%fp+1359]
	xor %o1, %g5, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %i0
	st %i0, [%fp+1327]
	add %i0, %l5, %i3
	st %g4, [%fp+1331]
	add %g4, %o0, %g4
	st %l0, [%fp+1335]
	add %l0, %l4, %i2
	st %i4, [%fp+1391]
	add %i4, %l7, %i0
	st %i0, [%fp+1375]
	xor %i0, %i5, %i0
	st %i2, [%fp+1399]
	xor %i2, %l6, %i2
	st %g4, [%fp+1383]
	xor %g4, %l2, %i4
	st %i3, [%fp+1423]
	xor %i3, %l3, %i5
	srl %i5, 12, %g5
	srl %i2, 12, %l3
	st %o7, [%fp+1463]
	st %o7, [%fp+1611]
	ld [%fp+1611], %f0
	st %o4, [%fp+1607]
	ldx [%fp+1471], %g4
	srl %g4, 0, %i3
	sllx %g4, 32, %g4
	or %i3, %g4, %l7
	ldx [%fp+1407], %g4
	srl %g4, 0, %i3
	sllx %g4, 32, %g4
	or %i3, %g4, %o0
	srl %i0, 12, %i3
	sll %i2, 20, %o2
	sll %i5, 20, %l6
	sll %i0, 20, %o3
	ld [%fp+1607], %f1
	srl %i4, 12, %l1
	sll %i4, 20, %l4
	mov	0, %l0
.LBB1_21:
	add %fp, 1583, %i0
	or %i0, 2, %i2
	sth %l2, [%i2]
	or %i0, 4, %i5
	sth %o5, [%i5]
	or %i0, 6, %l2
	sth %i4, [%l2]
	or %i0, 8, %i4
	sth %l5, [%i4]
	or %i0, 10, %l5
	sth %o7, [%l5]
	or %i0, 12, %o5
	sth %o4, [%o5]
	or %i0, 14, %o4
	sth %g4, [%o4]
	sth %o1, [%fp+1583]
	and %l0, 7, %g4
	sllx %g4, 1, %g4
	or %i0, %g4, %i0
	sth %g2, [%i0]
	lduh [%o4], %g4
	lduh [%o5], %o4
	lduh [%l5], %o7
	lduh [%i4], %l5
	lduh [%l2], %i4
	lduh [%i5], %o5
	lduh [%i2], %l2
	add %l0, 1, %l0
	cmp %l0, 8
	bne %xcc, .LBB1_21
	lduh [%fp+1583], %o1
	ba .LBB1_22
	nop
.LBB1_22:
	xor %o2, %l3, %o2
	xor %l6, %g5, %l6
	xor %o3, %i3, %l3
	xor %l4, %l1, %g5
	sll %l5, 16, %i0
	and %o7, 32, %i2
	or %i2, %i0, %i0
	st %f0, [%fp+1571]
	st %f1, [%fp+1575]
	st %f0, [%fp+1567]
	st %f1, [%fp+1579]
	sllx %i0, 32, %i0
	sll %o4, 16, %i2
	and %g4, 128, %i3
	or %i3, %i2, %i2
	srl %i2, 0, %i2
	or %i2, %i0, %i0
	sll %o1, 16, %i2
	and %l2, 2, %i3
	or %i3, %i2, %i2
	sllx %i2, 32, %i2
	sll %o5, 16, %i3
	and %i4, 8, %i4
	or %i4, %i3, %i3
	srl %i3, 0, %i3
	or %i3, %i2, %i2
	ldx [%fp+1543], %i3
	and %i2, %i3, %i2
	srl %i2, 16, %i3
	ldx [%fp+1535], %i4
	and %i0, %i4, %i0
	srlx %i0, 48, %i4
	srlx %i2, 48, %i5
	srl %i0, 16, %g2
	cmp %g2, 64
	mov	%i1, %g2
	move	%icc, 1, %g2
	cmp %i5, 1
	mov	%i1, %i5
	move	%icc, 1, %i5
	cmp %i4, 16
	mov	%i1, %i4
	move	%icc, 1, %i4
	cmp %i3, 4
	mov	%i1, %i3
	move	%icc, 1, %i3
	srl %i2, 3, %g4
	and %g4, 1, %g4
	sub %i1, %g4, %g4
	ld [%fp+1527], %l0
	and %g4, %l0, %g4
	sll %i3, 16, %i3
	sub %g4, %i3, %i3
	srlx %i0, 37, %g4
	and %g4, 1, %g4
	sub %i1, %g4, %g4
	and %g4, %l0, %g4
	sll %i4, 16, %i4
	sub %g4, %i4, %i4
	ld [%fp+1575], %g4
	srlx %i2, 33, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %l0, %i2
	sll %i5, 16, %i5
	sub %i2, %i5, %i2
	ld [%fp+1567], %i5
	srl %i0, 7, %i0
	and %i0, 1, %i0
	sub %i1, %i0, %i0
	and %i0, %l0, %i0
	sll %g2, 16, %g2
	sub %i0, %g2, %i0
	ld [%fp+1579], %g2
	and %i2, %i5, %i5
	srlx %o0, 32, %l0
	andn %l0, %i2, %i2
	and %i0, %g2, %g2
	and %i4, %g4, %g4
	ld [%fp+1571], %l0
	andn %l7, %i0, %i0
	srlx %l7, 32, %l1
	andn %l1, %i4, %i4
	and %i3, %l0, %l0
	andn %o0, %i3, %i3
	or %i3, %l0, %i3
	or %i4, %g4, %i4
	or %i2, %i5, %i2
	or %i0, %g2, %i0
	ld [%fp+1343], %i5
	add %i0, %i5, %i0
	ld [%fp+1359], %i5
	add %i2, %i5, %i2
	ld [%fp+1351], %i5
	add %i4, %i5, %i4
	ld [%fp+1367], %i5
	add %i3, %i5, %i3
	add %i3, %g5, %l0
	add %i4, %l3, %l7
	add %i2, %l6, %l4
	add %i0, %o2, %o1
	ld [%fp+1335], %i0
	xor %o1, %i0, %i0
	ld [%fp+1327], %i2
	xor %l4, %i2, %i2
	ld [%fp+1391], %i3
	xor %l7, %i3, %i3
	ld [%fp+1331], %i4
	xor %l0, %i4, %i4
	srl %i4, 8, %i5
	srl %i3, 8, %g2
	srl %i2, 8, %g4
	srl %i0, 8, %l1
	sll %i4, 24, %i4
	sll %i3, 24, %i3
	sll %i2, 24, %i2
	sll %i0, 24, %i0
	or %i0, %l1, %l1
	or %i2, %g4, %l2
	or %i3, %g2, %l5
	or %i4, %i5, %o0
	ld [%fp+1383], %i0
	add %o0, %i0, %i0
	sllx %i0, 32, %i2
	ld [%fp+1375], %i3
	add %l5, %i3, %i4
	srl %i4, 0, %i3
	or %i3, %i2, %g4
	ld [%fp+1423], %i2
	add %l2, %i2, %i2
	srl %i2, 0, %i3
	ld [%fp+1399], %i5
	st %l1, [%fp+1471]
	add %l1, %i5, %i5
	sllx %i5, 32, %g2
	or %i3, %g2, %i3
	xor %i0, %g5, %i0
	xor %i2, %l6, %i2
	xor %i5, %o2, %i5
	xor %i4, %l3, %i4
	srl %i4, 7, %g2
	srl %i5, 7, %g5
	srl %i2, 7, %l1
	srl %i0, 7, %l3
	sll %i4, 25, %l6
	sll %i5, 25, %i5
	sll %i2, 25, %i2
	sll %i0, 25, %i0
	or %i0, %l3, %i0
	srl %i0, 0, %i0
	or %i2, %l1, %i2
	sllx %i2, 32, %i2
	or %i0, %i2, %i4
	or %i5, %g5, %i0
	srl %i0, 0, %i0
	or %l6, %g2, %i2
	sllx %i2, 32, %i2
	or %i0, %i2, %l1
	mov	0, %l3
.LBB1_23:
	add %fp, 1551, %i0
	or %i0, 2, %i2
	sth %g2, [%i2]
	or %i0, 4, %i5
	sth %o7, [%i5]
	or %i0, 6, %g2
	sth %o5, [%g2]
	or %i0, 8, %o5
	sth %o3, [%o5]
	or %i0, 10, %o3
	sth %o2, [%o3]
	or %i0, 12, %o2
	sth %l6, [%o2]
	or %i0, 14, %l6
	sth %g5, [%l6]
	sth %o4, [%fp+1551]
	and %l3, 7, %g5
	sllx %g5, 1, %g5
	or %i0, %g5, %i0
	sth %g3, [%i0]
	lduh [%l6], %g5
	lduh [%o2], %l6
	lduh [%o3], %o2
	lduh [%o5], %o3
	lduh [%g2], %o5
	lduh [%i5], %o7
	lduh [%i2], %g2
	add %l3, 1, %l3
	cmp %l3, 8
	bne %xcc, .LBB1_23
	lduh [%fp+1551], %o4
	ba .LBB1_24
	nop
.LBB1_24:
	sll %o4, 16, %i0
	and %g2, 2, %i2
	or %i2, %i0, %i0
	sll %o7, 16, %i2
	and %o5, 8, %i5
	or %i5, %i2, %i2
	sllx %i0, 32, %i0
	srl %i2, 0, %i2
	or %i2, %i0, %i0
	sll %o3, 16, %i2
	and %o2, 32, %i5
	or %i5, %i2, %i2
	sll %l6, 16, %i5
	and %g5, 128, %g2
	or %g2, %i5, %i5
	sllx %i2, 32, %i2
	srl %i5, 0, %i5
	or %i5, %i2, %i2
	ldx [%fp+1535], %i5
	and %i2, %i5, %i2
	ldx [%fp+1543], %i5
	and %i0, %i5, %i0
	srl %i0, 16, %i5
	cmp %i5, 4
	mov	%i1, %i5
	move	%icc, 1, %i5
	srlx %i0, 48, %g2
	cmp %g2, 1
	mov	%i1, %g2
	move	%icc, 1, %g2
	srl %i2, 16, %g3
	cmp %g3, 64
	mov	%i1, %g3
	move	%icc, 1, %g3
	srlx %i2, 48, %g5
	cmp %g5, 16
	mov	%i1, %g5
	move	%icc, 1, %g5
	srlx %i2, 37, %l3
	and %l3, 1, %l3
	sub %i1, %l3, %l3
	ld [%fp+1527], %l6
	and %l3, %l6, %l3
	sll %g5, 16, %g5
	sub %l3, %g5, %g5
	srl %i2, 7, %i2
	and %i2, 1, %i2
	sub %i1, %i2, %i2
	and %i2, %l6, %i2
	sll %g3, 16, %g3
	sub %i2, %g3, %i2
	srlx %i0, 33, %g3
	and %g3, 1, %g3
	sub %i1, %g3, %g3
	and %g3, %l6, %g3
	sll %g2, 16, %g2
	sub %g3, %g2, %g2
	srl %i0, 3, %i0
	and %i0, 1, %i0
	sub %i1, %i0, %i0
	and %i0, %l6, %i0
	sll %i5, 16, %i1
	sub %i0, %i1, %i0
	ld [%fp+1455], %i1
	and %i2, %i1, %i1
	ld [%fp+1467], %i5
	andn %i5, %i2, %i2
	ld [%fp+1463], %i5
	and %g5, %i5, %i5
	ldx [%fp+1447], %g3
	andn %g3, %g5, %g3
	or %g3, %i5, %i5
	or %i2, %i1, %i1
	ld [%fp+1503], %i2
	andn %i2, %g2, %i2
	ld [%fp+1511], %o2
	and %g2, %o2, %g2
	or %i2, %g2, %i2
	ldx [%fp+1495], %g2
	andn %g2, %i0, %g2
	ld [%fp+1479], %o3
	and %i0, %o3, %i0
	or %g2, %i0, %i0
	add %i0, %l7, %i0
	add %i2, %o1, %i2
	add %i1, %l0, %i1
	add %i5, %l4, %i5
	srlx %i4, 32, %g2
	srlx %l1, 32, %g3
	add %i5, %i4, %i5
	add %i1, %g3, %i1
	add %i2, %g2, %i2
	add %i0, %l1, %i0
	xor %i0, %o0, %g5
	sll %g5, 16, %l0
	srl %g5, 16, %g5
	or %g5, %l0, %g5
	xor %i2, %l5, %l0
	sll %l0, 16, %l3
	srl %l0, 16, %l0
	or %l0, %l3, %l0
	xor %i1, %l2, %l2
	sll %l2, 16, %l3
	srl %l2, 16, %l2
	or %l2, %l3, %l2
	ld [%fp+1471], %l3
	xor %i5, %l3, %l3
	sll %l3, 16, %l4
	srl %l3, 16, %l3
	or %l3, %l4, %l3
	srlx %g4, 32, %l4
	srlx %i3, 32, %l5
	add %l3, %g4, %g4
	add %l2, %l5, %l5
	add %l0, %l4, %l4
	add %g5, %i3, %l6
	xor %l6, %l1, %i3
	xor %l4, %g2, %g2
	xor %l5, %g3, %g3
	xor %g4, %i4, %i4
	srl %i3, 12, %l1
	sll %i3, 20, %i3
	or %i3, %l1, %l1
	srl %g2, 12, %i3
	sll %g2, 20, %g2
	or %g2, %i3, %l7
	srl %g3, 12, %i3
	sll %g3, 20, %g2
	or %g2, %i3, %o0
	srl %i4, 12, %i3
	sll %i4, 20, %i4
	or %i4, %i3, %o1
	add %i0, %o2, %i0
	add %i2, %o3, %i2
	ldx [%fp+1487], %i3
	add %i1, %i3, %i1
	ldx [%fp+1519], %i3
	add %i5, %i3, %i3
	add %o1, %i3, %i5
	add %o0, %i1, %o2
	add %l7, %i2, %o3
	add %l1, %i0, %i0
	xor %i0, %g5, %i1
	xor %o3, %l0, %i2
	xor %o2, %l2, %i3
	xor %i5, %l3, %g2
	srl %i1, 8, %i4
	sll %i1, 24, %i1
	or %i1, %i4, %i1
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %i2
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i4
	srl %g2, 8, %i3
	sll %g2, 24, %g2
	or %g2, %i3, %i3
	add %i3, %g4, %g2
	add %i4, %l5, %g4
	add %i2, %l4, %g3
	add %i1, %l6, %g5
	xor %g5, %l1, %l0
	xor %g3, %l7, %l1
	xor %g4, %o0, %l2
	xor %g2, %o1, %l3
	srl %l0, 7, %l4
	sll %l0, 25, %l0
	or %l0, %l4, %l0
	srl %l1, 7, %l4
	sll %l1, 25, %l1
	or %l1, %l4, %l1
	srl %l2, 7, %l4
	sll %l2, 25, %l2
	or %l2, %l4, %l2
	srl %l3, 7, %l4
	sll %l3, 25, %l3
	or %l3, %l4, %l3
	xor %g3, %o2, %l4
	srl %l4, 8, %l5
	ldx [%fp+1439], %l6
	stb %l5, [%l6+6]
	srl %l4, 16, %l5
	stb %l5, [%l6+5]
	xor %g5, %i5, %i5
	stb %l4, [%l6+7]
	srl %l4, 24, %l4
	stb %l4, [%l6+4]
	srl %i5, 8, %l4
	stb %l4, [%l6+2]
	srl %i5, 16, %l4
	stb %l4, [%l6+1]
	xor %g2, %i0, %i0
	xor %g4, %o3, %l4
	stb %i5, [%l6+3]
	srl %i5, 24, %i5
	stb %i5, [%l6]
	stb %l4, [%l6+15]
	stb %i0, [%l6+11]
	srl %l4, 8, %i5
	stb %i5, [%l6+14]
	srl %l4, 16, %i5
	stb %i5, [%l6+13]
	srl %l4, 24, %i5
	stb %i5, [%l6+12]
	srl %i0, 8, %i5
	stb %i5, [%l6+10]
	srl %i0, 16, %i5
	stb %i5, [%l6+9]
	srl %i0, 24, %i0
	stb %i0, [%l6+8]
	xor %l3, %i1, %i0
	xor %l2, %i2, %i5
	xor %l1, %i4, %l1
	xor %l0, %i3, %l0
	stb %l0, [%l6+31]
	stb %l1, [%l6+19]
	srl %l0, 8, %l2
	stb %l2, [%l6+30]
	srl %l0, 16, %l2
	stb %l2, [%l6+29]
	srl %l0, 24, %l0
	stb %l0, [%l6+28]
	srl %l1, 8, %l0
	stb %l0, [%l6+18]
	srl %l1, 16, %l0
	stb %l0, [%l6+17]
	srl %l1, 24, %l0
	stb %l0, [%l6+16]
	stb %i5, [%l6+27]
	stb %i0, [%l6+23]
	srl %i5, 8, %l0
	stb %l0, [%l6+26]
	srl %i5, 16, %l0
	stb %l0, [%l6+25]
	srl %i5, 24, %i5
	stb %i5, [%l6+24]
	srl %i0, 8, %i5
	stb %i5, [%l6+22]
	srl %i0, 16, %i5
	stb %i5, [%l6+21]
	srl %i0, 24, %i0
	stb %i0, [%l6+20]
	ldx [%fp+1431], %l5
	ldub [%l5+6], %i0
	ldub [%l5+7], %i5
	ldub [%l5+4], %l0
	ldub [%l5+5], %l1
	sll %i0, 8, %i0
	or %i0, %i5, %i0
	sll %l0, 8, %i5
	or %i5, %l1, %i5
	sll %i5, 16, %i5
	or %i5, %i0, %i0
	ldub [%l5+2], %i5
	ldub [%l5+3], %l0
	ldub [%l5], %l1
	ldub [%l5+1], %l2
	sll %i5, 8, %i5
	or %i5, %l0, %i5
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i5, %i5
	ldub [%l5+10], %l0
	ldub [%l5+11], %l1
	ldub [%l5+8], %l2
	ldub [%l5+9], %l3
	sll %l0, 8, %l0
	or %l0, %l1, %l0
	sll %l2, 8, %l1
	or %l1, %l3, %l1
	sll %l1, 16, %l1
	or %l1, %l0, %l0
	ldub [%l5+14], %l1
	ldub [%l5+15], %l2
	ldub [%l5+12], %l3
	ldub [%l5+13], %l4
	sll %l1, 8, %l1
	or %l1, %l2, %l1
	sll %l3, 8, %l2
	or %l2, %l4, %l2
	sll %l2, 16, %l2
	or %l2, %l1, %l1
	xor %l1, %g4, %g4
	xor %i5, %g5, %i5
	xor %i0, %g3, %i0
	xor %l0, %g2, %g2
	stb %g2, [%l6+43]
	stb %i0, [%l6+39]
	stb %i5, [%l6+35]
	stb %g4, [%l6+47]
	srl %g2, 8, %g3
	stb %g3, [%l6+42]
	srl %g2, 16, %g3
	stb %g3, [%l6+41]
	srl %g2, 24, %g2
	stb %g2, [%l6+40]
	srl %i0, 8, %g2
	stb %g2, [%l6+38]
	srl %i0, 16, %g2
	stb %g2, [%l6+37]
	srl %i0, 24, %i0
	stb %i0, [%l6+36]
	srl %i5, 8, %i0
	stb %i0, [%l6+34]
	srl %i5, 16, %i0
	stb %i0, [%l6+33]
	srl %i5, 24, %i0
	stb %i0, [%l6+32]
	srl %g4, 8, %i0
	stb %i0, [%l6+46]
	srl %g4, 16, %i0
	stb %i0, [%l6+45]
	srl %g4, 24, %i0
	stb %i0, [%l6+44]
	ldub [%l5+22], %i0
	ldub [%l5+23], %i5
	ldub [%l5+20], %g2
	ldub [%l5+21], %g3
	sll %i0, 8, %i0
	or %i0, %i5, %i0
	sll %g2, 8, %i5
	or %i5, %g3, %i5
	sll %i5, 16, %i5
	or %i5, %i0, %i0
	ldub [%l5+18], %i5
	ldub [%l5+19], %g2
	ldub [%l5+16], %g3
	ldub [%l5+17], %g4
	sll %i5, 8, %i5
	or %i5, %g2, %i5
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i5, %i5
	ldub [%l5+30], %g2
	ldub [%l5+31], %g3
	ldub [%l5+28], %g4
	ldub [%l5+29], %g5
	sll %g2, 8, %g2
	or %g2, %g3, %g2
	sll %g4, 8, %g3
	or %g3, %g5, %g3
	sll %g3, 16, %g3
	or %g3, %g2, %g2
	ldub [%l5+26], %g3
	ldub [%l5+27], %g4
	ldub [%l5+24], %g5
	ldub [%l5+25], %l0
	sll %g3, 8, %g3
	or %g3, %g4, %g3
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %g3, %g3
	xor %i5, %i4, %i4
	xor %i0, %i1, %i0
	xor %g3, %i2, %i1
	xor %g2, %i3, %i2
	srl %i2, 8, %i3
	stb %i3, [%l6+62]
	srl %i2, 24, %i3
	stb %i3, [%l6+60]
	stb %i2, [%l6+63]
	srl %i2, 16, %i2
	stb %i2, [%l6+61]
	srl %i1, 8, %i2
	stb %i2, [%l6+58]
	srl %i1, 24, %i2
	stb %i2, [%l6+56]
	stb %i1, [%l6+59]
	srl %i1, 16, %i1
	stb %i1, [%l6+57]
	srl %i0, 8, %i1
	stb %i1, [%l6+54]
	srl %i0, 24, %i1
	stb %i1, [%l6+52]
	stb %i0, [%l6+55]
	srl %i0, 16, %i0
	stb %i0, [%l6+53]
	srl %i4, 8, %i0
	stb %i0, [%l6+50]
	srl %i4, 24, %i0
	stb %i0, [%l6+48]
	stb %i4, [%l6+51]
	srl %i4, 16, %i0
	stb %i0, [%l6+49]
	ret
	restore
.Lfunc_end1:
	.size	_blake3_compress_xof_sse2, .Lfunc_end1-_blake3_compress_xof_sse2

	.globl	_blake3_hash_many_sse2
	.p2align	2
	.type	_blake3_hash_many_sse2,@function
_blake3_hash_many_sse2:
	.register %g2, #scratch
	.register %g3, #scratch
	save %sp, -256, %sp
	ldx [%fp+2247], %l0
	ld [%fp+2243], %l6
	ld [%fp+2235], %l2
	ld [%fp+2227], %l7
	mov	%i2, %g3
	cmp %i1, 4
	srl %i5, 0, %o4
	mov	%i2, %l5
	bcs %xcc, .LBB2_1
	stx %o4, [%fp+2007]
	ba .LBB2_2
	nop
.LBB2_2:
	srl %l6, 0, %l3
	srl %l2, 0, %l4
	srl %l7, 0, %l1
.LBB2_3:
	stx %l0, [%sp+2239]
	stx %l3, [%sp+2231]
	stx %l4, [%sp+2223]
	mov	%i0, %o0
	mov	%l5, %o1
	mov	%i3, %o2
	mov	%i4, %o3
	call blake3_hash4_sse2
	mov	%l1, %o5
	mov	%l5, %g3
	add %i4, 4, %i2
	cmp %i5, 0
	movne	%icc, %i2, %i4
	ldx [%fp+2007], %o4
	add %i0, 32, %i0
	add %i1, -4, %i1
	cmp %i1, 3
	bgu %xcc, .LBB2_3
	add %l0, 128, %l0
	ba .LBB2_1
	nop
.LBB2_1:
	cmp %i1, 0
	be %xcc, .LBB2_11
	nop
	ba .LBB2_4
	nop
.LBB2_4:
	or %l2, %l7, %i5
	add %fp, 2015, %l1
	mov	64, %l2
	mov	32, %l3
.LBB2_5:
	ld [%i3+24], %i2
	ld [%i3+28], %g2
	ldx [%i0], %l4
	sllx %i2, 32, %i2
	or %i2, %g2, %i2
	stx %i2, [%fp+2039]
	ld [%i3+16], %i2
	ld [%i3+20], %g2
	sllx %i2, 32, %i2
	or %i2, %g2, %i2
	stx %i2, [%fp+2031]
	ld [%i3+8], %i2
	ld [%i3+12], %g2
	sllx %i2, 32, %i2
	or %i2, %g2, %i2
	stx %i2, [%fp+2023]
	ld [%i3], %i2
	ld [%i3+4], %g2
	sllx %i2, 32, %i2
	or %i2, %g2, %i2
	stx %i2, [%fp+2015]
	mov	%g3, %i2
	mov	%i5, %g2
.LBB2_6:
	cmp %i2, 1
	be %xcc, .LBB2_8
	nop
	ba .LBB2_7
	nop
.LBB2_7:
	cmp %i2, 0
	be %xcc, .LBB2_10
	nop
	ba .LBB2_9
	nop
.LBB2_8:
	or %g2, %l6, %g2
.LBB2_9:
	and %g2, 255, %o4
	mov	%l1, %o0
	mov	%l4, %o1
	mov	%l2, %o2
	call _blake3_compress_in_place_sse2
	mov	%i4, %o3
	add %l4, 64, %l4
	add %i2, -1, %i2
	ba .LBB2_6
	mov	%l7, %g2
.LBB2_10:
	mov	%l0, %o0
	mov	%l1, %o1
	call memcpy
	mov	%l3, %o2
	mov	%l5, %g3
	ldx [%fp+2007], %i2
	add %i4, %i2, %i4
	add %i0, 8, %i0
	add %i1, -1, %i1
	cmp %i1, 0
	bne %xcc, .LBB2_5
	add %l0, 32, %l0
	ba .LBB2_11
	nop
.LBB2_11:
	ret
	restore
.Lfunc_end2:
	.size	_blake3_hash_many_sse2, .Lfunc_end2-_blake3_hash_many_sse2

	.p2align	2
	.type	blake3_hash4_sse2,@function
blake3_hash4_sse2:
	.register %g2, #scratch
	.register %g3, #scratch
	save %sp, -944, %sp
	mov	%i1, %l7
	stx %i0, [%fp+1303]
	ldx [%fp+2239], %i0
	stx %i0, [%fp+1239]
	ld [%fp+2235], %i0
	st %i0, [%fp+1299]
	ld [%fp+2227], %i0
	ld [%i2], %o2
	ld [%i2+4], %l3
	ld [%i2+8], %o0
	ld [%i2+12], %l1
	ld [%i2+16], %o1
	ld [%i2+20], %l6
	ld [%i2+24], %l4
	ld [%i2+28], %i2
	mov	%g0, %l0
	sub %l0, %i4, %i1
	srl %i1, 0, %g2
	sllx %i1, 32, %i1
	or %g2, %i1, %i1
	sethi 0, %g2
	or %g2, 3, %g3
	st %g2, [%fp+1291]
	or %g2, 2, %g2
	sllx %g2, 32, %g2
	or %g2, %g3, %g2
	and %i1, %g2, %i1
	srlx %i1, 32, %g3
	add %i1, %i3, %g2
	st %g2, [%fp+1287]
	srl %g2, 0, %g2
	add %g3, %i3, %g3
	stx %g3, [%fp+1279]
	sllx %g3, 32, %g3
	or %g2, %g3, %g5
	sethi 2097152, %g2
	or %g2, 0, %g3
	sllx %g3, 32, %g4
	or %g4, %g3, %g3
	or %i1, %g3, %i1
	srlx %i1, 32, %g4
	xor %g5, %g3, %g5
	srlx %g5, 32, %g3
	cmp %g4, %g3
	add %i3, %i4, %g3
	or %i4, %g2, %i4
	st %g3, [%fp+1275]
	xor %g3, %g2, %g2
	mov	%l0, %g3
	movg	%icc, 1, %g3
	cmp %i1, %g5
	mov	%l0, %i1
	movg	%icc, 1, %i1
	cmp %i4, %g2
	st %l0, [%fp+1295]
	mov	%l0, %i4
	movg	%icc, 1, %i4
	stx %i3, [%fp+1319]
	srlx %i3, 32, %i3
	add %i3, %i1, %i1
	st %i1, [%fp+1259]
	add %i3, %g3, %i1
	st %i1, [%fp+1255]
	stx %i3, [%fp+1263]
	add %i3, %i4, %i1
	st %i1, [%fp+1251]
	stx %i5, [%fp+1327]
	or %i0, %i5, %l2
	mov	0, %l5
	st %o2, [%fp+2031]
	stx %o2, [%fp+2023]
	mov	%o2, %o3
	st %o2, [%fp+2035]
	st %l3, [%fp+2015]
	stx %l3, [%fp+1999]
	stx %l3, [%fp+2039]
	st %l3, [%fp+2019]
	mov	%l6, %l3
	st %o0, [%fp+1987]
	stx %o0, [%fp+1975]
	mov	%o0, %o7
	st %o0, [%fp+1995]
	st %l1, [%fp+1967]
	mov	%l1, %g3
	mov	%l1, %o0
	st %l1, [%fp+1971]
	mov	%o1, %o4
	mov	%o1, %g2
	mov	%o1, %l1
	st %o1, [%fp+2011]
	mov	%l6, %i0
	mov	%l6, %i1
	mov	%l6, %o5
	mov	%l4, %i3
	mov	%l4, %i4
	mov	%l4, %i5
	mov	%i2, %g4
	mov	%i2, %l6
	mov	%i2, %g5
	stx %l7, [%fp+1311]
.LBB3_1:
	sllx %i2, 32, %i2
	srl %g4, 0, %g4
	or %g4, %i2, %o1
	sllx %l6, 32, %i2
	srl %g5, 0, %g4
	or %g4, %i2, %g4
	sllx %l4, 32, %i2
	srl %i3, 0, %i3
	or %i3, %i2, %l4
	sllx %i4, 32, %i2
	srl %i5, 0, %i3
	or %i3, %i2, %g5
	sllx %l3, 32, %i2
	srl %i0, 0, %i3
	or %i3, %i2, %o2
	sllx %i1, 32, %i2
	srl %o5, 0, %i3
	or %i3, %i2, %l0
	sllx %l1, 32, %i2
	srl %o4, 0, %i0
	or %i0, %i2, %o4
	sllx %g2, 32, %i0
	ld [%fp+2011], %i1
	srl %i1, 0, %i1
	or %i1, %i0, %g2
	sllx %o0, 32, %i0
	ld [%fp+1967], %i1
	srl %i1, 0, %i1
	or %i1, %i0, %l1
	sllx %g3, 32, %i0
	ld [%fp+1971], %i1
	srl %i1, 0, %i1
	or %i1, %i0, %o5
	sllx %o7, 32, %i0
	ld [%fp+1987], %i1
	srl %i1, 0, %i1
	or %i1, %i0, %i3
	ldx [%fp+1975], %i0
	sllx %i0, 32, %i0
	ld [%fp+1995], %i1
	srl %i1, 0, %i1
	or %i1, %i0, %o7
	ldx [%fp+2039], %i0
	sllx %i0, 32, %i0
	ld [%fp+2015], %i1
	srl %i1, 0, %i1
	or %i1, %i0, %i0
	ldx [%fp+1999], %i1
	sllx %i1, 32, %i1
	ld [%fp+2019], %i2
	srl %i2, 0, %i2
	or %i2, %i1, %i5
	sllx %o3, 32, %i1
	ld [%fp+2031], %i2
	srl %i2, 0, %i2
	or %i2, %i1, %i4
	ldx [%fp+2023], %i1
	sllx %i1, 32, %i1
	ld [%fp+2035], %i2
	srl %i2, 0, %i2
	or %i2, %i1, %g3
	cmp %l5, %l7
	srlx %i0, 32, %i1
	stx %i1, [%fp+1647]
	srlx %i5, 32, %i1
	stx %i1, [%fp+1783]
	srlx %l1, 32, %i1
	stx %i1, [%fp+1663]
	srlx %o5, 32, %i1
	stx %i1, [%fp+1703]
	srlx %o2, 32, %i1
	stx %i1, [%fp+1759]
	srlx %l0, 32, %o0
	srlx %o1, 32, %i1
	stx %i1, [%fp+1687]
	srlx %g4, 32, %l3
	srlx %i3, 32, %i1
	stx %i1, [%fp+1655]
	srlx %i4, 32, %i1
	stx %i1, [%fp+1695]
	srlx %l4, 32, %i1
	stx %i1, [%fp+1679]
	srlx %o4, 32, %i1
	stx %i1, [%fp+1751]
	srlx %o7, 32, %i1
	stx %i1, [%fp+1671]
	srlx %g3, 32, %i1
	stx %i1, [%fp+1711]
	srlx %g5, 32, %l6
	bne %xcc, .LBB3_3
	srlx %g2, 32, %o3
	ba .LBB3_2
	nop
.LBB3_3:
	stx %l1, [%fp+1551]
	stx %o7, [%fp+1559]
	stx %o5, [%fp+1567]
	stx %o4, [%fp+1719]
	stx %o3, [%fp+1575]
	stx %o0, [%fp+1727]
	stx %o2, [%fp+1583]
	stx %l6, [%fp+1735]
	stx %l4, [%fp+1591]
	stx %l3, [%fp+1599]
	stx %o1, [%fp+1607]
	stx %g2, [%fp+1615]
	stx %l0, [%fp+1743]
	stx %g5, [%fp+1623]
	stx %g4, [%fp+1631]
	add %l5, 1, %i1
	stx %i1, [%fp+1639]
	cmp %i1, %l7
	ld [%fp+1295], %i1
	ldx [%fp+1303], %l3
	ldx [%l3], %l6
	ld [%fp+1299], %i2
	move	%xcc, %i2, %i1
	or %i1, %l2, %o0
	sllx %l5, 6, %g2
	add %l6, %g2, %i1
	ldub [%i1+2], %i2
	ldub [%i1+3], %g4
	ldub [%l6+%g2], %g5
	ldub [%i1+1], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %i2, %i2
	st %i2, [%fp+2019]
	ldub [%i1+6], %i2
	ldub [%i1+7], %g4
	ldub [%i1+4], %g5
	ldub [%i1+5], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %i2, %i2
	st %i2, [%fp+1951]
	ldub [%i1+14], %i2
	ldub [%i1+15], %g4
	ldub [%i1+12], %g5
	ldub [%i1+13], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	ldub [%i1+10], %g5
	or %g4, %i2, %i2
	st %i2, [%fp+2023]
	ldub [%i1+11], %i2
	ldub [%i1+8], %g4
	sll %g5, 8, %g5
	ldub [%i1+9], %i1
	or %g5, %i2, %i2
	sll %g4, 8, %g4
	ldx [%l3+8], %o5
	or %g4, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+2039]
	add %o5, %g2, %i1
	ldub [%i1+2], %i2
	ldub [%i1+3], %g4
	ldub [%o5+%g2], %g5
	ldub [%i1+1], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %i2, %i2
	st %i2, [%fp+1999]
	ldub [%i1+6], %i2
	ldub [%i1+7], %g4
	ldub [%i1+4], %g5
	ldub [%i1+5], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %i2, %i2
	st %i2, [%fp+1935]
	ldub [%i1+14], %i2
	ldub [%i1+15], %g4
	ldub [%i1+12], %g5
	ldub [%i1+13], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	ldub [%i1+10], %g5
	or %g4, %i2, %i2
	st %i2, [%fp+2035]
	ldub [%i1+11], %i2
	ldub [%i1+8], %g4
	sll %g5, 8, %g5
	ldub [%i1+9], %i1
	or %g5, %i2, %g5
	sll %g4, 8, %g4
	ldx [%l3+16], %i2
	or %g4, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %i1
	st %i1, [%fp+1971]
	add %i2, %g2, %i1
	ldub [%i1+2], %g4
	ldub [%i1+3], %g5
	ldub [%i2+%g2], %l0
	ldub [%i1+1], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1987]
	ldub [%i1+6], %g4
	ldub [%i1+7], %g5
	ldub [%i1+4], %l0
	ldub [%i1+5], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1919]
	ldub [%i1+14], %g4
	ldub [%i1+15], %g5
	ldub [%i1+12], %l0
	ldub [%i1+13], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	ldub [%i1+10], %l0
	or %g5, %g4, %g4
	st %g4, [%fp+1939]
	ldub [%i1+11], %g4
	ldub [%i1+8], %g5
	sll %l0, 8, %l0
	ldub [%i1+9], %i1
	or %l0, %g4, %g4
	sll %g5, 8, %g5
	ldx [%l3+24], %l5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g4, %o2
	add %l5, %g2, %i1
	ldub [%i1+2], %g4
	ldub [%i1+3], %g5
	ldub [%l5+%g2], %l0
	ldub [%i1+1], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %o4
	ldub [%i1+6], %g4
	ldub [%i1+7], %g5
	ldub [%i1+4], %l0
	ldub [%i1+5], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1903]
	ldub [%i1+14], %g4
	ldub [%i1+15], %g5
	ldub [%i1+12], %l0
	ldub [%i1+13], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+2031]
	ldub [%i1+10], %g4
	ldub [%i1+11], %g5
	ldub [%i1+8], %l0
	ldub [%i1+9], %i1
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g4, %i1
	st %i1, [%fp+1927]
	or %g2, 16, %g4
	add %l6, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%l6+%g4], %l2
	ldub [%i1+1], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1823]
	ldub [%i1+6], %g5
	ldub [%i1+7], %l0
	ldub [%i1+4], %l2
	ldub [%i1+5], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1891]
	ldub [%i1+14], %g5
	ldub [%i1+15], %l0
	ldub [%i1+12], %l2
	ldub [%i1+13], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+2015]
	ldub [%i1+10], %g5
	ldub [%i1+11], %l0
	ldub [%i1+8], %l2
	ldub [%i1+9], %i1
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %i1
	st %i1, [%fp+1907]
	add %o5, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%o5+%g4], %l2
	ldub [%i1+1], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1811]
	ldub [%i1+6], %g5
	ldub [%i1+7], %l0
	ldub [%i1+4], %l2
	ldub [%i1+5], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1879]
	ldub [%i1+14], %g5
	ldub [%i1+15], %l0
	ldub [%i1+12], %l2
	ldub [%i1+13], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1995]
	ldub [%i1+10], %g5
	ldub [%i1+11], %l0
	ldub [%i1+8], %l2
	ldub [%i1+9], %i1
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %i1
	st %i1, [%fp+1899]
	add %i2, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%i2+%g4], %l2
	ldub [%i1+1], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %l4
	ldub [%i1+6], %g5
	ldub [%i1+7], %l0
	ldub [%i1+4], %l2
	ldub [%i1+5], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1867]
	ldub [%i1+14], %g5
	ldub [%i1+15], %l0
	ldub [%i1+12], %l2
	ldub [%i1+13], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1983]
	ldub [%i1+10], %g5
	ldub [%i1+11], %l0
	ldub [%i1+8], %l2
	ldub [%i1+9], %i1
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %o7
	add %l5, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%l5+%g4], %g4
	ldub [%i1+1], %l2
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %g4, 8, %g4
	or %g4, %l2, %g4
	sll %g4, 16, %g4
	or %g4, %g5, %o1
	ldub [%i1+6], %g4
	ldub [%i1+7], %g5
	ldub [%i1+4], %l0
	ldub [%i1+5], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1855]
	ldub [%i1+14], %g4
	ldub [%i1+15], %g5
	ldub [%i1+12], %l0
	ldub [%i1+13], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1967]
	ldub [%i1+10], %g4
	ldub [%i1+11], %g5
	ldub [%i1+8], %l0
	ldub [%i1+9], %i1
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g4, %l7
	or %g2, 32, %g4
	add %l6, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%l6+%g4], %l2
	ldub [%i1+1], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1847]
	ldub [%i1+6], %g5
	ldub [%i1+7], %l0
	ldub [%i1+4], %l2
	ldub [%i1+5], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1895]
	ldub [%i1+14], %g5
	ldub [%i1+15], %l0
	ldub [%i1+12], %l2
	ldub [%i1+13], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1839]
	ldub [%i1+10], %g5
	ldub [%i1+11], %l0
	ldub [%i1+8], %l2
	ldub [%i1+9], %i1
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %i1
	st %i1, [%fp+2011]
	add %o5, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%o5+%g4], %l2
	ldub [%i1+1], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1835]
	ldub [%i1+6], %g5
	ldub [%i1+7], %l0
	ldub [%i1+4], %l2
	ldub [%i1+5], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1883]
	ldub [%i1+14], %g5
	ldub [%i1+15], %l0
	ldub [%i1+12], %l2
	ldub [%i1+13], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1827]
	ldub [%i1+10], %g5
	ldub [%i1+11], %l0
	ldub [%i1+8], %l2
	ldub [%i1+9], %i1
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %i1
	st %i1, [%fp+1991]
	add %i2, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%i2+%g4], %l2
	ldub [%i1+1], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1819]
	ldub [%i1+6], %g5
	ldub [%i1+7], %l0
	ldub [%i1+4], %l2
	ldub [%i1+5], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1871]
	ldub [%i1+14], %g5
	ldub [%i1+15], %l0
	ldub [%i1+12], %l2
	ldub [%i1+13], %l3
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %l3, %l0
	sll %l0, 16, %l0
	or %l0, %g5, %g5
	st %g5, [%fp+1807]
	ldub [%i1+10], %g5
	ldub [%i1+11], %l0
	ldub [%i1+8], %l2
	ldub [%i1+9], %i1
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %l2, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g5, %i1
	st %i1, [%fp+1975]
	add %l5, %g4, %i1
	ldub [%i1+2], %g5
	ldub [%i1+3], %l0
	ldub [%l5+%g4], %g4
	ldub [%i1+1], %l2
	sll %g5, 8, %g5
	or %g5, %l0, %g5
	sll %g4, 8, %g4
	or %g4, %l2, %g4
	sll %g4, 16, %g4
	or %g4, %g5, %g4
	st %g4, [%fp+1803]
	ldub [%i1+6], %g4
	ldub [%i1+7], %g5
	ldub [%i1+4], %l0
	ldub [%i1+5], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1859]
	ldub [%i1+14], %g4
	ldub [%i1+15], %g5
	ldub [%i1+12], %l0
	ldub [%i1+13], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1795]
	ldub [%i1+10], %g4
	ldub [%i1+11], %g5
	ldub [%i1+8], %l0
	ldub [%i1+9], %i1
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g4, %i1
	st %i1, [%fp+1963]
	or %g2, 48, %g2
	add %l6, %g2, %i1
	ldub [%i1+2], %g4
	ldub [%i1+3], %g5
	ldub [%l6+%g2], %l0
	ldub [%i1+1], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1959]
	ldub [%i1+6], %g4
	ldub [%i1+7], %g5
	ldub [%i1+4], %l0
	ldub [%i1+5], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1955]
	ldub [%i1+14], %g4
	ldub [%i1+15], %g5
	ldub [%i1+12], %l0
	ldub [%i1+13], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1843]
	ldub [%i1+10], %g4
	ldub [%i1+11], %g5
	ldub [%i1+8], %l0
	ldub [%i1+9], %i1
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g4, %i1
	st %i1, [%fp+1887]
	add %o5, %g2, %i1
	ldub [%i1+2], %g4
	ldub [%i1+3], %g5
	ldub [%o5+%g2], %l0
	ldub [%i1+1], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1947]
	ldub [%i1+6], %g4
	ldub [%i1+7], %g5
	ldub [%i1+4], %l0
	ldub [%i1+5], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1943]
	ldub [%i1+14], %g4
	ldub [%i1+15], %g5
	ldub [%i1+12], %l0
	ldub [%i1+13], %l2
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %l2, %g5
	sll %g5, 16, %g5
	or %g5, %g4, %g4
	st %g4, [%fp+1831]
	ldub [%i1+10], %g4
	ldub [%i1+11], %g5
	ldub [%i1+8], %l0
	ldub [%i1+9], %i1
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %l0, 8, %g5
	or %g5, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %g4, %i1
	st %i1, [%fp+1875]
	add %i2, %g2, %i1
	ldub [%i1+2], %g4
	ldub [%i1+3], %g5
	ldub [%i2+%g2], %i2
	ldub [%i1+1], %l0
	sll %g4, 8, %g4
	or %g4, %g5, %g4
	sll %i2, 8, %i2
	or %i2, %l0, %i2
	sll %i2, 16, %i2
	or %i2, %g4, %i2
	st %i2, [%fp+1931]
	ldub [%i1+6], %i2
	ldub [%i1+7], %g4
	ldub [%i1+4], %g5
	ldub [%i1+5], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %i2, %i2
	st %i2, [%fp+1923]
	ldub [%i1+14], %i2
	ldub [%i1+15], %g4
	ldub [%i1+12], %g5
	ldub [%i1+13], %l0
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %l0, %g4
	sll %g4, 16, %g4
	or %g4, %i2, %i2
	st %i2, [%fp+1815]
	ldub [%i1+10], %i2
	ldub [%i1+11], %g4
	ldub [%i1+8], %g5
	ldub [%i1+9], %i1
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g5, 8, %g4
	or %g4, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1863]
	add %l5, %g2, %i1
	ldub [%i1+2], %i2
	ldub [%i1+3], %g4
	ldub [%l5+%g2], %g2
	ldub [%i1+1], %g5
	sll %i2, 8, %i2
	or %i2, %g4, %i2
	sll %g2, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i2, %i2
	st %i2, [%fp+1915]
	ldub [%i1+6], %i2
	ldub [%i1+7], %g2
	ldub [%i1+4], %g4
	ldub [%i1+5], %g5
	sll %i2, 8, %i2
	or %i2, %g2, %i2
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i2, %i2
	st %i2, [%fp+1911]
	ldub [%i1+14], %i2
	ldub [%i1+15], %g2
	ldub [%i1+12], %g4
	ldub [%i1+13], %g5
	sll %i2, 8, %i2
	or %i2, %g2, %i2
	sll %g4, 8, %g2
	or %g2, %g5, %g2
	sll %g2, 16, %g2
	or %g2, %i2, %i2
	st %i2, [%fp+1799]
	ldub [%i1+10], %i2
	ldub [%i1+11], %g2
	ldub [%i1+8], %g4
	ldub [%i1+9], %i1
	sll %i2, 8, %i2
	or %i2, %g2, %i2
	sll %g4, 8, %g2
	or %g2, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1851]
	and %o0, 255, %i1
	mov	0, %i2
.LBB3_4:
	add %i2, 8, %i2
	cmp %i2, 32
	bne %xcc, .LBB3_4
	nop
	ba .LBB3_5
	nop
.LBB3_5:
	st %o4, [%fp+1779]
	add %o4, %g3, %i2
	ldx [%fp+1615], %o5
	add %i2, %o5, %g2
	st %g2, [%fp+1479]
	ld [%fp+1287], %i2
	xor %g2, %i2, %i2
	sll %i2, 16, %g3
	srl %i2, 16, %i2
	or %i2, %g3, %g2
	ld [%fp+1999], %i2
	add %i2, %i4, %i2
	ldx [%fp+1719], %i4
	add %i2, %i4, %i4
	st %i4, [%fp+1547]
	ld [%fp+1275], %i2
	xor %i4, %i2, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i2
	st %i2, [%fp+1475]
	ld [%fp+1987], %i2
	ldx [%fp+1711], %i4
	add %i2, %i4, %i2
	ldx [%fp+1575], %o3
	add %i2, %o3, %i4
	st %i4, [%fp+1543]
	ldx [%fp+1279], %i2
	xor %i4, %i2, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i2
	st %i2, [%fp+1427]
	ld [%fp+2019], %i2
	ldx [%fp+1695], %i4
	add %i2, %i4, %i2
	ldx [%fp+1751], %i4
	add %i2, %i4, %i4
	st %i4, [%fp+1535]
	ldx [%fp+1319], %i2
	xor %i4, %i2, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i2
	st %i2, [%fp+1407]
	ldx [%fp+1783], %i2
	add %o2, %i2, %i2
	ldx [%fp+1727], %i4
	add %i2, %i4, %i4
	st %i4, [%fp+1527]
	ld [%fp+1255], %i2
	xor %i4, %i2, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i2
	st %i2, [%fp+1695]
	st %o2, [%fp+1783]
	ld [%fp+2039], %i2
	ldx [%fp+1647], %i4
	add %i2, %i4, %i2
	ldx [%fp+1759], %i4
	add %i2, %i4, %i4
	st %i4, [%fp+1647]
	ldx [%fp+1263], %i2
	xor %i4, %i2, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i2
	st %i2, [%fp+1419]
	ld [%fp+1927], %i2
	add %i2, %i5, %i2
	ldx [%fp+1743], %i4
	add %i2, %i4, %i4
	st %i4, [%fp+1539]
	ld [%fp+1259], %i2
	xor %i4, %i2, %i2
	sll %i2, 16, %i4
	srl %i2, 16, %i2
	or %i2, %i4, %i2
	st %i2, [%fp+1711]
	ld [%fp+1971], %i2
	add %i2, %i0, %i0
	ldx [%fp+1583], %o0
	add %i0, %o0, %i2
	st %i2, [%fp+1531]
	ld [%fp+1251], %i0
	xor %i2, %i0, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %l1
	st %l1, [%fp+1431]
	ld [%fp+1291], %i0
	or %i0, 64, %i0
	sllx %i0, 32, %i2
	or %i2, %i0, %i0
	st %l4, [%fp+1775]
	ldx [%fp+1671], %i2
	add %l4, %i2, %i2
	st %o1, [%fp+1791]
	ldx [%fp+1559], %i4
	add %o1, %i4, %i4
	ldx [%fp+1623], %l6
	add %i4, %l6, %i5
	st %i5, [%fp+1559]
	ldx [%fp+1735], %i4
	add %i2, %i4, %i4
	stx %i4, [%fp+1671]
	srl %i5, 0, %i2
	sllx %i4, 32, %i4
	or %i2, %i4, %i2
	xor %i2, %i0, %i2
	sll %i2, 16, %i5
	srl %i2, 16, %g3
	or %g3, %i5, %l0
	st %l0, [%fp+1435]
	ld [%fp+1823], %i5
	ldx [%fp+1655], %g3
	add %i5, %g3, %i5
	ld [%fp+1811], %g3
	add %g3, %i3, %i3
	ldx [%fp+1591], %o2
	add %i3, %o2, %i3
	st %i3, [%fp+1519]
	ldx [%fp+1679], %l2
	add %i5, %l2, %i5
	stx %i5, [%fp+1655]
	srl %i3, 0, %i3
	sllx %i5, 32, %i5
	or %i3, %i5, %i3
	xor %i3, %i0, %i0
	sll %i0, 16, %i3
	srl %i0, 16, %g3
	or %g3, %i3, %l5
	srlx %i2, 32, %i2
	sll %i2, 16, %i2
	srlx %i4, 48, %i3
	or %i3, %i2, %g5
	st %g5, [%fp+1471]
	srlx %i0, 32, %i0
	sll %i0, 16, %i0
	srlx %i5, 48, %i2
	or %i2, %i0, %o4
	st %o4, [%fp+1443]
	st %o7, [%fp+1771]
	ldx [%fp+1703], %i0
	add %o7, %i0, %i0
	ldx [%fp+1599], %l3
	add %i0, %l3, %i0
	st %i0, [%fp+1523]
	xor %i0, %i1, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %i3
	st %i3, [%fp+1451]
	ld [%fp+1907], %i0
	ldx [%fp+1663], %i2
	add %i0, %i2, %i0
	ldx [%fp+1687], %l4
	add %i0, %l4, %i0
	st %i0, [%fp+1663]
	xor %i0, %i1, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %g4
	st %g4, [%fp+1447]
	st %l7, [%fp+1767]
	ldx [%fp+1567], %i0
	add %l7, %i0, %i0
	ldx [%fp+1631], %g3
	add %i0, %g3, %i0
	st %i0, [%fp+1567]
	xor %i0, %i1, %i0
	sll %i0, 16, %i2
	srl %i0, 16, %i0
	or %i0, %i2, %o1
	st %o1, [%fp+1455]
	ld [%fp+1899], %i0
	ldx [%fp+1551], %i2
	add %i0, %i2, %i0
	ldx [%fp+1607], %i5
	add %i0, %i5, %i0
	st %i0, [%fp+1551]
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1703]
	sethi 1737337, %i0
	or %i0, 615, %i0
	add %g2, %i0, %i1
	mov	%g2, %o7
	st %i1, [%fp+1515]
	xor %i1, %o5, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i4
	st %i4, [%fp+1459]
	ld [%fp+1475], %g2
	add %g2, %i0, %i1
	st %i1, [%fp+1511]
	ldx [%fp+1719], %i2
	xor %i1, %i2, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1383]
	ld [%fp+1427], %l7
	add %l7, %i0, %i1
	st %i1, [%fp+1615]
	xor %i1, %o3, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1391]
	ld [%fp+1407], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1719]
	ldx [%fp+1751], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1395]
	sethi 3070443, %i0
	or %i0, 645, %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+1503]
	ldx [%fp+1727], %i2
	xor %i1, %i2, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1387]
	ld [%fp+1419], %o5
	add %o5, %i0, %i1
	st %i1, [%fp+1507]
	ldx [%fp+1759], %i2
	xor %i1, %i2, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1399]
	ld [%fp+1711], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+1575]
	ldx [%fp+1743], %i2
	xor %i1, %i2, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1403]
	add %l1, %i0, %i0
	st %i0, [%fp+1499]
	xor %i0, %o0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1415]
	sethi 990140, %i0
	or %i0, 882, %i0
	add %l0, %i0, %i1
	st %i1, [%fp+1495]
	xor %i1, %l6, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l1
	add %l5, %i0, %i1
	st %i1, [%fp+1583]
	mov	%l5, %l0
	xor %i1, %o2, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l5
	add %g5, %i0, %i1
	st %i1, [%fp+1491]
	ldx [%fp+1735], %i2
	xor %i1, %i2, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1411]
	add %o4, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %l2, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g5
	sethi 2708477, %i0
	or %i0, 314, %i0
	add %i3, %i0, %i1
	st %i1, [%fp+1483]
	xor %i1, %l3, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o4
	add %g4, %i0, %i1
	st %i1, [%fp+1487]
	xor %i1, %l4, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i3
	st %i3, [%fp+1371]
	add %o1, %i0, %i1
	st %i1, [%fp+1599]
	xor %i1, %g3, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1423]
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1903], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o7, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1463]
	ld [%fp+1935], %i0
	ld [%fp+1547], %i1
	add %i1, %i0, %i0
	ld [%fp+1383], %o7
	add %o7, %i0, %i0
	st %i0, [%fp+1479]
	xor %i0, %g2, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1751]
	ld [%fp+1919], %i0
	ld [%fp+1543], %i1
	add %i1, %i0, %i0
	ld [%fp+1391], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1467]
	xor %i0, %l7, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+1951], %i0
	ld [%fp+1535], %i1
	add %i1, %i0, %i0
	ld [%fp+1395], %o0
	add %o0, %i0, %i0
	st %i0, [%fp+1475]
	xor %i0, %o3, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l7
	ld [%fp+1939], %i0
	ld [%fp+1527], %i1
	add %i1, %i0, %i0
	ld [%fp+1387], %g4
	add %g4, %i0, %i1
	st %i1, [%fp+1547]
	ld [%fp+1695], %i0
	xor %i1, %i0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1735]
	ld [%fp+2023], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	ld [%fp+1399], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %o5, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1419]
	ld [%fp+2031], %i0
	ld [%fp+1539], %i1
	add %i1, %i0, %i0
	ld [%fp+1403], %l3
	add %l3, %i0, %i1
	st %i1, [%fp+1647]
	ld [%fp+1711], %i0
	xor %i1, %i0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1375]
	ld [%fp+2035], %i0
	ld [%fp+1531], %i1
	add %i1, %i0, %i0
	ld [%fp+1415], %o2
	add %o2, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l2
	ld [%fp+1855], %i0
	ld [%fp+1559], %i1
	add %i1, %i0, %i0
	mov	%l1, %g3
	add %l1, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o1
	ld [%fp+1879], %i0
	ld [%fp+1519], %i1
	add %i1, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1539]
	xor %i0, %l0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1435]
	ld [%fp+1867], %i0
	ldx [%fp+1671], %i1
	add %i1, %i0, %i0
	ld [%fp+1411], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1471], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l1
	ld [%fp+1891], %i0
	ldx [%fp+1655], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1471]
	ld [%fp+1443], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1743]
	ld [%fp+1983], %i0
	ld [%fp+1523], %i1
	add %i1, %i0, %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1695]
	ld [%fp+2015], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i1
	add %i3, %i1, %i0
	st %i0, [%fp+1543]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1663]
	ld [%fp+1967], %i0
	ld [%fp+1567], %i1
	add %i1, %i0, %i2
	ld [%fp+1423], %o5
	add %o5, %i2, %i0
	st %i0, [%fp+1531]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1655]
	ld [%fp+1995], %i0
	ld [%fp+1551], %i1
	add %i1, %i0, %i3
	ld [%fp+1439], %i1
	add %i1, %i3, %i2
	st %i2, [%fp+1551]
	ld [%fp+1703], %i0
	xor %i2, %i0, %i3
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %i0
	st %i0, [%fp+1367]
	ld [%fp+1515], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1727]
	ld [%fp+1459], %i2
	xor %i0, %i2, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+1443]
	ld [%fp+1511], %i0
	ld [%fp+1751], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %o7, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+1447]
	ld [%fp+1615], %i0
	ld [%fp+1759], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1567]
	xor %i0, %i5, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+1451]
	ld [%fp+1719], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %o0, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+1455]
	ld [%fp+1503], %i0
	ld [%fp+1735], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %g4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i5
	st %i5, [%fp+1431]
	ld [%fp+1507], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %o3, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %l6
	st %l6, [%fp+1407]
	ld [%fp+1575], %i0
	ld [%fp+1375], %o7
	add %o7, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %l3, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %l3
	st %l3, [%fp+1427]
	ld [%fp+1499], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %o2, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %o2
	st %o2, [%fp+1403]
	ld [%fp+1495], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %g3, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %g2
	st %g2, [%fp+1415]
	ld [%fp+1583], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %l5, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %l4
	st %l4, [%fp+1395]
	ld [%fp+1491], %i0
	add %l1, %i0, %o0
	xor %o0, %l0, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %l0
	st %l0, [%fp+1391]
	ld [%fp+1591], %i0
	ld [%fp+1743], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1459]
	xor %i0, %g5, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %g5
	st %g5, [%fp+1379]
	ld [%fp+1483], %i0
	ld [%fp+1695], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %o4, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %o4
	ld [%fp+1487], %i0
	ld [%fp+1663], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1495]
	ld [%fp+1371], %i4
	xor %i0, %i4, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %o3
	st %o3, [%fp+1383]
	ld [%fp+1599], %i0
	ld [%fp+1655], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1491]
	xor %i0, %o5, %g4
	srl %g4, 7, %i0
	sll %g4, 25, %g4
	or %g4, %i0, %g3
	st %g3, [%fp+1371]
	ld [%fp+1679], %i0
	ld [%fp+1367], %l5
	add %l5, %i0, %i0
	st %i0, [%fp+1523]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1363]
	ld [%fp+1819], %i0
	ld [%fp+1467], %i1
	add %i1, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1499]
	xor %i0, %i3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+1483]
	ld [%fp+1847], %i0
	ld [%fp+1475], %i1
	add %i1, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %i2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1475]
	ld [%fp+1803], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %i4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1467]
	ld [%fp+1835], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %l5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o2
	ld [%fp+1963], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1463], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1359]
	ld [%fp+1991], %i0
	ld [%fp+1535], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1479]
	ld [%fp+1975], %i0
	ld [%fp+1547], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1647]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+1367]
	ld [%fp+2011], %i0
	ld [%fp+1527], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %l7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1487]
	ld [%fp+1931], %i0
	ld [%fp+1519], %i1
	add %i1, %i0, %i0
	add %o4, %i0, %i0
	mov	%o4, %l7
	st %i0, [%fp+1575]
	ld [%fp+1735], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1387]
	ld [%fp+1959], %i0
	ld [%fp+1471], %i1
	add %i1, %i0, %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1399]
	ld [%fp+1915], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	add %g3, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %o7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	ld [%fp+1947], %i0
	ld [%fp+1539], %i1
	add %i1, %i0, %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %l2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1411]
	ld [%fp+1851], %i0
	ld [%fp+1531], %i1
	add %i1, %i0, %i0
	ld [%fp+1443], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %o1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+1419]
	ld [%fp+1875], %i0
	ld [%fp+1551], %i1
	add %i1, %i0, %i0
	ld [%fp+1447], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1759]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1423]
	ld [%fp+1863], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	ld [%fp+1451], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1671]
	xor %i0, %l1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o7
	st %o7, [%fp+1435]
	ld [%fp+1887], %i0
	ld [%fp+1543], %i1
	add %i1, %i0, %i0
	ld [%fp+1455], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1743], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+1439]
	add %g4, %o0, %i0
	st %i0, [%fp+1503]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i1
	ld [%fp+1459], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1407], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %g3
	ld [%fp+1515], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1427], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %g4
	st %g4, [%fp+1375]
	ld [%fp+1507], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1743]
	ld [%fp+1403], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l6
	st %l6, [%fp+1459]
	ld [%fp+1491], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1415], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o0
	ld [%fp+1523], %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1395], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l5
	st %l5, [%fp+1431]
	ld [%fp+1511], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1391], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i0
	st %i0, [%fp+1395]
	ld [%fp+1495], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1379], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l3
	st %l3, [%fp+1391]
	ld [%fp+1567], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1519]
	xor %i0, %l7, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l7
	ld [%fp+1623], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1383], %i2
	xor %i0, %i2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l4
	st %l4, [%fp+1383]
	ld [%fp+1727], %i2
	add %o3, %i2, %i0
	st %i0, [%fp+1527]
	mov	%o3, %o4
	ld [%fp+1371], %i2
	xor %i0, %i2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1407]
	ld [%fp+1703], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1623]
	ld [%fp+1363], %i2
	xor %i0, %i2, %i2
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %i0
	st %i0, [%fp+1415]
	ld [%fp+1559], %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %l2, %i2
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %i0
	st %i0, [%fp+1751]
	ld [%fp+1607], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %g5, %i2
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %i4
	ld [%fp+1719], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %l0, %i2
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %i0
	st %i0, [%fp+1443]
	ld [%fp+1711], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %l1, %i2
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %i0
	st %i0, [%fp+1451]
	ld [%fp+1871], %i2
	ld [%fp+1499], %i0
	add %i0, %i2, %i2
	add %i1, %i2, %i0
	mov	%i1, %o1
	st %i0, [%fp+1703]
	ld [%fp+1483], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %i0
	st %i0, [%fp+1471]
	ld [%fp+1895], %i2
	ld [%fp+1695], %i3
	add %i3, %i2, %i2
	add %g3, %i2, %i1
	st %i1, [%fp+1495]
	mov	%g3, %o5
	ld [%fp+1475], %i2
	xor %i1, %i2, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %i3
	st %i3, [%fp+1455]
	ld [%fp+1859], %i2
	ld [%fp+1663], %i1
	add %i1, %i2, %i2
	add %g4, %i2, %i1
	st %i1, [%fp+1483]
	ld [%fp+1467], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %o3
	st %o3, [%fp+1463]
	ld [%fp+1883], %i2
	ld [%fp+1615], %i1
	add %i1, %i2, %i5
	add %l6, %i5, %i1
	st %i1, [%fp+1615]
	xor %i1, %o2, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %o2
	st %o2, [%fp+1467]
	ld [%fp+1795], %i2
	ld [%fp+1599], %i1
	add %i1, %i2, %i5
	add %o0, %i5, %i1
	st %i1, [%fp+1663]
	mov	%o0, %l6
	ld [%fp+1359], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %g2
	ld [%fp+1827], %i2
	ld [%fp+1655], %i1
	add %i1, %i2, %i5
	add %l5, %i5, %i1
	st %i1, [%fp+1499]
	ld [%fp+1479], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %i1
	st %i1, [%fp+1447]
	ld [%fp+1807], %i2
	ld [%fp+1647], %i1
	add %i1, %i2, %i5
	ld [%fp+1395], %g5
	add %g5, %i5, %i1
	st %i1, [%fp+1479]
	ld [%fp+1367], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %i1
	st %i1, [%fp+1427]
	ld [%fp+1839], %i2
	ld [%fp+1591], %i1
	add %i1, %i2, %i5
	add %l3, %i5, %i1
	st %i1, [%fp+1599]
	ld [%fp+1487], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %g4
	st %g4, [%fp+1359]
	ld [%fp+1923], %i2
	ld [%fp+1575], %i1
	add %i1, %i2, %i5
	mov	%l7, %o7
	add %l7, %i5, %i1
	st %i1, [%fp+1695]
	ld [%fp+1387], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %i1
	st %i1, [%fp+1403]
	ld [%fp+1955], %i2
	ld [%fp+1679], %i1
	add %i1, %i2, %i5
	add %l4, %i5, %i1
	st %i1, [%fp+1647]
	ld [%fp+1399], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %l0
	sll %i5, 24, %i5
	or %i5, %l0, %l0
	ld [%fp+1911], %i2
	ld [%fp+1735], %i1
	add %i1, %i2, %i5
	ld [%fp+1407], %l2
	add %l2, %i5, %i1
	st %i1, [%fp+1475]
	xor %i1, %o4, %i5
	srl %i5, 8, %l1
	sll %i5, 24, %i5
	or %i5, %l1, %i1
	st %i1, [%fp+1399]
	ld [%fp+1943], %i2
	ld [%fp+1687], %i1
	add %i1, %i2, %i5
	ld [%fp+1415], %o4
	add %o4, %i5, %i1
	st %i1, [%fp+1491]
	ld [%fp+1411], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %l1
	sll %i5, 24, %i5
	or %i5, %l1, %i1
	st %i1, [%fp+1411]
	ld [%fp+1799], %i2
	ld [%fp+1631], %i1
	add %i1, %i2, %i5
	ld [%fp+1751], %i1
	add %i1, %i5, %i1
	st %i1, [%fp+1687]
	ld [%fp+1419], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %l1
	sll %i5, 24, %i5
	or %i5, %l1, %l1
	ld [%fp+1831], %i2
	ld [%fp+1759], %i1
	add %i1, %i2, %i5
	add %i4, %i5, %i1
	st %i1, [%fp+1655]
	ld [%fp+1423], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %l4
	sll %i5, 24, %i5
	or %i5, %l4, %l4
	ld [%fp+1815], %i2
	ld [%fp+1671], %i1
	add %i1, %i2, %i5
	ld [%fp+1443], %l3
	add %l3, %i5, %i1
	st %i1, [%fp+1487]
	ld [%fp+1435], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %l5
	sll %i5, 24, %i5
	or %i5, %l5, %i1
	st %i1, [%fp+1371]
	ld [%fp+1843], %i2
	ld [%fp+1583], %i1
	add %i1, %i2, %i5
	ld [%fp+1451], %o0
	add %o0, %i5, %i1
	st %i1, [%fp+1591]
	ld [%fp+1439], %i2
	xor %i1, %i2, %i5
	srl %i5, 8, %l7
	sll %i5, 24, %i5
	or %i5, %l7, %i1
	st %i1, [%fp+1363]
	ld [%fp+1503], %i1
	add %i0, %i1, %i2
	st %i2, [%fp+1735]
	xor %i2, %o1, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %l5
	st %l5, [%fp+1423]
	ld [%fp+1547], %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %o5, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %o5
	st %o5, [%fp+1439]
	ld [%fp+1551], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %o3
	st %o3, [%fp+1419]
	ld [%fp+1743], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1459], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %o2
	st %o2, [%fp+1387]
	ld [%fp+1539], %i0
	add %g2, %i0, %i1
	st %i1, [%fp+1727]
	xor %i1, %l6, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %l6
	st %l6, [%fp+1379]
	ld [%fp+1543], %i0
	ld [%fp+1447], %l7
	add %l7, %i0, %i0
	st %i0, [%fp+1719]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %o1
	st %o1, [%fp+1375]
	ld [%fp+1531], %i0
	ld [%fp+1427], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %g5, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %i0
	st %i0, [%fp+1743]
	ld [%fp+1535], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1575]
	ld [%fp+1391], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %i0
	st %i0, [%fp+1759]
	ld [%fp+1519], %i0
	ld [%fp+1403], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1543]
	xor %i0, %o7, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1367]
	ld [%fp+1523], %i0
	mov	%l0, %g4
	add %l0, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1383], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1383]
	ld [%fp+1527], %i0
	ld [%fp+1399], %o7
	add %o7, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %l2, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1391]
	ld [%fp+1623], %i0
	ld [%fp+1411], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %o4, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1395]
	ld [%fp+1515], %i0
	mov	%l1, %o4
	add %l1, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i2
	st %i2, [%fp+1539]
	ld [%fp+1607], %i0
	mov	%l4, %l1
	add %l4, %i0, %i0
	st %i0, [%fp+1519]
	xor %i0, %i4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l2
	st %l2, [%fp+1515]
	ld [%fp+1507], %i0
	ld [%fp+1371], %l4
	add %l4, %i0, %i0
	st %i0, [%fp+1523]
	xor %i0, %l3, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %l3
	st %l3, [%fp+1507]
	ld [%fp+1511], %i0
	ld [%fp+1363], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %o0, %i5
	srl %i5, 7, %i0
	sll %i5, 25, %i5
	or %i5, %i0, %i5
	st %i5, [%fp+1511]
	ld [%fp+1927], %i0
	ld [%fp+1483], %i1
	add %i1, %i0, %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1503]
	xor %i0, %g2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i1
	ld [%fp+1971], %i0
	ld [%fp+1615], %i3
	add %i3, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1751]
	xor %i0, %l7, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l7
	st %l7, [%fp+1447]
	ld [%fp+1783], %i0
	ld [%fp+1703], %i3
	add %i3, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %g3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l2
	st %l2, [%fp+1483]
	ld [%fp+2039], %i0
	ld [%fp+1495], %i3
	add %i3, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1359], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1415]
	ld [%fp+1939], %i0
	ld [%fp+1479], %i2
	add %i2, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %g5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l5
	st %l5, [%fp+1407]
	ld [%fp+2023], %i0
	ld [%fp+1599], %i2
	add %i2, %i0, %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1599]
	xor %i0, %g4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1479]
	ld [%fp+2031], %i0
	ld [%fp+1663], %i3
	add %i3, %i0, %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %o7, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o7
	st %o7, [%fp+1431]
	ld [%fp+2035], %i0
	ld [%fp+1499], %i3
	add %i3, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %l0, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o0
	st %o0, [%fp+1495]
	ld [%fp+1967], %i0
	ld [%fp+1475], %i2
	add %i2, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %o4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1403]
	ld [%fp+1995], %i0
	ld [%fp+1491], %i2
	add %i2, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %l1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l6
	st %l6, [%fp+1435]
	ld [%fp+1983], %i0
	ld [%fp+1695], %i2
	add %i2, %i0, %i0
	ld [%fp+1743], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %l4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o3
	st %o3, [%fp+1475]
	ld [%fp+2015], %i0
	ld [%fp+1647], %i2
	add %i2, %i0, %i0
	ld [%fp+1759], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %i4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l3
	st %l3, [%fp+1459]
	ld [%fp+1775], %i0
	ld [%fp+1487], %i2
	add %i2, %i0, %i0
	ld [%fp+1367], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1647]
	ld [%fp+1471], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g5
	st %g5, [%fp+1499]
	ld [%fp+1823], %i0
	ld [%fp+1591], %i2
	add %i2, %i0, %i0
	ld [%fp+1383], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1591]
	ld [%fp+1455], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o5
	ld [%fp+1791], %i0
	ld [%fp+1687], %i2
	add %i2, %i0, %i0
	ld [%fp+1391], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1687]
	ld [%fp+1463], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l0
	st %l0, [%fp+1471]
	ld [%fp+1811], %i0
	ld [%fp+1655], %i2
	add %i2, %i0, %i0
	ld [%fp+1395], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1467], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o4
	st %o4, [%fp+1463]
	ld [%fp+1551], %i0
	add %i1, %i0, %i0
	mov	%i1, %l1
	st %i0, [%fp+1551]
	ld [%fp+1539], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1467]
	ld [%fp+1547], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	ld [%fp+1543], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1507], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g4
	ld [%fp+1415], %g2
	ld [%fp+1531], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l2
	ld [%fp+1523], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l7
	ld [%fp+1479], %i2
	ld [%fp+1527], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o2
	ld [%fp+1535], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o7
	ld [%fp+1519], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1419]
	ld [%fp+1403], %l5
	ld [%fp+1567], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1379], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1583], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1423]
	ld [%fp+1735], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1515]
	ld [%fp+1743], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o3
	ld [%fp+1711], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1711]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l3
	ld [%fp+1559], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+1575], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %g3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1411]
	ld [%fp+1727], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %i4, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g3
	ld [%fp+1719], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %i3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1427]
	ld [%fp+1767], %i0
	ld [%fp+1503], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %l1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1451]
	ld [%fp+1899], %i0
	ld [%fp+1751], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1491]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1443]
	ld [%fp+1771], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	mov	%g4, %l1
	add %g4, %i0, %i0
	st %i0, [%fp+1487]
	ld [%fp+1483], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1447]
	ld [%fp+1907], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1483]
	xor %i0, %g2, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1415]
	ld [%fp+1975], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1343]
	ld [%fp+2011], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %i2, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1391]
	ld [%fp+1963], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1363]
	ld [%fp+1991], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	ld [%fp+1419], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1479]
	ld [%fp+1495], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1355]
	ld [%fp+1779], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	ld [%fp+1439], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %l5, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1339]
	ld [%fp+1999], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	ld [%fp+1423], %l5
	add %l5, %i0, %i0
	st %i0, [%fp+1495]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1751]
	ld [%fp+1987], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1663]
	ld [%fp+1475], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+1431]
	ld [%fp+2019], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1475]
	ld [%fp+1459], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %g5
	st %g5, [%fp+1435]
	ld [%fp+1923], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	ld [%fp+1759], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1503]
	ld [%fp+1499], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o4
	ld [%fp+1955], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i1
	add %o0, %i1, %i0
	st %i0, [%fp+1499]
	xor %i0, %o5, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1623]
	ld [%fp+1911], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i2
	mov	%g3, %o5
	add %g3, %i2, %i0
	st %i0, [%fp+1591]
	ld [%fp+1471], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1695]
	ld [%fp+1943], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i3
	ld [%fp+1427], %i1
	add %i1, %i3, %i0
	st %i0, [%fp+1471]
	ld [%fp+1463], %i2
	xor %i0, %i2, %i3
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %i0
	st %i0, [%fp+1655]
	ld [%fp+1551], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1743]
	ld [%fp+1467], %i2
	xor %i0, %i2, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1455]
	ld [%fp+1547], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %o1, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1459]
	ld [%fp+1539], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %l1, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1463]
	ld [%fp+1543], %i0
	ld [%fp+1415], %o1
	add %o1, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %l2, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1467]
	ld [%fp+1523], %i0
	ld [%fp+1343], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %l7, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i2
	ld [%fp+1527], %i0
	ld [%fp+1391], %o0
	add %o0, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %o2, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %l7
	st %l7, [%fp+1387]
	ld [%fp+1531], %i0
	ld [%fp+1363], %o2
	add %o2, %i0, %i0
	st %i0, [%fp+1599]
	xor %i0, %o7, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %l4
	st %l4, [%fp+1359]
	ld [%fp+1535], %i0
	ld [%fp+1355], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %i5, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %l6
	st %l6, [%fp+1351]
	ld [%fp+1519], %i0
	ld [%fp+1339], %o7
	add %o7, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %g4, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %i5
	st %i5, [%fp+1347]
	ld [%fp+1567], %i0
	ld [%fp+1751], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %l5, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %i4
	st %i4, [%fp+1399]
	ld [%fp+1515], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1535]
	xor %i0, %o3, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %l0
	st %l0, [%fp+1383]
	ld [%fp+1711], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1539]
	xor %i0, %l3, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %g2
	st %g2, [%fp+1375]
	ld [%fp+1559], %i0
	add %o4, %i0, %i3
	st %i3, [%fp+1543]
	ld [%fp+1759], %i0
	xor %i3, %i0, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %i3
	st %i3, [%fp+1371]
	ld [%fp+1575], %i0
	ld [%fp+1623], %l5
	add %l5, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1411], %g3
	xor %i0, %g3, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %g5
	st %g5, [%fp+1423]
	ld [%fp+1511], %i0
	ld [%fp+1695], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1519]
	xor %i0, %o5, %g4
	srl %g4, 7, %i0
	sll %g4, 25, %g4
	or %g4, %i0, %g4
	st %g4, [%fp+1511]
	ld [%fp+1507], %i0
	ld [%fp+1655], %l3
	add %l3, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+1419]
	ld [%fp+1919], %i0
	ld [%fp+1487], %i1
	add %i1, %i0, %i0
	add %i2, %i0, %i0
	mov	%i2, %o5
	st %i0, [%fp+1507]
	xor %i0, %o4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1487]
	ld [%fp+1951], %i0
	ld [%fp+1483], %i1
	add %i1, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %l5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+1903], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1367]
	ld [%fp+1935], %i0
	ld [%fp+1491], %i1
	add %i1, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %l3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1379]
	ld [%fp+1915], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+1395]
	ld [%fp+1947], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1575]
	ld [%fp+1443], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1403]
	ld [%fp+1931], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1623]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1407]
	ld [%fp+1959], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1671]
	xor %i0, %o1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1411]
	ld [%fp+1871], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1655]
	xor %i0, %l1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l1
	st %l1, [%fp+1439]
	ld [%fp+1895], %i0
	ld [%fp+1475], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %o0, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1415]
	ld [%fp+1859], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %o2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1447]
	ld [%fp+1883], %i0
	ld [%fp+1495], %i1
	add %i1, %i0, %i0
	add %g3, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %l2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1491]
	ld [%fp+1799], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	ld [%fp+1455], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %o7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o7
	ld [%fp+1831], %i0
	ld [%fp+1471], %i1
	add %i1, %i0, %i0
	ld [%fp+1459], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1607]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+1443]
	ld [%fp+1815], %i0
	ld [%fp+1503], %i1
	add %i1, %i0, %i0
	ld [%fp+1463], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+1451]
	ld [%fp+1843], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	ld [%fp+1467], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1751]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g3
	ld [%fp+1535], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %o5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i5
	ld [%fp+1759], %i0
	ld [%fp+1539], %i1
	add %i0, %i1, %i0
	st %i0, [%fp+1523]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o5
	ld [%fp+1551], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1359], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1435]
	ld [%fp+1547], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1351], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l4
	ld [%fp+1519], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1347], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g4
	ld [%fp+1515], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1399], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %o3
	ld [%fp+1543], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1383], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l7
	ld [%fp+1527], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1391]
	ld [%fp+1631], %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1371], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1427]
	ld [%fp+1703], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l5
	st %l5, [%fp+1399]
	ld [%fp+1743], %i2
	add %o0, %i2, %i0
	st %i0, [%fp+1519]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %o0
	ld [%fp+1719], %i2
	add %o4, %i2, %i0
	st %i0, [%fp+1719]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1431]
	ld [%fp+1599], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1599]
	mov	%o7, %o4
	xor %i0, %l2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l1
	st %l1, [%fp+1363]
	ld [%fp+1647], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %i4, %i2
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %l2
	st %l2, [%fp+1359]
	ld [%fp+1735], %i2
	add %g2, %i2, %i0
	st %i0, [%fp+1515]
	xor %i0, %g5, %i2
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %g2
	st %g2, [%fp+1387]
	ld [%fp+1727], %i2
	mov	%g3, %o7
	add %g3, %i2, %i0
	st %i0, [%fp+1511]
	xor %i0, %l0, %i2
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %l6
	st %l6, [%fp+1375]
	ld [%fp+1807], %i2
	ld [%fp+1507], %i0
	add %i0, %i2, %i2
	add %i5, %i2, %i0
	mov	%i5, %l0
	st %i0, [%fp+1703]
	ld [%fp+1487], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %i0
	st %i0, [%fp+1483]
	ld [%fp+1839], %i2
	ld [%fp+1711], %i1
	add %i1, %i2, %i2
	add %o5, %i2, %i1
	st %i1, [%fp+1495]
	ld [%fp+1759], %i2
	xor %i1, %i2, %i2
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %i1
	st %i1, [%fp+1471]
	ld [%fp+1795], %i2
	ld [%fp+1687], %i3
	add %i3, %i2, %i2
	ld [%fp+1435], %l3
	add %l3, %i2, %i2
	st %i2, [%fp+1503]
	ld [%fp+1367], %i3
	xor %i2, %i3, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i3
	st %i3, [%fp+1475]
	ld [%fp+1827], %i2
	ld [%fp+1695], %i4
	add %i4, %i2, %i4
	add %l4, %i4, %i2
	st %i2, [%fp+1711]
	ld [%fp+1379], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %o1
	st %o1, [%fp+1479]
	ld [%fp+1855], %i2
	ld [%fp+1679], %i4
	add %i4, %i2, %i4
	add %g4, %i4, %i2
	st %i2, [%fp+1507]
	ld [%fp+1395], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1467]
	ld [%fp+1879], %i2
	ld [%fp+1575], %i4
	add %i4, %i2, %i4
	mov	%o3, %g3
	add %o3, %i4, %i2
	st %i2, [%fp+1499]
	ld [%fp+1403], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %g5
	st %g5, [%fp+1403]
	ld [%fp+1867], %i2
	ld [%fp+1623], %i4
	add %i4, %i2, %i4
	mov	%l7, %o3
	add %l7, %i4, %i2
	st %i2, [%fp+1623]
	ld [%fp+1407], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1463]
	ld [%fp+1891], %i2
	ld [%fp+1671], %i4
	add %i4, %i2, %i4
	ld [%fp+1391], %l7
	add %l7, %i4, %i2
	st %i2, [%fp+1679]
	ld [%fp+1411], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1459]
	ld [%fp+1863], %i2
	ld [%fp+1655], %i4
	add %i4, %i2, %i4
	ld [%fp+1427], %o2
	add %o2, %i4, %i2
	st %i2, [%fp+1671]
	ld [%fp+1439], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1411]
	ld [%fp+1887], %i2
	ld [%fp+1615], %i4
	add %i4, %i2, %i4
	add %l5, %i4, %i2
	st %i2, [%fp+1655]
	ld [%fp+1415], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1455]
	ld [%fp+1851], %i2
	ld [%fp+1583], %i4
	add %i4, %i2, %i4
	add %o0, %i4, %i2
	st %i2, [%fp+1487]
	ld [%fp+1447], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1583]
	ld [%fp+1875], %i2
	ld [%fp+1663], %i4
	add %i4, %i2, %i4
	ld [%fp+1431], %l5
	add %l5, %i4, %i2
	st %i2, [%fp+1615]
	ld [%fp+1491], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1395]
	ld [%fp+1803], %i2
	ld [%fp+1591], %i4
	add %i4, %i2, %i4
	add %l1, %i4, %i2
	st %i2, [%fp+1695]
	xor %i2, %o4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %o4
	st %o4, [%fp+1355]
	ld [%fp+1835], %i2
	ld [%fp+1607], %i4
	add %i4, %i2, %i4
	add %l2, %i4, %i2
	st %i2, [%fp+1663]
	ld [%fp+1443], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1607]
	ld [%fp+1819], %i2
	ld [%fp+1567], %i4
	add %i4, %i2, %i4
	add %g2, %i4, %i2
	st %i2, [%fp+1491]
	ld [%fp+1451], %i4
	xor %i2, %i4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1451]
	ld [%fp+1847], %i2
	ld [%fp+1751], %i4
	add %i4, %i2, %i4
	add %l6, %i4, %i2
	st %i2, [%fp+1567]
	xor %i2, %o7, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1367]
	ld [%fp+1559], %i2
	add %i0, %i2, %i2
	st %i2, [%fp+1759]
	xor %i2, %l0, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %l0
	st %l0, [%fp+1439]
	ld [%fp+1523], %i0
	add %i1, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %o5, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %o7
	st %o7, [%fp+1447]
	ld [%fp+1531], %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %l3, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %o5
	st %o5, [%fp+1423]
	ld [%fp+1535], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %l4, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %l4
	st %l4, [%fp+1415]
	ld [%fp+1539], %i0
	ld [%fp+1467], %g2
	add %g2, %i0, %i0
	st %i0, [%fp+1751]
	xor %i0, %g4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1379]
	ld [%fp+1547], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1743]
	xor %i0, %g3, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l1
	st %l1, [%fp+1419]
	ld [%fp+1551], %i0
	ld [%fp+1463], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %o3, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1407]
	ld [%fp+1543], %i0
	ld [%fp+1459], %l3
	add %l3, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %l7, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1383]
	ld [%fp+1631], %i0
	ld [%fp+1411], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %o2, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1371]
	ld [%fp+1527], %i0
	ld [%fp+1455], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1399], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1391]
	ld [%fp+1519], %i0
	ld [%fp+1583], %l7
	add %l7, %i0, %l2
	xor %l2, %o0, %i1
	srl %i1, 7, %i4
	sll %i1, 25, %i1
	or %i1, %i4, %i0
	st %i0, [%fp+1427]
	ld [%fp+1719], %i0
	ld [%fp+1395], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %l5, %i1
	srl %i1, 7, %i4
	sll %i1, 25, %i1
	or %i1, %i4, %i0
	st %i0, [%fp+1435]
	ld [%fp+1599], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1363], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %o0
	st %o0, [%fp+1519]
	ld [%fp+1647], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1359], %i3
	xor %i0, %i3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o4
	st %o4, [%fp+1527]
	ld [%fp+1515], %i0
	ld [%fp+1451], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1387], %i3
	xor %i0, %i3, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %l5
	st %l5, [%fp+1523]
	ld [%fp+1511], %i0
	ld [%fp+1367], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1375], %i3
	xor %i0, %i3, %i5
	srl %i5, 7, %i0
	sll %i5, 25, %i5
	or %i5, %i0, %i5
	ld [%fp+2031], %i0
	ld [%fp+1503], %i3
	add %i3, %i0, %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1503]
	xor %i0, %g2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o2
	st %o2, [%fp+1467]
	ld [%fp+2035], %i0
	ld [%fp+1711], %i3
	add %i3, %i0, %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1719]
	ld [%fp+1403], %i3
	xor %i0, %i3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o4
	ld [%fp+1939], %i0
	ld [%fp+1703], %i3
	add %i3, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o0
	st %o0, [%fp+1443]
	ld [%fp+2023], %i0
	ld [%fp+1495], %i3
	add %i3, %i0, %i0
	add %i5, %i0, %i0
	mov	%i5, %l5
	st %i0, [%fp+1631]
	xor %i0, %l3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l3
	st %l3, [%fp+1495]
	ld [%fp+1975], %i0
	ld [%fp+1623], %i3
	add %i3, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %g4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1403]
	ld [%fp+2011], %i0
	ld [%fp+1679], %i2
	add %i2, %i0, %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %g3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1431]
	ld [%fp+1963], %i0
	ld [%fp+1507], %i2
	add %i2, %i0, %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %l7, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l0
	st %l0, [%fp+1455]
	ld [%fp+1991], %i0
	ld [%fp+1499], %i2
	add %i2, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %o3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1375]
	ld [%fp+1911], %i0
	ld [%fp+1487], %i2
	add %i2, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1703]
	ld [%fp+1355], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1499]
	ld [%fp+1943], %i0
	ld [%fp+1615], %i2
	add %i2, %i0, %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l4
	st %l4, [%fp+1463]
	ld [%fp+1923], %i0
	ld [%fp+1671], %i2
	add %i2, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %g5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l7
	st %l7, [%fp+1459]
	ld [%fp+1955], %i0
	ld [%fp+1655], %i2
	add %i2, %i0, %i0
	ld [%fp+1383], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1655]
	xor %i0, %i4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g4
	ld [%fp+1983], %i0
	ld [%fp+1491], %i2
	add %i2, %i0, %i0
	ld [%fp+1371], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1483], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o7
	ld [%fp+2015], %i0
	ld [%fp+1567], %i2
	add %i2, %i0, %i0
	ld [%fp+1391], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1471], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o3
	st %o3, [%fp+1471]
	ld [%fp+1967], %i0
	ld [%fp+1695], %i2
	add %i2, %i0, %i0
	ld [%fp+1427], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1695]
	ld [%fp+1475], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o5
	st %o5, [%fp+1451]
	ld [%fp+1995], %i0
	ld [%fp+1663], %i2
	add %i2, %i0, %i0
	ld [%fp+1435], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1663]
	ld [%fp+1479], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g2
	add %o2, %l2, %i0
	st %i0, [%fp+1567]
	ld [%fp+1519], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+1491]
	ld [%fp+1559], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1559]
	ld [%fp+1527], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o2
	ld [%fp+1547], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1411]
	ld [%fp+1551], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %l5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l3
	ld [%fp+1403], %l6
	ld [%fp+1531], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o0
	ld [%fp+1431], %g5
	ld [%fp+1535], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	ld [%fp+1539], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l5
	ld [%fp+1375], %l0
	ld [%fp+1543], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1415], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1499], %l1
	ld [%fp+1591], %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1379], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1399]
	ld [%fp+1727], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1591]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1419]
	ld [%fp+1759], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1415]
	ld [%fp+1735], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1519]
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1383]
	ld [%fp+1575], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %i3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1395]
	ld [%fp+1687], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %g3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o3
	ld [%fp+1751], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %i4, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o5
	ld [%fp+1743], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %i2, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1407]
	ld [%fp+1791], %i0
	ld [%fp+1503], %i1
	add %i1, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1687]
	ld [%fp+1467], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1447]
	ld [%fp+1811], %i0
	ld [%fp+1719], %i1
	add %i1, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1483]
	xor %i0, %o4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1435]
	ld [%fp+1775], %i0
	ld [%fp+1711], %i1
	add %i1, %i0, %i0
	ld [%fp+1411], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1711]
	ld [%fp+1443], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+1823], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	mov	%l3, %g3
	add %l3, %i0, %i0
	st %i0, [%fp+1479]
	ld [%fp+1495], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1387]
	ld [%fp+1931], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	mov	%o0, %i5
	add %o0, %i0, %i0
	st %i0, [%fp+1503]
	xor %i0, %l6, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1443]
	ld [%fp+1959], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1487]
	xor %i0, %g5, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1423]
	ld [%fp+1915], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1495]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1367]
	ld [%fp+1947], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	ld [%fp+1439], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %l0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1359]
	ld [%fp+1927], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	ld [%fp+1399], %l3
	add %l3, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %l1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1347]
	ld [%fp+1971], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i0
	ld [%fp+1419], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1499]
	ld [%fp+1463], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1351]
	ld [%fp+1783], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	ld [%fp+1415], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1475]
	ld [%fp+1459], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1427]
	ld [%fp+2039], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %g4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1431]
	ld [%fp+1863], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %o7, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o7
	ld [%fp+1887], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i1
	add %o3, %i1, %i0
	st %i0, [%fp+1599]
	ld [%fp+1471], %i1
	xor %i0, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1679]
	ld [%fp+1851], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i2
	add %o5, %i2, %i0
	st %i0, [%fp+1467]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1695]
	ld [%fp+1875], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i3
	ld [%fp+1407], %i1
	add %i1, %i3, %i0
	st %i0, [%fp+1471]
	xor %i0, %g2, %i3
	srl %i3, 8, %g4
	sll %i3, 24, %i3
	or %i3, %g4, %i0
	st %i0, [%fp+1671]
	ld [%fp+1567], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1751]
	ld [%fp+1491], %i2
	xor %i0, %i2, %g2
	srl %g2, 7, %g4
	sll %g2, 25, %g2
	or %g2, %g4, %i0
	st %i0, [%fp+1451]
	ld [%fp+1559], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %o2, %g2
	srl %g2, 7, %g4
	sll %g2, 25, %g2
	or %g2, %g4, %i0
	st %i0, [%fp+1455]
	ld [%fp+1547], %i0
	ld [%fp+1759], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %l2, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+1459]
	ld [%fp+1551], %i0
	ld [%fp+1387], %o4
	add %o4, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %g3, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+1463]
	ld [%fp+1531], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1743]
	xor %i0, %i5, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %i3
	st %i3, [%fp+1547]
	ld [%fp+1535], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %o1, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %g4
	st %g4, [%fp+1375]
	ld [%fp+1539], %i0
	ld [%fp+1367], %o1
	add %o1, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %l5, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l2
	st %l2, [%fp+1363]
	ld [%fp+1543], %i0
	ld [%fp+1359], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %g5, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l5
	st %l5, [%fp+1355]
	ld [%fp+1527], %i0
	ld [%fp+1347], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %l3, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l3
	st %l3, [%fp+1411]
	ld [%fp+1591], %i0
	ld [%fp+1351], %o2
	add %o2, %i0, %i0
	st %i0, [%fp+1543]
	xor %i0, %l0, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l0
	st %l0, [%fp+1379]
	ld [%fp+1523], %i0
	add %l6, %i0, %i4
	xor %i4, %l1, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %l1
	st %l1, [%fp+1371]
	ld [%fp+1519], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1383], %i2
	xor %i0, %i2, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %l4
	st %l4, [%fp+1523]
	ld [%fp+1575], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1395], %i2
	xor %i0, %i2, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %o0
	st %o0, [%fp+1403]
	ld [%fp+1515], %i0
	ld [%fp+1679], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %o3, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %l6
	st %l6, [%fp+1515]
	ld [%fp+1511], %i0
	ld [%fp+1695], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1539]
	xor %i0, %o5, %g3
	srl %g3, 7, %i0
	sll %g3, 25, %g3
	or %g3, %i0, %g3
	st %g3, [%fp+1511]
	ld [%fp+1507], %i0
	ld [%fp+1671], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1507]
	ld [%fp+1771], %i0
	ld [%fp+1711], %i1
	add %i1, %i0, %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1491]
	xor %i0, %o7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g2
	ld [%fp+1907], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %i2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1383]
	ld [%fp+1767], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %o3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+1395]
	ld [%fp+1899], %i0
	ld [%fp+1483], %i1
	add %i1, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %o5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1391]
	ld [%fp+1859], %i0
	ld [%fp+1495], %i1
	add %i1, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1695]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o7
	st %o7, [%fp+1439]
	ld [%fp+1883], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1591]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+1399]
	ld [%fp+1871], %i0
	ld [%fp+1503], %i1
	add %i1, %i0, %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1407]
	ld [%fp+1895], %i0
	ld [%fp+1487], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1759]
	xor %i0, %o4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1415]
	ld [%fp+1807], %i0
	ld [%fp+1475], %i1
	add %i1, %i0, %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1443], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1419]
	ld [%fp+1839], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1687]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1479]
	ld [%fp+1795], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	add %g3, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %o1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1475]
	ld [%fp+1827], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %i5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1499]
	ld [%fp+1803], %i0
	ld [%fp+1467], %i1
	add %i1, %i0, %i0
	ld [%fp+1451], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %g5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l7
	ld [%fp+1835], %i0
	ld [%fp+1471], %i1
	add %i1, %i0, %i0
	ld [%fp+1455], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %o2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	ld [%fp+1819], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	ld [%fp+1459], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1647]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i5
	ld [%fp+1847], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	ld [%fp+1463], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o2
	add %g2, %i4, %i0
	mov	%g2, %o4
	st %i0, [%fp+1567]
	ld [%fp+1547], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i4
	ld [%fp+1551], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g2
	ld [%fp+1559], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1363], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g4
	ld [%fp+1543], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1559]
	ld [%fp+1355], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l5
	ld [%fp+1539], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1411], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+1387]
	ld [%fp+1531], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1379], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1431]
	ld [%fp+1535], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1371], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o3
	ld [%fp+1527], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l4
	ld [%fp+1623], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1403], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o5
	ld [%fp+1719], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l3
	st %l3, [%fp+1403]
	ld [%fp+1751], %i1
	add %l6, %i1, %i0
	st %i0, [%fp+1527]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1435]
	ld [%fp+1727], %i2
	add %i3, %i2, %i0
	st %i0, [%fp+1623]
	ld [%fp+1507], %i1
	xor %i0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l6
	ld [%fp+1615], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1515]
	mov	%l7, %o7
	xor %i0, %l2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1411]
	ld [%fp+1631], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1615]
	mov	%o1, %l2
	xor %i0, %g5, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1427]
	ld [%fp+1743], %i2
	add %i5, %i2, %i0
	st %i0, [%fp+1507]
	mov	%i5, %g5
	xor %i0, %l0, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l0
	ld [%fp+1735], %i2
	mov	%o2, %i1
	add %o2, %i2, %i0
	st %i0, [%fp+1511]
	xor %i0, %l1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1423]
	ld [%fp+1867], %i2
	ld [%fp+1491], %i0
	add %i0, %i2, %i2
	add %i4, %i2, %i0
	mov	%i4, %o2
	st %i0, [%fp+1631]
	xor %i0, %o4, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1455]
	ld [%fp+1891], %i2
	ld [%fp+1575], %i3
	add %i3, %i2, %i2
	add %g2, %i2, %i2
	st %i2, [%fp+1483]
	ld [%fp+1383], %i3
	xor %i2, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %l1
	st %l1, [%fp+1443]
	ld [%fp+1855], %i2
	ld [%fp+1711], %i3
	add %i3, %i2, %i2
	mov	%g4, %l7
	add %g4, %i2, %i2
	st %i2, [%fp+1495]
	ld [%fp+1395], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o1
	st %o1, [%fp+1447]
	ld [%fp+1879], %i2
	ld [%fp+1679], %i3
	add %i3, %i2, %i3
	add %l5, %i3, %i2
	st %i2, [%fp+1467]
	ld [%fp+1391], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o0
	st %o0, [%fp+1451]
	ld [%fp+1779], %i2
	ld [%fp+1695], %i3
	add %i3, %i2, %i3
	add %g3, %i3, %i2
	st %i2, [%fp+1503]
	ld [%fp+1439], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1695]
	ld [%fp+1999], %i2
	ld [%fp+1591], %i3
	add %i3, %i2, %i3
	ld [%fp+1431], %o4
	add %o4, %i3, %i2
	st %i2, [%fp+1487]
	ld [%fp+1399], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1399]
	ld [%fp+1987], %i2
	ld [%fp+1671], %i3
	add %i3, %i2, %i3
	add %o3, %i3, %i2
	st %i2, [%fp+1463]
	ld [%fp+1407], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1439]
	ld [%fp+2019], %i2
	ld [%fp+1759], %i3
	add %i3, %i2, %i3
	add %l4, %i3, %i2
	st %i2, [%fp+1471]
	ld [%fp+1415], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1415]
	ld [%fp+1815], %i2
	ld [%fp+1655], %i3
	add %i3, %i2, %i3
	mov	%o5, %g3
	add %o5, %i3, %i2
	st %i2, [%fp+1591]
	ld [%fp+1419], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %g4
	st %g4, [%fp+1655]
	ld [%fp+1843], %i2
	ld [%fp+1687], %i3
	add %i3, %i2, %i3
	add %l3, %i3, %i2
	st %i2, [%fp+1491]
	ld [%fp+1479], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1419]
	ld [%fp+1799], %i2
	ld [%fp+1583], %i3
	add %i3, %i2, %i3
	ld [%fp+1435], %l3
	add %l3, %i3, %i2
	st %i2, [%fp+1459]
	ld [%fp+1475], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1583]
	ld [%fp+1831], %i2
	ld [%fp+1663], %i3
	add %i3, %i2, %i3
	mov	%l6, %i5
	add %l6, %i3, %i2
	st %i2, [%fp+1479]
	ld [%fp+1499], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1395]
	ld [%fp+1903], %i2
	ld [%fp+1607], %i3
	add %i3, %i2, %i3
	ld [%fp+1411], %o5
	add %o5, %i3, %i2
	st %i2, [%fp+1679]
	xor %i2, %o7, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1751]
	ld [%fp+1935], %i2
	ld [%fp+1703], %i3
	add %i3, %i2, %i3
	ld [%fp+1427], %l6
	add %l6, %i3, %i2
	st %i2, [%fp+1499]
	xor %i2, %l2, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1383]
	ld [%fp+1919], %i2
	ld [%fp+1647], %i3
	add %i3, %i2, %i3
	add %l0, %i3, %i2
	st %i2, [%fp+1475]
	xor %i2, %g5, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1375]
	ld [%fp+1951], %i2
	ld [%fp+1599], %i3
	add %i3, %i2, %i3
	ld [%fp+1423], %g5
	add %g5, %i3, %i2
	st %i2, [%fp+1647]
	xor %i2, %i1, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i1
	st %i1, [%fp+1391]
	ld [%fp+1567], %i1
	add %i0, %i1, %i2
	st %i2, [%fp+1743]
	xor %i2, %o2, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l2
	st %l2, [%fp+1359]
	ld [%fp+1547], %i0
	add %l1, %i0, %i2
	st %i2, [%fp+1719]
	xor %i2, %g2, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l1
	st %l1, [%fp+1363]
	ld [%fp+1551], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %l7, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l7
	st %l7, [%fp+1355]
	ld [%fp+1559], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %l5, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o7
	st %o7, [%fp+1351]
	ld [%fp+1539], %i0
	ld [%fp+1695], %g2
	add %g2, %i0, %i2
	st %i2, [%fp+1735]
	ld [%fp+1387], %i0
	xor %i2, %i0, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o2
	st %o2, [%fp+1347]
	ld [%fp+1543], %i0
	ld [%fp+1399], %l5
	add %l5, %i0, %i2
	st %i2, [%fp+1727]
	xor %i2, %o4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1387]
	ld [%fp+1531], %i0
	ld [%fp+1439], %o4
	add %o4, %i0, %i0
	st %i0, [%fp+1567]
	xor %i0, %o3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1371]
	ld [%fp+1535], %i0
	ld [%fp+1415], %o1
	add %o1, %i0, %i0
	st %i0, [%fp+1671]
	xor %i0, %l4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1367]
	ld [%fp+1519], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1539]
	xor %i0, %g3, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %o0
	st %o0, [%fp+1343]
	ld [%fp+1523], %i0
	ld [%fp+1419], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1403], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %i0
	st %i0, [%fp+1379]
	ld [%fp+1527], %i0
	ld [%fp+1583], %l4
	add %l4, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %l3, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1403]
	ld [%fp+1623], %i0
	ld [%fp+1395], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %i5, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1435]
	ld [%fp+1515], %i0
	ld [%fp+1751], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %o5, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i1
	st %i1, [%fp+1515]
	ld [%fp+1615], %i0
	ld [%fp+1383], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1535]
	xor %i0, %l6, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l3
	st %l3, [%fp+1519]
	ld [%fp+1507], %i0
	ld [%fp+1375], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1523]
	xor %i0, %l0, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %l0
	st %l0, [%fp+1507]
	ld [%fp+1511], %i0
	ld [%fp+1391], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %g5, %i5
	srl %i5, 7, %i0
	sll %i5, 25, %i5
	or %i5, %i0, %i5
	st %i5, [%fp+1511]
	ld [%fp+1963], %i0
	ld [%fp+1495], %i3
	add %i3, %i0, %i0
	add %i1, %i0, %i0
	st %i0, [%fp+1495]
	xor %i0, %g2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i4
	ld [%fp+1991], %i0
	ld [%fp+1467], %i3
	add %i3, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %l5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1759]
	ld [%fp+1975], %i0
	ld [%fp+1631], %i3
	add %i3, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %o4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l3
	st %l3, [%fp+1439]
	ld [%fp+2011], %i0
	ld [%fp+1483], %i3
	add %i3, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %o1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o1
	st %o1, [%fp+1411]
	ld [%fp+1931], %i0
	ld [%fp+1463], %i3
	add %i3, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1687]
	ld [%fp+1655], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l0
	st %l0, [%fp+1407]
	ld [%fp+1959], %i0
	ld [%fp+1471], %i3
	add %i3, %i0, %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1655]
	xor %i0, %o3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l6
	st %l6, [%fp+1419]
	ld [%fp+1915], %i0
	ld [%fp+1503], %i3
	add %i3, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %l4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l1
	st %l1, [%fp+1427]
	ld [%fp+1947], %i0
	ld [%fp+1487], %i3
	add %i3, %i0, %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %g3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l2
	st %l2, [%fp+1463]
	ld [%fp+1851], %i0
	ld [%fp+1459], %i3
	add %i3, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o2
	st %o2, [%fp+1431]
	ld [%fp+1875], %i0
	ld [%fp+1479], %i3
	add %i3, %i0, %i0
	ld [%fp+1387], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l4
	st %l4, [%fp+1471]
	ld [%fp+1863], %i0
	ld [%fp+1591], %i3
	add %i3, %i0, %i0
	ld [%fp+1371], %l7
	add %l7, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %g4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g4
	st %g4, [%fp+1479]
	ld [%fp+1887], %i0
	ld [%fp+1491], %i3
	add %i3, %i0, %i0
	ld [%fp+1367], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %o5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g5
	st %g5, [%fp+1423]
	ld [%fp+1923], %i0
	ld [%fp+1475], %i3
	add %i3, %i0, %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1455], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l5
	st %l5, [%fp+1455]
	ld [%fp+1955], %i0
	ld [%fp+1647], %i2
	add %i2, %i0, %i0
	ld [%fp+1379], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1615]
	ld [%fp+1443], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o5
	st %o5, [%fp+1459]
	ld [%fp+1911], %i0
	ld [%fp+1679], %i2
	add %i2, %i0, %i0
	ld [%fp+1403], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o4
	ld [%fp+1943], %i0
	ld [%fp+1499], %i2
	add %i2, %i0, %i0
	ld [%fp+1435], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1647]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o7
	st %o7, [%fp+1415]
	ld [%fp+1551], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g2
	ld [%fp+1759], %i0
	ld [%fp+1547], %i1
	add %i0, %i1, %i0
	st %i0, [%fp+1547]
	ld [%fp+1519], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1467]
	ld [%fp+1539], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1507], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1399]
	ld [%fp+1543], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l3
	ld [%fp+1523], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1359], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o0
	ld [%fp+1527], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1363], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	ld [%fp+1531], %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1355], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	ld [%fp+1535], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1351], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1447]
	ld [%fp+1575], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1347], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1395]
	ld [%fp+1711], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %o3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1387]
	ld [%fp+1743], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %l7, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1443]
	ld [%fp+1719], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %g3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g5
	ld [%fp+1567], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1343], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1751]
	ld [%fp+1671], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o5
	ld [%fp+1735], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1503]
	mov	%o4, %i5
	xor %i0, %i3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1367]
	ld [%fp+1727], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1499]
	xor %i0, %i2, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1403]
	ld [%fp+1967], %i0
	ld [%fp+1495], %i1
	add %i1, %i0, %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1671]
	xor %i0, %i4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1451]
	ld [%fp+1995], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	ld [%fp+1467], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1487]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1435]
	ld [%fp+1983], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	ld [%fp+1399], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1483]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+1439]
	ld [%fp+2015], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	mov	%l3, %l1
	add %l3, %i0, %i0
	st %i0, [%fp+1695]
	ld [%fp+1411], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1411]
	ld [%fp+1871], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	mov	%o0, %l3
	add %o0, %i0, %i0
	st %i0, [%fp+1495]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1743]
	ld [%fp+1895], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	mov	%l0, %l4
	add %l0, %i0, %i0
	st %i0, [%fp+1491]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1391]
	ld [%fp+1859], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i0
	mov	%l6, %l0
	add %l6, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1427]
	ld [%fp+1883], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	ld [%fp+1447], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1463], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1375]
	ld [%fp+2031], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	ld [%fp+1395], %l6
	add %l6, %i0, %i0
	st %i0, [%fp+1663]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+2035], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1607]
	ld [%fp+1471], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1419]
	ld [%fp+1939], %i0
	ld [%fp+1559], %i1
	add %i1, %i0, %i0
	ld [%fp+1443], %o1
	add %o1, %i0, %i0
	st %i0, [%fp+1475]
	ld [%fp+1479], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1371]
	ld [%fp+2023], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1479]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1431]
	ld [%fp+1815], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	ld [%fp+1751], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o4
	ld [%fp+1843], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i1
	add %o5, %i1, %i0
	st %i0, [%fp+1559]
	ld [%fp+1459], %i1
	xor %i0, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %o7
	ld [%fp+1799], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i2
	add %i3, %i2, %i0
	st %i0, [%fp+1471]
	xor %i0, %i5, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1679]
	ld [%fp+1831], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i3
	ld [%fp+1403], %i1
	add %i1, %i3, %i0
	st %i0, [%fp+1647]
	ld [%fp+1415], %i2
	xor %i0, %i2, %i3
	srl %i3, 8, %i5
	sll %i3, 24, %i3
	or %i3, %i5, %i0
	st %i0, [%fp+1591]
	ld [%fp+1551], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %g2, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1455]
	ld [%fp+1547], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %g4, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1459]
	ld [%fp+1539], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %l2, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1463]
	ld [%fp+1543], %i0
	ld [%fp+1411], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %l1, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1467]
	ld [%fp+1523], %i0
	ld [%fp+1743], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %l3, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %g4
	st %g4, [%fp+1547]
	ld [%fp+1527], %i0
	ld [%fp+1391], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %l4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i2
	st %i2, [%fp+1407]
	ld [%fp+1531], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %l0, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l0
	st %l0, [%fp+1383]
	ld [%fp+1535], %i0
	ld [%fp+1375], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %g3, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %o0
	st %o0, [%fp+1379]
	ld [%fp+1519], %i0
	ld [%fp+1759], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %l6, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i3
	st %i3, [%fp+1523]
	ld [%fp+1575], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1387], %i4
	xor %i0, %i4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i4
	st %i4, [%fp+1519]
	ld [%fp+1515], %i0
	ld [%fp+1371], %l3
	add %l3, %i0, %l6
	xor %l6, %o1, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %o1
	st %o1, [%fp+1395]
	ld [%fp+1511], %i0
	add %l5, %i0, %l7
	xor %l7, %g5, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %l4
	st %l4, [%fp+1387]
	ld [%fp+1567], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1751], %i5
	xor %i0, %i5, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g5
	st %g5, [%fp+1447]
	ld [%fp+1507], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %o5, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g2
	st %g2, [%fp+1515]
	ld [%fp+1503], %i0
	ld [%fp+1679], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1367], %i5
	xor %i0, %i5, %g3
	srl %g3, 7, %i0
	sll %g3, 25, %g3
	or %g3, %i0, %i5
	st %i5, [%fp+1511]
	ld [%fp+1499], %i0
	ld [%fp+1591], %l5
	add %l5, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+1507]
	ld [%fp+1775], %i0
	ld [%fp+1483], %i1
	add %i1, %i0, %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1503]
	xor %i0, %o4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g3
	ld [%fp+1823], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1499]
	ld [%fp+1791], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1751]
	xor %i0, %o5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1399]
	ld [%fp+1811], %i0
	ld [%fp+1487], %i1
	add %i1, %i0, %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %l5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1367]
	ld [%fp+1795], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1591]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+1443]
	ld [%fp+1827], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1435]
	ld [%fp+1807], %i0
	ld [%fp+1495], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1415]
	ld [%fp+1839], %i0
	ld [%fp+1491], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %o3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o7
	ld [%fp+1867], %i0
	ld [%fp+1475], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1743], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1495]
	ld [%fp+1891], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1743]
	xor %i0, %l2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1483]
	ld [%fp+1855], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1575]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1423]
	ld [%fp+1879], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %l1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i3
	ld [%fp+1903], %i0
	ld [%fp+1471], %i1
	add %i1, %i0, %i0
	ld [%fp+1455], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1607]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+1487]
	ld [%fp+1935], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	ld [%fp+1459], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1759]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o0
	ld [%fp+1919], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	ld [%fp+1463], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %l3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1427]
	ld [%fp+1951], %i0
	ld [%fp+1559], %i1
	add %i1, %i0, %i0
	ld [%fp+1467], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o2
	add %g3, %l6, %i0
	mov	%g3, %i5
	st %i0, [%fp+1567]
	ld [%fp+1547], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1451]
	add %i2, %l7, %i0
	st %i0, [%fp+1547]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	ld [%fp+1399], %l3
	ld [%fp+1551], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1383], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1403]
	ld [%fp+1367], %l7
	ld [%fp+1543], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1559]
	ld [%fp+1379], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1407]
	ld [%fp+1539], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+1411]
	ld [%fp+1531], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1519], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1535], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1395], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o4
	ld [%fp+1527], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l5
	ld [%fp+1623], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+1447]
	ld [%fp+1703], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o3
	ld [%fp+1735], %i1
	add %l4, %i1, %i0
	st %i0, [%fp+1527]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	ld [%fp+1711], %i2
	add %i3, %i2, %i0
	st %i0, [%fp+1623]
	mov	%i3, %o5
	ld [%fp+1507], %i2
	xor %i0, %i2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l4
	ld [%fp+1615], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %l2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1431]
	ld [%fp+1631], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1615]
	mov	%o0, %g2
	xor %i0, %g4, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l2
	ld [%fp+1727], %i2
	add %o1, %i2, %i0
	st %i0, [%fp+1511]
	xor %i0, %g5, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %g4
	st %g4, [%fp+1387]
	ld [%fp+1719], %i2
	add %o2, %i2, %i0
	st %i0, [%fp+1507]
	xor %i0, %l1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1419]
	ld [%fp+1987], %i2
	ld [%fp+1503], %i0
	add %i0, %i2, %i2
	add %i4, %i2, %i0
	st %i0, [%fp+1631]
	xor %i0, %i5, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1475]
	ld [%fp+2019], %i2
	ld [%fp+1687], %i3
	add %i3, %i2, %i2
	add %l6, %i2, %i2
	st %i2, [%fp+1491]
	ld [%fp+1499], %i3
	xor %i2, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %o1
	st %o1, [%fp+1459]
	ld [%fp+1779], %i2
	ld [%fp+1751], %i3
	add %i3, %i2, %i2
	ld [%fp+1403], %i5
	add %i5, %i2, %i2
	st %i2, [%fp+1499]
	xor %i2, %l3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o0
	st %o0, [%fp+1463]
	ld [%fp+1999], %i2
	ld [%fp+1679], %i3
	add %i3, %i2, %i3
	ld [%fp+1407], %l3
	add %l3, %i3, %i2
	st %i2, [%fp+1679]
	xor %i2, %l7, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l1
	st %l1, [%fp+1467]
	ld [%fp+1927], %i2
	ld [%fp+1591], %i3
	add %i3, %i2, %i3
	add %l0, %i3, %i2
	st %i2, [%fp+1591]
	ld [%fp+1443], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1751]
	ld [%fp+1971], %i2
	ld [%fp+1583], %i3
	add %i3, %i2, %i3
	ld [%fp+1439], %l0
	add %l0, %i3, %i2
	st %i2, [%fp+1583]
	ld [%fp+1435], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1455]
	ld [%fp+1783], %i2
	ld [%fp+1671], %i3
	add %i3, %i2, %i3
	mov	%o4, %g5
	add %o4, %i3, %i2
	st %i2, [%fp+1479]
	ld [%fp+1415], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1443]
	ld [%fp+2039], %i2
	ld [%fp+1695], %i3
	add %i3, %i2, %i3
	mov	%l5, %o4
	add %l5, %i3, %i2
	st %i2, [%fp+1695]
	xor %i2, %o7, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1435]
	ld [%fp+1819], %i2
	ld [%fp+1655], %i3
	add %i3, %i2, %i3
	add %g3, %i3, %i2
	st %i2, [%fp+1687]
	ld [%fp+1495], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1383]
	ld [%fp+1847], %i2
	ld [%fp+1743], %i3
	add %i3, %i2, %i3
	add %o3, %i3, %i2
	st %i2, [%fp+1495]
	ld [%fp+1483], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o7
	st %o7, [%fp+1339]
	ld [%fp+1803], %i2
	ld [%fp+1575], %i3
	add %i3, %i2, %i3
	add %i1, %i3, %i2
	st %i2, [%fp+1471]
	ld [%fp+1423], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1415]
	ld [%fp+1835], %i2
	ld [%fp+1663], %i3
	add %i3, %i2, %i3
	add %l4, %i3, %i2
	st %i2, [%fp+1663]
	xor %i2, %o5, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1399]
	ld [%fp+1767], %i2
	ld [%fp+1607], %i3
	add %i3, %i2, %i3
	ld [%fp+1431], %o5
	add %o5, %i3, %i2
	st %i2, [%fp+1671]
	ld [%fp+1487], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1607]
	ld [%fp+1899], %i2
	ld [%fp+1759], %i3
	add %i3, %i2, %i3
	add %l2, %i3, %i2
	st %i2, [%fp+1503]
	xor %i2, %g2, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1367]
	ld [%fp+1771], %i2
	ld [%fp+1647], %i3
	add %i3, %i2, %i3
	add %g4, %i3, %i2
	st %i2, [%fp+1483]
	ld [%fp+1427], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1363]
	ld [%fp+1907], %i2
	ld [%fp+1599], %i3
	add %i3, %i2, %i3
	ld [%fp+1419], %g2
	add %g2, %i3, %i2
	st %i2, [%fp+1487]
	xor %i2, %o2, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1351]
	ld [%fp+1567], %i2
	add %i0, %i2, %i2
	st %i2, [%fp+1743]
	ld [%fp+1451], %i0
	xor %i2, %i0, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l5
	st %l5, [%fp+1395]
	ld [%fp+1547], %i0
	add %o1, %i0, %i2
	st %i2, [%fp+1719]
	xor %i2, %l6, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o2
	st %o2, [%fp+1451]
	ld [%fp+1551], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %i5, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o1
	st %o1, [%fp+1391]
	ld [%fp+1559], %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %l3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l7
	st %l7, [%fp+1375]
	ld [%fp+1539], %i0
	ld [%fp+1751], %i2
	add %i2, %i0, %i2
	st %i2, [%fp+1735]
	ld [%fp+1411], %i0
	xor %i2, %i0, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l3
	st %l3, [%fp+1379]
	ld [%fp+1543], %i0
	ld [%fp+1455], %o0
	add %o0, %i0, %i2
	st %i2, [%fp+1727]
	xor %i2, %l0, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l6
	st %l6, [%fp+1439]
	ld [%fp+1531], %i0
	ld [%fp+1443], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1567]
	xor %i0, %g5, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1759]
	ld [%fp+1535], %i0
	ld [%fp+1435], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %o4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1347]
	ld [%fp+1519], %i0
	ld [%fp+1383], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1447], %i2
	xor %i0, %i2, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %i0
	st %i0, [%fp+1343]
	ld [%fp+1523], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %o3, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %i0
	st %i0, [%fp+1355]
	ld [%fp+1527], %i0
	ld [%fp+1415], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1359]
	ld [%fp+1623], %i0
	ld [%fp+1399], %o4
	add %o4, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %l4, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1371]
	ld [%fp+1515], %i0
	ld [%fp+1607], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1535]
	xor %i0, %o5, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %o3
	ld [%fp+1615], %i0
	ld [%fp+1367], %l4
	add %l4, %i0, %i0
	st %i0, [%fp+1539]
	xor %i0, %l2, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l2
	st %l2, [%fp+1523]
	ld [%fp+1511], %i0
	ld [%fp+1363], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %i2
	st %i2, [%fp+1519]
	ld [%fp+1507], %i0
	ld [%fp+1351], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %g2, %i5
	srl %i5, 7, %i0
	sll %i5, 25, %i5
	or %i5, %i0, %i5
	st %i5, [%fp+1515]
	ld [%fp+1915], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1499]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i1
	ld [%fp+1947], %i0
	ld [%fp+1679], %i3
	add %i3, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %o0, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o7
	st %o7, [%fp+1431]
	ld [%fp+1931], %i0
	ld [%fp+1631], %i3
	add %i3, %i0, %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1655]
	xor %i0, %l0, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l0
	st %l0, [%fp+1427]
	ld [%fp+1959], %i0
	ld [%fp+1491], %i3
	add %i3, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %g3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o0
	st %o0, [%fp+1403]
	ld [%fp+1871], %i0
	ld [%fp+1479], %i3
	add %i3, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %g5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g5
	st %g5, [%fp+1423]
	ld [%fp+1895], %i0
	ld [%fp+1695], %i3
	add %i3, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1695]
	ld [%fp+1339], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l2
	st %l2, [%fp+1407]
	ld [%fp+1859], %i0
	ld [%fp+1591], %i3
	add %i3, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1751]
	xor %i0, %g4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i2
	st %i2, [%fp+1411]
	ld [%fp+1883], %i0
	ld [%fp+1583], %i3
	add %i3, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %o4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l5
	st %l5, [%fp+1447]
	ld [%fp+1799], %i0
	ld [%fp+1471], %i3
	add %i3, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1599]
	xor %i0, %l1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o1
	st %o1, [%fp+1479]
	ld [%fp+1831], %i0
	ld [%fp+1663], %i3
	add %i3, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %l4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l4
	st %l4, [%fp+1415]
	ld [%fp+1815], %i0
	ld [%fp+1687], %i3
	add %i3, %i0, %i0
	ld [%fp+1759], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l7
	st %l7, [%fp+1419]
	ld [%fp+1843], %i0
	ld [%fp+1495], %i3
	add %i3, %i0, %i0
	ld [%fp+1347], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %i4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o5
	ld [%fp+1863], %i0
	ld [%fp+1483], %i3
	add %i3, %i0, %i0
	ld [%fp+1343], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1663]
	ld [%fp+1475], %i3
	xor %i0, %i3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o4
	ld [%fp+1887], %i0
	ld [%fp+1487], %i3
	add %i3, %i0, %i0
	ld [%fp+1355], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1623]
	ld [%fp+1459], %i3
	xor %i0, %i3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o2
	st %o2, [%fp+1475]
	ld [%fp+1851], %i0
	ld [%fp+1671], %i3
	add %i3, %i0, %i0
	ld [%fp+1359], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1615]
	ld [%fp+1463], %i3
	xor %i0, %i3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l3
	st %l3, [%fp+1471]
	ld [%fp+1875], %i0
	ld [%fp+1503], %i3
	add %i3, %i0, %i0
	ld [%fp+1371], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1467], %g2
	xor %i0, %g2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g2
	ld [%fp+1559], %i0
	add %i1, %i0, %i0
	mov	%i1, %l1
	st %i0, [%fp+1559]
	xor %i0, %o3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1467]
	ld [%fp+1551], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o7
	ld [%fp+1543], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1519], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	ld [%fp+1547], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o0
	ld [%fp+1527], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1395], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g5
	ld [%fp+1531], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o3
	ld [%fp+1535], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1391], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1451]
	ld [%fp+1539], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1443]
	ld [%fp+1575], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1379], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1399]
	ld [%fp+1711], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1575]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l4
	ld [%fp+1743], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1515]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1719], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1519]
	xor %i0, %g4, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1395]
	ld [%fp+1567], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1567]
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1351]
	ld [%fp+1703], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %g3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1355]
	ld [%fp+1735], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %i4, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+1391]
	ld [%fp+1727], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1503]
	mov	%g2, %o2
	xor %i0, %i3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g2
	ld [%fp+1911], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %l1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1455]
	ld [%fp+1943], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	mov	%o7, %l6
	add %o7, %i0, %i0
	st %i0, [%fp+1491]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1431]
	ld [%fp+1923], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1487]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+1435]
	ld [%fp+1955], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	mov	%o0, %g4
	add %o0, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1403], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+1427]
	ld [%fp+1807], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	mov	%g5, %o7
	add %g5, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1367]
	ld [%fp+1839], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	mov	%o3, %l1
	add %o3, %i0, %i0
	st %i0, [%fp+1695]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1423]
	ld [%fp+1795], %i0
	ld [%fp+1751], %i1
	add %i1, %i0, %i0
	ld [%fp+1451], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1483]
	ld [%fp+1411], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1379]
	ld [%fp+1827], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	ld [%fp+1443], %o0
	add %o0, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1447]
	ld [%fp+1963], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	ld [%fp+1399], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1647]
	ld [%fp+1479], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1359]
	ld [%fp+1991], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1415], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1363]
	ld [%fp+1975], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	ld [%fp+1439], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1479]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1751]
	ld [%fp+2011], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o5, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+1819], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1499]
	xor %i0, %o4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o4
	ld [%fp+1847], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i1
	add %i2, %i1, %i0
	st %i0, [%fp+1495]
	ld [%fp+1475], %i1
	xor %i0, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1663]
	ld [%fp+1803], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i2
	add %i5, %i2, %i0
	st %i0, [%fp+1475]
	ld [%fp+1471], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1599]
	ld [%fp+1835], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i3
	mov	%g2, %i1
	add %g2, %i3, %i0
	st %i0, [%fp+1623]
	xor %i0, %o2, %i3
	srl %i3, 8, %i5
	sll %i3, 24, %i3
	or %i3, %i5, %i0
	st %i0, [%fp+1419]
	ld [%fp+1559], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1743]
	ld [%fp+1467], %i2
	xor %i0, %i2, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1459]
	ld [%fp+1551], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %l6, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1463]
	ld [%fp+1543], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %l0, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1467]
	ld [%fp+1547], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %g4, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+1471]
	ld [%fp+1527], %i0
	ld [%fp+1367], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %o7, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %l3
	st %l3, [%fp+1407]
	ld [%fp+1531], %i0
	ld [%fp+1423], %o1
	add %o1, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %l1, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i5
	st %i5, [%fp+1383]
	ld [%fp+1535], %i0
	ld [%fp+1379], %l7
	add %l7, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %g5, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l5
	st %l5, [%fp+1375]
	ld [%fp+1539], %i0
	ld [%fp+1447], %l6
	add %l6, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %o0, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %o7
	st %o7, [%fp+1371]
	ld [%fp+1523], %i0
	ld [%fp+1359], %o2
	add %o2, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %g3, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l1
	st %l1, [%fp+1523]
	ld [%fp+1575], %i0
	ld [%fp+1363], %o0
	add %o0, %i0, %i0
	st %i0, [%fp+1543]
	xor %i0, %l4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l0
	st %l0, [%fp+1387]
	ld [%fp+1515], %i0
	ld [%fp+1751], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %o3, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g4
	st %g4, [%fp+1439]
	ld [%fp+1519], %i0
	ld [%fp+1759], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1395], %i2
	xor %i0, %i2, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g5
	ld [%fp+1567], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1351], %i2
	xor %i0, %i2, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %l4
	st %l4, [%fp+1395]
	ld [%fp+1511], %i0
	ld [%fp+1663], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1355], %i3
	xor %i0, %i3, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g2
	st %g2, [%fp+1515]
	ld [%fp+1507], %i0
	ld [%fp+1599], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1391], %i4
	xor %i0, %i4, %g3
	srl %g3, 7, %i0
	sll %g3, 25, %g3
	or %g3, %i0, %g3
	st %g3, [%fp+1511]
	ld [%fp+1503], %i0
	ld [%fp+1419], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+1403]
	ld [%fp+1983], %i0
	ld [%fp+1487], %i1
	add %i1, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %o4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1503]
	ld [%fp+2015], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1671]
	xor %i0, %i2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+1487]
	ld [%fp+1967], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %i3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1391]
	ld [%fp+1995], %i0
	ld [%fp+1491], %i1
	add %i1, %i0, %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %i4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1355]
	ld [%fp+1855], %i0
	ld [%fp+1483], %i1
	add %i1, %i0, %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1491]
	ld [%fp+1879], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1411]
	ld [%fp+1867], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+1435]
	ld [%fp+1891], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	mov	%g5, %l0
	st %i0, [%fp+1695]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1427]
	ld [%fp+1987], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %o5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1415]
	ld [%fp+2019], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	ld [%fp+1779], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	add %g3, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %l7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o7
	st %o7, [%fp+1423]
	ld [%fp+1999], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %l6, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1419]
	ld [%fp+1767], %i0
	ld [%fp+1475], %i1
	add %i1, %i0, %i0
	ld [%fp+1459], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %o2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+1447]
	ld [%fp+1899], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	ld [%fp+1463], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %o0, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1451]
	ld [%fp+1771], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	ld [%fp+1467], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1623]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+1455]
	ld [%fp+1907], %i0
	ld [%fp+1495], %i1
	add %i1, %i0, %i0
	ld [%fp+1471], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1751]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1499]
	ld [%fp+1547], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1759]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+1443]
	ld [%fp+1551], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1383], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l4
	ld [%fp+1391], %l3
	ld [%fp+1559], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1431]
	ld [%fp+1355], %l7
	ld [%fp+1543], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1559]
	ld [%fp+1371], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1399]
	ld [%fp+1539], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	ld [%fp+1531], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o3
	ld [%fp+1535], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1527], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1535]
	xor %i0, %l0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o4
	ld [%fp+1607], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1395], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l5
	ld [%fp+1711], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1523]
	mov	%o1, %l0
	ld [%fp+1515], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o5
	ld [%fp+1743], %i1
	add %o7, %i1, %i0
	st %i0, [%fp+1527]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	ld [%fp+1719], %i2
	add %i3, %i2, %i0
	st %i0, [%fp+1711]
	ld [%fp+1403], %i2
	xor %i0, %i2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1403]
	ld [%fp+1591], %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %l2, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i5
	st %i5, [%fp+1383]
	ld [%fp+1615], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %g3, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1407]
	ld [%fp+1735], %i2
	add %o2, %i2, %i0
	st %i0, [%fp+1615]
	xor %i0, %g5, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1467]
	ld [%fp+1727], %i2
	add %i4, %i2, %i0
	st %i0, [%fp+1515]
	xor %i0, %l1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %g3
	st %g3, [%fp+1395]
	ld [%fp+1783], %i2
	ld [%fp+1507], %i0
	add %i0, %i2, %i2
	add %g2, %i2, %i0
	st %i0, [%fp+1719]
	ld [%fp+1503], %i2
	xor %i0, %i2, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1483]
	ld [%fp+2039], %i2
	ld [%fp+1671], %i3
	add %i3, %i2, %i2
	mov	%l4, %g5
	add %l4, %i2, %i2
	st %i2, [%fp+1503]
	ld [%fp+1487], %i3
	xor %i2, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %o2
	st %o2, [%fp+1471]
	ld [%fp+1927], %i2
	ld [%fp+1703], %i3
	add %i3, %i2, %i2
	ld [%fp+1431], %l4
	add %l4, %i2, %o7
	xor %o7, %l3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o1
	st %o1, [%fp+1475]
	ld [%fp+1971], %i2
	ld [%fp+1663], %i3
	add %i3, %i2, %i3
	ld [%fp+1399], %l1
	add %l1, %i3, %i2
	st %i2, [%fp+1671]
	xor %i2, %l7, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o0
	st %o0, [%fp+1479]
	ld [%fp+2031], %i2
	ld [%fp+1567], %i3
	add %i3, %i2, %i3
	add %l6, %i3, %i2
	st %i2, [%fp+1567]
	mov	%l6, %l3
	ld [%fp+1491], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l2
	ld [%fp+2035], %i2
	ld [%fp+1599], %i3
	add %i3, %i2, %i3
	mov	%o3, %g4
	add %o3, %i3, %i2
	st %i2, [%fp+1599]
	ld [%fp+1411], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1459]
	ld [%fp+1939], %i2
	ld [%fp+1655], %i3
	add %i3, %i2, %i3
	ld [%fp+1439], %o3
	add %o3, %i3, %i2
	st %i2, [%fp+1491]
	ld [%fp+1435], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1435]
	ld [%fp+2023], %i2
	ld [%fp+1695], %i3
	add %i3, %i2, %i3
	add %o4, %i3, %i2
	st %i2, [%fp+1695]
	ld [%fp+1427], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1427]
	ld [%fp+1919], %i2
	ld [%fp+1631], %i3
	add %i3, %i2, %i3
	mov	%l5, %l7
	add %l5, %i3, %i2
	st %i2, [%fp+1655]
	ld [%fp+1415], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1411]
	ld [%fp+1951], %i2
	ld [%fp+1687], %i3
	add %i3, %i2, %i3
	add %o5, %i3, %i2
	st %i2, [%fp+1687]
	xor %i2, %l0, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1415]
	ld [%fp+1903], %i2
	ld [%fp+1575], %i3
	add %i3, %i2, %i3
	add %i1, %i3, %i2
	st %i2, [%fp+1487]
	ld [%fp+1423], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1423]
	ld [%fp+1935], %i2
	ld [%fp+1647], %i3
	add %i3, %i2, %i3
	ld [%fp+1403], %l0
	add %l0, %i3, %i2
	st %i2, [%fp+1647]
	ld [%fp+1419], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1419]
	ld [%fp+1791], %i2
	ld [%fp+1583], %i3
	add %i3, %i2, %i3
	add %i5, %i3, %i2
	st %i2, [%fp+1663]
	ld [%fp+1447], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1367]
	ld [%fp+1811], %i2
	ld [%fp+1679], %i3
	add %i3, %i2, %i3
	ld [%fp+1407], %g2
	add %g2, %i3, %i2
	st %i2, [%fp+1507]
	ld [%fp+1451], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1391]
	ld [%fp+1775], %i2
	ld [%fp+1623], %i3
	add %i3, %i2, %i3
	ld [%fp+1467], %i5
	add %i5, %i3, %i2
	st %i2, [%fp+1495]
	ld [%fp+1455], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1447]
	ld [%fp+1823], %i2
	ld [%fp+1751], %i3
	add %i3, %i2, %i3
	add %g3, %i3, %i2
	st %i2, [%fp+1583]
	ld [%fp+1499], %i3
	xor %i2, %i3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+1347]
	ld [%fp+1759], %i2
	add %i0, %i2, %i2
	st %i2, [%fp+1759]
	ld [%fp+1443], %i0
	xor %i2, %i0, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l6
	st %l6, [%fp+1451]
	ld [%fp+1547], %i0
	add %o2, %i0, %i2
	st %i2, [%fp+1735]
	xor %i2, %g5, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l5
	st %l5, [%fp+1455]
	ld [%fp+1551], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %l4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o1
	st %o1, [%fp+1387]
	ld [%fp+1559], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %l1, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l4
	st %l4, [%fp+1375]
	ld [%fp+1539], %i0
	add %l2, %i0, %i2
	mov	%l2, %o0
	st %i2, [%fp+1751]
	xor %i2, %l3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l3
	st %l3, [%fp+1359]
	ld [%fp+1543], %i0
	ld [%fp+1459], %o2
	add %o2, %i0, %i2
	st %i2, [%fp+1743]
	xor %i2, %g4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1463]
	ld [%fp+1531], %i0
	ld [%fp+1435], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %o3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1355]
	ld [%fp+1535], %i0
	ld [%fp+1427], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %o4, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+1363]
	ld [%fp+1519], %i0
	ld [%fp+1411], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1547]
	xor %i0, %l7, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %i0
	st %i0, [%fp+1351]
	ld [%fp+1523], %i0
	ld [%fp+1415], %o4
	add %o4, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %o5, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %i0
	st %i0, [%fp+1371]
	ld [%fp+1527], %i0
	ld [%fp+1423], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1379]
	ld [%fp+1711], %i0
	ld [%fp+1419], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %l0, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+1443]
	ld [%fp+1591], %i0
	ld [%fp+1367], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1383], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i2
	st %i2, [%fp+1523]
	ld [%fp+1511], %i0
	ld [%fp+1391], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1543]
	xor %i0, %g2, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %l7
	st %l7, [%fp+1519]
	ld [%fp+1615], %i0
	ld [%fp+1447], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %i5, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %i1
	st %i1, [%fp+1511]
	ld [%fp+1515], %i0
	ld [%fp+1347], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1395], %i3
	xor %i0, %i3, %i5
	srl %i5, 7, %i0
	sll %i5, 25, %i5
	or %i5, %i0, %i5
	st %i5, [%fp+1515]
	ld [%fp+1859], %i0
	add %o7, %i0, %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1499]
	xor %i0, %o0, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i3
	st %i3, [%fp+1467]
	ld [%fp+1883], %i0
	ld [%fp+1671], %i2
	add %i2, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1671]
	xor %i0, %o2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o0
	st %o0, [%fp+1431]
	ld [%fp+1871], %i0
	ld [%fp+1719], %i2
	add %i2, %i0, %i0
	add %i1, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %g3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1383]
	ld [%fp+1895], %i0
	ld [%fp+1503], %i2
	add %i2, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1631]
	xor %i0, %o3, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o2
	st %o2, [%fp+1399]
	ld [%fp+1807], %i0
	ld [%fp+1491], %i2
	add %i2, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %g5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o3
	st %o3, [%fp+1395]
	ld [%fp+1839], %i0
	ld [%fp+1695], %i2
	add %i2, %i0, %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %o4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o4
	st %o4, [%fp+1403]
	ld [%fp+1795], %i0
	ld [%fp+1567], %i2
	add %i2, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %l1, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l5
	st %l5, [%fp+1439]
	ld [%fp+1827], %i0
	ld [%fp+1599], %i2
	add %i2, %i0, %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1679]
	xor %i0, %g4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l6
	st %l6, [%fp+1459]
	ld [%fp+1803], %i0
	ld [%fp+1487], %i2
	add %i2, %i0, %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1615]
	xor %i0, %o5, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o1
	st %o1, [%fp+1411]
	ld [%fp+1835], %i0
	ld [%fp+1647], %i2
	add %i2, %i0, %i0
	ld [%fp+1463], %o7
	add %o7, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %l0, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l7
	st %l7, [%fp+1415]
	ld [%fp+1819], %i0
	ld [%fp+1655], %i2
	add %i2, %i0, %i0
	ld [%fp+1355], %l1
	add %l1, %i0, %i0
	st %i0, [%fp+1599]
	xor %i0, %l2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l4
	st %l4, [%fp+1407]
	ld [%fp+1847], %i0
	ld [%fp+1687], %i2
	add %i2, %i0, %i0
	ld [%fp+1363], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %i4, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l2
	st %l2, [%fp+1435]
	ld [%fp+1815], %i0
	ld [%fp+1495], %i2
	add %i2, %i0, %i0
	ld [%fp+1351], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1483], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %i4
	st %i4, [%fp+1419]
	ld [%fp+1843], %i0
	ld [%fp+1583], %i2
	add %i2, %i0, %i0
	ld [%fp+1371], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1711]
	ld [%fp+1471], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %o5
	st %o5, [%fp+1427]
	ld [%fp+1799], %i0
	ld [%fp+1663], %i2
	add %i2, %i0, %i0
	ld [%fp+1379], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1475], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %l3
	st %l3, [%fp+1423]
	ld [%fp+1831], %i0
	ld [%fp+1507], %i2
	add %i2, %i0, %i0
	ld [%fp+1443], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1663]
	ld [%fp+1479], %i2
	xor %i0, %i2, %i0
	sll %i0, 16, %g2
	srl %i0, 16, %i0
	or %i0, %g2, %g2
	ld [%fp+1527], %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1471]
	ld [%fp+1559], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1559]
	ld [%fp+1519], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1447]
	ld [%fp+1383], %o0
	ld [%fp+1547], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1391]
	ld [%fp+1551], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o2
	ld [%fp+1531], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o3
	ld [%fp+1535], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o4
	ld [%fp+1539], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l5
	ld [%fp+1543], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1375], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	ld [%fp+1607], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1359], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1387]
	ld [%fp+1727], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1607]
	xor %i0, %o7, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1451]
	ld [%fp+1759], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1519]
	xor %i0, %l1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	ld [%fp+1735], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1523]
	xor %i0, %l0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	ld [%fp+1575], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %g4, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g4
	ld [%fp+1703], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %g5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g5
	st %g5, [%fp+1347]
	ld [%fp+1751], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1515]
	xor %i0, %g3, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l1
	ld [%fp+1743], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1503]
	mov	%g2, %g3
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1443]
	ld [%fp+1851], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1703]
	ld [%fp+1467], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1455]
	ld [%fp+1875], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	ld [%fp+1447], %l7
	add %l7, %i0, %i0
	st %i0, [%fp+1491]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1759]
	ld [%fp+1863], %i0
	ld [%fp+1719], %i1
	add %i1, %i0, %i0
	ld [%fp+1391], %g2
	add %g2, %i0, %i0
	st %i0, [%fp+1487]
	xor %i0, %o0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o7
	st %o7, [%fp+1431]
	ld [%fp+1887], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1483]
	ld [%fp+1399], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1375]
	ld [%fp+1867], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	mov	%o3, %o0
	add %o3, %i0, %i0
	st %i0, [%fp+1591]
	ld [%fp+1395], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1751]
	ld [%fp+1891], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	mov	%o4, %o3
	add %o4, %i0, %i0
	st %i0, [%fp+1623]
	ld [%fp+1403], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1403]
	ld [%fp+1855], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	mov	%l5, %o4
	add %l5, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1359]
	ld [%fp+1879], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	mov	%l6, %l3
	add %l6, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1459], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1367]
	ld [%fp+1915], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i0
	ld [%fp+1387], %l6
	add %l6, %i0, %i0
	st %i0, [%fp+1615]
	ld [%fp+1411], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+1411]
	ld [%fp+1947], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	ld [%fp+1451], %l4
	add %l4, %i0, %i0
	st %i0, [%fp+1495]
	ld [%fp+1415], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1351]
	ld [%fp+1931], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	mov	%o1, %l2
	add %o1, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1415]
	ld [%fp+1959], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1687]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1435]
	ld [%fp+1919], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1655]
	ld [%fp+1951], %i0
	ld [%fp+1711], %i1
	add %i1, %i0, %i1
	add %g5, %i1, %i0
	st %i0, [%fp+1499]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1695]
	ld [%fp+1903], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i2
	add %l1, %i2, %i0
	st %i0, [%fp+1475]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i0
	st %i0, [%fp+1439]
	ld [%fp+1935], %i0
	ld [%fp+1663], %i1
	add %i1, %i0, %i3
	ld [%fp+1443], %i1
	add %i1, %i3, %i0
	st %i0, [%fp+1479]
	xor %i0, %g3, %i3
	srl %i3, 8, %g5
	sll %i3, 24, %i3
	or %i3, %g5, %i0
	st %i0, [%fp+1427]
	ld [%fp+1567], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1743]
	ld [%fp+1471], %i2
	xor %i0, %i2, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %i0
	st %i0, [%fp+1459]
	ld [%fp+1559], %i0
	ld [%fp+1759], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %l7, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %i0
	st %i0, [%fp+1463]
	ld [%fp+1547], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1583]
	xor %i0, %g2, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %i0
	st %i0, [%fp+1467]
	ld [%fp+1551], %i0
	ld [%fp+1375], %o7
	add %o7, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %o2, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %i0
	st %i0, [%fp+1471]
	ld [%fp+1531], %i0
	ld [%fp+1751], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %o0, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %i2
	st %i2, [%fp+1547]
	ld [%fp+1535], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %o3, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %o3
	st %o3, [%fp+1371]
	ld [%fp+1539], %i0
	ld [%fp+1359], %l7
	add %l7, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %o4, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %o5
	st %o5, [%fp+1539]
	ld [%fp+1543], %i0
	ld [%fp+1367], %o2
	add %o2, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %l3, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %i3
	st %i3, [%fp+1355]
	ld [%fp+1527], %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %l6, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %i5
	st %i5, [%fp+1391]
	ld [%fp+1607], %i0
	ld [%fp+1351], %o4
	add %o4, %i0, %i0
	st %i0, [%fp+1543]
	xor %i0, %l4, %i4
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %i4
	st %i4, [%fp+1379]
	ld [%fp+1519], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1567]
	xor %i0, %l2, %g3
	srl %g3, 7, %g5
	sll %g3, 25, %g3
	or %g3, %g5, %l6
	st %l6, [%fp+1519]
	ld [%fp+1523], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1551]
	xor %i0, %l0, %g3
	srl %g3, 7, %o0
	sll %g3, 25, %g3
	or %g3, %o0, %l0
	st %l0, [%fp+1363]
	ld [%fp+1507], %i0
	ld [%fp+1655], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+1535]
	xor %i0, %g4, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %g5
	st %g5, [%fp+1523]
	ld [%fp+1511], %i0
	ld [%fp+1695], %l4
	add %l4, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1347], %g2
	xor %i0, %g2, %g3
	srl %g3, 7, %g4
	sll %g3, 25, %g3
	or %g3, %g4, %o1
	st %o1, [%fp+1511]
	ld [%fp+1515], %i0
	ld [%fp+1439], %l3
	add %l3, %i0, %o0
	xor %o0, %l1, %g4
	srl %g4, 7, %i0
	sll %g4, 25, %g4
	or %g4, %i0, %g2
	st %g2, [%fp+1515]
	ld [%fp+1503], %i0
	ld [%fp+1427], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1531]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+1503]
	ld [%fp+1923], %i0
	ld [%fp+1487], %i1
	add %i1, %i0, %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %l2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i2
	ld [%fp+1955], %i0
	ld [%fp+1483], %i1
	add %i1, %i0, %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1655]
	xor %i0, %l4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l4
	st %l4, [%fp+1487]
	ld [%fp+1911], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1647]
	xor %i0, %l3, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+1387]
	ld [%fp+1943], %i0
	ld [%fp+1491], %i1
	add %i1, %i0, %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %g4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l1
	st %l1, [%fp+1491]
	ld [%fp+1779], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+1383]
	ld [%fp+1999], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1703]
	ld [%fp+1759], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+1395]
	ld [%fp+1987], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1759]
	ld [%fp+1431], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+1399]
	ld [%fp+2019], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1623]
	xor %i0, %o7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1407]
	ld [%fp+1783], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1751], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1419]
	ld [%fp+2039], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1751]
	ld [%fp+1403], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1439]
	ld [%fp+1927], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1599]
	xor %i0, %l7, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1423]
	ld [%fp+1971], %i0
	ld [%fp+1495], %i1
	add %i1, %i0, %i0
	add %g3, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %o2, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1427]
	ld [%fp+1791], %i0
	ld [%fp+1475], %i1
	add %i1, %i0, %i0
	ld [%fp+1459], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1615]
	ld [%fp+1411], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+1447]
	ld [%fp+1811], %i0
	ld [%fp+1479], %i1
	add %i1, %i0, %i0
	ld [%fp+1463], %g2
	add %g2, %i0, %i0
	st %i0, [%fp+1591]
	xor %i0, %o4, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1451]
	ld [%fp+1775], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	ld [%fp+1467], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1415], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o7
	st %o7, [%fp+1455]
	ld [%fp+1823], %i0
	ld [%fp+1499], %i1
	add %i1, %i0, %i0
	ld [%fp+1471], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1607]
	ld [%fp+1435], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g3
	ld [%fp+1567], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1547], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1435]
	ld [%fp+1551], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1547]
	ld [%fp+1371], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g5
	ld [%fp+1559], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+1551]
	ld [%fp+1539], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l4
	ld [%fp+1543], %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1559]
	ld [%fp+1355], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l1
	add %l2, %o0, %i0
	st %i0, [%fp+1539]
	ld [%fp+1391], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o0
	ld [%fp+1531], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1543]
	ld [%fp+1379], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1431]
	ld [%fp+1535], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1531]
	ld [%fp+1519], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g4
	ld [%fp+1527], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1535]
	ld [%fp+1363], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1415]
	ld [%fp+1583], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1523], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1411]
	ld [%fp+1711], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1523]
	ld [%fp+1511], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1443]
	ld [%fp+1743], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1527]
	ld [%fp+1515], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+1379]
	ld [%fp+1719], %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1583]
	ld [%fp+1503], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+1375]
	ld [%fp+1575], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1575]
	xor %i0, %l0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+1403]
	ld [%fp+1663], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1663]
	xor %i0, %g2, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1367]
	ld [%fp+1735], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+1511]
	xor %i0, %i4, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1359]
	ld [%fp+1727], %i0
	add %g3, %i0, %i0
	st %i0, [%fp+1515]
	mov	%g3, %o7
	xor %i0, %i5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1459]
	ld [%fp+1939], %i0
	ld [%fp+1507], %i1
	add %i1, %i0, %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1507]
	xor %i0, %i2, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+1503]
	ld [%fp+2023], %i0
	ld [%fp+1655], %i1
	add %i1, %i0, %i0
	mov	%g5, %l3
	add %g5, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1487], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+1483]
	ld [%fp+2031], %i0
	ld [%fp+1647], %i1
	add %i1, %i0, %i0
	mov	%l4, %g5
	add %l4, %i0, %i0
	st %i0, [%fp+1647]
	ld [%fp+1387], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+1487]
	ld [%fp+2035], %i0
	ld [%fp+1695], %i1
	add %i1, %i0, %i0
	mov	%l1, %l5
	add %l1, %i0, %i0
	st %i0, [%fp+1499]
	ld [%fp+1491], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o3
	st %o3, [%fp+1491]
	ld [%fp+1963], %i0
	ld [%fp+1631], %i1
	add %i1, %i0, %i0
	mov	%o0, %l4
	add %o0, %i0, %i0
	st %i0, [%fp+1631]
	ld [%fp+1383], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o0
	st %o0, [%fp+1387]
	ld [%fp+1991], %i0
	ld [%fp+1703], %i1
	add %i1, %i0, %i0
	ld [%fp+1431], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1495]
	ld [%fp+1395], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+1363]
	ld [%fp+1975], %i0
	ld [%fp+1759], %i1
	add %i1, %i0, %i0
	mov	%g4, %l1
	add %g4, %i0, %i0
	st %i0, [%fp+1475]
	ld [%fp+1399], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o4
	st %o4, [%fp+1355]
	ld [%fp+2011], %i0
	ld [%fp+1623], %i1
	add %i1, %i0, %i0
	ld [%fp+1415], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1623]
	ld [%fp+1407], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1407]
	ld [%fp+1771], %i0
	ld [%fp+1679], %i1
	add %i1, %i0, %i0
	ld [%fp+1411], %g4
	add %g4, %i0, %i0
	st %i0, [%fp+1479]
	ld [%fp+1419], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1419]
	ld [%fp+1907], %i0
	ld [%fp+1751], %i1
	add %i1, %i0, %i0
	ld [%fp+1443], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1471]
	ld [%fp+1439], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1439]
	ld [%fp+1767], %i0
	ld [%fp+1599], %i1
	add %i1, %i0, %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1467]
	ld [%fp+1423], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1423]
	ld [%fp+1899], %i0
	ld [%fp+1687], %i1
	add %i1, %i0, %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1463]
	ld [%fp+1427], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1427]
	ld [%fp+1967], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %i0
	add %o2, %i0, %i0
	st %i0, [%fp+1679]
	ld [%fp+1447], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+1351]
	ld [%fp+1995], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1615]
	ld [%fp+1451], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+1347]
	ld [%fp+1983], %i0
	ld [%fp+1671], %i1
	add %i1, %i0, %i0
	add %o1, %i0, %i0
	st %i0, [%fp+1671]
	ld [%fp+1455], %i1
	xor %i0, %i1, %i0
	srl %i0, 8, %l2
	sll %i0, 24, %i0
	or %i0, %l2, %i0
	st %i0, [%fp+1447]
	ld [%fp+2015], %i0
	ld [%fp+1607], %i1
	add %i1, %i0, %i0
	ld [%fp+1459], %i1
	add %i1, %i0, %o2
	xor %o2, %o7, %l2
	srl %l2, 8, %o1
	sll %l2, 24, %l2
	or %l2, %o1, %i0
	st %i0, [%fp+1399]
	ld [%fp+1567], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1743]
	ld [%fp+1435], %i2
	xor %i0, %i2, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %i0
	st %i0, [%fp+1451]
	ld [%fp+1547], %i0
	add %i3, %i0, %i0
	st %i0, [%fp+1719]
	xor %i0, %l3, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %i0
	st %i0, [%fp+1435]
	ld [%fp+1551], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1695]
	xor %i0, %g5, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %i0
	st %i0, [%fp+1395]
	ld [%fp+1559], %i0
	add %o3, %i0, %i0
	st %i0, [%fp+1711]
	xor %i0, %l5, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %i0
	st %i0, [%fp+1391]
	ld [%fp+1539], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1735]
	xor %i0, %l4, %g5
	srl %g5, 7, %l2
	sll %g5, 25, %g5
	or %g5, %l2, %i0
	st %i0, [%fp+1371]
	ld [%fp+1543], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1727]
	xor %i0, %l0, %g5
	srl %g5, 7, %l2
	sll %g5, 25, %g5
	or %g5, %l2, %i0
	st %i0, [%fp+1751]
	ld [%fp+1531], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1687]
	xor %i0, %l1, %g5
	srl %g5, 7, %l2
	sll %g5, 25, %g5
	or %g5, %l2, %i0
	st %i0, [%fp+1759]
	ld [%fp+1535], %i0
	ld [%fp+1407], %o3
	add %o3, %i0, %i0
	st %i0, [%fp+1703]
	xor %i0, %g3, %g5
	srl %g5, 7, %l2
	sll %g5, 25, %g5
	or %g5, %l2, %i0
	st %i0, [%fp+1383]
	ld [%fp+1519], %i0
	ld [%fp+1419], %o5
	add %o5, %i0, %i0
	st %i0, [%fp+1567]
	xor %i0, %g4, %g5
	srl %g5, 7, %l2
	sll %g5, 25, %g5
	or %g5, %l2, %o7
	ld [%fp+1523], %i0
	ld [%fp+1439], %l4
	add %l4, %i0, %i0
	st %i0, [%fp+1559]
	xor %i0, %i5, %g5
	srl %g5, 7, %l2
	sll %g5, 25, %g5
	or %g5, %l2, %i0
	st %i0, [%fp+1411]
	ld [%fp+1527], %i0
	ld [%fp+1423], %l0
	add %l0, %i0, %i0
	st %i0, [%fp+1455]
	ld [%fp+1379], %i2
	xor %i0, %i2, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %i0
	st %i0, [%fp+1415]
	ld [%fp+1583], %i0
	ld [%fp+1427], %l3
	add %l3, %i0, %i0
	st %i0, [%fp+1519]
	ld [%fp+1375], %i2
	xor %i0, %i2, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %i0
	st %i0, [%fp+1431]
	ld [%fp+1575], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+1607]
	ld [%fp+1403], %i2
	xor %i0, %i2, %l2
	srl %l2, 7, %l6
	sll %l2, 25, %l2
	or %l2, %l6, %g4
	st %g4, [%fp+1443]
	ld [%fp+1663], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1599]
	ld [%fp+1367], %i2
	xor %i0, %i2, %l6
	srl %l6, 7, %l7
	sll %l6, 25, %l6
	or %l6, %l7, %l7
	st %l7, [%fp+1379]
	ld [%fp+1511], %i0
	ld [%fp+1447], %g5
	add %g5, %i0, %i0
	st %i0, [%fp+1511]
	ld [%fp+1359], %i2
	xor %i0, %i2, %l6
	srl %l6, 7, %o1
	sll %l6, 25, %l6
	or %l6, %o1, %o1
	st %o1, [%fp+1403]
	ld [%fp+1515], %i0
	ld [%fp+1399], %o0
	add %o0, %i0, %i0
	st %i0, [%fp+1527]
	xor %i0, %i1, %l6
	srl %l6, 7, %i0
	sll %l6, 25, %l6
	or %l6, %i0, %g2
	st %g2, [%fp+1459]
	ld [%fp+1807], %i0
	ld [%fp+1507], %i1
	add %i1, %i0, %i0
	ld [%fp+1839], %i1
	ld [%fp+1655], %i2
	add %i2, %i1, %l1
	ld [%fp+1795], %i1
	ld [%fp+1647], %i2
	add %i2, %i1, %l5
	ld [%fp+1827], %i1
	ld [%fp+1499], %i2
	add %i2, %i1, %o4
	ld [%fp+1855], %i1
	ld [%fp+1631], %i2
	add %i2, %i1, %l2
	ld [%fp+1879], %i1
	ld [%fp+1495], %i2
	add %i2, %i1, %l6
	ld [%fp+1867], %i1
	ld [%fp+1475], %i2
	add %i2, %i1, %i1
	ld [%fp+1891], %i2
	ld [%fp+1623], %i3
	add %i3, %i2, %i2
	ld [%fp+1919], %i5
	ld [%fp+1479], %i3
	add %i3, %i5, %i3
	st %i3, [%fp+1891]
	ld [%fp+1951], %i5
	ld [%fp+1471], %i3
	add %i3, %i5, %i3
	st %i3, [%fp+1867]
	ld [%fp+1903], %i5
	ld [%fp+1467], %i3
	add %i3, %i5, %i3
	st %i3, [%fp+1879]
	ld [%fp+1935], %g3
	ld [%fp+1463], %i3
	add %i3, %g3, %i3
	st %i3, [%fp+1855]
	ld [%fp+1803], %g3
	ld [%fp+1679], %i3
	add %i3, %g3, %i3
	st %i3, [%fp+1903]
	ld [%fp+1835], %g3
	ld [%fp+1615], %i3
	add %i3, %g3, %i3
	st %i3, [%fp+1919]
	ld [%fp+1819], %i4
	ld [%fp+1671], %i3
	add %i3, %i4, %g3
	ld [%fp+1847], %i3
	add %o2, %i3, %i3
	st %i3, [%fp+1935]
	add %g4, %l5, %i3
	st %i3, [%fp+1663]
	ld [%fp+1387], %i4
	xor %i3, %i4, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %o2
	st %o2, [%fp+1523]
	add %l7, %o4, %i3
	st %i3, [%fp+1671]
	ld [%fp+1363], %i4
	xor %i3, %i4, %i3
	sll %i3, 16, %i4
	srl %i3, 16, %i3
	or %i3, %i4, %o4
	st %o4, [%fp+1515]
	add %o1, %i0, %i0
	st %i0, [%fp+1655]
	ld [%fp+1355], %i3
	xor %i0, %i3, %i0
	sll %i0, 16, %i3
	srl %i0, 16, %i0
	or %i0, %i3, %l7
	st %l7, [%fp+1507]
	add %g2, %l1, %i0
	st %i0, [%fp+1647]
	xor %i0, %o3, %i0
	sll %i0, 16, %i3
	srl %i0, 16, %i0
	or %i0, %i3, %i3
	st %i3, [%fp+1499]
	ld [%fp+1451], %i5
	add %i5, %i1, %i0
	st %i0, [%fp+1631]
	xor %i0, %o5, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o5
	ld [%fp+1435], %o1
	add %o1, %i2, %i0
	st %i0, [%fp+1623]
	xor %i0, %l4, %i1
	sll %i1, 16, %i2
	srl %i1, 16, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+1495]
	ld [%fp+1395], %o3
	add %o3, %l2, %i1
	st %i1, [%fp+1615]
	xor %i1, %l0, %i1
	sll %i1, 16, %i2
	srl %i1, 16, %i1
	or %i1, %i2, %l5
	st %l5, [%fp+1479]
	ld [%fp+1391], %l1
	add %l1, %l6, %i1
	st %i1, [%fp+1591]
	xor %i1, %l3, %i1
	sll %i1, 16, %i2
	srl %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+1951]
	ld [%fp+1371], %l2
	ld [%fp+1879], %i1
	add %l2, %i1, %i1
	st %i1, [%fp+1583]
	ld [%fp+1351], %i2
	xor %i1, %i2, %i1
	sll %i1, 16, %i2
	srl %i1, 16, %i1
	or %i1, %i2, %l6
	st %l6, [%fp+1475]
	ld [%fp+1751], %i1
	ld [%fp+1855], %i2
	add %i1, %i2, %i1
	st %i1, [%fp+1575]
	ld [%fp+1347], %i2
	xor %i1, %i2, %i1
	sll %i1, 16, %i4
	srl %i1, 16, %i1
	or %i1, %i4, %l0
	st %l0, [%fp+1471]
	ld [%fp+1759], %i1
	ld [%fp+1891], %i2
	add %i1, %i2, %i1
	st %i1, [%fp+1551]
	xor %i1, %g5, %i1
	sll %i1, 16, %g2
	srl %i1, 16, %i1
	or %i1, %g2, %i4
	st %i4, [%fp+1467]
	ld [%fp+1383], %l3
	ld [%fp+1867], %i1
	add %l3, %i1, %i1
	st %i1, [%fp+1543]
	xor %i1, %o0, %i1
	sll %i1, 16, %g2
	srl %i1, 16, %i1
	or %i1, %g2, %i1
	st %i1, [%fp+1867]
	add %o7, %g3, %i2
	st %i2, [%fp+1535]
	ld [%fp+1503], %i1
	xor %i2, %i1, %i1
	sll %i1, 16, %g2
	srl %i1, 16, %i1
	or %i1, %g2, %i2
	st %i2, [%fp+1503]
	ld [%fp+1411], %l4
	ld [%fp+1935], %i1
	add %l4, %i1, %g2
	st %g2, [%fp+1547]
	ld [%fp+1483], %i1
	xor %g2, %i1, %i1
	sll %i1, 16, %g2
	srl %i1, 16, %i1
	or %i1, %g2, %i1
	st %i1, [%fp+1935]
	ld [%fp+1415], %i1
	ld [%fp+1903], %g2
	add %i1, %g2, %g3
	st %g3, [%fp+1539]
	ld [%fp+1487], %g2
	xor %g3, %g2, %g2
	sll %g2, 16, %g4
	srl %g2, 16, %g2
	or %g2, %g4, %g2
	st %g2, [%fp+1891]
	ld [%fp+1431], %g4
	ld [%fp+1919], %g2
	add %g4, %g2, %g3
	st %g3, [%fp+1531]
	ld [%fp+1491], %g2
	xor %g3, %g2, %g2
	sll %g2, 16, %g3
	srl %g2, 16, %g2
	or %g2, %g3, %g5
	ld [%fp+1455], %g2
	add %o2, %g2, %g2
	st %g2, [%fp+1679]
	ld [%fp+1443], %g3
	xor %g2, %g3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %g2
	st %g2, [%fp+1487]
	ld [%fp+1519], %g2
	add %o4, %g2, %g2
	st %g2, [%fp+1807]
	ld [%fp+1379], %g3
	xor %g2, %g3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %g2
	st %g2, [%fp+1519]
	ld [%fp+1567], %g2
	add %l7, %g2, %g2
	st %g2, [%fp+1827]
	ld [%fp+1403], %g3
	xor %g2, %g3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %g2
	st %g2, [%fp+1567]
	ld [%fp+1559], %g2
	add %i3, %g2, %g2
	st %g2, [%fp+1835]
	ld [%fp+1459], %i3
	xor %g2, %i3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i3
	st %i3, [%fp+1559]
	mov	%o5, %o2
	ld [%fp+1511], %i3
	add %o5, %i3, %i3
	st %i3, [%fp+1819]
	xor %i3, %i5, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i3
	st %i3, [%fp+1919]
	ld [%fp+1527], %i3
	add %i0, %i3, %i3
	st %i3, [%fp+1839]
	xor %i3, %o1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1527]
	ld [%fp+1607], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+1847]
	xor %i0, %o3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1511]
	ld [%fp+1951], %i0
	ld [%fp+1599], %i3
	add %i0, %i3, %i0
	st %i0, [%fp+1855]
	xor %i0, %l1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1491]
	ld [%fp+1695], %g2
	add %l6, %g2, %i0
	st %i0, [%fp+1803]
	xor %i0, %l2, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %o5
	st %o5, [%fp+1451]
	ld [%fp+1711], %g2
	add %l0, %g2, %i0
	st %i0, [%fp+1795]
	ld [%fp+1751], %i3
	xor %i0, %i3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %o3
	st %o3, [%fp+1463]
	ld [%fp+1743], %g2
	add %i4, %g2, %i0
	st %i0, [%fp+1751]
	ld [%fp+1759], %i3
	xor %i0, %i3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %o0
	st %o0, [%fp+1447]
	ld [%fp+1719], %g2
	ld [%fp+1867], %i0
	add %i0, %g2, %i0
	st %i0, [%fp+1759]
	xor %i0, %l3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %l7
	st %l7, [%fp+1459]
	ld [%fp+1687], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1743]
	xor %i0, %o7, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1903]
	ld [%fp+1703], %g2
	ld [%fp+1935], %i0
	add %i0, %g2, %i0
	st %i0, [%fp+1719]
	xor %i0, %l4, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %l4
	st %l4, [%fp+1455]
	ld [%fp+1735], %g2
	ld [%fp+1891], %i0
	add %i0, %g2, %i0
	st %i0, [%fp+1735]
	xor %i0, %i1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %l2
	st %l2, [%fp+1483]
	ld [%fp+1727], %g2
	mov	%g5, %l5
	add %g5, %g2, %i0
	st %i0, [%fp+1727]
	xor %i0, %g4, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+1879]
	ld [%fp+1799], %g2
	ld [%fp+1663], %i0
	add %i0, %g2, %g4
	ld [%fp+1831], %g2
	ld [%fp+1671], %i0
	add %i0, %g2, %g5
	ld [%fp+1815], %g2
	ld [%fp+1655], %i0
	add %i0, %g2, %l0
	ld [%fp+1843], %g2
	ld [%fp+1647], %i0
	add %i0, %g2, %i4
	ld [%fp+1987], %g2
	ld [%fp+1631], %i0
	add %i0, %g2, %g3
	ld [%fp+2019], %g2
	ld [%fp+1623], %i0
	add %i0, %g2, %o7
	ld [%fp+1779], %i0
	ld [%fp+1615], %i1
	add %i1, %i0, %o4
	ld [%fp+1999], %i0
	ld [%fp+1591], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1779]
	ld [%fp+1859], %i0
	ld [%fp+1583], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1711]
	ld [%fp+1883], %i0
	ld [%fp+1575], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1799]
	ld [%fp+1871], %i0
	ld [%fp+1551], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1843]
	ld [%fp+1895], %i0
	ld [%fp+1543], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1883]
	ld [%fp+1771], %i0
	ld [%fp+1535], %i1
	add %i1, %i0, %i0
	ld [%fp+1907], %i2
	ld [%fp+1547], %i1
	add %i1, %i2, %i1
	st %i1, [%fp+1895]
	ld [%fp+1767], %i2
	ld [%fp+1539], %i1
	add %i1, %i2, %i1
	st %i1, [%fp+1907]
	ld [%fp+1899], %i2
	ld [%fp+1531], %i1
	add %i1, %i2, %i1
	st %i1, [%fp+1899]
	ld [%fp+1487], %o1
	add %o1, %g4, %i1
	st %i1, [%fp+1987]
	ld [%fp+1523], %i2
	xor %i1, %i2, %g4
	srl %g4, 8, %l1
	sll %g4, 24, %g4
	or %g4, %l1, %i1
	st %i1, [%fp+1687]
	ld [%fp+1519], %i3
	add %i3, %g5, %i2
	st %i2, [%fp+1871]
	ld [%fp+1515], %i5
	xor %i2, %i5, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i5
	st %i5, [%fp+1607]
	ld [%fp+1567], %g2
	add %g2, %l0, %i2
	st %i2, [%fp+1859]
	ld [%fp+1507], %g4
	xor %i2, %g4, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i2
	st %i2, [%fp+1583]
	ld [%fp+1559], %l1
	add %l1, %i4, %i4
	st %i4, [%fp+1831]
	ld [%fp+1499], %g4
	xor %i4, %g4, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %l6
	st %l6, [%fp+1547]
	ld [%fp+1919], %i4
	add %i4, %g3, %i4
	st %i4, [%fp+1815]
	xor %i4, %o2, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i4
	st %i4, [%fp+2019]
	ld [%fp+1527], %l3
	add %l3, %o7, %i4
	st %i4, [%fp+1771]
	ld [%fp+1495], %g3
	xor %i4, %g3, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i4
	st %i4, [%fp+1999]
	ld [%fp+1511], %o2
	add %o2, %o4, %i4
	st %i4, [%fp+1663]
	ld [%fp+1479], %g3
	xor %i4, %g3, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %g5
	st %g5, [%fp+1539]
	ld [%fp+1491], %o7
	ld [%fp+1779], %i4
	add %o7, %i4, %g3
	st %g3, [%fp+1767]
	ld [%fp+1951], %i4
	xor %g3, %i4, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %o4
	st %o4, [%fp+1551]
	ld [%fp+1711], %i4
	add %o5, %i4, %i4
	st %i4, [%fp+1703]
	ld [%fp+1475], %g3
	xor %i4, %g3, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %i4
	st %i4, [%fp+1535]
	ld [%fp+1799], %g3
	add %o3, %g3, %g3
	st %g3, [%fp+1671]
	ld [%fp+1471], %g4
	xor %g3, %g4, %g3
	srl %g3, 8, %g4
	sll %g3, 24, %g3
	or %g3, %g4, %o5
	st %o5, [%fp+1531]
	ld [%fp+1843], %g3
	add %o0, %g3, %g3
	st %g3, [%fp+1655]
	ld [%fp+1467], %g4
	xor %g3, %g4, %g3
	srl %g3, 8, %g4
	sll %g3, 24, %g3
	or %g3, %g4, %o0
	st %o0, [%fp+1591]
	ld [%fp+1883], %g3
	add %l7, %g3, %g4
	st %g4, [%fp+1647]
	ld [%fp+1867], %g3
	xor %g4, %g3, %g3
	srl %g3, 8, %g4
	sll %g3, 24, %g3
	or %g3, %g4, %l7
	st %l7, [%fp+1599]
	ld [%fp+1903], %g3
	add %g3, %i0, %i0
	st %i0, [%fp+1867]
	ld [%fp+1503], %g3
	xor %i0, %g3, %g3
	srl %g3, 8, %g4
	sll %g3, 24, %g3
	or %g3, %g4, %i0
	st %i0, [%fp+1543]
	ld [%fp+1895], %i0
	add %l4, %i0, %g3
	st %g3, [%fp+1623]
	ld [%fp+1935], %i0
	xor %g3, %i0, %g3
	srl %g3, 8, %l0
	sll %g3, 24, %g3
	or %g3, %l0, %g4
	st %g4, [%fp+1499]
	ld [%fp+1907], %i0
	add %l2, %i0, %g3
	st %g3, [%fp+1615]
	ld [%fp+1891], %i0
	xor %g3, %i0, %g3
	srl %g3, 8, %l2
	sll %g3, 24, %g3
	or %g3, %l2, %i0
	st %i0, [%fp+1575]
	ld [%fp+1879], %i0
	ld [%fp+1899], %g3
	add %i0, %g3, %i0
	st %i0, [%fp+1631]
	xor %i0, %l5, %g3
	srl %g3, 8, %l4
	sll %g3, 24, %g3
	or %g3, %l4, %l4
	ld [%fp+1679], %i0
	add %i1, %i0, %i0
	st %i0, [%fp+1951]
	xor %i0, %o1, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1695]
	ld [%fp+1807], %i0
	add %i5, %i0, %i0
	st %i0, [%fp+1907]
	xor %i0, %i3, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1711]
	ld [%fp+1827], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+1891]
	xor %i0, %g2, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1779]
	ld [%fp+1835], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1899]
	xor %i0, %l1, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1799]
	ld [%fp+1819], %i0
	ld [%fp+2019], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1935]
	ld [%fp+1919], %i1
	xor %i0, %i1, %g3
	srl %g3, 7, %o1
	sll %g3, 25, %g3
	or %g3, %o1, %l5
	st %l5, [%fp+1507]
	ld [%fp+1839], %i0
	ld [%fp+1999], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+1919]
	xor %i0, %l3, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1523]
	ld [%fp+1847], %i0
	add %g5, %i0, %i0
	st %i0, [%fp+1883]
	xor %i0, %o2, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1527]
	ld [%fp+1855], %i0
	add %o4, %i0, %i0
	st %i0, [%fp+1895]
	xor %i0, %o7, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %o7
	ld [%fp+1803], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+1807]
	ld [%fp+1451], %i1
	xor %i0, %i1, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %i0
	st %i0, [%fp+1503]
	ld [%fp+1795], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+1835]
	ld [%fp+1463], %i1
	xor %i0, %i1, %g3
	srl %g3, 7, %o3
	sll %g3, 25, %g3
	or %g3, %o3, %l3
	st %l3, [%fp+1511]
	ld [%fp+1751], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+1567]
	ld [%fp+1447], %i1
	xor %i0, %i1, %o3
	srl %o3, 7, %o4
	sll %o3, 25, %o3
	or %o3, %o4, %o2
	ld [%fp+1759], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1751]
	ld [%fp+1459], %i1
	xor %i0, %i1, %o3
	srl %o3, 7, %o4
	sll %o3, 25, %o3
	or %o3, %o4, %l2
	st %l2, [%fp+1515]
	ld [%fp+1743], %i0
	ld [%fp+1543], %i5
	add %i5, %i0, %i1
	st %i1, [%fp+1827]
	ld [%fp+1903], %i0
	xor %i1, %i0, %o3
	srl %o3, 7, %o4
	sll %o3, 25, %o3
	or %o3, %o4, %l0
	st %l0, [%fp+1519]
	ld [%fp+1719], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+1843]
	ld [%fp+1455], %i1
	xor %i0, %i1, %o3
	srl %o3, 7, %o4
	sll %o3, 25, %o3
	or %o3, %o4, %g4
	st %g4, [%fp+1559]
	ld [%fp+1735], %i0
	ld [%fp+1575], %i3
	add %i3, %i0, %i0
	st %i0, [%fp+1903]
	ld [%fp+1483], %i1
	xor %i0, %i1, %o4
	srl %o4, 7, %i0
	sll %o4, 25, %o4
	or %o4, %i0, %l7
	ld [%fp+1727], %i0
	add %l4, %i0, %i1
	st %i1, [%fp+1759]
	mov	%l4, %o1
	ld [%fp+1879], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l4
	ld [%fp+1851], %i0
	ld [%fp+1987], %i1
	add %i1, %i0, %i1
	ld [%fp+1875], %i0
	ld [%fp+1871], %i2
	add %i2, %i0, %o3
	ld [%fp+1863], %i0
	ld [%fp+1859], %i2
	add %i2, %i0, %o5
	ld [%fp+1887], %i0
	ld [%fp+1831], %i2
	add %i2, %i0, %o0
	ld [%fp+1783], %i0
	ld [%fp+1815], %i2
	add %i2, %i0, %o4
	ld [%fp+2039], %i0
	ld [%fp+1771], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+2039]
	ld [%fp+1927], %i0
	ld [%fp+1663], %i2
	add %i2, %i0, %i0
	ld [%fp+1971], %i4
	ld [%fp+1767], %i2
	add %i2, %i4, %l6
	ld [%fp+2031], %i4
	ld [%fp+1703], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+2031]
	ld [%fp+2035], %i4
	ld [%fp+1671], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+1971]
	ld [%fp+1939], %i4
	ld [%fp+1655], %i2
	add %i2, %i4, %i4
	ld [%fp+2023], %g3
	ld [%fp+1647], %i2
	add %i2, %g3, %g3
	ld [%fp+1983], %l1
	ld [%fp+1867], %i2
	add %i2, %l1, %i2
	st %i2, [%fp+1987]
	ld [%fp+2015], %g5
	ld [%fp+1623], %i2
	add %i2, %g5, %i2
	st %i2, [%fp+2015]
	ld [%fp+1967], %g5
	ld [%fp+1615], %i2
	add %i2, %g5, %i2
	st %i2, [%fp+1967]
	ld [%fp+1995], %g2
	ld [%fp+1631], %i2
	add %i2, %g2, %i2
	st %i2, [%fp+1995]
	add %l5, %o5, %i2
	st %i2, [%fp+1859]
	xor %i2, %i5, %i5
	sll %i5, 16, %g2
	srl %i5, 16, %i5
	or %i5, %g2, %i2
	st %i2, [%fp+1767]
	ld [%fp+1523], %g5
	add %g5, %o0, %i5
	st %i5, [%fp+1983]
	ld [%fp+1499], %g2
	xor %i5, %g2, %i5
	sll %i5, 16, %g2
	srl %i5, 16, %i5
	or %i5, %g2, %o5
	ld [%fp+1527], %l5
	add %l5, %i1, %i1
	st %i1, [%fp+1867]
	xor %i1, %i3, %i1
	sll %i1, 16, %i5
	srl %i1, 16, %i1
	or %i1, %i5, %o0
	st %o0, [%fp+1743]
	add %o7, %o3, %i1
	st %i1, [%fp+1863]
	xor %i1, %o1, %i1
	sll %i1, 16, %i5
	srl %i1, 16, %i1
	or %i1, %i5, %l1
	st %l1, [%fp+1735]
	ld [%fp+1503], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+1831]
	ld [%fp+1687], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+1719]
	add %l3, %l6, %i0
	st %i0, [%fp+1847]
	ld [%fp+1607], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+1727]
	add %o2, %o4, %i0
	st %i0, [%fp+1855]
	ld [%fp+1583], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %o3
	ld [%fp+2039], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+1851]
	ld [%fp+1547], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+2039]
	add %l0, %i4, %i1
	st %i1, [%fp+1815]
	ld [%fp+2019], %i0
	xor %i1, %i0, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+2035]
	add %g4, %g3, %i1
	st %i1, [%fp+1839]
	ld [%fp+1999], %i0
	xor %i1, %i0, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1687]
	ld [%fp+2031], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+1819]
	ld [%fp+1539], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i1
	srl %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+2031]
	ld [%fp+1971], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+1803]
	mov	%l4, %l3
	ld [%fp+1551], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i4
	srl %i0, 16, %i0
	or %i0, %i4, %i0
	st %i0, [%fp+2023]
	ld [%fp+1695], %l6
	ld [%fp+1967], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+1795]
	ld [%fp+1535], %i1
	xor %i0, %i1, %i0
	sll %i0, 16, %i4
	srl %i0, 16, %i0
	or %i0, %i4, %l2
	st %l2, [%fp+1703]
	ld [%fp+1711], %l0
	ld [%fp+1995], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+1771]
	ld [%fp+1531], %i1
	xor %i0, %i1, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %i0
	st %i0, [%fp+2019]
	ld [%fp+1779], %i0
	ld [%fp+1987], %i1
	add %i0, %i1, %i1
	st %i1, [%fp+1783]
	ld [%fp+1591], %i3
	xor %i1, %i3, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %i3
	st %i3, [%fp+1679]
	ld [%fp+1799], %i1
	ld [%fp+2015], %i4
	add %i1, %i4, %l4
	ld [%fp+1599], %i4
	xor %l4, %i4, %i4
	sll %i4, 16, %g3
	srl %i4, 16, %i4
	or %i4, %g3, %g4
	st %g4, [%fp+1663]
	ld [%fp+1567], %i4
	add %i2, %i4, %i4
	st %i4, [%fp+1871]
	ld [%fp+1507], %i2
	xor %i4, %i2, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1671]
	ld [%fp+1751], %i2
	add %o5, %i2, %i4
	st %i4, [%fp+1967]
	mov	%o5, %o4
	xor %i4, %g5, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1751]
	ld [%fp+1807], %i2
	add %o0, %i2, %i4
	st %i4, [%fp+1927]
	xor %i4, %l5, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1807]
	ld [%fp+1835], %i2
	add %l1, %i2, %i4
	st %i4, [%fp+1939]
	xor %i4, %o7, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1835]
	ld [%fp+1903], %i2
	add %o1, %i2, %i4
	st %i4, [%fp+1887]
	xor %i4, %i5, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %o7
	ld [%fp+1759], %i2
	add %g2, %i2, %i4
	st %i4, [%fp+1903]
	ld [%fp+1511], %i2
	xor %i4, %i2, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1995]
	mov	%o3, %o5
	ld [%fp+1827], %i2
	add %o3, %i2, %i2
	st %i2, [%fp+1875]
	xor %i2, %o2, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1987]
	ld [%fp+2039], %i2
	ld [%fp+1843], %i4
	add %i2, %i4, %i2
	st %i2, [%fp+1879]
	ld [%fp+1515], %i4
	xor %i2, %i4, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1999]
	ld [%fp+1891], %i4
	ld [%fp+2035], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+1891]
	ld [%fp+1519], %i4
	xor %i2, %i4, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1827]
	ld [%fp+1899], %i4
	ld [%fp+1687], %g2
	add %g2, %i4, %i2
	st %i2, [%fp+1899]
	ld [%fp+1559], %i4
	xor %i2, %i4, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+1843]
	ld [%fp+1951], %i4
	ld [%fp+2031], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+1951]
	xor %i2, %l7, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i5
	st %i5, [%fp+1655]
	ld [%fp+1907], %i4
	ld [%fp+2023], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+1907]
	xor %i2, %l3, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i2
	st %i2, [%fp+2015]
	ld [%fp+1883], %i2
	add %l2, %i2, %i2
	st %i2, [%fp+1883]
	xor %i2, %l6, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %o1
	st %o1, [%fp+1695]
	ld [%fp+1895], %i4
	ld [%fp+2019], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+1895]
	xor %i2, %l0, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %o2
	st %o2, [%fp+1759]
	ld [%fp+1935], %i4
	add %i3, %i4, %i2
	st %i2, [%fp+1935]
	xor %i2, %i0, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %o3
	st %o3, [%fp+1779]
	ld [%fp+1919], %i4
	add %g4, %i4, %i0
	st %i0, [%fp+1919]
	xor %i0, %i1, %i4
	srl %i4, 12, %g3
	sll %i4, 20, %i4
	or %i4, %g3, %i0
	st %i0, [%fp+1971]
	ld [%fp+1975], %i4
	ld [%fp+1859], %i0
	add %i0, %i4, %g4
	ld [%fp+2011], %i4
	ld [%fp+1983], %i0
	add %i0, %i4, %l0
	ld [%fp+1963], %i4
	ld [%fp+1867], %i0
	add %i0, %i4, %l3
	ld [%fp+1991], %i4
	ld [%fp+1863], %i0
	add %i0, %i4, %l6
	ld [%fp+1915], %i4
	ld [%fp+1831], %i0
	add %i0, %i4, %g5
	ld [%fp+1947], %i4
	ld [%fp+1847], %i0
	add %i0, %i4, %g3
	ld [%fp+1931], %i4
	ld [%fp+1855], %i0
	add %i0, %i4, %i0
	st %i0, [%fp+1991]
	ld [%fp+1959], %i4
	ld [%fp+1851], %i0
	add %i0, %i4, %i0
	st %i0, [%fp+1915]
	ld [%fp+1775], %i4
	ld [%fp+1815], %i0
	add %i0, %i4, %i4
	ld [%fp+1823], %i3
	ld [%fp+1839], %i0
	add %i0, %i3, %i0
	st %i0, [%fp+1867]
	ld [%fp+1791], %i3
	ld [%fp+1819], %i0
	add %i0, %i3, %i3
	ld [%fp+1811], %i2
	ld [%fp+1803], %i0
	add %i0, %i2, %i0
	st %i0, [%fp+1863]
	ld [%fp+1911], %i1
	ld [%fp+1795], %i0
	add %i0, %i1, %i0
	st %i0, [%fp+1859]
	ld [%fp+1943], %i1
	ld [%fp+1771], %i0
	add %i0, %i1, %i1
	ld [%fp+1923], %i0
	ld [%fp+1783], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+1851]
	ld [%fp+1955], %i0
	add %l4, %i0, %i0
	ld [%fp+1671], %o0
	add %o0, %g4, %i2
	st %i2, [%fp+1975]
	ld [%fp+1767], %g4
	xor %i2, %g4, %g4
	srl %g4, 8, %l1
	sll %g4, 24, %g4
	or %g4, %l1, %l1
	st %l1, [%fp+1847]
	ld [%fp+1751], %l5
	add %l5, %l0, %i2
	st %i2, [%fp+1963]
	xor %i2, %o4, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %l2
	st %l2, [%fp+1815]
	ld [%fp+1807], %o4
	add %o4, %l3, %i2
	st %i2, [%fp+1959]
	ld [%fp+1743], %g4
	xor %i2, %g4, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %l3
	st %l3, [%fp+1811]
	ld [%fp+1835], %l7
	add %l7, %l6, %i2
	st %i2, [%fp+1955]
	ld [%fp+1735], %g4
	xor %i2, %g4, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %l0
	st %l0, [%fp+1803]
	mov	%o7, %l4
	add %o7, %g5, %i2
	st %i2, [%fp+1947]
	ld [%fp+1719], %g4
	xor %i2, %g4, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i2
	st %i2, [%fp+2011]
	ld [%fp+1995], %i2
	add %i2, %g3, %i2
	st %i2, [%fp+1943]
	ld [%fp+1727], %g3
	xor %i2, %g3, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i2
	st %i2, [%fp+1983]
	ld [%fp+1987], %i2
	ld [%fp+1991], %g3
	add %i2, %g3, %i2
	st %i2, [%fp+1931]
	xor %i2, %o5, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %i2
	st %i2, [%fp+1991]
	ld [%fp+1999], %i2
	ld [%fp+1915], %g3
	add %i2, %g3, %g3
	st %g3, [%fp+1923]
	ld [%fp+2039], %i2
	xor %g3, %i2, %g4
	srl %g4, 8, %g5
	sll %g4, 24, %g4
	or %g4, %g5, %g5
	st %g5, [%fp+1791]
	ld [%fp+1827], %i2
	add %i2, %i4, %g3
	st %g3, [%fp+1915]
	ld [%fp+2035], %i4
	xor %g3, %i4, %g3
	srl %g3, 8, %g4
	sll %g3, 24, %g3
	or %g3, %g4, %g4
	st %g4, [%fp+1783]
	ld [%fp+1843], %i4
	ld [%fp+1867], %g3
	add %i4, %g3, %g3
	st %g3, [%fp+1911]
	xor %g3, %g2, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %g3
	st %g3, [%fp+1775]
	add %i5, %i3, %g2
	st %g2, [%fp+1867]
	ld [%fp+2031], %i3
	xor %g2, %i3, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %l6
	ld [%fp+2015], %i3
	ld [%fp+1863], %i5
	add %i3, %i5, %i5
	st %i5, [%fp+1863]
	ld [%fp+2023], %i3
	xor %i5, %i3, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %i5
	st %i5, [%fp+1771]
	ld [%fp+1859], %i3
	add %o1, %i3, %i3
	st %i3, [%fp+1859]
	ld [%fp+1703], %g2
	xor %i3, %g2, %i3
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %i3
	st %i3, [%fp+1819]
	add %o2, %i1, %i3
	st %i3, [%fp+1855]
	ld [%fp+2019], %i1
	xor %i3, %i1, %i3
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %i3
	ld [%fp+1851], %i1
	add %o3, %i1, %i1
	st %i1, [%fp+1851]
	ld [%fp+1679], %g2
	xor %i1, %g2, %i1
	srl %i1, 8, %g2
	sll %i1, 24, %i1
	or %i1, %g2, %i1
	st %i1, [%fp+1831]
	ld [%fp+1971], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+1839]
	ld [%fp+1663], %i0
	xor %i1, %i0, %i0
	srl %i0, 8, %g2
	sll %i0, 24, %i0
	or %i0, %g2, %i0
	st %i0, [%fp+1823]
	ld [%fp+1871], %i0
	add %l1, %i0, %i0
	st %i0, [%fp+1871]
	xor %i0, %o0, %i1
	srl %i1, 7, %i0
	sll %i1, 25, %i1
	or %i1, %i0, %i0
	st %i0, [%fp+1799]
	ld [%fp+1967], %i0
	add %l2, %i0, %o7
	xor %o7, %l5, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1795]
	ld [%fp+1927], %i0
	add %l3, %i0, %o5
	xor %o5, %o4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1927]
	ld [%fp+1939], %i0
	add %l0, %i0, %o4
	xor %o4, %l7, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1939]
	ld [%fp+1887], %i0
	ld [%fp+2011], %i1
	add %i1, %i0, %o1
	xor %o1, %l4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1887]
	ld [%fp+1903], %i0
	ld [%fp+1983], %i1
	add %i1, %i0, %o0
	ld [%fp+1995], %i0
	xor %o0, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1835]
	ld [%fp+1875], %i0
	ld [%fp+1991], %i1
	add %i1, %i0, %l7
	ld [%fp+1987], %i0
	xor %l7, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1903]
	ld [%fp+1879], %i0
	add %g5, %i0, %l5
	ld [%fp+1999], %i0
	xor %l5, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1879]
	ld [%fp+1891], %i0
	add %g4, %i0, %l0
	xor %l0, %i2, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1891]
	ld [%fp+1899], %i0
	add %g3, %i0, %g4
	xor %g4, %i4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1899]
	ld [%fp+1951], %i0
	mov	%l6, %o3
	add %l6, %i0, %g3
	ld [%fp+1655], %i0
	xor %g3, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1951]
	ld [%fp+1907], %i0
	add %i5, %i0, %g2
	ld [%fp+2015], %i0
	xor %g2, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+1907]
	ld [%fp+1883], %i0
	ld [%fp+1819], %l6
	add %l6, %i0, %i5
	ld [%fp+1695], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o2
	ld [%fp+1895], %i0
	mov	%i3, %l2
	add %i3, %i0, %i3
	ld [%fp+1759], %i0
	xor %i3, %i0, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %l3
	ld [%fp+1935], %i0
	ld [%fp+1831], %l1
	add %l1, %i0, %i2
	ld [%fp+1779], %i0
	xor %i2, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l4
	ld [%fp+1919], %i0
	ld [%fp+1823], %g5
	add %g5, %i0, %i1
	ld [%fp+1971], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i4
	ld [%fp+1955], %i0
	xor %g2, %i0, %i0
	st %i0, [%fp+2031]
	ld [%fp+1959], %i0
	xor %g3, %i0, %i0
	st %i0, [%fp+2035]
	ld [%fp+1963], %i0
	xor %g4, %i0, %g2
	ld [%fp+1975], %i0
	xor %l0, %i0, %i0
	stx %i0, [%fp+2023]
	ld [%fp+1943], %i0
	xor %i3, %i0, %i0
	st %i0, [%fp+2015]
	ld [%fp+1947], %i0
	xor %i5, %i0, %i0
	st %i0, [%fp+2019]
	ld [%fp+1923], %i0
	xor %i1, %i0, %i0
	stx %i0, [%fp+2039]
	ld [%fp+1931], %i0
	xor %i2, %i0, %i0
	stx %i0, [%fp+1999]
	ld [%fp+1863], %i0
	xor %o4, %i0, %i0
	st %i0, [%fp+1987]
	ld [%fp+1867], %i0
	xor %o5, %i0, %i0
	st %i0, [%fp+1995]
	ld [%fp+1911], %i0
	xor %o7, %i0, %o7
	ld [%fp+1915], %i0
	ld [%fp+1871], %i1
	xor %i1, %i0, %i0
	stx %i0, [%fp+1975]
	ld [%fp+1855], %i0
	xor %o0, %i0, %i0
	st %i0, [%fp+1967]
	ld [%fp+1859], %i0
	xor %o1, %i0, %i0
	st %i0, [%fp+1971]
	ld [%fp+1839], %i0
	xor %l5, %i0, %o0
	ld [%fp+1851], %i0
	xor %l7, %i0, %g3
	ld [%fp+1983], %i0
	xor %l3, %i0, %o4
	ld [%fp+2011], %i1
	xor %o2, %i1, %i0
	st %i0, [%fp+2011]
	ld [%fp+1791], %i0
	xor %i4, %i0, %i2
	ld [%fp+1991], %i1
	xor %l4, %i1, %l5
	ld [%fp+1939], %i0
	ld [%fp+1771], %i1
	xor %i0, %i1, %i0
	ld [%fp+1927], %i1
	xor %i1, %o3, %o5
	ld [%fp+1795], %i1
	ld [%fp+1775], %i3
	xor %i1, %i3, %l3
	ld [%fp+1799], %i1
	ld [%fp+1783], %i3
	xor %i1, %i3, %i1
	ld [%fp+1835], %i3
	xor %i3, %l2, %i3
	ld [%fp+1887], %i4
	xor %i4, %l6, %i5
	ld [%fp+1879], %i4
	xor %i4, %g5, %l4
	ld [%fp+1903], %i4
	xor %i4, %l1, %i4
	ld [%fp+1803], %g4
	ld [%fp+1907], %g5
	xor %g5, %g4, %g4
	ld [%fp+1811], %g5
	ld [%fp+1951], %l1
	xor %l1, %g5, %g5
	mov	%i2, %l1
	mov	%g2, %o3
	mov	%l5, %g2
	ld [%fp+1815], %i2
	ld [%fp+1899], %l2
	xor %l2, %i2, %i2
	ld [%fp+1847], %l2
	ld [%fp+1891], %l5
	xor %l5, %l2, %l6
	ldx [%fp+1639], %l5
	ldx [%fp+1327], %l2
	ba .LBB3_1
	ldx [%fp+1311], %l7
.LBB3_2:
	ldx [%fp+1239], %i2
	ldx [%fp+1663], %i1
	stb %i1, [%i2+15]
	srlx %l1, 40, %i1
	stb %i1, [%i2+14]
	srlx %l1, 48, %i1
	stb %i1, [%i2+13]
	srlx %l1, 56, %i1
	stb %i1, [%i2+12]
	ldx [%fp+1655], %i1
	stb %i1, [%i2+11]
	srlx %i3, 40, %i1
	stb %i1, [%i2+10]
	srlx %i3, 48, %i1
	stb %i1, [%i2+9]
	srlx %i3, 56, %i1
	stb %i1, [%i2+8]
	ldx [%fp+1647], %i1
	stb %i1, [%i2+7]
	srlx %i0, 40, %i1
	stb %i1, [%i2+6]
	srlx %i0, 48, %i1
	stb %i1, [%i2+5]
	srlx %i0, 56, %i1
	stb %i1, [%i2+4]
	ldx [%fp+1695], %i1
	stb %i1, [%i2+3]
	srlx %i4, 40, %i1
	stb %i1, [%i2+2]
	srlx %i4, 48, %i1
	stb %i1, [%i2+1]
	srlx %i4, 56, %i1
	stb %i1, [%i2]
	ldx [%fp+1687], %i1
	stb %i1, [%i2+31]
	srlx %o1, 40, %i1
	stb %i1, [%i2+30]
	srlx %o1, 48, %i1
	stb %i1, [%i2+29]
	srlx %o1, 56, %i1
	stb %i1, [%i2+28]
	ldx [%fp+1679], %i1
	stb %i1, [%i2+27]
	srlx %l4, 40, %i1
	stb %i1, [%i2+26]
	srlx %l4, 48, %i1
	stb %i1, [%i2+25]
	srlx %l4, 56, %i1
	stb %i1, [%i2+24]
	ldx [%fp+1759], %i1
	stb %i1, [%i2+23]
	srlx %o2, 40, %i1
	stb %i1, [%i2+22]
	srlx %o2, 48, %i1
	stb %i1, [%i2+21]
	srlx %o2, 56, %i1
	stb %i1, [%i2+20]
	ldx [%fp+1751], %i1
	stb %i1, [%i2+19]
	srlx %o4, 40, %i1
	stb %i1, [%i2+18]
	srlx %o4, 48, %i1
	stb %i1, [%i2+17]
	srlx %o4, 56, %i1
	stb %i1, [%i2+16]
	srlx %l1, 8, %i1
	stb %i1, [%i2+46]
	srlx %l1, 16, %i1
	stb %i1, [%i2+45]
	stb %l1, [%i2+47]
	srlx %l1, 24, %i1
	stb %i1, [%i2+44]
	srlx %i3, 8, %i1
	stb %i1, [%i2+42]
	srlx %i3, 16, %i1
	stb %i1, [%i2+41]
	stb %i3, [%i2+43]
	srlx %i3, 24, %i1
	stb %i1, [%i2+40]
	srlx %i0, 8, %i1
	stb %i1, [%i2+38]
	srlx %i0, 16, %i1
	stb %i1, [%i2+37]
	stb %i0, [%i2+39]
	srlx %i0, 24, %i0
	stb %i0, [%i2+36]
	srlx %i4, 8, %i0
	stb %i0, [%i2+34]
	srlx %i4, 16, %i0
	stb %i0, [%i2+33]
	stb %i4, [%i2+35]
	srlx %i4, 24, %i0
	stb %i0, [%i2+32]
	srlx %o1, 8, %i0
	stb %i0, [%i2+62]
	srlx %o1, 16, %i0
	stb %i0, [%i2+61]
	stb %o1, [%i2+63]
	srlx %o1, 24, %i0
	stb %i0, [%i2+60]
	srlx %l4, 8, %i0
	stb %i0, [%i2+58]
	srlx %l4, 16, %i0
	stb %i0, [%i2+57]
	stb %l4, [%i2+59]
	srlx %l4, 24, %i0
	stb %i0, [%i2+56]
	srlx %o2, 8, %i0
	stb %i0, [%i2+54]
	srlx %o2, 16, %i0
	stb %i0, [%i2+53]
	stb %o2, [%i2+55]
	srlx %o2, 24, %i0
	stb %i0, [%i2+52]
	srlx %o4, 8, %i0
	stb %i0, [%i2+50]
	srlx %o4, 16, %i0
	stb %i0, [%i2+49]
	stb %o4, [%i2+51]
	srlx %o4, 24, %i0
	stb %i0, [%i2+48]
	ldx [%fp+1703], %i0
	stb %i0, [%i2+79]
	srlx %o5, 40, %i0
	stb %i0, [%i2+78]
	srlx %o5, 48, %i0
	stb %i0, [%i2+77]
	srlx %o5, 56, %i0
	stb %i0, [%i2+76]
	ldx [%fp+1671], %i0
	stb %i0, [%i2+75]
	srlx %o7, 40, %i0
	stb %i0, [%i2+74]
	srlx %o7, 48, %i0
	stb %i0, [%i2+73]
	srlx %o7, 56, %i0
	stb %i0, [%i2+72]
	ldx [%fp+1783], %i0
	stb %i0, [%i2+71]
	srlx %i5, 40, %i0
	stb %i0, [%i2+70]
	srlx %i5, 48, %i0
	stb %i0, [%i2+69]
	srlx %i5, 56, %i0
	stb %i0, [%i2+68]
	ldx [%fp+1711], %i0
	stb %i0, [%i2+67]
	srlx %g3, 40, %i0
	stb %i0, [%i2+66]
	srlx %g3, 48, %i0
	stb %i0, [%i2+65]
	srlx %g3, 56, %i0
	stb %i0, [%i2+64]
	stb %l3, [%i2+95]
	srlx %g4, 40, %i0
	stb %i0, [%i2+94]
	srlx %g4, 48, %i0
	stb %i0, [%i2+93]
	srlx %g4, 56, %i0
	stb %i0, [%i2+92]
	stb %l6, [%i2+91]
	srlx %g5, 40, %i0
	stb %i0, [%i2+90]
	srlx %g5, 48, %i0
	stb %i0, [%i2+89]
	srlx %g5, 56, %i0
	stb %i0, [%i2+88]
	stb %o0, [%i2+87]
	srlx %l0, 40, %i0
	stb %i0, [%i2+86]
	srlx %l0, 48, %i0
	stb %i0, [%i2+85]
	srlx %l0, 56, %i0
	stb %i0, [%i2+84]
	stb %o3, [%i2+83]
	srlx %g2, 40, %i0
	stb %i0, [%i2+82]
	srlx %g2, 48, %i0
	stb %i0, [%i2+81]
	srlx %g2, 56, %i0
	stb %i0, [%i2+80]
	srlx %o5, 8, %i0
	stb %i0, [%i2+110]
	srlx %o5, 16, %i0
	stb %i0, [%i2+109]
	stb %o5, [%i2+111]
	srlx %o5, 24, %i0
	stb %i0, [%i2+108]
	srlx %o7, 8, %i0
	stb %i0, [%i2+106]
	srlx %o7, 16, %i0
	stb %i0, [%i2+105]
	stb %o7, [%i2+107]
	srlx %o7, 24, %i0
	stb %i0, [%i2+104]
	srlx %i5, 8, %i0
	stb %i0, [%i2+102]
	srlx %i5, 16, %i0
	stb %i0, [%i2+101]
	stb %i5, [%i2+103]
	srlx %i5, 24, %i0
	stb %i0, [%i2+100]
	srlx %g3, 8, %i0
	stb %i0, [%i2+98]
	srlx %g3, 16, %i0
	stb %i0, [%i2+97]
	stb %g3, [%i2+99]
	srlx %g3, 24, %i0
	stb %i0, [%i2+96]
	srlx %g4, 8, %i0
	stb %i0, [%i2+126]
	srlx %g4, 16, %i0
	stb %i0, [%i2+125]
	stb %g4, [%i2+127]
	srlx %g4, 24, %i0
	stb %i0, [%i2+124]
	srlx %g5, 8, %i0
	stb %i0, [%i2+122]
	srlx %g5, 16, %i0
	stb %i0, [%i2+121]
	stb %g5, [%i2+123]
	srlx %g5, 24, %i0
	stb %i0, [%i2+120]
	srlx %l0, 8, %i0
	stb %i0, [%i2+118]
	srlx %l0, 16, %i0
	stb %i0, [%i2+117]
	stb %l0, [%i2+119]
	srlx %l0, 24, %i0
	stb %i0, [%i2+116]
	srlx %g2, 8, %i0
	stb %i0, [%i2+114]
	srlx %g2, 16, %i0
	stb %i0, [%i2+113]
	stb %g2, [%i2+115]
	srlx %g2, 24, %i0
	stb %i0, [%i2+112]
	ret
	restore
.Lfunc_end3:
	.size	blake3_hash4_sse2, .Lfunc_end3-blake3_hash4_sse2
#endif
