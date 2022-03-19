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
 * This is converted assembly: SSE2 -> SPARC (V8)
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if defined(__SPARC__)

.text
	.globl	_blake3_compress_in_place_sse2
	.p2align	2
	.type	_blake3_compress_in_place_sse2,@function
_blake3_compress_in_place_sse2:
	save %sp, -1440, %sp
	mov	%i0, %l0
	ldub [%i0+6], %i0
	ldub [%l0+7], %g2
	ldub [%l0+4], %g3
	ldub [%l0+5], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	add %fp, -192, %g2
	or %g2, 4, %g2
	st %i0, [%g2]
	ldub [%l0+14], %i0
	ldub [%l0+15], %g2
	ldub [%l0+12], %g3
	ldub [%l0+13], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	add %fp, -176, %g2
	or %g2, 4, %g2
	st %i0, [%g2]
	ldub [%l0+2], %i0
	ldub [%l0+3], %g2
	ldub [%l0], %g3
	ldub [%l0+1], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-192]
	ldub [%l0+10], %i0
	ldub [%l0+11], %g2
	ldub [%l0+8], %g3
	ldub [%l0+9], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-176]
	ldd [%fp+-192], %g2
	std %g2, [%fp+-1184]
	ldd [%fp+-176], %g2
	std %g2, [%fp+-1200]
	ldub [%l0+22], %i0
	ldub [%l0+23], %g2
	ldub [%l0+20], %g3
	ldub [%l0+21], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	add %fp, -168, %g2
	or %g2, 4, %g2
	st %i0, [%g2]
	ldub [%l0+30], %i0
	ldub [%l0+31], %g2
	ldub [%l0+28], %g3
	ldub [%l0+29], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	add %fp, -184, %g2
	or %g2, 4, %g2
	st %i0, [%g2]
	ldub [%l0+18], %i0
	ldub [%l0+19], %g2
	ldub [%l0+16], %g3
	ldub [%l0+17], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-168]
	ldub [%l0+26], %i0
	ldub [%l0+27], %g2
	ldub [%l0+24], %g3
	st %l0, [%fp+-1276]
	ldub [%l0+25], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-184]
	ldd [%fp+-168], %g2
	std %g2, [%fp+-1248]
	ldd [%fp+-184], %o2
	ldub [%i1+14], %i0
	ldub [%i1+15], %g2
	ldub [%i1+12], %g3
	ldub [%i1+13], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-200]
	ldub [%i1+6], %i0
	ldub [%i1+7], %g2
	ldub [%i1+4], %g3
	ldub [%i1+5], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-240]
	ldub [%i1+10], %i0
	ldub [%i1+11], %g2
	ldub [%i1+8], %g3
	ldub [%i1+9], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-244]
	ldub [%i1+2], %i0
	ldub [%i1+3], %g2
	ldub [%i1], %g3
	ldub [%i1+1], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-196]
	ld [%fp+-200], %f0
	st %f0, [%fp+-156]
	ld [%fp+-240], %f1
	st %f1, [%fp+-116]
	ld [%fp+-244], %f2
	st %f2, [%fp+-112]
	ld [%fp+-196], %f2
	st %f2, [%fp+-160]
	ld [%fp+-156], %g2
	std %g2, [%fp+-1176]
	ld [%fp+-116], %i0
	st %i0, [%fp+-1252]
	ld [%fp+-112], %g3
	ld [%fp+-160], %g2
	std %g2, [%fp+-1216]
	ldub [%i1+30], %i0
	ldub [%i1+31], %g3
	ldub [%i1+28], %g4
	ldub [%i1+29], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-208]
	ldub [%i1+22], %i0
	ldub [%i1+23], %g3
	ldub [%i1+20], %g4
	ldub [%i1+21], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-212]
	ldub [%i1+26], %i0
	ldub [%i1+27], %g3
	ldub [%i1+24], %g4
	ldub [%i1+25], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-204]
	ldub [%i1+18], %i0
	ldub [%i1+19], %g3
	ldub [%i1+16], %g4
	ldub [%i1+17], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-256]
	ld [%fp+-208], %f2
	st %f2, [%fp+-148]
	ld [%fp+-212], %f2
	st %f2, [%fp+-144]
	ld [%fp+-204], %f2
	st %f2, [%fp+-152]
	ld [%fp+-256], %f2
	st %f2, [%fp+-100]
	ldub [%i1+38], %i0
	ldub [%i1+39], %g3
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	ldub [%i1+36], %g3
	ldub [%i1+37], %g4
	ld [%fp+-148], %l1
	ld [%fp+-144], %l0
	std %l0, [%fp+-1192]
	sll %g3, 8, %g3
	or %g3, %g4, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	ld [%fp+-152], %l3
	ld [%fp+-100], %l2
	st %i0, [%fp+-224]
	ldub [%i1+46], %i0
	ldub [%i1+47], %g3
	ldub [%i1+44], %g4
	ldub [%i1+45], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-220]
	ldub [%i1+34], %i0
	ldub [%i1+35], %g3
	ldub [%i1+32], %g4
	ldub [%i1+33], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-252]
	ldub [%i1+42], %i0
	ldub [%i1+43], %g3
	ldub [%i1+40], %g4
	ldub [%i1+41], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-216]
	ld [%fp+-224], %f2
	st %f2, [%fp+-132]
	ld [%fp+-220], %f2
	st %f2, [%fp+-136]
	ld [%fp+-252], %f2
	st %f2, [%fp+-104]
	ld [%fp+-216], %f2
	st %f2, [%fp+-140]
	ldub [%i1+62], %i0
	ldub [%i1+63], %g3
	ldub [%i1+60], %g4
	ldub [%i1+61], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	ld [%fp+-132], %l5
	ld [%fp+-136], %l6
	ld [%fp+-104], %o1
	ld [%fp+-140], %o4
	st %i0, [%fp+-232]
	ldub [%i1+54], %i0
	ldub [%i1+55], %g3
	ldub [%i1+52], %g4
	ldub [%i1+53], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-236]
	ldub [%i1+58], %i0
	ldub [%i1+59], %g3
	ldub [%i1+56], %g4
	ldub [%i1+57], %l0
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %l0, %g3
	sll %g3, 16, %g3
	or %g3, %i0, %i0
	st %i0, [%fp+-228]
	ldub [%i1+50], %i0
	ldub [%i1+51], %g3
	ldub [%i1+48], %g4
	ldub [%i1+49], %i1
	sll %i0, 8, %i0
	or %i0, %g3, %i0
	sll %g4, 8, %g3
	or %g3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i0, %i0
	st %i0, [%fp+-248]
	ld [%fp+-232], %f3
	st %f3, [%fp+-124]
	ld [%fp+-236], %f3
	st %f3, [%fp+-120]
	ld [%fp+-228], %f4
	ldd [%fp+-1200], %g2
	add %o3, %g3, %i1
	add %o2, %g2, %i0
	st %f4, [%fp+-128]
	ld [%fp+-248], %f4
	std %l2, [%fp+-1240]
	add %i0, %l2, %o7
	add %i1, %l3, %i0
	xor %i0, %i5, %l1
	xor %o7, %i2, %l0
	st %f4, [%fp+-108]
	ld [%fp+-124], %l4
	std %l4, [%fp+-1224]
	ld [%fp+-120], %l7
	std %l6, [%fp+-1232]
	ld [%fp+-128], %o0
	std %o0, [%fp+-1208]
	ld [%fp+-108], %o5
	st %l0, [%fp+-4]
	st %l1, [%fp+-12]
	ldd [%fp+-1184], %l0
	ldd [%fp+-1248], %g2
	add %g3, %l1, %i1
	add %g2, %l0, %i2
	ldd [%fp+-1216], %o0
	add %i2, %o0, %i2
	add %i1, %o1, %i1
	xor %i1, %i3, %l1
	xor %i2, %i4, %l0
	st %l0, [%fp+-20]
	st %l1, [%fp+-28]
	add %fp, -4, %i3
	or %i3, 2, %i3
	lduh [%i3], %i4
	add %fp, -12, %i3
	or %i3, 2, %i3
	lduh [%i3], %i5
	add %fp, -20, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	add %fp, -28, %g4
	or %g4, 2, %g4
	lduh [%g4], %g4
	add %fp, -32, %l0
	or %l0, 2, %l0
	lduh [%fp+-28], %l1
	lduh [%fp+-4], %l2
	lduh [%fp+-12], %l3
	lduh [%fp+-20], %l4
	sth %l1, [%l0]
	add %fp, -24, %l0
	or %l0, 2, %l0
	sth %l4, [%l0]
	sth %g4, [%fp+-32]
	sth %i3, [%fp+-24]
	add %fp, -16, %i3
	or %i3, 2, %g4
	ld [%fp+-32], %l4
	ld [%fp+-24], %i3
	sth %l3, [%g4]
	add %fp, -8, %g4
	or %g4, 2, %g4
	sth %l2, [%g4]
	sth %i5, [%fp+-16]
	sth %i4, [%fp+-8]
	ld [%fp+-8], %i5
	sethi 990140, %i4
	or %i4, 882, %i4
	ld [%fp+-16], %l2
	add %i5, %i4, %l3
	sethi 2708477, %i4
	or %i4, 314, %i4
	add %l2, %i4, %l5
	xor %l5, %o3, %l0
	xor %l3, %o2, %l1
	sethi 1737337, %i4
	or %i4, 615, %i4
	add %i3, %i4, %i4
	sethi 3070443, %g4
	or %g4, 645, %g4
	add %l4, %g4, %g4
	xor %g4, %g3, %l6
	xor %i4, %g2, %l7
	srl %l0, 12, %o0
	sll %l0, 20, %l0
	or %l0, %o0, %o0
	srl %l1, 12, %l0
	sll %l1, 20, %l1
	or %l1, %l0, %o1
	srl %l6, 12, %l0
	sll %l6, 20, %l1
	or %l1, %l0, %l1
	srl %l7, 12, %l0
	sll %l7, 20, %l6
	or %l6, %l0, %l0
	ld [%fp+-1252], %g2
	add %i2, %g2, %i2
	ldd [%fp+-1192], %o2
	add %i0, %o3, %g2
	add %g2, %o0, %g3
	xor %g3, %l2, %g2
	srl %g2, 8, %l2
	sll %g2, 24, %g2
	or %g2, %l2, %l6
	add %o7, %o2, %i0
	add %i0, %o1, %i0
	xor %i0, %i5, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %l7
	ldd [%fp+-1176], %o2
	add %i1, %o2, %i1
	add %i1, %l1, %i1
	xor %i1, %l4, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %l4
	add %i2, %l0, %o2
	xor %o2, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %l2
	add %l6, %l5, %i2
	xor %i2, %o0, %i3
	srl %i3, 7, %i5
	sll %i3, 25, %i3
	or %i3, %i5, %i3
	add %l7, %l3, %g2
	xor %g2, %o1, %i5
	srl %i5, 7, %l3
	sll %i5, 25, %i5
	or %i5, %l3, %i5
	add %i0, %o5, %i0
	std %o4, [%fp+-1264]
	add %i1, %o4, %i1
	add %i5, %i1, %i1
	add %i3, %i0, %i0
	xor %i0, %l4, %o1
	xor %i1, %l2, %o0
	st %o1, [%fp+-60]
	st %o0, [%fp+-52]
	add %l2, %i4, %l2
	add %l4, %g4, %i4
	xor %i4, %l1, %g4
	srl %g4, 7, %l1
	sll %g4, 25, %g4
	or %g4, %l1, %l3
	xor %l2, %l0, %g4
	srl %g4, 7, %l0
	sll %g4, 25, %g4
	or %g4, %l0, %g4
	ldd [%fp+-1208], %l4
	add %o2, %l5, %l0
	add %g3, %l4, %g3
	add %g4, %g3, %l1
	add %l3, %l0, %g3
	xor %g3, %l6, %l5
	xor %l1, %l7, %l4
	st %l5, [%fp+-44]
	st %l4, [%fp+-36]
	add %fp, -60, %l0
	or %l0, 2, %l0
	lduh [%l0], %l0
	add %fp, -52, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -44, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -36, %l6
	or %l6, 2, %l6
	lduh [%l6], %l6
	add %fp, -40, %l7
	or %l7, 2, %l7
	lduh [%fp+-36], %o0
	lduh [%fp+-60], %o1
	lduh [%fp+-52], %o2
	lduh [%fp+-44], %o3
	sth %o0, [%l7]
	add %fp, -48, %l7
	or %l7, 2, %l7
	sth %o3, [%l7]
	sth %l6, [%fp+-40]
	sth %l5, [%fp+-48]
	add %fp, -56, %l5
	or %l5, 2, %l5
	ld [%fp+-40], %l6
	ld [%fp+-48], %l7
	sth %o2, [%l5]
	add %fp, -64, %l5
	or %l5, 2, %l5
	sth %o1, [%l5]
	sth %l4, [%fp+-56]
	sth %l0, [%fp+-64]
	add %i4, %l6, %i4
	xor %i4, %g4, %g4
	srl %g4, 12, %l0
	sll %g4, 20, %g4
	or %g4, %l0, %g4
	add %g2, %l7, %l0
	xor %l0, %l3, %g2
	ld [%fp+-56], %l3
	srl %g2, 12, %l4
	sll %g2, 20, %g2
	or %g2, %l4, %g2
	add %i2, %l3, %i2
	xor %i2, %i5, %i5
	ld [%fp+-64], %l4
	srl %i5, 12, %l5
	sll %i5, 20, %i5
	or %i5, %l5, %i5
	add %l2, %l4, %l2
	xor %l2, %i3, %i3
	srl %i3, 12, %l5
	sll %i3, 20, %i3
	or %i3, %l5, %l5
	ldd [%fp+-1224], %o0
	add %l1, %o0, %i3
	add %i3, %g4, %l1
	xor %l1, %l6, %i3
	srl %i3, 8, %l6
	sll %i3, 24, %i3
	or %i3, %l6, %l6
	add %g3, %o1, %i3
	add %i3, %g2, %g3
	xor %g3, %l7, %i3
	srl %i3, 8, %l7
	sll %i3, 24, %i3
	or %i3, %l7, %l7
	ldd [%fp+-1232], %o2
	add %i1, %o2, %i1
	add %i1, %i5, %o0
	xor %o0, %l3, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %l3
	add %i0, %o3, %i0
	add %i0, %l5, %o1
	xor %o1, %l4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l4
	add %l3, %i2, %i0
	st %i0, [%fp+-1184]
	xor %i0, %i5, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %o2
	add %l4, %l2, %i0
	st %i0, [%fp+-1200]
	xor %i0, %l5, %i2
	srl %i2, 7, %i5
	sll %i2, 25, %i2
	or %i2, %i5, %o7
	ldd [%fp+-1192], %i2
	add %o1, %i3, %i5
	ldd [%fp+-1240], %o4
	add %l1, %o4, %l1
	add %o7, %l1, %i1
	add %o2, %i5, %i0
	mov	%o2, %o1
	xor %i1, %l7, %o3
	std %i0, [%fp+-1272]
	xor %i0, %l6, %o2
	st %o2, [%fp+-84]
	st %o3, [%fp+-92]
	add %l7, %l0, %i5
	add %l6, %i4, %l0
	xor %l0, %g4, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %i4
	xor %i5, %g2, %g2
	srl %g2, 7, %g4
	sll %g2, 25, %g2
	or %g2, %g4, %g2
	ldd [%fp+-1176], %l6
	mov	%i3, %l7
	ldd [%fp+-1216], %o2
	add %g3, %o3, %g3
	std %l6, [%fp+-1176]
	add %o0, %l6, %g4
	add %g2, %g4, %i1
	add %i4, %g3, %i0
	xor %i1, %l4, %l5
	std %i0, [%fp+-1296]
	xor %i0, %l3, %l4
	st %l4, [%fp+-68]
	st %l5, [%fp+-76]
	add %fp, -84, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -92, %g4
	or %g4, 2, %g4
	lduh [%g4], %g4
	add %fp, -68, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -76, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -80, %l3
	or %l3, 2, %l3
	lduh [%fp+-76], %l4
	lduh [%fp+-84], %l5
	lduh [%fp+-92], %l6
	lduh [%fp+-68], %l7
	sth %l4, [%l3]
	add %fp, -72, %l3
	or %l3, 2, %l3
	sth %l7, [%l3]
	sth %l2, [%fp+-80]
	sth %l1, [%fp+-72]
	ld [%fp+-80], %l3
	ld [%fp+-72], %l2
	add %fp, -96, %l1
	or %l1, 2, %l1
	sth %l6, [%l1]
	add %fp, -88, %l1
	or %l1, 2, %l1
	sth %l5, [%l1]
	sth %g4, [%fp+-96]
	sth %g3, [%fp+-88]
	ld [%fp+-96], %l5
	ld [%fp+-88], %l4
	ld [%fp+-1184], %i0
	add %i0, %l5, %i1
	std %l4, [%fp+-1320]
	add %i5, %l4, %i0
	add %l0, %l3, %l1
	std %l2, [%fp+-1312]
	ld [%fp+-1200], %i2
	add %i2, %l2, %l0
	xor %i1, %o7, %l3
	std %i0, [%fp+-1288]
	xor %i0, %o1, %l2
	xor %l1, %g2, %i3
	mov	%o4, %i0
	mov	%o5, %i1
	std %l0, [%fp+-1304]
	xor %l0, %i4, %i2
	mov	%o2, %i0
	mov	%o3, %i1
	mov	%i1, %o5
	sll %l2, 20, %l0
	sll %l3, 20, %l1
	sll %i2, 20, %l6
	sll %i3, 20, %l7
	mov	%g0, %i0
.LBB0_1:
	sth %l4, [%fp+-272]
	sth %l5, [%fp+-270]
	sth %g2, [%fp+-268]
	sth %g3, [%fp+-266]
	sth %o2, [%fp+-264]
	sth %o3, [%fp+-262]
	sth %i4, [%fp+-260]
	sth %i5, [%fp+-258]
	and %i0, 7, %i1
	sll %i1, 1, %i4
	mov	204, %i1
	add %fp, -272, %i5
	sth %i1, [%i5+%i4]
	lduh [%fp+-260], %i4
	lduh [%fp+-258], %i5
	lduh [%fp+-264], %o2
	lduh [%fp+-262], %o3
	lduh [%fp+-268], %g2
	lduh [%fp+-266], %g3
	lduh [%fp+-272], %l4
	add %i0, 1, %i0
	cmp %i0, 8
	bne	.LBB0_1
	lduh [%fp+-270], %l5
	st %f2, [%fp+-300]
	st %f2, [%fp+-304]
	st %f3, [%fp+-292]
	st %f3, [%fp+-296]
	ld [%fp+-300], %i0
	st %i0, [%fp+-1328]
	ld [%fp+-304], %i0
	st %i0, [%fp+-1332]
	ld [%fp+-292], %i0
	st %i0, [%fp+-1336]
	ld [%fp+-296], %i0
	st %i0, [%fp+-1340]
	and %i4, 64, %i0
	and %o2, 16, %g4
	srl %g4, 4, %g4
	mov	-1, %o7
	cmp %g4, 0
	mov	%g0, %g4
	bne	.LBB0_4
	mov	%o7, %o0
	mov	%g4, %o0
.LBB0_4:
	srl %i0, 6, %i0
	cmp %i0, 0
	and %l4, 1, %i0
	bne	.LBB0_6
	mov	%o7, %o1
	mov	%g4, %o1
.LBB0_6:
	cmp %i0, 0
	and %g2, 4, %i0
	bne	.LBB0_8
	st %o7, [%fp+-1248]
	st %g4, [%fp+-1248]
.LBB0_8:
	srl %i0, 2, %i0
	cmp %i0, 0
	and %o3, 32, %i0
	bne	.LBB0_10
	mov	%o7, %o2
	mov	%g4, %o2
.LBB0_10:
	srl %i0, 5, %i0
	cmp %i0, 0
	and %i5, 128, %i0
	bne	.LBB0_12
	mov	%o7, %i5
	mov	%g4, %i5
.LBB0_12:
	st %o2, [%fp+-1344]
	srl %i0, 7, %i0
	cmp %i0, 0
	and %l5, 2, %l5
	bne	.LBB0_14
	mov	%o7, %l4
	mov	%g4, %l4
.LBB0_14:
	mov	%o1, %o2
	mov	%o0, %o3
	srl %l3, 12, %i0
	srl %l2, 12, %i4
	srl %i3, 12, %l2
	srl %i2, 12, %i2
	srl %l5, 1, %i3
	cmp %i3, 0
	and %g3, 8, %g3
	bne	.LBB0_16
	mov	%o7, %g2
	mov	%g4, %g2
.LBB0_16:
	mov	%o4, %o0
	mov	%o5, %o1
	mov	%o5, %o4
	std %o4, [%fp+-1200]
	ldd [%fp+-1176], %o4
	mov	%o5, %o4
	std %o4, [%fp+-1184]
	or %l6, %i2, %i2
	or %l7, %l2, %i3
	or %l0, %i4, %i4
	srl %g3, 3, %g3
	cmp %g3, 0
	bne	.LBB0_18
	or %l1, %i0, %i0
	mov	%g4, %o7
.LBB0_18:
	add %fp, -284, %g3
	or %g3, 2, %g3
	sth %o7, [%g3]
	add %fp, -288, %g3
	or %g3, 2, %g3
	sth %g2, [%g3]
	add %fp, -276, %g2
	or %g2, 2, %g2
	sth %l4, [%g2]
	add %fp, -280, %g2
	or %g2, 2, %g2
	sth %i5, [%g2]
	ld [%fp+-1344], %i5
	sth %i5, [%fp+-284]
	ld [%fp+-1248], %i5
	sth %i5, [%fp+-288]
	sth %o2, [%fp+-276]
	sth %o3, [%fp+-280]
	ld [%fp+-280], %i5
	ldd [%fp+-1200], %g2
	ldd [%fp+-1176], %l0
	mov	%l0, %g3
	std %g2, [%fp+-1200]
	ldd [%fp+-1184], %g2
	mov	%o0, %g3
	std %g2, [%fp+-1184]
	ld [%fp+-276], %g2
	ld [%fp+-1340], %g3
	and %i5, %g3, %g3
	ldd [%fp+-1216], %l2
	andn %l2, %i5, %i5
	ld [%fp+-288], %l0
	andn %l2, %g2, %l1
	ld [%fp+-284], %l2
	ld [%fp+-1336], %l3
	and %g2, %l3, %g2
	ld [%fp+-1332], %l3
	and %l0, %l3, %l3
	ldd [%fp+-1240], %l4
	andn %l5, %l0, %l0
	andn %l5, %l2, %l4
	ld [%fp+-1328], %l5
	and %l2, %l5, %l2
	or %l4, %l2, %l5
	or %l0, %l3, %l4
	or %l1, %g2, %l3
	or %i5, %g3, %l2
	ldd [%fp+-1272], %g2
	add %i0, %g3, %i5
	add %i4, %g2, %g2
	ldd [%fp+-1296], %l0
	add %i3, %l1, %g3
	add %i2, %l0, %l0
	add %l0, %l4, %l6
	std %l4, [%fp+-1216]
	add %g3, %l5, %l7
	add %g2, %l2, %l0
	std %l2, [%fp+-1176]
	add %i5, %l3, %l1
	ldd [%fp+-1312], %g2
	xor %l6, %g2, %i5
	std %l6, [%fp+-1296]
	xor %l7, %g3, %g2
	ldd [%fp+-1320], %l2
	xor %l0, %l2, %g3
	xor %l1, %l3, %l2
	srl %l2, 8, %l3
	srl %g3, 8, %l6
	srl %g2, 8, %l7
	srl %i5, 8, %l4
	sll %l2, 24, %l2
	sll %g3, 24, %g3
	sll %g2, 24, %g2
	sll %i5, 24, %i5
	or %i5, %l4, %l4
	or %g2, %l7, %l5
	or %g3, %l6, %o4
	or %l2, %l3, %o5
	ldd [%fp+-1304], %g2
	add %l4, %g2, %l2
	add %l5, %g3, %l3
	ldd [%fp+-1288], %g2
	add %o4, %g2, %l6
	add %o5, %g3, %l7
	xor %l2, %i2, %i2
	std %l2, [%fp+-1240]
	xor %l3, %i3, %i3
	xor %l6, %i4, %i4
	std %l6, [%fp+-1272]
	xor %l7, %i0, %i0
	srl %i0, 7, %i5
	srl %i4, 7, %g2
	srl %i3, 7, %g3
	srl %i2, 7, %l2
	sll %i0, 25, %i0
	sll %i4, 25, %i4
	sll %i3, 25, %i3
	sll %i2, 25, %i2
	or %i2, %l2, %l2
	or %i3, %g3, %l3
	std %l2, [%fp+-1288]
	or %i4, %g2, %i2
	or %i0, %i5, %i3
	std %i2, [%fp+-1304]
	mov	192, %i2
.LBB0_19:
	sth %i4, [%fp+-320]
	sth %i5, [%fp+-318]
	sth %l2, [%fp+-316]
	sth %l3, [%fp+-314]
	sth %l6, [%fp+-312]
	sth %l7, [%fp+-310]
	sth %o2, [%fp+-308]
	sth %o3, [%fp+-306]
	and %g4, 7, %i0
	sll %i0, 1, %i0
	add %fp, -320, %i3
	sth %i2, [%i3+%i0]
	lduh [%fp+-308], %o2
	lduh [%fp+-306], %o3
	lduh [%fp+-312], %l6
	lduh [%fp+-310], %l7
	lduh [%fp+-316], %l2
	lduh [%fp+-314], %l3
	lduh [%fp+-320], %i4
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB0_19
	lduh [%fp+-318], %i5
	st %f0, [%fp+-412]
	st %f1, [%fp+-416]
	ld [%fp+-412], %o0
	ld [%fp+-416], %i0
	st %i0, [%fp+-1312]
	and %l6, 16, %i0
	and %i4, 1, %i3
	mov	-1, %o7
	cmp %i3, 0
	mov	%g0, %i3
	bne	.LBB0_22
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_22:
	srl %i0, 4, %i0
	cmp %i0, 0
	and %o2, 64, %g2
	bne	.LBB0_24
	mov	%o7, %i0
	mov	%i3, %i0
.LBB0_24:
	srl %g2, 6, %g2
	cmp %g2, 0
	and %l2, 4, %g3
	bne	.LBB0_26
	mov	%o7, %g2
	mov	%i3, %g2
.LBB0_26:
	srl %g3, 2, %g3
	cmp %g3, 0
	and %i5, 2, %i5
	bne	.LBB0_28
	mov	%o7, %i4
	mov	%i3, %i4
.LBB0_28:
	srl %i5, 1, %i5
	cmp %i5, 0
	and %l7, 32, %g3
	bne	.LBB0_30
	mov	%o7, %i5
	mov	%i3, %i5
.LBB0_30:
	srl %g3, 5, %g3
	cmp %g3, 0
	and %o3, 128, %l6
	bne	.LBB0_32
	mov	%o7, %g3
	mov	%i3, %g3
.LBB0_32:
	srl %l6, 7, %l6
	cmp %l6, 0
	and %l3, 8, %l3
	bne	.LBB0_34
	mov	%o7, %l2
	mov	%i3, %l2
.LBB0_34:
	srl %l3, 3, %l3
	cmp %l3, 0
	bne	.LBB0_36
	st %i1, [%fp+-1252]
	mov	%i3, %o7
.LBB0_36:
	add %fp, -332, %l3
	or %l3, 2, %l3
	sth %o7, [%l3]
	add %fp, -324, %l3
	or %l3, 2, %l3
	sth %l2, [%l3]
	add %fp, -328, %l2
	or %l2, 2, %l2
	sth %g3, [%l2]
	add %fp, -336, %g3
	or %g3, 2, %g3
	sth %i5, [%g3]
	sth %i4, [%fp+-332]
	sth %g2, [%fp+-324]
	sth %i0, [%fp+-328]
	sth %g4, [%fp+-336]
	ld [%fp+-324], %i0
	ld [%fp+-332], %i4
	andn %o0, %i0, %i5
	ldd [%fp+-1264], %l6
	and %i0, %l7, %i0
	ldd [%fp+-1208], %o0
	and %i4, %o1, %g2
	ldd [%fp+-1224], %l2
	andn %l3, %i4, %i4
	ld [%fp+-328], %g3
	ld [%fp+-336], %g4
	or %i4, %g2, %o3
	or %i5, %i0, %o2
	and %g3, %l6, %i0
	andn %l2, %g4, %i4
	ld [%fp+-1312], %i1
	andn %i1, %g3, %i5
	and %g4, %o0, %g2
	or %i5, %i0, %l3
	or %i4, %g2, %l2
	ldd [%fp+-1296], %l6
	ldd [%fp+-1304], %o0
	add %o0, %l7, %i0
	std %o2, [%fp+-1248]
	add %i0, %o2, %g4
	add %o1, %l0, %i0
	add %i0, %o3, %i0
	st %i0, [%fp+-1312]
	xor %i0, %l5, %i5
	xor %g4, %l4, %i4
	ldd [%fp+-1288], %o2
	add %o2, %l1, %g2
	add %o3, %l6, %g3
	add %g3, %l3, %g3
	std %l2, [%fp+-1224]
	add %g2, %l2, %o7
	st %i5, [%fp+-348]
	st %i4, [%fp+-340]
	xor %o7, %o4, %i4
	xor %g3, %o5, %i5
	st %i5, [%fp+-364]
	st %i4, [%fp+-356]
	add %fp, -348, %i4
	or %i4, 2, %i4
	lduh [%i4], %l0
	add %fp, -340, %i4
	or %i4, 2, %i4
	lduh [%i4], %l1
	add %fp, -364, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -356, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -360, %l2
	or %l2, 2, %l2
	lduh [%fp+-356], %l3
	lduh [%fp+-348], %l4
	lduh [%fp+-340], %l5
	lduh [%fp+-364], %l6
	sth %l3, [%l2]
	add %fp, -368, %l2
	or %l2, 2, %l2
	sth %l6, [%l2]
	sth %i5, [%fp+-360]
	sth %i4, [%fp+-368]
	add %fp, -344, %i4
	or %i4, 2, %l2
	ld [%fp+-360], %i5
	ld [%fp+-368], %i0
	st %i0, [%fp+-1296]
	sth %l5, [%l2]
	add %fp, -352, %l2
	or %l2, 2, %l2
	sth %l4, [%l2]
	sth %l1, [%fp+-344]
	sth %l0, [%fp+-352]
	ld [%fp+-352], %l3
	ld [%fp+-344], %l4
	ldd [%fp+-1240], %l6
	add %l7, %i5, %l1
	add %l6, %l3, %l0
	ldd [%fp+-1272], %l6
	add %l6, %i0, %l2
	add %l7, %l4, %l5
	xor %l5, %o0, %l6
	xor %l0, %o1, %l7
	xor %l1, %o2, %o0
	xor %l2, %o3, %o1
	ldd [%fp+-1192], %o4
	ldd [%fp+-1232], %o2
	mov	%o2, %o5
	add %g3, %o2, %i4
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1208], %i0
	mov	%i1, %g2
	or %o1, %o2, %o1
	mov	%o5, %g3
	std %g2, [%fp+-1264]
	mov	%i0, %o5
	std %o4, [%fp+-1192]
	add %g4, %o4, %g4
	add %g4, %l6, %o2
	xor %o2, %l4, %g4
	srl %g4, 8, %l4
	sll %g4, 24, %g4
	or %g4, %l4, %l4
	mov	%i0, %g2
	mov	%i1, %g3
	ld [%fp+-1312], %i0
	add %i0, %g2, %i0
	add %i0, %l7, %o3
	xor %o3, %l3, %i0
	srl %i0, 8, %g4
	sll %i0, 24, %i0
	or %i0, %g4, %l3
	add %o7, %g3, %i0
	add %i0, %o0, %o4
	xor %o4, %i5, %i0
	srl %i0, 8, %i5
	sll %i0, 24, %i0
	or %i0, %i5, %o5
	add %i4, %o1, %o7
	ld [%fp+-1296], %i0
	xor %o7, %i0, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %i5
	add %l4, %l5, %i0
	st %i0, [%fp+-1232]
	xor %i0, %l6, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l6
	add %l3, %l0, %l0
	xor %l0, %l7, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i4
	add %o5, %l1, %l1
	xor %l1, %o0, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g2
	add %i5, %l2, %g4
	xor %g4, %o1, %g3
	srl %g3, 7, %l2
	sll %g3, 25, %g3
	or %g3, %l2, %g3
	ldd [%fp+-1200], %i0
	add %o7, %i1, %l2
	ldd [%fp+-1216], %i0
	add %o2, %i1, %l5
	add %g3, %l5, %i1
	add %g2, %l2, %i0
	ldd [%fp+-1176], %o0
	add %o3, %o1, %l2
	ldd [%fp+-1184], %o0
	add %o4, %o0, %l5
	add %i4, %l5, %o3
	add %l6, %l2, %o2
	xor %o3, %i5, %o1
	std %o2, [%fp+-1288]
	xor %o2, %o5, %o0
	st %o0, [%fp+-388]
	st %o1, [%fp+-396]
	xor %i1, %l3, %l3
	std %i0, [%fp+-1272]
	xor %i0, %l4, %l2
	st %l2, [%fp+-372]
	st %l3, [%fp+-380]
	add %fp, -388, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	add %fp, -396, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -372, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -380, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -384, %l5
	or %l5, 2, %l5
	lduh [%fp+-380], %l7
	lduh [%fp+-388], %o0
	lduh [%fp+-396], %o1
	lduh [%fp+-372], %o2
	sth %l7, [%l5]
	add %fp, -376, %l5
	or %l5, 2, %l5
	sth %o2, [%l5]
	sth %l4, [%fp+-384]
	sth %l3, [%fp+-376]
	ld [%fp+-384], %l5
	ld [%fp+-376], %l4
	add %fp, -400, %l3
	or %l3, 2, %l3
	sth %o1, [%l3]
	add %fp, -392, %l3
	or %l3, 2, %l3
	sth %o0, [%l3]
	sth %l2, [%fp+-400]
	sth %i0, [%fp+-392]
	ld [%fp+-400], %o1
	ld [%fp+-392], %o0
	add %l1, %l5, %l3
	std %l4, [%fp+-1312]
	add %l0, %l4, %l2
	ld [%fp+-1232], %i0
	add %i0, %o1, %i1
	add %g4, %o0, %i0
	xor %l3, %g3, %l5
	std %l2, [%fp+-1304]
	xor %l2, %g2, %l4
	ldd [%fp+-1248], %g2
	st %g2, [%fp+-404]
	ld [%fp+-404], %f0
	ldd [%fp+-1208], %g2
	st %g2, [%fp+-408]
	ldd [%fp+-1216], %g2
	mov	%g3, %g2
	xor %i1, %i4, %i5
	ldd [%fp+-1184], %l0
	std %i0, [%fp+-1296]
	xor %i0, %l6, %i4
	ldd [%fp+-1176], %i0
	mov	%i1, %g3
	std %g2, [%fp+-1232]
	ldd [%fp+-1200], %i0
	mov	%i1, %l1
	std %l0, [%fp+-1240]
	ld [%fp+-408], %f1
	sll %l4, 20, %l2
	sll %l5, 20, %l3
	sll %i4, 20, %o2
	sll %i5, 20, %o3
	ld [%fp+-1252], %i1
.LBB0_37:
	sth %g2, [%fp+-432]
	sth %g3, [%fp+-430]
	sth %o4, [%fp+-428]
	sth %o5, [%fp+-426]
	sth %l0, [%fp+-424]
	sth %l1, [%fp+-422]
	sth %l6, [%fp+-420]
	sth %l7, [%fp+-418]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -432, %g2
	sth %i1, [%g2+%i0]
	lduh [%fp+-420], %l6
	lduh [%fp+-418], %l7
	lduh [%fp+-424], %l0
	lduh [%fp+-422], %l1
	lduh [%fp+-428], %o4
	lduh [%fp+-426], %o5
	lduh [%fp+-432], %g2
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_37
	lduh [%fp+-430], %g3
	st %f0, [%fp+-460]
	st %f0, [%fp+-464]
	st %f1, [%fp+-452]
	st %f1, [%fp+-456]
	ld [%fp+-460], %i0
	st %i0, [%fp+-1320]
	ld [%fp+-464], %i0
	st %i0, [%fp+-1328]
	ld [%fp+-452], %i0
	st %i0, [%fp+-1332]
	ld [%fp+-456], %i0
	st %i0, [%fp+-1336]
	and %l6, 64, %i0
	and %l0, 16, %i3
	srl %i3, 4, %i3
	mov	-1, %g4
	cmp %i3, 0
	mov	%g0, %i3
	bne	.LBB0_40
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_40:
	st %o7, [%fp+-1340]
	srl %i0, 6, %i0
	cmp %i0, 0
	and %g2, 1, %i0
	bne	.LBB0_42
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_42:
	st %o7, [%fp+-1344]
	cmp %i0, 0
	and %o4, 4, %i0
	bne	.LBB0_44
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_44:
	srl %i0, 2, %i0
	cmp %i0, 0
	and %l1, 32, %i0
	bne	.LBB0_46
	mov	%g4, %l0
	mov	%i3, %l0
.LBB0_46:
	srl %i0, 5, %i0
	cmp %i0, 0
	and %l7, 128, %i0
	bne	.LBB0_48
	mov	%g4, %l1
	mov	%i3, %l1
.LBB0_48:
	srl %i0, 7, %i0
	cmp %i0, 0
	and %g3, 2, %l6
	bne	.LBB0_50
	mov	%g4, %g2
	mov	%i3, %g2
.LBB0_50:
	srl %i5, 12, %i0
	srl %i4, 12, %i4
	srl %l5, 12, %g3
	srl %l4, 12, %l4
	srl %l6, 1, %i5
	cmp %i5, 0
	and %o5, 8, %l5
	bne	.LBB0_52
	mov	%g4, %i5
	mov	%i3, %i5
.LBB0_52:
	ldd [%fp+-1240], %l6
	mov	%l7, %l6
	std %l6, [%fp+-1208]
	ldd [%fp+-1232], %l6
	mov	%l7, %l6
	or %l2, %l4, %o4
	or %l3, %g3, %o5
	or %o2, %i4, %i4
	srl %l5, 3, %g3
	cmp %g3, 0
	bne	.LBB0_54
	or %o3, %i0, %i0
	mov	%i3, %g4
.LBB0_54:
	add %fp, -444, %g3
	or %g3, 2, %g3
	sth %g4, [%g3]
	add %fp, -448, %g3
	or %g3, 2, %g3
	sth %i5, [%g3]
	add %fp, -436, %i5
	or %i5, 2, %i5
	sth %g2, [%i5]
	add %fp, -440, %i5
	or %i5, 2, %i5
	sth %l1, [%i5]
	sth %l0, [%fp+-444]
	sth %o7, [%fp+-448]
	ld [%fp+-1344], %i5
	sth %i5, [%fp+-436]
	ld [%fp+-1340], %i5
	sth %i5, [%fp+-440]
	ld [%fp+-440], %i5
	ldd [%fp+-1208], %g2
	ldd [%fp+-1232], %l0
	mov	%l0, %g3
	std %g2, [%fp+-1208]
	ldd [%fp+-1240], %g2
	mov	%g2, %l7
	std %l6, [%fp+-1240]
	ld [%fp+-436], %g2
	ld [%fp+-1336], %g3
	and %i5, %g3, %g3
	ldd [%fp+-1200], %l0
	andn %l0, %i5, %i5
	ld [%fp+-448], %g4
	andn %l0, %g2, %l0
	ld [%fp+-444], %l1
	ld [%fp+-1332], %l2
	and %g2, %l2, %g2
	ld [%fp+-1328], %l2
	and %g4, %l2, %l2
	ldd [%fp+-1184], %l4
	andn %l5, %g4, %g4
	andn %l5, %l1, %l3
	ld [%fp+-1320], %l4
	and %l1, %l4, %l1
	or %l3, %l1, %l5
	or %g4, %l2, %l4
	or %l0, %g2, %l1
	or %i5, %g3, %l0
	ldd [%fp+-1288], %g2
	add %i0, %g3, %i5
	add %i4, %g2, %g2
	ldd [%fp+-1272], %l2
	add %o5, %l3, %g3
	add %o4, %l2, %g4
	add %g4, %l4, %l6
	std %l4, [%fp+-1232]
	add %g3, %l5, %l7
	add %g2, %l0, %l2
	std %l0, [%fp+-1184]
	add %i5, %l1, %l3
	ldd [%fp+-1312], %g2
	xor %l6, %g2, %i5
	std %l6, [%fp+-1320]
	xor %l7, %g3, %g2
	xor %l2, %o0, %g3
	xor %l3, %o1, %g4
	srl %g4, 8, %l0
	srl %g3, 8, %l1
	srl %g2, 8, %l4
	srl %i5, 8, %l5
	sll %g4, 24, %g4
	sll %g3, 24, %g3
	sll %g2, 24, %g2
	sll %i5, 24, %i5
	or %i5, %l5, %o2
	or %g2, %l4, %o3
	or %g3, %l1, %l4
	or %g4, %l0, %l5
	ldd [%fp+-1304], %g2
	add %o2, %g2, %l0
	add %o3, %g3, %l1
	ldd [%fp+-1296], %g2
	add %l4, %g2, %l6
	add %l5, %g3, %l7
	xor %l0, %o4, %i5
	std %l0, [%fp+-1200]
	xor %l1, %o5, %g2
	xor %l6, %i4, %i4
	std %l6, [%fp+-1272]
	xor %l7, %i0, %i0
	srl %i0, 7, %g3
	srl %i4, 7, %g4
	srl %g2, 7, %l0
	srl %i5, 7, %l1
	sll %i0, 25, %i0
	sll %i4, 25, %i4
	sll %g2, 25, %g2
	sll %i5, 25, %i5
	or %i5, %l1, %l6
	or %g2, %l0, %l7
	std %l6, [%fp+-1288]
	or %i4, %g4, %i4
	or %i0, %g3, %i5
	std %i4, [%fp+-1296]
.LBB0_55:
	sth %l6, [%fp+-480]
	sth %l7, [%fp+-478]
	sth %i4, [%fp+-476]
	sth %i5, [%fp+-474]
	sth %g2, [%fp+-472]
	sth %g3, [%fp+-470]
	sth %o4, [%fp+-468]
	sth %o5, [%fp+-466]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -480, %i4
	sth %i2, [%i4+%i0]
	lduh [%fp+-468], %o4
	lduh [%fp+-466], %o5
	lduh [%fp+-472], %g2
	lduh [%fp+-470], %g3
	lduh [%fp+-476], %i4
	lduh [%fp+-474], %i5
	lduh [%fp+-480], %l6
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_55
	lduh [%fp+-478], %l7
	and %g2, 16, %g4
	and %l6, 1, %i0
	mov	-1, %o7
	cmp %i0, 0
	mov	%g0, %i3
	bne	.LBB0_58
	mov	%o7, %i0
	mov	%i3, %i0
.LBB0_58:
	srl %g4, 4, %g4
	cmp %g4, 0
	and %o4, 64, %l0
	bne	.LBB0_60
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_60:
	srl %l0, 6, %l0
	cmp %l0, 0
	and %i4, 4, %l1
	bne	.LBB0_62
	mov	%o7, %l0
	mov	%i3, %l0
.LBB0_62:
	srl %l1, 2, %l1
	cmp %l1, 0
	and %l7, 2, %l6
	bne	.LBB0_64
	mov	%o7, %l1
	mov	%i3, %l1
.LBB0_64:
	srl %l6, 1, %l6
	cmp %l6, 0
	and %g3, 32, %g3
	bne	.LBB0_66
	mov	%o7, %g2
	mov	%i3, %g2
.LBB0_66:
	srl %g3, 5, %g3
	cmp %g3, 0
	and %o5, 128, %l6
	bne	.LBB0_68
	mov	%o7, %g3
	mov	%i3, %g3
.LBB0_68:
	srl %l6, 7, %l6
	cmp %l6, 0
	and %i5, 8, %i5
	bne	.LBB0_70
	mov	%o7, %i4
	mov	%i3, %i4
.LBB0_70:
	srl %i5, 3, %i5
	cmp %i5, 0
	bne	.LBB0_72
	nop
	mov	%i3, %o7
.LBB0_72:
	add %fp, -492, %i5
	or %i5, 2, %i5
	sth %o7, [%i5]
	add %fp, -484, %i5
	or %i5, 2, %i5
	sth %i4, [%i5]
	add %fp, -488, %i4
	or %i4, 2, %i4
	sth %g3, [%i4]
	add %fp, -496, %i4
	or %i4, 2, %i4
	sth %g2, [%i4]
	sth %l1, [%fp+-492]
	sth %l0, [%fp+-484]
	sth %g4, [%fp+-488]
	sth %i0, [%fp+-496]
	ld [%fp+-488], %i0
	ld [%fp+-484], %i4
	ldd [%fp+-1248], %g2
	and %i0, %g2, %i5
	and %i4, %g3, %g2
	ld [%fp+-492], %g3
	ldd [%fp+-1216], %l0
	andn %l0, %i0, %i0
	andn %l1, %i4, %i4
	ld [%fp+-496], %g4
	ldd [%fp+-1224], %o4
	and %g3, %o5, %l0
	ldd [%fp+-1264], %l6
	andn %l7, %g3, %g3
	or %g3, %l0, %o1
	or %i4, %g2, %o0
	andn %l6, %g4, %i4
	and %g4, %o4, %g2
	or %i0, %i5, %l1
	or %i4, %g2, %l0
	ldd [%fp+-1320], %l6
	ldd [%fp+-1296], %o4
	add %o4, %l7, %i0
	std %o0, [%fp+-1248]
	add %i0, %o0, %o7
	add %o5, %l2, %i0
	add %i0, %o1, %i0
	st %i0, [%fp+-1264]
	xor %i0, %o3, %g3
	xor %o7, %o2, %g2
	ldd [%fp+-1288], %o2
	add %o2, %l3, %i5
	add %o3, %l6, %i4
	add %i4, %l1, %i4
	std %l0, [%fp+-1216]
	add %i5, %l0, %g4
	st %g3, [%fp+-508]
	st %g2, [%fp+-500]
	xor %g4, %l4, %g2
	xor %i4, %l5, %g3
	st %g3, [%fp+-524]
	st %g2, [%fp+-516]
	add %fp, -508, %i5
	or %i5, 2, %i5
	lduh [%i5], %g2
	add %fp, -500, %i5
	or %i5, 2, %i5
	lduh [%i5], %g3
	add %fp, -524, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -516, %l0
	or %l0, 2, %l0
	lduh [%l0], %l0
	add %fp, -520, %l1
	or %l1, 2, %l1
	lduh [%fp+-516], %l2
	lduh [%fp+-508], %l3
	lduh [%fp+-500], %l4
	lduh [%fp+-524], %l5
	sth %l2, [%l1]
	add %fp, -528, %l1
	or %l1, 2, %l1
	sth %l5, [%l1]
	sth %l0, [%fp+-520]
	sth %i5, [%fp+-528]
	add %fp, -504, %i5
	or %i5, 2, %l0
	ld [%fp+-520], %l1
	ld [%fp+-528], %i5
	sth %l4, [%l0]
	add %fp, -512, %l0
	or %l0, 2, %l0
	sth %l3, [%l0]
	sth %g3, [%fp+-504]
	sth %g2, [%fp+-512]
	ld [%fp+-512], %l2
	ld [%fp+-504], %l3
	ldd [%fp+-1200], %l4
	add %l5, %l1, %g2
	add %l4, %l2, %l0
	ldd [%fp+-1272], %l4
	add %l4, %i5, %g3
	add %l5, %l3, %l4
	xor %l4, %o4, %l5
	xor %l0, %o5, %l6
	xor %g2, %o2, %l7
	xor %g3, %o3, %o0
	ldd [%fp+-1176], %o4
	ldd [%fp+-1192], %o2
	mov	%o2, %o5
	add %i4, %o2, %i4
	srl %o0, 12, %o1
	srl %l5, 12, %o2
	sll %l5, 20, %l5
	or %l5, %o2, %l5
	srl %l6, 12, %o2
	sll %l6, 20, %l6
	or %l6, %o2, %l6
	srl %l7, 12, %o2
	sll %o0, 20, %o0
	sll %l7, 20, %l7
	or %l7, %o2, %l7
	ldd [%fp+-1224], %i0
	mov	%i1, %o2
	or %o0, %o1, %o0
	mov	%o5, %o3
	std %o2, [%fp+-1288]
	mov	%i0, %o5
	std %o4, [%fp+-1176]
	add %o7, %o4, %o1
	add %o1, %l5, %o1
	xor %o1, %l3, %l3
	srl %l3, 8, %o2
	sll %l3, 24, %l3
	or %l3, %o2, %l3
	mov	%i0, %o4
	mov	%i1, %o5
	ld [%fp+-1264], %i0
	add %i0, %o4, %i0
	add %i0, %l6, %o2
	xor %o2, %l2, %i0
	srl %i0, 8, %l2
	sll %i0, 24, %i0
	or %i0, %l2, %l2
	add %g4, %o5, %i0
	add %i0, %l7, %o3
	xor %o3, %l1, %i0
	srl %i0, 8, %g4
	sll %i0, 24, %i0
	or %i0, %g4, %o4
	add %i4, %o0, %o5
	xor %o5, %i5, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o7
	add %l3, %l4, %i0
	st %i0, [%fp+-1192]
	xor %i0, %l5, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i1
	add %l2, %l0, %l0
	xor %l0, %l6, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %i0
	add %o4, %g2, %l1
	xor %l1, %l7, %g2
	srl %g2, 7, %g4
	sll %g2, 25, %g2
	or %g2, %g4, %g2
	add %o7, %g3, %g4
	xor %g4, %o0, %g3
	srl %g3, 7, %l4
	sll %g3, 25, %g3
	or %g3, %l4, %g3
	ldd [%fp+-1208], %i4
	add %o5, %i5, %l4
	ldd [%fp+-1232], %i4
	add %o1, %i5, %l5
	add %g3, %l5, %l7
	add %g2, %l4, %l6
	ldd [%fp+-1184], %i4
	add %o2, %i5, %l4
	ldd [%fp+-1240], %i4
	add %o3, %i4, %l5
	add %i0, %l5, %o1
	add %i1, %l4, %o0
	xor %o1, %o7, %l5
	std %o0, [%fp+-1296]
	xor %o0, %o4, %l4
	st %l4, [%fp+-548]
	st %l5, [%fp+-556]
	xor %l7, %l2, %l5
	std %l6, [%fp+-1272]
	xor %l6, %l3, %l4
	st %l4, [%fp+-532]
	st %l5, [%fp+-540]
	add %fp, -548, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -556, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -532, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -540, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -544, %l6
	or %l6, 2, %l6
	lduh [%fp+-540], %l7
	lduh [%fp+-548], %o0
	lduh [%fp+-556], %o1
	lduh [%fp+-532], %o2
	sth %l7, [%l6]
	add %fp, -536, %l6
	or %l6, 2, %l6
	sth %o2, [%l6]
	sth %l5, [%fp+-544]
	sth %l4, [%fp+-536]
	ld [%fp+-544], %l7
	ld [%fp+-536], %l6
	add %fp, -560, %l4
	or %l4, 2, %l4
	sth %o1, [%l4]
	add %fp, -552, %l4
	or %l4, 2, %l4
	sth %o0, [%l4]
	sth %l3, [%fp+-560]
	sth %l2, [%fp+-552]
	ld [%fp+-560], %o1
	ld [%fp+-552], %o0
	add %l1, %l7, %l3
	std %l6, [%fp+-1320]
	add %l0, %l6, %l2
	ld [%fp+-1192], %l0
	add %l0, %o1, %l1
	add %g4, %o0, %l0
	xor %l3, %g3, %o5
	std %l2, [%fp+-1312]
	xor %l2, %g2, %o4
	ldd [%fp+-1248], %g2
	st %g2, [%fp+-564]
	ld [%fp+-564], %f0
	ldd [%fp+-1224], %g2
	st %g2, [%fp+-568]
	ldd [%fp+-1232], %g2
	mov	%g3, %l2
	xor %l1, %i0, %g3
	std %l0, [%fp+-1304]
	xor %l0, %i1, %g2
	ldd [%fp+-1184], %i0
	mov	%i1, %l3
	std %l2, [%fp+-1192]
	ldd [%fp+-1208], %i0
	mov	%i1, %i5
	std %i4, [%fp+-1224]
	ld [%fp+-568], %f1
	sll %o4, 20, %o2
	sll %o5, 20, %o3
	sll %g2, 20, %i4
	sll %g3, 20, %i5
	ld [%fp+-1252], %i1
.LBB0_73:
	sth %l2, [%fp+-584]
	sth %l3, [%fp+-582]
	sth %l0, [%fp+-580]
	sth %l1, [%fp+-578]
	sth %l4, [%fp+-576]
	sth %l5, [%fp+-574]
	sth %l6, [%fp+-572]
	sth %l7, [%fp+-570]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -584, %g4
	sth %i1, [%g4+%i0]
	lduh [%fp+-572], %l6
	lduh [%fp+-570], %l7
	lduh [%fp+-576], %l4
	lduh [%fp+-574], %l5
	lduh [%fp+-580], %l0
	lduh [%fp+-578], %l1
	lduh [%fp+-584], %l2
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_73
	lduh [%fp+-582], %l3
	st %f0, [%fp+-612]
	st %f0, [%fp+-616]
	st %f1, [%fp+-604]
	st %f1, [%fp+-608]
	ld [%fp+-612], %i0
	st %i0, [%fp+-1340]
	ld [%fp+-616], %i0
	st %i0, [%fp+-1328]
	ld [%fp+-604], %i0
	st %i0, [%fp+-1332]
	ld [%fp+-608], %i0
	st %i0, [%fp+-1336]
	and %l6, 64, %i0
	and %l4, 16, %i3
	srl %i3, 4, %i3
	mov	-1, %g4
	cmp %i3, 0
	mov	%g0, %i3
	bne	.LBB0_76
	mov	%g4, %i1
	mov	%i3, %i1
.LBB0_76:
	st %i1, [%fp+-1264]
	srl %i0, 6, %i0
	cmp %i0, 0
	and %l2, 1, %i0
	bne	.LBB0_78
	mov	%g4, %i1
	mov	%i3, %i1
.LBB0_78:
	cmp %i0, 0
	and %l0, 4, %i0
	bne	.LBB0_80
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_80:
	srl %i0, 2, %i0
	cmp %i0, 0
	and %l5, 32, %i0
	bne	.LBB0_82
	mov	%g4, %l4
	mov	%i3, %l4
.LBB0_82:
	srl %i0, 5, %i0
	cmp %i0, 0
	and %l7, 128, %i0
	bne	.LBB0_84
	mov	%g4, %l5
	mov	%i3, %l5
.LBB0_84:
	srl %i0, 7, %i0
	cmp %i0, 0
	and %l3, 2, %l6
	bne	.LBB0_86
	mov	%g4, %l2
	mov	%i3, %l2
.LBB0_86:
	srl %g3, 12, %i0
	srl %g2, 12, %l3
	srl %o5, 12, %g3
	srl %o4, 12, %g2
	srl %l6, 1, %l6
	cmp %l6, 0
	and %l1, 8, %l6
	bne	.LBB0_88
	mov	%g4, %l1
	mov	%i3, %l1
.LBB0_88:
	ldd [%fp+-1224], %o4
	mov	%o5, %o4
	std %o4, [%fp+-1200]
	ldd [%fp+-1192], %o4
	mov	%o5, %o4
	or %o2, %g2, %g2
	or %o3, %g3, %g3
	or %i4, %l3, %l0
	srl %l6, 3, %l3
	cmp %l3, 0
	bne	.LBB0_90
	or %i5, %i0, %i0
	mov	%i3, %g4
.LBB0_90:
	add %fp, -596, %i4
	or %i4, 2, %i4
	sth %g4, [%i4]
	add %fp, -600, %i4
	or %i4, 2, %i4
	sth %l1, [%i4]
	add %fp, -588, %i4
	or %i4, 2, %i4
	sth %l2, [%i4]
	add %fp, -592, %i4
	or %i4, 2, %i4
	sth %l5, [%i4]
	sth %l4, [%fp+-596]
	sth %o7, [%fp+-600]
	sth %i1, [%fp+-588]
	ld [%fp+-1264], %i1
	sth %i1, [%fp+-592]
	ld [%fp+-592], %i4
	ldd [%fp+-1200], %l2
	ldd [%fp+-1192], %l4
	mov	%l4, %l3
	std %l2, [%fp+-1200]
	ldd [%fp+-1224], %l2
	mov	%l2, %o5
	std %o4, [%fp+-1264]
	ld [%fp+-588], %i5
	ld [%fp+-1336], %g4
	and %i4, %g4, %g4
	ldd [%fp+-1208], %l2
	andn %l2, %i4, %i4
	ld [%fp+-600], %l1
	andn %l2, %i5, %l2
	ld [%fp+-596], %l3
	ld [%fp+-1332], %l4
	and %i5, %l4, %i5
	ld [%fp+-1328], %l4
	and %l1, %l4, %l4
	ldd [%fp+-1240], %l6
	andn %l7, %l1, %l1
	andn %l7, %l3, %l5
	ld [%fp+-1340], %i1
	and %l3, %i1, %l3
	or %l5, %l3, %l7
	or %l1, %l4, %l6
	or %l2, %i5, %l5
	or %i4, %g4, %l4
	ldd [%fp+-1296], %l2
	add %i0, %l3, %i4
	add %l0, %l2, %i5
	ldd [%fp+-1272], %l2
	add %g3, %l3, %g4
	add %g2, %l2, %l1
	add %l1, %l6, %o2
	std %l6, [%fp+-1240]
	add %g4, %l7, %o3
	add %i5, %l4, %l2
	std %l4, [%fp+-1192]
	add %i4, %l5, %l3
	ldd [%fp+-1320], %l4
	xor %o2, %l4, %i4
	std %o2, [%fp+-1328]
	xor %o3, %l5, %i5
	xor %l2, %o0, %g4
	xor %l3, %o1, %l1
	srl %l1, 8, %l6
	srl %g4, 8, %l7
	srl %i5, 8, %o0
	srl %i4, 8, %l4
	sll %l1, 24, %l1
	sll %g4, 24, %g4
	sll %i5, 24, %i5
	sll %i4, 24, %i4
	or %i4, %l4, %l4
	or %i5, %o0, %l5
	or %g4, %l7, %o4
	or %l1, %l6, %o5
	ldd [%fp+-1312], %i4
	add %l4, %i4, %l6
	add %l5, %i5, %l7
	ldd [%fp+-1304], %i4
	add %o4, %i4, %o0
	add %o5, %i5, %o1
	xor %l6, %g2, %i4
	std %l6, [%fp+-1208]
	xor %l7, %g3, %i5
	xor %o0, %l0, %g2
	std %o0, [%fp+-1296]
	xor %o1, %i0, %i0
	srl %i0, 7, %g3
	srl %g2, 7, %g4
	srl %i5, 7, %l0
	srl %i4, 7, %l1
	sll %i0, 25, %i0
	sll %g2, 25, %g2
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	or %i4, %l1, %l6
	or %i5, %l0, %l7
	std %l6, [%fp+-1304]
	or %g2, %g4, %o0
	or %i0, %g3, %o1
.LBB0_91:
	sth %l6, [%fp+-632]
	sth %l7, [%fp+-630]
	sth %i4, [%fp+-628]
	sth %i5, [%fp+-626]
	sth %l0, [%fp+-624]
	sth %l1, [%fp+-622]
	sth %g2, [%fp+-620]
	sth %g3, [%fp+-618]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -632, %i4
	sth %i2, [%i4+%i0]
	lduh [%fp+-620], %g2
	lduh [%fp+-618], %g3
	lduh [%fp+-624], %l0
	lduh [%fp+-622], %l1
	lduh [%fp+-628], %i4
	lduh [%fp+-626], %i5
	lduh [%fp+-632], %l6
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_91
	lduh [%fp+-630], %l7
	and %l0, 16, %g4
	and %l6, 1, %i0
	mov	-1, %o7
	cmp %i0, 0
	mov	%g0, %i3
	bne	.LBB0_94
	mov	%o7, %i0
	mov	%i3, %i0
.LBB0_94:
	srl %g4, 4, %g4
	cmp %g4, 0
	and %g2, 64, %o2
	bne	.LBB0_96
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_96:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %i4, 4, %o3
	bne	.LBB0_98
	mov	%o7, %o2
	mov	%i3, %o2
.LBB0_98:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %l7, 2, %l7
	bne	.LBB0_100
	mov	%o7, %l6
	mov	%i3, %l6
.LBB0_100:
	srl %l7, 1, %l7
	cmp %l7, 0
	and %l1, 32, %l1
	bne	.LBB0_102
	mov	%o7, %l0
	mov	%i3, %l0
.LBB0_102:
	srl %l1, 5, %l1
	cmp %l1, 0
	and %g3, 128, %g3
	bne	.LBB0_104
	mov	%o7, %g2
	mov	%i3, %g2
.LBB0_104:
	srl %g3, 7, %g3
	cmp %g3, 0
	and %i5, 8, %i5
	bne	.LBB0_106
	mov	%o7, %i4
	mov	%i3, %i4
.LBB0_106:
	srl %i5, 3, %i5
	cmp %i5, 0
	bne	.LBB0_108
	nop
	mov	%i3, %o7
.LBB0_108:
	add %fp, -644, %i5
	or %i5, 2, %i5
	sth %o7, [%i5]
	add %fp, -636, %i5
	or %i5, 2, %i5
	sth %i4, [%i5]
	add %fp, -640, %i4
	or %i4, 2, %i4
	sth %g2, [%i4]
	add %fp, -648, %i4
	or %i4, 2, %i4
	sth %l0, [%i4]
	sth %l6, [%fp+-644]
	sth %o2, [%fp+-636]
	sth %g4, [%fp+-640]
	sth %i0, [%fp+-648]
	ld [%fp+-640], %i0
	ld [%fp+-636], %i4
	ldd [%fp+-1248], %g2
	and %i0, %g2, %i5
	and %i4, %g3, %g2
	ld [%fp+-644], %g3
	ldd [%fp+-1232], %l0
	andn %l0, %i0, %i0
	andn %l1, %i4, %i4
	ld [%fp+-648], %g4
	ldd [%fp+-1216], %o2
	and %g3, %o3, %l0
	ldd [%fp+-1288], %l6
	andn %l7, %g3, %g3
	or %g3, %l0, %l1
	or %i4, %g2, %l0
	andn %l6, %g4, %i4
	and %g4, %o2, %g2
	or %i0, %i5, %l7
	or %i4, %g2, %l6
	ldd [%fp+-1328], %g2
	add %o0, %g3, %i0
	std %l0, [%fp+-1272]
	add %i0, %l0, %i1
	st %i1, [%fp+-1248]
	add %o1, %l2, %i0
	add %i0, %l1, %i0
	st %i0, [%fp+-1232]
	xor %i0, %l5, %l1
	xor %i1, %l4, %l0
	ldd [%fp+-1304], %o2
	add %o2, %l3, %i5
	add %o3, %g2, %i4
	add %i4, %l7, %i4
	std %l6, [%fp+-1224]
	add %i5, %l6, %o7
	st %l1, [%fp+-660]
	st %l0, [%fp+-652]
	xor %o7, %o4, %l0
	xor %i4, %o5, %l1
	st %l1, [%fp+-676]
	st %l0, [%fp+-668]
	add %fp, -660, %i5
	or %i5, 2, %i5
	lduh [%i5], %g4
	add %fp, -652, %i5
	or %i5, 2, %i5
	lduh [%i5], %l0
	add %fp, -676, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -668, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -672, %l2
	or %l2, 2, %l2
	lduh [%fp+-668], %l3
	lduh [%fp+-660], %l4
	lduh [%fp+-652], %l5
	lduh [%fp+-676], %l6
	sth %l3, [%l2]
	add %fp, -680, %l2
	or %l2, 2, %l2
	sth %l6, [%l2]
	sth %l1, [%fp+-672]
	sth %i5, [%fp+-680]
	add %fp, -656, %i5
	or %i5, 2, %l1
	ld [%fp+-672], %l2
	ld [%fp+-680], %i5
	sth %l5, [%l1]
	add %fp, -664, %l1
	or %l1, 2, %l1
	sth %l4, [%l1]
	sth %l0, [%fp+-656]
	sth %g4, [%fp+-664]
	ld [%fp+-664], %l3
	ld [%fp+-656], %l4
	ldd [%fp+-1208], %g2
	add %g3, %l2, %l1
	add %g2, %l3, %l0
	ldd [%fp+-1296], %g2
	add %g2, %i5, %g4
	add %g3, %l4, %l5
	xor %l5, %o0, %l6
	xor %l0, %o1, %l7
	xor %l1, %o2, %o0
	xor %g4, %o3, %o1
	ldd [%fp+-1176], %o2
	ldd [%fp+-1184], %o4
	mov	%o2, %o5
	add %i4, %o2, %i4
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1216], %i0
	mov	%i1, %g2
	or %o1, %o2, %o1
	mov	%o5, %g3
	std %g2, [%fp+-1288]
	mov	%i0, %o5
	std %o4, [%fp+-1184]
	ld [%fp+-1248], %g2
	add %g2, %o4, %g3
	add %g3, %l6, %o2
	xor %o2, %l4, %g3
	srl %g3, 8, %l4
	sll %g3, 24, %g3
	or %g3, %l4, %l4
	mov	%i0, %o4
	mov	%i1, %o5
	ld [%fp+-1232], %i0
	add %i0, %o4, %i0
	add %i0, %l7, %o3
	xor %o3, %l3, %i0
	srl %i0, 8, %g3
	sll %i0, 24, %i0
	or %i0, %g3, %l3
	add %o7, %o5, %i0
	add %i0, %o0, %o4
	xor %o4, %l2, %i0
	srl %i0, 8, %g2
	sll %i0, 24, %i0
	or %i0, %g2, %l2
	add %i4, %o1, %o5
	xor %o5, %i5, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o7
	add %l4, %l5, %i5
	xor %i5, %l6, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i0
	add %l3, %l0, %l0
	xor %l0, %l7, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i4
	add %l2, %l1, %l1
	xor %l1, %o0, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g2
	add %o7, %g4, %g4
	xor %g4, %o1, %g3
	srl %g3, 7, %l5
	sll %g3, 25, %g3
	or %g3, %l5, %g3
	ldd [%fp+-1200], %l6
	add %o5, %l7, %l5
	ldd [%fp+-1240], %l6
	add %o2, %l7, %l6
	add %g3, %l6, %o1
	add %g2, %l5, %o0
	ldd [%fp+-1192], %l6
	add %o3, %l7, %l5
	ldd [%fp+-1264], %o2
	add %o4, %o2, %l6
	mov	%o2, %o4
	mov	%o3, %o5
	add %i4, %l6, %o3
	add %i0, %l5, %o2
	xor %o3, %o7, %l7
	std %o2, [%fp+-1304]
	xor %o2, %l2, %l6
	st %l6, [%fp+-700]
	st %l7, [%fp+-708]
	xor %o1, %l3, %l3
	std %o0, [%fp+-1296]
	xor %o0, %l4, %l2
	st %l2, [%fp+-684]
	st %l3, [%fp+-692]
	add %fp, -700, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -708, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -684, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -692, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -696, %l6
	or %l6, 2, %l6
	lduh [%fp+-692], %l7
	lduh [%fp+-700], %o0
	lduh [%fp+-708], %o1
	lduh [%fp+-684], %o2
	sth %l7, [%l6]
	add %fp, -688, %l6
	or %l6, 2, %l6
	sth %o2, [%l6]
	sth %l5, [%fp+-696]
	sth %l4, [%fp+-688]
	ld [%fp+-696], %l7
	ld [%fp+-688], %l6
	add %fp, -712, %l4
	or %l4, 2, %l4
	sth %o1, [%l4]
	add %fp, -704, %l4
	or %l4, 2, %l4
	sth %o0, [%l4]
	sth %l3, [%fp+-712]
	sth %l2, [%fp+-704]
	ld [%fp+-712], %o1
	ld [%fp+-704], %o0
	add %l1, %l7, %l3
	std %l6, [%fp+-1328]
	add %l0, %l6, %l2
	add %i5, %o1, %l1
	add %g4, %o0, %l0
	xor %l3, %g3, %l5
	std %l2, [%fp+-1320]
	xor %l2, %g2, %l4
	ldd [%fp+-1272], %g2
	st %g2, [%fp+-716]
	ld [%fp+-716], %f0
	ldd [%fp+-1216], %g2
	st %g2, [%fp+-720]
	ldd [%fp+-1240], %g2
	mov	%g3, %g2
	xor %l1, %i4, %i5
	mov	%o4, %l2
	mov	%o5, %l3
	std %l0, [%fp+-1312]
	xor %l0, %i0, %i4
	ldd [%fp+-1192], %i0
	mov	%i1, %g3
	std %g2, [%fp+-1176]
	ldd [%fp+-1200], %i0
	mov	%i1, %l3
	std %l2, [%fp+-1216]
	ld [%fp+-720], %f1
	sll %l4, 20, %o4
	sll %l5, 20, %o5
	sll %i4, 20, %o2
	sll %i5, 20, %o3
	ld [%fp+-1252], %i1
.LBB0_109:
	sth %g2, [%fp+-736]
	sth %g3, [%fp+-734]
	sth %l0, [%fp+-732]
	sth %l1, [%fp+-730]
	sth %l2, [%fp+-728]
	sth %l3, [%fp+-726]
	sth %l6, [%fp+-724]
	sth %l7, [%fp+-722]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -736, %g2
	sth %i1, [%g2+%i0]
	lduh [%fp+-724], %l6
	lduh [%fp+-722], %l7
	lduh [%fp+-728], %l2
	lduh [%fp+-726], %l3
	lduh [%fp+-732], %l0
	lduh [%fp+-730], %l1
	lduh [%fp+-736], %g2
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_109
	lduh [%fp+-734], %g3
	st %f0, [%fp+-764]
	st %f0, [%fp+-768]
	st %f1, [%fp+-756]
	st %f1, [%fp+-760]
	ld [%fp+-764], %i0
	st %i0, [%fp+-1232]
	ld [%fp+-768], %i0
	st %i0, [%fp+-1332]
	ld [%fp+-756], %i0
	st %i0, [%fp+-1336]
	ld [%fp+-760], %i0
	st %i0, [%fp+-1340]
	and %l6, 64, %i0
	and %l2, 16, %i3
	srl %i3, 4, %i3
	mov	-1, %g4
	cmp %i3, 0
	mov	%g0, %i3
	bne	.LBB0_112
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_112:
	st %o7, [%fp+-1248]
	srl %i0, 6, %i0
	cmp %i0, 0
	and %g2, 1, %i0
	bne	.LBB0_114
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_114:
	st %o7, [%fp+-1344]
	cmp %i0, 0
	and %l0, 4, %i0
	bne	.LBB0_116
	mov	%g4, %o7
	mov	%i3, %o7
.LBB0_116:
	srl %i0, 2, %i0
	cmp %i0, 0
	and %l3, 32, %i0
	bne	.LBB0_118
	mov	%g4, %l2
	mov	%i3, %l2
.LBB0_118:
	srl %i0, 5, %i0
	cmp %i0, 0
	and %l7, 128, %i0
	bne	.LBB0_120
	mov	%g4, %l3
	mov	%i3, %l3
.LBB0_120:
	srl %i0, 7, %i0
	cmp %i0, 0
	and %g3, 2, %g3
	bne	.LBB0_122
	mov	%g4, %g2
	mov	%i3, %g2
.LBB0_122:
	srl %i5, 12, %i0
	srl %i4, 12, %l6
	srl %l5, 12, %i5
	srl %l4, 12, %i4
	srl %g3, 1, %g3
	cmp %g3, 0
	and %l1, 8, %l1
	bne	.LBB0_124
	mov	%g4, %g3
	mov	%i3, %g3
.LBB0_124:
	ldd [%fp+-1216], %l4
	mov	%l5, %l4
	std %l4, [%fp+-1208]
	ldd [%fp+-1176], %l4
	mov	%l5, %l4
	or %o4, %i4, %i4
	or %o5, %i5, %i5
	or %o2, %l6, %l0
	srl %l1, 3, %l1
	cmp %l1, 0
	bne	.LBB0_126
	or %o3, %i0, %i0
	mov	%i3, %g4
.LBB0_126:
	add %fp, -748, %l1
	or %l1, 2, %l1
	sth %g4, [%l1]
	add %fp, -752, %g4
	or %g4, 2, %g4
	sth %g3, [%g4]
	add %fp, -740, %g3
	or %g3, 2, %g3
	sth %g2, [%g3]
	add %fp, -744, %g2
	or %g2, 2, %g2
	sth %l3, [%g2]
	sth %l2, [%fp+-748]
	sth %o7, [%fp+-752]
	ld [%fp+-1344], %g2
	sth %g2, [%fp+-740]
	ld [%fp+-1248], %g2
	sth %g2, [%fp+-744]
	ld [%fp+-744], %g2
	ldd [%fp+-1208], %l2
	ldd [%fp+-1176], %l6
	mov	%l6, %l3
	std %l2, [%fp+-1208]
	ldd [%fp+-1216], %l2
	mov	%l2, %l5
	std %l4, [%fp+-1248]
	ld [%fp+-740], %g3
	ld [%fp+-1340], %g4
	and %g2, %g4, %g4
	ldd [%fp+-1200], %l2
	andn %l2, %g2, %g2
	ld [%fp+-752], %l1
	andn %l2, %g3, %l2
	ld [%fp+-748], %l3
	ld [%fp+-1336], %l4
	and %g3, %l4, %g3
	ld [%fp+-1332], %l4
	and %l1, %l4, %l4
	ldd [%fp+-1264], %l6
	andn %l7, %l1, %l1
	andn %l7, %l3, %l5
	ld [%fp+-1232], %l6
	and %l3, %l6, %l3
	or %l5, %l3, %l7
	or %l1, %l4, %l6
	or %l2, %g3, %l3
	or %g2, %g4, %l2
	ldd [%fp+-1304], %l4
	add %i0, %l5, %g2
	add %l0, %l4, %g3
	ldd [%fp+-1296], %l4
	add %i5, %l5, %g4
	add %i4, %l4, %l1
	add %l1, %l6, %l4
	std %l6, [%fp+-1232]
	add %g4, %l7, %l5
	add %g3, %l2, %o4
	std %l2, [%fp+-1176]
	add %g2, %l3, %o5
	ldd [%fp+-1328], %l2
	xor %l4, %l2, %g2
	std %l4, [%fp+-1304]
	xor %l5, %l3, %g3
	xor %o4, %o0, %g4
	xor %o5, %o1, %l1
	srl %l1, 8, %l2
	srl %g4, 8, %l3
	srl %g3, 8, %l6
	srl %g2, 8, %l4
	sll %l1, 24, %l1
	sll %g4, 24, %g4
	sll %g3, 24, %g3
	sll %g2, 24, %g2
	or %g2, %l4, %l4
	or %g3, %l6, %l5
	or %g4, %l3, %g2
	or %l1, %l2, %g3
	ldd [%fp+-1320], %l2
	add %l4, %l2, %l6
	add %l5, %l3, %l7
	ldd [%fp+-1312], %l2
	add %g2, %l2, %o0
	add %g3, %l3, %o1
	xor %l6, %i4, %i4
	std %l6, [%fp+-1200]
	xor %l7, %i5, %i5
	xor %o0, %l0, %g4
	std %o0, [%fp+-1264]
	xor %o1, %i0, %i0
	srl %i0, 7, %l0
	srl %g4, 7, %l1
	srl %i5, 7, %l2
	srl %i4, 7, %l3
	sll %i0, 25, %i0
	sll %g4, 25, %g4
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	or %i4, %l3, %l6
	or %i5, %l2, %l7
	std %l6, [%fp+-1296]
	or %g4, %l1, %o0
	or %i0, %l0, %o1
.LBB0_127:
	sth %i4, [%fp+-784]
	sth %i5, [%fp+-782]
	sth %l6, [%fp+-780]
	sth %l7, [%fp+-778]
	sth %l0, [%fp+-776]
	sth %l1, [%fp+-774]
	sth %l2, [%fp+-772]
	sth %l3, [%fp+-770]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -784, %i4
	sth %i2, [%i4+%i0]
	lduh [%fp+-772], %l2
	lduh [%fp+-770], %l3
	lduh [%fp+-776], %l0
	lduh [%fp+-774], %l1
	lduh [%fp+-780], %l6
	lduh [%fp+-778], %l7
	lduh [%fp+-784], %i4
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_127
	lduh [%fp+-782], %i5
	and %l0, 16, %g4
	and %i4, 1, %i0
	mov	-1, %o7
	cmp %i0, 0
	mov	%g0, %i3
	bne	.LBB0_130
	mov	%o7, %i0
	mov	%i3, %i0
.LBB0_130:
	srl %g4, 4, %g4
	cmp %g4, 0
	and %l2, 64, %o2
	bne	.LBB0_132
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_132:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %l6, 4, %o3
	bne	.LBB0_134
	mov	%o7, %o2
	mov	%i3, %o2
.LBB0_134:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %i5, 2, %i5
	bne	.LBB0_136
	mov	%o7, %i4
	mov	%i3, %i4
.LBB0_136:
	srl %i5, 1, %i5
	cmp %i5, 0
	and %l1, 32, %l0
	bne	.LBB0_138
	mov	%o7, %i5
	mov	%i3, %i5
.LBB0_138:
	srl %l0, 5, %l0
	cmp %l0, 0
	and %l3, 128, %l1
	bne	.LBB0_140
	mov	%o7, %l0
	mov	%i3, %l0
.LBB0_140:
	srl %l1, 7, %l1
	cmp %l1, 0
	and %l7, 8, %l2
	bne	.LBB0_142
	mov	%o7, %l1
	mov	%i3, %l1
.LBB0_142:
	srl %l2, 3, %l2
	cmp %l2, 0
	bne	.LBB0_144
	nop
	mov	%i3, %o7
.LBB0_144:
	add %fp, -796, %l2
	or %l2, 2, %l2
	sth %o7, [%l2]
	add %fp, -788, %l2
	or %l2, 2, %l2
	sth %l1, [%l2]
	add %fp, -792, %l1
	or %l1, 2, %l1
	sth %l0, [%l1]
	add %fp, -800, %l0
	or %l0, 2, %l0
	sth %i5, [%l0]
	sth %i4, [%fp+-796]
	sth %o2, [%fp+-788]
	sth %g4, [%fp+-792]
	sth %i0, [%fp+-800]
	ld [%fp+-792], %i0
	ld [%fp+-788], %i4
	ldd [%fp+-1272], %l0
	and %i0, %l0, %i5
	and %i4, %l1, %g4
	ld [%fp+-796], %l0
	ldd [%fp+-1240], %l2
	andn %l2, %i0, %i0
	andn %l3, %i4, %i4
	ld [%fp+-800], %l1
	ldd [%fp+-1224], %o2
	and %l0, %o3, %l2
	ldd [%fp+-1288], %l6
	andn %l7, %l0, %l0
	or %l0, %l2, %l3
	or %i4, %g4, %l2
	andn %l6, %l1, %i4
	and %l1, %o2, %g4
	or %i0, %i5, %l7
	or %i4, %g4, %l6
	ldd [%fp+-1304], %l0
	add %o0, %l1, %i0
	mov	%l2, %i4
	mov	%l3, %i5
	std %l2, [%fp+-1240]
	add %i0, %i4, %l2
	add %o1, %o4, %i0
	add %i0, %i5, %i0
	st %i0, [%fp+-1288]
	xor %i0, %l5, %i5
	xor %l2, %l4, %i4
	ldd [%fp+-1296], %o2
	add %o2, %o5, %g4
	add %o3, %l0, %l0
	add %l0, %l7, %l3
	std %l6, [%fp+-1216]
	add %g4, %l6, %g4
	st %i5, [%fp+-812]
	st %i4, [%fp+-804]
	xor %g4, %g2, %i4
	xor %l3, %g3, %i5
	st %i5, [%fp+-828]
	st %i4, [%fp+-820]
	add %fp, -812, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -804, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -828, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -820, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -824, %l0
	or %l0, 2, %l0
	lduh [%fp+-820], %l1
	lduh [%fp+-812], %l5
	lduh [%fp+-804], %l6
	lduh [%fp+-828], %l4
	sth %l1, [%l0]
	add %fp, -832, %l0
	or %l0, 2, %l0
	sth %l4, [%l0]
	sth %g3, [%fp+-824]
	sth %g2, [%fp+-832]
	add %fp, -808, %g2
	or %g2, 2, %g2
	ld [%fp+-824], %l4
	ld [%fp+-832], %l0
	sth %l6, [%g2]
	add %fp, -816, %g2
	or %g2, 2, %g2
	sth %l5, [%g2]
	sth %i5, [%fp+-808]
	sth %i4, [%fp+-816]
	ld [%fp+-816], %o7
	ld [%fp+-808], %i0
	ldd [%fp+-1200], %i4
	add %i5, %l4, %g3
	st %g3, [%fp+-1304]
	add %i4, %o7, %l1
	ldd [%fp+-1264], %i4
	add %i4, %l0, %g2
	st %g2, [%fp+-1200]
	add %i5, %i0, %l5
	xor %l5, %o0, %l6
	xor %l1, %o1, %l7
	xor %g3, %o2, %o0
	xor %g2, %o3, %o1
	ldd [%fp+-1184], %o2
	ldd [%fp+-1192], %o4
	mov	%o2, %o5
	add %l3, %o2, %l3
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1224], %g2
	mov	%g3, %i4
	or %o1, %o2, %o1
	mov	%o5, %i5
	std %i4, [%fp+-1272]
	mov	%g2, %o5
	std %o4, [%fp+-1192]
	add %l2, %o4, %l2
	add %l2, %l6, %l2
	xor %l2, %i0, %i5
	srl %i5, 8, %o2
	sll %i5, 24, %i5
	or %i5, %o2, %o2
	ld [%fp+-1288], %i0
	add %i0, %g2, %i0
	add %i0, %l7, %o3
	xor %o3, %o7, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o4
	add %g4, %g3, %i0
	add %i0, %o0, %o5
	xor %o5, %l4, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %l4
	add %l3, %o1, %l3
	xor %l3, %l0, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o7
	add %o2, %l5, %i5
	xor %i5, %l6, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i0
	add %o4, %l1, %l0
	xor %l0, %l7, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %i4
	ld [%fp+-1304], %g2
	add %l4, %g2, %l1
	xor %l1, %o0, %g2
	srl %g2, 7, %g4
	sll %g2, 25, %g2
	or %g2, %g4, %g2
	ld [%fp+-1200], %g3
	add %o7, %g3, %g4
	xor %g4, %o1, %g3
	srl %g3, 7, %l5
	sll %g3, 25, %g3
	or %g3, %l5, %g3
	ldd [%fp+-1208], %l6
	add %l3, %l7, %l3
	ldd [%fp+-1232], %l6
	add %l2, %l7, %l2
	add %g3, %l2, %l7
	add %g2, %l3, %l6
	ldd [%fp+-1176], %l2
	add %o3, %l3, %l2
	ldd [%fp+-1248], %o0
	add %o5, %o0, %l3
	add %i4, %l3, %o1
	add %i0, %l2, %o0
	xor %o1, %o7, %l3
	std %o0, [%fp+-1296]
	xor %o0, %l4, %l2
	st %l2, [%fp+-852]
	st %l3, [%fp+-860]
	xor %l7, %o4, %l3
	std %l6, [%fp+-1288]
	xor %l6, %o2, %l2
	st %l2, [%fp+-836]
	st %l3, [%fp+-844]
	add %fp, -852, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -860, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -836, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -844, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -848, %l6
	or %l6, 2, %l6
	lduh [%fp+-844], %l7
	lduh [%fp+-852], %o0
	lduh [%fp+-860], %o1
	lduh [%fp+-836], %o2
	sth %l7, [%l6]
	add %fp, -840, %l6
	or %l6, 2, %l6
	sth %o2, [%l6]
	sth %l5, [%fp+-848]
	sth %l4, [%fp+-840]
	ld [%fp+-848], %l7
	ld [%fp+-840], %l6
	add %fp, -864, %l4
	or %l4, 2, %l4
	sth %o1, [%l4]
	add %fp, -856, %l4
	or %l4, 2, %l4
	sth %o0, [%l4]
	sth %l3, [%fp+-864]
	sth %l2, [%fp+-856]
	ld [%fp+-864], %o1
	ld [%fp+-856], %o0
	add %l1, %l7, %l5
	std %l6, [%fp+-1320]
	add %l0, %l6, %l4
	add %i5, %o1, %l1
	add %g4, %o0, %l0
	xor %l5, %g3, %l3
	std %l4, [%fp+-1312]
	xor %l4, %g2, %l2
	ldd [%fp+-1240], %g2
	st %g2, [%fp+-868]
	ld [%fp+-868], %f0
	ldd [%fp+-1224], %g2
	st %g2, [%fp+-872]
	ldd [%fp+-1232], %g2
	mov	%g3, %g2
	xor %l1, %i4, %i5
	ldd [%fp+-1248], %l4
	std %l0, [%fp+-1304]
	xor %l0, %i0, %i4
	ldd [%fp+-1176], %l0
	mov	%l1, %g3
	std %g2, [%fp+-1224]
	ldd [%fp+-1208], %g2
	mov	%g3, %l5
	std %l4, [%fp+-1264]
	ld [%fp+-872], %f1
	sll %l2, 20, %o4
	sll %l3, 20, %o5
	sll %i4, 20, %o2
	sll %i5, 20, %o3
.LBB0_145:
	sth %g2, [%fp+-888]
	sth %g3, [%fp+-886]
	sth %l0, [%fp+-884]
	sth %l1, [%fp+-882]
	sth %l4, [%fp+-880]
	sth %l5, [%fp+-878]
	sth %l6, [%fp+-876]
	sth %l7, [%fp+-874]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -888, %g2
	sth %i1, [%g2+%i0]
	lduh [%fp+-876], %l6
	lduh [%fp+-874], %l7
	lduh [%fp+-880], %l4
	lduh [%fp+-878], %l5
	lduh [%fp+-884], %l0
	lduh [%fp+-882], %l1
	lduh [%fp+-888], %g2
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_145
	lduh [%fp+-886], %g3
	st %f0, [%fp+-916]
	st %f0, [%fp+-920]
	st %f1, [%fp+-908]
	st %f1, [%fp+-912]
	ld [%fp+-916], %i0
	st %i0, [%fp+-1328]
	ld [%fp+-920], %i0
	st %i0, [%fp+-1332]
	ld [%fp+-908], %i0
	st %i0, [%fp+-1336]
	ld [%fp+-912], %i0
	st %i0, [%fp+-1340]
	and %l6, 64, %i0
	and %l4, 16, %i3
	srl %i3, 4, %i3
	mov	-1, %o7
	cmp %i3, 0
	mov	%g0, %i3
	bne	.LBB0_148
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_148:
	st %g4, [%fp+-1344]
	srl %i0, 6, %i0
	cmp %i0, 0
	and %g2, 1, %i0
	bne	.LBB0_150
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_150:
	st %g4, [%fp+-1348]
	cmp %i0, 0
	and %l0, 4, %i0
	bne	.LBB0_152
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_152:
	srl %i0, 2, %i0
	cmp %i0, 0
	and %l5, 32, %l5
	bne	.LBB0_154
	mov	%o7, %l4
	mov	%i3, %l4
.LBB0_154:
	srl %l5, 5, %i0
	cmp %i0, 0
	and %l7, 128, %l6
	bne	.LBB0_156
	mov	%o7, %l5
	mov	%i3, %l5
.LBB0_156:
	srl %l6, 7, %i0
	cmp %i0, 0
	and %g3, 2, %g3
	bne	.LBB0_158
	mov	%o7, %g2
	mov	%i3, %g2
.LBB0_158:
	srl %i5, 12, %l6
	srl %i4, 12, %l7
	srl %l3, 12, %i5
	srl %l2, 12, %i4
	srl %g3, 1, %i0
	cmp %i0, 0
	and %l1, 8, %l0
	bne	.LBB0_160
	mov	%o7, %g3
	mov	%i3, %g3
.LBB0_160:
	ldd [%fp+-1264], %l2
	mov	%l3, %l2
	std %l2, [%fp+-1184]
	ldd [%fp+-1224], %l2
	mov	%l3, %l2
	std %l2, [%fp+-1200]
	or %o4, %i4, %i4
	or %o5, %i5, %i5
	or %o2, %l7, %l2
	srl %l0, 3, %i0
	cmp %i0, 0
	bne	.LBB0_162
	or %o3, %l6, %l3
	mov	%i3, %o7
.LBB0_162:
	add %fp, -900, %i0
	or %i0, 2, %i0
	sth %o7, [%i0]
	add %fp, -904, %i0
	or %i0, 2, %i0
	sth %g3, [%i0]
	add %fp, -892, %i0
	or %i0, 2, %i0
	sth %g2, [%i0]
	add %fp, -896, %i0
	or %i0, 2, %i0
	sth %l5, [%i0]
	sth %l4, [%fp+-900]
	sth %g4, [%fp+-904]
	ld [%fp+-1348], %i0
	sth %i0, [%fp+-892]
	ld [%fp+-1344], %i0
	sth %i0, [%fp+-896]
	ld [%fp+-896], %i0
	ldd [%fp+-1184], %g2
	ldd [%fp+-1224], %l0
	mov	%l0, %g3
	std %g2, [%fp+-1184]
	ldd [%fp+-1200], %g2
	ldd [%fp+-1264], %l0
	mov	%l0, %g3
	std %g2, [%fp+-1200]
	ld [%fp+-892], %g2
	ld [%fp+-1340], %g3
	and %i0, %g3, %g3
	ldd [%fp+-1208], %l0
	andn %l0, %i0, %i0
	ld [%fp+-904], %g4
	andn %l0, %g2, %l0
	ld [%fp+-900], %l1
	ld [%fp+-1336], %l4
	and %g2, %l4, %g2
	ld [%fp+-1332], %l4
	and %g4, %l4, %l4
	ldd [%fp+-1248], %l6
	andn %l7, %g4, %g4
	andn %l7, %l1, %l5
	ld [%fp+-1328], %l6
	and %l1, %l6, %l1
	or %l5, %l1, %l7
	or %g4, %l4, %l6
	or %l0, %g2, %l1
	or %i0, %g3, %l0
	ldd [%fp+-1296], %g2
	add %l3, %g3, %i0
	add %l2, %g2, %g2
	ldd [%fp+-1288], %l4
	add %i5, %l5, %g3
	add %i4, %l4, %g4
	add %g4, %l6, %o2
	std %l6, [%fp+-1224]
	add %g3, %l7, %o3
	add %g2, %l0, %l4
	std %l0, [%fp+-1208]
	add %i0, %l1, %l5
	ldd [%fp+-1320], %g2
	xor %o2, %g2, %i0
	std %o2, [%fp+-1296]
	xor %o3, %g3, %g2
	xor %l4, %o0, %g3
	xor %l5, %o1, %g4
	srl %g4, 8, %l0
	srl %g3, 8, %l1
	srl %g2, 8, %l6
	srl %i0, 8, %l7
	sll %g4, 24, %g4
	sll %g3, 24, %o0
	sll %g2, 24, %o1
	sll %i0, 24, %i0
	or %i0, %l7, %g2
	or %o1, %l6, %g3
	or %o0, %l1, %l6
	or %g4, %l0, %l7
	ldd [%fp+-1312], %l0
	add %g2, %l0, %o0
	add %g3, %l1, %o1
	ldd [%fp+-1304], %l0
	add %l6, %l0, %o2
	add %l7, %l1, %o3
	xor %o0, %i4, %i0
	std %o0, [%fp+-1248]
	xor %o1, %i5, %i4
	xor %o2, %l2, %i5
	std %o2, [%fp+-1264]
	xor %o3, %l3, %g4
	srl %g4, 7, %l0
	srl %i5, 7, %l1
	srl %i4, 7, %l2
	srl %i0, 7, %l3
	sll %g4, 25, %g4
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	sll %i0, 25, %i0
	or %i0, %l3, %o0
	or %i4, %l2, %o1
	std %o0, [%fp+-1288]
	or %i5, %l1, %i4
	or %g4, %l0, %i5
	std %i4, [%fp+-1304]
.LBB0_163:
	sth %i4, [%fp+-936]
	sth %i5, [%fp+-934]
	sth %o2, [%fp+-932]
	sth %o3, [%fp+-930]
	sth %l0, [%fp+-928]
	sth %l1, [%fp+-926]
	sth %l2, [%fp+-924]
	sth %l3, [%fp+-922]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -936, %i4
	sth %i2, [%i4+%i0]
	lduh [%fp+-924], %l2
	lduh [%fp+-922], %l3
	lduh [%fp+-928], %l0
	lduh [%fp+-926], %l1
	lduh [%fp+-932], %o2
	lduh [%fp+-930], %o3
	lduh [%fp+-936], %i4
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_163
	lduh [%fp+-934], %i5
	and %l0, 16, %g4
	and %i4, 1, %i0
	mov	-1, %o7
	cmp %i0, 0
	mov	%g0, %i3
	bne	.LBB0_166
	mov	%o7, %i0
	mov	%i3, %i0
.LBB0_166:
	srl %g4, 4, %g4
	cmp %g4, 0
	and %l2, 64, %o4
	bne	.LBB0_168
	mov	%o7, %g4
	mov	%i3, %g4
.LBB0_168:
	srl %o4, 6, %o4
	cmp %o4, 0
	and %o2, 4, %o5
	bne	.LBB0_170
	mov	%o7, %o4
	mov	%i3, %o4
.LBB0_170:
	srl %o5, 2, %o5
	cmp %o5, 0
	and %i5, 2, %i5
	bne	.LBB0_172
	mov	%o7, %i4
	mov	%i3, %i4
.LBB0_172:
	srl %i5, 1, %i5
	cmp %i5, 0
	and %l1, 32, %l0
	bne	.LBB0_174
	mov	%o7, %i5
	mov	%i3, %i5
.LBB0_174:
	srl %l0, 5, %l0
	cmp %l0, 0
	and %l3, 128, %l1
	bne	.LBB0_176
	mov	%o7, %l0
	mov	%i3, %l0
.LBB0_176:
	srl %l1, 7, %l1
	cmp %l1, 0
	and %o3, 8, %l2
	bne	.LBB0_178
	mov	%o7, %l1
	mov	%i3, %l1
.LBB0_178:
	srl %l2, 3, %l2
	cmp %l2, 0
	bne	.LBB0_180
	nop
	mov	%i3, %o7
.LBB0_180:
	add %fp, -948, %l2
	or %l2, 2, %l2
	sth %o7, [%l2]
	add %fp, -940, %l2
	or %l2, 2, %l2
	sth %l1, [%l2]
	add %fp, -944, %l1
	or %l1, 2, %l1
	sth %l0, [%l1]
	add %fp, -952, %l0
	or %l0, 2, %l0
	sth %i5, [%l0]
	sth %i4, [%fp+-948]
	sth %o4, [%fp+-940]
	sth %g4, [%fp+-944]
	sth %i0, [%fp+-952]
	ld [%fp+-944], %i0
	ld [%fp+-940], %i4
	ldd [%fp+-1240], %l0
	and %i0, %l0, %i5
	and %i4, %l1, %g4
	ld [%fp+-948], %l0
	ldd [%fp+-1232], %l2
	andn %l2, %i0, %i0
	andn %l3, %i4, %i4
	ld [%fp+-952], %l1
	ldd [%fp+-1216], %o4
	and %l0, %o5, %l2
	ldd [%fp+-1272], %o2
	andn %o3, %l0, %l0
	or %l0, %l2, %o1
	or %i4, %g4, %o0
	andn %o2, %l1, %i4
	and %l1, %o4, %g4
	or %i0, %i5, %l1
	or %i4, %g4, %l0
	ldd [%fp+-1296], %l2
	ldd [%fp+-1304], %o4
	add %o4, %l3, %i0
	std %o0, [%fp+-1232]
	add %i0, %o0, %g4
	add %o5, %l4, %i0
	add %i0, %o1, %i0
	st %i0, [%fp+-1272]
	xor %i0, %g3, %i5
	xor %g4, %g2, %i4
	ldd [%fp+-1288], %o2
	add %o2, %l5, %g2
	add %o3, %l2, %g3
	add %g3, %l1, %g3
	std %l0, [%fp+-1240]
	add %g2, %l0, %i0
	st %i0, [%fp+-1296]
	st %i5, [%fp+-964]
	st %i4, [%fp+-956]
	xor %i0, %l6, %i4
	xor %g3, %l7, %i5
	st %i5, [%fp+-980]
	st %i4, [%fp+-972]
	add %fp, -964, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -956, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -980, %l0
	or %l0, 2, %l0
	lduh [%l0], %l0
	add %fp, -972, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -976, %l2
	or %l2, 2, %l2
	lduh [%fp+-972], %l3
	lduh [%fp+-964], %l5
	lduh [%fp+-956], %l6
	lduh [%fp+-980], %l4
	sth %l3, [%l2]
	add %fp, -984, %l2
	or %l2, 2, %l2
	sth %l4, [%l2]
	sth %l1, [%fp+-976]
	sth %l0, [%fp+-984]
	add %fp, -960, %l0
	or %l0, 2, %l1
	ld [%fp+-976], %l4
	ld [%fp+-984], %l2
	sth %l6, [%l1]
	add %fp, -968, %l1
	or %l1, 2, %l1
	sth %l5, [%l1]
	sth %i5, [%fp+-960]
	sth %i4, [%fp+-968]
	ld [%fp+-968], %o7
	ld [%fp+-960], %i0
	ldd [%fp+-1248], %i4
	add %i5, %l4, %l1
	add %i4, %o7, %l3
	ldd [%fp+-1264], %i4
	add %i4, %l2, %g2
	st %g2, [%fp+-1248]
	add %i5, %i0, %l5
	xor %l5, %o4, %l6
	xor %l3, %o5, %l7
	xor %l1, %o2, %o0
	xor %g2, %o3, %o1
	ldd [%fp+-1192], %o2
	ldd [%fp+-1176], %o4
	mov	%o2, %o5
	add %g3, %o2, %l0
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1216], %g2
	mov	%g3, %i4
	or %o1, %o2, %o1
	mov	%o5, %i5
	std %i4, [%fp+-1192]
	mov	%g2, %o5
	std %o4, [%fp+-1176]
	add %g4, %o4, %g4
	add %g4, %l6, %o2
	xor %o2, %i0, %i5
	srl %i5, 8, %g4
	sll %i5, 24, %i5
	or %i5, %g4, %o3
	ld [%fp+-1272], %i0
	add %i0, %g2, %i0
	add %i0, %l7, %g4
	xor %g4, %o7, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o5
	ld [%fp+-1296], %i0
	add %i0, %g3, %i0
	add %i0, %o0, %o7
	xor %o7, %l4, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %l4
	add %l0, %o1, %i0
	xor %i0, %l2, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i4
	add %o3, %l5, %i5
	st %i5, [%fp+-1272]
	xor %i5, %l6, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %o4
	add %o5, %l3, %l0
	xor %l0, %l7, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %l5
	add %l4, %l1, %l1
	xor %l1, %o0, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %i5
	ld [%fp+-1248], %g2
	add %i4, %g2, %g3
	xor %g3, %o1, %g2
	srl %g2, 7, %l2
	sll %g2, 25, %g2
	or %g2, %l2, %g2
	ldd [%fp+-1184], %l2
	add %i0, %l3, %i0
	ldd [%fp+-1224], %l2
	add %o2, %l3, %l2
	add %g2, %l2, %l7
	add %i5, %i0, %l6
	ldd [%fp+-1208], %l2
	add %g4, %l3, %i0
	ldd [%fp+-1200], %l2
	add %o7, %l2, %l2
	add %l5, %l2, %o1
	add %o4, %i0, %o0
	xor %o1, %i4, %l3
	std %o0, [%fp+-1264]
	xor %o0, %l4, %l2
	st %l2, [%fp+-1004]
	st %l3, [%fp+-1012]
	xor %l7, %o5, %l3
	std %l6, [%fp+-1248]
	xor %l6, %o3, %l2
	st %l2, [%fp+-988]
	st %l3, [%fp+-996]
	add %fp, -1004, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	add %fp, -1012, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -988, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -996, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -1000, %l4
	or %l4, 2, %l4
	lduh [%fp+-996], %l6
	lduh [%fp+-1004], %l7
	lduh [%fp+-1012], %o0
	lduh [%fp+-988], %o1
	sth %l6, [%l4]
	add %fp, -992, %l4
	or %l4, 2, %l4
	sth %o1, [%l4]
	sth %l3, [%fp+-1000]
	sth %l2, [%fp+-992]
	ld [%fp+-1000], %o3
	ld [%fp+-992], %o2
	add %fp, -1016, %l2
	or %l2, 2, %l2
	sth %o0, [%l2]
	add %fp, -1008, %l2
	or %l2, 2, %l2
	sth %l7, [%l2]
	sth %i4, [%fp+-1016]
	sth %i0, [%fp+-1008]
	ld [%fp+-1016], %l7
	ld [%fp+-1008], %l6
	add %l1, %o3, %l3
	std %o2, [%fp+-1296]
	add %l0, %o2, %l2
	ld [%fp+-1272], %i0
	add %i0, %l7, %l1
	std %l6, [%fp+-1304]
	add %g3, %l6, %l0
	xor %l3, %g2, %g3
	std %l2, [%fp+-1288]
	xor %l2, %i5, %g2
	xor %l1, %l5, %l7
	std %l0, [%fp+-1272]
	xor %l0, %o4, %l6
	ldd [%fp+-1232], %i4
	st %i4, [%fp+-1020]
	ld [%fp+-1020], %f0
	ldd [%fp+-1216], %i4
	st %i4, [%fp+-1024]
	sll %g2, 20, %o2
	ld [%fp+-1024], %f1
	sll %g3, 20, %o3
	sll %l6, 20, %l2
	sll %l7, 20, %l3
.LBB0_181:
	sth %o0, [%fp+-1040]
	sth %o1, [%fp+-1038]
	sth %o4, [%fp+-1036]
	sth %o5, [%fp+-1034]
	sth %l0, [%fp+-1032]
	sth %l1, [%fp+-1030]
	sth %i4, [%fp+-1028]
	sth %i5, [%fp+-1026]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -1040, %i4
	sth %i1, [%i4+%i0]
	lduh [%fp+-1028], %i4
	lduh [%fp+-1026], %i5
	lduh [%fp+-1032], %l0
	lduh [%fp+-1030], %l1
	lduh [%fp+-1036], %o4
	lduh [%fp+-1034], %o5
	lduh [%fp+-1040], %o0
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB0_181
	lduh [%fp+-1038], %o1
	st %f1, [%fp+-1060]
	st %f1, [%fp+-1064]
	st %f0, [%fp+-1068]
	st %f0, [%fp+-1072]
	ld [%fp+-1060], %i0
	st %i0, [%fp+-1216]
	ld [%fp+-1064], %i0
	st %i0, [%fp+-1252]
	ld [%fp+-1068], %i0
	st %i0, [%fp+-1312]
	ld [%fp+-1072], %l4
	and %o4, 4, %i0
	and %o0, 1, %i1
	mov	-1, %g4
	cmp %i1, 0
	mov	%g0, %i1
	bne	.LBB0_184
	mov	%g4, %l5
	mov	%i1, %l5
.LBB0_184:
	srl %i0, 2, %i0
	cmp %i0, 0
	and %l0, 16, %i0
	bne	.LBB0_186
	mov	%g4, %i3
	mov	%i1, %i3
.LBB0_186:
	srl %i0, 4, %i0
	cmp %i0, 0
	and %i4, 64, %i0
	bne	.LBB0_188
	mov	%g4, %o7
	mov	%i1, %o7
.LBB0_188:
	srl %i0, 6, %i0
	cmp %i0, 0
	and %o1, 2, %i0
	bne	.LBB0_190
	mov	%g4, %o0
	mov	%i1, %o0
.LBB0_190:
	srl %i0, 1, %i0
	cmp %i0, 0
	and %o5, 8, %i0
	bne	.LBB0_192
	mov	%g4, %o1
	mov	%i1, %o1
.LBB0_192:
	mov	%i3, %o5
	srl %i0, 3, %i0
	cmp %i0, 0
	and %l1, 32, %l0
	bne	.LBB0_194
	mov	%g4, %l1
	mov	%i1, %l1
.LBB0_194:
	srl %l7, 12, %o4
	srl %l6, 12, %i0
	srl %g3, 12, %i3
	srl %g2, 12, %g2
	srl %l0, 5, %g3
	cmp %g3, 0
	and %i5, 128, %i5
	bne	.LBB0_196
	mov	%g4, %i4
	mov	%i1, %i4
.LBB0_196:
	or %o2, %g2, %l0
	or %o3, %i3, %i3
	or %l2, %i0, %i0
	srl %i5, 7, %i5
	cmp %i5, 0
	bne	.LBB0_198
	or %l3, %o4, %l2
	mov	%i1, %g4
.LBB0_198:
	add %fp, -1044, %i5
	or %i5, 2, %i5
	sth %g4, [%i5]
	add %fp, -1048, %i5
	or %i5, 2, %i5
	sth %i4, [%i5]
	add %fp, -1052, %i4
	or %i4, 2, %i4
	sth %l1, [%i4]
	add %fp, -1056, %i4
	or %i4, 2, %i4
	sth %o1, [%i4]
	sth %o0, [%fp+-1044]
	sth %o7, [%fp+-1048]
	sth %o5, [%fp+-1052]
	sth %l5, [%fp+-1056]
	ld [%fp+-1056], %i4
	ld [%fp+-1052], %i5
	and %i4, %l4, %g2
	ldd [%fp+-1200], %l4
	andn %l5, %i4, %i4
	ld [%fp+-1048], %g3
	andn %l5, %i5, %g4
	ld [%fp+-1044], %l1
	ld [%fp+-1312], %l3
	and %i5, %l3, %i5
	ld [%fp+-1252], %l3
	and %g3, %l3, %l3
	ldd [%fp+-1184], %l4
	andn %l4, %g3, %g3
	andn %l4, %l1, %l4
	ld [%fp+-1216], %l5
	and %l1, %l5, %l1
	or %l4, %l1, %l1
	or %g3, %l3, %g3
	or %g4, %i5, %i5
	or %i4, %g2, %i4
	ldd [%fp+-1264], %l4
	add %l2, %l5, %g2
	add %i0, %l4, %g4
	ldd [%fp+-1248], %l4
	add %i3, %l5, %l3
	add %l0, %l4, %l4
	add %l4, %i4, %l4
	add %l3, %i5, %l5
	add %g4, %g3, %l6
	add %g2, %l1, %l7
	ldd [%fp+-1296], %g2
	xor %l4, %g2, %i4
	std %l4, [%fp+-1216]
	xor %l5, %g3, %i5
	ldd [%fp+-1304], %l4
	xor %l6, %l4, %g2
	xor %l7, %l5, %g3
	srl %g3, 8, %g4
	srl %g2, 8, %l1
	srl %i5, 8, %l3
	srl %i4, 8, %l4
	sll %g3, 24, %o0
	sll %g2, 24, %l5
	sll %i5, 24, %i5
	sll %i4, 24, %i4
	or %i4, %l4, %g2
	or %i5, %l3, %g3
	or %l5, %l1, %l4
	or %o0, %g4, %l5
	ldd [%fp+-1288], %o0
	add %g2, %o0, %i4
	add %g3, %o1, %i5
	ldd [%fp+-1272], %o0
	add %l4, %o0, %o2
	add %l5, %o1, %o3
	xor %i4, %l0, %l0
	std %i4, [%fp+-1184]
	xor %i5, %i3, %l1
	xor %o2, %i0, %o0
	std %o2, [%fp+-1200]
	xor %o3, %l2, %o1
.LBB0_199:
	sth %i4, [%fp+-1088]
	sth %i5, [%fp+-1086]
	sth %o4, [%fp+-1084]
	sth %o5, [%fp+-1082]
	sth %o2, [%fp+-1080]
	sth %o3, [%fp+-1078]
	sth %l2, [%fp+-1076]
	sth %l3, [%fp+-1074]
	and %i1, 7, %i0
	sll %i0, 1, %i0
	add %fp, -1088, %i3
	sth %i2, [%i3+%i0]
	lduh [%fp+-1076], %l2
	lduh [%fp+-1074], %l3
	lduh [%fp+-1080], %o2
	lduh [%fp+-1078], %o3
	lduh [%fp+-1084], %o4
	lduh [%fp+-1082], %o5
	lduh [%fp+-1088], %i4
	add %i1, 1, %i1
	cmp %i1, 8
	bne	.LBB0_199
	lduh [%fp+-1086], %i5
	and %i4, 1, %i2
	and %o2, 16, %i0
	srl %i0, 4, %i1
	mov	-1, %i0
	cmp %i1, 0
	mov	%g0, %i1
	bne	.LBB0_202
	mov	%i0, %i3
	mov	%i1, %i3
.LBB0_202:
	cmp %i2, 0
	and %l2, 64, %i2
	bne	.LBB0_204
	mov	%i0, %g4
	mov	%i1, %g4
.LBB0_204:
	srl %i2, 6, %i2
	cmp %i2, 0
	and %o4, 4, %i2
	bne	.LBB0_206
	mov	%i0, %o7
	mov	%i1, %o7
.LBB0_206:
	srl %i2, 2, %i2
	cmp %i2, 0
	and %o3, 32, %i2
	bne	.LBB0_208
	mov	%i0, %o2
	mov	%i1, %o2
.LBB0_208:
	srl %i2, 5, %i2
	cmp %i2, 0
	and %i5, 2, %i2
	bne	.LBB0_210
	mov	%i0, %i4
	mov	%i1, %i4
.LBB0_210:
	st %o7, [%fp+-1272]
	st %g4, [%fp+-1264]
	st %i3, [%fp+-1252]
	srl %i2, 1, %i2
	cmp %i2, 0
	and %l3, 128, %i2
	bne	.LBB0_212
	mov	%i0, %i5
	mov	%i1, %i5
.LBB0_212:
	sll %o1, 25, %g4
	sll %o0, 25, %l3
	sll %l0, 25, %l2
	sll %l1, 25, %o7
	srl %o1, 7, %o3
	srl %o0, 7, %o1
	srl %l0, 7, %i3
	srl %l1, 7, %l0
	srl %i2, 7, %i2
	cmp %i2, 0
	and %o5, 8, %o0
	bne	.LBB0_214
	mov	%i0, %l1
	mov	%i1, %l1
.LBB0_214:
	or %o7, %l0, %i2
	st %i2, [%fp+-1248]
	or %l2, %i3, %l0
	or %l3, %o1, %o7
	srl %o0, 3, %i2
	cmp %i2, 0
	bne	.LBB0_216
	or %g4, %o3, %g4
	mov	%i1, %i0
.LBB0_216:
	add %fp, -1100, %i1
	or %i1, 2, %i1
	sth %i0, [%i1]
	add %fp, -1092, %i0
	or %i0, 2, %i0
	sth %l1, [%i0]
	add %fp, -1104, %i0
	or %i0, 2, %i0
	sth %i5, [%i0]
	add %fp, -1096, %i0
	or %i0, 2, %i0
	sth %i4, [%i0]
	sth %o2, [%fp+-1100]
	ld [%fp+-1272], %i0
	sth %i0, [%fp+-1092]
	ld [%fp+-1264], %i0
	sth %i0, [%fp+-1104]
	ld [%fp+-1252], %i0
	sth %i0, [%fp+-1096]
	ld [%fp+-1096], %i0
	ld [%fp+-1092], %i1
	ld [%fp+-1100], %i2
	ldd [%fp+-1232], %i4
	and %i0, %i4, %i3
	and %i1, %i5, %i4
	ldd [%fp+-1224], %o0
	andn %o0, %i0, %i5
	andn %o1, %i1, %i0
	ldd [%fp+-1240], %o2
	and %i2, %o3, %i1
	ldd [%fp+-1192], %o4
	andn %o5, %i2, %i2
	or %i2, %i1, %i1
	or %i0, %i4, %i0
	ldd [%fp+-1216], %l2
	add %o7, %l3, %i2
	add %i2, %i0, %l1
	ld [%fp+-1104], %i2
	add %g4, %l6, %i0
	add %i0, %i1, %i0
	xor %i0, %g3, %o1
	xor %l1, %g2, %o0
	andn %o4, %i2, %i1
	and %i2, %o2, %i2
	or %i1, %i2, %i1
	or %i5, %i3, %i2
	add %l0, %l7, %i3
	ld [%fp+-1248], %o4
	add %o4, %l2, %i4
	add %i4, %i2, %i2
	add %i3, %i1, %i1
	st %o1, [%fp+-1132]
	st %o0, [%fp+-1124]
	xor %i1, %l4, %i4
	xor %i2, %l5, %i5
	st %i5, [%fp+-1116]
	st %i4, [%fp+-1108]
	add %fp, -1132, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	add %fp, -1124, %i4
	or %i4, 2, %i4
	lduh [%i4], %i5
	add %fp, -1116, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -1108, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -1112, %g3
	or %g3, 2, %g3
	lduh [%fp+-1108], %l4
	lduh [%fp+-1132], %l5
	lduh [%fp+-1124], %l6
	lduh [%fp+-1116], %l7
	sth %l4, [%g3]
	add %fp, -1120, %g3
	or %g3, 2, %g3
	sth %l7, [%g3]
	sth %g2, [%fp+-1112]
	sth %i4, [%fp+-1120]
	add %fp, -1128, %i4
	or %i4, 2, %g2
	ld [%fp+-1112], %i4
	ld [%fp+-1120], %g3
	sth %l6, [%g2]
	add %fp, -1136, %g2
	or %g2, 2, %g2
	sth %l5, [%g2]
	sth %i5, [%fp+-1128]
	sth %i3, [%fp+-1136]
	ld [%fp+-1128], %i3
	ldd [%fp+-1176], %l4
	add %i2, %l4, %i2
	ld [%fp+-1136], %i5
	ldd [%fp+-1208], %l4
	add %l1, %l4, %g2
	ldd [%fp+-1200], %l4
	add %l5, %i3, %l1
	add %l4, %g3, %l4
	ldd [%fp+-1184], %l6
	add %l6, %i5, %l5
	add %l7, %i4, %l6
	xor %l6, %l0, %l2
	xor %l4, %o4, %l0
	xor %l1, %o7, %l3
	xor %l5, %g4, %g4
	srl %l2, 12, %l7
	sll %l2, 20, %l2
	or %l2, %l7, %l2
	srl %l0, 12, %l7
	sll %l0, 20, %l0
	or %l0, %l7, %l0
	srl %l3, 12, %l7
	sll %l3, 20, %l3
	or %l3, %l7, %l3
	srl %g4, 12, %l7
	sll %g4, 20, %g4
	or %g4, %l7, %g4
	add %i1, %o3, %i1
	add %i0, %o2, %i0
	add %i0, %g4, %l7
	add %g2, %l3, %g2
	add %i2, %l0, %i2
	add %i1, %l2, %o0
	xor %i2, %g3, %i0
	xor %g2, %i3, %i1
	srl %i1, 8, %i3
	srl %i0, 8, %g3
	sll %i1, 24, %i1
	sll %i0, 24, %i0
	or %i0, %g3, %i0
	or %i1, %i3, %i1
	add %i1, %l1, %i3
	add %i0, %l4, %g3
	xor %g3, %l7, %o2
	xor %i3, %o0, %o3
	std %o2, [%fp+-1168]
	xor %o0, %i4, %i4
	xor %l7, %i5, %i5
	srl %i4, 8, %l1
	sll %i4, 24, %i4
	or %i4, %l1, %i4
	srl %i5, 8, %l1
	sll %i5, 24, %i5
	or %i5, %l1, %i5
	xor %g3, %l0, %g3
	add %i5, %l5, %l0
	add %i4, %l6, %l1
	xor %l1, %l2, %l2
	xor %i3, %l3, %i3
	srl %l2, 7, %l3
	sll %l2, 25, %l2
	or %l2, %l3, %l2
	add %fp, -1168, %l3
	or %l3, 4, %l3
	ld [%l3], %l3
	xor %l0, %g4, %g4
	xor %l1, %g2, %l5
	xor %l0, %i2, %l4
	ld [%fp+-1276], %l0
	stb %l3, [%l0+15]
	ld [%fp+-1168], %i2
	srl %l3, 8, %g2
	stb %g2, [%l0+14]
	srl %l3, 16, %g2
	stb %g2, [%l0+13]
	srl %l3, 24, %g2
	stb %g2, [%l0+12]
	srl %i2, 8, %g2
	stb %g2, [%l0+10]
	srl %i2, 16, %g2
	stb %g2, [%l0+9]
	stb %i2, [%l0+11]
	srl %i2, 24, %i2
	stb %i2, [%l0+8]
	std %l4, [%fp+-1160]
	add %fp, -1160, %i2
	or %i2, 4, %i2
	ld [%i2], %i2
	srl %g3, 7, %g2
	sll %g3, 25, %g3
	or %g3, %g2, %g2
	stb %i2, [%l0+7]
	xor %g2, %i5, %g3
	xor %l2, %i1, %g2
	ld [%fp+-1160], %i1
	srl %i2, 8, %i5
	stb %i5, [%l0+6]
	srl %i2, 16, %i5
	stb %i5, [%l0+5]
	srl %i2, 24, %i2
	stb %i2, [%l0+4]
	srl %i1, 8, %i2
	stb %i2, [%l0+2]
	srl %i1, 16, %i2
	stb %i2, [%l0+1]
	stb %i1, [%l0+3]
	srl %i1, 24, %i1
	stb %i1, [%l0]
	std %g2, [%fp+-1152]
	srl %g4, 7, %i1
	srl %i3, 7, %i2
	sll %g4, 25, %i5
	sll %i3, 25, %i3
	or %i3, %i2, %i2
	add %fp, -1152, %i3
	or %i3, 4, %i3
	ld [%i3], %i3
	or %i5, %i1, %i1
	xor %i1, %i0, %i1
	xor %i2, %i4, %i0
	stb %i3, [%l0+23]
	ld [%fp+-1152], %i2
	srl %i3, 8, %i4
	stb %i4, [%l0+22]
	srl %i3, 16, %i4
	stb %i4, [%l0+21]
	srl %i3, 24, %i3
	stb %i3, [%l0+20]
	srl %i2, 8, %i3
	stb %i3, [%l0+18]
	srl %i2, 16, %i3
	stb %i3, [%l0+17]
	stb %i2, [%l0+19]
	srl %i2, 24, %i2
	stb %i2, [%l0+16]
	std %i0, [%fp+-1144]
	add %fp, -1144, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%l0+31]
	ld [%fp+-1144], %i1
	srl %i0, 8, %i2
	stb %i2, [%l0+30]
	srl %i0, 16, %i2
	stb %i2, [%l0+29]
	srl %i0, 24, %i0
	stb %i0, [%l0+28]
	srl %i1, 8, %i0
	stb %i0, [%l0+26]
	srl %i1, 16, %i0
	stb %i0, [%l0+25]
	stb %i1, [%l0+27]
	srl %i1, 24, %i0
	stb %i0, [%l0+24]
	ret
	restore
.Lfunc_end0:
	.size	_blake3_compress_in_place_sse2, .Lfunc_end0-_blake3_compress_in_place_sse2

	.globl	_blake3_compress_xof_sse2
	.p2align	2
	.type	_blake3_compress_xof_sse2,@function
_blake3_compress_xof_sse2:
	save %sp, -1520, %sp
	mov	%i0, %l2
	ldub [%i0+6], %i0
	ldub [%l2+7], %g2
	ldub [%l2+4], %g3
	ldub [%l2+5], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	add %fp, -192, %g2
	or %g2, 4, %g2
	st %i0, [%g2]
	ldub [%l2+14], %i0
	ldub [%l2+15], %g2
	ldub [%l2+12], %g3
	ldub [%l2+13], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	add %fp, -176, %g2
	or %g2, 4, %g2
	st %i0, [%g2]
	ldub [%l2+2], %i0
	ldub [%l2+3], %g2
	ldub [%l2], %g3
	ldub [%l2+1], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-192]
	ldub [%l2+10], %i0
	ldub [%l2+11], %g2
	ldub [%l2+8], %g3
	ldub [%l2+9], %g4
	sll %i0, 8, %i0
	or %i0, %g2, %i0
	sll %g3, 8, %g2
	or %g2, %g4, %g2
	sll %g2, 16, %g2
	or %g2, %i0, %i0
	st %i0, [%fp+-176]
	ldd [%fp+-192], %g2
	std %g2, [%fp+-1248]
	ldd [%fp+-176], %o4
	ldub [%l2+22], %i0
	ldub [%l2+23], %g4
	ldub [%l2+20], %l0
	ldub [%l2+21], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	add %fp, -168, %g4
	or %g4, 4, %g4
	st %i0, [%g4]
	ldub [%l2+30], %i0
	ldub [%l2+31], %g4
	ldub [%l2+28], %l0
	ldub [%l2+29], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	add %fp, -184, %g4
	or %g4, 4, %g4
	st %i0, [%g4]
	ldub [%l2+18], %i0
	ldub [%l2+19], %g4
	ldub [%l2+16], %l0
	ldub [%l2+17], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	st %i0, [%fp+-168]
	ldub [%l2+26], %i0
	ldub [%l2+27], %g4
	ldub [%l2+24], %l0
	st %l2, [%fp+-1348]
	ldub [%l2+25], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	st %i0, [%fp+-184]
	ldd [%fp+-168], %g2
	std %g2, [%fp+-1256]
	ldd [%fp+-184], %o0
	ldub [%i1+14], %i0
	ldub [%i1+15], %g4
	ldub [%i1+12], %l0
	ldub [%i1+13], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	st %i0, [%fp+-200]
	ldub [%i1+6], %i0
	ldub [%i1+7], %g4
	ldub [%i1+4], %l0
	ldub [%i1+5], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	st %i0, [%fp+-240]
	ldub [%i1+10], %i0
	ldub [%i1+11], %g4
	ldub [%i1+8], %l0
	ldub [%i1+9], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	st %i0, [%fp+-244]
	ldub [%i1+2], %i0
	ldub [%i1+3], %g4
	ldub [%i1], %l0
	ldub [%i1+1], %l1
	sll %i0, 8, %i0
	or %i0, %g4, %i0
	sll %l0, 8, %g4
	or %g4, %l1, %g4
	sll %g4, 16, %g4
	or %g4, %i0, %i0
	st %i0, [%fp+-196]
	ld [%fp+-200], %f0
	st %f0, [%fp+-156]
	ld [%fp+-240], %f1
	st %f1, [%fp+-116]
	ld [%fp+-244], %f2
	st %f2, [%fp+-112]
	ld [%fp+-196], %f2
	st %f2, [%fp+-160]
	ld [%fp+-156], %l0
	std %l0, [%fp+-1240]
	ld [%fp+-116], %g4
	ld [%fp+-112], %g3
	ld [%fp+-160], %g2
	std %g2, [%fp+-1288]
	ldub [%i1+30], %i0
	ldub [%i1+31], %l0
	ldub [%i1+28], %l1
	ldub [%i1+29], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-208]
	ldub [%i1+22], %i0
	ldub [%i1+23], %l0
	ldub [%i1+20], %l1
	ldub [%i1+21], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-212]
	ldub [%i1+26], %i0
	ldub [%i1+27], %l0
	ldub [%i1+24], %l1
	ldub [%i1+25], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-204]
	ldub [%i1+18], %i0
	ldub [%i1+19], %l0
	ldub [%i1+16], %l1
	ldub [%i1+17], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-256]
	ld [%fp+-208], %f2
	st %f2, [%fp+-148]
	ld [%fp+-212], %f2
	st %f2, [%fp+-144]
	ld [%fp+-204], %f2
	st %f2, [%fp+-152]
	ld [%fp+-256], %f2
	st %f2, [%fp+-100]
	ldub [%i1+38], %i0
	ldub [%i1+39], %l0
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	ldub [%i1+36], %l0
	ldub [%i1+37], %l1
	ld [%fp+-148], %g3
	ld [%fp+-144], %g2
	std %g2, [%fp+-1272]
	sll %l0, 8, %l0
	or %l0, %l1, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	ld [%fp+-152], %l7
	ld [%fp+-100], %l6
	st %i0, [%fp+-224]
	ldub [%i1+46], %i0
	ldub [%i1+47], %l0
	ldub [%i1+44], %l1
	ldub [%i1+45], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-220]
	ldub [%i1+34], %i0
	ldub [%i1+35], %l0
	ldub [%i1+32], %l1
	ldub [%i1+33], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-252]
	ldub [%i1+42], %i0
	ldub [%i1+43], %l0
	ldub [%i1+40], %l1
	ldub [%i1+41], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-216]
	ld [%fp+-224], %f2
	st %f2, [%fp+-132]
	ld [%fp+-220], %f2
	st %f2, [%fp+-136]
	ld [%fp+-252], %f2
	st %f2, [%fp+-104]
	ld [%fp+-216], %f2
	st %f2, [%fp+-140]
	ldub [%i1+62], %i0
	ldub [%i1+63], %l0
	ldub [%i1+60], %l1
	ldub [%i1+61], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	ld [%fp+-132], %g3
	ld [%fp+-136], %l4
	ld [%fp+-104], %o3
	ld [%fp+-140], %l0
	std %l0, [%fp+-1280]
	st %i0, [%fp+-232]
	ldub [%i1+54], %i0
	ldub [%i1+55], %l0
	ldub [%i1+52], %l1
	ldub [%i1+53], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-236]
	ldub [%i1+58], %i0
	ldub [%i1+59], %l0
	ldub [%i1+56], %l1
	ldub [%i1+57], %l2
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %i0, %i0
	st %i0, [%fp+-228]
	ldub [%i1+50], %i0
	ldub [%i1+51], %l0
	ldub [%i1+48], %l1
	ldub [%i1+49], %i1
	sll %i0, 8, %i0
	or %i0, %l0, %i0
	sll %l1, 8, %l0
	or %l0, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i0, %i0
	st %i0, [%fp+-248]
	ld [%fp+-232], %f3
	st %f3, [%fp+-124]
	ld [%fp+-236], %f3
	st %f3, [%fp+-120]
	ld [%fp+-228], %f4
	add %o1, %o5, %i1
	add %o0, %o4, %i0
	mov	%o0, %o4
	mov	%o1, %o5
	st %f4, [%fp+-128]
	ld [%fp+-248], %f4
	std %l6, [%fp+-1296]
	add %i0, %l6, %i0
	add %i1, %l7, %o7
	xor %o7, %i5, %l1
	xor %i0, %i2, %l0
	st %f4, [%fp+-108]
	ld [%fp+-124], %g2
	std %g2, [%fp+-1312]
	ld [%fp+-120], %l5
	std %l4, [%fp+-1304]
	ld [%fp+-128], %o2
	std %o2, [%fp+-1264]
	ldd [%fp+-1280], %g2
	ld [%fp+-108], %g3
	std %g2, [%fp+-1280]
	st %l0, [%fp+-4]
	st %l1, [%fp+-12]
	ldd [%fp+-1248], %g2
	ldd [%fp+-1256], %o0
	add %o1, %g3, %i1
	add %o0, %g2, %i2
	ldd [%fp+-1288], %g2
	add %i2, %g2, %i2
	add %i1, %g3, %i1
	xor %i1, %i3, %l1
	xor %i2, %i4, %l0
	st %l0, [%fp+-20]
	st %l1, [%fp+-28]
	add %fp, -4, %i3
	or %i3, 2, %i3
	lduh [%i3], %i4
	add %fp, -12, %i3
	or %i3, 2, %i3
	lduh [%i3], %i5
	add %fp, -20, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	add %fp, -28, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -32, %l0
	or %l0, 2, %l0
	lduh [%fp+-28], %l1
	lduh [%fp+-4], %l2
	lduh [%fp+-12], %l3
	lduh [%fp+-20], %l6
	sth %l1, [%l0]
	add %fp, -24, %l0
	or %l0, 2, %l0
	sth %l6, [%l0]
	sth %g3, [%fp+-32]
	sth %i3, [%fp+-24]
	add %fp, -16, %i3
	or %i3, 2, %g3
	ld [%fp+-32], %l6
	ld [%fp+-24], %i3
	sth %l3, [%g3]
	add %fp, -8, %g3
	or %g3, 2, %g3
	sth %l2, [%g3]
	sth %i5, [%fp+-16]
	sth %i4, [%fp+-8]
	ld [%fp+-8], %i5
	sethi 990140, %i4
	or %i4, 882, %i4
	ld [%fp+-16], %l2
	add %i5, %i4, %l3
	sethi 2708477, %i4
	or %i4, 314, %i4
	add %l2, %i4, %l7
	xor %l7, %o5, %l0
	xor %l3, %o4, %l1
	sethi 1737337, %i4
	or %i4, 615, %i4
	add %i3, %i4, %i4
	sethi 3070443, %g3
	or %g3, 645, %g3
	add %l6, %g3, %g3
	xor %g3, %o1, %l4
	xor %i4, %o0, %l5
	srl %l0, 12, %o0
	sll %l0, 20, %l0
	or %l0, %o0, %o0
	srl %l1, 12, %l0
	sll %l1, 20, %l1
	or %l1, %l0, %o1
	srl %l4, 12, %l0
	sll %l4, 20, %l1
	or %l1, %l0, %l1
	srl %l5, 12, %l0
	sll %l5, 20, %l4
	or %l4, %l0, %l0
	add %i2, %g4, %i2
	ldd [%fp+-1272], %o4
	add %o7, %o5, %g2
	add %g2, %o0, %g4
	xor %g4, %l2, %g2
	srl %g2, 8, %l2
	sll %g2, 24, %g2
	or %g2, %l2, %l4
	add %i0, %o4, %i0
	add %i0, %o1, %i0
	xor %i0, %i5, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %l5
	ldd [%fp+-1240], %o2
	add %i1, %o2, %i1
	add %i1, %l1, %i1
	xor %i1, %l6, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %l6
	add %i2, %l0, %o2
	xor %o2, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %l2
	add %l4, %l7, %i2
	xor %i2, %o0, %i3
	srl %i3, 7, %i5
	sll %i3, 25, %i3
	or %i3, %i5, %i3
	add %l5, %l3, %g2
	xor %g2, %o1, %i5
	srl %i5, 7, %l3
	sll %i5, 25, %i5
	or %i5, %l3, %i5
	ldd [%fp+-1280], %o0
	add %i0, %o1, %i0
	add %i1, %o0, %i1
	add %i5, %i1, %i1
	add %i3, %i0, %i0
	xor %i0, %l6, %o1
	xor %i1, %l2, %o0
	st %o1, [%fp+-60]
	st %o0, [%fp+-52]
	add %l2, %i4, %l2
	add %l6, %g3, %i4
	xor %i4, %l1, %g3
	srl %g3, 7, %l1
	sll %g3, 25, %g3
	or %g3, %l1, %l3
	xor %l2, %l0, %g3
	srl %g3, 7, %l0
	sll %g3, 25, %g3
	or %g3, %l0, %l0
	ldd [%fp+-1264], %l6
	add %o2, %l7, %g3
	add %g4, %l6, %g4
	add %l0, %g4, %l1
	add %l3, %g3, %g3
	xor %g3, %l4, %l7
	xor %l1, %l5, %l6
	st %l7, [%fp+-44]
	st %l6, [%fp+-36]
	add %fp, -60, %g4
	or %g4, 2, %g4
	lduh [%g4], %g4
	add %fp, -52, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -44, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -36, %l6
	or %l6, 2, %l6
	lduh [%l6], %l6
	add %fp, -40, %l7
	or %l7, 2, %l7
	lduh [%fp+-36], %o0
	lduh [%fp+-60], %o1
	lduh [%fp+-52], %o2
	lduh [%fp+-44], %o3
	sth %o0, [%l7]
	add %fp, -48, %l7
	or %l7, 2, %l7
	sth %o3, [%l7]
	sth %l6, [%fp+-40]
	sth %l5, [%fp+-48]
	add %fp, -56, %l5
	or %l5, 2, %l5
	ld [%fp+-40], %l6
	ld [%fp+-48], %l7
	sth %o2, [%l5]
	add %fp, -64, %l5
	or %l5, 2, %l5
	sth %o1, [%l5]
	sth %l4, [%fp+-56]
	sth %g4, [%fp+-64]
	add %i4, %l6, %i4
	xor %i4, %l0, %g4
	srl %g4, 12, %l0
	sll %g4, 20, %g4
	or %g4, %l0, %g4
	add %g2, %l7, %l0
	xor %l0, %l3, %g2
	ld [%fp+-56], %l3
	srl %g2, 12, %l4
	sll %g2, 20, %g2
	or %g2, %l4, %g2
	add %i2, %l3, %i2
	xor %i2, %i5, %i5
	ld [%fp+-64], %l4
	srl %i5, 12, %l5
	sll %i5, 20, %i5
	or %i5, %l5, %i5
	add %l2, %l4, %l2
	xor %l2, %i3, %i3
	srl %i3, 12, %l5
	sll %i3, 20, %i3
	or %i3, %l5, %l5
	ldd [%fp+-1312], %o0
	add %l1, %o0, %i3
	add %i3, %g4, %l1
	xor %l1, %l6, %i3
	srl %i3, 8, %l6
	sll %i3, 24, %i3
	or %i3, %l6, %l6
	add %g3, %o1, %i3
	add %i3, %g2, %g3
	xor %g3, %l7, %i3
	srl %i3, 8, %l7
	sll %i3, 24, %i3
	or %i3, %l7, %l7
	ldd [%fp+-1304], %o2
	add %i1, %o2, %i1
	add %i1, %i5, %o0
	xor %o0, %l3, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %l3
	add %i0, %o3, %i0
	add %i0, %l5, %o1
	xor %o1, %l4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %l4
	add %l3, %i2, %i0
	st %i0, [%fp+-1248]
	xor %i0, %i5, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %o2
	st %o2, [%fp+-1320]
	add %l4, %l2, %i0
	st %i0, [%fp+-1256]
	xor %i0, %l5, %i2
	srl %i2, 7, %i5
	sll %i2, 25, %i2
	or %i2, %i5, %o7
	add %o1, %o5, %i5
	ldd [%fp+-1296], %i2
	add %l1, %i2, %l1
	add %o7, %l1, %i1
	add %o2, %i5, %i0
	xor %i1, %l7, %o3
	std %i0, [%fp+-1360]
	xor %i0, %l6, %o2
	st %o2, [%fp+-84]
	st %o3, [%fp+-92]
	add %l7, %l0, %i5
	add %l6, %i4, %l0
	xor %l0, %g4, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %i4
	xor %i5, %g2, %g2
	srl %g2, 7, %g4
	sll %g2, 25, %g2
	or %g2, %g4, %g4
	ldd [%fp+-1240], %l6
	mov	%o5, %l7
	ldd [%fp+-1288], %o2
	add %g3, %o3, %g2
	std %l6, [%fp+-1240]
	add %o0, %l6, %g3
	add %g4, %g3, %i1
	add %i4, %g2, %i0
	xor %i1, %l4, %g3
	std %i0, [%fp+-1376]
	xor %i0, %l3, %g2
	st %g2, [%fp+-68]
	st %g3, [%fp+-76]
	add %fp, -84, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -92, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -68, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -76, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -80, %l3
	or %l3, 2, %l3
	lduh [%fp+-76], %l4
	lduh [%fp+-84], %l5
	lduh [%fp+-92], %l6
	lduh [%fp+-68], %l7
	sth %l4, [%l3]
	add %fp, -72, %l3
	or %l3, 2, %l3
	sth %l7, [%l3]
	sth %l2, [%fp+-80]
	sth %l1, [%fp+-72]
	ld [%fp+-80], %o1
	ld [%fp+-72], %o0
	add %fp, -96, %l1
	or %l1, 2, %l1
	sth %l6, [%l1]
	add %fp, -88, %l1
	or %l1, 2, %l1
	sth %l5, [%l1]
	sth %g3, [%fp+-96]
	sth %g2, [%fp+-88]
	ld [%fp+-96], %g3
	ld [%fp+-88], %g2
	ld [%fp+-1248], %i0
	add %i0, %g3, %i1
	add %i5, %g2, %i0
	add %l0, %o1, %l1
	ld [%fp+-1256], %i5
	add %i5, %o0, %l0
	xor %i1, %o7, %l3
	std %i0, [%fp+-1368]
	ld [%fp+-1320], %i5
	xor %i0, %i5, %l2
	xor %l1, %g4, %l5
	std %l0, [%fp+-1384]
	xor %l0, %i4, %l4
	mov	%o2, %i0
	mov	%o3, %i1
	mov	%i1, %i3
	std %i2, [%fp+-1320]
	sll %l2, 20, %l0
	sll %l3, 20, %l1
	ld [%fp+92], %i0
	st %i0, [%fp+-1352]
	sll %l4, 20, %l6
	sll %l5, 20, %l7
	mov	%g0, %i3
	mov	204, %i2
.LBB1_1:
	sth %o2, [%fp+-272]
	sth %o3, [%fp+-270]
	sth %i0, [%fp+-268]
	sth %i1, [%fp+-266]
	sth %o4, [%fp+-264]
	sth %o5, [%fp+-262]
	sth %i4, [%fp+-260]
	sth %i5, [%fp+-258]
	and %i3, 7, %i0
	sll %i0, 1, %i0
	add %fp, -272, %i1
	sth %i2, [%i1+%i0]
	lduh [%fp+-260], %i4
	lduh [%fp+-258], %i5
	lduh [%fp+-264], %o4
	lduh [%fp+-262], %o5
	lduh [%fp+-268], %i0
	lduh [%fp+-266], %i1
	lduh [%fp+-272], %o2
	add %i3, 1, %i3
	cmp %i3, 8
	bne	.LBB1_1
	lduh [%fp+-270], %o3
	st %f2, [%fp+-300]
	st %f2, [%fp+-304]
	st %f3, [%fp+-292]
	st %f3, [%fp+-296]
	ld [%fp+-300], %i3
	st %i3, [%fp+-1392]
	ld [%fp+-304], %i3
	st %i3, [%fp+-1396]
	ld [%fp+-292], %i3
	st %i3, [%fp+-1400]
	ld [%fp+-296], %i3
	st %i3, [%fp+-1408]
	and %i4, 64, %o7
	and %o4, 16, %i3
	srl %i3, 4, %g4
	mov	-1, %i3
	cmp %g4, 0
	mov	%g0, %g4
	bne	.LBB1_4
	st %i3, [%fp+-1328]
	st %g4, [%fp+-1328]
.LBB1_4:
	srl %o7, 6, %o7
	cmp %o7, 0
	and %o2, 1, %o7
	bne	.LBB1_6
	st %i3, [%fp+-1336]
	st %g4, [%fp+-1336]
.LBB1_6:
	cmp %o7, 0
	and %i0, 4, %o7
	bne	.LBB1_8
	st %i3, [%fp+-1344]
	st %g4, [%fp+-1344]
.LBB1_8:
	srl %o7, 2, %o7
	cmp %o7, 0
	and %o5, 32, %o5
	bne	.LBB1_10
	mov	%i3, %o4
	mov	%g4, %o4
.LBB1_10:
	srl %o5, 5, %o5
	cmp %o5, 0
	and %i5, 128, %i4
	bne	.LBB1_12
	mov	%i3, %o5
	mov	%g4, %o5
.LBB1_12:
	srl %i4, 7, %i4
	cmp %i4, 0
	and %o3, 2, %o3
	bne	.LBB1_14
	mov	%i3, %o2
	mov	%g4, %o2
.LBB1_14:
	srl %l3, 12, %i5
	srl %l2, 12, %i4
	srl %l5, 12, %l3
	srl %l4, 12, %l4
	srl %o3, 1, %l2
	cmp %l2, 0
	and %i1, 8, %l5
	bne	.LBB1_16
	mov	%i3, %l2
	mov	%g4, %l2
.LBB1_16:
	ldd [%fp+-1320], %i0
	mov	%i1, %i0
	std %i0, [%fp+-1256]
	ldd [%fp+-1240], %i0
	mov	%i1, %i0
	std %i0, [%fp+-1248]
	or %l6, %l4, %i0
	or %l7, %l3, %i1
	or %l0, %i4, %i4
	srl %l5, 3, %l3
	cmp %l3, 0
	bne	.LBB1_18
	or %l1, %i5, %i5
	mov	%g4, %i3
.LBB1_18:
	add %fp, -284, %l0
	or %l0, 2, %l0
	sth %i3, [%l0]
	add %fp, -288, %i3
	or %i3, 2, %i3
	sth %l2, [%i3]
	add %fp, -276, %i3
	or %i3, 2, %i3
	sth %o2, [%i3]
	add %fp, -280, %i3
	or %i3, 2, %i3
	sth %o5, [%i3]
	sth %o4, [%fp+-284]
	ld [%fp+-1344], %i3
	sth %i3, [%fp+-288]
	ld [%fp+-1336], %i3
	sth %i3, [%fp+-276]
	ld [%fp+-1328], %i3
	sth %i3, [%fp+-280]
	ld [%fp+-280], %i3
	ldd [%fp+-1256], %l0
	ldd [%fp+-1240], %l2
	mov	%l2, %l1
	std %l0, [%fp+-1256]
	ldd [%fp+-1248], %l0
	ldd [%fp+-1320], %l2
	mov	%l2, %l1
	std %l0, [%fp+-1248]
	ld [%fp+-276], %l0
	ld [%fp+-1408], %l1
	and %i3, %l1, %l1
	ldd [%fp+-1288], %l4
	andn %l4, %i3, %i3
	ld [%fp+-288], %l2
	andn %l4, %l0, %l3
	ld [%fp+-284], %l4
	ld [%fp+-1400], %l5
	and %l0, %l5, %l0
	ld [%fp+-1396], %l5
	and %l2, %l5, %l5
	ldd [%fp+-1296], %l6
	andn %l7, %l2, %l2
	andn %l7, %l4, %l6
	ld [%fp+-1392], %l7
	and %l4, %l7, %l4
	or %l6, %l4, %l7
	or %l2, %l5, %l6
	or %l3, %l0, %l5
	or %i3, %l1, %l4
	ldd [%fp+-1360], %l0
	add %i5, %l1, %i3
	add %i4, %l0, %l0
	ldd [%fp+-1376], %l2
	add %i1, %l3, %l1
	add %i0, %l2, %l2
	add %l2, %l6, %l2
	std %l6, [%fp+-1296]
	add %l1, %l7, %l3
	add %l0, %l4, %l0
	std %l4, [%fp+-1240]
	add %i3, %l5, %l1
	xor %l2, %o0, %i3
	std %l2, [%fp+-1376]
	xor %l3, %o1, %l2
	xor %l0, %g2, %l3
	xor %l1, %g3, %g2
	srl %g2, 8, %g3
	srl %l3, 8, %l4
	srl %l2, 8, %l5
	srl %i3, 8, %l6
	sll %g2, 24, %g2
	sll %l3, 24, %l7
	sll %l2, 24, %o0
	sll %i3, 24, %i3
	or %i3, %l6, %l2
	or %o0, %l5, %l3
	or %l7, %l4, %l4
	or %g2, %g3, %l5
	ldd [%fp+-1384], %g2
	add %l2, %g2, %l6
	add %l3, %g3, %l7
	ldd [%fp+-1368], %g2
	add %l4, %g2, %o0
	add %l5, %g3, %o1
	xor %l6, %i0, %i0
	std %l6, [%fp+-1336]
	xor %l7, %i1, %i1
	xor %o0, %i4, %i3
	std %o0, [%fp+-1344]
	xor %o1, %i5, %i4
	srl %i4, 7, %i5
	srl %i3, 7, %g2
	srl %i1, 7, %g3
	srl %i0, 7, %l6
	sll %i4, 25, %i4
	sll %i3, 25, %i3
	sll %i1, 25, %i1
	sll %i0, 25, %i0
	or %i0, %l6, %l6
	or %i1, %g3, %l7
	std %l6, [%fp+-1360]
	or %i3, %g2, %i0
	or %i4, %i5, %i1
	std %i0, [%fp+-1328]
	mov	192, %i3
.LBB1_19:
	sth %g2, [%fp+-320]
	sth %g3, [%fp+-318]
	sth %i0, [%fp+-316]
	sth %i1, [%fp+-314]
	sth %l6, [%fp+-312]
	sth %l7, [%fp+-310]
	sth %o4, [%fp+-308]
	sth %o5, [%fp+-306]
	and %g4, 7, %i0
	sll %i0, 1, %i0
	add %fp, -320, %i1
	sth %i3, [%i1+%i0]
	lduh [%fp+-308], %o4
	lduh [%fp+-306], %o5
	lduh [%fp+-312], %l6
	lduh [%fp+-310], %l7
	lduh [%fp+-316], %i0
	lduh [%fp+-314], %i1
	lduh [%fp+-320], %g2
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_19
	lduh [%fp+-318], %g3
	st %f0, [%fp+-412]
	st %f1, [%fp+-416]
	ld [%fp+-412], %o0
	ld [%fp+-416], %i4
	st %i4, [%fp+-1288]
	and %l6, 16, %i5
	and %g2, 1, %i4
	mov	-1, %o7
	cmp %i4, 0
	mov	%g0, %i4
	bne	.LBB1_22
	mov	%o7, %g4
	mov	%i4, %g4
.LBB1_22:
	srl %i5, 4, %i5
	cmp %i5, 0
	and %o4, 64, %o2
	bne	.LBB1_24
	mov	%o7, %i5
	mov	%i4, %i5
.LBB1_24:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %i0, 4, %o3
	bne	.LBB1_26
	mov	%o7, %o2
	mov	%i4, %o2
.LBB1_26:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %g3, 2, %g3
	bne	.LBB1_28
	mov	%o7, %g2
	mov	%i4, %g2
.LBB1_28:
	srl %g3, 1, %g3
	cmp %g3, 0
	and %l7, 32, %l6
	bne	.LBB1_30
	mov	%o7, %g3
	mov	%i4, %g3
.LBB1_30:
	srl %l6, 5, %l6
	cmp %l6, 0
	and %o5, 128, %l7
	bne	.LBB1_32
	mov	%o7, %l6
	mov	%i4, %l6
.LBB1_32:
	srl %l7, 7, %l7
	cmp %l7, 0
	and %i1, 8, %i1
	bne	.LBB1_34
	mov	%o7, %i0
	mov	%i4, %i0
.LBB1_34:
	srl %i1, 3, %i1
	cmp %i1, 0
	bne	.LBB1_36
	nop
	mov	%i4, %o7
.LBB1_36:
	add %fp, -332, %i1
	or %i1, 2, %i1
	sth %o7, [%i1]
	add %fp, -324, %i1
	or %i1, 2, %i1
	sth %i0, [%i1]
	add %fp, -328, %i0
	or %i0, 2, %i0
	sth %l6, [%i0]
	add %fp, -336, %i0
	or %i0, 2, %i0
	sth %g3, [%i0]
	sth %g2, [%fp+-332]
	sth %o2, [%fp+-324]
	sth %i5, [%fp+-328]
	sth %g4, [%fp+-336]
	ld [%fp+-324], %i0
	ld [%fp+-332], %i1
	andn %o0, %i0, %i5
	ldd [%fp+-1280], %o2
	and %i0, %o3, %i0
	ldd [%fp+-1264], %o4
	and %i1, %o5, %g2
	ldd [%fp+-1312], %l6
	andn %l7, %i1, %i1
	ld [%fp+-328], %g3
	ld [%fp+-336], %g4
	or %i1, %g2, %o1
	or %i5, %i0, %o0
	and %g3, %o2, %i0
	andn %l6, %g4, %i1
	ld [%fp+-1288], %i5
	andn %i5, %g3, %i5
	and %g4, %o4, %g2
	or %i5, %i0, %l7
	or %i1, %g2, %l6
	ldd [%fp+-1376], %o4
	ldd [%fp+-1328], %g2
	add %g2, %o5, %i0
	std %o0, [%fp+-1320]
	add %i0, %o0, %i5
	st %i5, [%fp+-1368]
	add %g3, %l0, %i1
	add %i1, %o1, %i0
	st %i0, [%fp+-1280]
	xor %i0, %l3, %g3
	xor %i5, %l2, %g2
	ldd [%fp+-1360], %o2
	add %o2, %l1, %g4
	add %o3, %o4, %i1
	add %i1, %l7, %i1
	std %l6, [%fp+-1288]
	add %g4, %l6, %i0
	st %i0, [%fp+-1312]
	st %g3, [%fp+-348]
	st %g2, [%fp+-340]
	xor %i0, %l4, %g2
	xor %i1, %l5, %g3
	st %g3, [%fp+-364]
	st %g2, [%fp+-356]
	add %fp, -348, %g2
	or %g2, 2, %g2
	lduh [%g2], %g3
	add %fp, -340, %g2
	or %g2, 2, %g2
	lduh [%g2], %l0
	add %fp, -364, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -356, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -360, %l2
	or %l2, 2, %l2
	lduh [%fp+-356], %l3
	lduh [%fp+-348], %l4
	lduh [%fp+-340], %l5
	lduh [%fp+-364], %l6
	sth %l3, [%l2]
	add %fp, -368, %l2
	or %l2, 2, %l2
	sth %l6, [%l2]
	sth %l1, [%fp+-360]
	sth %g2, [%fp+-368]
	add %fp, -344, %g2
	or %g2, 2, %l1
	ld [%fp+-360], %o7
	ld [%fp+-368], %g4
	sth %l5, [%l1]
	add %fp, -352, %l1
	or %l1, 2, %l1
	sth %l4, [%l1]
	sth %l0, [%fp+-344]
	sth %g3, [%fp+-352]
	ld [%fp+-352], %i5
	ld [%fp+-344], %l4
	ldd [%fp+-1336], %l2
	add %l3, %o7, %l1
	add %l2, %i5, %g3
	ldd [%fp+-1344], %l2
	add %l2, %g4, %l0
	add %l3, %l4, %l5
	ldd [%fp+-1328], %l2
	xor %l5, %l2, %l6
	xor %g3, %l3, %l7
	xor %l1, %o2, %o0
	xor %l0, %o3, %o1
	ldd [%fp+-1272], %o4
	ldd [%fp+-1304], %o2
	mov	%o2, %o5
	add %i1, %o2, %g2
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1264], %i0
	mov	%i1, %l2
	or %o1, %o2, %o1
	mov	%o5, %l3
	std %l2, [%fp+-1328]
	mov	%i0, %l2
	mov	%i1, %l3
	mov	%l2, %o5
	std %o4, [%fp+-1272]
	ld [%fp+-1368], %i0
	add %i0, %o4, %i0
	add %i0, %l6, %o2
	xor %o2, %l4, %i0
	srl %i0, 8, %l4
	sll %i0, 24, %i0
	or %i0, %l4, %l4
	ld [%fp+-1280], %i0
	add %i0, %l2, %i0
	add %i0, %l7, %o3
	xor %o3, %i5, %i0
	srl %i0, 8, %i5
	sll %i0, 24, %i0
	or %i0, %i5, %o4
	ld [%fp+-1312], %i0
	add %i0, %l3, %i0
	add %i0, %o0, %o5
	xor %o5, %o7, %i0
	srl %i0, 8, %i5
	sll %i0, 24, %i0
	or %i0, %i5, %o7
	add %g2, %o1, %i5
	xor %i5, %g4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %g2
	add %l4, %l5, %i0
	st %i0, [%fp+-1280]
	xor %i0, %l6, %i1
	srl %i1, 7, %g4
	sll %i1, 25, %i1
	or %i1, %g4, %l5
	st %l5, [%fp+-1304]
	add %o4, %g3, %l2
	xor %l2, %l7, %i1
	srl %i1, 7, %g3
	sll %i1, 25, %i1
	or %i1, %g3, %l6
	add %o7, %l1, %l3
	xor %l3, %o0, %i1
	srl %i1, 7, %g3
	sll %i1, 25, %i1
	or %i1, %g3, %g4
	add %g2, %l0, %l1
	xor %l1, %o1, %g3
	srl %g3, 7, %l0
	sll %g3, 25, %g3
	or %g3, %l0, %l0
	ldd [%fp+-1256], %o0
	add %i5, %o1, %i5
	ldd [%fp+-1296], %o0
	add %o2, %o1, %g3
	add %l0, %g3, %o1
	add %g4, %i5, %o0
	ldd [%fp+-1240], %i0
	add %o3, %i1, %i5
	ldd [%fp+-1248], %i0
	add %o5, %i0, %g3
	add %l6, %g3, %o3
	add %l5, %i5, %o2
	xor %o3, %g2, %g3
	std %o2, [%fp+-1344]
	xor %o2, %o7, %g2
	st %g2, [%fp+-388]
	st %g3, [%fp+-396]
	xor %o1, %o4, %g3
	std %o0, [%fp+-1336]
	xor %o0, %l4, %g2
	st %g2, [%fp+-372]
	st %g3, [%fp+-380]
	add %fp, -388, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -396, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -372, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -380, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -384, %l5
	or %l5, 2, %l5
	lduh [%fp+-380], %l7
	lduh [%fp+-388], %o0
	lduh [%fp+-396], %o1
	lduh [%fp+-372], %o2
	sth %l7, [%l5]
	add %fp, -376, %l5
	or %l5, 2, %l5
	sth %o2, [%l5]
	sth %l4, [%fp+-384]
	sth %g3, [%fp+-376]
	ld [%fp+-384], %l5
	ld [%fp+-376], %l4
	add %fp, -400, %g3
	or %g3, 2, %g3
	sth %o1, [%g3]
	add %fp, -392, %g3
	or %g3, 2, %g3
	sth %o0, [%g3]
	sth %g2, [%fp+-400]
	sth %i5, [%fp+-392]
	ld [%fp+-400], %g3
	ld [%fp+-392], %g2
	add %l3, %l5, %o1
	std %l4, [%fp+-1376]
	add %l2, %l4, %o0
	ld [%fp+-1280], %i0
	add %i0, %g3, %l3
	std %g2, [%fp+-1408]
	add %l1, %g2, %l2
	xor %o1, %l0, %l5
	std %o0, [%fp+-1368]
	xor %o0, %g4, %l4
	ldd [%fp+-1320], %i0
	st %i0, [%fp+-404]
	ld [%fp+-404], %f0
	ldd [%fp+-1264], %i0
	st %i0, [%fp+-408]
	ldd [%fp+-1296], %i0
	mov	%i1, %i0
	xor %l3, %l6, %o5
	ldd [%fp+-1248], %l0
	std %l2, [%fp+-1360]
	ld [%fp+-1304], %i5
	xor %l2, %i5, %o4
	ldd [%fp+-1240], %g2
	mov	%g3, %i1
	std %i0, [%fp+-1304]
	ldd [%fp+-1256], %i0
	mov	%i1, %l1
	std %l0, [%fp+-1312]
	ld [%fp+-408], %f1
	sll %l4, 20, %o2
	sll %l5, 20, %o3
	sll %o4, 20, %l2
	sll %o5, 20, %l3
.LBB1_37:
	sth %i0, [%fp+-432]
	sth %i1, [%fp+-430]
	sth %l6, [%fp+-428]
	sth %l7, [%fp+-426]
	sth %l0, [%fp+-424]
	sth %l1, [%fp+-422]
	sth %o0, [%fp+-420]
	sth %o1, [%fp+-418]
	and %i4, 7, %i0
	sll %i0, 1, %i0
	add %fp, -432, %i1
	sth %i2, [%i1+%i0]
	lduh [%fp+-420], %o0
	lduh [%fp+-418], %o1
	lduh [%fp+-424], %l0
	lduh [%fp+-422], %l1
	lduh [%fp+-428], %l6
	lduh [%fp+-426], %l7
	lduh [%fp+-432], %i0
	add %i4, 1, %i4
	cmp %i4, 8
	bne	.LBB1_37
	lduh [%fp+-430], %i1
	st %f0, [%fp+-460]
	st %f0, [%fp+-464]
	st %f1, [%fp+-452]
	st %f1, [%fp+-456]
	ld [%fp+-460], %i4
	st %i4, [%fp+-1384]
	ld [%fp+-464], %i4
	st %i4, [%fp+-1392]
	ld [%fp+-452], %i4
	st %i4, [%fp+-1396]
	ld [%fp+-456], %i4
	st %i4, [%fp+-1400]
	and %o0, 64, %i4
	and %l0, 16, %i5
	srl %i5, 4, %g4
	mov	-1, %i5
	cmp %g4, 0
	mov	%g0, %g4
	bne	.LBB1_40
	mov	%i5, %g2
	mov	%g4, %g2
.LBB1_40:
	srl %i4, 6, %i4
	cmp %i4, 0
	and %i0, 1, %i4
	bne	.LBB1_42
	mov	%i5, %g3
	mov	%g4, %g3
.LBB1_42:
	cmp %i4, 0
	and %l6, 4, %o7
	bne	.LBB1_44
	mov	%i5, %i4
	mov	%g4, %i4
.LBB1_44:
	srl %o7, 2, %o7
	cmp %o7, 0
	and %l1, 32, %l1
	bne	.LBB1_46
	mov	%i5, %l0
	mov	%g4, %l0
.LBB1_46:
	srl %l1, 5, %l1
	cmp %l1, 0
	and %o1, 128, %o0
	bne	.LBB1_48
	mov	%i5, %l1
	mov	%g4, %l1
.LBB1_48:
	srl %o0, 7, %o0
	cmp %o0, 0
	and %i1, 2, %i1
	bne	.LBB1_50
	mov	%i5, %i0
	mov	%g4, %i0
.LBB1_50:
	srl %o5, 12, %o0
	srl %o4, 12, %o1
	srl %l5, 12, %o4
	srl %l4, 12, %l4
	srl %i1, 1, %i1
	cmp %i1, 0
	and %l7, 8, %l5
	bne	.LBB1_52
	mov	%i5, %i1
	mov	%g4, %i1
.LBB1_52:
	ldd [%fp+-1312], %l6
	mov	%l7, %l6
	std %l6, [%fp+-1264]
	ldd [%fp+-1304], %l6
	mov	%l7, %l6
	std %l6, [%fp+-1280]
	or %o2, %l4, %l6
	or %o3, %o4, %l7
	or %l2, %o1, %o4
	srl %l5, 3, %l4
	cmp %l4, 0
	bne	.LBB1_54
	or %l3, %o0, %o5
	mov	%g4, %i5
.LBB1_54:
	add %fp, -444, %l2
	or %l2, 2, %l2
	sth %i5, [%l2]
	add %fp, -448, %i5
	or %i5, 2, %i5
	sth %i1, [%i5]
	add %fp, -436, %i1
	or %i1, 2, %i1
	sth %i0, [%i1]
	add %fp, -440, %i0
	or %i0, 2, %i0
	sth %l1, [%i0]
	sth %l0, [%fp+-444]
	sth %i4, [%fp+-448]
	sth %g3, [%fp+-436]
	sth %g2, [%fp+-440]
	ld [%fp+-440], %i0
	ldd [%fp+-1264], %i4
	ldd [%fp+-1304], %l0
	mov	%l0, %i5
	std %i4, [%fp+-1264]
	ldd [%fp+-1280], %i4
	ldd [%fp+-1312], %l0
	mov	%l0, %i5
	std %i4, [%fp+-1280]
	ld [%fp+-436], %i1
	ld [%fp+-1400], %i4
	and %i0, %i4, %i4
	ldd [%fp+-1256], %l0
	andn %l0, %i0, %i0
	ld [%fp+-448], %i5
	andn %l0, %i1, %l0
	ld [%fp+-444], %l1
	ld [%fp+-1396], %l2
	and %i1, %l2, %i1
	ld [%fp+-1392], %l2
	and %i5, %l2, %l2
	ldd [%fp+-1248], %l4
	andn %l5, %i5, %i5
	andn %l5, %l1, %l3
	ld [%fp+-1384], %l4
	and %l1, %l4, %l1
	or %l3, %l1, %l5
	or %i5, %l2, %l4
	or %l0, %i1, %l1
	or %i0, %i4, %l0
	ldd [%fp+-1344], %i4
	add %o5, %i5, %i0
	add %o4, %i4, %i1
	ldd [%fp+-1336], %l2
	add %l7, %l3, %i4
	add %l6, %l2, %i5
	add %i5, %l4, %o0
	std %l4, [%fp+-1304]
	add %i4, %l5, %o1
	add %i1, %l0, %l2
	std %l0, [%fp+-1248]
	add %i0, %l1, %l3
	ldd [%fp+-1376], %i4
	xor %o0, %i4, %i0
	std %o0, [%fp+-1344]
	xor %o1, %i5, %i1
	ldd [%fp+-1408], %g2
	xor %l2, %g2, %i4
	xor %l3, %g3, %i5
	srl %i5, 8, %g2
	srl %i4, 8, %g3
	srl %i1, 8, %l0
	srl %i0, 8, %l1
	sll %i5, 24, %i5
	sll %i4, 24, %i4
	sll %i1, 24, %l4
	sll %i0, 24, %i0
	or %i0, %l1, %i0
	or %l4, %l0, %i1
	or %i4, %g3, %l4
	or %i5, %g2, %l5
	ldd [%fp+-1368], %i4
	add %i0, %i4, %g2
	add %i1, %i5, %g3
	ldd [%fp+-1360], %i4
	add %l4, %i4, %l0
	add %l5, %i5, %l1
	xor %g2, %l6, %i4
	std %g2, [%fp+-1256]
	xor %g3, %l7, %i5
	xor %l0, %o4, %g2
	std %l0, [%fp+-1312]
	xor %l1, %o5, %g3
	srl %g3, 7, %l6
	srl %g2, 7, %l0
	srl %i5, 7, %l1
	srl %i4, 7, %l7
	sll %g3, 25, %g3
	sll %g2, 25, %g2
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	or %i4, %l7, %o0
	or %i5, %l1, %o1
	std %o0, [%fp+-1336]
	or %g2, %l0, %l0
	or %g3, %l6, %l1
.LBB1_55:
	sth %l6, [%fp+-480]
	sth %l7, [%fp+-478]
	sth %o4, [%fp+-476]
	sth %o5, [%fp+-474]
	sth %i4, [%fp+-472]
	sth %i5, [%fp+-470]
	sth %o0, [%fp+-468]
	sth %o1, [%fp+-466]
	and %g4, 7, %i4
	sll %i4, 1, %i4
	add %fp, -480, %i5
	sth %i3, [%i5+%i4]
	lduh [%fp+-468], %o0
	lduh [%fp+-466], %o1
	lduh [%fp+-472], %i4
	lduh [%fp+-470], %i5
	lduh [%fp+-476], %o4
	lduh [%fp+-474], %o5
	lduh [%fp+-480], %l6
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_55
	lduh [%fp+-478], %l7
	and %i4, 16, %g2
	and %l6, 1, %g4
	mov	-1, %g3
	cmp %g4, 0
	mov	%g0, %g4
	bne	.LBB1_58
	mov	%g3, %o7
	mov	%g4, %o7
.LBB1_58:
	srl %g2, 4, %g2
	cmp %g2, 0
	and %o0, 64, %o2
	bne	.LBB1_60
	mov	%g3, %g2
	mov	%g4, %g2
.LBB1_60:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %o4, 4, %o3
	bne	.LBB1_62
	mov	%g3, %o2
	mov	%g4, %o2
.LBB1_62:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %l7, 2, %l7
	bne	.LBB1_64
	mov	%g3, %l6
	mov	%g4, %l6
.LBB1_64:
	srl %l7, 1, %l7
	cmp %l7, 0
	and %i5, 32, %i5
	bne	.LBB1_66
	mov	%g3, %i4
	mov	%g4, %i4
.LBB1_66:
	srl %i5, 5, %i5
	cmp %i5, 0
	and %o1, 128, %l7
	bne	.LBB1_68
	mov	%g3, %i5
	mov	%g4, %i5
.LBB1_68:
	srl %l7, 7, %l7
	cmp %l7, 0
	and %o5, 8, %o0
	bne	.LBB1_70
	mov	%g3, %l7
	mov	%g4, %l7
.LBB1_70:
	st %i3, [%fp+-1400]
	srl %o0, 3, %o0
	cmp %o0, 0
	bne	.LBB1_72
	st %i2, [%fp+-1396]
	mov	%g4, %g3
.LBB1_72:
	add %fp, -492, %o0
	or %o0, 2, %o0
	sth %g3, [%o0]
	add %fp, -484, %g3
	or %g3, 2, %g3
	sth %l7, [%g3]
	add %fp, -488, %g3
	or %g3, 2, %g3
	sth %i5, [%g3]
	add %fp, -496, %i5
	or %i5, 2, %i5
	sth %i4, [%i5]
	sth %l6, [%fp+-492]
	sth %o2, [%fp+-484]
	sth %g2, [%fp+-488]
	sth %o7, [%fp+-496]
	ld [%fp+-488], %i4
	ld [%fp+-484], %i5
	ldd [%fp+-1320], %l6
	and %i4, %l6, %g2
	and %i5, %l7, %g3
	ld [%fp+-492], %l6
	ldd [%fp+-1296], %o0
	andn %o0, %i4, %i4
	andn %o1, %i5, %i5
	ld [%fp+-496], %l7
	ldd [%fp+-1288], %o4
	and %l6, %o5, %o0
	ldd [%fp+-1328], %o2
	andn %o3, %l6, %l6
	or %l6, %o0, %i3
	or %i5, %g3, %i2
	andn %o2, %l7, %i5
	and %l7, %o4, %g3
	or %i4, %g2, %l7
	or %i5, %g3, %l6
	ldd [%fp+-1344], %g2
	add %l0, %g3, %i4
	std %i2, [%fp+-1320]
	add %i4, %i2, %o7
	add %l1, %l2, %i4
	add %i4, %i3, %o5
	xor %o5, %i1, %i5
	xor %o7, %i0, %i4
	ldd [%fp+-1336], %i2
	add %i2, %l3, %i0
	add %i3, %g2, %i1
	add %i1, %l7, %i1
	std %l6, [%fp+-1296]
	add %i0, %l6, %i0
	st %i5, [%fp+-508]
	st %i4, [%fp+-500]
	xor %i0, %l4, %i4
	xor %i1, %l5, %i5
	st %i5, [%fp+-524]
	st %i4, [%fp+-516]
	add %fp, -508, %i4
	or %i4, 2, %i4
	lduh [%i4], %i5
	add %fp, -500, %i4
	or %i4, 2, %i4
	lduh [%i4], %g3
	add %fp, -524, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -516, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -520, %l2
	or %l2, 2, %l2
	lduh [%fp+-516], %l3
	lduh [%fp+-508], %l4
	lduh [%fp+-500], %l5
	lduh [%fp+-524], %l6
	sth %l3, [%l2]
	add %fp, -528, %l2
	or %l2, 2, %l2
	sth %l6, [%l2]
	sth %g2, [%fp+-520]
	sth %i4, [%fp+-528]
	add %fp, -504, %i4
	or %i4, 2, %l2
	ld [%fp+-520], %g2
	ld [%fp+-528], %i4
	sth %l5, [%l2]
	add %fp, -512, %l2
	or %l2, 2, %l2
	sth %l4, [%l2]
	sth %g3, [%fp+-504]
	sth %i5, [%fp+-512]
	ld [%fp+-512], %g3
	ld [%fp+-504], %l4
	ldd [%fp+-1256], %l6
	add %l7, %g2, %l3
	add %l6, %g3, %i5
	ldd [%fp+-1312], %l6
	add %l6, %i4, %l2
	add %l7, %l4, %l5
	xor %l5, %l0, %l6
	xor %i5, %l1, %l0
	xor %l3, %i2, %l1
	xor %l2, %i3, %l7
	ldd [%fp+-1240], %o0
	ldd [%fp+-1272], %o2
	mov	%o2, %o1
	add %i1, %o2, %i1
	srl %l7, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l0, 12, %o3
	sll %l0, 20, %l0
	or %l0, %o3, %o3
	srl %l1, 12, %l0
	sll %l7, 20, %l7
	sll %l1, 20, %l1
	or %l1, %l0, %o4
	ldd [%fp+-1288], %i2
	mov	%i3, %l0
	or %l7, %o2, %l7
	mov	%o1, %l1
	std %l0, [%fp+-1328]
	mov	%i2, %o1
	std %o0, [%fp+-1240]
	add %o7, %o0, %l0
	add %l0, %l6, %o1
	xor %o1, %l4, %l0
	srl %l0, 8, %l1
	sll %l0, 24, %l0
	or %l0, %l1, %l4
	add %o5, %i2, %l0
	add %l0, %o3, %o0
	xor %o0, %g3, %g3
	srl %g3, 8, %l0
	sll %g3, 24, %g3
	or %g3, %l0, %o2
	add %i0, %i3, %i0
	add %i0, %o4, %o5
	xor %o5, %g2, %i0
	srl %i0, 8, %g2
	sll %i0, 24, %i0
	or %i0, %g2, %o7
	add %i1, %l7, %i0
	xor %i0, %i4, %i1
	srl %i1, 8, %i4
	sll %i1, 24, %i1
	or %i1, %i4, %i4
	add %l4, %l5, %l5
	xor %l5, %l6, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %l6
	add %o2, %i5, %l0
	xor %l0, %o3, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %i5
	add %o7, %l3, %l1
	xor %l1, %o4, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %i1
	add %i4, %l2, %o4
	xor %o4, %l7, %g2
	srl %g2, 7, %l2
	sll %g2, 25, %g2
	or %g2, %l2, %o3
	ldd [%fp+-1264], %g2
	add %i0, %g3, %i0
	ldd [%fp+-1304], %i2
	add %o1, %i3, %l2
	add %o3, %l2, %g3
	add %i1, %i0, %g2
	ldd [%fp+-1248], %l2
	add %o0, %l3, %i0
	ldd [%fp+-1280], %i2
	add %o5, %i2, %l2
	add %i5, %l2, %o1
	add %l6, %i0, %o0
	xor %o1, %i4, %l3
	std %o0, [%fp+-1344]
	xor %o0, %o7, %l2
	st %l2, [%fp+-548]
	st %l3, [%fp+-556]
	xor %g3, %o2, %l3
	std %g2, [%fp+-1336]
	xor %g2, %l4, %l2
	st %l2, [%fp+-532]
	st %l3, [%fp+-540]
	add %fp, -548, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	add %fp, -556, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -532, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -540, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -544, %l4
	or %l4, 2, %l4
	lduh [%fp+-540], %l7
	lduh [%fp+-548], %o0
	lduh [%fp+-556], %o1
	lduh [%fp+-532], %o2
	sth %l7, [%l4]
	add %fp, -536, %l4
	or %l4, 2, %l4
	sth %o2, [%l4]
	sth %l3, [%fp+-544]
	sth %l2, [%fp+-536]
	ld [%fp+-544], %g3
	ld [%fp+-536], %g2
	add %fp, -560, %l2
	or %l2, 2, %l2
	sth %o1, [%l2]
	add %fp, -552, %l2
	or %l2, 2, %l2
	sth %o0, [%l2]
	sth %i4, [%fp+-560]
	sth %i0, [%fp+-552]
	ld [%fp+-560], %o1
	ld [%fp+-552], %o0
	add %l1, %g3, %l3
	std %g2, [%fp+-1376]
	add %l0, %g2, %l2
	add %l5, %o1, %g3
	std %o0, [%fp+-1424]
	add %o4, %o0, %g2
	xor %l3, %o3, %l5
	std %l2, [%fp+-1368]
	xor %l2, %i1, %l4
	ldd [%fp+-1320], %i0
	st %i0, [%fp+-564]
	ld [%fp+-564], %f0
	ldd [%fp+-1288], %i0
	st %i0, [%fp+-568]
	ldd [%fp+-1304], %i0
	mov	%i1, %i0
	xor %g3, %i5, %o3
	std %g2, [%fp+-1360]
	xor %g2, %l6, %o2
	ldd [%fp+-1248], %i4
	mov	%i5, %i1
	std %i0, [%fp+-1256]
	ldd [%fp+-1264], %i0
	mov	%i1, %i3
	std %i2, [%fp+-1312]
	ld [%fp+-568], %f1
	sll %l4, 20, %i4
	sll %l5, 20, %i5
	sll %o2, 20, %o4
	sll %o3, 20, %o5
	ld [%fp+-1396], %i2
.LBB1_73:
	sth %l6, [%fp+-584]
	sth %l7, [%fp+-582]
	sth %g2, [%fp+-580]
	sth %g3, [%fp+-578]
	sth %i0, [%fp+-576]
	sth %i1, [%fp+-574]
	sth %l0, [%fp+-572]
	sth %l1, [%fp+-570]
	and %g4, 7, %i0
	sll %i0, 1, %i0
	add %fp, -584, %i1
	sth %i2, [%i1+%i0]
	lduh [%fp+-572], %l0
	lduh [%fp+-570], %l1
	lduh [%fp+-576], %i0
	lduh [%fp+-574], %i1
	lduh [%fp+-580], %g2
	lduh [%fp+-578], %g3
	lduh [%fp+-584], %l6
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_73
	lduh [%fp+-582], %l7
	st %f0, [%fp+-612]
	st %f0, [%fp+-616]
	st %f1, [%fp+-604]
	st %f1, [%fp+-608]
	ld [%fp+-612], %i3
	st %i3, [%fp+-1384]
	ld [%fp+-616], %i3
	st %i3, [%fp+-1392]
	ld [%fp+-604], %i3
	st %i3, [%fp+-1408]
	ld [%fp+-608], %i3
	st %i3, [%fp+-1412]
	and %l0, 64, %l2
	and %i0, 16, %g4
	srl %g4, 4, %g4
	mov	-1, %o7
	cmp %g4, 0
	mov	%g0, %g4
	mov	%o7, %l3
	bne	.LBB1_76
	ld [%fp+-1400], %i3
	mov	%g4, %l3
.LBB1_76:
	srl %l2, 6, %l2
	cmp %l2, 0
	and %l6, 1, %l2
	bne	.LBB1_78
	mov	%o7, %o0
	mov	%g4, %o0
.LBB1_78:
	st %o0, [%fp+-1428]
	cmp %l2, 0
	and %g2, 4, %l2
	bne	.LBB1_80
	mov	%o7, %o1
	mov	%g4, %o1
.LBB1_80:
	srl %l2, 2, %l2
	cmp %l2, 0
	and %i1, 32, %i1
	bne	.LBB1_82
	mov	%o7, %i0
	mov	%g4, %i0
.LBB1_82:
	srl %i1, 5, %i1
	cmp %i1, 0
	and %l1, 128, %l0
	bne	.LBB1_84
	mov	%o7, %i1
	mov	%g4, %i1
.LBB1_84:
	srl %l0, 7, %l0
	cmp %l0, 0
	and %l7, 2, %l1
	bne	.LBB1_86
	mov	%o7, %l0
	mov	%g4, %l0
.LBB1_86:
	mov	%l3, %o0
	srl %o3, 12, %l6
	srl %o2, 12, %l7
	srl %l5, 12, %o2
	srl %l4, 12, %l4
	srl %l1, 1, %l1
	cmp %l1, 0
	and %g3, 8, %g3
	bne	.LBB1_88
	mov	%o7, %l1
	mov	%g4, %l1
.LBB1_88:
	ldd [%fp+-1312], %l2
	mov	%l3, %l2
	std %l2, [%fp+-1272]
	ldd [%fp+-1256], %l2
	mov	%l3, %l2
	std %l2, [%fp+-1288]
	or %i4, %l4, %g2
	or %i5, %o2, %i4
	or %o4, %l7, %i5
	srl %g3, 3, %g3
	cmp %g3, 0
	bne	.LBB1_90
	or %o5, %l6, %g3
	mov	%g4, %o7
.LBB1_90:
	add %fp, -596, %l2
	or %l2, 2, %l2
	sth %o7, [%l2]
	add %fp, -600, %l2
	or %l2, 2, %l2
	sth %l1, [%l2]
	add %fp, -588, %l1
	or %l1, 2, %l1
	sth %l0, [%l1]
	add %fp, -592, %l0
	or %l0, 2, %l0
	sth %i1, [%l0]
	sth %i0, [%fp+-596]
	sth %o1, [%fp+-600]
	ld [%fp+-1428], %i0
	sth %i0, [%fp+-588]
	sth %o0, [%fp+-592]
	ld [%fp+-592], %i0
	ldd [%fp+-1272], %l0
	ldd [%fp+-1256], %l2
	mov	%l2, %l1
	std %l0, [%fp+-1272]
	ldd [%fp+-1288], %l0
	ldd [%fp+-1312], %l2
	mov	%l2, %l1
	std %l0, [%fp+-1288]
	ld [%fp+-588], %i1
	ld [%fp+-1412], %l0
	and %i0, %l0, %l0
	ldd [%fp+-1264], %l2
	andn %l2, %i0, %i0
	ld [%fp+-600], %l1
	andn %l2, %i1, %l2
	ld [%fp+-596], %l3
	ld [%fp+-1408], %l4
	and %i1, %l4, %i1
	ld [%fp+-1392], %l4
	and %l1, %l4, %l4
	ldd [%fp+-1280], %l6
	andn %l7, %l1, %l1
	andn %l7, %l3, %l5
	ld [%fp+-1384], %l6
	and %l3, %l6, %l3
	or %l5, %l3, %l7
	or %l1, %l4, %l6
	or %l2, %i1, %l5
	or %i0, %l0, %l4
	ldd [%fp+-1344], %l0
	add %g3, %l1, %i0
	add %i5, %l0, %i1
	ldd [%fp+-1336], %l2
	add %i4, %l3, %l0
	add %g2, %l2, %l1
	add %l1, %l6, %o2
	std %l6, [%fp+-1312]
	add %l0, %l7, %o3
	add %i1, %l4, %l2
	std %l4, [%fp+-1256]
	add %i0, %l5, %l3
	ldd [%fp+-1376], %l0
	xor %o2, %l0, %i0
	std %o2, [%fp+-1384]
	xor %o3, %l1, %i1
	ldd [%fp+-1424], %l4
	xor %l2, %l4, %l0
	xor %l3, %l5, %l1
	srl %l1, 8, %l6
	srl %l0, 8, %l4
	srl %i1, 8, %l5
	srl %i0, 8, %l7
	sll %l1, 24, %l1
	sll %l0, 24, %l0
	sll %i1, 24, %o0
	sll %i0, 24, %i0
	or %i0, %l7, %i0
	or %o0, %l5, %i1
	or %l0, %l4, %l4
	or %l1, %l6, %l5
	ldd [%fp+-1368], %l0
	add %i0, %l0, %l6
	add %i1, %l1, %l7
	ldd [%fp+-1360], %l0
	add %l4, %l0, %o0
	add %l5, %l1, %o1
	xor %l6, %g2, %g2
	std %l6, [%fp+-1264]
	xor %l7, %i4, %i4
	xor %o0, %i5, %i5
	std %o0, [%fp+-1336]
	xor %o1, %g3, %g3
	srl %g3, 7, %l0
	srl %i5, 7, %l1
	srl %i4, 7, %l6
	srl %g2, 7, %l7
	sll %g3, 25, %g3
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	sll %g2, 25, %g2
	or %g2, %l7, %o0
	or %i4, %l6, %o1
	std %o0, [%fp+-1344]
	or %i5, %l1, %o0
	or %g3, %l0, %o1
.LBB1_91:
	sth %g2, [%fp+-632]
	sth %g3, [%fp+-630]
	sth %l6, [%fp+-628]
	sth %l7, [%fp+-626]
	sth %l0, [%fp+-624]
	sth %l1, [%fp+-622]
	sth %o4, [%fp+-620]
	sth %o5, [%fp+-618]
	and %g4, 7, %i4
	sll %i4, 1, %i4
	add %fp, -632, %i5
	sth %i3, [%i5+%i4]
	lduh [%fp+-620], %o4
	lduh [%fp+-618], %o5
	lduh [%fp+-624], %l0
	lduh [%fp+-622], %l1
	lduh [%fp+-628], %l6
	lduh [%fp+-626], %l7
	lduh [%fp+-632], %g2
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_91
	lduh [%fp+-630], %g3
	and %l0, 16, %g4
	and %g2, 1, %i4
	mov	-1, %o7
	cmp %i4, 0
	mov	%g0, %i4
	bne	.LBB1_94
	mov	%o7, %i5
	mov	%i4, %i5
.LBB1_94:
	srl %g4, 4, %g4
	cmp %g4, 0
	and %o4, 64, %o2
	bne	.LBB1_96
	mov	%o7, %g4
	mov	%i4, %g4
.LBB1_96:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %l6, 4, %o3
	bne	.LBB1_98
	mov	%o7, %o2
	mov	%i4, %o2
.LBB1_98:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %g3, 2, %g3
	bne	.LBB1_100
	mov	%o7, %g2
	mov	%i4, %g2
.LBB1_100:
	srl %g3, 1, %g3
	cmp %g3, 0
	and %l1, 32, %l0
	bne	.LBB1_102
	mov	%o7, %g3
	mov	%i4, %g3
.LBB1_102:
	srl %l0, 5, %l0
	cmp %l0, 0
	and %o5, 128, %l1
	bne	.LBB1_104
	mov	%o7, %l0
	mov	%i4, %l0
.LBB1_104:
	srl %l1, 7, %l1
	cmp %l1, 0
	and %l7, 8, %l6
	bne	.LBB1_106
	mov	%o7, %l1
	mov	%i4, %l1
.LBB1_106:
	srl %l6, 3, %l6
	cmp %l6, 0
	bne	.LBB1_108
	nop
	mov	%i4, %o7
.LBB1_108:
	add %fp, -644, %l6
	or %l6, 2, %l6
	sth %o7, [%l6]
	add %fp, -636, %l6
	or %l6, 2, %l6
	sth %l1, [%l6]
	add %fp, -640, %l1
	or %l1, 2, %l1
	sth %l0, [%l1]
	add %fp, -648, %l0
	or %l0, 2, %l0
	sth %g3, [%l0]
	sth %g2, [%fp+-644]
	sth %o2, [%fp+-636]
	sth %g4, [%fp+-640]
	sth %i5, [%fp+-648]
	ld [%fp+-640], %i5
	ld [%fp+-636], %g2
	ldd [%fp+-1320], %l0
	and %i5, %l0, %g3
	and %g2, %l1, %g4
	ld [%fp+-644], %l0
	ldd [%fp+-1304], %l6
	andn %l6, %i5, %i5
	andn %l7, %g2, %g2
	ld [%fp+-648], %l1
	ldd [%fp+-1296], %o4
	and %l0, %o5, %l6
	ldd [%fp+-1328], %o2
	andn %o3, %l0, %l0
	or %l0, %l6, %l7
	or %g2, %g4, %l6
	andn %o2, %l1, %g2
	and %l1, %o4, %g4
	or %i5, %g3, %l1
	or %g2, %g4, %l0
	ldd [%fp+-1384], %o4
	add %o0, %o5, %i5
	std %l6, [%fp+-1320]
	add %i5, %l6, %g4
	add %o1, %l2, %i5
	add %i5, %l7, %i5
	st %i5, [%fp+-1304]
	xor %i5, %i1, %g3
	xor %g4, %i0, %g2
	ldd [%fp+-1344], %o2
	add %o2, %l3, %i0
	add %o3, %o4, %i1
	add %i1, %l1, %i1
	std %l0, [%fp+-1280]
	add %i0, %l0, %i0
	st %i0, [%fp+-1360]
	st %g3, [%fp+-660]
	st %g2, [%fp+-652]
	xor %i0, %l4, %g2
	xor %i1, %l5, %g3
	st %g3, [%fp+-676]
	st %g2, [%fp+-668]
	add %fp, -660, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -652, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -676, %l0
	or %l0, 2, %l0
	lduh [%l0], %l0
	add %fp, -668, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -672, %l2
	or %l2, 2, %l2
	lduh [%fp+-668], %l3
	lduh [%fp+-660], %l5
	lduh [%fp+-652], %l6
	lduh [%fp+-676], %l4
	sth %l3, [%l2]
	add %fp, -680, %l2
	or %l2, 2, %l2
	sth %l4, [%l2]
	sth %l1, [%fp+-672]
	sth %l0, [%fp+-680]
	add %fp, -656, %l0
	or %l0, 2, %l0
	ld [%fp+-672], %l4
	ld [%fp+-680], %l2
	sth %l6, [%l0]
	add %fp, -664, %l0
	or %l0, 2, %l0
	sth %l5, [%l0]
	sth %g3, [%fp+-656]
	sth %g2, [%fp+-664]
	ld [%fp+-664], %o7
	ld [%fp+-656], %i5
	ldd [%fp+-1264], %g2
	add %g3, %l4, %l1
	add %g2, %o7, %l3
	ldd [%fp+-1336], %g2
	add %g2, %l2, %i0
	st %i0, [%fp+-1264]
	add %g3, %i5, %l5
	xor %l5, %o0, %l6
	xor %l3, %o1, %l7
	xor %l1, %o2, %o0
	xor %i0, %o3, %o1
	ldd [%fp+-1240], %o2
	ldd [%fp+-1248], %o4
	mov	%o2, %o5
	add %i1, %o2, %l0
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1296], %i0
	mov	%i1, %g2
	or %o1, %o2, %o1
	mov	%o5, %g3
	std %g2, [%fp+-1328]
	mov	%i0, %o5
	std %o4, [%fp+-1248]
	add %g4, %o4, %g4
	add %g4, %l6, %o2
	xor %o2, %i5, %g3
	srl %g3, 8, %g4
	sll %g3, 24, %g3
	or %g3, %g4, %g3
	ld [%fp+-1304], %i5
	add %i5, %i0, %i5
	add %i5, %l7, %o3
	xor %o3, %o7, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %g2
	ld [%fp+-1360], %i5
	add %i5, %i1, %i0
	add %i0, %o0, %o4
	xor %o4, %l4, %i0
	srl %i0, 8, %i5
	sll %i0, 24, %i0
	or %i0, %i5, %l4
	add %l0, %o1, %o5
	xor %o5, %l2, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o7
	add %g3, %l5, %i0
	xor %i0, %l6, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %i5
	add %g2, %l3, %l2
	xor %l2, %l7, %i1
	srl %i1, 7, %g4
	sll %i1, 25, %i1
	or %i1, %g4, %g4
	add %l4, %l1, %l3
	xor %l3, %o0, %i1
	srl %i1, 7, %l1
	sll %i1, 25, %i1
	or %i1, %l1, %i1
	ld [%fp+-1264], %l0
	add %o7, %l0, %l1
	xor %l1, %o1, %l0
	srl %l0, 7, %l5
	sll %l0, 25, %l0
	or %l0, %l5, %l0
	ldd [%fp+-1272], %l6
	add %o5, %l7, %l5
	ldd [%fp+-1312], %l6
	add %o2, %l7, %l6
	add %l0, %l6, %o1
	add %i1, %l5, %o0
	ldd [%fp+-1256], %l6
	add %o3, %l7, %l5
	ldd [%fp+-1288], %o2
	add %o4, %o2, %l6
	mov	%o2, %o4
	mov	%o3, %o5
	add %g4, %l6, %o3
	add %i5, %l5, %o2
	xor %o3, %o7, %l7
	std %o2, [%fp+-1344]
	xor %o2, %l4, %l6
	st %l6, [%fp+-700]
	st %l7, [%fp+-708]
	xor %o1, %g2, %l5
	std %o0, [%fp+-1336]
	xor %o0, %g3, %l4
	st %l4, [%fp+-684]
	st %l5, [%fp+-692]
	add %fp, -700, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -708, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -684, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -692, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -696, %l6
	or %l6, 2, %l6
	lduh [%fp+-692], %l7
	lduh [%fp+-700], %o0
	lduh [%fp+-708], %o1
	lduh [%fp+-684], %o2
	sth %l7, [%l6]
	add %fp, -688, %l6
	or %l6, 2, %l6
	sth %o2, [%l6]
	sth %l5, [%fp+-696]
	sth %l4, [%fp+-688]
	ld [%fp+-696], %o3
	ld [%fp+-688], %o2
	add %fp, -712, %l4
	or %l4, 2, %l4
	sth %o1, [%l4]
	add %fp, -704, %l4
	or %l4, 2, %l4
	sth %o0, [%l4]
	sth %g3, [%fp+-712]
	sth %g2, [%fp+-704]
	ld [%fp+-712], %g3
	ld [%fp+-704], %g2
	add %l3, %o3, %l7
	std %o2, [%fp+-1376]
	add %l2, %o2, %l6
	add %i0, %g3, %l3
	std %g2, [%fp+-1424]
	add %l1, %g2, %l2
	xor %l7, %l0, %l5
	std %l6, [%fp+-1368]
	xor %l6, %i1, %l4
	ldd [%fp+-1320], %i0
	st %i0, [%fp+-716]
	ld [%fp+-716], %f0
	ldd [%fp+-1296], %i0
	st %i0, [%fp+-720]
	ldd [%fp+-1312], %i0
	mov	%i1, %i0
	xor %l3, %g4, %l1
	mov	%o4, %l6
	mov	%o5, %l7
	std %l2, [%fp+-1360]
	xor %l2, %i5, %l0
	ldd [%fp+-1256], %g2
	mov	%g3, %i1
	std %i0, [%fp+-1240]
	ldd [%fp+-1272], %i0
	mov	%i1, %l7
	std %l6, [%fp+-1296]
	ld [%fp+-720], %f1
	sll %l4, 20, %o4
	sll %l5, 20, %o5
	sll %l0, 20, %o2
	sll %l1, 20, %o3
.LBB1_109:
	sth %i0, [%fp+-736]
	sth %i1, [%fp+-734]
	sth %l6, [%fp+-732]
	sth %l7, [%fp+-730]
	sth %l2, [%fp+-728]
	sth %l3, [%fp+-726]
	sth %o0, [%fp+-724]
	sth %o1, [%fp+-722]
	and %i4, 7, %i0
	sll %i0, 1, %i0
	add %fp, -736, %i1
	sth %i2, [%i1+%i0]
	lduh [%fp+-724], %o0
	lduh [%fp+-722], %o1
	lduh [%fp+-728], %l2
	lduh [%fp+-726], %l3
	lduh [%fp+-732], %l6
	lduh [%fp+-730], %l7
	lduh [%fp+-736], %i0
	add %i4, 1, %i4
	cmp %i4, 8
	bne	.LBB1_109
	lduh [%fp+-734], %i1
	st %f0, [%fp+-764]
	st %f0, [%fp+-768]
	st %f1, [%fp+-756]
	st %f1, [%fp+-760]
	ld [%fp+-764], %i4
	st %i4, [%fp+-1384]
	ld [%fp+-768], %i4
	st %i4, [%fp+-1392]
	ld [%fp+-756], %i4
	st %i4, [%fp+-1408]
	ld [%fp+-760], %i4
	st %i4, [%fp+-1412]
	and %o0, 64, %i5
	and %l2, 16, %i4
	srl %i4, 4, %i4
	mov	-1, %g4
	cmp %i4, 0
	mov	%g0, %i4
	bne	.LBB1_112
	mov	%g4, %g2
	mov	%i4, %g2
.LBB1_112:
	srl %i5, 6, %i5
	cmp %i5, 0
	and %i0, 1, %i5
	bne	.LBB1_114
	mov	%g4, %g3
	mov	%i4, %g3
.LBB1_114:
	cmp %i5, 0
	and %l6, 4, %o7
	bne	.LBB1_116
	mov	%g4, %i5
	mov	%i4, %i5
.LBB1_116:
	srl %o7, 2, %o7
	cmp %o7, 0
	and %l3, 32, %l3
	bne	.LBB1_118
	mov	%g4, %l2
	mov	%i4, %l2
.LBB1_118:
	srl %l3, 5, %l3
	cmp %l3, 0
	and %o1, 128, %o0
	bne	.LBB1_120
	mov	%g4, %l3
	mov	%i4, %l3
.LBB1_120:
	srl %o0, 7, %o0
	cmp %o0, 0
	and %i1, 2, %i1
	bne	.LBB1_122
	mov	%g4, %i0
	mov	%i4, %i0
.LBB1_122:
	srl %l1, 12, %o0
	srl %l0, 12, %o1
	srl %l5, 12, %l1
	srl %l4, 12, %l0
	srl %i1, 1, %i1
	cmp %i1, 0
	and %l7, 8, %l4
	bne	.LBB1_124
	mov	%g4, %i1
	mov	%i4, %i1
.LBB1_124:
	ldd [%fp+-1296], %l6
	mov	%l7, %l6
	std %l6, [%fp+-1264]
	ldd [%fp+-1240], %l6
	mov	%l7, %l6
	or %o4, %l0, %l0
	or %o5, %l1, %l1
	or %o2, %o1, %o4
	srl %l4, 3, %l4
	cmp %l4, 0
	bne	.LBB1_126
	or %o3, %o0, %o5
	mov	%i4, %g4
.LBB1_126:
	add %fp, -748, %l4
	or %l4, 2, %l4
	sth %g4, [%l4]
	add %fp, -752, %g4
	or %g4, 2, %g4
	sth %i1, [%g4]
	add %fp, -740, %i1
	or %i1, 2, %i1
	sth %i0, [%i1]
	add %fp, -744, %i0
	or %i0, 2, %i0
	sth %l3, [%i0]
	sth %l2, [%fp+-748]
	sth %i5, [%fp+-752]
	sth %g3, [%fp+-740]
	sth %g2, [%fp+-744]
	ld [%fp+-744], %i0
	ldd [%fp+-1264], %l2
	ldd [%fp+-1240], %l4
	mov	%l4, %l3
	std %l2, [%fp+-1264]
	ldd [%fp+-1296], %l2
	mov	%l2, %l7
	std %l6, [%fp+-1304]
	ld [%fp+-740], %i1
	ld [%fp+-1412], %i5
	and %i0, %i5, %i5
	ldd [%fp+-1272], %l2
	andn %l2, %i0, %i0
	ld [%fp+-752], %g4
	andn %l2, %i1, %l2
	ld [%fp+-748], %l3
	ld [%fp+-1408], %l4
	and %i1, %l4, %i1
	ld [%fp+-1392], %l4
	and %g4, %l4, %l4
	ldd [%fp+-1288], %l6
	andn %l7, %g4, %g4
	andn %l7, %l3, %l5
	ld [%fp+-1384], %l6
	and %l3, %l6, %l3
	or %l5, %l3, %l7
	or %g4, %l4, %l6
	or %l2, %i1, %l3
	or %i0, %i5, %l2
	ldd [%fp+-1344], %l4
	add %o5, %l5, %i0
	add %o4, %l4, %i1
	ldd [%fp+-1336], %l4
	add %l1, %l5, %i5
	add %l0, %l4, %g4
	add %g4, %l6, %o0
	std %l6, [%fp+-1296]
	add %i5, %l7, %o1
	add %i1, %l2, %l4
	std %l2, [%fp+-1240]
	add %i0, %l3, %l5
	ldd [%fp+-1376], %l2
	xor %o0, %l2, %i0
	std %o0, [%fp+-1384]
	xor %o1, %l3, %i1
	ldd [%fp+-1424], %g2
	xor %l4, %g2, %i5
	xor %l5, %g3, %g2
	srl %g2, 8, %g4
	srl %i5, 8, %g3
	srl %i1, 8, %l2
	srl %i0, 8, %l3
	sll %g2, 24, %l6
	sll %i5, 24, %i5
	sll %i1, 24, %g2
	sll %i0, 24, %i0
	or %i0, %l3, %i0
	or %g2, %l2, %i1
	or %i5, %g3, %g2
	or %l6, %g4, %g3
	ldd [%fp+-1368], %l2
	add %i0, %l2, %l6
	add %i1, %l3, %l7
	ldd [%fp+-1360], %l2
	add %g2, %l2, %o0
	add %g3, %l3, %o1
	xor %l6, %l0, %i5
	std %l6, [%fp+-1272]
	xor %l7, %l1, %g4
	xor %o0, %o4, %l0
	std %o0, [%fp+-1336]
	xor %o1, %o5, %l1
	srl %l1, 7, %l2
	srl %l0, 7, %l3
	srl %g4, 7, %l6
	srl %i5, 7, %l7
	sll %l1, 25, %l1
	sll %l0, 25, %l0
	sll %g4, 25, %g4
	sll %i5, 25, %i5
	or %i5, %l7, %o0
	or %g4, %l6, %o1
	std %o0, [%fp+-1344]
	or %l0, %l3, %o4
	or %l1, %l2, %o5
.LBB1_127:
	sth %l0, [%fp+-784]
	sth %l1, [%fp+-782]
	sth %o0, [%fp+-780]
	sth %o1, [%fp+-778]
	sth %l6, [%fp+-776]
	sth %l7, [%fp+-774]
	sth %l2, [%fp+-772]
	sth %l3, [%fp+-770]
	and %i4, 7, %i5
	sll %i5, 1, %i5
	add %fp, -784, %g4
	sth %i3, [%g4+%i5]
	lduh [%fp+-772], %l2
	lduh [%fp+-770], %l3
	lduh [%fp+-776], %l6
	lduh [%fp+-774], %l7
	lduh [%fp+-780], %o0
	lduh [%fp+-778], %o1
	lduh [%fp+-784], %l0
	add %i4, 1, %i4
	cmp %i4, 8
	bne	.LBB1_127
	lduh [%fp+-782], %l1
	and %l6, 16, %i5
	and %l0, 1, %i4
	mov	-1, %o7
	cmp %i4, 0
	mov	%g0, %g4
	bne	.LBB1_130
	mov	%o7, %i4
	mov	%g4, %i4
.LBB1_130:
	srl %i5, 4, %i5
	cmp %i5, 0
	and %l2, 64, %o2
	bne	.LBB1_132
	mov	%o7, %i5
	mov	%g4, %i5
.LBB1_132:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %o0, 4, %o3
	bne	.LBB1_134
	mov	%o7, %o2
	mov	%g4, %o2
.LBB1_134:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %l1, 2, %l1
	bne	.LBB1_136
	mov	%o7, %l0
	mov	%g4, %l0
.LBB1_136:
	srl %l1, 1, %l1
	cmp %l1, 0
	and %l7, 32, %l6
	bne	.LBB1_138
	mov	%o7, %l1
	mov	%g4, %l1
.LBB1_138:
	srl %l6, 5, %l6
	cmp %l6, 0
	and %l3, 128, %l3
	bne	.LBB1_140
	mov	%o7, %l2
	mov	%g4, %l2
.LBB1_140:
	srl %l3, 7, %l3
	cmp %l3, 0
	and %o1, 8, %l6
	bne	.LBB1_142
	mov	%o7, %l3
	mov	%g4, %l3
.LBB1_142:
	srl %l6, 3, %l6
	cmp %l6, 0
	bne	.LBB1_144
	nop
	mov	%g4, %o7
.LBB1_144:
	add %fp, -796, %l6
	or %l6, 2, %l6
	sth %o7, [%l6]
	add %fp, -788, %l6
	or %l6, 2, %l6
	sth %l3, [%l6]
	add %fp, -792, %l3
	or %l3, 2, %l3
	sth %l2, [%l3]
	add %fp, -800, %l2
	or %l2, 2, %l2
	sth %l1, [%l2]
	sth %l0, [%fp+-796]
	sth %o2, [%fp+-788]
	sth %i5, [%fp+-792]
	sth %i4, [%fp+-800]
	ld [%fp+-792], %i4
	ld [%fp+-788], %i5
	ldd [%fp+-1320], %l2
	and %i4, %l2, %l0
	and %i5, %l3, %l1
	ld [%fp+-796], %l2
	ldd [%fp+-1312], %l6
	andn %l6, %i4, %i4
	andn %l7, %i5, %i5
	ld [%fp+-800], %l3
	ldd [%fp+-1280], %o2
	and %l2, %o3, %l6
	ldd [%fp+-1328], %o0
	andn %o1, %l2, %l2
	or %l2, %l6, %l7
	or %i5, %l1, %l6
	andn %o0, %l3, %i5
	and %l3, %o2, %l1
	or %i4, %l0, %l3
	or %i5, %l1, %l2
	ldd [%fp+-1384], %o0
	add %o4, %o1, %i4
	std %l6, [%fp+-1312]
	add %i4, %l6, %i5
	st %i5, [%fp+-1328]
	add %o5, %l4, %i4
	add %i4, %l7, %i4
	st %i4, [%fp+-1320]
	xor %i4, %i1, %l1
	xor %i5, %i0, %l0
	ldd [%fp+-1344], %o2
	add %o2, %l5, %i0
	add %o3, %o0, %i1
	add %i1, %l3, %i1
	std %l2, [%fp+-1288]
	add %i0, %l2, %o7
	st %l1, [%fp+-812]
	st %l0, [%fp+-804]
	xor %o7, %g2, %l0
	xor %i1, %g3, %l1
	st %l1, [%fp+-828]
	st %l0, [%fp+-820]
	add %fp, -812, %g2
	or %g2, 2, %g2
	lduh [%g2], %g3
	add %fp, -804, %g2
	or %g2, 2, %g2
	lduh [%g2], %l0
	add %fp, -828, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -820, %l1
	or %l1, 2, %l1
	lduh [%l1], %l1
	add %fp, -824, %l2
	or %l2, 2, %l2
	lduh [%fp+-820], %l3
	lduh [%fp+-812], %l5
	lduh [%fp+-804], %l6
	lduh [%fp+-828], %l4
	sth %l3, [%l2]
	add %fp, -832, %l2
	or %l2, 2, %l2
	sth %l4, [%l2]
	sth %l1, [%fp+-824]
	sth %g2, [%fp+-832]
	add %fp, -808, %g2
	or %g2, 2, %l1
	ld [%fp+-824], %l4
	ld [%fp+-832], %l3
	sth %l6, [%l1]
	add %fp, -816, %l1
	or %l1, 2, %l1
	sth %l5, [%l1]
	sth %l0, [%fp+-808]
	sth %g3, [%fp+-816]
	ld [%fp+-816], %l0
	ld [%fp+-808], %l1
	ldd [%fp+-1272], %i4
	add %i5, %l4, %i0
	st %i0, [%fp+-1360]
	add %i4, %l0, %l2
	ldd [%fp+-1336], %i4
	add %i4, %l3, %g3
	add %i5, %l1, %l5
	xor %l5, %o4, %l6
	xor %l2, %o5, %l7
	xor %i0, %o2, %o0
	xor %g3, %o3, %o1
	ldd [%fp+-1248], %o2
	ldd [%fp+-1256], %o4
	mov	%o2, %o5
	add %i1, %o2, %g2
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1280], %i0
	mov	%i1, %i4
	or %o1, %o2, %o1
	mov	%o5, %i5
	std %i4, [%fp+-1344]
	mov	%i0, %o5
	std %o4, [%fp+-1256]
	ld [%fp+-1328], %i4
	add %i4, %o4, %i5
	add %i5, %l6, %i5
	xor %i5, %l1, %l1
	srl %l1, 8, %o2
	sll %l1, 24, %l1
	or %l1, %o2, %o2
	ld [%fp+-1320], %i4
	add %i4, %i0, %i4
	add %i4, %l7, %i4
	xor %i4, %l0, %l0
	srl %l0, 8, %l1
	sll %l0, 24, %l0
	or %l0, %l1, %o3
	add %o7, %i1, %i0
	add %i0, %o0, %o4
	xor %o4, %l4, %i0
	srl %i0, 8, %l0
	sll %i0, 24, %i0
	or %i0, %l0, %l4
	add %g2, %o1, %o5
	xor %o5, %l3, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o7
	add %o2, %l5, %i0
	xor %i0, %l6, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %l0
	add %o3, %l2, %l2
	xor %l2, %l7, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %g2
	ld [%fp+-1360], %i1
	add %l4, %i1, %l3
	xor %l3, %o0, %i1
	srl %i1, 7, %l1
	sll %i1, 25, %i1
	or %i1, %l1, %i1
	add %o7, %g3, %l1
	xor %l1, %o1, %g3
	srl %g3, 7, %l5
	sll %g3, 25, %g3
	or %g3, %l5, %g3
	ldd [%fp+-1264], %l6
	add %o5, %l7, %l5
	ldd [%fp+-1296], %l6
	add %i5, %l7, %i5
	add %g3, %i5, %l7
	add %i1, %l5, %l6
	ldd [%fp+-1240], %o0
	add %i4, %o1, %i4
	ldd [%fp+-1304], %o0
	add %o4, %o0, %i5
	add %g2, %i5, %o1
	add %l0, %i4, %o0
	xor %o1, %o7, %i5
	std %o0, [%fp+-1368]
	xor %o0, %l4, %i4
	st %i4, [%fp+-852]
	st %i5, [%fp+-860]
	xor %l7, %o3, %i5
	std %l6, [%fp+-1360]
	xor %l6, %o2, %i4
	st %i4, [%fp+-836]
	st %i5, [%fp+-844]
	add %fp, -852, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -860, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -836, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -844, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	add %fp, -848, %l6
	or %l6, 2, %l6
	lduh [%fp+-844], %l7
	lduh [%fp+-852], %o0
	lduh [%fp+-860], %o1
	lduh [%fp+-836], %o2
	sth %l7, [%l6]
	add %fp, -840, %l6
	or %l6, 2, %l6
	sth %o2, [%l6]
	sth %l5, [%fp+-848]
	sth %l4, [%fp+-840]
	ld [%fp+-848], %o3
	ld [%fp+-840], %o2
	add %fp, -864, %l4
	or %l4, 2, %l4
	sth %o1, [%l4]
	add %fp, -856, %l4
	or %l4, 2, %l4
	sth %o0, [%l4]
	sth %i5, [%fp+-864]
	sth %i4, [%fp+-856]
	ld [%fp+-864], %i5
	ld [%fp+-856], %i4
	add %l3, %o3, %l7
	std %o2, [%fp+-1392]
	add %l2, %o2, %l6
	add %i0, %i5, %l3
	add %l1, %i4, %l2
	xor %l7, %g3, %l5
	std %l6, [%fp+-1384]
	xor %l6, %i1, %l4
	ldd [%fp+-1312], %i0
	st %i0, [%fp+-868]
	ld [%fp+-868], %f0
	ldd [%fp+-1280], %i0
	st %i0, [%fp+-872]
	ldd [%fp+-1296], %i0
	mov	%i1, %i0
	xor %l3, %g2, %o5
	ldd [%fp+-1304], %g2
	std %l2, [%fp+-1376]
	xor %l2, %l0, %o4
	ldd [%fp+-1240], %l0
	mov	%l1, %i1
	std %i0, [%fp+-1280]
	ldd [%fp+-1264], %i0
	mov	%i1, %g3
	std %g2, [%fp+-1320]
	ld [%fp+-872], %f1
	sll %l4, 20, %o2
	sll %l5, 20, %o3
	sll %o4, 20, %l2
	sll %o5, 20, %l3
.LBB1_145:
	sth %o0, [%fp+-888]
	sth %o1, [%fp+-886]
	sth %l0, [%fp+-884]
	sth %l1, [%fp+-882]
	sth %i0, [%fp+-880]
	sth %i1, [%fp+-878]
	sth %l6, [%fp+-876]
	sth %l7, [%fp+-874]
	and %g4, 7, %i0
	sll %i0, 1, %i0
	add %fp, -888, %i1
	sth %i2, [%i1+%i0]
	lduh [%fp+-876], %l6
	lduh [%fp+-874], %l7
	lduh [%fp+-880], %i0
	lduh [%fp+-878], %i1
	lduh [%fp+-884], %l0
	lduh [%fp+-882], %l1
	lduh [%fp+-888], %o0
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_145
	lduh [%fp+-886], %o1
	st %f0, [%fp+-916]
	st %f0, [%fp+-920]
	st %f1, [%fp+-908]
	st %f1, [%fp+-912]
	ld [%fp+-916], %g2
	st %g2, [%fp+-1408]
	ld [%fp+-920], %g2
	st %g2, [%fp+-1412]
	ld [%fp+-908], %g2
	st %g2, [%fp+-1424]
	ld [%fp+-912], %g2
	st %g2, [%fp+-1428]
	and %l6, 64, %g2
	and %i0, 16, %g3
	srl %g3, 4, %g3
	mov	-1, %o7
	cmp %g3, 0
	mov	%g0, %g4
	bne	.LBB1_148
	mov	%o7, %g3
	mov	%g4, %g3
.LBB1_148:
	srl %g2, 6, %g2
	cmp %g2, 0
	and %o0, 1, %g2
	bne	.LBB1_150
	st %o7, [%fp+-1328]
	st %g4, [%fp+-1328]
.LBB1_150:
	cmp %g2, 0
	and %l0, 4, %g2
	bne	.LBB1_152
	st %o7, [%fp+-1336]
	st %g4, [%fp+-1336]
.LBB1_152:
	srl %g2, 2, %g2
	cmp %g2, 0
	and %i1, 32, %i1
	bne	.LBB1_154
	mov	%o7, %i0
	mov	%g4, %i0
.LBB1_154:
	srl %i1, 5, %i1
	cmp %i1, 0
	and %l7, 128, %g2
	bne	.LBB1_156
	mov	%o7, %i1
	mov	%g4, %i1
.LBB1_156:
	srl %g2, 7, %g2
	cmp %g2, 0
	and %o1, 2, %g2
	bne	.LBB1_158
	mov	%o7, %l6
	mov	%g4, %l6
.LBB1_158:
	srl %o5, 12, %l7
	srl %o4, 12, %o0
	srl %l5, 12, %o1
	srl %l4, 12, %l5
	srl %g2, 1, %g2
	cmp %g2, 0
	and %l1, 8, %g2
	bne	.LBB1_160
	mov	%o7, %l4
	mov	%g4, %l4
.LBB1_160:
	ldd [%fp+-1320], %l0
	mov	%l1, %l0
	std %l0, [%fp+-1248]
	ldd [%fp+-1280], %l0
	mov	%l1, %l0
	std %l0, [%fp+-1272]
	or %o2, %l5, %l0
	or %o3, %o1, %l1
	or %l2, %o0, %o4
	srl %g2, 3, %g2
	cmp %g2, 0
	bne	.LBB1_162
	or %l3, %l7, %l2
	mov	%g4, %o7
.LBB1_162:
	add %fp, -900, %g2
	or %g2, 2, %g2
	sth %o7, [%g2]
	add %fp, -904, %g2
	or %g2, 2, %g2
	sth %l4, [%g2]
	add %fp, -892, %g2
	or %g2, 2, %g2
	sth %l6, [%g2]
	add %fp, -896, %g2
	or %g2, 2, %g2
	sth %i1, [%g2]
	sth %i0, [%fp+-900]
	ld [%fp+-1336], %i0
	sth %i0, [%fp+-904]
	ld [%fp+-1328], %i0
	sth %i0, [%fp+-892]
	sth %g3, [%fp+-896]
	ld [%fp+-896], %i0
	ldd [%fp+-1248], %g2
	ldd [%fp+-1280], %l4
	mov	%l4, %g3
	std %g2, [%fp+-1248]
	ldd [%fp+-1272], %g2
	ldd [%fp+-1320], %l4
	mov	%l4, %g3
	std %g2, [%fp+-1272]
	ld [%fp+-892], %i1
	ld [%fp+-1428], %g2
	and %i0, %g2, %g2
	ldd [%fp+-1264], %l4
	andn %l4, %i0, %i0
	ld [%fp+-904], %g3
	andn %l4, %i1, %l3
	ld [%fp+-900], %l4
	ld [%fp+-1424], %l5
	and %i1, %l5, %i1
	ld [%fp+-1412], %l5
	and %g3, %l5, %l5
	ldd [%fp+-1304], %l6
	andn %l7, %g3, %g3
	andn %l7, %l4, %l6
	ld [%fp+-1408], %l7
	and %l4, %l7, %l4
	or %l6, %l4, %o1
	or %g3, %l5, %o0
	or %l3, %i1, %l7
	or %i0, %g2, %l6
	ldd [%fp+-1368], %g2
	add %l2, %g3, %i0
	add %o4, %g2, %i1
	ldd [%fp+-1360], %l4
	add %l1, %l5, %g2
	add %l0, %l4, %g3
	add %g3, %o0, %o2
	std %o0, [%fp+-1280]
	add %g2, %o1, %o3
	add %i1, %l6, %l4
	std %l6, [%fp+-1264]
	add %i0, %l7, %l5
	ldd [%fp+-1392], %g2
	xor %o2, %g2, %i0
	std %o2, [%fp+-1304]
	xor %o3, %g3, %i1
	xor %l4, %i4, %g2
	xor %l5, %i5, %i4
	srl %i4, 8, %i5
	srl %g2, 8, %g3
	srl %i1, 8, %l3
	srl %i0, 8, %l6
	sll %i4, 24, %i4
	sll %g2, 24, %g2
	sll %i1, 24, %l7
	sll %i0, 24, %i0
	or %i0, %l6, %i0
	or %l7, %l3, %i1
	or %g2, %g3, %g2
	or %i4, %i5, %g3
	ldd [%fp+-1384], %i4
	add %i0, %i4, %l6
	add %i1, %i5, %l7
	ldd [%fp+-1376], %i4
	add %g2, %i4, %o0
	add %g3, %i5, %o1
	xor %l6, %l0, %i4
	std %l6, [%fp+-1320]
	xor %l7, %l1, %i5
	xor %o0, %o4, %l0
	std %o0, [%fp+-1328]
	xor %o1, %l2, %l1
	srl %l1, 7, %l2
	srl %l0, 7, %l3
	srl %i5, 7, %l6
	srl %i4, 7, %l7
	sll %l1, 25, %l1
	sll %l0, 25, %l0
	sll %i5, 25, %i5
	sll %i4, 25, %i4
	or %i4, %l7, %o0
	or %i5, %l6, %o1
	std %o0, [%fp+-1336]
	or %l0, %l3, %i4
	or %l1, %l2, %i5
	std %i4, [%fp+-1360]
.LBB1_163:
	sth %l0, [%fp+-936]
	sth %l1, [%fp+-934]
	sth %l6, [%fp+-932]
	sth %l7, [%fp+-930]
	sth %o0, [%fp+-928]
	sth %o1, [%fp+-926]
	sth %l2, [%fp+-924]
	sth %l3, [%fp+-922]
	and %g4, 7, %i4
	sll %i4, 1, %i4
	add %fp, -936, %i5
	sth %i3, [%i5+%i4]
	lduh [%fp+-924], %l2
	lduh [%fp+-922], %l3
	lduh [%fp+-928], %o0
	lduh [%fp+-926], %o1
	lduh [%fp+-932], %l6
	lduh [%fp+-930], %l7
	lduh [%fp+-936], %l0
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_163
	lduh [%fp+-934], %l1
	and %o0, 16, %i4
	and %l0, 1, %g4
	mov	-1, %i5
	cmp %g4, 0
	mov	%g0, %g4
	bne	.LBB1_166
	mov	%i5, %o7
	mov	%g4, %o7
.LBB1_166:
	srl %i4, 4, %i4
	cmp %i4, 0
	and %l2, 64, %o2
	bne	.LBB1_168
	mov	%i5, %i4
	mov	%g4, %i4
.LBB1_168:
	srl %o2, 6, %o2
	cmp %o2, 0
	and %l6, 4, %o3
	bne	.LBB1_170
	mov	%i5, %o2
	mov	%g4, %o2
.LBB1_170:
	srl %o3, 2, %o3
	cmp %o3, 0
	and %l1, 2, %l1
	bne	.LBB1_172
	mov	%i5, %l0
	mov	%g4, %l0
.LBB1_172:
	srl %l1, 1, %l1
	cmp %l1, 0
	and %o1, 32, %o0
	bne	.LBB1_174
	mov	%i5, %l1
	mov	%g4, %l1
.LBB1_174:
	srl %o0, 5, %o0
	cmp %o0, 0
	and %l3, 128, %l3
	bne	.LBB1_176
	mov	%i5, %l2
	mov	%g4, %l2
.LBB1_176:
	srl %l3, 7, %l3
	cmp %l3, 0
	and %l7, 8, %l6
	bne	.LBB1_178
	mov	%i5, %l3
	mov	%g4, %l3
.LBB1_178:
	srl %l6, 3, %l6
	cmp %l6, 0
	bne	.LBB1_180
	nop
	mov	%g4, %i5
.LBB1_180:
	add %fp, -948, %l6
	or %l6, 2, %l6
	sth %i5, [%l6]
	add %fp, -940, %i5
	or %i5, 2, %i5
	sth %l3, [%i5]
	add %fp, -944, %i5
	or %i5, 2, %i5
	sth %l2, [%i5]
	add %fp, -952, %i5
	or %i5, 2, %i5
	sth %l1, [%i5]
	sth %l0, [%fp+-948]
	sth %o2, [%fp+-940]
	sth %i4, [%fp+-944]
	sth %o7, [%fp+-952]
	ld [%fp+-944], %i4
	ld [%fp+-940], %i5
	ldd [%fp+-1312], %l2
	and %i4, %l2, %l0
	and %i5, %l3, %l1
	ld [%fp+-948], %l2
	ldd [%fp+-1296], %l6
	andn %l6, %i4, %i4
	andn %l7, %i5, %i5
	ld [%fp+-952], %l3
	ldd [%fp+-1288], %o2
	and %l2, %o3, %l6
	ldd [%fp+-1344], %o0
	andn %o1, %l2, %l2
	or %l2, %l6, %o5
	or %i5, %l1, %o4
	andn %o0, %l3, %i5
	and %l3, %o2, %l1
	or %i4, %l0, %l7
	or %i5, %l1, %l6
	ldd [%fp+-1304], %l0
	ldd [%fp+-1360], %o0
	add %o0, %l1, %i4
	std %o4, [%fp+-1296]
	add %i4, %o4, %l2
	st %l2, [%fp+-1344]
	add %o1, %l4, %i4
	add %i4, %o5, %i4
	st %i4, [%fp+-1312]
	xor %i4, %i1, %i5
	xor %l2, %i0, %i4
	ldd [%fp+-1336], %o2
	add %o2, %l5, %i0
	add %o3, %l0, %i1
	add %i1, %l7, %i1
	std %l6, [%fp+-1304]
	add %i0, %l6, %o7
	st %i5, [%fp+-964]
	st %i4, [%fp+-956]
	xor %o7, %g2, %i4
	xor %i1, %g3, %i5
	st %i5, [%fp+-980]
	st %i4, [%fp+-972]
	add %fp, -964, %i4
	or %i4, 2, %i4
	lduh [%i4], %i5
	add %fp, -956, %i4
	or %i4, 2, %i4
	lduh [%i4], %g3
	add %fp, -980, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	add %fp, -972, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -976, %l0
	or %l0, 2, %l0
	lduh [%fp+-972], %l1
	lduh [%fp+-964], %l4
	lduh [%fp+-956], %l5
	lduh [%fp+-980], %l6
	sth %l1, [%l0]
	add %fp, -984, %l0
	or %l0, 2, %l0
	sth %l6, [%l0]
	sth %g2, [%fp+-976]
	sth %i4, [%fp+-984]
	add %fp, -960, %i4
	or %i4, 2, %l0
	ld [%fp+-976], %i4
	ld [%fp+-984], %i0
	st %i0, [%fp+-1368]
	sth %l5, [%l0]
	add %fp, -968, %l0
	or %l0, 2, %l0
	sth %l4, [%l0]
	sth %g3, [%fp+-960]
	sth %i5, [%fp+-968]
	ld [%fp+-968], %i5
	ld [%fp+-960], %l0
	ldd [%fp+-1320], %l2
	add %l3, %i4, %l4
	add %l2, %i5, %l5
	ldd [%fp+-1328], %l2
	add %l2, %i0, %g3
	add %l3, %l0, %l1
	xor %l1, %o0, %l6
	xor %l5, %o1, %l7
	xor %l4, %o2, %o0
	xor %g3, %o3, %o1
	ldd [%fp+-1256], %o2
	ldd [%fp+-1240], %o4
	mov	%o2, %o5
	add %i1, %o2, %g2
	srl %o1, 12, %o2
	srl %l6, 12, %o3
	sll %l6, 20, %l6
	or %l6, %o3, %l6
	srl %l7, 12, %o3
	sll %l7, 20, %l7
	or %l7, %o3, %l7
	srl %o0, 12, %o3
	sll %o1, 20, %o1
	sll %o0, 20, %o0
	or %o0, %o3, %o0
	ldd [%fp+-1288], %i0
	mov	%i1, %l2
	or %o1, %o2, %o1
	mov	%o5, %l3
	std %l2, [%fp+-1256]
	mov	%i0, %o5
	std %o4, [%fp+-1240]
	ld [%fp+-1344], %l2
	add %l2, %o4, %l3
	add %l3, %l6, %l3
	xor %l3, %l0, %l0
	srl %l0, 8, %o2
	sll %l0, 24, %l0
	or %l0, %o2, %o2
	ld [%fp+-1312], %l0
	add %l0, %i0, %l0
	add %l0, %l7, %l2
	xor %l2, %i5, %i5
	srl %i5, 8, %l0
	sll %i5, 24, %i5
	or %i5, %l0, %o3
	add %o7, %i1, %i0
	add %i0, %o0, %o4
	xor %o4, %i4, %i0
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o5
	add %g2, %o1, %o7
	ld [%fp+-1368], %i0
	xor %o7, %i0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %g2
	add %o2, %l1, %i0
	xor %i0, %l6, %i1
	srl %i1, 7, %i4
	sll %i1, 25, %i1
	or %i1, %i4, %l6
	add %o3, %l5, %l0
	xor %l0, %l7, %i1
	srl %i1, 7, %i4
	sll %i1, 25, %i1
	or %i1, %i4, %i4
	add %o5, %l4, %l1
	xor %l1, %o0, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %i5
	add %g2, %g3, %g3
	xor %g3, %o1, %i1
	srl %i1, 7, %l4
	sll %i1, 25, %i1
	or %i1, %l4, %i1
	ldd [%fp+-1248], %l4
	add %o7, %l5, %l4
	ldd [%fp+-1280], %o0
	add %l3, %o1, %l3
	add %i1, %l3, %o1
	add %i5, %l4, %o0
	ldd [%fp+-1264], %l4
	add %l2, %l5, %l2
	ldd [%fp+-1272], %l4
	add %o4, %l4, %l3
	add %i4, %l3, %l5
	add %l6, %l2, %l4
	xor %l5, %g2, %l3
	std %l4, [%fp+-1320]
	xor %l4, %o5, %l2
	st %l2, [%fp+-1004]
	st %l3, [%fp+-1012]
	xor %o1, %o3, %l3
	std %o0, [%fp+-1312]
	xor %o0, %o2, %l2
	st %l2, [%fp+-988]
	st %l3, [%fp+-996]
	add %fp, -1004, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -1012, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -988, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -996, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -1000, %l5
	or %l5, 2, %l5
	lduh [%fp+-996], %l7
	lduh [%fp+-1004], %o0
	lduh [%fp+-1012], %o1
	lduh [%fp+-988], %o2
	sth %l7, [%l5]
	add %fp, -992, %l5
	or %l5, 2, %l5
	sth %o2, [%l5]
	sth %l4, [%fp+-1000]
	sth %l3, [%fp+-992]
	ld [%fp+-1000], %o3
	ld [%fp+-992], %o2
	add %fp, -1016, %l3
	or %l3, 2, %l3
	sth %o1, [%l3]
	add %fp, -1008, %l3
	or %l3, 2, %l3
	sth %o0, [%l3]
	sth %l2, [%fp+-1016]
	sth %g2, [%fp+-1008]
	ld [%fp+-1016], %l5
	ld [%fp+-1008], %l4
	add %l1, %o3, %l3
	std %o2, [%fp+-1344]
	add %l0, %o2, %l2
	add %i0, %l5, %l1
	add %g3, %l4, %l0
	xor %l3, %i1, %i1
	std %l2, [%fp+-1336]
	xor %l2, %i5, %i0
	xor %l1, %i4, %l3
	std %l0, [%fp+-1328]
	xor %l0, %l6, %l2
	ldd [%fp+-1296], %i4
	st %i4, [%fp+-1020]
	ld [%fp+-1020], %f0
	ldd [%fp+-1288], %i4
	st %i4, [%fp+-1024]
	sll %i0, 20, %l6
	ld [%fp+-1024], %f1
	sll %i1, 20, %l7
	sll %l2, 20, %g2
	sll %l3, 20, %g3
.LBB1_181:
	sth %o0, [%fp+-1040]
	sth %o1, [%fp+-1038]
	sth %i4, [%fp+-1036]
	sth %i5, [%fp+-1034]
	sth %l0, [%fp+-1032]
	sth %l1, [%fp+-1030]
	sth %o2, [%fp+-1028]
	sth %o3, [%fp+-1026]
	and %g4, 7, %i4
	sll %i4, 1, %i4
	add %fp, -1040, %i5
	sth %i2, [%i5+%i4]
	lduh [%fp+-1028], %o2
	lduh [%fp+-1026], %o3
	lduh [%fp+-1032], %l0
	lduh [%fp+-1030], %l1
	lduh [%fp+-1036], %i4
	lduh [%fp+-1034], %i5
	lduh [%fp+-1040], %o0
	add %g4, 1, %g4
	cmp %g4, 8
	bne	.LBB1_181
	lduh [%fp+-1038], %o1
	st %f1, [%fp+-1060]
	st %f1, [%fp+-1064]
	st %f0, [%fp+-1068]
	st %f0, [%fp+-1072]
	ld [%fp+-1060], %i2
	st %i2, [%fp+-1288]
	ld [%fp+-1064], %i2
	st %i2, [%fp+-1360]
	ld [%fp+-1068], %i2
	st %i2, [%fp+-1368]
	ld [%fp+-1072], %i2
	st %i2, [%fp+-1376]
	and %i4, 4, %g4
	and %o0, 1, %i2
	mov	-1, %o4
	cmp %i2, 0
	mov	%g0, %i2
	bne	.LBB1_184
	mov	%o4, %o5
	mov	%i2, %o5
.LBB1_184:
	st %o5, [%fp+-1384]
	srl %g4, 2, %g4
	cmp %g4, 0
	and %l0, 16, %g4
	bne	.LBB1_186
	mov	%o4, %o5
	mov	%i2, %o5
.LBB1_186:
	st %o5, [%fp+-1392]
	srl %g4, 4, %g4
	cmp %g4, 0
	and %o2, 64, %g4
	bne	.LBB1_188
	mov	%o4, %o5
	mov	%i2, %o5
.LBB1_188:
	srl %g4, 6, %g4
	cmp %g4, 0
	and %o1, 2, %g4
	bne	.LBB1_190
	mov	%o4, %o0
	mov	%i2, %o0
.LBB1_190:
	srl %g4, 1, %g4
	cmp %g4, 0
	and %i5, 8, %i5
	bne	.LBB1_192
	mov	%o4, %i4
	mov	%i2, %i4
.LBB1_192:
	srl %i5, 3, %i5
	cmp %i5, 0
	and %l1, 32, %o1
	bne	.LBB1_194
	mov	%o4, %i5
	mov	%i2, %i5
.LBB1_194:
	srl %l3, 12, %l0
	srl %l2, 12, %g4
	srl %i1, 12, %l1
	srl %i0, 12, %i1
	srl %o1, 5, %i0
	cmp %i0, 0
	and %o3, 128, %l3
	bne	.LBB1_196
	mov	%o4, %i0
	mov	%i2, %i0
.LBB1_196:
	or %l6, %i1, %l2
	or %l7, %l1, %o7
	or %g2, %g4, %g4
	srl %l3, 7, %i1
	cmp %i1, 0
	bne	.LBB1_198
	or %g3, %l0, %l3
	mov	%i2, %o4
.LBB1_198:
	add %fp, -1044, %i1
	or %i1, 2, %i1
	sth %o4, [%i1]
	add %fp, -1048, %i1
	or %i1, 2, %i1
	sth %i0, [%i1]
	add %fp, -1052, %i0
	or %i0, 2, %i0
	sth %i5, [%i0]
	add %fp, -1056, %i0
	or %i0, 2, %i0
	sth %i4, [%i0]
	sth %o0, [%fp+-1044]
	sth %o5, [%fp+-1048]
	ld [%fp+-1392], %i0
	sth %i0, [%fp+-1052]
	ld [%fp+-1384], %i0
	sth %i0, [%fp+-1056]
	ld [%fp+-1056], %i0
	ld [%fp+-1052], %i1
	ld [%fp+-1376], %i4
	and %i0, %i4, %i4
	ldd [%fp+-1272], %g2
	andn %g3, %i0, %i0
	ld [%fp+-1048], %i5
	andn %g3, %i1, %g2
	ld [%fp+-1044], %g3
	ld [%fp+-1368], %l0
	and %i1, %l0, %i1
	ld [%fp+-1360], %l0
	and %i5, %l0, %l0
	ldd [%fp+-1248], %l6
	andn %l6, %i5, %i5
	andn %l6, %g3, %l1
	ld [%fp+-1288], %l6
	and %g3, %l6, %g3
	or %l1, %g3, %g3
	or %i5, %l0, %i5
	or %g2, %i1, %i1
	or %i0, %i4, %i0
	ldd [%fp+-1320], %l0
	add %l3, %l1, %i4
	add %g4, %l0, %g2
	ldd [%fp+-1312], %l6
	add %o7, %l7, %l0
	add %l2, %l6, %l1
	add %l1, %i0, %o0
	add %l0, %i1, %o1
	add %g2, %i5, %l0
	add %i4, %g3, %l1
	ldd [%fp+-1344], %i4
	xor %o0, %i4, %i0
	std %o0, [%fp+-1288]
	xor %o1, %i5, %i1
	xor %l0, %l4, %i4
	std %l0, [%fp+-1344]
	xor %l1, %l5, %i5
	srl %i5, 8, %l0
	srl %i4, 8, %l1
	srl %i1, 8, %l4
	srl %i0, 8, %g2
	sll %i5, 24, %i5
	sll %i4, 24, %i4
	sll %i1, 24, %i1
	sll %i0, 24, %i0
	or %i0, %g2, %g2
	or %i1, %l4, %g3
	or %i4, %l1, %i0
	or %i5, %l0, %i1
	ldd [%fp+-1336], %i4
	add %g2, %i4, %l0
	add %g3, %i5, %l1
	ldd [%fp+-1328], %i4
	add %i0, %i4, %o0
	add %i1, %i5, %o1
	xor %l0, %l2, %i4
	std %l0, [%fp+-1248]
	xor %l1, %o7, %i5
	xor %o0, %g4, %l4
	std %o0, [%fp+-1272]
	xor %o1, %l3, %l5
.LBB1_199:
	sth %l0, [%fp+-1088]
	sth %l1, [%fp+-1086]
	sth %o0, [%fp+-1084]
	sth %o1, [%fp+-1082]
	sth %o2, [%fp+-1080]
	sth %o3, [%fp+-1078]
	sth %o4, [%fp+-1076]
	sth %o5, [%fp+-1074]
	and %i2, 7, %g4
	sll %g4, 1, %g4
	add %fp, -1088, %l0
	sth %i3, [%l0+%g4]
	lduh [%fp+-1076], %o4
	lduh [%fp+-1074], %o5
	lduh [%fp+-1080], %o2
	lduh [%fp+-1078], %o3
	lduh [%fp+-1084], %o0
	lduh [%fp+-1082], %o1
	lduh [%fp+-1088], %l0
	add %i2, 1, %i2
	cmp %i2, 8
	bne	.LBB1_199
	lduh [%fp+-1086], %l1
	and %l0, 1, %i2
	and %o2, 16, %i3
	srl %i3, 4, %i3
	mov	-1, %l3
	cmp %i3, 0
	mov	%g0, %o7
	bne	.LBB1_202
	mov	%l3, %i3
	mov	%o7, %i3
.LBB1_202:
	cmp %i2, 0
	and %o4, 64, %i2
	bne	.LBB1_204
	mov	%l3, %l6
	mov	%o7, %l6
.LBB1_204:
	srl %i2, 6, %i2
	cmp %i2, 0
	and %o0, 4, %i2
	bne	.LBB1_206
	mov	%l3, %l7
	mov	%o7, %l7
.LBB1_206:
	srl %i2, 2, %i2
	cmp %i2, 0
	and %o3, 32, %i2
	bne	.LBB1_208
	mov	%l3, %o2
	mov	%o7, %o2
.LBB1_208:
	srl %i2, 5, %i2
	cmp %i2, 0
	and %l1, 2, %i2
	bne	.LBB1_210
	mov	%l3, %l0
	mov	%o7, %l0
.LBB1_210:
	st %i3, [%fp+-1320]
	srl %i2, 1, %i2
	cmp %i2, 0
	and %o5, 128, %g4
	bne	.LBB1_212
	mov	%l3, %l1
	mov	%o7, %l1
.LBB1_212:
	sll %l5, 25, %o3
	sll %l4, 25, %o5
	sll %i4, 25, %i3
	sll %i5, 25, %l2
	srl %l5, 7, %o4
	srl %l4, 7, %l4
	srl %i4, 7, %i2
	srl %i5, 7, %i4
	srl %g4, 7, %i5
	cmp %i5, 0
	and %o1, 8, %i5
	bne	.LBB1_214
	mov	%l3, %l5
	mov	%o7, %l5
.LBB1_214:
	or %l2, %i4, %i4
	st %i4, [%fp+-1312]
	or %i3, %i2, %i3
	or %o5, %l4, %i4
	srl %i5, 3, %i2
	cmp %i2, 0
	bne	.LBB1_216
	or %o3, %o4, %i5
	mov	%o7, %l3
.LBB1_216:
	add %fp, -1100, %i2
	or %i2, 2, %i2
	sth %l3, [%i2]
	add %fp, -1092, %i2
	or %i2, 2, %i2
	sth %l5, [%i2]
	add %fp, -1104, %i2
	or %i2, 2, %i2
	sth %l1, [%i2]
	add %fp, -1096, %i2
	or %i2, 2, %i2
	sth %l0, [%i2]
	sth %o2, [%fp+-1100]
	sth %l7, [%fp+-1092]
	sth %l6, [%fp+-1104]
	ld [%fp+-1320], %i2
	sth %i2, [%fp+-1096]
	ld [%fp+-1096], %i2
	ld [%fp+-1092], %g4
	ld [%fp+-1100], %l0
	ldd [%fp+-1296], %l2
	and %i2, %l2, %l1
	and %g4, %l3, %l2
	ldd [%fp+-1280], %l4
	andn %l4, %i2, %i2
	andn %l5, %g4, %g4
	ldd [%fp+-1304], %o4
	and %l0, %o5, %l3
	ldd [%fp+-1256], %o2
	andn %o3, %l0, %l0
	or %l0, %l3, %l0
	or %g4, %l2, %g4
	ldd [%fp+-1288], %o0
	add %i4, %o1, %l2
	add %l2, %g4, %g4
	ld [%fp+-1104], %l3
	ldd [%fp+-1344], %l6
	add %i5, %l6, %l2
	add %l2, %l0, %l2
	xor %l2, %g3, %l5
	xor %g4, %g2, %l4
	andn %o2, %l3, %g2
	and %l3, %o4, %g3
	or %g2, %g3, %g2
	or %i2, %l1, %i2
	add %i3, %l7, %g3
	ld [%fp+-1312], %o3
	add %o3, %o0, %l0
	add %l0, %i2, %i2
	add %g3, %g2, %g2
	st %l4, [%fp+-1124]
	st %l5, [%fp+-1132]
	xor %g2, %i0, %l0
	xor %i2, %i1, %l1
	st %l0, [%fp+-1108]
	st %l1, [%fp+-1116]
	add %fp, -1124, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	add %fp, -1132, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	add %fp, -1108, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -1116, %l0
	or %l0, 2, %l0
	lduh [%l0], %l0
	add %fp, -1120, %l1
	or %l1, 2, %l1
	lduh [%fp+-1116], %l3
	lduh [%fp+-1124], %l4
	lduh [%fp+-1132], %l5
	lduh [%fp+-1108], %l6
	sth %l3, [%l1]
	add %fp, -1112, %l1
	or %l1, 2, %l1
	sth %l6, [%l1]
	sth %l0, [%fp+-1120]
	sth %g3, [%fp+-1112]
	add %fp, -1136, %g3
	or %g3, 2, %g3
	ld [%fp+-1120], %l6
	ld [%fp+-1112], %l7
	sth %l5, [%g3]
	add %fp, -1128, %g3
	or %g3, 2, %g3
	sth %l4, [%g3]
	ldd [%fp+-1264], %l0
	add %g4, %l0, %g3
	sth %i1, [%fp+-1136]
	sth %i0, [%fp+-1128]
	ld [%fp+-1128], %i0
	ldd [%fp+-1240], %l0
	add %i2, %l0, %i1
	ld [%fp+-1136], %i2
	ldd [%fp+-1272], %l0
	add %l0, %l6, %l4
	add %l1, %i0, %l5
	ldd [%fp+-1248], %l0
	add %l1, %l7, %o1
	add %l0, %i2, %o2
	xor %o2, %i5, %i5
	xor %l5, %i4, %i4
	xor %l4, %o3, %l1
	xor %o1, %i3, %i3
	srl %i5, 12, %g4
	sll %i5, 20, %i5
	or %i5, %g4, %g4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %l0
	srl %l1, 12, %i4
	sll %l1, 20, %i5
	or %i5, %i4, %l1
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %l3
	add %l2, %o4, %i3
	add %g2, %o5, %i4
	add %i4, %l3, %l2
	add %i1, %l1, %o0
	add %g3, %l0, %o3
	add %i3, %g4, %o4
	xor %o4, %i2, %i1
	xor %o3, %i0, %i0
	xor %o0, %l6, %i4
	xor %l2, %l7, %i5
	srl %i0, 8, %g2
	srl %i1, 8, %i2
	sll %i0, 24, %i0
	sll %i1, 24, %i1
	or %i1, %i2, %i3
	or %i0, %g2, %i2
	srl %i5, 8, %i0
	srl %i4, 8, %i1
	sll %i5, 24, %g2
	sll %i4, 24, %i4
	or %i4, %i1, %i5
	or %g2, %i0, %i4
	add %i5, %l4, %i1
	add %i4, %o1, %i0
	add %i3, %o2, %g3
	add %i2, %l5, %g2
	xor %i1, %o4, %l4
	xor %g2, %l2, %l5
	std %l4, [%fp+-1232]
	add %fp, -1232, %l2
	or %l2, 4, %l2
	ld [%l2], %l2
	xor %i0, %o3, %l5
	xor %g3, %o0, %l4
	ld [%fp+-1352], %o0
	stb %l2, [%o0+15]
	ld [%fp+-1232], %l6
	srl %l2, 8, %l7
	stb %l7, [%o0+14]
	srl %l2, 16, %l7
	stb %l7, [%o0+13]
	srl %l2, 24, %l2
	stb %l2, [%o0+12]
	srl %l6, 8, %l2
	stb %l2, [%o0+10]
	srl %l6, 16, %l2
	stb %l2, [%o0+9]
	xor %i0, %l3, %l2
	xor %i1, %l1, %l1
	xor %g2, %l0, %l0
	stb %l6, [%o0+11]
	srl %l6, 24, %l3
	stb %l3, [%o0+8]
	srl %l0, 7, %l3
	std %l4, [%fp+-1224]
	srl %l1, 7, %l4
	srl %l2, 7, %l5
	sll %l0, 25, %l0
	sll %l2, 25, %l2
	or %l2, %l5, %l2
	add %fp, -1224, %l5
	or %l5, 4, %l5
	ld [%l5], %l5
	sll %l1, 25, %l1
	or %l1, %l4, %l1
	or %l0, %l3, %l0
	stb %l5, [%o0+7]
	ld [%fp+-1224], %l3
	srl %l5, 8, %l4
	stb %l4, [%o0+6]
	srl %l5, 16, %l4
	stb %l4, [%o0+5]
	srl %l5, 24, %l4
	stb %l4, [%o0+4]
	srl %l3, 8, %l4
	stb %l4, [%o0+2]
	srl %l3, 16, %l4
	stb %l4, [%o0+1]
	xor %g3, %g4, %g4
	stb %l3, [%o0+3]
	srl %l3, 24, %l3
	stb %l3, [%o0]
	xor %l1, %i3, %l5
	xor %l2, %i2, %l4
	srl %g4, 7, %l1
	sll %g4, 25, %g4
	std %l4, [%fp+-1216]
	add %fp, -1216, %l2
	or %l2, 4, %l2
	ld [%l2], %l2
	or %g4, %l1, %g4
	xor %g4, %i5, %l5
	xor %l0, %i4, %l4
	stb %l2, [%o0+23]
	ld [%fp+-1216], %g4
	srl %l2, 8, %l0
	stb %l0, [%o0+22]
	srl %l2, 16, %l0
	stb %l0, [%o0+21]
	stb %g4, [%o0+19]
	srl %l2, 24, %l0
	stb %l0, [%o0+20]
	srl %g4, 8, %l0
	stb %l0, [%o0+18]
	srl %g4, 16, %l0
	stb %l0, [%o0+17]
	srl %g4, 24, %g4
	stb %g4, [%o0+16]
	std %l4, [%fp+-1208]
	add %fp, -1208, %g4
	or %g4, 4, %g4
	ld [%g4], %g4
	stb %g4, [%o0+31]
	ld [%fp+-1208], %l0
	stb %l0, [%o0+27]
	srl %g4, 8, %l1
	stb %l1, [%o0+30]
	srl %g4, 16, %l1
	stb %l1, [%o0+29]
	srl %g4, 24, %g4
	stb %g4, [%o0+28]
	srl %l0, 8, %g4
	stb %g4, [%o0+26]
	srl %l0, 16, %g4
	stb %g4, [%o0+25]
	srl %l0, 24, %g4
	stb %g4, [%o0+24]
	ld [%fp+-1348], %l4
	ldub [%l4+6], %g4
	ldub [%l4+7], %l0
	ldub [%l4+4], %l1
	ldub [%l4+5], %l2
	sll %g4, 8, %g4
	or %g4, %l0, %g4
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %g4, %g4
	add %fp, -1192, %l0
	or %l0, 4, %l0
	st %g4, [%l0]
	ldub [%l4+14], %g4
	ldub [%l4+15], %l0
	ldub [%l4+12], %l1
	ldub [%l4+13], %l2
	sll %g4, 8, %g4
	or %g4, %l0, %g4
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %g4, %g4
	add %fp, -1200, %l0
	or %l0, 4, %l0
	st %g4, [%l0]
	ldub [%l4+2], %g4
	ldub [%l4+3], %l0
	ldub [%l4], %l1
	ldub [%l4+1], %l2
	sll %g4, 8, %g4
	or %g4, %l0, %g4
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %g4, %g4
	st %g4, [%fp+-1192]
	ldub [%l4+10], %g4
	ldub [%l4+11], %l0
	ldub [%l4+8], %l1
	ldub [%l4+9], %l2
	sll %g4, 8, %g4
	or %g4, %l0, %g4
	sll %l1, 8, %l0
	or %l0, %l2, %l0
	sll %l0, 16, %l0
	or %l0, %g4, %g4
	st %g4, [%fp+-1200]
	ldd [%fp+-1192], %l0
	xor %l1, %i0, %l3
	xor %l0, %g3, %l2
	ldd [%fp+-1200], %l0
	std %l2, [%fp+-1176]
	add %fp, -1176, %g4
	or %g4, 4, %g4
	ld [%g4], %g4
	stb %g4, [%o0+39]
	ld [%fp+-1176], %l2
	xor %l1, %g2, %g3
	xor %l0, %i1, %g2
	stb %l2, [%o0+35]
	std %g2, [%fp+-1184]
	add %fp, -1184, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%o0+47]
	ld [%fp+-1184], %i1
	srl %g4, 8, %g2
	stb %g2, [%o0+38]
	srl %g4, 16, %g2
	stb %g2, [%o0+37]
	stb %i1, [%o0+43]
	srl %g4, 24, %g2
	stb %g2, [%o0+36]
	srl %l2, 8, %g2
	stb %g2, [%o0+34]
	srl %l2, 16, %g2
	stb %g2, [%o0+33]
	srl %l2, 24, %g2
	stb %g2, [%o0+32]
	srl %i0, 8, %g2
	stb %g2, [%o0+46]
	srl %i0, 16, %g2
	stb %g2, [%o0+45]
	srl %i0, 24, %i0
	stb %i0, [%o0+44]
	srl %i1, 8, %i0
	stb %i0, [%o0+42]
	srl %i1, 16, %i0
	stb %i0, [%o0+41]
	srl %i1, 24, %i0
	stb %i0, [%o0+40]
	ldub [%l4+30], %i0
	ldub [%l4+31], %i1
	ldub [%l4+28], %g2
	ldub [%l4+29], %g3
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %g2, 8, %i1
	or %i1, %g3, %i1
	sll %i1, 16, %i1
	or %i1, %i0, %i0
	add %fp, -1168, %i1
	or %i1, 4, %i1
	st %i0, [%i1]
	ldub [%l4+22], %i0
	ldub [%l4+23], %i1
	ldub [%l4+20], %g2
	ldub [%l4+21], %g3
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %g2, 8, %i1
	or %i1, %g3, %i1
	sll %i1, 16, %i1
	or %i1, %i0, %i0
	add %fp, -1160, %i1
	or %i1, 4, %i1
	st %i0, [%i1]
	ldub [%l4+26], %i0
	ldub [%l4+27], %i1
	ldub [%l4+24], %g2
	ldub [%l4+25], %g3
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %g2, 8, %i1
	or %i1, %g3, %i1
	sll %i1, 16, %i1
	or %i1, %i0, %i0
	st %i0, [%fp+-1168]
	ldub [%l4+18], %i0
	ldub [%l4+19], %i1
	ldub [%l4+16], %g2
	ldub [%l4+17], %g3
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %g2, 8, %i1
	or %i1, %g3, %i1
	sll %i1, 16, %i1
	or %i1, %i0, %i0
	st %i0, [%fp+-1160]
	ldd [%fp+-1168], %i0
	xor %i1, %i5, %g3
	xor %i0, %i4, %g2
	ldd [%fp+-1160], %i0
	std %g2, [%fp+-1152]
	add %fp, -1152, %i4
	or %i4, 4, %i4
	ld [%i4], %i4
	stb %i4, [%o0+63]
	ld [%fp+-1152], %i5
	xor %i1, %i3, %g3
	xor %i0, %i2, %g2
	stb %i5, [%o0+59]
	std %g2, [%fp+-1144]
	add %fp, -1144, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%o0+55]
	ld [%fp+-1144], %i1
	srl %i4, 8, %i2
	stb %i2, [%o0+62]
	srl %i4, 16, %i2
	stb %i2, [%o0+61]
	srl %i4, 24, %i2
	stb %i2, [%o0+60]
	srl %i5, 8, %i2
	stb %i2, [%o0+58]
	srl %i5, 16, %i2
	stb %i2, [%o0+57]
	srl %i5, 24, %i2
	stb %i2, [%o0+56]
	srl %i0, 8, %i2
	stb %i2, [%o0+54]
	srl %i0, 16, %i2
	stb %i2, [%o0+53]
	srl %i0, 24, %i0
	stb %i0, [%o0+52]
	srl %i1, 8, %i0
	stb %i0, [%o0+50]
	srl %i1, 16, %i0
	stb %i0, [%o0+49]
	stb %i1, [%o0+51]
	srl %i1, 24, %i0
	stb %i0, [%o0+48]
	ret
	restore
.Lfunc_end1:
	.size	_blake3_compress_xof_sse2, .Lfunc_end1-_blake3_compress_xof_sse2

	.globl	_blake3_hash_many_sse2
	.p2align	2
	.type	_blake3_hash_many_sse2,@function
_blake3_hash_many_sse2:
	save %sp, -3080, %sp
	ld [%fp+108], %l5
	ld [%fp+104], %g2
	st %g2, [%fp+-2852]
	ld [%fp+100], %g2
	ld [%fp+96], %l0
	ld [%fp+92], %g3
	cmp %i1, 4
	st %i3, [%fp+-2916]
	st %i2, [%fp+-2860]
	bcs	.LBB2_1
	st %g2, [%fp+-2988]
	mov	%g0, %l6
	sub %l6, %g3, %i2
	and %i2, 1, %l7
	and %i2, 2, %l2
	and %i2, 3, %l3
	sethi 2097152, %o2
	or %g3, %o2, %o3
	or %l3, %o2, %i3
	std %l2, [%fp+-2960]
	or %l2, %o2, %i2
	std %i2, [%fp+-2976]
	or %g2, %l0, %i2
	st %i2, [%fp+-2984]
	mov	-1, %l4
	st %l0, [%fp+-2864]
	st %g3, [%fp+-2940]
	std %l6, [%fp+-2952]
	std %o2, [%fp+-2968]
	st %l4, [%fp+-2980]
.LBB2_10:
	ld [%fp+-2916], %i2
	ld [%i2], %o0
	ld [%i2+4], %g2
	std %g2, [%fp+-2520]
	ld [%i2+8], %l2
	ld [%i2+12], %g2
	std %g2, [%fp+-2528]
	ld [%i2+16], %g2
	std %g2, [%fp+-2496]
	ld [%i2+20], %g2
	std %g2, [%fp+-2472]
	ld [%i2+24], %g2
	std %g2, [%fp+-2488]
	ld [%i2+28], %i2
	std %i2, [%fp+-2480]
	add %i5, %l6, %l0
	ldd [%fp+-2960], %i2
	add %i5, %i3, %o5
	add %i5, %i2, %o4
	xor %o4, %o2, %i2
	ldd [%fp+-2976], %g2
	cmp %g2, %i2
	std %o4, [%fp+-2872]
	xor %o5, %o2, %i2
	bg	.LBB2_12
	mov	%l4, %g4
	mov	%l6, %g4
.LBB2_12:
	add %i5, %l7, %l1
	cmp %g3, %i2
	xor %l0, %o2, %i2
	mov	%l4, %g3
	bg	.LBB2_14
	ld [%fp+-2860], %g2
	mov	%l6, %g3
.LBB2_14:
	cmp %o2, %i2
	xor %l1, %o2, %i3
	mov	%l4, %o7
	bg	.LBB2_16
	ldd [%fp+-2496], %o4
	mov	%l6, %o7
.LBB2_16:
	cmp %o3, %i3
	mov	%o0, %o1
	ldd [%fp+-2520], %i2
	mov	%i2, %i3
	std %i2, [%fp+-2520]
	mov	%l2, %l3
	ldd [%fp+-2528], %i2
	mov	%i2, %i3
	std %i2, [%fp+-2528]
	mov	%o4, %o5
	ldd [%fp+-2472], %o2
	mov	%o2, %o3
	std %o2, [%fp+-2472]
	ldd [%fp+-2488], %o2
	mov	%o2, %o3
	ldd [%fp+-2480], %i2
	mov	%i2, %i3
	std %i2, [%fp+-2480]
	bg	.LBB2_18
	mov	%l4, %i3
	mov	%l6, %i3
.LBB2_18:
	cmp %g2, 0
	st %l5, [%fp+-2920]
	st %i1, [%fp+-2924]
	st %i0, [%fp+-2928]
	st %i4, [%fp+-2932]
	st %i5, [%fp+-2936]
	std %o2, [%fp+-2488]
	be	.LBB2_19
	std %o4, [%fp+-2496]
	std %l0, [%fp+-2880]
	add %i4, %i3, %l1
	add %i4, %o7, %l0
	std %l0, [%fp+-2888]
	ld [%i0], %i1
	st %i1, [%fp+-2892]
	ld [%i0+4], %i1
	st %i1, [%fp+-2896]
	ld [%i0+8], %i1
	st %i1, [%fp+-2900]
	ld [%i0+12], %i0
	st %i0, [%fp+-2904]
	add %i4, %g3, %i1
	mov	%g0, %i2
	add %i4, %g4, %i0
	std %i0, [%fp+-2912]
	ld [%fp+-2984], %o7
	st %i2, [%fp+-2856]
	mov	%i2, %i0
	ldd [%fp+-2480], %l4
	std %o2, [%fp+-2504]
	ldd [%fp+-2472], %i2
	std %i2, [%fp+-2536]
	std %o4, [%fp+-2512]
	ldd [%fp+-2528], %i2
	std %i2, [%fp+-2552]
	mov	%l2, %i4
	mov	%l3, %i5
	ldd [%fp+-2520], %i2
	std %i2, [%fp+-2544]
	mov	%o0, %l6
	mov	%o1, %l7
.LBB2_21:
	add %i0, 1, %i1
	st %i1, [%fp+-2556]
	cmp %i1, %g2
	be	.LBB2_23
	ld [%fp+-2852], %i1
	ld [%fp+-2856], %i1
.LBB2_23:
	st %i1, [%fp+-2568]
	sll %i0, 6, %g4
	ld [%fp+-2892], %l0
	add %l0, %g4, %i0
	ldub [%i0+14], %i1
	ldub [%i0+15], %i2
	ldub [%i0+12], %i3
	ldub [%i0+13], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -136, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+6], %i1
	ldub [%i0+7], %i2
	ldub [%i0+4], %i3
	ldub [%i0+5], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -264, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+10], %i1
	ldub [%i0+11], %i2
	ldub [%i0+8], %i3
	ldub [%i0+9], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	st %i1, [%fp+-136]
	ldub [%i0+2], %i1
	ldub [%i0+3], %i2
	ldub [%l0+%g4], %i3
	ldub [%i0+1], %i0
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %i0, %i0
	sll %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-264]
	ldd [%fp+-136], %i0
	std %i0, [%fp+-2352]
	ldd [%fp+-264], %i0
	std %i0, [%fp+-2400]
	ld [%fp+-2896], %l1
	add %l1, %g4, %i0
	ldub [%i0+14], %i1
	ldub [%i0+15], %i2
	ldub [%i0+12], %i3
	ldub [%i0+13], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -144, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+6], %i1
	ldub [%i0+7], %i2
	ldub [%i0+4], %i3
	ldub [%i0+5], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -272, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+10], %i1
	ldub [%i0+11], %i2
	ldub [%i0+8], %i3
	ldub [%i0+9], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	st %i1, [%fp+-144]
	ldub [%i0+2], %i1
	ldub [%i0+3], %i2
	ldub [%l1+%g4], %i3
	ldub [%i0+1], %i0
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %i0, %i0
	sll %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-272]
	ldd [%fp+-144], %i0
	std %i0, [%fp+-2360]
	ldd [%fp+-272], %i0
	std %i0, [%fp+-2408]
	ld [%fp+-2900], %o2
	add %o2, %g4, %i0
	ldub [%i0+14], %i1
	ldub [%i0+15], %i2
	ldub [%i0+12], %i3
	ldub [%i0+13], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -152, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+6], %i1
	ldub [%i0+7], %i2
	ldub [%i0+4], %i3
	ldub [%i0+5], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -280, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+10], %i1
	ldub [%i0+11], %i2
	ldub [%i0+8], %i3
	ldub [%i0+9], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	st %i1, [%fp+-152]
	ldub [%i0+2], %i1
	ldub [%i0+3], %i2
	ldub [%o2+%g4], %i3
	ldub [%i0+1], %i0
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %i0, %i0
	sll %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-280]
	ldd [%fp+-152], %i0
	std %i0, [%fp+-2368]
	ldd [%fp+-280], %i0
	std %i0, [%fp+-2248]
	ld [%fp+-2904], %o3
	add %o3, %g4, %i0
	ldub [%i0+14], %i1
	ldub [%i0+15], %i2
	ldub [%i0+12], %i3
	ldub [%i0+13], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -160, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+6], %i1
	ldub [%i0+7], %i2
	ldub [%i0+4], %i3
	ldub [%i0+5], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	add %fp, -288, %i2
	or %i2, 4, %i2
	st %i1, [%i2]
	ldub [%i0+10], %i1
	ldub [%i0+11], %i2
	ldub [%i0+8], %i3
	ldub [%i0+9], %g2
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %g2, %i2
	sll %i2, 16, %i2
	or %i2, %i1, %i1
	st %i1, [%fp+-160]
	ldub [%i0+2], %i1
	ldub [%i0+3], %i2
	ldub [%o3+%g4], %i3
	ldub [%i0+1], %i0
	sll %i1, 8, %i1
	or %i1, %i2, %i1
	sll %i3, 8, %i2
	or %i2, %i0, %i0
	sll %i0, 16, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-288]
	or %g4, 16, %i0
	add %l0, %i0, %i1
	ldub [%i1+14], %i2
	ldd [%fp+-160], %g2
	std %g2, [%fp+-2376]
	ldub [%i1+15], %i3
	sll %i2, 8, %i2
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	or %i2, %i3, %i2
	ldd [%fp+-288], %o4
	std %o4, [%fp+-2312]
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -40, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -168, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-40]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%l0+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-168]
	add %l1, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -48, %i3
	or %i3, 4, %i3
	ldd [%fp+-40], %g2
	std %g2, [%fp+-2288]
	ldd [%fp+-168], %o4
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -176, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-48]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%l1+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-176]
	add %o2, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -56, %i3
	or %i3, 4, %i3
	ldd [%fp+-48], %g2
	std %g2, [%fp+-2304]
	ldd [%fp+-176], %g2
	std %g2, [%fp+-2232]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -184, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-56]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%o2+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-184]
	add %o3, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -64, %i3
	or %i3, 4, %i3
	ldd [%fp+-56], %g2
	std %g2, [%fp+-2256]
	ldd [%fp+-184], %g2
	std %g2, [%fp+-2216]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -192, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-64]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%o3+%i0], %i0
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %i0, 16, %i0
	or %i0, %i2, %i0
	st %i0, [%fp+-192]
	or %g4, 32, %i0
	add %l0, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -72, %i3
	or %i3, 4, %i3
	ldd [%fp+-64], %g2
	std %g2, [%fp+-2264]
	ldd [%fp+-192], %g2
	std %g2, [%fp+-2224]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -200, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-72]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%l0+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-200]
	add %l1, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -80, %i3
	or %i3, 4, %i3
	ldd [%fp+-72], %g2
	std %g2, [%fp+-2384]
	ldd [%fp+-200], %g2
	std %g2, [%fp+-2456]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -208, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-80]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%l1+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-208]
	add %o2, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -88, %i3
	or %i3, 4, %i3
	ldd [%fp+-80], %g2
	std %g2, [%fp+-2392]
	ldd [%fp+-208], %g2
	std %g2, [%fp+-2464]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -216, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-88]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%o2+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-216]
	add %o3, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -96, %i3
	or %i3, 4, %i3
	ldd [%fp+-88], %g2
	std %g2, [%fp+-2296]
	ldd [%fp+-216], %g2
	std %g2, [%fp+-2336]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -224, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-96]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%o3+%i0], %i0
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %i0, 16, %i0
	or %i0, %i2, %i0
	st %i0, [%fp+-224]
	or %g4, 48, %i0
	add %l0, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -104, %i3
	or %i3, 4, %i3
	ldd [%fp+-96], %g2
	std %g2, [%fp+-2240]
	ldd [%fp+-224], %g2
	std %g2, [%fp+-2280]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -232, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-104]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%l0+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-232]
	add %l1, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -112, %i3
	or %i3, 4, %i3
	ldd [%fp+-104], %g2
	std %g2, [%fp+-2424]
	ldd [%fp+-232], %g2
	std %g2, [%fp+-2416]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -240, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-112]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%l1+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-240]
	add %o2, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -120, %i3
	or %i3, 4, %i3
	ldd [%fp+-112], %g2
	std %g2, [%fp+-2432]
	ldd [%fp+-240], %g2
	std %g2, [%fp+-2320]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -248, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-120]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%o2+%i0], %g2
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %i1, %i1
	sll %i1, 16, %i1
	or %i1, %i2, %i1
	st %i1, [%fp+-248]
	add %o3, %i0, %i1
	ldub [%i1+14], %i2
	ldub [%i1+15], %i3
	ldub [%i1+12], %g2
	ldub [%i1+13], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -128, %i3
	or %i3, 4, %i3
	ldd [%fp+-120], %g2
	std %g2, [%fp+-2440]
	ldd [%fp+-248], %g2
	std %g2, [%fp+-2272]
	st %i2, [%i3]
	ldub [%i1+6], %i2
	ldub [%i1+7], %i3
	ldub [%i1+4], %g2
	ldub [%i1+5], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	add %fp, -256, %i3
	or %i3, 4, %i3
	st %i2, [%i3]
	ldub [%i1+10], %i2
	ldub [%i1+11], %i3
	ldub [%i1+8], %g2
	ldub [%i1+9], %g3
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %g2, 8, %i3
	or %i3, %g3, %i3
	sll %i3, 16, %i3
	or %i3, %i2, %i2
	st %i2, [%fp+-128]
	ldub [%i1+2], %i2
	ldub [%i1+3], %i3
	ldub [%o3+%i0], %i0
	ldub [%i1+1], %i1
	sll %i2, 8, %i2
	or %i2, %i3, %i2
	sll %i0, 8, %i0
	or %i0, %i1, %i0
	sll %i0, 16, %i0
	or %i0, %i2, %i0
	st %i0, [%fp+-256]
	ldd [%fp+-128], %i0
	std %i0, [%fp+-2448]
	ldd [%fp+-256], %i0
	std %i0, [%fp+-2328]
	ld [%fp+-2568], %i0
	or %i0, %o7, %i0
	and %i0, 255, %o3
	ld [%fp+-2856], %i0
	ldd [%fp+-2880], %g2
.LBB2_24:
	add %i0, 4, %i0
	cmp %i0, 16
	bne	.LBB2_24
	nop
	ldd [%fp+-2512], %i2
	std %i2, [%fp+-2512]
	add %l7, %i3, %i0
	add %l6, %i2, %i1
	ldd [%fp+-2504], %l0
	std %l0, [%fp+-2504]
	add %i4, %l0, %i2
	add %i5, %l1, %i3
	ldd [%fp+-2488], %l0
	std %l0, [%fp+-2488]
	add %l2, %l0, %i4
	add %l3, %l1, %i5
	ldd [%fp+-2232], %l0
	add %i5, %l0, %l1
	add %i4, %o4, %l0
	ldd [%fp+-2224], %i4
	add %i3, %i4, %l3
	ldd [%fp+-2216], %i4
	add %i2, %i4, %l2
	ldd [%fp+-2248], %i2
	add %i1, %i2, %i4
	st %i4, [%fp+-2612]
	ldd [%fp+-2312], %i2
	add %i0, %i2, %i1
	st %i1, [%fp+-2608]
	std %l0, [%fp+-2568]
	st %l1, [%fp+-316]
	st %l0, [%fp+-308]
	std %l2, [%fp+-2576]
	st %l3, [%fp+-300]
	st %l2, [%fp+-292]
	add %fp, -316, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2600]
	add %fp, -308, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2604]
	add %fp, -300, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2588]
	add %fp, -292, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2592]
	ldd [%fp+-2872], %i2
	xor %i1, %i3, %i1
	xor %i4, %i2, %i0
	lduh [%fp+-292], %i2
	st %i2, [%fp+-2620]
	lduh [%fp+-300], %i2
	st %i2, [%fp+-2628]
	lduh [%fp+-308], %i2
	st %i2, [%fp+-2644]
	lduh [%fp+-316], %i2
	st %i2, [%fp+-2648]
	st %i0, [%fp+-356]
	st %i1, [%fp+-364]
	ldd [%fp+-2496], %i2
	std %i2, [%fp+-2496]
	add %o1, %i3, %i0
	add %o0, %i2, %i1
	ldd [%fp+-2400], %i2
	add %i1, %i2, %i4
	st %i4, [%fp+-2584]
	ldd [%fp+-2408], %i2
	add %i0, %i2, %i0
	st %i0, [%fp+-2580]
	xor %i0, %g3, %i1
	xor %i4, %g2, %i0
	st %i0, [%fp+-388]
	st %i1, [%fp+-396]
	ldd [%fp+-2536], %l0
	ldd [%fp+-2544], %i2
	add %i3, %l1, %i0
	add %i2, %l0, %i1
	ldd [%fp+-2368], %i2
	add %i1, %i2, %i4
	st %i4, [%fp+-2636]
	ldd [%fp+-2376], %i2
	add %i0, %i2, %i1
	st %i1, [%fp+-2664]
	add %fp, -356, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2632]
	add %fp, -364, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2640]
	add %fp, -388, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2616]
	add %fp, -396, %i0
	or %i0, 2, %i0
	std %o4, [%fp+-2344]
	lduh [%i0], %o4
	ldd [%fp+-2912], %i2
	xor %i1, %i3, %i1
	xor %i4, %i2, %i0
	lduh [%fp+-356], %o1
	lduh [%fp+-364], %o5
	lduh [%fp+-388], %l6
	lduh [%fp+-396], %l7
	st %i0, [%fp+-420]
	st %i1, [%fp+-428]
	ldd [%fp+-2472], %i4
	std %i4, [%fp+-2472]
	ldd [%fp+-2520], %i2
	add %i3, %i5, %i0
	add %i2, %i4, %i1
	ldd [%fp+-2352], %i2
	add %i1, %i2, %i4
	st %i4, [%fp+-2520]
	ldd [%fp+-2360], %i2
	add %i0, %i2, %i0
	st %i0, [%fp+-2544]
	ldd [%fp+-2888], %i2
	xor %i0, %i3, %i1
	xor %i4, %i2, %i0
	st %i0, [%fp+-1252]
	st %i1, [%fp+-1260]
	ldd [%fp+-2552], %i2
	add %i3, %l5, %i0
	add %i2, %l4, %i1
	ldd [%fp+-2256], %i2
	add %i1, %i2, %i1
	st %i1, [%fp+-2552]
	ldd [%fp+-2264], %i2
	add %i0, %i2, %i2
	st %i2, [%fp+-2652]
	add %fp, -420, %i0
	or %i0, 2, %i0
	lduh [%i0], %o0
	add %fp, -428, %i0
	or %i0, 2, %i0
	lduh [%i0], %o2
	add %fp, -1252, %i0
	or %i0, 2, %i0
	lduh [%i0], %g4
	add %fp, -1260, %i0
	or %i0, 2, %i0
	lduh [%i0], %g2
	std %l4, [%fp+-2672]
	xor %i2, %o3, %l5
	xor %i1, %o3, %l4
	lduh [%fp+-420], %g3
	lduh [%fp+-428], %i5
	lduh [%fp+-1252], %i2
	lduh [%fp+-1260], %i1
	st %l4, [%fp+-324]
	st %l5, [%fp+-332]
	ldd [%fp+-2480], %l4
	std %l4, [%fp+-2480]
	ldd [%fp+-2528], %l2
	add %l3, %l5, %i4
	add %l2, %l4, %l2
	ldd [%fp+-2288], %l4
	add %l2, %l4, %i0
	st %i0, [%fp+-2528]
	ldd [%fp+-2304], %l2
	add %i4, %l2, %i3
	st %i3, [%fp+-2596]
	xor %i3, %o3, %l5
	xor %i0, %o3, %l4
	st %l4, [%fp+-340]
	st %l5, [%fp+-348]
	add %fp, -324, %i4
	or %i4, 2, %i4
	lduh [%i4], %o7
	add %fp, -332, %i4
	or %i4, 2, %i4
	lduh [%i4], %l3
	add %fp, -340, %i4
	or %i4, 2, %i4
	lduh [%i4], %o3
	add %fp, -348, %i4
	or %i4, 2, %i4
	lduh [%i4], %l5
	add %fp, -400, %i4
	or %i4, 2, %i0
	lduh [%fp+-324], %l4
	lduh [%fp+-332], %l2
	lduh [%fp+-340], %i4
	lduh [%fp+-348], %i3
	sth %l7, [%i0]
	add %fp, -392, %i0
	or %i0, 2, %i0
	sth %l6, [%i0]
	sth %o4, [%fp+-400]
	ld [%fp+-2616], %i0
	sth %i0, [%fp+-392]
	add %fp, -368, %i0
	or %i0, 2, %i0
	ld [%fp+-400], %l6
	st %l6, [%fp+-2616]
	ld [%fp+-392], %l6
	st %l6, [%fp+-2624]
	sth %o5, [%i0]
	add %fp, -360, %i0
	or %i0, 2, %i0
	sth %o1, [%i0]
	ld [%fp+-2640], %i0
	sth %i0, [%fp+-368]
	ld [%fp+-2632], %i0
	sth %i0, [%fp+-360]
	add %fp, -1264, %i0
	or %i0, 2, %i0
	ld [%fp+-368], %o5
	ld [%fp+-360], %l6
	st %l6, [%fp+-2640]
	sth %i1, [%i0]
	add %fp, -1256, %i0
	or %i0, 2, %i0
	sth %i2, [%i0]
	sth %g2, [%fp+-1264]
	sth %g4, [%fp+-1256]
	add %fp, -432, %i0
	or %i0, 2, %i0
	ld [%fp+-1264], %i1
	st %i1, [%fp+-2632]
	ld [%fp+-1256], %o4
	sth %i5, [%i0]
	add %fp, -424, %i0
	or %i0, 2, %i0
	sth %g3, [%i0]
	sth %o2, [%fp+-432]
	sth %o0, [%fp+-424]
	add %fp, -320, %i0
	or %i0, 2, %i0
	ld [%fp+-432], %l7
	ld [%fp+-424], %o1
	ld [%fp+-2648], %i1
	sth %i1, [%i0]
	add %fp, -312, %i0
	or %i0, 2, %i0
	ld [%fp+-2644], %i1
	sth %i1, [%i0]
	ld [%fp+-2600], %i0
	xor %i0, 64, %i0
	sth %i0, [%fp+-320]
	ld [%fp+-2604], %i0
	xor %i0, 64, %i0
	sth %i0, [%fp+-312]
	add %fp, -304, %i0
	or %i0, 2, %i0
	ld [%fp+-320], %i1
	st %i1, [%fp+-2604]
	ld [%fp+-312], %i1
	st %i1, [%fp+-2600]
	ld [%fp+-2628], %i1
	sth %i1, [%i0]
	add %fp, -296, %i0
	or %i0, 2, %i0
	ld [%fp+-2620], %i1
	sth %i1, [%i0]
	ld [%fp+-2588], %i0
	xor %i0, 64, %i0
	sth %i0, [%fp+-304]
	ld [%fp+-2592], %i0
	xor %i0, 64, %i0
	sth %i0, [%fp+-296]
	add %fp, -352, %i0
	or %i0, 2, %i0
	ld [%fp+-304], %i1
	st %i1, [%fp+-2628]
	ld [%fp+-296], %i1
	st %i1, [%fp+-2620]
	sth %i3, [%i0]
	add %fp, -344, %i0
	or %i0, 2, %i0
	sth %i4, [%i0]
	sth %l5, [%fp+-352]
	sth %o3, [%fp+-344]
	add %fp, -336, %i0
	or %i0, 2, %i0
	ld [%fp+-352], %i1
	st %i1, [%fp+-2656]
	ld [%fp+-344], %i1
	st %i1, [%fp+-2660]
	sth %l2, [%i0]
	add %fp, -328, %i0
	or %i0, 2, %i0
	sth %l4, [%i0]
	sth %l3, [%fp+-336]
	sth %o7, [%fp+-328]
	sethi 1737337, %i0
	or %i0, 615, %o2
	add %l6, %o2, %i1
	st %i1, [%fp+-2588]
	add %o5, %o2, %i0
	mov	%o5, %l6
	st %i0, [%fp+-2592]
	ldd [%fp+-2512], %i2
	xor %i0, %i3, %i0
	xor %i1, %i2, %i1
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o3
	st %o3, [%fp+-2704]
	srl %i1, 12, %i0
	sll %i1, 20, %i1
	or %i1, %i0, %l2
	st %l2, [%fp+-2700]
	sethi 3070443, %i0
	or %i0, 645, %g4
	add %o1, %g4, %o0
	add %l7, %g4, %l3
	xor %l3, %l1, %i0
	xor %o0, %l0, %i1
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i3
	srl %i1, 12, %i0
	sll %i1, 20, %i1
	or %i1, %i0, %i1
	ld [%fp+-328], %g3
	ld [%fp+-336], %i5
	sethi 2708477, %i0
	or %i0, 314, %i0
	add %g3, %i0, %i4
	st %i4, [%fp+-2644]
	add %i5, %i0, %i2
	st %i2, [%fp+-2648]
	ldd [%fp+-2672], %l0
	xor %i2, %l1, %i2
	xor %i4, %l0, %i4
	srl %i2, 12, %g2
	sll %i2, 20, %i2
	or %i2, %g2, %o7
	st %o7, [%fp+-2680]
	srl %i4, 12, %i2
	sll %i4, 20, %i4
	or %i4, %i2, %o5
	st %o5, [%fp+-2692]
	ldd [%fp+-2376], %l0
	ld [%fp+-2664], %i2
	add %i2, %l1, %i2
	add %i2, %i3, %i2
	st %i2, [%fp+-2696]
	xor %i2, %l7, %i2
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %l7
	st %l7, [%fp+-2688]
	ldd [%fp+-2368], %l0
	ld [%fp+-2636], %i2
	add %i2, %l1, %i2
	add %i2, %i1, %i2
	st %i2, [%fp+-2712]
	xor %i2, %o1, %i4
	srl %i4, 8, %g2
	sll %i4, 24, %i4
	or %i4, %g2, %l0
	st %l0, [%fp+-2708]
	ldd [%fp+-2264], %l4
	ld [%fp+-2652], %i2
	add %i2, %l5, %i4
	add %i4, %o7, %i2
	st %i2, [%fp+-2664]
	xor %i2, %i5, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %l1
	st %l1, [%fp+-2760]
	ldd [%fp+-2256], %i4
	ld [%fp+-2552], %i2
	add %i2, %i5, %i4
	add %i4, %o5, %i2
	st %i2, [%fp+-2684]
	xor %i2, %g3, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %g3
	st %g3, [%fp+-2756]
	add %l7, %l3, %i2
	st %i2, [%fp+-2636]
	xor %i2, %i3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %g2
	st %g2, [%fp+-2676]
	add %l0, %o0, %i2
	st %i2, [%fp+-2652]
	xor %i2, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i5
	st %i5, [%fp+-2672]
	ldd [%fp+-2312], %i2
	ld [%fp+-2608], %i1
	add %i1, %i3, %i1
	ldd [%fp+-2248], %i2
	ld [%fp+-2612], %i4
	add %i4, %i3, %i3
	add %i3, %l2, %o1
	add %i1, %o3, %l7
	ldd [%fp+-2336], %i2
	add %o1, %i2, %i3
	add %i3, %i5, %i1
	st %i1, [%fp+-2552]
	ldd [%fp+-2280], %i2
	add %l7, %i2, %i3
	add %i3, %g2, %i2
	st %i2, [%fp+-2536]
	xor %i2, %l1, %i5
	xor %i1, %g3, %i4
	st %i4, [%fp+-436]
	st %i5, [%fp+-444]
	ld [%fp+-2624], %l3
	add %l3, %o2, %i2
	st %i2, [%fp+-2740]
	ld [%fp+-2616], %l2
	add %l2, %o2, %i1
	st %i1, [%fp+-2724]
	ldd [%fp+-2496], %i4
	xor %i1, %i5, %i3
	xor %i2, %i4, %i4
	srl %i3, 12, %i5
	sll %i3, 20, %i3
	or %i3, %i5, %o7
	st %o7, [%fp+-2752]
	srl %i4, 12, %i3
	sll %i4, 20, %i4
	or %i4, %i3, %o5
	st %o5, [%fp+-2744]
	add %o4, %g4, %i3
	ld [%fp+-2632], %l4
	add %l4, %g4, %i4
	ldd [%fp+-2472], %g2
	xor %i4, %g3, %i5
	xor %i3, %g2, %g2
	srl %i5, 12, %g3
	sll %i5, 20, %i5
	or %i5, %g3, %i5
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %g2
	ld [%fp+-2660], %l5
	add %l5, %i0, %i1
	st %i1, [%fp+-2784]
	ld [%fp+-2656], %o2
	add %o2, %i0, %i0
	st %i0, [%fp+-2788]
	ldd [%fp+-2480], %l0
	xor %i0, %l1, %i0
	xor %i1, %l0, %g3
	srl %i0, 12, %g4
	sll %i0, 20, %i0
	or %i0, %g4, %l0
	st %l0, [%fp+-2748]
	srl %g3, 12, %i0
	sll %g3, 20, %g3
	or %g3, %i0, %l1
	st %l1, [%fp+-2764]
	ldd [%fp+-2360], %i0
	ld [%fp+-2544], %i2
	add %i2, %i1, %i0
	add %i0, %i5, %o0
	xor %o0, %l4, %i0
	srl %i0, 8, %g3
	sll %i0, 24, %i0
	or %i0, %g3, %l4
	st %l4, [%fp+-2792]
	ldd [%fp+-2352], %i0
	ld [%fp+-2520], %i2
	add %i2, %i1, %i0
	add %i0, %g2, %o3
	xor %o3, %o4, %i0
	srl %i0, 8, %g3
	sll %i0, 24, %i0
	or %i0, %g3, %g4
	st %g4, [%fp+-2632]
	ldd [%fp+-2304], %i0
	ld [%fp+-2596], %i2
	add %i2, %i1, %i0
	add %i0, %l0, %i0
	st %i0, [%fp+-2472]
	xor %i0, %o2, %i0
	srl %i0, 8, %g3
	sll %i0, 24, %i0
	or %i0, %g3, %l0
	st %l0, [%fp+-2656]
	ldd [%fp+-2288], %i0
	ld [%fp+-2528], %i2
	add %i2, %i1, %i0
	add %i0, %l1, %i0
	st %i0, [%fp+-2480]
	xor %i0, %l5, %i0
	srl %i0, 8, %g3
	sll %i0, 24, %i0
	or %i0, %g3, %l5
	add %l4, %i4, %i0
	st %i0, [%fp+-2528]
	xor %i0, %i5, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i5
	st %i5, [%fp+-2596]
	add %g4, %i3, %i0
	st %i0, [%fp+-2520]
	xor %i0, %g2, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %g2
	st %g2, [%fp+-2544]
	ldd [%fp+-2408], %i0
	ld [%fp+-2580], %i2
	add %i2, %i1, %i0
	ldd [%fp+-2400], %i2
	ld [%fp+-2584], %i1
	add %i1, %i3, %i3
	add %i3, %o5, %g3
	add %i0, %o7, %i3
	ldd [%fp+-2456], %i0
	add %g3, %i0, %i4
	add %i4, %g2, %i2
	st %i2, [%fp+-2496]
	ldd [%fp+-2464], %i0
	add %i3, %i0, %i4
	add %i4, %i5, %i0
	st %i0, [%fp+-2512]
	xor %i0, %l0, %i5
	xor %i2, %l5, %i4
	st %i4, [%fp+-1268]
	st %i5, [%fp+-1276]
	sethi 990140, %i4
	or %i4, 882, %o4
	ld [%fp+-2620], %g4
	add %g4, %o4, %o5
	ld [%fp+-2628], %o2
	add %o2, %o4, %o7
	ldd [%fp+-2504], %i0
	xor %o7, %i1, %i4
	xor %o5, %i0, %i5
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %i0
	srl %i5, 12, %i4
	sll %i5, 20, %i5
	or %i5, %i4, %i1
	ldd [%fp+-2224], %i4
	ldd [%fp+-2576], %l0
	add %l1, %i5, %g2
	ldd [%fp+-2216], %i4
	add %l0, %i5, %i2
	xor %l7, %l6, %i4
	ld [%fp+-2640], %i5
	xor %o1, %i5, %l7
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %l6
	srl %l7, 8, %i4
	sll %l7, 24, %l7
	or %l7, %i4, %l4
	add %g2, %i0, %l7
	xor %l7, %o2, %g2
	srl %g2, 8, %o1
	sll %g2, 24, %g2
	or %g2, %o1, %o2
	add %i2, %i1, %l1
	xor %l1, %g4, %g2
	srl %g2, 8, %i2
	sll %g2, 24, %g2
	or %g2, %i2, %o1
	add %o2, %o7, %i2
	st %i2, [%fp+-2736]
	xor %i2, %i0, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g4
	st %g4, [%fp+-2728]
	add %o1, %o5, %i0
	st %i0, [%fp+-2732]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2720]
	ldd [%fp+-2240], %i0
	ld [%fp+-2696], %i2
	add %i2, %i0, %i0
	ldd [%fp+-2296], %i4
	ld [%fp+-2712], %i1
	add %i1, %i4, %i1
	add %i1, %g2, %i2
	st %i2, [%fp+-2696]
	add %i0, %g4, %i1
	st %i1, [%fp+-2716]
	add %fp, -436, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2660]
	add %fp, -444, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2712]
	add %fp, -1268, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2768]
	add %fp, -1276, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2776]
	xor %i1, %l6, %i1
	xor %i2, %l4, %i0
	lduh [%fp+-436], %i2
	st %i2, [%fp+-2772]
	lduh [%fp+-444], %i2
	st %i2, [%fp+-2780]
	lduh [%fp+-1268], %i2
	st %i2, [%fp+-2796]
	lduh [%fp+-1276], %i2
	st %i2, [%fp+-2800]
	st %i0, [%fp+-484]
	st %i1, [%fp+-492]
	ld [%fp+-2600], %g4
	add %g4, %o4, %l0
	ld [%fp+-2604], %i2
	add %i2, %o4, %o4
	ldd [%fp+-2488], %i4
	xor %o4, %i5, %i0
	xor %l0, %i4, %i1
	srl %i0, 12, %o5
	sll %i0, 20, %i0
	or %i0, %o5, %o5
	srl %i1, 12, %i0
	sll %i1, 20, %i1
	or %i1, %i0, %g2
	ldd [%fp+-2232], %i4
	ldd [%fp+-2568], %i0
	add %i1, %i5, %o7
	ldd [%fp+-2344], %i4
	add %i0, %i5, %i1
	xor %i3, %l2, %i3
	xor %g3, %l3, %i5
	srl %i3, 8, %g3
	sll %i3, 24, %i3
	or %i3, %g3, %l2
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %g3
	add %o7, %o5, %i4
	xor %i4, %i2, %i5
	srl %i5, 8, %o7
	sll %i5, 24, %i5
	or %i5, %o7, %i5
	add %i1, %g2, %i3
	xor %i3, %g4, %o7
	srl %o7, 8, %i1
	sll %o7, 24, %o7
	or %o7, %i1, %o7
	add %i5, %o4, %i0
	st %i0, [%fp+-2624]
	xor %i0, %o5, %i1
	srl %i1, 7, %o4
	sll %i1, 25, %i1
	or %i1, %o4, %g4
	st %g4, [%fp+-2628]
	add %o7, %l0, %i0
	st %i0, [%fp+-2620]
	xor %i0, %g2, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+-2580]
	ldd [%fp+-2392], %i0
	add %o0, %i0, %i0
	ldd [%fp+-2384], %o4
	add %o3, %o4, %i1
	add %i1, %i2, %i2
	st %i2, [%fp+-2488]
	add %i0, %g4, %i0
	st %i0, [%fp+-2576]
	xor %i0, %l2, %i1
	xor %i2, %g3, %i0
	st %i0, [%fp+-1316]
	st %i1, [%fp+-1324]
	ld [%fp+-2644], %i0
	ld [%fp+-2756], %i1
	add %i1, %i0, %i2
	st %i2, [%fp+-2756]
	ld [%fp+-2648], %i0
	ld [%fp+-2760], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2760]
	ld [%fp+-2680], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2616]
	ld [%fp+-2692], %i0
	xor %i2, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+-2608]
	ldd [%fp+-2328], %i0
	add %l7, %i0, %i0
	ldd [%fp+-2272], %o4
	add %l1, %o4, %i1
	add %i1, %i2, %i1
	st %i1, [%fp+-2604]
	add %i0, %g2, %i0
	st %i0, [%fp+-2612]
	ld [%fp+-2688], %i2
	xor %i0, %i2, %o5
	ld [%fp+-2708], %i0
	xor %i1, %i0, %o4
	add %fp, -484, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2808]
	add %fp, -492, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2812]
	add %fp, -1316, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2708]
	add %fp, -1324, %i0
	or %i0, 2, %i0
	lduh [%i0], %g4
	lduh [%fp+-484], %i0
	st %i0, [%fp+-2816]
	lduh [%fp+-492], %i0
	st %i0, [%fp+-2804]
	lduh [%fp+-1316], %o0
	lduh [%fp+-1324], %i2
	st %o4, [%fp+-452]
	st %o5, [%fp+-460]
	ld [%fp+-2784], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+-2648]
	ld [%fp+-2656], %i1
	ld [%fp+-2788], %g2
	add %i1, %g2, %i1
	st %i1, [%fp+-2656]
	ld [%fp+-2748], %g2
	xor %i1, %g2, %i1
	srl %i1, 7, %l3
	sll %i1, 25, %i1
	or %i1, %l3, %l0
	st %l0, [%fp+-2600]
	ld [%fp+-2764], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %l3
	sll %i1, 25, %i1
	or %i1, %l3, %g2
	st %g2, [%fp+-2584]
	ldd [%fp+-2320], %i0
	add %i4, %i0, %i1
	ldd [%fp+-2416], %o4
	add %i3, %o4, %i3
	add %i3, %g2, %i0
	st %i0, [%fp+-2504]
	add %i1, %l0, %i1
	st %i1, [%fp+-2568]
	ld [%fp+-2792], %i3
	xor %i1, %i3, %o5
	ld [%fp+-2632], %i1
	xor %i0, %i1, %o4
	st %o4, [%fp+-1284]
	st %o5, [%fp+-1292]
	ld [%fp+-2588], %i0
	add %l4, %i0, %i4
	st %i4, [%fp+-2640]
	ld [%fp+-2592], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+-2644]
	ld [%fp+-2704], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %l7
	ld [%fp+-2700], %i0
	xor %i4, %i0, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %o3
	ldd [%fp+-2448], %l0
	ld [%fp+-2664], %i0
	add %i0, %l0, %i3
	ldd [%fp+-2440], %l0
	ld [%fp+-2684], %i0
	add %i0, %l0, %i4
	add %i4, %o3, %i0
	st %i0, [%fp+-2592]
	add %i3, %l7, %i1
	st %i1, [%fp+-2748]
	xor %i1, %o2, %l1
	xor %i0, %o1, %l0
	add %fp, -452, %i3
	or %i3, 2, %i3
	lduh [%i3], %l3
	add %fp, -460, %i4
	or %i4, 2, %i4
	lduh [%i4], %i3
	add %fp, -1284, %i4
	or %i4, 2, %i4
	lduh [%i4], %l4
	add %fp, -1292, %i4
	or %i4, 2, %i4
	lduh [%i4], %l5
	lduh [%fp+-452], %l6
	lduh [%fp+-460], %o1
	lduh [%fp+-1284], %o2
	lduh [%fp+-1292], %o4
	st %l0, [%fp+-372]
	st %l1, [%fp+-380]
	ld [%fp+-2740], %i0
	add %g3, %i0, %i0
	st %i0, [%fp+-2588]
	ld [%fp+-2724], %i1
	add %l2, %i1, %i4
	st %i4, [%fp+-2632]
	ld [%fp+-2752], %i1
	xor %i4, %i1, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i1
	st %i1, [%fp+-2692]
	ld [%fp+-2744], %i4
	xor %i0, %i4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i0
	st %i0, [%fp+-2688]
	ldd [%fp+-2432], %g2
	ld [%fp+-2472], %i4
	add %i4, %g2, %i4
	ldd [%fp+-2424], %g2
	ld [%fp+-2480], %l0
	add %l0, %g2, %g2
	add %g2, %i0, %i0
	st %i0, [%fp+-2680]
	add %i4, %i1, %i1
	st %i1, [%fp+-2684]
	xor %i1, %i5, %i5
	xor %i0, %o7, %i4
	st %i4, [%fp+-404]
	st %i5, [%fp+-412]
	add %fp, -372, %i4
	or %i4, 2, %i4
	lduh [%i4], %i5
	add %fp, -380, %i4
	or %i4, 2, %i4
	lduh [%i4], %g3
	add %fp, -404, %i4
	or %i4, 2, %i4
	lduh [%i4], %g2
	add %fp, -412, %i4
	or %i4, 2, %i4
	lduh [%i4], %l0
	add %fp, -1280, %i4
	or %i4, 2, %i4
	lduh [%fp+-372], %o5
	lduh [%fp+-380], %o7
	lduh [%fp+-404], %l1
	lduh [%fp+-412], %i0
	ld [%fp+-2800], %i1
	sth %i1, [%i4]
	add %fp, -1272, %i4
	or %i4, 2, %i4
	ld [%fp+-2796], %i1
	sth %i1, [%i4]
	ld [%fp+-2776], %i1
	sth %i1, [%fp+-1280]
	ld [%fp+-2768], %i1
	sth %i1, [%fp+-1272]
	add %fp, -448, %i4
	or %i4, 2, %i4
	ld [%fp+-1280], %l2
	st %l2, [%fp+-2480]
	ld [%fp+-1272], %l2
	st %l2, [%fp+-2472]
	ld [%fp+-2780], %i1
	sth %i1, [%i4]
	add %fp, -440, %i4
	or %i4, 2, %i4
	ld [%fp+-2772], %i1
	sth %i1, [%i4]
	ld [%fp+-2712], %i1
	sth %i1, [%fp+-448]
	ld [%fp+-2660], %i1
	sth %i1, [%fp+-440]
	add %fp, -1328, %i4
	or %i4, 2, %i4
	ld [%fp+-448], %l2
	st %l2, [%fp+-2724]
	ld [%fp+-440], %i1
	st %i1, [%fp+-2740]
	sth %i2, [%i4]
	add %fp, -1320, %i4
	or %i4, 2, %i4
	sth %o0, [%i4]
	sth %g4, [%fp+-1328]
	ld [%fp+-2708], %i2
	sth %i2, [%fp+-1320]
	add %fp, -496, %i2
	or %i2, 2, %i2
	ld [%fp+-1328], %i4
	st %i4, [%fp+-2752]
	ld [%fp+-1320], %i4
	st %i4, [%fp+-2744]
	ld [%fp+-2804], %i4
	sth %i4, [%i2]
	add %fp, -488, %i2
	or %i2, 2, %i2
	ld [%fp+-2816], %i4
	sth %i4, [%i2]
	ld [%fp+-2812], %i2
	sth %i2, [%fp+-496]
	ld [%fp+-2808], %i2
	sth %i2, [%fp+-488]
	add %fp, -1296, %i2
	or %i2, 2, %g4
	ld [%fp+-496], %i2
	ld [%fp+-488], %i4
	sth %o4, [%g4]
	add %fp, -1288, %g4
	or %g4, 2, %g4
	sth %o2, [%g4]
	sth %l5, [%fp+-1296]
	sth %l4, [%fp+-1288]
	add %fp, -464, %g4
	or %g4, 2, %g4
	ld [%fp+-1296], %l4
	st %l4, [%fp+-2664]
	ld [%fp+-1288], %l4
	st %l4, [%fp+-2660]
	sth %o1, [%g4]
	add %fp, -456, %g4
	or %g4, 2, %g4
	sth %l6, [%g4]
	sth %i3, [%fp+-464]
	sth %l3, [%fp+-456]
	add %fp, -416, %i3
	or %i3, 2, %i3
	ld [%fp+-464], %g4
	st %g4, [%fp+-2712]
	ld [%fp+-456], %g4
	st %g4, [%fp+-2700]
	sth %i0, [%i3]
	add %fp, -408, %i0
	or %i0, 2, %i0
	sth %l1, [%i0]
	sth %l0, [%fp+-416]
	sth %g2, [%fp+-408]
	add %fp, -384, %i0
	or %i0, 2, %i0
	ld [%fp+-416], %g2
	ld [%fp+-408], %i3
	st %i3, [%fp+-2792]
	sth %o7, [%i0]
	add %fp, -376, %i0
	or %i0, 2, %i0
	sth %o5, [%i0]
	sth %g3, [%fp+-384]
	sth %i5, [%fp+-376]
	ld [%fp+-2736], %i0
	add %i0, %l2, %i3
	st %i3, [%fp+-2708]
	ld [%fp+-2676], %i0
	xor %i3, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l4
	st %l4, [%fp+-2768]
	ld [%fp+-2732], %i0
	add %i0, %i1, %i3
	st %i3, [%fp+-2732]
	ld [%fp+-2672], %i0
	xor %i3, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l5
	st %l5, [%fp+-2788]
	ld [%fp+-2760], %i0
	add %i0, %i2, %i0
	st %i0, [%fp+-2672]
	ld [%fp+-2728], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l2
	st %l2, [%fp+-2704]
	ld [%fp+-2756], %i0
	add %i0, %i4, %i0
	st %i0, [%fp+-2676]
	ld [%fp+-2720], %i1
	xor %i0, %i1, %i0
	ld [%fp+-384], %g4
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l3
	st %l3, [%fp+-2736]
	ld [%fp+-2636], %i0
	add %i0, %g4, %i3
	xor %i3, %l7, %i1
	ld [%fp+-376], %i0
	srl %i1, 12, %i5
	sll %i1, 20, %i1
	or %i1, %i5, %g3
	ld [%fp+-2652], %i1
	add %i1, %i0, %l6
	xor %l6, %o3, %i1
	srl %i1, 12, %i5
	sll %i1, 20, %i1
	or %i1, %i5, %o4
	ldd [%fp+-2240], %l0
	ld [%fp+-2716], %i1
	add %i1, %l1, %i1
	add %i1, %l2, %i1
	st %i1, [%fp+-2636]
	xor %i1, %i2, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %l2
	st %l2, [%fp+-2772]
	ldd [%fp+-2296], %l0
	ld [%fp+-2696], %i1
	add %i1, %l1, %i1
	add %i1, %l3, %i1
	st %i1, [%fp+-2760]
	xor %i1, %i4, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %l0
	st %l0, [%fp+-2776]
	ldd [%fp+-2448], %i4
	ld [%fp+-2748], %i1
	add %i1, %i5, %i1
	add %i1, %g3, %i1
	st %i1, [%fp+-2716]
	xor %i1, %g4, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i2
	st %i2, [%fp+-2756]
	ldd [%fp+-2440], %i4
	ld [%fp+-2592], %i1
	add %i1, %i5, %i1
	add %i1, %o4, %i1
	st %i1, [%fp+-2748]
	xor %i1, %i0, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2764]
	add %i2, %i3, %i0
	st %i0, [%fp+-2652]
	xor %i0, %g3, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+-2728]
	add %i4, %l6, %i0
	st %i0, [%fp+-2696]
	xor %i0, %o4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2720]
	ldd [%fp+-2280], %i0
	ld [%fp+-2536], %i2
	add %i2, %i1, %i1
	ldd [%fp+-2336], %i2
	ld [%fp+-2552], %i0
	add %i0, %i3, %i0
	add %i0, %l5, %l7
	add %i1, %l4, %i0
	st %i0, [%fp+-2800]
	ldd [%fp+-2368], %o2
	add %l7, %o2, %i1
	add %i1, %i4, %i2
	st %i2, [%fp+-2592]
	ldd [%fp+-2376], %o0
	add %i0, %o0, %i1
	add %i1, %i5, %i1
	st %i1, [%fp+-2552]
	xor %i1, %l2, %i5
	xor %i2, %l0, %i4
	st %i4, [%fp+-516]
	st %i5, [%fp+-524]
	ld [%fp+-2624], %i1
	ld [%fp+-2480], %i2
	add %i1, %i2, %i2
	st %i2, [%fp+-2624]
	ld [%fp+-2596], %i1
	xor %i2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l6
	st %l6, [%fp+-2836]
	ld [%fp+-2620], %i1
	ld [%fp+-2472], %i2
	add %i1, %i2, %i0
	st %i0, [%fp+-2828]
	ld [%fp+-2544], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i3
	st %i3, [%fp+-2824]
	ld [%fp+-2656], %i1
	ld [%fp+-2752], %g3
	add %i1, %g3, %i2
	st %i2, [%fp+-2596]
	ld [%fp+-2628], %i1
	xor %i2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l2
	st %l2, [%fp+-2780]
	ld [%fp+-2648], %i1
	ld [%fp+-2744], %i5
	add %i1, %i5, %i2
	st %i2, [%fp+-2656]
	ld [%fp+-2580], %i1
	xor %i2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o5
	st %o5, [%fp+-2784]
	ld [%fp+-2528], %i1
	add %i1, %g2, %i4
	ld [%fp+-2692], %i1
	xor %i4, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g4
	ld [%fp+-2520], %i1
	ld [%fp+-2792], %l0
	add %i1, %l0, %l1
	ld [%fp+-2688], %i1
	xor %l1, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l3
	ldd [%fp+-2392], %l4
	ld [%fp+-2576], %i1
	add %i1, %l5, %i1
	add %i1, %l2, %i0
	st %i0, [%fp+-2620]
	xor %i0, %g3, %i1
	srl %i1, 8, %l4
	sll %i1, 24, %i1
	or %i1, %l4, %i0
	st %i0, [%fp+-2692]
	ldd [%fp+-2384], %l4
	ld [%fp+-2488], %i1
	add %i1, %l5, %i1
	add %i1, %o5, %o4
	xor %o4, %i5, %l4
	srl %l4, 8, %l5
	sll %l4, 24, %l4
	or %l4, %l5, %o5
	st %o5, [%fp+-2796]
	ldd [%fp+-2432], %l4
	ld [%fp+-2684], %i1
	add %i1, %l5, %l4
	add %l4, %g4, %i1
	st %i1, [%fp+-2628]
	xor %i1, %g2, %g2
	srl %g2, 8, %l4
	sll %g2, 24, %g2
	or %g2, %l4, %i2
	st %i2, [%fp+-2684]
	ldd [%fp+-2424], %l4
	ld [%fp+-2680], %i1
	add %i1, %l5, %g2
	add %g2, %l3, %i1
	st %i1, [%fp+-2680]
	xor %i1, %l0, %g2
	srl %g2, 8, %l2
	sll %g2, 24, %g2
	or %g2, %l2, %i5
	st %i5, [%fp+-2792]
	add %i2, %i4, %i1
	st %i1, [%fp+-2544]
	xor %i1, %g4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %g4
	st %g4, [%fp+-2580]
	add %i5, %l1, %i1
	st %i1, [%fp+-2536]
	xor %i1, %l3, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l4
	st %l4, [%fp+-2576]
	ldd [%fp+-2464], %i4
	ld [%fp+-2512], %i1
	add %i1, %i5, %i4
	ldd [%fp+-2456], %l0
	ld [%fp+-2496], %i1
	add %i1, %l1, %g2
	add %g2, %i3, %o7
	add %i4, %l6, %g3
	ldd [%fp+-2352], %l2
	add %o7, %l2, %i4
	add %i4, %l4, %i1
	st %i1, [%fp+-2488]
	ldd [%fp+-2360], %l0
	add %g3, %l0, %i4
	add %i4, %g4, %i4
	st %i4, [%fp+-2496]
	xor %i4, %i0, %l5
	xor %i1, %o5, %l4
	st %l4, [%fp+-1348]
	st %l5, [%fp+-1356]
	ld [%fp+-2644], %i1
	ld [%fp+-2712], %g4
	add %i1, %g4, %i0
	st %i0, [%fp+-2808]
	ld [%fp+-2616], %i1
	xor %i0, %i1, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %l5
	st %l5, [%fp+-2812]
	ld [%fp+-2640], %i1
	ld [%fp+-2700], %l4
	add %i1, %l4, %i0
	st %i0, [%fp+-2820]
	ld [%fp+-2608], %i1
	xor %i0, %i1, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %i5
	st %i5, [%fp+-2816]
	ld [%fp+-2724], %i1
	ld [%fp+-2800], %i0
	xor %i0, %i1, %i3
	ld [%fp+-2740], %i1
	xor %l7, %i1, %i4
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %i2
	st %i2, [%fp+-2800]
	srl %i4, 8, %i3
	sll %i4, 24, %i4
	or %i4, %i3, %l6
	st %l6, [%fp+-2804]
	ldd [%fp+-2328], %i0
	ld [%fp+-2612], %i3
	add %i3, %i1, %i3
	add %i3, %l5, %l5
	xor %l5, %g4, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o5
	ldd [%fp+-2272], %i0
	ld [%fp+-2604], %i3
	add %i3, %i1, %i3
	add %i3, %i5, %g4
	xor %g4, %l4, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l4
	ld [%fp+-2708], %i0
	add %i2, %i0, %i0
	st %i0, [%fp+-2528]
	ld [%fp+-2768], %i1
	xor %i0, %i1, %i3
	srl %i3, 7, %g2
	sll %i3, 25, %i3
	or %i3, %g2, %i2
	st %i2, [%fp+-2768]
	ld [%fp+-2732], %i0
	add %l6, %i0, %i0
	st %i0, [%fp+-2520]
	ld [%fp+-2788], %i1
	xor %i0, %i1, %i3
	srl %i3, 7, %g2
	sll %i3, 25, %i3
	or %i3, %g2, %i1
	st %i1, [%fp+-2688]
	ld [%fp+-2636], %i0
	add %i0, %o1, %i3
	ld [%fp+-2760], %i0
	add %i0, %o3, %g2
	add %g2, %i1, %i4
	st %i4, [%fp+-2640]
	add %i3, %i2, %i0
	st %i0, [%fp+-2648]
	add %fp, -516, %i3
	or %i3, 2, %i3
	lduh [%i3], %i1
	st %i1, [%fp+-2644]
	add %fp, -524, %i3
	or %i3, 2, %i3
	lduh [%i3], %i1
	st %i1, [%fp+-2712]
	add %fp, -1348, %i3
	or %i3, 2, %i3
	lduh [%i3], %i1
	st %i1, [%fp+-2724]
	add %fp, -1356, %i3
	or %i3, 2, %i3
	lduh [%i3], %i1
	st %i1, [%fp+-2740]
	xor %i0, %o5, %i1
	xor %i4, %l4, %i0
	lduh [%fp+-516], %i2
	st %i2, [%fp+-2732]
	lduh [%fp+-524], %i2
	st %i2, [%fp+-2744]
	lduh [%fp+-1348], %i2
	st %i2, [%fp+-2752]
	lduh [%fp+-1356], %i2
	st %i2, [%fp+-2788]
	st %i0, [%fp+-548]
	st %i1, [%fp+-556]
	ld [%fp+-2632], %i0
	ld [%fp+-2664], %i3
	add %i0, %i3, %i1
	st %i1, [%fp+-2700]
	ld [%fp+-2600], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2832]
	ld [%fp+-2588], %i0
	ld [%fp+-2660], %l6
	add %i0, %l6, %g2
	ld [%fp+-2584], %i0
	xor %g2, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	ld [%fp+-2480], %i0
	xor %g3, %i0, %i0
	ld [%fp+-2472], %i1
	xor %o7, %i1, %i1
	srl %i0, 8, %i2
	sll %i0, 24, %i0
	or %i0, %i2, %o7
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %o0
	ldd [%fp+-2320], %i0
	ld [%fp+-2568], %i2
	add %i2, %i1, %i0
	add %i0, %i4, %i4
	xor %i4, %i3, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %i3
	ldd [%fp+-2416], %i0
	ld [%fp+-2504], %i2
	add %i2, %i1, %i1
	add %i1, %o1, %i2
	xor %i2, %l6, %i1
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %i1
	ld [%fp+-2624], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+-2512]
	ld [%fp+-2836], %i5
	xor %i0, %i5, %i0
	srl %i0, 7, %l6
	sll %i0, 25, %i0
	or %i0, %l6, %l7
	st %l7, [%fp+-2636]
	ld [%fp+-2828], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+-2504]
	ld [%fp+-2824], %i5
	xor %i0, %i5, %i0
	srl %i0, 7, %l6
	sll %i0, 25, %i0
	or %i0, %l6, %l6
	st %l6, [%fp+-2632]
	ld [%fp+-2620], %i0
	add %i0, %l1, %i0
	add %o4, %l3, %g3
	add %g3, %l6, %g3
	st %g3, [%fp+-2620]
	add %i0, %l7, %i0
	st %i0, [%fp+-2624]
	xor %i0, %i3, %l7
	xor %g3, %i1, %l6
	st %l6, [%fp+-1380]
	st %l7, [%fp+-1388]
	ld [%fp+-2676], %i0
	ld [%fp+-2776], %i5
	add %i5, %i0, %i5
	st %i5, [%fp+-2760]
	ld [%fp+-2672], %i0
	ld [%fp+-2772], %g3
	add %g3, %i0, %g3
	st %g3, [%fp+-2772]
	ld [%fp+-2704], %i0
	xor %g3, %i0, %i0
	srl %i0, 7, %g3
	sll %i0, 25, %i0
	or %i0, %g3, %l0
	st %l0, [%fp+-2616]
	ld [%fp+-2736], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %g3
	sll %i0, 25, %i0
	or %i0, %g3, %g3
	st %g3, [%fp+-2608]
	ldd [%fp+-2264], %l6
	add %l5, %l7, %i0
	ldd [%fp+-2256], %l6
	add %g4, %l7, %i5
	add %i5, %g3, %i5
	st %i5, [%fp+-2604]
	add %i0, %l0, %i0
	st %i0, [%fp+-2612]
	ld [%fp+-2756], %g3
	xor %i0, %g3, %l7
	ld [%fp+-2764], %i0
	xor %i5, %i0, %l6
	add %fp, -548, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2664]
	add %fp, -556, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2672]
	add %fp, -1380, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2824]
	add %fp, -1388, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2828]
	lduh [%fp+-548], %i0
	st %i0, [%fp+-2736]
	lduh [%fp+-556], %i0
	st %i0, [%fp+-2776]
	lduh [%fp+-1380], %i0
	st %i0, [%fp+-2836]
	lduh [%fp+-1388], %i0
	st %i0, [%fp+-2764]
	st %l6, [%fp+-500]
	st %l7, [%fp+-508]
	ld [%fp+-2656], %i0
	ld [%fp+-2796], %i5
	add %i5, %i0, %g3
	st %g3, [%fp+-2656]
	ld [%fp+-2596], %i0
	ld [%fp+-2692], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+-2660]
	ld [%fp+-2780], %i5
	xor %i0, %i5, %i0
	srl %i0, 7, %i5
	sll %i0, 25, %i0
	or %i0, %i5, %g4
	st %g4, [%fp+-2600]
	ld [%fp+-2784], %i0
	xor %g3, %i0, %i0
	srl %i0, 7, %i5
	sll %i0, 25, %i0
	or %i0, %i5, %g3
	st %g3, [%fp+-2596]
	ldd [%fp+-2304], %l6
	add %i4, %l7, %i0
	ldd [%fp+-2288], %i4
	add %i2, %i5, %i2
	add %i2, %g3, %i2
	st %i2, [%fp+-2584]
	add %i0, %g4, %i0
	st %i0, [%fp+-2588]
	ld [%fp+-2684], %i4
	xor %i0, %i4, %i5
	ld [%fp+-2792], %i0
	xor %i2, %i0, %i4
	st %i4, [%fp+-1332]
	st %i5, [%fp+-1340]
	ld [%fp+-2820], %i0
	add %l4, %i0, %o4
	ld [%fp+-2808], %i0
	add %o5, %i0, %l1
	ld [%fp+-2812], %i0
	xor %l1, %i0, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g4
	st %g4, [%fp+-2704]
	ld [%fp+-2816], %i0
	xor %o4, %i0, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g3
	st %g3, [%fp+-2756]
	ldd [%fp+-2224], %i4
	ld [%fp+-2716], %i0
	add %i0, %i4, %i0
	ldd [%fp+-2216], %i4
	ld [%fp+-2748], %i2
	add %i2, %i4, %i2
	add %i2, %g3, %i2
	st %i2, [%fp+-2568]
	add %i0, %g4, %i0
	st %i0, [%fp+-2676]
	ld [%fp+-2800], %i4
	xor %i0, %i4, %l7
	ld [%fp+-2804], %i0
	xor %i2, %i0, %l6
	add %fp, -500, %i2
	or %i2, 2, %i2
	lduh [%i2], %o5
	add %fp, -508, %i2
	or %i2, 2, %i2
	lduh [%i2], %o3
	add %fp, -1332, %i2
	or %i2, 2, %i2
	lduh [%i2], %l0
	add %fp, -1340, %i2
	or %i2, 2, %i2
	lduh [%i2], %g4
	lduh [%fp+-500], %o2
	lduh [%fp+-508], %l3
	lduh [%fp+-1332], %g3
	lduh [%fp+-1340], %i5
	st %l6, [%fp+-468]
	st %l7, [%fp+-476]
	add %i1, %g2, %i0
	st %i0, [%fp+-2708]
	ld [%fp+-2700], %i1
	add %i3, %i1, %i1
	st %i1, [%fp+-2716]
	ld [%fp+-2832], %i2
	xor %i1, %i2, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i4
	st %i4, [%fp+-2700]
	xor %i0, %o1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i2
	st %i2, [%fp+-2692]
	ldd [%fp+-2232], %i0
	ld [%fp+-2628], %i3
	add %i3, %i0, %i1
	ldd [%fp+-2344], %l4
	ld [%fp+-2680], %i0
	add %i0, %l4, %i3
	add %i3, %i2, %i0
	st %i0, [%fp+-2680]
	add %i1, %i4, %i1
	st %i1, [%fp+-2684]
	xor %i1, %o7, %l5
	xor %i0, %o0, %l4
	st %l4, [%fp+-1300]
	st %l5, [%fp+-1308]
	add %fp, -468, %i1
	or %i1, 2, %i1
	lduh [%i1], %i3
	add %fp, -476, %i1
	or %i1, 2, %i1
	lduh [%i1], %g2
	add %fp, -1300, %i1
	or %i1, 2, %i1
	lduh [%i1], %i2
	add %fp, -1308, %l2
	or %l2, 2, %l2
	lduh [%l2], %l6
	add %fp, -1360, %l2
	or %l2, 2, %l2
	lduh [%fp+-468], %o0
	lduh [%fp+-476], %o1
	lduh [%fp+-1300], %l5
	lduh [%fp+-1308], %l4
	ld [%fp+-2788], %i0
	sth %i0, [%l2]
	add %fp, -1352, %l2
	or %l2, 2, %l2
	ld [%fp+-2752], %i0
	sth %i0, [%l2]
	ld [%fp+-2740], %i0
	sth %i0, [%fp+-1360]
	ld [%fp+-2724], %i0
	sth %i0, [%fp+-1352]
	add %fp, -528, %l2
	or %l2, 2, %l2
	ld [%fp+-1360], %i0
	st %i0, [%fp+-2480]
	ld [%fp+-1352], %i0
	st %i0, [%fp+-2472]
	ld [%fp+-2744], %i0
	sth %i0, [%l2]
	add %fp, -520, %l2
	or %l2, 2, %l2
	ld [%fp+-2732], %i0
	sth %i0, [%l2]
	ld [%fp+-2712], %i0
	sth %i0, [%fp+-528]
	ld [%fp+-2644], %i0
	sth %i0, [%fp+-520]
	add %fp, -1392, %l2
	or %l2, 2, %l2
	ld [%fp+-528], %i1
	st %i1, [%fp+-2724]
	ld [%fp+-520], %i4
	st %i4, [%fp+-2732]
	ld [%fp+-2764], %i0
	sth %i0, [%l2]
	add %fp, -1384, %l2
	or %l2, 2, %l2
	ld [%fp+-2836], %i0
	sth %i0, [%l2]
	ld [%fp+-2828], %i0
	sth %i0, [%fp+-1392]
	ld [%fp+-2824], %i0
	sth %i0, [%fp+-1384]
	add %fp, -560, %l2
	or %l2, 2, %l2
	ld [%fp+-1392], %i0
	st %i0, [%fp+-2740]
	ld [%fp+-1384], %i0
	st %i0, [%fp+-2744]
	ld [%fp+-2776], %i0
	sth %i0, [%l2]
	add %fp, -552, %l2
	or %l2, 2, %l2
	ld [%fp+-2736], %i0
	sth %i0, [%l2]
	ld [%fp+-2672], %i0
	sth %i0, [%fp+-560]
	ld [%fp+-2664], %i0
	sth %i0, [%fp+-552]
	add %fp, -1344, %l2
	or %l2, 2, %i0
	ld [%fp+-560], %o7
	ld [%fp+-552], %l2
	sth %i5, [%i0]
	add %fp, -1336, %i0
	or %i0, 2, %i0
	sth %g3, [%i0]
	sth %g4, [%fp+-1344]
	sth %l0, [%fp+-1336]
	add %fp, -512, %i0
	or %i0, 2, %i0
	ld [%fp+-1344], %i5
	st %i5, [%fp+-2672]
	ld [%fp+-1336], %i5
	st %i5, [%fp+-2664]
	sth %l3, [%i0]
	add %fp, -504, %i0
	or %i0, 2, %i0
	sth %o2, [%i0]
	sth %o3, [%fp+-512]
	sth %o5, [%fp+-504]
	add %fp, -1312, %i0
	or %i0, 2, %i0
	ld [%fp+-512], %o3
	ld [%fp+-504], %i5
	st %i5, [%fp+-2712]
	sth %l4, [%i0]
	add %fp, -1304, %i0
	or %i0, 2, %i0
	sth %l5, [%i0]
	sth %l6, [%fp+-1312]
	sth %i2, [%fp+-1304]
	add %fp, -480, %i0
	or %i0, 2, %i2
	ld [%fp+-1312], %i0
	ld [%fp+-1304], %o5
	sth %o1, [%i2]
	add %fp, -472, %i2
	or %i2, 2, %i2
	sth %o0, [%i2]
	sth %g2, [%fp+-480]
	sth %i3, [%fp+-472]
	add %l1, %i1, %i2
	st %i2, [%fp+-2628]
	ld [%fp+-2728], %i1
	xor %i2, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %l6
	st %l6, [%fp+-2752]
	add %o4, %i4, %i2
	st %i2, [%fp+-2644]
	ld [%fp+-2720], %i1
	xor %i2, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %o0
	st %o0, [%fp+-2748]
	ld [%fp+-2652], %i2
	add %i2, %o7, %g2
	ld [%fp+-2768], %i1
	xor %g2, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i3
	ld [%fp+-2696], %i1
	add %i1, %l2, %g3
	ld [%fp+-2688], %i1
	xor %g3, %i1, %i2
	ld [%fp+-480], %l1
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %i5
	ld [%fp+-2772], %i1
	add %i1, %l1, %i1
	st %i1, [%fp+-2652]
	ld [%fp+-2704], %i2
	xor %i1, %i2, %i2
	ld [%fp+-472], %i4
	srl %i2, 12, %g4
	sll %i2, 20, %i2
	or %i2, %g4, %i1
	st %i1, [%fp+-2736]
	ld [%fp+-2760], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+-2704]
	ld [%fp+-2756], %g4
	xor %i2, %g4, %i2
	srl %i2, 12, %g4
	sll %i2, 20, %i2
	or %i2, %g4, %o1
	st %o1, [%fp+-2760]
	ldd [%fp+-2240], %l4
	ld [%fp+-2648], %i2
	add %i2, %l4, %i2
	add %i2, %i3, %i2
	st %i2, [%fp+-2764]
	xor %i2, %o7, %i2
	srl %i2, 8, %g4
	sll %i2, 24, %i2
	or %i2, %g4, %o2
	st %o2, [%fp+-2728]
	ldd [%fp+-2296], %l4
	ld [%fp+-2640], %i2
	add %i2, %l4, %i2
	add %i2, %i5, %i2
	st %i2, [%fp+-2768]
	xor %i2, %l2, %i2
	srl %i2, 8, %g4
	sll %i2, 24, %i2
	or %i2, %g4, %l4
	st %l4, [%fp+-2756]
	ldd [%fp+-2328], %l2
	ld [%fp+-2676], %i2
	add %i2, %l3, %i2
	add %i2, %i1, %i2
	st %i2, [%fp+-2696]
	xor %i2, %l1, %i2
	srl %i2, 8, %g4
	sll %i2, 24, %i2
	or %i2, %g4, %l2
	st %l2, [%fp+-2788]
	ldd [%fp+-2272], %l0
	ld [%fp+-2568], %i1
	add %i1, %l1, %i2
	add %i2, %o1, %i1
	st %i1, [%fp+-2720]
	xor %i1, %i4, %i2
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %g4
	st %g4, [%fp+-2784]
	add %o2, %g2, %i2
	st %i2, [%fp+-2640]
	xor %i2, %i3, %i2
	srl %i2, 7, %i3
	sll %i2, 25, %i2
	or %i2, %i3, %g2
	st %g2, [%fp+-2688]
	add %l4, %g3, %i2
	st %i2, [%fp+-2648]
	xor %i2, %i5, %i2
	srl %i2, 7, %i3
	sll %i2, 25, %i2
	or %i2, %i3, %i1
	st %i1, [%fp+-2676]
	ldd [%fp+-2264], %i2
	ld [%fp+-2552], %i4
	add %i4, %i2, %i3
	ldd [%fp+-2256], %i4
	ld [%fp+-2592], %i2
	add %i2, %i4, %i2
	add %i2, %o0, %o7
	add %i3, %l6, %i4
	st %i4, [%fp+-2792]
	ldd [%fp+-2248], %i2
	add %o7, %i3, %i3
	add %i3, %i1, %i2
	st %i2, [%fp+-2552]
	ldd [%fp+-2312], %l6
	add %i4, %l7, %i3
	add %i3, %g2, %i3
	st %i3, [%fp+-2568]
	xor %i3, %l2, %i5
	xor %i2, %g4, %i4
	st %i4, [%fp+-564]
	st %i5, [%fp+-572]
	ld [%fp+-2716], %i1
	ld [%fp+-2480], %i2
	add %i1, %i2, %i1
	st %i1, [%fp+-2772]
	ld [%fp+-2580], %i2
	xor %i1, %i2, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %l5
	st %l5, [%fp+-2776]
	ld [%fp+-2472], %i1
	ld [%fp+-2708], %i2
	add %i2, %i1, %i1
	st %i1, [%fp+-2780]
	ld [%fp+-2576], %i2
	xor %i1, %i2, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %l4
	st %l4, [%fp+-2708]
	ld [%fp+-2544], %i2
	ld [%fp+-2740], %l3
	add %i2, %l3, %i3
	ld [%fp+-2636], %i2
	xor %i3, %i2, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %i4
	ld [%fp+-2536], %i2
	ld [%fp+-2744], %l2
	add %i2, %l2, %g2
	ld [%fp+-2632], %i2
	xor %g2, %i2, %i5
	srl %i5, 12, %g3
	sll %i5, 20, %i5
	or %i5, %g3, %g3
	ld [%fp+-2660], %i1
	add %i1, %i0, %i2
	st %i2, [%fp+-2592]
	ld [%fp+-2700], %i1
	xor %i2, %i1, %i5
	srl %i5, 12, %g4
	sll %i5, 20, %i5
	or %i5, %g4, %o0
	st %o0, [%fp+-2812]
	ld [%fp+-2656], %i1
	add %i1, %o5, %i2
	st %i2, [%fp+-2656]
	ld [%fp+-2692], %i1
	xor %i2, %i1, %i5
	srl %i5, 12, %g4
	sll %i5, 20, %i5
	or %i5, %g4, %o1
	st %o1, [%fp+-2816]
	ldd [%fp+-2392], %l0
	ld [%fp+-2624], %i2
	add %i2, %l0, %i5
	add %i5, %i4, %o4
	xor %o4, %l3, %i5
	srl %i5, 8, %g4
	sll %i5, 24, %i5
	or %i5, %g4, %l3
	st %l3, [%fp+-2692]
	ldd [%fp+-2384], %l0
	ld [%fp+-2620], %i2
	add %i2, %l0, %i5
	add %i5, %g3, %o2
	xor %o2, %l2, %i5
	srl %i5, 8, %g4
	sll %i5, 24, %i5
	or %i5, %g4, %i2
	st %i2, [%fp+-2824]
	ldd [%fp+-2320], %l0
	ld [%fp+-2684], %i1
	add %i1, %l1, %i5
	add %i5, %o0, %i1
	st %i1, [%fp+-2660]
	xor %i1, %i0, %i0
	srl %i0, 8, %i5
	sll %i0, 24, %i0
	or %i0, %i5, %i5
	st %i5, [%fp+-2684]
	ldd [%fp+-2416], %l0
	ld [%fp+-2680], %i0
	add %i0, %l1, %i0
	add %i0, %o1, %i0
	st %i0, [%fp+-2680]
	xor %i0, %o5, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+-2828]
	add %l3, %i3, %i0
	st %i0, [%fp+-2544]
	xor %i0, %i4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2580]
	add %i2, %g2, %i0
	st %i0, [%fp+-2536]
	xor %i0, %g3, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2576]
	ldd [%fp+-2304], %i0
	ld [%fp+-2496], %i2
	add %i2, %i0, %i0
	ldd [%fp+-2288], %i2
	ld [%fp+-2488], %i1
	add %i1, %i2, %i1
	add %i1, %l4, %o0
	add %i0, %l5, %g4
	ldd [%fp+-2400], %l2
	add %o0, %l3, %i3
	add %i3, %g2, %i0
	st %i0, [%fp+-2488]
	ldd [%fp+-2408], %l0
	add %g4, %l1, %i3
	add %i3, %i4, %i1
	st %i1, [%fp+-2496]
	xor %i1, %i5, %g3
	xor %i0, %o1, %g2
	st %g2, [%fp+-1396]
	st %g3, [%fp+-1404]
	ld [%fp+-2528], %i0
	mov	%o3, %g3
	add %i0, %o3, %o3
	ld [%fp+-2616], %i0
	xor %o3, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o5
	ld [%fp+-2520], %i0
	ld [%fp+-2712], %i2
	add %i0, %i2, %i5
	ld [%fp+-2608], %i0
	xor %i5, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %i0
	ld [%fp+-2724], %i1
	ld [%fp+-2792], %i3
	xor %i3, %i1, %i3
	ld [%fp+-2732], %i1
	xor %o7, %i1, %g2
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l5
	st %l5, [%fp+-2832]
	srl %g2, 8, %i3
	sll %g2, 24, %g2
	or %g2, %i3, %o7
	ld [%fp+-2612], %i1
	add %i1, %l6, %g2
	add %g2, %o5, %l4
	xor %l4, %g3, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %i3
	st %i3, [%fp+-2612]
	ld [%fp+-2604], %i1
	ldd [%fp+-2248], %g2
	add %i1, %g2, %g2
	add %g2, %i0, %g3
	xor %g3, %i2, %g2
	srl %g2, 8, %i1
	sll %g2, 24, %g2
	or %g2, %i1, %i2
	st %i2, [%fp+-2616]
	add %i3, %o3, %i1
	st %i1, [%fp+-2716]
	xor %i1, %o5, %i1
	srl %i1, 7, %o3
	sll %i1, 25, %i1
	or %i1, %o3, %g2
	st %g2, [%fp+-2700]
	add %i2, %i5, %i1
	st %i1, [%fp+-2740]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2732]
	ldd [%fp+-2328], %i0
	ld [%fp+-2764], %i2
	add %i2, %i0, %i0
	ldd [%fp+-2272], %i2
	ld [%fp+-2768], %i1
	add %i1, %i2, %i1
	add %i1, %i4, %i2
	st %i2, [%fp+-2712]
	add %i0, %g2, %i1
	st %i1, [%fp+-2724]
	add %fp, -564, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2744]
	add %fp, -572, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2768]
	add %fp, -1396, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2792]
	add %fp, -1404, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2800]
	xor %i1, %l5, %i1
	xor %i2, %o7, %i0
	lduh [%fp+-564], %i2
	st %i2, [%fp+-2796]
	lduh [%fp+-572], %i2
	st %i2, [%fp+-2804]
	lduh [%fp+-1396], %i2
	st %i2, [%fp+-2808]
	lduh [%fp+-1404], %i2
	st %i2, [%fp+-2820]
	st %i0, [%fp+-612]
	st %i1, [%fp+-620]
	ld [%fp+-2512], %i0
	ld [%fp+-2672], %i4
	add %i0, %i4, %o3
	ld [%fp+-2600], %i0
	xor %o3, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o5
	ld [%fp+-2504], %i0
	ld [%fp+-2664], %l5
	add %i0, %l5, %i3
	ld [%fp+-2596], %i0
	xor %i3, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i0
	ld [%fp+-2480], %i1
	xor %g4, %i1, %i1
	ld [%fp+-2472], %i2
	xor %o0, %i2, %i5
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %g2
	srl %i5, 8, %i1
	sll %i5, 24, %i5
	or %i5, %i1, %i5
	ld [%fp+-2588], %i1
	add %i1, %l0, %i1
	add %i1, %o5, %g4
	xor %g4, %i4, %i1
	srl %i1, 8, %o1
	sll %i1, 24, %i1
	or %i1, %o1, %o1
	ld [%fp+-2584], %i1
	add %i1, %l2, %i1
	add %i1, %i0, %i4
	xor %i4, %l5, %i2
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %i2
	add %o1, %o3, %i1
	st %i1, [%fp+-2632]
	xor %i1, %o5, %i1
	srl %i1, 7, %o3
	sll %i1, 25, %i1
	or %i1, %o3, %l2
	st %l2, [%fp+-2636]
	add %i2, %i3, %i1
	st %i1, [%fp+-2624]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+-2620]
	ldd [%fp+-2320], %i0
	add %o4, %i0, %i0
	ldd [%fp+-2416], %l0
	add %o2, %l0, %i1
	add %i1, %i3, %i3
	st %i3, [%fp+-2528]
	add %i0, %l2, %i0
	st %i0, [%fp+-2608]
	xor %i0, %g2, %i1
	xor %i3, %i5, %i0
	st %i0, [%fp+-1444]
	st %i1, [%fp+-1452]
	ld [%fp+-2704], %i0
	ld [%fp+-2784], %i1
	add %i1, %i0, %i3
	st %i3, [%fp+-2764]
	ld [%fp+-2652], %i0
	ld [%fp+-2788], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2672]
	ld [%fp+-2736], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+-2604]
	ld [%fp+-2760], %i0
	xor %i3, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+-2520]
	ldd [%fp+-2280], %i0
	add %l4, %i1, %i0
	ldd [%fp+-2336], %l0
	add %g3, %l1, %i1
	add %i1, %i3, %i1
	st %i1, [%fp+-2512]
	add %i0, %l2, %i0
	st %i0, [%fp+-2600]
	ld [%fp+-2728], %i3
	xor %i0, %i3, %o3
	ld [%fp+-2756], %i0
	xor %i1, %i0, %o2
	add %fp, -612, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2664]
	add %fp, -620, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2736]
	add %fp, -1444, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2784]
	add %fp, -1452, %i0
	or %i0, 2, %i0
	lduh [%i0], %o5
	lduh [%fp+-612], %i0
	st %i0, [%fp+-2756]
	lduh [%fp+-620], %i0
	st %i0, [%fp+-2760]
	lduh [%fp+-1444], %l7
	lduh [%fp+-1452], %l3
	st %o2, [%fp+-580]
	st %o3, [%fp+-588]
	ld [%fp+-2656], %i0
	ld [%fp+-2828], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2652]
	ld [%fp+-2592], %i1
	ld [%fp+-2684], %i3
	add %i3, %i1, %i1
	st %i1, [%fp+-2656]
	ld [%fp+-2812], %i3
	xor %i1, %i3, %l4
	srl %l4, 7, %l6
	sll %l4, 25, %l4
	or %l4, %l6, %g3
	st %g3, [%fp+-2596]
	ld [%fp+-2816], %i1
	xor %i0, %i1, %l4
	srl %l4, 7, %l6
	sll %l4, 25, %l4
	or %l4, %l6, %i3
	st %i3, [%fp+-2592]
	ldd [%fp+-2464], %i0
	add %g4, %i1, %g4
	ldd [%fp+-2456], %i0
	add %i4, %i1, %i4
	add %i4, %i3, %i0
	st %i0, [%fp+-2504]
	add %g4, %g3, %i1
	st %i1, [%fp+-2584]
	ld [%fp+-2692], %i3
	xor %i1, %i3, %o3
	ld [%fp+-2824], %i1
	xor %i0, %i1, %o2
	st %o2, [%fp+-1412]
	st %o3, [%fp+-1420]
	ld [%fp+-2644], %i0
	add %o7, %i0, %i0
	st %i0, [%fp+-2644]
	ld [%fp+-2628], %i1
	ld [%fp+-2832], %i3
	add %i3, %i1, %i1
	st %i1, [%fp+-2628]
	ld [%fp+-2752], %i3
	xor %i1, %i3, %i4
	srl %i4, 7, %g4
	sll %i4, 25, %i4
	or %i4, %g4, %l1
	ld [%fp+-2748], %i1
	xor %i0, %i1, %i4
	srl %i4, 7, %l0
	sll %i4, 25, %i4
	or %i4, %l0, %l4
	ldd [%fp+-2448], %i0
	ld [%fp+-2696], %i3
	add %i3, %i1, %i4
	ldd [%fp+-2440], %i0
	ld [%fp+-2720], %i3
	add %i3, %i1, %l2
	add %l2, %l4, %i0
	st %i0, [%fp+-2588]
	add %i4, %l1, %i1
	st %i1, [%fp+-2704]
	ld [%fp+-2612], %i3
	xor %i1, %i3, %o3
	ld [%fp+-2616], %i1
	xor %i0, %i1, %o2
	add %fp, -580, %i4
	or %i4, 2, %i4
	lduh [%i4], %l0
	add %fp, -588, %g3
	or %g3, 2, %g3
	lduh [%g3], %g4
	add %fp, -1412, %l2
	or %l2, 2, %l2
	lduh [%l2], %l2
	add %fp, -1420, %l5
	or %l5, 2, %l5
	lduh [%l5], %l5
	lduh [%fp+-580], %l6
	lduh [%fp+-588], %o0
	lduh [%fp+-1412], %o7
	lduh [%fp+-1420], %i3
	st %o2, [%fp+-532]
	st %o3, [%fp+-540]
	ld [%fp+-2780], %i0
	add %i5, %i0, %i0
	st %i0, [%fp+-2612]
	ld [%fp+-2772], %i1
	add %g2, %i1, %i1
	st %i1, [%fp+-2616]
	ld [%fp+-2776], %i4
	xor %i1, %i4, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %g3
	st %g3, [%fp+-2696]
	ld [%fp+-2708], %i1
	xor %i0, %i1, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i4
	st %i4, [%fp+-2692]
	ldd [%fp+-2432], %i0
	ld [%fp+-2660], %i5
	add %i5, %i1, %i5
	ldd [%fp+-2424], %i0
	ld [%fp+-2680], %g2
	add %g2, %i1, %g2
	add %g2, %i4, %i0
	st %i0, [%fp+-2680]
	add %i5, %g3, %i1
	st %i1, [%fp+-2684]
	xor %i1, %o1, %o3
	xor %i0, %i2, %o2
	st %o2, [%fp+-1364]
	st %o3, [%fp+-1372]
	add %fp, -532, %i2
	or %i2, 2, %i2
	lduh [%i2], %g3
	add %fp, -540, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	add %fp, -1364, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -1372, %o1
	or %o1, 2, %o1
	lduh [%o1], %o1
	add %fp, -1408, %o2
	or %o2, 2, %o2
	lduh [%fp+-532], %o3
	lduh [%fp+-540], %i4
	lduh [%fp+-1364], %i1
	lduh [%fp+-1372], %i0
	ld [%fp+-2820], %i2
	sth %i2, [%o2]
	add %fp, -1400, %o2
	or %o2, 2, %o2
	ld [%fp+-2808], %i2
	sth %i2, [%o2]
	ld [%fp+-2800], %i2
	sth %i2, [%fp+-1408]
	ld [%fp+-2792], %i2
	sth %i2, [%fp+-1400]
	add %fp, -576, %o2
	or %o2, 2, %o2
	ld [%fp+-1408], %o4
	st %o4, [%fp+-2472]
	ld [%fp+-1400], %o4
	st %o4, [%fp+-2480]
	ld [%fp+-2804], %i2
	sth %i2, [%o2]
	add %fp, -568, %o2
	or %o2, 2, %o2
	ld [%fp+-2796], %i2
	sth %i2, [%o2]
	ld [%fp+-2768], %i2
	sth %i2, [%fp+-576]
	ld [%fp+-2744], %i2
	sth %i2, [%fp+-568]
	add %fp, -1456, %o2
	or %o2, 2, %o2
	ld [%fp+-576], %o4
	st %o4, [%fp+-2728]
	ld [%fp+-568], %i2
	st %i2, [%fp+-2744]
	sth %l3, [%o2]
	add %fp, -1448, %l3
	or %l3, 2, %l3
	sth %l7, [%l3]
	sth %o5, [%fp+-1456]
	ld [%fp+-2784], %l3
	sth %l3, [%fp+-1448]
	add %fp, -624, %l3
	or %l3, 2, %l7
	ld [%fp+-1456], %l3
	ld [%fp+-1448], %o2
	st %o2, [%fp+-2748]
	ld [%fp+-2760], %o2
	sth %o2, [%l7]
	add %fp, -616, %l7
	or %l7, 2, %l7
	ld [%fp+-2756], %o2
	sth %o2, [%l7]
	ld [%fp+-2736], %l7
	sth %l7, [%fp+-624]
	ld [%fp+-2664], %l7
	sth %l7, [%fp+-616]
	add %fp, -1424, %l7
	or %l7, 2, %o5
	ld [%fp+-624], %l7
	ld [%fp+-616], %o2
	sth %i3, [%o5]
	add %fp, -1416, %i3
	or %i3, 2, %i3
	sth %o7, [%i3]
	sth %l5, [%fp+-1424]
	sth %l2, [%fp+-1416]
	add %fp, -592, %i3
	or %i3, 2, %i3
	ld [%fp+-1424], %l2
	st %l2, [%fp+-2664]
	ld [%fp+-1416], %l2
	st %l2, [%fp+-2660]
	sth %o0, [%i3]
	add %fp, -584, %i3
	or %i3, 2, %i3
	sth %l6, [%i3]
	sth %g4, [%fp+-592]
	sth %l0, [%fp+-584]
	add %fp, -1376, %i3
	or %i3, 2, %i3
	ld [%fp+-592], %g4
	st %g4, [%fp+-2720]
	ld [%fp+-584], %g4
	st %g4, [%fp+-2708]
	sth %i0, [%i3]
	add %fp, -1368, %i0
	or %i0, 2, %i0
	sth %i1, [%i0]
	sth %o1, [%fp+-1376]
	sth %g2, [%fp+-1368]
	add %fp, -544, %i0
	or %i0, 2, %i0
	ld [%fp+-1376], %l2
	ld [%fp+-1368], %l6
	sth %i4, [%i0]
	add %fp, -536, %i0
	or %i0, 2, %i0
	sth %o3, [%i0]
	sth %i5, [%fp+-544]
	sth %g3, [%fp+-536]
	ld [%fp+-2716], %i0
	add %i0, %o4, %i1
	st %i1, [%fp+-2716]
	ld [%fp+-2688], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+-2784]
	ld [%fp+-2740], %i0
	add %i0, %i2, %i1
	st %i1, [%fp+-2736]
	ld [%fp+-2676], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2780]
	ld [%fp+-2672], %i0
	add %i0, %l7, %i0
	st %i0, [%fp+-2672]
	ld [%fp+-2700], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+-2700]
	ld [%fp+-2764], %i0
	add %i0, %o2, %i0
	st %i0, [%fp+-2676]
	ld [%fp+-2732], %i1
	xor %i0, %i1, %i0
	ld [%fp+-544], %g2
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2732]
	ld [%fp+-2640], %i0
	add %i0, %g2, %i1
	xor %i1, %l1, %i0
	ld [%fp+-536], %i4
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o1
	ld [%fp+-2648], %i0
	add %i0, %i4, %o0
	xor %o0, %l4, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i0
	ldd [%fp+-2224], %i2
	ld [%fp+-2724], %l1
	add %l1, %i3, %i2
	add %i2, %i5, %i2
	st %i2, [%fp+-2756]
	xor %i2, %l7, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %l1
	st %l1, [%fp+-2764]
	ldd [%fp+-2216], %i2
	ld [%fp+-2712], %i5
	add %i5, %i3, %i2
	add %i2, %g3, %i2
	st %i2, [%fp+-2760]
	xor %i2, %o2, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %g3
	st %g3, [%fp+-2768]
	ldd [%fp+-2280], %i2
	ld [%fp+-2704], %i5
	add %i5, %i2, %i2
	add %i2, %o1, %i2
	st %i2, [%fp+-2704]
	xor %i2, %g2, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i5
	st %i5, [%fp+-2648]
	ldd [%fp+-2336], %i2
	ld [%fp+-2588], %g2
	add %g2, %i2, %i2
	add %i2, %i0, %i2
	st %i2, [%fp+-2740]
	xor %i2, %i4, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i3
	st %i3, [%fp+-2752]
	add %i5, %i1, %i1
	st %i1, [%fp+-2640]
	xor %i1, %o1, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %g2
	st %g2, [%fp+-2724]
	add %i3, %o0, %i1
	st %i1, [%fp+-2688]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+-2712]
	ldd [%fp+-2240], %i4
	ld [%fp+-2568], %i0
	add %i0, %i5, %i1
	ldd [%fp+-2296], %o4
	ld [%fp+-2552], %i0
	add %i0, %o5, %i0
	add %i0, %l0, %o3
	add %i1, %g4, %o7
	ldd [%fp+-2368], %i4
	add %o3, %i5, %i1
	add %i1, %i2, %i2
	st %i2, [%fp+-2588]
	ldd [%fp+-2376], %i4
	add %o7, %i5, %i1
	add %i1, %g2, %i1
	st %i1, [%fp+-2568]
	xor %i1, %l1, %i5
	xor %i2, %g3, %i4
	st %i4, [%fp+-644]
	st %i5, [%fp+-652]
	ld [%fp+-2632], %i1
	ld [%fp+-2472], %i2
	add %i1, %i2, %i0
	st %i0, [%fp+-2812]
	ld [%fp+-2580], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o2
	st %o2, [%fp+-2820]
	ld [%fp+-2624], %i1
	ld [%fp+-2480], %i2
	add %i1, %i2, %i0
	st %i0, [%fp+-2624]
	ld [%fp+-2576], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l5
	st %l5, [%fp+-2816]
	ld [%fp+-2656], %i1
	add %i1, %l3, %i2
	st %i2, [%fp+-2580]
	ld [%fp+-2636], %i1
	xor %i2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g3
	st %g3, [%fp+-2772]
	ld [%fp+-2652], %i1
	ld [%fp+-2748], %i5
	add %i1, %i5, %i2
	st %i2, [%fp+-2632]
	ld [%fp+-2620], %i1
	xor %i2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l0
	st %l0, [%fp+-2776]
	ld [%fp+-2544], %i1
	add %i1, %l2, %i4
	ld [%fp+-2696], %i1
	xor %i4, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g2
	ld [%fp+-2536], %i1
	add %i1, %l6, %g4
	ld [%fp+-2692], %i1
	xor %g4, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l1
	ldd [%fp+-2232], %o0
	ld [%fp+-2608], %i1
	add %i1, %o1, %i1
	add %i1, %g3, %i0
	st %i0, [%fp+-2608]
	xor %i0, %l3, %i1
	srl %i1, 8, %l3
	sll %i1, 24, %i1
	or %i1, %l3, %i3
	st %i3, [%fp+-2696]
	ldd [%fp+-2344], %o0
	ld [%fp+-2528], %i1
	add %i1, %o1, %i1
	add %i1, %l0, %g3
	xor %g3, %i5, %l3
	srl %l3, 8, %l4
	sll %l3, 24, %l3
	or %l3, %l4, %i0
	st %i0, [%fp+-2796]
	ldd [%fp+-2464], %o0
	ld [%fp+-2684], %i1
	add %i1, %o0, %l3
	add %l3, %g2, %i1
	st %i1, [%fp+-2620]
	xor %i1, %l2, %l2
	srl %l2, 8, %l3
	sll %l2, 24, %l2
	or %l2, %l3, %i2
	st %i2, [%fp+-2692]
	ldd [%fp+-2456], %l2
	ld [%fp+-2680], %i1
	add %i1, %l2, %l2
	add %l2, %l1, %i1
	st %i1, [%fp+-2636]
	xor %i1, %l6, %l2
	srl %l2, 8, %l3
	sll %l2, 24, %l2
	or %l2, %l3, %i5
	st %i5, [%fp+-2680]
	add %i2, %i4, %i1
	st %i1, [%fp+-2536]
	xor %i1, %g2, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %l3
	st %l3, [%fp+-2576]
	add %i5, %g4, %i1
	st %i1, [%fp+-2528]
	xor %i1, %l1, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i2
	st %i2, [%fp+-2552]
	ldd [%fp+-2392], %l6
	ld [%fp+-2496], %i1
	add %i1, %l7, %i4
	ldd [%fp+-2384], %l0
	ld [%fp+-2488], %i1
	add %i1, %l1, %g2
	add %g2, %l5, %l2
	add %i4, %o2, %l4
	ldd [%fp+-2352], %i4
	add %l2, %i5, %i4
	add %i4, %i2, %i1
	st %i1, [%fp+-2488]
	ldd [%fp+-2360], %i4
	add %l4, %i5, %i4
	add %i4, %l3, %i2
	st %i2, [%fp+-2496]
	xor %i2, %i3, %o1
	xor %i1, %i0, %o0
	st %o0, [%fp+-1476]
	st %o1, [%fp+-1484]
	ld [%fp+-2628], %i1
	ld [%fp+-2720], %i5
	add %i1, %i5, %i0
	st %i0, [%fp+-2800]
	ld [%fp+-2604], %i1
	xor %i0, %i1, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %l3
	st %l3, [%fp+-2804]
	ld [%fp+-2644], %i1
	ld [%fp+-2708], %g4
	add %i1, %g4, %i0
	st %i0, [%fp+-2808]
	ld [%fp+-2520], %i1
	xor %i0, %i1, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %o0
	ld [%fp+-2728], %i1
	xor %o7, %i1, %i3
	ld [%fp+-2744], %i1
	xor %o3, %i1, %i0
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i4
	st %i4, [%fp+-2788]
	srl %i0, 8, %i3
	sll %i0, 24, %i0
	or %i0, %i3, %l5
	st %l5, [%fp+-2792]
	ldd [%fp+-2448], %i0
	ld [%fp+-2600], %i2
	add %i2, %i0, %i0
	add %i0, %l3, %g2
	xor %g2, %i5, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %o1
	ldd [%fp+-2440], %i0
	ld [%fp+-2512], %i2
	add %i2, %i0, %i1
	add %i1, %o0, %i5
	mov	%o0, %o3
	xor %i5, %g4, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %l3
	ld [%fp+-2716], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+-2520]
	ld [%fp+-2784], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i4
	st %i4, [%fp+-2744]
	ld [%fp+-2736], %i0
	add %l5, %i0, %i0
	st %i0, [%fp+-2512]
	ld [%fp+-2780], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i0
	st %i0, [%fp+-2684]
	ld [%fp+-2756], %i1
	ldd [%fp+-2240], %i2
	add %i1, %i2, %i1
	ld [%fp+-2760], %i2
	add %i2, %o4, %i3
	add %i3, %i0, %i2
	st %i2, [%fp+-2544]
	add %i1, %i4, %i0
	st %i0, [%fp+-2644]
	add %fp, -644, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2652]
	add %fp, -652, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2656]
	add %fp, -1476, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2708]
	add %fp, -1484, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2720]
	xor %i0, %o1, %i1
	xor %i2, %l3, %i0
	lduh [%fp+-644], %i2
	st %i2, [%fp+-2716]
	lduh [%fp+-652], %i2
	st %i2, [%fp+-2748]
	lduh [%fp+-1476], %i2
	st %i2, [%fp+-2728]
	lduh [%fp+-1484], %i2
	st %i2, [%fp+-2736]
	st %i0, [%fp+-676]
	st %i1, [%fp+-684]
	ld [%fp+-2616], %i0
	ld [%fp+-2664], %g4
	add %i0, %g4, %i1
	st %i1, [%fp+-2780]
	ld [%fp+-2596], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o5
	ld [%fp+-2612], %i0
	ld [%fp+-2660], %o2
	add %i0, %o2, %o0
	ld [%fp+-2592], %i0
	xor %o0, %i0, %i1
	srl %i1, 12, %i3
	sll %i1, 20, %i1
	or %i1, %i3, %o4
	ld [%fp+-2472], %i0
	xor %l4, %i0, %i1
	ld [%fp+-2480], %i0
	xor %l2, %i0, %i3
	srl %i1, 8, %l2
	sll %i1, 24, %i1
	or %i1, %l2, %l4
	srl %i3, 8, %i1
	sll %i3, 24, %i3
	or %i3, %i1, %l2
	ldd [%fp+-2432], %i0
	ld [%fp+-2584], %i2
	add %i2, %i0, %i1
	add %i1, %o5, %i4
	xor %i4, %g4, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %g4
	ldd [%fp+-2424], %i0
	ld [%fp+-2504], %i2
	add %i2, %i0, %i1
	add %i1, %o4, %i2
	xor %i2, %o2, %i1
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %i3
	ld [%fp+-2812], %i0
	add %l4, %i0, %i0
	st %i0, [%fp+-2504]
	ld [%fp+-2820], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %l5
	sll %i0, 25, %i0
	or %i0, %l5, %i1
	st %i1, [%fp+-2628]
	ld [%fp+-2624], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+-2472]
	ld [%fp+-2816], %l5
	xor %i0, %l5, %i0
	srl %i0, 7, %l5
	sll %i0, 25, %i0
	or %i0, %l5, %l5
	st %l5, [%fp+-2624]
	ld [%fp+-2608], %i0
	add %i0, %l6, %i0
	add %g3, %l0, %g3
	add %g3, %l5, %g3
	st %g3, [%fp+-2480]
	add %i0, %i1, %i0
	st %i0, [%fp+-2616]
	xor %i0, %g4, %i1
	xor %g3, %i3, %i0
	st %i0, [%fp+-1508]
	st %i1, [%fp+-1516]
	ld [%fp+-2676], %i0
	ld [%fp+-2768], %i1
	add %i1, %i0, %g3
	st %g3, [%fp+-2756]
	ld [%fp+-2672], %i0
	ld [%fp+-2764], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2660]
	ld [%fp+-2700], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l1
	st %l1, [%fp+-2612]
	ld [%fp+-2732], %i0
	xor %g3, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2604]
	ldd [%fp+-2328], %i0
	add %g2, %i1, %i0
	ldd [%fp+-2272], %g2
	add %i5, %g3, %i1
	add %i1, %l0, %i5
	st %i5, [%fp+-2600]
	add %i0, %l1, %i0
	st %i0, [%fp+-2608]
	ld [%fp+-2648], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2752], %g2
	xor %i5, %g2, %i0
	add %fp, -676, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2752]
	add %fp, -684, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2764]
	add %fp, -1508, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2812]
	add %fp, -1516, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2816]
	lduh [%fp+-676], %i5
	st %i5, [%fp+-2768]
	lduh [%fp+-684], %i5
	st %i5, [%fp+-2784]
	lduh [%fp+-1508], %i5
	st %i5, [%fp+-2820]
	lduh [%fp+-1516], %o7
	st %i0, [%fp+-628]
	st %i1, [%fp+-636]
	ld [%fp+-2632], %i0
	ld [%fp+-2796], %i1
	add %i1, %i0, %i5
	st %i5, [%fp+-2632]
	ld [%fp+-2580], %i0
	ld [%fp+-2696], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2648]
	ld [%fp+-2772], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2596]
	ld [%fp+-2776], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2592]
	ldd [%fp+-2320], %i0
	add %i4, %i1, %i0
	ldd [%fp+-2416], %i4
	add %i2, %i5, %i1
	add %i1, %g2, %i2
	st %i2, [%fp+-2580]
	add %i0, %g3, %i0
	st %i0, [%fp+-2584]
	ld [%fp+-2692], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2680], %i4
	xor %i2, %i4, %i0
	st %i0, [%fp+-1460]
	st %i1, [%fp+-1468]
	ld [%fp+-2808], %i0
	add %l3, %i0, %l5
	ld [%fp+-2800], %i0
	add %o1, %i0, %l0
	ld [%fp+-2804], %i0
	xor %l0, %i0, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i5
	st %i5, [%fp+-2760]
	xor %l5, %o3, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i4
	st %i4, [%fp+-2732]
	ldd [%fp+-2264], %i0
	ld [%fp+-2704], %i2
	add %i2, %i1, %i1
	ldd [%fp+-2256], %g2
	ld [%fp+-2740], %i0
	add %i0, %g3, %i2
	add %i2, %i4, %i0
	st %i0, [%fp+-2664]
	add %i1, %i5, %i1
	st %i1, [%fp+-2672]
	ld [%fp+-2788], %i2
	xor %i1, %i2, %o3
	ld [%fp+-2792], %i1
	xor %i0, %i1, %o2
	add %fp, -628, %i1
	or %i1, 2, %i1
	lduh [%i1], %l6
	add %fp, -636, %i1
	or %i1, 2, %i1
	lduh [%i1], %l3
	add %fp, -1460, %i1
	or %i1, 2, %i1
	lduh [%i1], %g2
	add %fp, -1468, %i2
	or %i2, 2, %i2
	lduh [%i2], %i5
	lduh [%fp+-628], %l1
	lduh [%fp+-636], %g3
	lduh [%fp+-1460], %i4
	lduh [%fp+-1468], %i1
	st %o2, [%fp+-596]
	st %o3, [%fp+-604]
	add %i3, %o0, %i0
	st %i0, [%fp+-2700]
	ld [%fp+-2780], %i2
	add %g4, %i2, %i2
	st %i2, [%fp+-2704]
	xor %i2, %o5, %i3
	srl %i3, 7, %g4
	sll %i3, 25, %i3
	or %i3, %g4, %i2
	st %i2, [%fp+-2696]
	xor %i0, %o4, %i3
	srl %i3, 7, %g4
	sll %i3, 25, %i3
	or %i3, %g4, %i0
	st %i0, [%fp+-2692]
	ldd [%fp+-2304], %o0
	ld [%fp+-2620], %i3
	add %i3, %o1, %i3
	ldd [%fp+-2288], %o0
	ld [%fp+-2636], %g4
	add %g4, %o1, %g4
	add %g4, %i0, %i0
	st %i0, [%fp+-2676]
	add %i3, %i2, %i2
	st %i2, [%fp+-2680]
	xor %i2, %l4, %o1
	xor %i0, %l2, %o0
	st %o0, [%fp+-1428]
	st %o1, [%fp+-1436]
	add %fp, -596, %i3
	or %i3, 2, %i3
	lduh [%i3], %o0
	add %fp, -604, %i3
	or %i3, 2, %i3
	lduh [%i3], %o2
	add %fp, -1428, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	add %fp, -1436, %g4
	or %g4, 2, %g4
	lduh [%g4], %g4
	add %fp, -1488, %l2
	or %l2, 2, %l2
	lduh [%fp+-596], %o3
	lduh [%fp+-604], %o4
	lduh [%fp+-1428], %l4
	lduh [%fp+-1436], %o1
	ld [%fp+-2736], %i0
	sth %i0, [%l2]
	add %fp, -1480, %l2
	or %l2, 2, %l2
	ld [%fp+-2728], %i0
	sth %i0, [%l2]
	ld [%fp+-2720], %i0
	sth %i0, [%fp+-1488]
	ld [%fp+-2708], %i0
	sth %i0, [%fp+-1480]
	add %fp, -656, %l2
	or %l2, 2, %l2
	ld [%fp+-1488], %i0
	st %i0, [%fp+-2736]
	ld [%fp+-1480], %i0
	st %i0, [%fp+-2728]
	ld [%fp+-2748], %i0
	sth %i0, [%l2]
	add %fp, -648, %l2
	or %l2, 2, %l2
	ld [%fp+-2716], %i0
	sth %i0, [%l2]
	ld [%fp+-2656], %i0
	sth %i0, [%fp+-656]
	ld [%fp+-2652], %i0
	sth %i0, [%fp+-648]
	add %fp, -1520, %l2
	or %l2, 2, %l2
	ld [%fp+-656], %l7
	st %l7, [%fp+-2708]
	ld [%fp+-648], %i2
	sth %o7, [%l2]
	add %fp, -1512, %l2
	or %l2, 2, %l2
	ld [%fp+-2820], %i0
	sth %i0, [%l2]
	ld [%fp+-2816], %i0
	sth %i0, [%fp+-1520]
	ld [%fp+-2812], %i0
	sth %i0, [%fp+-1512]
	add %fp, -688, %l2
	or %l2, 2, %l2
	ld [%fp+-1520], %o5
	ld [%fp+-1512], %i0
	st %i0, [%fp+-2740]
	ld [%fp+-2784], %i0
	sth %i0, [%l2]
	add %fp, -680, %l2
	or %l2, 2, %l2
	ld [%fp+-2768], %i0
	sth %i0, [%l2]
	ld [%fp+-2764], %i0
	sth %i0, [%fp+-688]
	ld [%fp+-2752], %i0
	sth %i0, [%fp+-680]
	add %fp, -1472, %l2
	or %l2, 2, %i0
	ld [%fp+-688], %l2
	ld [%fp+-680], %o7
	sth %i1, [%i0]
	add %fp, -1464, %i0
	or %i0, 2, %i0
	sth %i4, [%i0]
	sth %i5, [%fp+-1472]
	sth %g2, [%fp+-1464]
	add %fp, -640, %i0
	or %i0, 2, %i0
	ld [%fp+-1472], %i1
	st %i1, [%fp+-2656]
	ld [%fp+-1464], %i1
	st %i1, [%fp+-2652]
	sth %g3, [%i0]
	add %fp, -632, %i0
	or %i0, 2, %i0
	sth %l1, [%i0]
	sth %l3, [%fp+-640]
	sth %l6, [%fp+-632]
	add %fp, -1440, %i0
	or %i0, 2, %i0
	ld [%fp+-640], %i1
	st %i1, [%fp+-2720]
	ld [%fp+-632], %i1
	st %i1, [%fp+-2716]
	sth %o1, [%i0]
	add %fp, -1432, %i0
	or %i0, 2, %i0
	sth %l4, [%i0]
	sth %g4, [%fp+-1440]
	sth %i3, [%fp+-1432]
	add %fp, -608, %i0
	or %i0, 2, %i0
	ld [%fp+-1440], %i3
	ld [%fp+-1432], %i1
	st %i1, [%fp+-2764]
	sth %o4, [%i0]
	add %fp, -600, %i0
	or %i0, 2, %i0
	sth %o3, [%i0]
	sth %o2, [%fp+-608]
	sth %o0, [%fp+-600]
	add %l0, %l7, %i0
	st %i0, [%fp+-2620]
	ld [%fp+-2724], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2752]
	add %l5, %i2, %i0
	mov	%i2, %l7
	st %i0, [%fp+-2636]
	ld [%fp+-2712], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l6
	st %l6, [%fp+-2748]
	ld [%fp+-2640], %i0
	add %i0, %l2, %i0
	ld [%fp+-2744], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	ld [%fp+-2688], %i2
	add %i2, %o7, %l1
	ld [%fp+-2684], %i2
	xor %l1, %i2, %i2
	ld [%fp+-608], %g2
	srl %i2, 12, %i4
	sll %i2, 20, %i2
	or %i2, %i4, %o0
	ld [%fp+-2660], %i2
	add %i2, %g2, %i2
	st %i2, [%fp+-2660]
	ld [%fp+-2760], %i4
	xor %i2, %i4, %i2
	ld [%fp+-600], %i4
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %g3
	st %g3, [%fp+-2724]
	ld [%fp+-2756], %i2
	add %i2, %i4, %i2
	st %i2, [%fp+-2688]
	ld [%fp+-2732], %i5
	xor %i2, %i5, %i2
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %o2
	st %o2, [%fp+-2744]
	ldd [%fp+-2328], %l4
	ld [%fp+-2644], %i2
	add %i2, %l4, %i2
	add %i2, %i1, %i2
	st %i2, [%fp+-2760]
	xor %i2, %l2, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l4
	st %l4, [%fp+-2732]
	ldd [%fp+-2272], %l2
	ld [%fp+-2544], %i2
	add %i2, %l2, %i2
	add %i2, %o0, %o1
	xor %o1, %o7, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l5
	st %l5, [%fp+-2756]
	ldd [%fp+-2448], %l2
	ld [%fp+-2672], %i2
	add %i2, %l2, %i2
	add %i2, %g3, %i2
	st %i2, [%fp+-2684]
	xor %i2, %g2, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l2
	st %l2, [%fp+-2788]
	ldd [%fp+-2440], %g2
	ld [%fp+-2664], %i2
	add %i2, %g2, %i2
	add %i2, %o2, %i2
	st %i2, [%fp+-2712]
	xor %i2, %i4, %i2
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %l3
	st %l3, [%fp+-2792]
	add %l4, %i0, %i0
	st %i0, [%fp+-2640]
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2672]
	add %l5, %l1, %i0
	st %i0, [%fp+-2644]
	xor %i0, %o0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2664]
	ldd [%fp+-2224], %i0
	ld [%fp+-2568], %i2
	add %i2, %i0, %i0
	ldd [%fp+-2216], %i4
	ld [%fp+-2588], %i1
	add %i1, %i4, %i1
	add %i1, %l6, %l1
	add %i0, %l0, %l6
	ldd [%fp+-2256], %i0
	add %l1, %i0, %i0
	add %i0, %g2, %i2
	st %i2, [%fp+-2568]
	ldd [%fp+-2264], %i0
	add %l6, %i0, %i0
	add %i0, %g3, %i0
	st %i0, [%fp+-2544]
	xor %i0, %l2, %i1
	xor %i2, %l3, %i0
	st %i0, [%fp+-692]
	st %i1, [%fp+-700]
	ld [%fp+-2736], %o7
	ld [%fp+-2704], %i0
	add %i0, %o7, %i1
	st %i1, [%fp+-2776]
	ld [%fp+-2576], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+-2780]
	ld [%fp+-2728], %l4
	ld [%fp+-2700], %i0
	add %i0, %l4, %i1
	st %i1, [%fp+-2700]
	ld [%fp+-2552], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l5
	st %l5, [%fp+-2784]
	ld [%fp+-2536], %i0
	mov	%o5, %l2
	add %i0, %o5, %l0
	ld [%fp+-2628], %i1
	xor %l0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g4
	ld [%fp+-2528], %i2
	ld [%fp+-2740], %o5
	add %i2, %o5, %i2
	ld [%fp+-2624], %i4
	xor %i2, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %i4
	ld [%fp+-2648], %i5
	add %i5, %i3, %g2
	st %g2, [%fp+-2804]
	ld [%fp+-2696], %i5
	xor %g2, %i5, %i5
	srl %i5, 12, %g2
	sll %i5, 20, %i5
	or %i5, %g2, %o4
	st %o4, [%fp+-2812]
	ld [%fp+-2632], %i5
	ld [%fp+-2764], %i1
	add %i5, %i1, %i0
	st %i0, [%fp+-2648]
	ld [%fp+-2692], %i5
	xor %i0, %i5, %i5
	srl %i5, 12, %g2
	sll %i5, 20, %i5
	or %i5, %g2, %i0
	st %i0, [%fp+-2816]
	ldd [%fp+-2320], %g2
	ld [%fp+-2616], %i5
	add %i5, %g2, %i5
	add %i5, %g4, %o0
	xor %o0, %l2, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %o3
	st %o3, [%fp+-2692]
	ldd [%fp+-2416], %g2
	ld [%fp+-2480], %i5
	add %i5, %g2, %i5
	add %i5, %i4, %o2
	xor %o2, %o5, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %o5
	st %o5, [%fp+-2828]
	ldd [%fp+-2432], %g2
	ld [%fp+-2680], %i5
	add %i5, %g2, %i5
	add %i5, %o4, %i5
	st %i5, [%fp+-2680]
	xor %i5, %i3, %i5
	srl %i5, 8, %g2
	sll %i5, 24, %i5
	or %i5, %g2, %o4
	st %o4, [%fp+-2820]
	ldd [%fp+-2424], %g2
	ld [%fp+-2676], %i5
	add %i5, %g2, %i5
	add %i5, %i0, %i5
	st %i5, [%fp+-2676]
	xor %i5, %i1, %i3
	srl %i3, 8, %i5
	sll %i3, 24, %i3
	or %i3, %i5, %l2
	add %o3, %l0, %i0
	st %i0, [%fp+-2536]
	xor %i0, %g4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+-2576]
	add %o5, %i2, %i0
	st %i0, [%fp+-2528]
	xor %i0, %i4, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2552]
	ldd [%fp+-2232], %i0
	ld [%fp+-2496], %i2
	add %i2, %i0, %i0
	ldd [%fp+-2344], %i2
	ld [%fp+-2488], %i1
	add %i1, %i2, %i1
	add %i1, %l5, %g2
	add %i0, %l3, %i1
	ldd [%fp+-2288], %i2
	add %g2, %i2, %i2
	add %i2, %i4, %i0
	st %i0, [%fp+-2480]
	ldd [%fp+-2304], %i2
	add %i1, %i2, %i2
	add %i2, %i5, %i2
	st %i2, [%fp+-2488]
	xor %i2, %o4, %i3
	xor %i0, %l2, %i2
	st %i2, [%fp+-1524]
	st %i3, [%fp+-1532]
	ld [%fp+-2520], %i0
	ld [%fp+-2720], %g3
	add %i0, %g3, %i2
	ld [%fp+-2612], %i0
	xor %i2, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o3
	ld [%fp+-2512], %i0
	ld [%fp+-2716], %g4
	add %i0, %g4, %o4
	ld [%fp+-2604], %i0
	xor %o4, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o5
	ld [%fp+-2708], %i0
	xor %l6, %i0, %i3
	xor %l1, %l7, %i5
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l0
	st %l0, [%fp+-2612]
	srl %i5, 8, %i3
	sll %i5, 24, %i5
	or %i5, %i3, %l3
	ldd [%fp+-2376], %i4
	ld [%fp+-2608], %i0
	add %i0, %i4, %i5
	add %i5, %o3, %l1
	xor %l1, %g3, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %i3
	st %i3, [%fp+-2608]
	ldd [%fp+-2368], %i4
	ld [%fp+-2600], %i0
	add %i0, %i4, %i5
	add %i5, %o5, %l6
	xor %l6, %g4, %i5
	srl %i5, 8, %i0
	sll %i5, 24, %i5
	or %i5, %i0, %l7
	add %i3, %i2, %i0
	st %i0, [%fp+-2772]
	xor %i0, %o3, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g3
	st %g3, [%fp+-2696]
	add %l7, %o4, %i0
	st %i0, [%fp+-2768]
	xor %i0, %o5, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i3
	st %i3, [%fp+-2764]
	ldd [%fp+-2280], %i4
	ld [%fp+-2760], %i0
	add %i0, %i5, %i0
	ldd [%fp+-2336], %i4
	add %o1, %i5, %i2
	add %i2, %i3, %i2
	st %i2, [%fp+-2588]
	add %i0, %g3, %i3
	st %i3, [%fp+-2704]
	add %fp, -692, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2708]
	add %fp, -700, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2716]
	add %fp, -1524, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2720]
	add %fp, -1532, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2796]
	xor %i3, %l0, %o5
	xor %i2, %l3, %o4
	lduh [%fp+-692], %i0
	st %i0, [%fp+-2740]
	lduh [%fp+-700], %i0
	st %i0, [%fp+-2800]
	lduh [%fp+-1524], %i0
	st %i0, [%fp+-2808]
	lduh [%fp+-1532], %i0
	st %i0, [%fp+-2824]
	st %o4, [%fp+-740]
	st %o5, [%fp+-748]
	ld [%fp+-2504], %i0
	ld [%fp+-2656], %l5
	add %i0, %l5, %o3
	ld [%fp+-2596], %i0
	xor %o3, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o4
	ld [%fp+-2472], %i0
	ld [%fp+-2652], %g3
	add %i0, %g3, %o5
	ld [%fp+-2592], %i0
	xor %o5, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o1
	xor %i1, %o7, %i0
	xor %g2, %l4, %i1
	srl %i0, 8, %i2
	sll %i0, 24, %i0
	or %i0, %i2, %o7
	st %o7, [%fp+-2472]
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %g4
	ldd [%fp+-2360], %i0
	ld [%fp+-2584], %i2
	add %i2, %i0, %i1
	add %i1, %o4, %i3
	xor %i3, %l5, %i1
	srl %i1, 8, %g2
	sll %i1, 24, %i1
	or %i1, %g2, %l0
	ldd [%fp+-2352], %i0
	ld [%fp+-2580], %i2
	add %i2, %i0, %i1
	add %i1, %o1, %i2
	xor %i2, %g3, %i1
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %i1
	add %l0, %o3, %i0
	st %i0, [%fp+-2628]
	xor %i0, %o4, %i0
	srl %i0, 7, %o3
	sll %i0, 25, %i0
	or %i0, %o3, %o3
	st %o3, [%fp+-2632]
	add %i1, %o5, %i0
	st %i0, [%fp+-2624]
	xor %i0, %o1, %i0
	srl %i0, 7, %o1
	sll %i0, 25, %i0
	or %i0, %o1, %o1
	st %o1, [%fp+-2616]
	ldd [%fp+-2464], %l4
	add %o0, %l5, %i0
	ldd [%fp+-2456], %g2
	add %o2, %g3, %o0
	add %o0, %o1, %o2
	st %o2, [%fp+-2512]
	add %i0, %o3, %i0
	st %i0, [%fp+-2520]
	xor %i0, %o7, %o1
	xor %o2, %g4, %o0
	st %o0, [%fp+-1572]
	st %o1, [%fp+-1580]
	ld [%fp+-2688], %i0
	ld [%fp+-2792], %o0
	add %o0, %i0, %o1
	st %o1, [%fp+-2760]
	ld [%fp+-2660], %i0
	ld [%fp+-2788], %o0
	add %o0, %i0, %o0
	st %o0, [%fp+-2788]
	ld [%fp+-2724], %i0
	xor %o0, %i0, %i0
	srl %i0, 7, %o0
	sll %i0, 25, %i0
	or %i0, %o0, %o3
	st %o3, [%fp+-2604]
	ld [%fp+-2744], %i0
	xor %o1, %i0, %i0
	srl %i0, 7, %o0
	sll %i0, 25, %i0
	or %i0, %o0, %o2
	st %o2, [%fp+-2504]
	ldd [%fp+-2240], %o0
	add %l1, %o1, %i0
	ldd [%fp+-2296], %o0
	add %l6, %o1, %l1
	add %l1, %o2, %l1
	st %l1, [%fp+-2496]
	add %i0, %o3, %i0
	st %i0, [%fp+-2600]
	ld [%fp+-2732], %l6
	xor %i0, %l6, %o1
	ld [%fp+-2756], %i0
	xor %l1, %i0, %o0
	add %fp, -740, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2656]
	add %fp, -748, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2660]
	add %fp, -1572, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2744]
	add %fp, -1580, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2756]
	lduh [%fp+-740], %i0
	st %i0, [%fp+-2724]
	lduh [%fp+-748], %i0
	st %i0, [%fp+-2728]
	lduh [%fp+-1572], %o5
	lduh [%fp+-1580], %o3
	st %o0, [%fp+-708]
	st %o1, [%fp+-716]
	ld [%fp+-2648], %i0
	add %l2, %i0, %l1
	st %l1, [%fp+-2648]
	ld [%fp+-2804], %i0
	ld [%fp+-2820], %l2
	add %l2, %i0, %i0
	st %i0, [%fp+-2652]
	ld [%fp+-2812], %l2
	xor %i0, %l2, %i0
	srl %i0, 7, %l2
	sll %i0, 25, %i0
	or %i0, %l2, %l6
	st %l6, [%fp+-2596]
	ld [%fp+-2816], %i0
	xor %l1, %i0, %i0
	srl %i0, 7, %l2
	sll %i0, 25, %i0
	or %i0, %l2, %l1
	st %l1, [%fp+-2592]
	ldd [%fp+-2392], %o0
	add %i3, %o1, %i0
	ldd [%fp+-2384], %o0
	add %i2, %o1, %i2
	add %i2, %l1, %l1
	st %l1, [%fp+-2580]
	add %i0, %l6, %i0
	st %i0, [%fp+-2584]
	ld [%fp+-2692], %i2
	xor %i0, %i2, %i3
	ld [%fp+-2828], %i0
	xor %l1, %i0, %i2
	st %i2, [%fp+-1540]
	st %i3, [%fp+-1548]
	ld [%fp+-2636], %i0
	add %l3, %i0, %i3
	st %i3, [%fp+-2636]
	ld [%fp+-2620], %i0
	ld [%fp+-2612], %i2
	add %i2, %i0, %i0
	st %i0, [%fp+-2620]
	ld [%fp+-2752], %i2
	xor %i0, %i2, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %o4
	ld [%fp+-2748], %i0
	xor %i3, %i0, %i2
	srl %i2, 7, %i3
	sll %i2, 25, %i2
	or %i2, %i3, %l1
	st %l1, [%fp+-2732]
	ld [%fp+-2684], %i0
	ldd [%fp+-2280], %i2
	add %i0, %i2, %i2
	ld [%fp+-2712], %i0
	add %i0, %i4, %i3
	add %i3, %l1, %i0
	st %i0, [%fp+-2688]
	add %i2, %o4, %i2
	st %i2, [%fp+-2684]
	ld [%fp+-2608], %i3
	xor %i2, %i3, %o1
	xor %i0, %l7, %o0
	add %fp, -708, %i2
	or %i2, 2, %i2
	lduh [%i2], %o2
	add %fp, -716, %i3
	or %i3, 2, %i3
	lduh [%i3], %l2
	add %fp, -1540, %i3
	or %i3, 2, %i3
	lduh [%i3], %l3
	add %fp, -1548, %i3
	or %i3, 2, %i3
	lduh [%i3], %l1
	lduh [%fp+-708], %i0
	st %i0, [%fp+-2712]
	lduh [%fp+-716], %l6
	lduh [%fp+-1540], %l7
	lduh [%fp+-1548], %o7
	st %o0, [%fp+-660]
	st %o1, [%fp+-668]
	ld [%fp+-2700], %i0
	add %g4, %i0, %i0
	st %i0, [%fp+-2608]
	ld [%fp+-2776], %i2
	ld [%fp+-2472], %i3
	add %i3, %i2, %i2
	st %i2, [%fp+-2612]
	ld [%fp+-2780], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i2
	st %i2, [%fp+-2700]
	ld [%fp+-2784], %i3
	xor %i0, %i3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+-2692]
	ld [%fp+-2680], %i3
	add %i3, %l4, %i3
	ld [%fp+-2676], %i4
	add %i4, %g2, %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2676]
	add %i3, %i2, %i2
	st %i2, [%fp+-2680]
	xor %i2, %l0, %i5
	xor %i0, %i1, %i4
	st %i4, [%fp+-1492]
	st %i5, [%fp+-1500]
	add %fp, -660, %i1
	or %i1, 2, %i1
	lduh [%i1], %i4
	add %fp, -668, %i1
	or %i1, 2, %i1
	lduh [%i1], %i5
	add %fp, -1492, %i1
	or %i1, 2, %i1
	lduh [%i1], %g2
	add %fp, -1500, %i1
	or %i1, 2, %i1
	lduh [%i1], %o0
	add %fp, -1536, %i1
	or %i1, 2, %i1
	lduh [%fp+-660], %o1
	lduh [%fp+-668], %i3
	lduh [%fp+-1492], %i2
	lduh [%fp+-1500], %i0
	ld [%fp+-2824], %g3
	sth %g3, [%i1]
	add %fp, -1528, %i1
	or %i1, 2, %i1
	ld [%fp+-2808], %g3
	sth %g3, [%i1]
	ld [%fp+-2796], %i1
	sth %i1, [%fp+-1536]
	ld [%fp+-2720], %i1
	sth %i1, [%fp+-1528]
	add %fp, -704, %i1
	or %i1, 2, %i1
	ld [%fp+-1536], %l0
	st %l0, [%fp+-2808]
	ld [%fp+-1528], %g3
	st %g3, [%fp+-2472]
	ld [%fp+-2800], %g3
	sth %g3, [%i1]
	add %fp, -696, %i1
	or %i1, 2, %i1
	ld [%fp+-2740], %g3
	sth %g3, [%i1]
	ld [%fp+-2716], %i1
	sth %i1, [%fp+-704]
	ld [%fp+-2708], %i1
	sth %i1, [%fp+-696]
	add %fp, -1584, %i1
	or %i1, 2, %i1
	ld [%fp+-704], %l4
	st %l4, [%fp+-2720]
	ld [%fp+-696], %l5
	st %l5, [%fp+-2736]
	sth %o3, [%i1]
	add %fp, -1576, %i1
	or %i1, 2, %i1
	sth %o5, [%i1]
	ld [%fp+-2756], %i1
	sth %i1, [%fp+-1584]
	ld [%fp+-2744], %i1
	sth %i1, [%fp+-1576]
	add %fp, -752, %i1
	or %i1, 2, %i1
	ld [%fp+-1584], %g3
	st %g3, [%fp+-2744]
	ld [%fp+-1576], %g3
	st %g3, [%fp+-2740]
	ld [%fp+-2728], %g3
	sth %g3, [%i1]
	add %fp, -744, %i1
	or %i1, 2, %i1
	ld [%fp+-2724], %g3
	sth %g3, [%i1]
	ld [%fp+-2660], %i1
	sth %i1, [%fp+-752]
	ld [%fp+-2656], %i1
	sth %i1, [%fp+-744]
	add %fp, -1552, %i1
	or %i1, 2, %o3
	ld [%fp+-752], %i1
	ld [%fp+-744], %o5
	sth %o7, [%o3]
	add %fp, -1544, %o3
	or %o3, 2, %o3
	sth %l7, [%o3]
	sth %l1, [%fp+-1552]
	sth %l3, [%fp+-1544]
	add %fp, -720, %g4
	or %g4, 2, %g4
	ld [%fp+-1552], %g3
	st %g3, [%fp+-2660]
	ld [%fp+-1544], %g3
	st %g3, [%fp+-2656]
	sth %l6, [%g4]
	add %fp, -712, %g4
	or %g4, 2, %g4
	ld [%fp+-2712], %g3
	sth %g3, [%g4]
	sth %l2, [%fp+-720]
	sth %o2, [%fp+-712]
	add %fp, -1504, %g3
	or %g3, 2, %g3
	ld [%fp+-720], %g4
	st %g4, [%fp+-2716]
	ld [%fp+-712], %g4
	st %g4, [%fp+-2708]
	sth %i0, [%g3]
	add %fp, -1496, %i0
	or %i0, 2, %i0
	sth %i2, [%i0]
	sth %o0, [%fp+-1504]
	sth %g2, [%fp+-1496]
	add %fp, -672, %i0
	or %i0, 2, %i0
	ld [%fp+-1504], %o7
	ld [%fp+-1496], %l3
	sth %i3, [%i0]
	add %fp, -664, %i0
	or %i0, 2, %i0
	sth %o1, [%i0]
	sth %i5, [%fp+-672]
	sth %i4, [%fp+-664]
	ld [%fp+-2772], %i0
	add %i0, %l4, %i2
	st %i2, [%fp+-2712]
	ld [%fp+-2672], %i0
	xor %i2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o0
	st %o0, [%fp+-2784]
	ld [%fp+-2768], %i0
	add %i0, %l5, %i2
	st %i2, [%fp+-2728]
	ld [%fp+-2664], %i0
	xor %i2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l2
	st %l2, [%fp+-2780]
	ld [%fp+-2788], %i0
	add %i0, %i1, %i0
	st %i0, [%fp+-2664]
	ld [%fp+-2696], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i5
	st %i5, [%fp+-2696]
	ld [%fp+-2760], %i0
	add %i0, %o5, %i0
	st %i0, [%fp+-2672]
	ld [%fp+-2764], %i2
	xor %i0, %i2, %i0
	ld [%fp+-672], %g3
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %g2
	st %g2, [%fp+-2724]
	ld [%fp+-2640], %i0
	add %i0, %g3, %i2
	xor %i2, %o4, %i0
	ld [%fp+-664], %i4
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %g4
	ld [%fp+-2644], %i0
	add %i0, %i4, %l1
	ld [%fp+-2732], %i0
	xor %l1, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %i0
	ldd [%fp+-2312], %l6
	ld [%fp+-2704], %i3
	add %i3, %l6, %i3
	add %i3, %i5, %i3
	st %i3, [%fp+-2756]
	xor %i3, %i1, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %o2
	st %o2, [%fp+-2764]
	ldd [%fp+-2248], %l4
	ld [%fp+-2588], %i1
	add %i1, %l4, %i1
	add %i1, %g2, %i1
	st %i1, [%fp+-2760]
	xor %i1, %o5, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %g2
	st %g2, [%fp+-2768]
	ld [%fp+-2684], %i1
	add %i1, %l7, %i1
	add %i1, %g4, %i1
	st %i1, [%fp+-2684]
	xor %i1, %g3, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %i5
	st %i5, [%fp+-2748]
	ld [%fp+-2688], %i1
	add %i1, %l5, %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2732]
	xor %i1, %i4, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %i3
	st %i3, [%fp+-2752]
	add %i5, %i2, %i1
	st %i1, [%fp+-2640]
	xor %i1, %g4, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i5
	st %i5, [%fp+-2704]
	add %i3, %l1, %i1
	st %i1, [%fp+-2644]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2688]
	ldd [%fp+-2224], %i0
	ld [%fp+-2544], %i2
	add %i2, %i1, %i1
	ldd [%fp+-2216], %i2
	ld [%fp+-2568], %i0
	add %i0, %i3, %i0
	add %i0, %l2, %l7
	add %i1, %o0, %l2
	ldd [%fp+-2296], %i0
	add %l7, %i0, %i1
	add %i1, %i4, %i2
	st %i2, [%fp+-2588]
	ldd [%fp+-2240], %i0
	add %l2, %i0, %i1
	add %i1, %i5, %i0
	st %i0, [%fp+-2544]
	xor %i0, %o2, %i5
	xor %i2, %g2, %i4
	st %i4, [%fp+-772]
	st %i5, [%fp+-780]
	ld [%fp+-2628], %i0
	add %i0, %l0, %o5
	ld [%fp+-2576], %i0
	xor %o5, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o2
	ld [%fp+-2624], %i0
	ld [%fp+-2472], %i1
	add %i0, %i1, %i1
	st %i1, [%fp+-2628]
	ld [%fp+-2552], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o4
	ld [%fp+-2652], %i0
	ld [%fp+-2744], %l1
	add %i0, %l1, %i1
	st %i1, [%fp+-2652]
	ld [%fp+-2632], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l5
	st %l5, [%fp+-2772]
	ld [%fp+-2648], %i0
	ld [%fp+-2740], %i5
	add %i0, %i5, %i1
	st %i1, [%fp+-2648]
	ld [%fp+-2616], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l6
	st %l6, [%fp+-2776]
	ld [%fp+-2536], %i0
	add %i0, %o7, %i4
	ld [%fp+-2700], %i0
	xor %i4, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g4
	ld [%fp+-2528], %i0
	add %i0, %l3, %l0
	ld [%fp+-2692], %i0
	xor %l0, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l4
	ldd [%fp+-2408], %g2
	ld [%fp+-2520], %i0
	add %i0, %g2, %i1
	add %i1, %l5, %o3
	xor %o3, %l1, %i1
	srl %i1, 8, %l5
	sll %i1, 24, %i1
	or %i1, %l5, %i3
	st %i3, [%fp+-2788]
	ldd [%fp+-2400], %o0
	ld [%fp+-2512], %i0
	add %i0, %o0, %i1
	add %i1, %l6, %l1
	xor %l1, %i5, %l5
	srl %l5, 8, %l6
	sll %l5, 24, %l5
	or %l5, %l6, %l6
	st %l6, [%fp+-2796]
	ld [%fp+-2680], %i0
	add %i0, %g3, %l5
	add %l5, %g4, %i0
	st %i0, [%fp+-2624]
	xor %i0, %o7, %g2
	srl %g2, 8, %l5
	sll %g2, 24, %g2
	or %g2, %l5, %i1
	st %i1, [%fp+-2692]
	ld [%fp+-2676], %i0
	add %i0, %o1, %g2
	add %g2, %l4, %i0
	st %i0, [%fp+-2680]
	xor %i0, %l3, %g2
	srl %g2, 8, %l3
	sll %g2, 24, %g2
	or %g2, %l3, %i2
	st %i2, [%fp+-2792]
	add %i1, %i4, %i0
	st %i0, [%fp+-2520]
	xor %i0, %g4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %g3
	st %g3, [%fp+-2576]
	add %i2, %l0, %i0
	st %i0, [%fp+-2512]
	xor %i0, %l4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %g4
	st %g4, [%fp+-2568]
	ldd [%fp+-2232], %i0
	ld [%fp+-2488], %i2
	add %i2, %i1, %i4
	ldd [%fp+-2344], %i0
	ld [%fp+-2480], %i2
	add %i2, %i1, %g2
	add %g2, %o4, %i1
	add %i4, %o2, %i0
	ldd [%fp+-2384], %i4
	add %i1, %i4, %i4
	add %i4, %g4, %i2
	st %i2, [%fp+-2480]
	ldd [%fp+-2392], %i4
	add %i0, %i4, %i4
	add %i4, %g3, %i4
	st %i4, [%fp+-2488]
	xor %i4, %i3, %o1
	xor %i2, %l6, %o0
	st %o0, [%fp+-1604]
	st %o1, [%fp+-1612]
	ld [%fp+-2620], %i2
	ld [%fp+-2716], %i5
	add %i2, %i5, %i3
	st %i3, [%fp+-2812]
	ld [%fp+-2604], %i2
	xor %i3, %i2, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %g4
	st %g4, [%fp+-2816]
	ld [%fp+-2636], %i2
	ld [%fp+-2708], %g3
	add %i2, %g3, %i3
	st %i3, [%fp+-2824]
	ld [%fp+-2504], %i2
	xor %i3, %i2, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %l0
	st %l0, [%fp+-2820]
	ld [%fp+-2720], %i2
	xor %l2, %i2, %i3
	ld [%fp+-2736], %i2
	xor %l7, %i2, %i4
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %g2
	st %g2, [%fp+-2800]
	srl %i4, 8, %i3
	sll %i4, 24, %i4
	or %i4, %i3, %l4
	st %l4, [%fp+-2804]
	ldd [%fp+-2448], %o0
	ld [%fp+-2600], %i2
	add %i2, %o1, %i3
	add %i3, %g4, %g4
	xor %g4, %i5, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l5
	st %l5, [%fp+-2836]
	ldd [%fp+-2440], %l2
	ld [%fp+-2496], %i2
	add %i2, %l3, %i3
	add %i3, %l0, %i5
	xor %i5, %g3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o7
	ld [%fp+-2712], %i2
	add %g2, %i2, %i2
	st %i2, [%fp+-2504]
	ld [%fp+-2784], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %g2
	sll %i3, 25, %i3
	or %i3, %g2, %l0
	st %l0, [%fp+-2700]
	ld [%fp+-2728], %i2
	add %l4, %i2, %i2
	st %i2, [%fp+-2496]
	ld [%fp+-2780], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %g2
	sll %i3, 25, %i3
	or %i3, %g2, %i4
	st %i4, [%fp+-2676]
	ldd [%fp+-2328], %g2
	ld [%fp+-2756], %i2
	add %i2, %g2, %i3
	ldd [%fp+-2272], %g2
	ld [%fp+-2760], %i2
	add %i2, %g2, %g2
	add %g2, %i4, %i2
	st %i2, [%fp+-2552]
	add %i3, %l0, %i4
	st %i4, [%fp+-2736]
	add %fp, -772, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2636]
	add %fp, -780, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2716]
	add %fp, -1604, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2720]
	add %fp, -1612, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2728]
	xor %i4, %l5, %l5
	xor %i2, %o7, %l4
	lduh [%fp+-772], %i2
	st %i2, [%fp+-2740]
	lduh [%fp+-780], %i2
	st %i2, [%fp+-2744]
	lduh [%fp+-1604], %i2
	st %i2, [%fp+-2756]
	lduh [%fp+-1612], %i2
	st %i2, [%fp+-2780]
	st %l4, [%fp+-804]
	st %l5, [%fp+-812]
	ld [%fp+-2612], %i2
	ld [%fp+-2660], %i4
	add %i2, %i4, %i3
	st %i3, [%fp+-2712]
	ld [%fp+-2596], %i2
	xor %i3, %i2, %i3
	srl %i3, 12, %g2
	sll %i3, 20, %i3
	or %i3, %g2, %g2
	st %g2, [%fp+-2832]
	ld [%fp+-2608], %i2
	ld [%fp+-2656], %l6
	add %i2, %l6, %i3
	st %i3, [%fp+-2708]
	ld [%fp+-2592], %i2
	xor %i3, %i2, %i3
	srl %i3, 12, %l0
	sll %i3, 20, %i3
	or %i3, %l0, %i3
	st %i3, [%fp+-2828]
	ld [%fp+-2808], %i2
	xor %i0, %i2, %i0
	ld [%fp+-2472], %i2
	xor %i1, %i2, %i1
	srl %i0, 8, %i2
	sll %i0, 24, %i0
	or %i0, %i2, %i2
	st %i2, [%fp+-2784]
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %l7
	st %l7, [%fp+-2472]
	ldd [%fp+-2432], %l4
	ld [%fp+-2584], %i0
	add %i0, %l5, %i0
	add %i0, %g2, %l0
	xor %l0, %i4, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %i4
	ldd [%fp+-2424], %g2
	ld [%fp+-2580], %i0
	add %i0, %g3, %i0
	add %i0, %i3, %i1
	xor %i1, %l6, %i3
	srl %i3, 8, %i0
	sll %i3, 24, %i3
	or %i3, %i0, %i3
	add %i2, %o5, %i0
	st %i0, [%fp+-2536]
	xor %i0, %o2, %i0
	srl %i0, 7, %o2
	sll %i0, 25, %i0
	or %i0, %o2, %o2
	st %o2, [%fp+-2632]
	ld [%fp+-2628], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+-2528]
	xor %i0, %o4, %i0
	srl %i0, 7, %l7
	sll %i0, 25, %i0
	or %i0, %l7, %o4
	st %o4, [%fp+-2628]
	ldd [%fp+-2320], %l6
	add %o3, %l6, %i0
	ldd [%fp+-2416], %l6
	add %l1, %l6, %l1
	add %l1, %o4, %l1
	st %l1, [%fp+-2616]
	add %i0, %o2, %i0
	st %i0, [%fp+-2620]
	xor %i0, %i4, %o5
	xor %l1, %i3, %o4
	st %o4, [%fp+-1636]
	st %o5, [%fp+-1644]
	ld [%fp+-2672], %i0
	ld [%fp+-2768], %l1
	add %l1, %i0, %o3
	st %o3, [%fp+-2760]
	ld [%fp+-2664], %i0
	ld [%fp+-2764], %l1
	add %l1, %i0, %l1
	st %l1, [%fp+-2764]
	ld [%fp+-2696], %i0
	xor %l1, %i0, %i0
	srl %i0, 7, %l1
	sll %i0, 25, %i0
	or %i0, %l1, %o2
	st %o2, [%fp+-2612]
	ld [%fp+-2724], %i0
	xor %o3, %i0, %i0
	srl %i0, 7, %l1
	sll %i0, 25, %i0
	or %i0, %l1, %l1
	st %l1, [%fp+-2604]
	add %g4, %o0, %i0
	add %i5, %l2, %i5
	add %i5, %l1, %i5
	st %i5, [%fp+-2600]
	add %i0, %o2, %i0
	st %i0, [%fp+-2608]
	ld [%fp+-2748], %g4
	xor %i0, %g4, %o5
	ld [%fp+-2752], %i0
	xor %i5, %i0, %o4
	add %fp, -804, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2656]
	add %fp, -812, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2660]
	add %fp, -1636, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2752]
	add %fp, -1644, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2840]
	lduh [%fp+-804], %i0
	st %i0, [%fp+-2768]
	lduh [%fp+-812], %i0
	st %i0, [%fp+-2808]
	lduh [%fp+-1636], %i0
	st %i0, [%fp+-2844]
	lduh [%fp+-1644], %i0
	st %i0, [%fp+-2848]
	st %o4, [%fp+-756]
	st %o5, [%fp+-764]
	ld [%fp+-2648], %i0
	ld [%fp+-2796], %i5
	add %i5, %i0, %i0
	st %i0, [%fp+-2648]
	ld [%fp+-2652], %i5
	ld [%fp+-2788], %g4
	add %g4, %i5, %i5
	st %i5, [%fp+-2652]
	ld [%fp+-2772], %g4
	xor %i5, %g4, %i5
	srl %i5, 7, %l2
	sll %i5, 25, %i5
	or %i5, %l2, %g4
	st %g4, [%fp+-2596]
	ld [%fp+-2776], %i5
	xor %i0, %i5, %i5
	srl %i5, 7, %l2
	sll %i5, 25, %i5
	or %i5, %l2, %i0
	st %i0, [%fp+-2592]
	add %l0, %l4, %i2
	add %i1, %g2, %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2580]
	add %i2, %g4, %i1
	st %i1, [%fp+-2584]
	ld [%fp+-2692], %i2
	xor %i1, %i2, %o5
	ld [%fp+-2792], %i1
	xor %i0, %i1, %o4
	st %o4, [%fp+-1588]
	st %o5, [%fp+-1596]
	ld [%fp+-2824], %i0
	add %o7, %i0, %o1
	ld [%fp+-2812], %i0
	ld [%fp+-2836], %i1
	add %i1, %i0, %g4
	ld [%fp+-2816], %i0
	xor %g4, %i0, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %o4
	ld [%fp+-2820], %i0
	xor %o1, %i0, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i5
	st %i5, [%fp+-2748]
	ld [%fp+-2684], %i0
	ldd [%fp+-2328], %g2
	add %i0, %g3, %i1
	ldd [%fp+-2272], %l2
	ld [%fp+-2732], %i0
	add %i0, %l3, %i2
	add %i2, %i5, %i2
	st %i2, [%fp+-2664]
	add %i1, %o4, %i0
	st %i0, [%fp+-2672]
	ld [%fp+-2800], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2804], %i5
	xor %i2, %i5, %i0
	add %fp, -756, %i2
	or %i2, 2, %i2
	lduh [%i2], %o2
	add %fp, -764, %i2
	or %i2, 2, %i2
	lduh [%i2], %l2
	add %fp, -1588, %l3
	or %l3, 2, %l3
	lduh [%l3], %l3
	add %fp, -1596, %o3
	or %o3, 2, %o3
	lduh [%o3], %o3
	lduh [%fp+-756], %o5
	lduh [%fp+-764], %l1
	lduh [%fp+-1588], %g3
	lduh [%fp+-1596], %i5
	st %i0, [%fp+-724]
	st %i1, [%fp+-732]
	ld [%fp+-2708], %i0
	add %i3, %i0, %i2
	st %i2, [%fp+-2708]
	ld [%fp+-2712], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+-2712]
	ld [%fp+-2832], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2696]
	ld [%fp+-2828], %i0
	xor %i2, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+-2692]
	ld [%fp+-2624], %i0
	ldd [%fp+-2320], %l4
	add %i0, %l5, %i0
	ld [%fp+-2680], %i1
	add %i1, %l7, %i1
	add %i1, %i2, %i3
	st %i3, [%fp+-2680]
	add %i0, %i4, %i0
	st %i0, [%fp+-2684]
	ld [%fp+-2784], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2472], %i2
	xor %i3, %i2, %i0
	st %i0, [%fp+-1556]
	st %i1, [%fp+-1564]
	add %fp, -724, %i0
	or %i0, 2, %i0
	lduh [%i0], %i4
	add %fp, -732, %i0
	or %i0, 2, %i0
	lduh [%i0], %g2
	add %fp, -1556, %i0
	or %i0, 2, %i0
	lduh [%i0], %l0
	add %fp, -1564, %i0
	or %i0, 2, %i0
	lduh [%i0], %l4
	add %fp, -1616, %i0
	or %i0, 2, %i0
	lduh [%fp+-724], %l5
	lduh [%fp+-732], %l6
	lduh [%fp+-1556], %o0
	lduh [%fp+-1564], %i3
	ld [%fp+-2780], %i1
	sth %i1, [%i0]
	add %fp, -1608, %i0
	or %i0, 2, %i0
	ld [%fp+-2756], %i1
	sth %i1, [%i0]
	ld [%fp+-2728], %i0
	sth %i0, [%fp+-1616]
	ld [%fp+-2720], %i0
	sth %i0, [%fp+-1608]
	add %fp, -784, %i0
	or %i0, 2, %i0
	ld [%fp+-1616], %i1
	st %i1, [%fp+-2728]
	ld [%fp+-1608], %i1
	st %i1, [%fp+-2472]
	ld [%fp+-2744], %i1
	sth %i1, [%i0]
	add %fp, -776, %i0
	or %i0, 2, %i0
	ld [%fp+-2740], %i1
	sth %i1, [%i0]
	ld [%fp+-2716], %i0
	sth %i0, [%fp+-784]
	ld [%fp+-2636], %i0
	sth %i0, [%fp+-776]
	add %fp, -1648, %i0
	or %i0, 2, %i0
	ld [%fp+-784], %i1
	st %i1, [%fp+-2716]
	ld [%fp+-776], %i2
	st %i2, [%fp+-2724]
	ld [%fp+-2848], %l7
	sth %l7, [%i0]
	add %fp, -1640, %i0
	or %i0, 2, %i0
	ld [%fp+-2844], %l7
	sth %l7, [%i0]
	ld [%fp+-2840], %i0
	sth %i0, [%fp+-1648]
	ld [%fp+-2752], %i0
	sth %i0, [%fp+-1640]
	add %fp, -816, %i0
	or %i0, 2, %i0
	ld [%fp+-1648], %l7
	st %l7, [%fp+-2752]
	ld [%fp+-1640], %l7
	st %l7, [%fp+-2740]
	ld [%fp+-2808], %l7
	sth %l7, [%i0]
	add %fp, -808, %i0
	or %i0, 2, %i0
	ld [%fp+-2768], %l7
	sth %l7, [%i0]
	ld [%fp+-2660], %i0
	sth %i0, [%fp+-816]
	ld [%fp+-2656], %i0
	sth %i0, [%fp+-808]
	add %fp, -1600, %i0
	or %i0, 2, %i0
	ld [%fp+-816], %l7
	ld [%fp+-808], %o7
	sth %i5, [%i0]
	add %fp, -1592, %i0
	or %i0, 2, %i0
	sth %g3, [%i0]
	sth %o3, [%fp+-1600]
	sth %l3, [%fp+-1592]
	add %fp, -768, %i0
	or %i0, 2, %i0
	ld [%fp+-1600], %i5
	st %i5, [%fp+-2660]
	ld [%fp+-1592], %i5
	st %i5, [%fp+-2656]
	sth %l1, [%i0]
	add %fp, -760, %i0
	or %i0, 2, %i0
	sth %o5, [%i0]
	sth %l2, [%fp+-768]
	sth %o2, [%fp+-760]
	add %fp, -1568, %i0
	or %i0, 2, %i0
	ld [%fp+-768], %o2
	ld [%fp+-760], %i5
	st %i5, [%fp+-2720]
	sth %i3, [%i0]
	add %fp, -1560, %i0
	or %i0, 2, %i0
	sth %o0, [%i0]
	sth %l4, [%fp+-1568]
	sth %l0, [%fp+-1560]
	add %fp, -736, %i0
	or %i0, 2, %i0
	ld [%fp+-1568], %o0
	ld [%fp+-1560], %o3
	sth %l6, [%i0]
	add %fp, -728, %i0
	or %i0, 2, %i0
	sth %l5, [%i0]
	sth %g2, [%fp+-736]
	sth %i4, [%fp+-728]
	add %g4, %i1, %i0
	st %i0, [%fp+-2624]
	ld [%fp+-2704], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l4
	st %l4, [%fp+-2756]
	add %o1, %i2, %i0
	st %i0, [%fp+-2636]
	ld [%fp+-2688], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l5
	st %l5, [%fp+-2744]
	ld [%fp+-2640], %i0
	add %i0, %l7, %i5
	ld [%fp+-2700], %i0
	xor %i5, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l3
	ld [%fp+-2644], %i0
	add %i0, %o7, %g4
	ld [%fp+-2676], %i0
	xor %g4, %i0, %i0
	ld [%fp+-736], %l2
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %o5
	ld [%fp+-2764], %i0
	add %i0, %l2, %i0
	st %i0, [%fp+-2676]
	xor %i0, %o4, %i0
	ld [%fp+-728], %g2
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %i2
	st %i2, [%fp+-2732]
	ld [%fp+-2760], %i0
	add %i0, %g2, %i0
	st %i0, [%fp+-2700]
	ld [%fp+-2748], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %i4
	st %i4, [%fp+-2748]
	ldd [%fp+-2280], %l0
	ld [%fp+-2736], %i0
	add %i0, %l1, %i0
	add %i0, %l3, %i0
	st %i0, [%fp+-2764]
	xor %i0, %l7, %i0
	srl %i0, 8, %i1
	sll %i0, 24, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2736]
	ldd [%fp+-2336], %i0
	ld [%fp+-2552], %i3
	add %i3, %i1, %i0
	add %i0, %o5, %i0
	st %i0, [%fp+-2768]
	xor %i0, %o7, %i0
	srl %i0, 8, %i3
	sll %i0, 24, %i0
	or %i0, %i3, %l0
	st %l0, [%fp+-2760]
	ldd [%fp+-2448], %i0
	ld [%fp+-2672], %i3
	add %i3, %i1, %i0
	add %i0, %i2, %i0
	st %i0, [%fp+-2688]
	xor %i0, %l2, %i0
	srl %i0, 8, %i3
	sll %i0, 24, %i0
	or %i0, %i3, %l1
	st %l1, [%fp+-2792]
	ldd [%fp+-2440], %i0
	ld [%fp+-2664], %i2
	add %i2, %i1, %i0
	add %i0, %i4, %i0
	st %i0, [%fp+-2704]
	xor %i0, %g2, %i0
	srl %i0, 8, %i3
	sll %i0, 24, %i0
	or %i0, %i3, %l7
	st %l7, [%fp+-2796]
	add %g3, %i5, %i0
	st %i0, [%fp+-2640]
	xor %i0, %l3, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %g2
	st %g2, [%fp+-2672]
	add %l0, %g4, %i0
	st %i0, [%fp+-2644]
	xor %i0, %o5, %i0
	srl %i0, 7, %i3
	sll %i0, 25, %i0
	or %i0, %i3, %i2
	st %i2, [%fp+-2664]
	ldd [%fp+-2264], %i0
	ld [%fp+-2544], %i3
	add %i3, %i1, %i0
	ldd [%fp+-2256], %i4
	ld [%fp+-2588], %i1
	add %i1, %i5, %i3
	add %i3, %l5, %l2
	add %i0, %l4, %l6
	ldd [%fp+-2216], %i0
	add %l2, %i0, %i0
	add %i0, %i2, %i1
	st %i1, [%fp+-2552]
	ldd [%fp+-2224], %i2
	add %l6, %i2, %i0
	add %i0, %g2, %i0
	st %i0, [%fp+-2544]
	xor %i0, %l1, %i5
	xor %i1, %l7, %i4
	st %i4, [%fp+-820]
	st %i5, [%fp+-828]
	ld [%fp+-2728], %l5
	ld [%fp+-2712], %i0
	add %i0, %l5, %i1
	st %i1, [%fp+-2776]
	ld [%fp+-2576], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l1
	st %l1, [%fp+-2780]
	ld [%fp+-2472], %i0
	ld [%fp+-2708], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2788]
	ld [%fp+-2568], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l3
	st %l3, [%fp+-2784]
	ld [%fp+-2520], %i0
	ld [%fp+-2752], %l0
	add %i0, %l0, %i0
	ld [%fp+-2632], %i1
	xor %i0, %i1, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %i3
	ld [%fp+-2512], %i1
	ld [%fp+-2740], %i2
	add %i1, %i2, %i4
	ld [%fp+-2628], %i1
	xor %i4, %i1, %i5
	srl %i5, 12, %g2
	sll %i5, 20, %i5
	or %i5, %g2, %i5
	ld [%fp+-2652], %i1
	add %i1, %o0, %g2
	st %g2, [%fp+-2632]
	ld [%fp+-2696], %i1
	xor %g2, %i1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %l7
	st %l7, [%fp+-2816]
	ld [%fp+-2648], %i1
	add %i1, %o3, %g2
	st %g2, [%fp+-2648]
	ld [%fp+-2692], %i1
	xor %g2, %i1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %o1
	st %o1, [%fp+-2820]
	ldd [%fp+-2464], %g2
	ld [%fp+-2620], %i1
	add %i1, %g3, %g2
	add %g2, %i3, %o7
	xor %o7, %l0, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %l0
	st %l0, [%fp+-2696]
	ldd [%fp+-2456], %g2
	ld [%fp+-2616], %i1
	add %i1, %g3, %g2
	add %g2, %i5, %l4
	xor %l4, %i2, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %o4
	st %o4, [%fp+-2828]
	ldd [%fp+-2432], %g2
	ld [%fp+-2684], %i1
	add %i1, %g3, %g2
	add %g2, %l7, %i1
	st %i1, [%fp+-2740]
	xor %i1, %o0, %i2
	srl %i2, 8, %g2
	sll %i2, 24, %i2
	or %i2, %g2, %l7
	st %l7, [%fp+-2588]
	ldd [%fp+-2424], %g2
	ld [%fp+-2680], %i1
	add %i1, %g3, %i2
	add %i2, %o1, %i1
	st %i1, [%fp+-2680]
	xor %i1, %o3, %i2
	srl %i2, 8, %g2
	sll %i2, 24, %i2
	or %i2, %g2, %g3
	st %g3, [%fp+-2652]
	add %l0, %i0, %i0
	st %i0, [%fp+-2520]
	xor %i0, %i3, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g2
	st %g2, [%fp+-2576]
	add %o4, %i4, %i0
	st %i0, [%fp+-2512]
	xor %i0, %i5, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i4
	st %i4, [%fp+-2568]
	ldd [%fp+-2304], %i0
	ld [%fp+-2488], %i2
	add %i2, %i1, %i0
	ldd [%fp+-2288], %i2
	ld [%fp+-2480], %i1
	add %i1, %i3, %i2
	add %i2, %l3, %g4
	add %i0, %l1, %i2
	ldd [%fp+-2344], %o0
	add %g4, %o0, %i3
	add %i3, %i4, %i0
	st %i0, [%fp+-2480]
	ldd [%fp+-2232], %l0
	add %i2, %l0, %i3
	add %i3, %g2, %i3
	st %i3, [%fp+-2488]
	xor %i3, %l7, %i5
	xor %i0, %g3, %i4
	st %i4, [%fp+-1652]
	st %i5, [%fp+-1660]
	ld [%fp+-2504], %i0
	mov	%o2, %g3
	add %i0, %o2, %o2
	ld [%fp+-2612], %i0
	xor %o2, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o3
	ld [%fp+-2496], %i0
	ld [%fp+-2720], %g2
	add %i0, %g2, %o4
	ld [%fp+-2604], %i0
	xor %o4, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o5
	ld [%fp+-2716], %i0
	xor %l6, %i0, %i3
	ld [%fp+-2724], %i0
	xor %l2, %i0, %i5
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i1
	st %i1, [%fp+-2612]
	srl %i5, 8, %i3
	sll %i5, 24, %i5
	or %i5, %i3, %l3
	ldd [%fp+-2376], %i4
	ld [%fp+-2608], %i0
	add %i0, %i5, %i5
	add %i5, %o3, %l2
	xor %l2, %g3, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %i3
	st %i3, [%fp+-2608]
	ldd [%fp+-2368], %i4
	ld [%fp+-2600], %i0
	add %i0, %i5, %i5
	add %i5, %o5, %l6
	xor %l6, %g2, %i5
	srl %i5, 8, %i0
	sll %i5, 24, %i5
	or %i5, %i0, %l7
	add %i3, %o2, %i0
	st %i0, [%fp+-2712]
	xor %i0, %o3, %i0
	srl %i0, 7, %o2
	sll %i0, 25, %i0
	or %i0, %o2, %g3
	st %g3, [%fp+-2692]
	add %l7, %o4, %i0
	st %i0, [%fp+-2772]
	xor %i0, %o5, %i0
	srl %i0, 7, %o2
	sll %i0, 25, %i0
	or %i0, %o2, %i3
	st %i3, [%fp+-2724]
	ldd [%fp+-2240], %i4
	ld [%fp+-2764], %i0
	add %i0, %i5, %i0
	ldd [%fp+-2296], %i4
	ld [%fp+-2768], %g2
	add %g2, %i5, %o2
	add %o2, %i3, %i3
	st %i3, [%fp+-2708]
	add %i0, %g3, %i4
	st %i4, [%fp+-2752]
	add %fp, -820, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2716]
	add %fp, -828, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2720]
	add %fp, -1652, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2768]
	add %fp, -1660, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2804]
	xor %i4, %i1, %o3
	xor %i3, %l3, %o2
	lduh [%fp+-820], %i0
	st %i0, [%fp+-2800]
	lduh [%fp+-828], %i0
	st %i0, [%fp+-2808]
	lduh [%fp+-1652], %i0
	st %i0, [%fp+-2812]
	lduh [%fp+-1660], %i0
	st %i0, [%fp+-2824]
	st %o2, [%fp+-868]
	st %o3, [%fp+-876]
	ld [%fp+-2536], %i0
	ld [%fp+-2660], %o4
	add %i0, %o4, %o2
	ld [%fp+-2596], %i0
	xor %o2, %i0, %i0
	srl %i0, 12, %o3
	sll %i0, 20, %i0
	or %i0, %o3, %o3
	ld [%fp+-2528], %i0
	ld [%fp+-2656], %i4
	add %i0, %i4, %o5
	ld [%fp+-2592], %i0
	xor %o5, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %i0
	xor %i2, %l5, %i1
	ld [%fp+-2472], %i3
	xor %g4, %i3, %i2
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %g3
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %g2
	ldd [%fp+-2360], %i2
	ld [%fp+-2584], %i1
	add %i1, %i3, %i2
	add %i2, %o3, %i5
	xor %i5, %o4, %i2
	srl %i2, 8, %o4
	sll %i2, 24, %i2
	or %i2, %o4, %o4
	ldd [%fp+-2352], %i2
	ld [%fp+-2580], %i1
	add %i1, %i3, %i2
	add %i2, %i0, %i3
	xor %i3, %i4, %i2
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %i2
	add %o4, %o2, %i1
	st %i1, [%fp+-2620]
	xor %i1, %o3, %i1
	srl %i1, 7, %o2
	sll %i1, 25, %i1
	or %i1, %o2, %l5
	st %l5, [%fp+-2628]
	add %i2, %o5, %i1
	st %i1, [%fp+-2616]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o5
	st %o5, [%fp+-2528]
	ldd [%fp+-2392], %i0
	add %o7, %i1, %i0
	ldd [%fp+-2384], %o2
	add %l4, %o3, %i1
	add %i1, %o5, %g4
	st %g4, [%fp+-2472]
	add %i0, %l5, %i0
	st %i0, [%fp+-2496]
	xor %i0, %g3, %i1
	xor %g4, %g2, %i0
	st %i0, [%fp+-1700]
	st %i1, [%fp+-1708]
	ld [%fp+-2700], %i0
	ld [%fp+-2796], %i1
	add %i1, %i0, %i4
	st %i4, [%fp+-2700]
	ld [%fp+-2676], %i0
	ld [%fp+-2792], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2764]
	ld [%fp+-2732], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+-2604]
	ld [%fp+-2748], %i0
	xor %i4, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+-2596]
	ldd [%fp+-2224], %i0
	add %l2, %i1, %i0
	ldd [%fp+-2216], %l4
	add %l6, %l5, %i1
	add %i1, %g4, %g4
	st %g4, [%fp+-2504]
	add %i0, %o2, %i0
	st %i0, [%fp+-2600]
	ld [%fp+-2736], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2760], %i4
	xor %g4, %i4, %i0
	add %fp, -868, %l2
	or %l2, 2, %l2
	lduh [%l2], %i4
	st %i4, [%fp+-2660]
	add %fp, -876, %l2
	or %l2, 2, %l2
	lduh [%l2], %i4
	st %i4, [%fp+-2760]
	add %fp, -1700, %l2
	or %l2, 2, %l2
	lduh [%l2], %i4
	st %i4, [%fp+-2656]
	add %fp, -1708, %l2
	or %l2, 2, %l2
	lduh [%l2], %i4
	st %i4, [%fp+-2728]
	lduh [%fp+-868], %i4
	st %i4, [%fp+-2792]
	lduh [%fp+-876], %i4
	st %i4, [%fp+-2796]
	lduh [%fp+-1700], %o5
	lduh [%fp+-1708], %i4
	st %i4, [%fp+-2748]
	st %i0, [%fp+-836]
	st %i1, [%fp+-844]
	ld [%fp+-2648], %i0
	ld [%fp+-2652], %i1
	add %i1, %i0, %i4
	st %i4, [%fp+-2648]
	ld [%fp+-2588], %i0
	ld [%fp+-2632], %i1
	add %i0, %i1, %i0
	st %i0, [%fp+-2652]
	ld [%fp+-2816], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+-2592]
	ld [%fp+-2820], %i0
	xor %i4, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+-2588]
	add %i5, %l1, %i0
	add %i3, %o1, %i1
	add %i1, %g4, %i3
	st %i3, [%fp+-2536]
	add %i0, %l2, %i0
	st %i0, [%fp+-2580]
	ld [%fp+-2696], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2828], %i4
	xor %i3, %i4, %i0
	st %i0, [%fp+-1668]
	st %i1, [%fp+-1676]
	ld [%fp+-2636], %i0
	add %l3, %i0, %i3
	st %i3, [%fp+-2632]
	ld [%fp+-2624], %i0
	ld [%fp+-2612], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2624]
	ld [%fp+-2756], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o3
	ld [%fp+-2744], %i0
	xor %i3, %i0, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i4
	st %i4, [%fp+-2744]
	ldd [%fp+-2312], %i0
	ld [%fp+-2688], %i3
	add %i3, %i1, %i1
	ldd [%fp+-2248], %l0
	ld [%fp+-2704], %i0
	add %i0, %l1, %i3
	add %i3, %i4, %i0
	st %i0, [%fp+-2584]
	add %i1, %o3, %i1
	st %i1, [%fp+-2636]
	ld [%fp+-2608], %i3
	xor %i1, %i3, %l5
	xor %i0, %l7, %l4
	add %fp, -836, %i1
	or %i1, 2, %i1
	lduh [%i1], %o2
	add %fp, -844, %i1
	or %i1, 2, %i1
	lduh [%i1], %o0
	add %fp, -1668, %i1
	or %i1, 2, %i1
	lduh [%i1], %l2
	add %fp, -1676, %i1
	or %i1, 2, %i1
	lduh [%i1], %l3
	lduh [%fp+-836], %l7
	lduh [%fp+-844], %l6
	lduh [%fp+-1668], %l0
	lduh [%fp+-1676], %g4
	st %l4, [%fp+-788]
	st %l5, [%fp+-796]
	ld [%fp+-2788], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+-2608]
	ld [%fp+-2776], %i1
	add %g3, %i1, %i1
	st %i1, [%fp+-2612]
	ld [%fp+-2780], %i3
	xor %i1, %i3, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %g2
	st %g2, [%fp+-2696]
	ld [%fp+-2784], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %i5
	sll %i1, 25, %i1
	or %i1, %i5, %i3
	st %i3, [%fp+-2684]
	ldd [%fp+-2408], %i0
	ld [%fp+-2740], %i4
	add %i4, %i1, %i1
	ldd [%fp+-2400], %i4
	ld [%fp+-2680], %i0
	add %i0, %i5, %i5
	add %i5, %i3, %i0
	st %i0, [%fp+-2676]
	add %i1, %g2, %i1
	st %i1, [%fp+-2680]
	xor %i1, %o4, %l5
	xor %i0, %i2, %l4
	st %l4, [%fp+-1620]
	st %l5, [%fp+-1628]
	add %fp, -788, %i1
	or %i1, 2, %i1
	lduh [%i1], %l1
	add %fp, -796, %i1
	or %i1, 2, %i1
	lduh [%i1], %o4
	add %fp, -1620, %i1
	or %i1, 2, %i1
	lduh [%i1], %g2
	add %fp, -1628, %i1
	or %i1, 2, %i1
	lduh [%i1], %l4
	add %fp, -1664, %i1
	or %i1, 2, %i1
	lduh [%fp+-788], %i5
	lduh [%fp+-796], %i4
	lduh [%fp+-1620], %i2
	lduh [%fp+-1628], %i0
	ld [%fp+-2824], %i3
	sth %i3, [%i1]
	add %fp, -1656, %i1
	or %i1, 2, %i1
	ld [%fp+-2812], %i3
	sth %i3, [%i1]
	ld [%fp+-2804], %i1
	sth %i1, [%fp+-1664]
	ld [%fp+-2768], %i1
	sth %i1, [%fp+-1656]
	add %fp, -832, %i1
	or %i1, 2, %i1
	ld [%fp+-1664], %i3
	st %i3, [%fp+-2732]
	ld [%fp+-1656], %l5
	st %l5, [%fp+-2812]
	ld [%fp+-2808], %i3
	sth %i3, [%i1]
	add %fp, -824, %i1
	or %i1, 2, %i1
	ld [%fp+-2800], %i3
	sth %i3, [%i1]
	ld [%fp+-2720], %i1
	sth %i1, [%fp+-832]
	ld [%fp+-2716], %i1
	sth %i1, [%fp+-824]
	add %fp, -1712, %i1
	or %i1, 2, %i1
	ld [%fp+-832], %o7
	st %o7, [%fp+-2720]
	ld [%fp+-824], %i3
	st %i3, [%fp+-2736]
	ld [%fp+-2748], %g3
	sth %g3, [%i1]
	add %fp, -1704, %i1
	or %i1, 2, %i1
	sth %o5, [%i1]
	ld [%fp+-2728], %i1
	sth %i1, [%fp+-1712]
	ld [%fp+-2656], %i1
	sth %i1, [%fp+-1704]
	add %fp, -880, %i1
	or %i1, 2, %i1
	ld [%fp+-1712], %g3
	st %g3, [%fp+-2748]
	ld [%fp+-1704], %g3
	st %g3, [%fp+-2740]
	ld [%fp+-2796], %g3
	sth %g3, [%i1]
	add %fp, -872, %i1
	or %i1, 2, %i1
	ld [%fp+-2792], %g3
	sth %g3, [%i1]
	ld [%fp+-2760], %i1
	sth %i1, [%fp+-880]
	ld [%fp+-2660], %i1
	sth %i1, [%fp+-872]
	add %fp, -1680, %i1
	or %i1, 2, %o1
	ld [%fp+-880], %i1
	ld [%fp+-872], %o5
	sth %g4, [%o1]
	add %fp, -1672, %g3
	or %g3, 2, %g3
	sth %l0, [%g3]
	sth %l3, [%fp+-1680]
	sth %l2, [%fp+-1672]
	add %fp, -848, %g3
	or %g3, 2, %g3
	ld [%fp+-1680], %g4
	st %g4, [%fp+-2660]
	ld [%fp+-1672], %g4
	st %g4, [%fp+-2656]
	sth %l6, [%g3]
	add %fp, -840, %g3
	or %g3, 2, %g3
	sth %l7, [%g3]
	sth %o0, [%fp+-848]
	sth %o2, [%fp+-840]
	add %fp, -1632, %g3
	or %g3, 2, %g3
	ld [%fp+-848], %g4
	st %g4, [%fp+-2716]
	ld [%fp+-840], %g4
	st %g4, [%fp+-2704]
	sth %i0, [%g3]
	add %fp, -1624, %i0
	or %i0, 2, %i0
	sth %i2, [%i0]
	sth %l4, [%fp+-1632]
	sth %g2, [%fp+-1624]
	add %fp, -800, %i0
	or %i0, 2, %i0
	ld [%fp+-1632], %l0
	ld [%fp+-1624], %g2
	sth %i4, [%i0]
	add %fp, -792, %i0
	or %i0, 2, %i0
	sth %i5, [%i0]
	sth %o4, [%fp+-800]
	sth %l1, [%fp+-792]
	ld [%fp+-2712], %i0
	add %i0, %o7, %i2
	st %i2, [%fp+-2712]
	ld [%fp+-2672], %i0
	xor %i2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o2
	ld [%fp+-2772], %i0
	add %i0, %i3, %i2
	st %i2, [%fp+-2728]
	ld [%fp+-2664], %i0
	xor %i2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l4
	st %l4, [%fp+-2784]
	ld [%fp+-2764], %i0
	add %i0, %i1, %i0
	st %i0, [%fp+-2664]
	ld [%fp+-2692], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l1
	st %l1, [%fp+-2692]
	ld [%fp+-2700], %i0
	add %i0, %o5, %i0
	st %i0, [%fp+-2672]
	ld [%fp+-2724], %i2
	xor %i0, %i2, %i0
	ld [%fp+-800], %g4
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l2
	st %l2, [%fp+-2724]
	ld [%fp+-2640], %i0
	add %i0, %g4, %g3
	xor %g3, %o3, %i0
	ld [%fp+-792], %i3
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o4
	ld [%fp+-2644], %i0
	add %i0, %i3, %l6
	ld [%fp+-2744], %i0
	xor %l6, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i0
	ldd [%fp+-2376], %i4
	ld [%fp+-2752], %i2
	add %i2, %i4, %i2
	add %i2, %l1, %i2
	st %i2, [%fp+-2756]
	xor %i2, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %l1
	st %l1, [%fp+-2764]
	ldd [%fp+-2368], %i4
	ld [%fp+-2708], %i1
	add %i1, %i4, %i1
	add %i1, %l2, %i1
	st %i1, [%fp+-2760]
	xor %i1, %o5, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %l2
	st %l2, [%fp+-2768]
	ldd [%fp+-2264], %i4
	ld [%fp+-2636], %i1
	add %i1, %i4, %i1
	add %i1, %o4, %i1
	st %i1, [%fp+-2640]
	xor %i1, %g4, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %g4
	st %g4, [%fp+-2744]
	ldd [%fp+-2256], %i4
	ld [%fp+-2584], %i1
	add %i1, %i4, %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2708]
	xor %i1, %i3, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i3
	st %i3, [%fp+-2752]
	add %g4, %g3, %i1
	st %i1, [%fp+-2636]
	xor %i1, %o4, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %g4
	st %g4, [%fp+-2700]
	add %i3, %l6, %i1
	st %i1, [%fp+-2644]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2688]
	ldd [%fp+-2312], %i0
	ld [%fp+-2544], %i2
	add %i2, %i0, %i1
	ldd [%fp+-2248], %i2
	ld [%fp+-2552], %i0
	add %i0, %i2, %i0
	add %i0, %l4, %l7
	add %i1, %o2, %i3
	ldd [%fp+-2272], %i4
	add %l7, %i4, %i1
	add %i1, %g3, %i2
	st %i2, [%fp+-2584]
	ldd [%fp+-2328], %i4
	add %i3, %i4, %i1
	add %i1, %g4, %i1
	st %i1, [%fp+-2552]
	xor %i1, %l1, %i5
	xor %i2, %l2, %i4
	st %i4, [%fp+-900]
	st %i5, [%fp+-908]
	ld [%fp+-2620], %i1
	ld [%fp+-2732], %o7
	add %i1, %o7, %o3
	ld [%fp+-2576], %i1
	xor %o3, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o0
	ld [%fp+-2616], %i1
	add %i1, %l5, %i0
	st %i0, [%fp+-2616]
	ld [%fp+-2568], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o1
	ld [%fp+-2652], %i1
	ld [%fp+-2748], %g3
	add %i1, %g3, %i2
	st %i2, [%fp+-2652]
	ld [%fp+-2628], %i1
	xor %i2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l1
	st %l1, [%fp+-2776]
	ld [%fp+-2648], %i1
	ld [%fp+-2740], %i5
	add %i1, %i5, %i0
	st %i0, [%fp+-2628]
	ld [%fp+-2528], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i0
	st %i0, [%fp+-2780]
	ld [%fp+-2520], %i1
	add %i1, %l0, %i4
	ld [%fp+-2696], %i1
	xor %i4, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g4
	ld [%fp+-2512], %i1
	add %i1, %g2, %l2
	ld [%fp+-2684], %i1
	xor %l2, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l3
	ldd [%fp+-2360], %o4
	ld [%fp+-2496], %i1
	add %i1, %o4, %i1
	add %i1, %l1, %l6
	xor %l6, %g3, %i1
	srl %i1, 8, %l4
	sll %i1, 24, %i1
	or %i1, %l4, %o4
	st %o4, [%fp+-2792]
	ldd [%fp+-2352], %l4
	ld [%fp+-2472], %i1
	add %i1, %l4, %i1
	add %i1, %i0, %l1
	xor %l1, %i5, %l4
	srl %l4, 8, %l5
	sll %l4, 24, %l4
	or %l4, %l5, %o5
	st %o5, [%fp+-2800]
	ldd [%fp+-2304], %l4
	ld [%fp+-2680], %i1
	add %i1, %l4, %l4
	add %l4, %g4, %i1
	st %i1, [%fp+-2740]
	xor %i1, %l0, %l0
	srl %l0, 8, %l4
	sll %l0, 24, %l0
	or %l0, %l4, %i0
	st %i0, [%fp+-2696]
	ldd [%fp+-2288], %l4
	ld [%fp+-2676], %i1
	add %i1, %l4, %l0
	add %l0, %l3, %i1
	st %i1, [%fp+-2772]
	xor %i1, %g2, %g2
	srl %g2, 8, %l0
	sll %g2, 24, %g2
	or %g2, %l0, %i2
	st %i2, [%fp+-2796]
	add %i0, %i4, %i1
	st %i1, [%fp+-2520]
	xor %i1, %g4, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %g4
	st %g4, [%fp+-2576]
	add %i2, %l2, %i1
	st %i1, [%fp+-2496]
	xor %i1, %l3, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i2
	st %i2, [%fp+-2528]
	ldd [%fp+-2408], %i4
	ld [%fp+-2488], %i1
	add %i1, %i4, %i4
	ldd [%fp+-2400], %g2
	ld [%fp+-2480], %i1
	add %i1, %g2, %g2
	add %g2, %o1, %l2
	add %i4, %o0, %i4
	ldd [%fp+-2416], %g2
	add %l2, %g2, %g2
	add %g2, %i2, %i1
	st %i1, [%fp+-2472]
	ldd [%fp+-2320], %g2
	add %i4, %g2, %g2
	add %g2, %g4, %i2
	st %i2, [%fp+-2480]
	xor %i2, %o4, %l5
	xor %i1, %o5, %l4
	st %l4, [%fp+-1732]
	st %l5, [%fp+-1740]
	ld [%fp+-2624], %i1
	ld [%fp+-2716], %i5
	add %i1, %i5, %i0
	st %i0, [%fp+-2816]
	ld [%fp+-2604], %i1
	xor %i0, %i1, %g2
	srl %g2, 12, %g4
	sll %g2, 20, %g2
	or %g2, %g4, %g3
	st %g3, [%fp+-2820]
	ld [%fp+-2632], %i1
	ld [%fp+-2704], %i2
	add %i1, %i2, %i0
	st %i0, [%fp+-2828]
	ld [%fp+-2596], %i1
	xor %i0, %i1, %g2
	srl %g2, 12, %g4
	sll %g2, 20, %g2
	or %g2, %g4, %g4
	st %g4, [%fp+-2824]
	ld [%fp+-2720], %i1
	xor %i3, %i1, %i3
	ld [%fp+-2736], %i1
	xor %l7, %i1, %i0
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %g2
	st %g2, [%fp+-2804]
	srl %i0, 8, %i3
	sll %i0, 24, %i0
	or %i0, %i3, %l3
	st %l3, [%fp+-2808]
	ldd [%fp+-2280], %o4
	ld [%fp+-2600], %i0
	add %i0, %o4, %i0
	add %i0, %g3, %g3
	xor %g3, %i5, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %l0
	ldd [%fp+-2336], %l4
	ld [%fp+-2504], %i0
	add %i0, %l4, %i1
	add %i1, %g4, %i5
	xor %i5, %i2, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %g4
	ld [%fp+-2712], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+-2512]
	xor %i0, %o2, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %i3
	st %i3, [%fp+-2680]
	ld [%fp+-2728], %i0
	add %l3, %i0, %i0
	st %i0, [%fp+-2504]
	ld [%fp+-2784], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %i2
	st %i2, [%fp+-2676]
	ld [%fp+-2756], %i0
	add %i0, %o5, %i1
	ld [%fp+-2760], %i0
	add %i0, %l5, %g2
	add %g2, %i2, %i2
	st %i2, [%fp+-2568]
	add %i1, %i3, %i0
	st %i0, [%fp+-2648]
	add %fp, -900, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2632]
	add %fp, -908, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2712]
	add %fp, -1732, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2716]
	add %fp, -1740, %i1
	or %i1, 2, %i1
	lduh [%i1], %i1
	st %i1, [%fp+-2756]
	xor %i0, %l0, %i1
	xor %i2, %g4, %i0
	lduh [%fp+-900], %i2
	st %i2, [%fp+-2736]
	lduh [%fp+-908], %i2
	st %i2, [%fp+-2760]
	lduh [%fp+-1732], %i2
	st %i2, [%fp+-2784]
	lduh [%fp+-1740], %i2
	st %i2, [%fp+-2788]
	st %i0, [%fp+-932]
	st %i1, [%fp+-940]
	ld [%fp+-2612], %i0
	ld [%fp+-2660], %i2
	add %i0, %i2, %i1
	st %i1, [%fp+-2684]
	ld [%fp+-2592], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+-2832]
	ld [%fp+-2608], %i0
	ld [%fp+-2656], %g2
	add %i0, %g2, %o4
	ld [%fp+-2588], %i0
	xor %o4, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o2
	xor %i4, %o7, %i0
	ld [%fp+-2812], %i1
	xor %l2, %i1, %i1
	srl %i0, 8, %i4
	sll %i0, 24, %i0
	or %i0, %i4, %o7
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %o5
	ldd [%fp+-2464], %l4
	ld [%fp+-2580], %i0
	add %i0, %l4, %i0
	add %i0, %i3, %i3
	xor %i3, %i2, %i1
	srl %i1, 8, %i4
	sll %i1, 24, %i1
	or %i1, %i4, %i4
	ldd [%fp+-2456], %l2
	ld [%fp+-2536], %i0
	add %i0, %l2, %i1
	add %i1, %o2, %i2
	xor %i2, %g2, %i1
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %i1
	add %o7, %o3, %i0
	st %i0, [%fp+-2544]
	xor %i0, %o0, %i0
	srl %i0, 7, %o0
	sll %i0, 25, %i0
	or %i0, %o0, %o0
	st %o0, [%fp+-2624]
	ld [%fp+-2616], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+-2536]
	xor %i0, %o1, %i0
	srl %i0, 7, %l7
	sll %i0, 25, %i0
	or %i0, %l7, %g2
	st %g2, [%fp+-2620]
	add %l6, %l5, %i0
	add %l1, %l3, %l1
	add %l1, %g2, %g2
	st %g2, [%fp+-2488]
	add %i0, %o0, %i0
	st %i0, [%fp+-2580]
	xor %i0, %i4, %l7
	xor %g2, %i1, %l6
	st %l6, [%fp+-1764]
	st %l7, [%fp+-1772]
	ld [%fp+-2672], %i0
	ld [%fp+-2768], %g2
	add %g2, %i0, %g2
	st %g2, [%fp+-2748]
	ld [%fp+-2664], %i0
	ld [%fp+-2764], %l1
	add %l1, %i0, %l1
	st %l1, [%fp+-2728]
	ld [%fp+-2692], %i0
	xor %l1, %i0, %i0
	srl %i0, 7, %l1
	sll %i0, 25, %i0
	or %i0, %l1, %l2
	st %l2, [%fp+-2616]
	ld [%fp+-2724], %i0
	xor %g2, %i0, %i0
	srl %i0, 7, %l1
	sll %i0, 25, %i0
	or %i0, %l1, %g2
	st %g2, [%fp+-2608]
	ldd [%fp+-2448], %o0
	add %g3, %o1, %i0
	ldd [%fp+-2440], %l4
	add %i5, %l5, %i5
	add %i5, %g2, %i5
	st %i5, [%fp+-2604]
	add %i0, %l2, %i0
	st %i0, [%fp+-2612]
	ld [%fp+-2744], %g2
	xor %i0, %g2, %l7
	ld [%fp+-2752], %i0
	xor %i5, %i0, %l6
	add %fp, -932, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2656]
	add %fp, -940, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2660]
	add %fp, -1764, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2732]
	add %fp, -1772, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2768]
	lduh [%fp+-932], %i0
	st %i0, [%fp+-2752]
	lduh [%fp+-940], %i0
	st %i0, [%fp+-2764]
	lduh [%fp+-1764], %i0
	st %i0, [%fp+-2812]
	lduh [%fp+-1772], %i0
	st %i0, [%fp+-2836]
	st %l6, [%fp+-884]
	st %l7, [%fp+-892]
	ld [%fp+-2628], %i0
	ld [%fp+-2800], %i5
	add %i5, %i0, %i5
	st %i5, [%fp+-2628]
	ld [%fp+-2652], %i0
	ld [%fp+-2792], %g2
	add %g2, %i0, %i0
	st %i0, [%fp+-2652]
	ld [%fp+-2776], %g2
	xor %i0, %g2, %i0
	srl %i0, 7, %l1
	sll %i0, 25, %i0
	or %i0, %l1, %l6
	st %l6, [%fp+-2600]
	ld [%fp+-2780], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %l1
	sll %i0, 25, %i0
	or %i0, %l1, %i5
	st %i5, [%fp+-2596]
	ldd [%fp+-2432], %l2
	add %i3, %l3, %i0
	ldd [%fp+-2424], %g2
	add %i2, %g3, %i2
	add %i2, %i5, %i5
	st %i5, [%fp+-2588]
	add %i0, %l6, %i0
	st %i0, [%fp+-2592]
	ld [%fp+-2696], %i2
	xor %i0, %i2, %i3
	ld [%fp+-2796], %i0
	xor %i5, %i0, %i2
	st %i2, [%fp+-1716]
	st %i3, [%fp+-1724]
	ld [%fp+-2828], %i0
	add %g4, %i0, %o3
	ld [%fp+-2816], %i0
	add %l0, %i0, %i5
	ld [%fp+-2820], %i0
	xor %i5, %i0, %i2
	srl %i2, 7, %g4
	sll %i2, 25, %i2
	or %i2, %g4, %l0
	st %l0, [%fp+-2744]
	ld [%fp+-2824], %i0
	xor %o3, %i0, %i2
	srl %i2, 7, %g4
	sll %i2, 25, %i2
	or %i2, %g4, %i3
	st %i3, [%fp+-2724]
	ld [%fp+-2640], %i0
	add %i0, %o0, %i2
	ld [%fp+-2708], %i0
	add %i0, %l4, %g4
	add %g4, %i3, %i0
	st %i0, [%fp+-2672]
	add %i2, %l0, %i2
	st %i2, [%fp+-2720]
	ld [%fp+-2804], %i3
	xor %i2, %i3, %l1
	ld [%fp+-2808], %i2
	xor %i0, %i2, %l0
	add %fp, -884, %i2
	or %i2, 2, %i2
	lduh [%i2], %i0
	st %i0, [%fp+-2640]
	add %fp, -892, %i2
	or %i2, 2, %i2
	lduh [%i2], %l7
	add %fp, -1716, %i2
	or %i2, 2, %i2
	lduh [%i2], %g4
	add %fp, -1724, %i2
	or %i2, 2, %i2
	lduh [%i2], %i3
	lduh [%fp+-884], %i0
	st %i0, [%fp+-2708]
	lduh [%fp+-892], %l6
	lduh [%fp+-1716], %i2
	lduh [%fp+-1724], %i0
	st %l0, [%fp+-852]
	st %l1, [%fp+-860]
	add %i1, %o4, %l0
	st %l0, [%fp+-2696]
	ld [%fp+-2684], %i1
	add %i4, %i1, %i1
	st %i1, [%fp+-2704]
	ld [%fp+-2832], %i4
	xor %i1, %i4, %i1
	srl %i1, 7, %i4
	sll %i1, 25, %i1
	or %i1, %i4, %l1
	st %l1, [%fp+-2692]
	xor %l0, %o2, %i1
	srl %i1, 7, %i4
	sll %i1, 25, %i1
	or %i1, %i4, %l0
	st %l0, [%fp+-2684]
	ld [%fp+-2740], %i1
	add %i1, %l2, %i1
	ld [%fp+-2772], %i4
	add %i4, %g2, %i4
	add %i4, %l0, %i4
	st %i4, [%fp+-2664]
	add %i1, %l1, %i1
	st %i1, [%fp+-2780]
	xor %i1, %o7, %l1
	xor %i4, %o5, %l0
	st %l0, [%fp+-1684]
	st %l1, [%fp+-1692]
	add %fp, -852, %i1
	or %i1, 2, %i1
	lduh [%i1], %g2
	add %fp, -860, %i1
	or %i1, 2, %i1
	lduh [%i1], %l0
	add %fp, -1684, %i1
	or %i1, 2, %i1
	lduh [%i1], %i4
	add %fp, -1692, %i1
	or %i1, 2, %i1
	lduh [%i1], %l2
	add %fp, -1744, %i1
	or %i1, 2, %i1
	lduh [%fp+-852], %l3
	lduh [%fp+-860], %l4
	lduh [%fp+-1684], %o2
	lduh [%fp+-1692], %l5
	ld [%fp+-2788], %g3
	sth %g3, [%i1]
	add %fp, -1736, %i1
	or %i1, 2, %i1
	ld [%fp+-2784], %g3
	sth %g3, [%i1]
	ld [%fp+-2756], %i1
	sth %i1, [%fp+-1744]
	ld [%fp+-2716], %i1
	sth %i1, [%fp+-1736]
	add %fp, -912, %i1
	or %i1, 2, %i1
	ld [%fp+-1744], %o4
	st %o4, [%fp+-2820]
	ld [%fp+-1736], %o5
	st %o5, [%fp+-2824]
	ld [%fp+-2760], %g3
	sth %g3, [%i1]
	add %fp, -904, %i1
	or %i1, 2, %i1
	ld [%fp+-2736], %g3
	sth %g3, [%i1]
	ld [%fp+-2712], %i1
	sth %i1, [%fp+-912]
	ld [%fp+-2632], %i1
	sth %i1, [%fp+-904]
	add %fp, -1776, %i1
	or %i1, 2, %i1
	ld [%fp+-912], %g3
	st %g3, [%fp+-2712]
	ld [%fp+-904], %o1
	st %o1, [%fp+-2756]
	ld [%fp+-2836], %l1
	sth %l1, [%i1]
	add %fp, -1768, %i1
	or %i1, 2, %i1
	ld [%fp+-2812], %l1
	sth %l1, [%i1]
	ld [%fp+-2768], %i1
	sth %i1, [%fp+-1776]
	ld [%fp+-2732], %i1
	sth %i1, [%fp+-1768]
	add %fp, -944, %i1
	or %i1, 2, %i1
	ld [%fp+-1776], %o7
	ld [%fp+-1768], %l1
	st %l1, [%fp+-2732]
	ld [%fp+-2764], %l1
	sth %l1, [%i1]
	add %fp, -936, %i1
	or %i1, 2, %i1
	ld [%fp+-2752], %l1
	sth %l1, [%i1]
	ld [%fp+-2660], %i1
	sth %i1, [%fp+-944]
	ld [%fp+-2656], %i1
	sth %i1, [%fp+-936]
	add %fp, -1728, %i1
	or %i1, 2, %o0
	ld [%fp+-944], %i1
	ld [%fp+-936], %l1
	sth %i0, [%o0]
	add %fp, -1720, %i0
	or %i0, 2, %i0
	sth %i2, [%i0]
	sth %i3, [%fp+-1728]
	sth %g4, [%fp+-1720]
	add %fp, -896, %i0
	or %i0, 2, %i0
	ld [%fp+-1728], %i2
	st %i2, [%fp+-2660]
	ld [%fp+-1720], %i2
	st %i2, [%fp+-2656]
	sth %l6, [%i0]
	add %fp, -888, %i0
	or %i0, 2, %i0
	ld [%fp+-2708], %i2
	sth %i2, [%i0]
	sth %l7, [%fp+-896]
	ld [%fp+-2640], %i0
	sth %i0, [%fp+-888]
	add %fp, -1696, %i0
	or %i0, 2, %i0
	ld [%fp+-896], %i2
	st %i2, [%fp+-2716]
	ld [%fp+-888], %i2
	st %i2, [%fp+-2708]
	sth %l5, [%i0]
	add %fp, -1688, %i0
	or %i0, 2, %i0
	sth %o2, [%i0]
	sth %l2, [%fp+-1696]
	sth %i4, [%fp+-1688]
	add %fp, -864, %i0
	or %i0, 2, %i0
	ld [%fp+-1696], %i4
	ld [%fp+-1688], %o2
	sth %l4, [%i0]
	add %fp, -856, %i0
	or %i0, 2, %i0
	sth %l3, [%i0]
	sth %l0, [%fp+-864]
	sth %g2, [%fp+-856]
	add %i5, %g3, %i0
	st %i0, [%fp+-2632]
	ld [%fp+-2700], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l5
	st %l5, [%fp+-2740]
	add %o3, %o1, %i0
	st %i0, [%fp+-2640]
	ld [%fp+-2688], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l6
	st %l6, [%fp+-2736]
	ld [%fp+-2636], %i0
	add %i0, %i1, %o1
	ld [%fp+-2680], %i0
	xor %o1, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %g4
	ld [%fp+-2644], %i0
	add %i0, %l1, %l0
	ld [%fp+-2676], %i0
	xor %l0, %i0, %i0
	ld [%fp+-864], %g2
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i0
	ld [%fp+-2728], %i2
	add %i2, %g2, %i2
	st %i2, [%fp+-2680]
	ld [%fp+-2744], %i3
	xor %i2, %i3, %i2
	ld [%fp+-856], %i3
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %g3
	st %g3, [%fp+-2728]
	ld [%fp+-2748], %i2
	add %i2, %i3, %i2
	st %i2, [%fp+-2700]
	ld [%fp+-2724], %i5
	xor %i2, %i5, %i2
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %l4
	st %l4, [%fp+-2744]
	ldd [%fp+-2240], %l2
	ld [%fp+-2648], %i2
	add %i2, %l3, %i2
	add %i2, %g4, %i2
	st %i2, [%fp+-2636]
	xor %i2, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %o0
	st %o0, [%fp+-2724]
	ldd [%fp+-2296], %l2
	ld [%fp+-2568], %i1
	add %i1, %l3, %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2752]
	xor %i1, %l1, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l1
	st %l1, [%fp+-2748]
	ldd [%fp+-2280], %l2
	ld [%fp+-2720], %i1
	add %i1, %l2, %i2
	add %i2, %g3, %i1
	st %i1, [%fp+-2688]
	xor %i1, %g2, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l2
	st %l2, [%fp+-2776]
	ldd [%fp+-2336], %g2
	ld [%fp+-2672], %i1
	add %i1, %g2, %i2
	add %i2, %l4, %i1
	st %i1, [%fp+-2720]
	xor %i1, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %g3
	st %g3, [%fp+-2772]
	add %o0, %o1, %i1
	st %i1, [%fp+-2644]
	xor %i1, %g4, %i2
	srl %i2, 7, %i3
	sll %i2, 25, %i2
	or %i2, %i3, %g2
	st %g2, [%fp+-2676]
	add %l1, %l0, %i1
	st %i1, [%fp+-2648]
	xor %i1, %i0, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i5
	st %i5, [%fp+-2672]
	ldd [%fp+-2328], %i0
	ld [%fp+-2552], %i2
	add %i2, %i1, %i0
	ldd [%fp+-2272], %i2
	ld [%fp+-2584], %i1
	add %i1, %i3, %i2
	add %i2, %l6, %l4
	add %i0, %l5, %l1
	ldd [%fp+-2256], %i0
	add %l4, %i1, %i0
	add %i0, %i5, %i5
	st %i5, [%fp+-2568]
	ldd [%fp+-2264], %i0
	add %l1, %i1, %i0
	add %i0, %g2, %i0
	st %i0, [%fp+-2552]
	xor %i0, %l2, %i3
	xor %i5, %g3, %i2
	st %i2, [%fp+-948]
	st %i3, [%fp+-956]
	ld [%fp+-2704], %i0
	add %i0, %o4, %i1
	st %i1, [%fp+-2704]
	ld [%fp+-2576], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o4
	st %o4, [%fp+-2764]
	ld [%fp+-2696], %i0
	add %i0, %o5, %i1
	st %i1, [%fp+-2696]
	ld [%fp+-2528], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o5
	st %o5, [%fp+-2768]
	ld [%fp+-2520], %i0
	add %i0, %o7, %l0
	ld [%fp+-2624], %i1
	xor %l0, %i1, %i2
	srl %i2, 12, %i3
	sll %i2, 20, %i2
	or %i2, %i3, %i2
	ld [%fp+-2496], %i1
	ld [%fp+-2732], %g4
	add %i1, %g4, %i3
	ld [%fp+-2620], %i1
	xor %i3, %i1, %i5
	srl %i5, 12, %g2
	sll %i5, 20, %i5
	or %i5, %g2, %i5
	ld [%fp+-2652], %i1
	add %i1, %i4, %g2
	st %g2, [%fp+-2584]
	ld [%fp+-2692], %i1
	xor %g2, %i1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %l5
	st %l5, [%fp+-2796]
	ld [%fp+-2628], %i1
	add %i1, %o2, %i0
	st %i0, [%fp+-2812]
	ld [%fp+-2684], %i1
	xor %i0, %i1, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %i0
	st %i0, [%fp+-2800]
	ldd [%fp+-2392], %l2
	ld [%fp+-2580], %i1
	add %i1, %l3, %g2
	add %g2, %i2, %o0
	xor %o0, %o7, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %o3
	st %o3, [%fp+-2692]
	ldd [%fp+-2384], %l6
	ld [%fp+-2488], %i1
	add %i1, %l7, %g2
	add %g2, %i5, %o1
	xor %o1, %g4, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %g4
	st %g4, [%fp+-2816]
	ldd [%fp+-2464], %g2
	ld [%fp+-2780], %i1
	add %i1, %g2, %g2
	add %g2, %l5, %i1
	st %i1, [%fp+-2684]
	xor %i1, %i4, %i4
	srl %i4, 8, %g2
	sll %i4, 24, %i4
	or %i4, %g2, %o7
	st %o7, [%fp+-2804]
	ldd [%fp+-2456], %g2
	ld [%fp+-2664], %i1
	add %i1, %g2, %i4
	add %i4, %i0, %i1
	st %i1, [%fp+-2664]
	xor %i1, %o2, %i4
	srl %i4, 8, %g2
	sll %i4, 24, %i4
	or %i4, %g2, %l5
	st %l5, [%fp+-2652]
	add %o3, %l0, %i0
	st %i0, [%fp+-2528]
	xor %i0, %i2, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g2
	st %g2, [%fp+-2580]
	add %g4, %i3, %i0
	st %i0, [%fp+-2520]
	xor %i0, %i5, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g3
	st %g3, [%fp+-2576]
	ldd [%fp+-2320], %i0
	ld [%fp+-2480], %i2
	add %i2, %i1, %i0
	ldd [%fp+-2416], %i2
	ld [%fp+-2472], %i1
	add %i1, %i3, %i2
	add %i2, %o5, %i2
	add %i0, %o4, %i1
	ldd [%fp+-2288], %i4
	add %i2, %i5, %i3
	add %i3, %g3, %i0
	st %i0, [%fp+-2488]
	ldd [%fp+-2304], %i4
	add %i1, %i5, %i3
	add %i3, %g2, %i3
	st %i3, [%fp+-2496]
	xor %i3, %o7, %i5
	xor %i0, %l5, %i4
	st %i4, [%fp+-1780]
	st %i5, [%fp+-1788]
	ld [%fp+-2512], %i0
	ld [%fp+-2716], %g3
	add %i0, %g3, %o2
	ld [%fp+-2616], %i0
	xor %o2, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o3
	ld [%fp+-2504], %i0
	ld [%fp+-2708], %g2
	add %i0, %g2, %o4
	ld [%fp+-2608], %i0
	xor %o4, %i0, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %o5
	ld [%fp+-2712], %i0
	xor %l1, %i0, %i3
	ld [%fp+-2756], %i0
	xor %l4, %i0, %i5
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l0
	st %l0, [%fp+-2616]
	srl %i5, 8, %i3
	sll %i5, 24, %i5
	or %i5, %i3, %l5
	ld [%fp+-2612], %i0
	ldd [%fp+-2240], %i4
	add %i0, %i4, %i5
	add %i5, %o3, %l4
	xor %l4, %g3, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %o7
	ldd [%fp+-2296], %i4
	ld [%fp+-2604], %i0
	add %i0, %i4, %i5
	add %i5, %o5, %g4
	xor %g4, %g2, %i5
	srl %i5, 8, %i0
	sll %i5, 24, %i5
	or %i5, %i0, %i3
	st %i3, [%fp+-2612]
	add %o7, %o2, %i0
	st %i0, [%fp+-2716]
	xor %i0, %o3, %i0
	srl %i0, 7, %o2
	sll %i0, 25, %i0
	or %i0, %o2, %g2
	st %g2, [%fp+-2756]
	add %i3, %o4, %i0
	st %i0, [%fp+-2760]
	xor %i0, %o5, %i0
	srl %i0, 7, %o2
	sll %i0, 25, %i0
	or %i0, %o2, %i3
	st %i3, [%fp+-2732]
	ldd [%fp+-2224], %i4
	ld [%fp+-2636], %i0
	add %i0, %i5, %i0
	ldd [%fp+-2216], %i4
	ld [%fp+-2752], %g3
	add %g3, %i5, %o2
	add %o2, %i3, %i3
	st %i3, [%fp+-2712]
	add %i0, %g2, %i4
	st %i4, [%fp+-2752]
	add %fp, -948, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2708]
	add %fp, -956, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2780]
	add %fp, -1780, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2472]
	add %fp, -1788, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2480]
	xor %i4, %l0, %o3
	xor %i3, %l5, %o2
	lduh [%fp+-948], %i0
	st %i0, [%fp+-2784]
	lduh [%fp+-956], %i0
	st %i0, [%fp+-2788]
	lduh [%fp+-1780], %i0
	st %i0, [%fp+-2792]
	lduh [%fp+-1788], %i0
	st %i0, [%fp+-2808]
	st %o2, [%fp+-996]
	st %o3, [%fp+-1004]
	ld [%fp+-2544], %i0
	ld [%fp+-2660], %i4
	add %i0, %i4, %o2
	ld [%fp+-2600], %i0
	xor %o2, %i0, %i0
	srl %i0, 12, %o3
	sll %i0, 20, %i0
	or %i0, %o3, %o3
	ld [%fp+-2536], %i0
	ld [%fp+-2656], %i5
	add %i0, %i5, %o5
	ld [%fp+-2596], %i0
	xor %o5, %i0, %i0
	srl %i0, 12, %o4
	sll %i0, 20, %i0
	or %i0, %o4, %i0
	ld [%fp+-2820], %i3
	xor %i1, %i3, %i1
	ld [%fp+-2824], %i3
	xor %i2, %i3, %i2
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %o4
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %g2
	ld [%fp+-2592], %i1
	add %i1, %l2, %i2
	add %i2, %o3, %l3
	xor %l3, %i4, %i2
	srl %i2, 8, %i4
	sll %i2, 24, %i2
	or %i2, %i4, %g3
	ld [%fp+-2588], %i1
	add %i1, %l6, %i2
	add %i2, %i0, %i3
	xor %i3, %i5, %i2
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %i2
	add %g3, %o2, %i1
	st %i1, [%fp+-2628]
	xor %i1, %o3, %i1
	srl %i1, 7, %o2
	sll %i1, 25, %i1
	or %i1, %o2, %l2
	st %l2, [%fp+-2636]
	add %i2, %o5, %i1
	st %i1, [%fp+-2624]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2620]
	ldd [%fp+-2232], %i0
	add %o0, %i1, %i0
	ldd [%fp+-2344], %l0
	add %o1, %l1, %i1
	add %i1, %i4, %i4
	st %i4, [%fp+-2536]
	add %i0, %l2, %i0
	st %i0, [%fp+-2608]
	xor %i0, %o4, %i1
	xor %i4, %g2, %i0
	st %i0, [%fp+-1828]
	st %i1, [%fp+-1836]
	ld [%fp+-2700], %i0
	ld [%fp+-2772], %i1
	add %i1, %i0, %i4
	st %i4, [%fp+-2772]
	ld [%fp+-2680], %i0
	ld [%fp+-2776], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2700]
	ld [%fp+-2728], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+-2604]
	ld [%fp+-2744], %i0
	xor %i4, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2596]
	ldd [%fp+-2312], %i0
	add %l4, %i0, %i0
	ldd [%fp+-2248], %l0
	add %g4, %l0, %i1
	add %i1, %i4, %i4
	st %i4, [%fp+-2512]
	add %i0, %l2, %i0
	st %i0, [%fp+-2600]
	ld [%fp+-2724], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2748], %i5
	xor %i4, %i5, %i0
	add %fp, -996, %l4
	or %l4, 2, %l4
	lduh [%l4], %i4
	st %i4, [%fp+-2728]
	add %fp, -1004, %l4
	or %l4, 2, %l4
	lduh [%l4], %i4
	st %i4, [%fp+-2776]
	add %fp, -1828, %l4
	or %l4, 2, %l4
	lduh [%l4], %i4
	st %i4, [%fp+-2660]
	add %fp, -1836, %l4
	or %l4, 2, %l4
	lduh [%l4], %o3
	lduh [%fp+-996], %i4
	st %i4, [%fp+-2820]
	lduh [%fp+-1004], %i4
	st %i4, [%fp+-2824]
	lduh [%fp+-1828], %o2
	lduh [%fp+-1836], %l6
	st %i0, [%fp+-964]
	st %i1, [%fp+-972]
	ld [%fp+-2652], %i0
	ld [%fp+-2812], %i1
	add %i0, %i1, %i4
	st %i4, [%fp+-2652]
	ld [%fp+-2584], %i0
	ld [%fp+-2804], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2656]
	ld [%fp+-2796], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l1
	st %l1, [%fp+-2592]
	ld [%fp+-2800], %i0
	xor %i4, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2584]
	ldd [%fp+-2408], %i0
	add %l3, %i0, %i0
	ldd [%fp+-2400], %i4
	add %i3, %i4, %i1
	add %i1, %l0, %i3
	st %i3, [%fp+-2504]
	add %i0, %l1, %i0
	st %i0, [%fp+-2544]
	ld [%fp+-2692], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2816], %i4
	xor %i3, %i4, %i0
	st %i0, [%fp+-1796]
	st %i1, [%fp+-1804]
	ld [%fp+-2640], %i0
	add %l5, %i0, %i3
	st %i3, [%fp+-2640]
	ld [%fp+-2632], %i0
	ld [%fp+-2616], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2632]
	ld [%fp+-2740], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o1
	ld [%fp+-2736], %i0
	xor %i3, %i0, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %o5
	ldd [%fp+-2264], %i0
	ld [%fp+-2688], %i3
	add %i3, %i0, %i1
	ldd [%fp+-2256], %i4
	ld [%fp+-2720], %i0
	add %i0, %i4, %i3
	add %i3, %o5, %i0
	st %i0, [%fp+-2588]
	add %i1, %o1, %i1
	st %i1, [%fp+-2688]
	xor %i1, %o7, %l1
	ld [%fp+-2612], %i1
	xor %i0, %i1, %l0
	add %fp, -964, %i1
	or %i1, 2, %i1
	lduh [%i1], %o0
	add %fp, -972, %i1
	or %i1, 2, %i1
	lduh [%i1], %l4
	add %fp, -1796, %i1
	or %i1, 2, %i1
	lduh [%i1], %i5
	add %fp, -1804, %i1
	or %i1, 2, %i1
	lduh [%i1], %l2
	lduh [%fp+-964], %l3
	lduh [%fp+-972], %l7
	lduh [%fp+-1796], %o7
	lduh [%fp+-1804], %i4
	st %l0, [%fp+-916]
	st %l1, [%fp+-924]
	ld [%fp+-2696], %i0
	add %g2, %i0, %i0
	st %i0, [%fp+-2612]
	ld [%fp+-2704], %i1
	add %o4, %i1, %i1
	st %i1, [%fp+-2616]
	ld [%fp+-2764], %i3
	xor %i1, %i3, %g2
	srl %g2, 7, %l0
	sll %g2, 25, %g2
	or %g2, %l0, %g4
	st %g4, [%fp+-2696]
	ld [%fp+-2768], %i1
	xor %i0, %i1, %g2
	srl %g2, 7, %l0
	sll %g2, 25, %g2
	or %g2, %l0, %i3
	st %i3, [%fp+-2692]
	ldd [%fp+-2304], %i0
	ld [%fp+-2684], %g2
	add %g2, %i0, %g2
	ldd [%fp+-2288], %i0
	ld [%fp+-2664], %l0
	add %l0, %i0, %l0
	add %l0, %i3, %i0
	st %i0, [%fp+-2680]
	add %g2, %g4, %i1
	st %i1, [%fp+-2684]
	xor %i1, %g3, %l1
	xor %i0, %i2, %l0
	st %l0, [%fp+-1748]
	st %l1, [%fp+-1756]
	add %fp, -916, %i2
	or %i2, 2, %i2
	lduh [%i2], %g4
	add %fp, -924, %i2
	or %i2, 2, %i2
	lduh [%i2], %g3
	add %fp, -1748, %i2
	or %i2, 2, %i2
	lduh [%i2], %l0
	add %fp, -1756, %i2
	or %i2, 2, %i2
	lduh [%i2], %l1
	add %fp, -1792, %i2
	or %i2, 2, %i2
	lduh [%fp+-916], %o4
	lduh [%fp+-924], %g2
	lduh [%fp+-1748], %i1
	lduh [%fp+-1756], %i0
	ld [%fp+-2808], %i3
	sth %i3, [%i2]
	add %fp, -1784, %i2
	or %i2, 2, %i2
	ld [%fp+-2792], %i3
	sth %i3, [%i2]
	ld [%fp+-2480], %i2
	sth %i2, [%fp+-1792]
	ld [%fp+-2472], %i2
	sth %i2, [%fp+-1784]
	add %fp, -960, %i2
	or %i2, 2, %i2
	ld [%fp+-1792], %l5
	st %l5, [%fp+-2472]
	ld [%fp+-1784], %l5
	st %l5, [%fp+-2480]
	ld [%fp+-2788], %i3
	sth %i3, [%i2]
	add %fp, -952, %i2
	or %i2, 2, %i2
	ld [%fp+-2784], %i3
	sth %i3, [%i2]
	ld [%fp+-2780], %i2
	sth %i2, [%fp+-960]
	ld [%fp+-2708], %i2
	sth %i2, [%fp+-952]
	add %fp, -1840, %i2
	or %i2, 2, %i2
	ld [%fp+-960], %l5
	st %l5, [%fp+-2724]
	ld [%fp+-952], %i3
	st %i3, [%fp+-2740]
	sth %l6, [%i2]
	add %fp, -1832, %i2
	or %i2, 2, %i2
	sth %o2, [%i2]
	sth %o3, [%fp+-1840]
	ld [%fp+-2660], %i2
	sth %i2, [%fp+-1832]
	add %fp, -1008, %i2
	or %i2, 2, %i2
	ld [%fp+-1840], %l6
	st %l6, [%fp+-2748]
	ld [%fp+-1832], %l6
	st %l6, [%fp+-2744]
	ld [%fp+-2824], %l6
	sth %l6, [%i2]
	add %fp, -1000, %i2
	or %i2, 2, %i2
	ld [%fp+-2820], %l6
	sth %l6, [%i2]
	ld [%fp+-2776], %i2
	sth %i2, [%fp+-1008]
	ld [%fp+-2728], %i2
	sth %i2, [%fp+-1000]
	add %fp, -1808, %i2
	or %i2, 2, %l6
	ld [%fp+-1008], %i2
	ld [%fp+-1000], %o2
	sth %i4, [%l6]
	add %fp, -1800, %i4
	or %i4, 2, %i4
	sth %o7, [%i4]
	sth %l2, [%fp+-1808]
	sth %i5, [%fp+-1800]
	add %fp, -976, %i4
	or %i4, 2, %i4
	ld [%fp+-1808], %i5
	st %i5, [%fp+-2664]
	ld [%fp+-1800], %i5
	st %i5, [%fp+-2660]
	sth %l7, [%i4]
	add %fp, -968, %i4
	or %i4, 2, %i4
	sth %l3, [%i4]
	sth %l4, [%fp+-976]
	sth %o0, [%fp+-968]
	add %fp, -1760, %i4
	or %i4, 2, %i4
	ld [%fp+-976], %i5
	st %i5, [%fp+-2708]
	ld [%fp+-968], %i5
	st %i5, [%fp+-2704]
	sth %i0, [%i4]
	add %fp, -1752, %i0
	or %i0, 2, %i0
	sth %i1, [%i0]
	sth %l1, [%fp+-1760]
	sth %l0, [%fp+-1752]
	add %fp, -928, %i0
	or %i0, 2, %i0
	ld [%fp+-1760], %l3
	ld [%fp+-1752], %l2
	sth %g2, [%i0]
	add %fp, -920, %i0
	or %i0, 2, %i0
	sth %o4, [%i0]
	sth %g3, [%fp+-928]
	sth %g4, [%fp+-920]
	ld [%fp+-2716], %i0
	add %i0, %l5, %i1
	st %i1, [%fp+-2716]
	ld [%fp+-2676], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+-2788]
	ld [%fp+-2760], %i0
	add %i0, %i3, %i1
	st %i1, [%fp+-2728]
	ld [%fp+-2672], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2784]
	ld [%fp+-2700], %i0
	add %i0, %i2, %i0
	st %i0, [%fp+-2672]
	ld [%fp+-2756], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+-2700]
	ld [%fp+-2772], %i0
	add %i0, %o2, %i0
	st %i0, [%fp+-2676]
	ld [%fp+-2732], %i1
	xor %i0, %i1, %i0
	ld [%fp+-928], %g2
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+-2732]
	ld [%fp+-2644], %i0
	add %i0, %g2, %o3
	xor %o3, %o1, %i0
	ld [%fp+-920], %i4
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o7
	ld [%fp+-2648], %i0
	add %i0, %i4, %l1
	xor %l1, %o5, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i0
	ldd [%fp+-2376], %l6
	ld [%fp+-2752], %i1
	add %i1, %l7, %i1
	add %i1, %i3, %i1
	st %i1, [%fp+-2760]
	xor %i1, %i2, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %l0
	st %l0, [%fp+-2768]
	ldd [%fp+-2368], %l4
	ld [%fp+-2712], %i1
	add %i1, %l5, %i1
	add %i1, %i5, %i1
	st %i1, [%fp+-2764]
	xor %i1, %o2, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %o2
	st %o2, [%fp+-2772]
	ldd [%fp+-2224], %i2
	ld [%fp+-2688], %i1
	add %i1, %i2, %i1
	add %i1, %o7, %i1
	st %i1, [%fp+-2644]
	xor %i1, %g2, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i5
	st %i5, [%fp+-2752]
	ldd [%fp+-2216], %i2
	ld [%fp+-2588], %i1
	add %i1, %i2, %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2736]
	xor %i1, %i4, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %i4
	st %i4, [%fp+-2756]
	add %i5, %o3, %i1
	st %i1, [%fp+-2648]
	xor %i1, %o7, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i3
	st %i3, [%fp+-2720]
	add %i4, %l1, %i1
	st %i1, [%fp+-2688]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i2
	st %i2, [%fp+-2712]
	ld [%fp+-2552], %i0
	add %i0, %l6, %i1
	ld [%fp+-2568], %i0
	add %i0, %l4, %i0
	add %i0, %g3, %o1
	add %i1, %g4, %o0
	ldd [%fp+-2336], %i0
	add %o1, %i1, %i1
	add %i1, %i2, %i2
	st %i2, [%fp+-2588]
	ldd [%fp+-2280], %i0
	add %o0, %i1, %i1
	add %i1, %i3, %i0
	st %i0, [%fp+-2552]
	xor %i0, %l0, %i5
	xor %i2, %o2, %i4
	st %i4, [%fp+-1028]
	st %i5, [%fp+-1036]
	ld [%fp+-2628], %i0
	ld [%fp+-2472], %i1
	add %i0, %i1, %i1
	st %i1, [%fp+-2628]
	ld [%fp+-2580], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o7
	ld [%fp+-2624], %i0
	ld [%fp+-2480], %i1
	add %i0, %i1, %i1
	st %i1, [%fp+-2836]
	ld [%fp+-2576], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %o2
	st %o2, [%fp+-2832]
	ld [%fp+-2656], %i0
	ld [%fp+-2748], %l0
	add %i0, %l0, %i1
	st %i1, [%fp+-2580]
	ld [%fp+-2636], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l4
	st %l4, [%fp+-2776]
	ld [%fp+-2652], %i0
	ld [%fp+-2744], %i5
	add %i0, %i5, %i1
	st %i1, [%fp+-2636]
	ld [%fp+-2620], %i0
	xor %i1, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l5
	st %l5, [%fp+-2780]
	ld [%fp+-2528], %i0
	add %i0, %l3, %i4
	ld [%fp+-2696], %i0
	xor %i4, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %g2
	ld [%fp+-2520], %i0
	add %i0, %l2, %g4
	ld [%fp+-2692], %i0
	xor %g4, %i0, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l1
	ldd [%fp+-2360], %i2
	ld [%fp+-2608], %i0
	add %i0, %i3, %i1
	add %i1, %l4, %o4
	xor %o4, %l0, %i1
	srl %i1, 8, %l4
	sll %i1, 24, %i1
	or %i1, %l4, %l0
	st %l0, [%fp+-2792]
	ldd [%fp+-2352], %l6
	ld [%fp+-2536], %i0
	add %i0, %l7, %i1
	add %i1, %l5, %o5
	xor %o5, %i5, %l4
	srl %l4, 8, %l5
	sll %l4, 24, %l4
	or %l4, %l5, %g3
	st %g3, [%fp+-2800]
	ldd [%fp+-2232], %i0
	ld [%fp+-2684], %i5
	add %i5, %i0, %l4
	add %l4, %g2, %i0
	st %i0, [%fp+-2624]
	xor %i0, %l3, %l3
	srl %l3, 8, %l4
	sll %l3, 24, %l3
	or %l3, %l4, %l5
	st %l5, [%fp+-2696]
	ldd [%fp+-2344], %i0
	ld [%fp+-2680], %i5
	add %i5, %i0, %l3
	add %l3, %l1, %i0
	st %i0, [%fp+-2652]
	xor %i0, %l2, %l3
	srl %l3, 8, %l4
	sll %l3, 24, %l3
	or %l3, %l4, %i1
	st %i1, [%fp+-2796]
	add %l5, %i4, %i0
	st %i0, [%fp+-2536]
	xor %i0, %g2, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %i5
	st %i5, [%fp+-2576]
	add %i1, %g4, %i0
	st %i0, [%fp+-2528]
	xor %i0, %l1, %i4
	srl %i4, 7, %g2
	sll %i4, 25, %i4
	or %i4, %g2, %g4
	st %g4, [%fp+-2568]
	ld [%fp+-2496], %i0
	add %i0, %i2, %i4
	ld [%fp+-2488], %i0
	add %i0, %l6, %g2
	add %g2, %o2, %i1
	add %i4, %o7, %i0
	ldd [%fp+-2456], %o2
	add %i1, %o3, %i4
	add %i4, %g4, %i2
	st %i2, [%fp+-2488]
	ldd [%fp+-2464], %l2
	add %i0, %l3, %i4
	add %i4, %i5, %i3
	st %i3, [%fp+-2496]
	xor %i3, %l0, %l7
	xor %i2, %g3, %l6
	st %l6, [%fp+-1860]
	st %l7, [%fp+-1868]
	ld [%fp+-2632], %i2
	ld [%fp+-2708], %l1
	add %i2, %l1, %i3
	st %i3, [%fp+-2816]
	ld [%fp+-2604], %i2
	xor %i3, %i2, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %g3
	st %g3, [%fp+-2820]
	ld [%fp+-2640], %i2
	ld [%fp+-2704], %i5
	add %i2, %i5, %i3
	st %i3, [%fp+-2828]
	ld [%fp+-2596], %i2
	xor %i3, %i2, %i4
	srl %i4, 12, %g2
	sll %i4, 20, %i4
	or %i4, %g2, %l4
	st %l4, [%fp+-2824]
	ld [%fp+-2724], %i2
	xor %o0, %i2, %i3
	ld [%fp+-2740], %i2
	xor %o1, %i2, %i4
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %g2
	st %g2, [%fp+-2808]
	srl %i4, 8, %i3
	sll %i4, 24, %i4
	or %i4, %i3, %l0
	st %l0, [%fp+-2812]
	ldd [%fp+-2312], %i2
	ld [%fp+-2600], %i4
	add %i4, %i3, %i3
	add %i3, %g3, %g4
	xor %g4, %l1, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l7
	ldd [%fp+-2248], %i2
	ld [%fp+-2512], %i4
	add %i4, %i3, %i3
	add %i3, %l4, %g3
	xor %g3, %i5, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %l6
	ld [%fp+-2716], %i2
	add %g2, %i2, %i2
	st %i2, [%fp+-2520]
	ld [%fp+-2788], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %g2
	sll %i3, 25, %i3
	or %i3, %g2, %l1
	st %l1, [%fp+-2708]
	ld [%fp+-2728], %i2
	add %l0, %i2, %i2
	st %i2, [%fp+-2512]
	ld [%fp+-2784], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %g2
	sll %i3, 25, %i3
	or %i3, %g2, %i5
	st %i5, [%fp+-2680]
	ldd [%fp+-2240], %i2
	ld [%fp+-2760], %i4
	add %i4, %i3, %i3
	ldd [%fp+-2296], %l4
	ld [%fp+-2764], %i2
	add %i2, %l5, %g2
	add %g2, %i5, %i2
	st %i2, [%fp+-2656]
	add %i3, %l1, %i4
	st %i4, [%fp+-2684]
	add %fp, -1028, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2716]
	add %fp, -1036, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2724]
	add %fp, -1860, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2728]
	add %fp, -1868, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2744]
	xor %i4, %l7, %l5
	xor %i2, %l6, %l4
	lduh [%fp+-1028], %i2
	st %i2, [%fp+-2740]
	lduh [%fp+-1036], %i2
	st %i2, [%fp+-2748]
	lduh [%fp+-1860], %i2
	st %i2, [%fp+-2784]
	lduh [%fp+-1868], %i2
	st %i2, [%fp+-2788]
	st %l4, [%fp+-1060]
	st %l5, [%fp+-1068]
	ld [%fp+-2616], %i2
	ld [%fp+-2664], %i4
	add %i2, %i4, %i3
	st %i3, [%fp+-2692]
	ld [%fp+-2592], %i2
	xor %i3, %i2, %i3
	srl %i3, 12, %g2
	sll %i3, 20, %i3
	or %i3, %g2, %l5
	ld [%fp+-2612], %i2
	ld [%fp+-2660], %i5
	add %i2, %i5, %l4
	ld [%fp+-2584], %i2
	xor %l4, %i2, %i3
	srl %i3, 12, %l1
	sll %i3, 20, %i3
	or %i3, %l1, %l1
	ld [%fp+-2472], %i2
	xor %i0, %i2, %i0
	ld [%fp+-2480], %i2
	xor %i1, %i2, %i1
	srl %i0, 8, %i3
	sll %i0, 24, %i0
	or %i0, %i3, %o0
	st %o0, [%fp+-2472]
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %l0
	st %l0, [%fp+-2804]
	ldd [%fp+-2408], %i0
	ld [%fp+-2544], %i2
	add %i2, %i1, %i0
	add %i0, %l5, %g2
	xor %g2, %i4, %i1
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %i3
	ldd [%fp+-2400], %i0
	ld [%fp+-2504], %i2
	add %i2, %i1, %i1
	add %i1, %l1, %i2
	xor %i2, %i5, %i1
	srl %i1, 8, %i0
	sll %i1, 24, %i1
	or %i1, %i0, %i1
	ld [%fp+-2628], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+-2504]
	xor %i0, %o7, %i0
	srl %i0, 7, %o1
	sll %i0, 25, %i0
	or %i0, %o1, %o7
	st %o7, [%fp+-2632]
	ld [%fp+-2836], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+-2480]
	ld [%fp+-2832], %i4
	xor %i0, %i4, %i0
	srl %i0, 7, %o0
	sll %i0, 25, %i0
	or %i0, %o0, %i0
	st %i0, [%fp+-2628]
	ldd [%fp+-2392], %o0
	add %o4, %o1, %o4
	ldd [%fp+-2384], %o0
	add %o5, %o1, %l0
	add %l0, %i0, %l0
	st %l0, [%fp+-2616]
	add %o4, %o7, %i0
	st %i0, [%fp+-2620]
	xor %i0, %i3, %o1
	xor %l0, %i1, %o0
	st %o0, [%fp+-1892]
	st %o1, [%fp+-1900]
	ld [%fp+-2676], %i0
	ld [%fp+-2772], %i4
	add %i4, %i0, %i4
	st %i4, [%fp+-2760]
	ld [%fp+-2672], %i0
	ld [%fp+-2768], %i5
	add %i5, %i0, %i5
	st %i5, [%fp+-2764]
	ld [%fp+-2700], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %l0
	sll %i0, 25, %i0
	or %i0, %l0, %o4
	st %o4, [%fp+-2612]
	ld [%fp+-2732], %i0
	xor %i4, %i0, %i0
	srl %i0, 7, %l0
	sll %i0, 25, %i0
	or %i0, %l0, %l0
	st %l0, [%fp+-2604]
	ldd [%fp+-2280], %o0
	add %g4, %o0, %i0
	ldd [%fp+-2336], %o0
	add %g3, %o0, %i5
	add %i5, %l0, %i5
	st %i5, [%fp+-2600]
	add %i0, %o4, %i0
	st %i0, [%fp+-2608]
	ld [%fp+-2752], %i4
	xor %i0, %i4, %o1
	ld [%fp+-2756], %i0
	xor %i5, %i0, %o0
	add %fp, -1060, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2660]
	add %fp, -1068, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2752]
	add %fp, -1892, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2840]
	add %fp, -1900, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2844]
	lduh [%fp+-1060], %i0
	st %i0, [%fp+-2772]
	lduh [%fp+-1068], %i0
	st %i0, [%fp+-2832]
	lduh [%fp+-1892], %i0
	st %i0, [%fp+-2848]
	lduh [%fp+-1900], %i0
	st %i0, [%fp+-2836]
	st %o0, [%fp+-1012]
	st %o1, [%fp+-1020]
	ld [%fp+-2636], %i0
	ld [%fp+-2800], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2636]
	ld [%fp+-2580], %i4
	ld [%fp+-2792], %i5
	add %i5, %i4, %i4
	st %i4, [%fp+-2640]
	ld [%fp+-2776], %i5
	xor %i4, %i5, %g3
	srl %g3, 7, %l0
	sll %g3, 25, %g3
	or %g3, %l0, %i5
	st %i5, [%fp+-2596]
	ld [%fp+-2780], %i4
	xor %i0, %i4, %g3
	srl %g3, 7, %l0
	sll %g3, 25, %g3
	or %g3, %l0, %i0
	st %i0, [%fp+-2592]
	add %g2, %l2, %i4
	add %i2, %o2, %i2
	add %i2, %i0, %i0
	st %i0, [%fp+-2580]
	add %i4, %i5, %i2
	st %i2, [%fp+-2584]
	ld [%fp+-2696], %i4
	xor %i2, %i4, %o1
	ld [%fp+-2796], %i2
	xor %i0, %i2, %o0
	st %o0, [%fp+-1844]
	st %o1, [%fp+-1852]
	ld [%fp+-2828], %i0
	add %l6, %i0, %o4
	ld [%fp+-2816], %i0
	add %l7, %i0, %o7
	ld [%fp+-2820], %i0
	xor %o7, %i0, %i2
	srl %i2, 7, %i4
	sll %i2, 25, %i2
	or %i2, %i4, %g3
	st %g3, [%fp+-2768]
	ld [%fp+-2824], %i0
	xor %o4, %i0, %i2
	srl %i2, 7, %i4
	sll %i2, 25, %i2
	or %i2, %i4, %g2
	st %g2, [%fp+-2756]
	ldd [%fp+-2448], %i4
	ld [%fp+-2644], %i0
	add %i0, %i5, %i2
	ldd [%fp+-2440], %i4
	ld [%fp+-2736], %i0
	add %i0, %i5, %i4
	add %i4, %g2, %i0
	st %i0, [%fp+-2544]
	add %i2, %g3, %i2
	st %i2, [%fp+-2676]
	ld [%fp+-2808], %i4
	xor %i2, %i4, %o1
	ld [%fp+-2812], %i2
	xor %i0, %i2, %o0
	add %fp, -1012, %i2
	or %i2, 2, %i2
	lduh [%i2], %l7
	add %fp, -1020, %i2
	or %i2, 2, %i2
	lduh [%i2], %l3
	add %fp, -1844, %o3
	or %o3, 2, %o3
	lduh [%o3], %o3
	add %fp, -1852, %g4
	or %g4, 2, %g4
	lduh [%g4], %g4
	lduh [%fp+-1012], %l2
	lduh [%fp+-1020], %l0
	lduh [%fp+-1844], %i5
	lduh [%fp+-1852], %i4
	st %o0, [%fp+-980]
	st %o1, [%fp+-988]
	add %i1, %l4, %i0
	st %i0, [%fp+-2700]
	ld [%fp+-2692], %i1
	add %i3, %i1, %i1
	st %i1, [%fp+-2704]
	xor %i1, %l5, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %g2
	st %g2, [%fp+-2696]
	xor %i0, %l1, %i1
	srl %i1, 7, %i3
	sll %i1, 25, %i1
	or %i1, %i3, %i2
	st %i2, [%fp+-2692]
	ldd [%fp+-2432], %i0
	ld [%fp+-2624], %i3
	add %i3, %i1, %i1
	ldd [%fp+-2424], %o0
	ld [%fp+-2652], %i0
	add %i0, %o1, %i3
	add %i3, %i2, %i0
	st %i0, [%fp+-2664]
	add %i1, %g2, %i1
	st %i1, [%fp+-2672]
	ld [%fp+-2472], %i2
	xor %i1, %i2, %o1
	ld [%fp+-2804], %i1
	xor %i0, %i1, %o0
	st %o0, [%fp+-1812]
	st %o1, [%fp+-1820]
	add %fp, -980, %i1
	or %i1, 2, %i1
	lduh [%i1], %g3
	add %fp, -988, %i1
	or %i1, 2, %i1
	lduh [%i1], %l5
	add %fp, -1812, %i1
	or %i1, 2, %i1
	lduh [%i1], %i3
	add %fp, -1820, %g2
	or %g2, 2, %g2
	lduh [%g2], %l6
	add %fp, -1872, %g2
	or %g2, 2, %g2
	lduh [%fp+-980], %o0
	lduh [%fp+-988], %o1
	lduh [%fp+-1812], %l4
	lduh [%fp+-1820], %l1
	ld [%fp+-2788], %i0
	sth %i0, [%g2]
	add %fp, -1864, %g2
	or %g2, 2, %g2
	ld [%fp+-2784], %i0
	sth %i0, [%g2]
	ld [%fp+-2744], %i0
	sth %i0, [%fp+-1872]
	ld [%fp+-2728], %i0
	sth %i0, [%fp+-1864]
	add %fp, -1040, %g2
	or %g2, 2, %g2
	ld [%fp+-1872], %o5
	st %o5, [%fp+-2828]
	ld [%fp+-1864], %i0
	st %i0, [%fp+-2472]
	ld [%fp+-2748], %i0
	sth %i0, [%g2]
	add %fp, -1032, %g2
	or %g2, 2, %g2
	ld [%fp+-2740], %i0
	sth %i0, [%g2]
	ld [%fp+-2724], %i0
	sth %i0, [%fp+-1040]
	ld [%fp+-2716], %i0
	sth %i0, [%fp+-1032]
	add %fp, -1904, %g2
	or %g2, 2, %g2
	ld [%fp+-1040], %i1
	st %i1, [%fp+-2716]
	ld [%fp+-1032], %i2
	st %i2, [%fp+-2732]
	ld [%fp+-2836], %i0
	sth %i0, [%g2]
	add %fp, -1896, %g2
	or %g2, 2, %g2
	ld [%fp+-2848], %i0
	sth %i0, [%g2]
	ld [%fp+-2844], %i0
	sth %i0, [%fp+-1904]
	ld [%fp+-2840], %i0
	sth %i0, [%fp+-1896]
	add %fp, -1072, %g2
	or %g2, 2, %o2
	ld [%fp+-1904], %i0
	st %i0, [%fp+-2744]
	ld [%fp+-1896], %i0
	st %i0, [%fp+-2740]
	ld [%fp+-2832], %i0
	sth %i0, [%o2]
	add %fp, -1064, %o2
	or %o2, 2, %o2
	ld [%fp+-2772], %i0
	sth %i0, [%o2]
	ld [%fp+-2752], %i0
	sth %i0, [%fp+-1072]
	ld [%fp+-2660], %i0
	sth %i0, [%fp+-1064]
	add %fp, -1856, %o2
	or %o2, 2, %i0
	ld [%fp+-1072], %g2
	ld [%fp+-1064], %o2
	sth %i4, [%i0]
	add %fp, -1848, %i0
	or %i0, 2, %i0
	sth %i5, [%i0]
	sth %g4, [%fp+-1856]
	sth %o3, [%fp+-1848]
	add %fp, -1024, %i0
	or %i0, 2, %i0
	ld [%fp+-1856], %i4
	st %i4, [%fp+-2660]
	ld [%fp+-1848], %i4
	st %i4, [%fp+-2652]
	sth %l0, [%i0]
	add %fp, -1016, %i0
	or %i0, 2, %i0
	sth %l2, [%i0]
	sth %l3, [%fp+-1024]
	sth %l7, [%fp+-1016]
	add %fp, -1824, %i0
	or %i0, 2, %i0
	ld [%fp+-1024], %i4
	st %i4, [%fp+-2728]
	ld [%fp+-1016], %i4
	st %i4, [%fp+-2724]
	sth %l1, [%i0]
	add %fp, -1816, %i0
	or %i0, 2, %i0
	sth %l4, [%i0]
	sth %l6, [%fp+-1824]
	sth %i3, [%fp+-1816]
	add %fp, -992, %i0
	or %i0, 2, %i0
	ld [%fp+-1824], %o3
	ld [%fp+-1816], %l7
	sth %o1, [%i0]
	add %fp, -984, %i0
	or %i0, 2, %i0
	sth %o0, [%i0]
	sth %l5, [%fp+-992]
	sth %g3, [%fp+-984]
	add %o7, %i1, %i0
	st %i0, [%fp+-2624]
	ld [%fp+-2720], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l4
	st %l4, [%fp+-2752]
	add %o4, %i2, %i0
	st %i0, [%fp+-2644]
	ld [%fp+-2712], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l6
	st %l6, [%fp+-2748]
	ld [%fp+-2648], %i0
	add %i0, %g2, %o7
	ld [%fp+-2708], %i0
	xor %o7, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l0
	ld [%fp+-2688], %i0
	add %i0, %o2, %i4
	ld [%fp+-2680], %i0
	xor %i4, %i0, %i0
	ld [%fp+-992], %l5
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %i3
	ld [%fp+-2764], %i0
	add %i0, %l5, %i0
	st %i0, [%fp+-2680]
	ld [%fp+-2768], %i1
	xor %i0, %i1, %i0
	ld [%fp+-984], %g3
	srl %i0, 12, %i5
	sll %i0, 20, %i0
	or %i0, %i5, %i1
	st %i1, [%fp+-2736]
	ld [%fp+-2760], %i0
	add %i0, %g3, %i0
	st %i0, [%fp+-2708]
	ld [%fp+-2756], %i2
	xor %i0, %i2, %i0
	srl %i0, 12, %i5
	sll %i0, 20, %i0
	or %i0, %i5, %i2
	st %i2, [%fp+-2756]
	ldd [%fp+-2224], %l2
	ld [%fp+-2684], %i0
	add %i0, %l3, %i0
	add %i0, %l0, %i0
	st %i0, [%fp+-2764]
	xor %i0, %g2, %i0
	srl %i0, 8, %i5
	sll %i0, 24, %i0
	or %i0, %i5, %g2
	st %g2, [%fp+-2720]
	ldd [%fp+-2216], %l2
	ld [%fp+-2656], %i0
	add %i0, %l3, %i0
	add %i0, %i3, %i0
	st %i0, [%fp+-2768]
	xor %i0, %o2, %i5
	srl %i5, 8, %g4
	sll %i5, 24, %i5
	or %i5, %g4, %l1
	st %l1, [%fp+-2760]
	ldd [%fp+-2312], %l2
	ld [%fp+-2676], %i0
	add %i0, %l3, %i5
	add %i5, %i1, %i0
	st %i0, [%fp+-2688]
	xor %i0, %l5, %i5
	srl %i5, 8, %g4
	sll %i5, 24, %i5
	or %i5, %g4, %g4
	st %g4, [%fp+-2784]
	ldd [%fp+-2248], %l2
	ld [%fp+-2544], %i0
	add %i0, %l3, %i5
	add %i5, %i2, %i0
	st %i0, [%fp+-2712]
	xor %i0, %g3, %i5
	srl %i5, 8, %g3
	sll %i5, 24, %i5
	or %i5, %g3, %l2
	st %l2, [%fp+-2788]
	add %g2, %o7, %i0
	st %i0, [%fp+-2648]
	xor %i0, %l0, %i5
	srl %i5, 7, %g3
	sll %i5, 25, %i5
	or %i5, %g3, %i2
	st %i2, [%fp+-2684]
	add %l1, %i4, %i0
	st %i0, [%fp+-2656]
	xor %i0, %i3, %i3
	srl %i3, 7, %i4
	sll %i3, 25, %i3
	or %i3, %i4, %i1
	st %i1, [%fp+-2676]
	ldd [%fp+-2448], %i4
	ld [%fp+-2552], %i0
	add %i0, %i4, %i4
	ldd [%fp+-2440], %l0
	ld [%fp+-2588], %i0
	add %i0, %l0, %i3
	add %i3, %l6, %i3
	add %i4, %l4, %i0
	ldd [%fp+-2272], %i4
	add %i3, %i5, %i4
	add %i4, %i1, %g3
	st %g3, [%fp+-2552]
	ldd [%fp+-2328], %l4
	add %i0, %l5, %i4
	add %i4, %i2, %i4
	st %i4, [%fp+-2544]
	xor %i4, %g4, %i5
	xor %g3, %l2, %i4
	st %i4, [%fp+-1076]
	st %i5, [%fp+-1084]
	ld [%fp+-2704], %i1
	add %i1, %o5, %i1
	st %i1, [%fp+-2704]
	ld [%fp+-2576], %i4
	xor %i1, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %l3
	st %l3, [%fp+-2776]
	ld [%fp+-2472], %i1
	ld [%fp+-2700], %i2
	add %i2, %i1, %i1
	st %i1, [%fp+-2780]
	ld [%fp+-2568], %i4
	xor %i1, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %o4
	st %o4, [%fp+-2700]
	ld [%fp+-2536], %i4
	ld [%fp+-2744], %g2
	add %i4, %g2, %i4
	ld [%fp+-2632], %i5
	xor %i4, %i5, %i5
	srl %i5, 12, %g3
	sll %i5, 20, %i5
	or %i5, %g3, %i5
	ld [%fp+-2528], %g3
	ld [%fp+-2740], %i2
	add %g3, %i2, %g4
	ld [%fp+-2628], %g3
	xor %g4, %g3, %g3
	srl %g3, 12, %l0
	sll %g3, 20, %g3
	or %g3, %l0, %o2
	ld [%fp+-2640], %i1
	add %i1, %o3, %g3
	st %g3, [%fp+-2588]
	ld [%fp+-2696], %i1
	xor %g3, %i1, %g3
	srl %g3, 12, %l0
	sll %g3, 20, %g3
	or %g3, %l0, %l6
	st %l6, [%fp+-2696]
	ld [%fp+-2636], %i1
	mov	%l7, %l2
	add %i1, %l7, %g3
	st %g3, [%fp+-2812]
	ld [%fp+-2692], %i1
	xor %g3, %i1, %g3
	srl %g3, 12, %l0
	sll %g3, 20, %g3
	or %g3, %l0, %o5
	st %o5, [%fp+-2804]
	ldd [%fp+-2232], %l0
	ld [%fp+-2620], %g3
	add %g3, %l1, %g3
	add %g3, %i5, %i1
	st %i1, [%fp+-2840]
	xor %i1, %g2, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %l1
	st %l1, [%fp+-2620]
	ldd [%fp+-2344], %g2
	ld [%fp+-2616], %l0
	add %l0, %g3, %g2
	add %g2, %o2, %i1
	st %i1, [%fp+-2616]
	xor %i1, %i2, %g2
	srl %g2, 8, %g3
	sll %g2, 24, %g2
	or %g2, %g3, %l0
	st %l0, [%fp+-2816]
	ldd [%fp+-2408], %o0
	ld [%fp+-2672], %i1
	add %i1, %o1, %g2
	add %g2, %l6, %i1
	st %i1, [%fp+-2672]
	xor %i1, %o3, %i1
	srl %i1, 8, %g2
	sll %i1, 24, %i1
	or %i1, %g2, %o3
	st %o3, [%fp+-2820]
	ldd [%fp+-2400], %l6
	ld [%fp+-2664], %i1
	add %i1, %l7, %i1
	add %i1, %o5, %i1
	st %i1, [%fp+-2692]
	xor %i1, %l2, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %o5
	st %o5, [%fp+-2664]
	add %l1, %i4, %i1
	st %i1, [%fp+-2536]
	xor %i1, %i5, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %g3
	st %g3, [%fp+-2576]
	add %l0, %g4, %i1
	st %i1, [%fp+-2528]
	xor %i1, %o2, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %g2
	st %g2, [%fp+-2568]
	ldd [%fp+-2432], %i4
	ld [%fp+-2496], %i1
	add %i1, %i4, %i1
	ldd [%fp+-2424], %i4
	ld [%fp+-2488], %i2
	add %i2, %i4, %i2
	add %i2, %o4, %g4
	add %i1, %l3, %i2
	ldd [%fp+-2416], %l2
	add %g4, %l3, %i4
	add %i4, %g2, %g2
	st %g2, [%fp+-2488]
	ldd [%fp+-2320], %l0
	add %i2, %l1, %i4
	add %i4, %g3, %i4
	st %i4, [%fp+-2496]
	xor %i4, %o3, %i5
	xor %g2, %o5, %i4
	st %i4, [%fp+-1908]
	st %i5, [%fp+-1916]
	ld [%fp+-2520], %i4
	ld [%fp+-2728], %g2
	add %i4, %g2, %o2
	ld [%fp+-2612], %i4
	xor %o2, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %o3
	ld [%fp+-2512], %i4
	ld [%fp+-2724], %g3
	add %i4, %g3, %o4
	ld [%fp+-2604], %i4
	xor %o4, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %o5
	ld [%fp+-2716], %i4
	xor %i0, %i4, %i4
	ld [%fp+-2732], %i0
	xor %i3, %i0, %i3
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %i1
	st %i1, [%fp+-2836]
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i0
	st %i0, [%fp+-2844]
	ld [%fp+-2608], %i0
	add %i0, %l4, %i3
	add %i3, %o3, %o7
	xor %o7, %g2, %i3
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %i4
	st %i4, [%fp+-2824]
	ld [%fp+-2600], %i0
	ldd [%fp+-2272], %l4
	add %i0, %l4, %i3
	add %i3, %o5, %i5
	xor %i5, %g3, %i3
	srl %i3, 8, %g2
	sll %i3, 24, %i3
	or %i3, %g2, %g2
	st %g2, [%fp+-2832]
	add %i4, %o2, %i0
	st %i0, [%fp+-2724]
	xor %i0, %o3, %i3
	srl %i3, 7, %o2
	sll %i3, 25, %i3
	or %i3, %o2, %l5
	st %l5, [%fp+-2772]
	add %g2, %o4, %i0
	st %i0, [%fp+-2732]
	xor %i0, %o5, %i3
	srl %i3, 7, %o2
	sll %i3, 25, %i3
	or %i3, %o2, %i4
	st %i4, [%fp+-2740]
	ldd [%fp+-2312], %g2
	ld [%fp+-2764], %i0
	add %i0, %g2, %i3
	ldd [%fp+-2248], %g2
	ld [%fp+-2768], %i0
	add %i0, %g2, %o2
	add %o2, %i4, %i0
	st %i0, [%fp+-2512]
	add %i3, %l5, %i4
	st %i4, [%fp+-2608]
	add %fp, -1076, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2716]
	add %fp, -1084, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2728]
	add %fp, -1908, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2744]
	add %fp, -1916, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2792]
	xor %i4, %i1, %o3
	ld [%fp+-2844], %l4
	xor %i0, %l4, %o2
	lduh [%fp+-1076], %i0
	st %i0, [%fp+-2768]
	lduh [%fp+-1084], %i0
	st %i0, [%fp+-2796]
	lduh [%fp+-1908], %i0
	st %i0, [%fp+-2800]
	lduh [%fp+-1916], %i0
	st %i0, [%fp+-2808]
	st %o2, [%fp+-1124]
	st %o3, [%fp+-1132]
	ld [%fp+-2504], %i0
	ld [%fp+-2660], %g3
	add %i0, %g3, %o2
	ld [%fp+-2596], %i0
	xor %o2, %i0, %i3
	srl %i3, 12, %o3
	sll %i3, 20, %i3
	or %i3, %o3, %o3
	ld [%fp+-2480], %i0
	ld [%fp+-2652], %l5
	add %i0, %l5, %o4
	ld [%fp+-2592], %i0
	xor %o4, %i0, %i3
	srl %i3, 12, %o5
	sll %i3, 20, %i3
	or %i3, %o5, %i0
	ld [%fp+-2828], %i3
	xor %i2, %i3, %i1
	ld [%fp+-2472], %i3
	xor %g4, %i3, %i3
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %g2
	srl %i3, 8, %i1
	sll %i3, 24, %i3
	or %i3, %i1, %o5
	ld [%fp+-2584], %i1
	add %i1, %l0, %i1
	add %i1, %o3, %i4
	xor %i4, %g3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %g3
	ld [%fp+-2580], %i1
	add %i1, %l2, %i2
	add %i2, %i0, %i3
	xor %i3, %l5, %i2
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %i2
	add %g3, %o2, %i1
	st %i1, [%fp+-2636]
	xor %i1, %o3, %i1
	srl %i1, 7, %o2
	sll %i1, 25, %i1
	or %i1, %o2, %l1
	st %l1, [%fp+-2640]
	add %i2, %o4, %i1
	st %i1, [%fp+-2632]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2628]
	ld [%fp+-2840], %i0
	add %i0, %o0, %i0
	ld [%fp+-2616], %i1
	add %i1, %l6, %i1
	add %i1, %l0, %l0
	st %l0, [%fp+-2612]
	add %i0, %l1, %i0
	st %i0, [%fp+-2616]
	xor %i0, %g2, %i1
	xor %l0, %o5, %i0
	st %i0, [%fp+-1956]
	st %i1, [%fp+-1964]
	ld [%fp+-2708], %i0
	ld [%fp+-2788], %i1
	add %i1, %i0, %l0
	st %l0, [%fp+-2764]
	ld [%fp+-2680], %i0
	ld [%fp+-2784], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2708]
	ld [%fp+-2736], %i0
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l3
	st %l3, [%fp+-2604]
	ld [%fp+-2756], %i0
	xor %l0, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l2
	st %l2, [%fp+-2596]
	ldd [%fp+-2376], %i0
	add %o7, %i0, %i0
	ldd [%fp+-2368], %l0
	add %i5, %l0, %i1
	add %i1, %l2, %i5
	st %i5, [%fp+-2520]
	add %i0, %l3, %i0
	st %i0, [%fp+-2600]
	ld [%fp+-2720], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2760], %l0
	xor %i5, %l0, %i0
	add %fp, -1124, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2680]
	add %fp, -1132, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2720]
	add %fp, -1956, %l2
	or %l2, 2, %l2
	lduh [%l2], %o4
	add %fp, -1964, %l2
	or %l2, 2, %l2
	lduh [%l2], %o3
	lduh [%fp+-1124], %i5
	st %i5, [%fp+-2736]
	lduh [%fp+-1132], %i5
	st %i5, [%fp+-2756]
	lduh [%fp+-1956], %o2
	lduh [%fp+-1964], %o1
	st %i0, [%fp+-1092]
	st %i1, [%fp+-1100]
	ld [%fp+-2812], %i0
	ld [%fp+-2664], %i1
	add %i1, %i0, %i5
	st %i5, [%fp+-2660]
	ld [%fp+-2588], %i0
	ld [%fp+-2820], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2664]
	ld [%fp+-2696], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l1
	st %l1, [%fp+-2592]
	ld [%fp+-2804], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2588]
	ldd [%fp+-2360], %i0
	add %i4, %i0, %i0
	ldd [%fp+-2352], %i4
	add %i3, %i4, %i1
	add %i1, %l0, %i3
	st %i3, [%fp+-2580]
	add %i0, %l1, %i0
	st %i0, [%fp+-2584]
	ld [%fp+-2620], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2816], %i4
	xor %i3, %i4, %i0
	st %i0, [%fp+-1924]
	st %i1, [%fp+-1932]
	ld [%fp+-2644], %i0
	add %l4, %i0, %i3
	st %i3, [%fp+-2644]
	ld [%fp+-2624], %i0
	ld [%fp+-2836], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2652]
	ld [%fp+-2752], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %o0
	ld [%fp+-2748], %i0
	xor %i3, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g4
	st %g4, [%fp+-2752]
	ldd [%fp+-2224], %i0
	ld [%fp+-2688], %i3
	add %i3, %i0, %i0
	ldd [%fp+-2216], %i4
	ld [%fp+-2712], %i1
	add %i1, %i4, %i1
	add %i1, %g4, %i1
	st %i1, [%fp+-2504]
	add %i0, %o0, %i0
	st %i0, [%fp+-2712]
	ld [%fp+-2824], %i3
	xor %i0, %i3, %l5
	ld [%fp+-2832], %i0
	xor %i1, %i0, %l4
	add %fp, -1092, %i0
	or %i0, 2, %i0
	lduh [%i0], %l2
	add %fp, -1100, %i0
	or %i0, 2, %i0
	lduh [%i0], %l1
	add %fp, -1924, %i3
	or %i3, 2, %i3
	lduh [%i3], %i4
	add %fp, -1932, %g4
	or %g4, 2, %g4
	lduh [%g4], %g4
	lduh [%fp+-1092], %l0
	lduh [%fp+-1100], %l3
	lduh [%fp+-1924], %l7
	lduh [%fp+-1932], %l6
	st %l4, [%fp+-1044]
	st %l5, [%fp+-1052]
	ld [%fp+-2780], %i0
	add %o5, %i0, %i0
	st %i0, [%fp+-2620]
	ld [%fp+-2704], %i1
	add %g2, %i1, %i1
	st %i1, [%fp+-2624]
	ld [%fp+-2776], %i3
	xor %i1, %i3, %g2
	srl %g2, 7, %l4
	sll %g2, 25, %g2
	or %g2, %l4, %i5
	st %i5, [%fp+-2704]
	ld [%fp+-2700], %i1
	xor %i0, %i1, %g2
	srl %g2, 7, %l4
	sll %g2, 25, %g2
	or %g2, %l4, %i3
	st %i3, [%fp+-2700]
	ldd [%fp+-2232], %i0
	ld [%fp+-2672], %g2
	add %g2, %i0, %g2
	ldd [%fp+-2344], %i0
	ld [%fp+-2692], %l4
	add %l4, %i0, %l4
	add %l4, %i3, %i0
	st %i0, [%fp+-2692]
	add %g2, %i5, %i1
	st %i1, [%fp+-2696]
	xor %i1, %g3, %g3
	xor %i0, %i2, %g2
	st %g2, [%fp+-1876]
	st %g3, [%fp+-1884]
	add %fp, -1044, %i2
	or %i2, 2, %i2
	lduh [%i2], %i5
	add %fp, -1052, %g2
	or %g2, 2, %g2
	lduh [%g2], %g2
	add %fp, -1876, %g3
	or %g3, 2, %g3
	lduh [%g3], %g3
	add %fp, -1884, %l4
	or %l4, 2, %l4
	lduh [%l4], %l4
	add %fp, -1920, %l5
	or %l5, 2, %l5
	lduh [%fp+-1044], %o5
	lduh [%fp+-1052], %i3
	lduh [%fp+-1876], %i1
	lduh [%fp+-1884], %i0
	ld [%fp+-2808], %i2
	sth %i2, [%l5]
	add %fp, -1912, %l5
	or %l5, 2, %l5
	ld [%fp+-2800], %i2
	sth %i2, [%l5]
	ld [%fp+-2792], %i2
	sth %i2, [%fp+-1920]
	ld [%fp+-2744], %i2
	sth %i2, [%fp+-1912]
	add %fp, -1088, %l5
	or %l5, 2, %l5
	ld [%fp+-1920], %o7
	st %o7, [%fp+-2480]
	ld [%fp+-1912], %o7
	st %o7, [%fp+-2472]
	ld [%fp+-2796], %i2
	sth %i2, [%l5]
	add %fp, -1080, %l5
	or %l5, 2, %l5
	ld [%fp+-2768], %i2
	sth %i2, [%l5]
	ld [%fp+-2728], %i2
	sth %i2, [%fp+-1088]
	ld [%fp+-2716], %i2
	sth %i2, [%fp+-1080]
	add %fp, -1968, %l5
	or %l5, 2, %l5
	ld [%fp+-1088], %o7
	st %o7, [%fp+-2728]
	ld [%fp+-1080], %i2
	st %i2, [%fp+-2744]
	sth %o1, [%l5]
	add %fp, -1960, %l5
	or %l5, 2, %l5
	sth %o2, [%l5]
	sth %o3, [%fp+-1968]
	sth %o4, [%fp+-1960]
	add %fp, -1136, %l5
	or %l5, 2, %l5
	ld [%fp+-1968], %o3
	ld [%fp+-1960], %o1
	st %o1, [%fp+-2748]
	ld [%fp+-2756], %o1
	sth %o1, [%l5]
	add %fp, -1128, %l5
	or %l5, 2, %l5
	ld [%fp+-2736], %o1
	sth %o1, [%l5]
	ld [%fp+-2720], %l5
	sth %l5, [%fp+-1136]
	ld [%fp+-2680], %l5
	sth %l5, [%fp+-1128]
	add %fp, -1936, %l5
	or %l5, 2, %o1
	ld [%fp+-1136], %o4
	ld [%fp+-1128], %l5
	sth %l6, [%o1]
	add %fp, -1928, %l6
	or %l6, 2, %l6
	sth %l7, [%l6]
	sth %g4, [%fp+-1936]
	sth %i4, [%fp+-1928]
	add %fp, -1104, %i4
	or %i4, 2, %i4
	ld [%fp+-1936], %g4
	st %g4, [%fp+-2680]
	ld [%fp+-1928], %g4
	st %g4, [%fp+-2672]
	sth %l3, [%i4]
	add %fp, -1096, %i4
	or %i4, 2, %i4
	sth %l0, [%i4]
	sth %l1, [%fp+-1104]
	sth %l2, [%fp+-1096]
	add %fp, -1888, %i4
	or %i4, 2, %i4
	ld [%fp+-1104], %g4
	st %g4, [%fp+-2720]
	ld [%fp+-1096], %g4
	st %g4, [%fp+-2716]
	sth %i0, [%i4]
	add %fp, -1880, %i0
	or %i0, 2, %i0
	sth %i1, [%i0]
	sth %l4, [%fp+-1888]
	sth %g3, [%fp+-1880]
	add %fp, -1056, %i0
	or %i0, 2, %i0
	ld [%fp+-1888], %l1
	ld [%fp+-1880], %i4
	sth %i3, [%i0]
	add %fp, -1048, %i0
	or %i0, 2, %i0
	sth %o5, [%i0]
	sth %g2, [%fp+-1056]
	sth %i5, [%fp+-1048]
	ld [%fp+-2724], %i0
	add %i0, %o7, %i1
	st %i1, [%fp+-2724]
	ld [%fp+-2684], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o1
	st %o1, [%fp+-2780]
	ld [%fp+-2732], %i0
	add %i0, %i2, %i1
	st %i1, [%fp+-2732]
	ld [%fp+-2676], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o2
	st %o2, [%fp+-2776]
	ld [%fp+-2708], %i0
	add %i0, %o4, %i0
	st %i0, [%fp+-2684]
	ld [%fp+-2772], %i1
	xor %i0, %i1, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2708]
	ld [%fp+-2764], %i0
	add %i0, %l5, %i0
	st %i0, [%fp+-2688]
	ld [%fp+-2740], %i1
	xor %i0, %i1, %i0
	ld [%fp+-1056], %i3
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2736]
	ld [%fp+-2648], %i0
	add %i0, %i3, %g4
	xor %g4, %o0, %i1
	ld [%fp+-1048], %i0
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l4
	ld [%fp+-2656], %i1
	add %i1, %i0, %i1
	ld [%fp+-2752], %i2
	xor %i1, %i2, %i2
	srl %i2, 12, %i5
	sll %i2, 20, %i2
	or %i2, %i5, %l0
	ldd [%fp+-2240], %l2
	ld [%fp+-2608], %i2
	add %i2, %l2, %i2
	add %i2, %g2, %i2
	st %i2, [%fp+-2760]
	xor %i2, %o4, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %o0
	st %o0, [%fp+-2768]
	ldd [%fp+-2296], %l6
	ld [%fp+-2512], %i2
	add %i2, %l6, %i2
	add %i2, %g3, %i2
	st %i2, [%fp+-2764]
	xor %i2, %l5, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l5
	st %l5, [%fp+-2772]
	ldd [%fp+-2264], %g2
	ld [%fp+-2712], %i2
	add %i2, %g3, %i2
	add %i2, %l4, %i2
	st %i2, [%fp+-2712]
	xor %i2, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i5
	st %i5, [%fp+-2752]
	ldd [%fp+-2256], %i2
	ld [%fp+-2504], %g2
	add %g2, %i3, %i2
	add %i2, %l0, %i2
	st %i2, [%fp+-2740]
	xor %i2, %i0, %i0
	srl %i0, 8, %i2
	sll %i0, 24, %i0
	or %i0, %i2, %i3
	st %i3, [%fp+-2756]
	add %i5, %g4, %i0
	st %i0, [%fp+-2608]
	xor %i0, %l4, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g3
	st %g3, [%fp+-2676]
	add %i3, %i1, %i0
	st %i0, [%fp+-2648]
	xor %i0, %l0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2656]
	ldd [%fp+-2376], %i0
	ld [%fp+-2544], %i2
	add %i2, %i1, %i0
	ldd [%fp+-2368], %i2
	ld [%fp+-2552], %i1
	add %i1, %i3, %i1
	add %i1, %o2, %o4
	add %i0, %o1, %o2
	add %o4, %l7, %i0
	add %i0, %g2, %i2
	st %i2, [%fp+-2504]
	add %o2, %l3, %i0
	add %i0, %g3, %i0
	st %i0, [%fp+-2512]
	xor %i0, %o0, %i1
	xor %i2, %l5, %i0
	st %i0, [%fp+-1156]
	st %i1, [%fp+-1164]
	ld [%fp+-2636], %i0
	ld [%fp+-2480], %i1
	add %i0, %i1, %i1
	st %i1, [%fp+-2808]
	ld [%fp+-2576], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o7
	ld [%fp+-2632], %i0
	ld [%fp+-2472], %i1
	add %i0, %i1, %i1
	st %i1, [%fp+-2796]
	ld [%fp+-2568], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %o5
	ld [%fp+-2664], %i0
	mov	%o3, %i3
	add %i0, %o3, %i1
	st %i1, [%fp+-2576]
	ld [%fp+-2640], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l0
	st %l0, [%fp+-2632]
	ld [%fp+-2660], %i0
	ld [%fp+-2748], %l6
	add %i0, %l6, %i1
	st %i1, [%fp+-2640]
	ld [%fp+-2628], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %l7
	st %l7, [%fp+-2636]
	ld [%fp+-2536], %i0
	add %i0, %l1, %i0
	ld [%fp+-2704], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l2
	ld [%fp+-2528], %i1
	add %i1, %i4, %l3
	ld [%fp+-2700], %i1
	xor %l3, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %l4
	ldd [%fp+-2392], %g2
	ld [%fp+-2616], %i1
	add %i1, %g2, %i1
	add %i1, %l0, %o3
	xor %o3, %i3, %i1
	srl %i1, 8, %l5
	sll %i1, 24, %i1
	or %i1, %l5, %g4
	st %g4, [%fp+-2800]
	ldd [%fp+-2384], %i2
	ld [%fp+-2612], %i1
	add %i1, %i2, %i1
	add %i1, %l7, %l0
	xor %l0, %l6, %l5
	srl %l5, 8, %l6
	sll %l5, 24, %l5
	or %l5, %l6, %i5
	st %i5, [%fp+-2748]
	ldd [%fp+-2304], %o0
	ld [%fp+-2696], %i1
	add %i1, %o1, %l5
	add %l5, %l2, %i1
	st %i1, [%fp+-2616]
	xor %i1, %l1, %l5
	srl %l5, 8, %l6
	sll %l5, 24, %l5
	or %l5, %l6, %l1
	st %l1, [%fp+-2792]
	ldd [%fp+-2288], %l6
	ld [%fp+-2692], %i1
	add %i1, %l7, %l5
	add %l5, %l4, %i1
	st %i1, [%fp+-2628]
	xor %i1, %i4, %i4
	srl %i4, 8, %l5
	sll %i4, 24, %i4
	or %i4, %l5, %i1
	st %i1, [%fp+-2804]
	add %l1, %i0, %i0
	st %i0, [%fp+-2544]
	xor %i0, %l2, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %l1
	st %l1, [%fp+-2568]
	add %i1, %l3, %i0
	st %i0, [%fp+-2536]
	xor %i0, %l4, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %l4
	st %l4, [%fp+-2552]
	ldd [%fp+-2360], %i0
	ld [%fp+-2496], %i4
	add %i4, %i1, %i0
	ldd [%fp+-2352], %l2
	ld [%fp+-2488], %i1
	add %i1, %l3, %i4
	add %i4, %o5, %l2
	add %i0, %o7, %i0
	add %l2, %i3, %i4
	add %i4, %l4, %i1
	st %i1, [%fp+-2488]
	add %i0, %g3, %i4
	add %i4, %l1, %i2
	st %i2, [%fp+-2496]
	xor %i2, %g4, %l5
	xor %i1, %i5, %l4
	st %l4, [%fp+-1988]
	st %l5, [%fp+-1996]
	ld [%fp+-2652], %i1
	ld [%fp+-2720], %g2
	add %i1, %g2, %i2
	st %i2, [%fp+-2652]
	ld [%fp+-2604], %i1
	xor %i2, %i1, %i4
	srl %i4, 12, %l3
	sll %i4, 20, %i4
	or %i4, %l3, %i5
	st %i5, [%fp+-2812]
	ld [%fp+-2644], %i1
	ld [%fp+-2716], %g3
	add %i1, %g3, %i2
	st %i2, [%fp+-2816]
	ld [%fp+-2596], %i1
	xor %i2, %i1, %i4
	srl %i4, 12, %l3
	sll %i4, 20, %i4
	or %i4, %l3, %l1
	st %l1, [%fp+-2644]
	ld [%fp+-2728], %i1
	xor %o2, %i1, %i3
	ld [%fp+-2744], %i1
	xor %o4, %i1, %i4
	srl %i3, 8, %g4
	sll %i3, 24, %i3
	or %i3, %g4, %g4
	st %g4, [%fp+-2820]
	srl %i4, 8, %i3
	sll %i4, 24, %i4
	or %i4, %i3, %o4
	ldd [%fp+-2264], %i2
	ld [%fp+-2600], %i1
	add %i1, %i2, %i3
	add %i3, %i5, %l3
	xor %l3, %g2, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %o2
	ldd [%fp+-2256], %i2
	ld [%fp+-2520], %i4
	add %i4, %i2, %i3
	add %i3, %l1, %i5
	xor %i5, %g3, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %g2
	ld [%fp+-2724], %i2
	add %g4, %i2, %i2
	st %i2, [%fp+-2528]
	ld [%fp+-2780], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %g4
	sll %i3, 25, %i3
	or %i3, %g4, %i4
	st %i4, [%fp+-2692]
	ld [%fp+-2732], %i2
	add %o4, %i2, %i2
	st %i2, [%fp+-2520]
	ld [%fp+-2776], %i3
	xor %i2, %i3, %i3
	srl %i3, 7, %g4
	sll %i3, 25, %i3
	or %i3, %g4, %g3
	st %g3, [%fp+-2696]
	ldd [%fp+-2224], %i2
	ld [%fp+-2760], %g4
	add %g4, %i3, %i3
	ldd [%fp+-2216], %l4
	ld [%fp+-2764], %i2
	add %i2, %l5, %g4
	add %g4, %g3, %i2
	st %i2, [%fp+-2612]
	add %i3, %i4, %i4
	st %i4, [%fp+-2704]
	add %fp, -1156, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2660]
	add %fp, -1164, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2664]
	add %fp, -1988, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2700]
	add %fp, -1996, %i3
	or %i3, 2, %i3
	lduh [%i3], %i3
	st %i3, [%fp+-2776]
	xor %i4, %o2, %l5
	xor %i2, %g2, %l4
	lduh [%fp+-1156], %i2
	st %i2, [%fp+-2764]
	lduh [%fp+-1164], %i2
	st %i2, [%fp+-2780]
	lduh [%fp+-1988], %i2
	st %i2, [%fp+-2784]
	lduh [%fp+-1996], %i2
	st %i2, [%fp+-2788]
	st %l4, [%fp+-1188]
	st %l5, [%fp+-1196]
	ld [%fp+-2624], %i2
	ld [%fp+-2680], %i4
	add %i2, %i4, %i3
	st %i3, [%fp+-2624]
	ld [%fp+-2592], %i2
	xor %i3, %i2, %i3
	srl %i3, 12, %g4
	sll %i3, 20, %i3
	or %i3, %g4, %l5
	ld [%fp+-2620], %i2
	ld [%fp+-2672], %g3
	add %i2, %g3, %l4
	ld [%fp+-2588], %i2
	xor %l4, %i2, %i3
	srl %i3, 12, %l1
	sll %i3, 20, %i3
	or %i3, %l1, %l1
	ld [%fp+-2480], %i2
	xor %i0, %i2, %i0
	ld [%fp+-2472], %i2
	xor %l2, %i2, %i3
	srl %i0, 8, %l2
	sll %i0, 24, %i0
	or %i0, %l2, %i1
	st %i1, [%fp+-2620]
	srl %i3, 8, %i0
	sll %i3, 24, %i3
	or %i3, %i0, %l2
	ld [%fp+-2584], %i0
	add %i0, %o0, %i0
	add %i0, %l5, %g4
	xor %g4, %i4, %i3
	srl %i3, 8, %i4
	sll %i3, 24, %i3
	or %i3, %i4, %i4
	ld [%fp+-2580], %i0
	add %i0, %l6, %i3
	add %i3, %l1, %i2
	xor %i2, %g3, %i3
	srl %i3, 8, %i0
	sll %i3, 24, %i3
	or %i3, %i0, %i3
	ld [%fp+-2808], %i0
	add %i1, %i0, %i0
	st %i0, [%fp+-2480]
	xor %i0, %o7, %i0
	srl %i0, 7, %l7
	sll %i0, 25, %i0
	or %i0, %l7, %o0
	st %o0, [%fp+-2596]
	ld [%fp+-2796], %i0
	add %l2, %i0, %i0
	st %i0, [%fp+-2472]
	xor %i0, %o5, %i0
	srl %i0, 7, %l7
	sll %i0, 25, %i0
	or %i0, %l7, %o1
	st %o1, [%fp+-2592]
	ldd [%fp+-2232], %l6
	add %o3, %l7, %i0
	ldd [%fp+-2344], %l6
	add %l0, %l7, %g3
	add %g3, %o1, %g3
	st %g3, [%fp+-2724]
	add %i0, %o0, %i0
	st %i0, [%fp+-2728]
	xor %i0, %i4, %o1
	xor %g3, %i3, %o0
	st %o0, [%fp+-2020]
	st %o1, [%fp+-2028]
	ld [%fp+-2688], %i0
	ld [%fp+-2772], %g3
	add %g3, %i0, %l6
	st %l6, [%fp+-2716]
	ld [%fp+-2684], %i0
	ld [%fp+-2768], %g3
	add %g3, %i0, %g3
	st %g3, [%fp+-2720]
	ld [%fp+-2708], %i0
	xor %g3, %i0, %i0
	srl %i0, 7, %g3
	sll %i0, 25, %i0
	or %i0, %g3, %l0
	st %l0, [%fp+-2588]
	ld [%fp+-2736], %i0
	xor %l6, %i0, %i0
	srl %i0, 7, %g3
	sll %i0, 25, %i0
	or %i0, %g3, %g3
	st %g3, [%fp+-2584]
	ldd [%fp+-2312], %l6
	add %l3, %l7, %i0
	ldd [%fp+-2248], %l6
	add %i5, %l7, %i5
	add %i5, %g3, %g3
	st %g3, [%fp+-2732]
	add %i0, %l0, %i1
	st %i1, [%fp+-2684]
	ld [%fp+-2752], %i0
	xor %i1, %i0, %i1
	ld [%fp+-2756], %i5
	xor %g3, %i5, %i0
	add %fp, -1188, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2768]
	add %fp, -1196, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2772]
	add %fp, -2020, %i5
	or %i5, 2, %i5
	lduh [%i5], %i5
	st %i5, [%fp+-2688]
	add %fp, -2028, %i5
	or %i5, 2, %i5
	lduh [%i5], %o7
	lduh [%fp+-1188], %i5
	st %i5, [%fp+-2796]
	lduh [%fp+-1196], %i5
	st %i5, [%fp+-2808]
	lduh [%fp+-2020], %l6
	lduh [%fp+-2028], %l7
	st %i0, [%fp+-1140]
	st %i1, [%fp+-1148]
	ld [%fp+-2640], %i0
	ld [%fp+-2748], %i1
	add %i1, %i0, %i5
	st %i5, [%fp+-2600]
	ld [%fp+-2576], %i0
	ld [%fp+-2800], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2604]
	ld [%fp+-2632], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g3
	st %g3, [%fp+-2580]
	ld [%fp+-2636], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+-2576]
	ldd [%fp+-2408], %i0
	add %g4, %i1, %i0
	ldd [%fp+-2400], %o0
	add %i2, %o1, %i1
	add %i1, %i5, %i2
	st %i2, [%fp+-2748]
	add %i0, %g3, %i0
	st %i0, [%fp+-2752]
	ld [%fp+-2792], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2804], %i5
	xor %i2, %i5, %i0
	st %i0, [%fp+-1972]
	st %i1, [%fp+-1980]
	ld [%fp+-2816], %i0
	add %g2, %i0, %i2
	st %i2, [%fp+-2760]
	ld [%fp+-2652], %i0
	add %o2, %i0, %i0
	st %i0, [%fp+-2756]
	ld [%fp+-2812], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %g2
	st %g2, [%fp+-2744]
	ld [%fp+-2644], %i0
	xor %i2, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i5
	st %i5, [%fp+-2736]
	ldd [%fp+-2280], %i0
	ld [%fp+-2712], %i2
	add %i2, %i0, %i0
	ldd [%fp+-2336], %o0
	ld [%fp+-2740], %i1
	add %i1, %o0, %i1
	add %i1, %i5, %i2
	st %i2, [%fp+-2636]
	add %i0, %g2, %i0
	st %i0, [%fp+-2708]
	ld [%fp+-2820], %i1
	xor %i0, %i1, %i1
	xor %i2, %o4, %i0
	add %fp, -1140, %i2
	or %i2, 2, %i2
	lduh [%i2], %g4
	add %fp, -1148, %i2
	or %i2, 2, %i2
	lduh [%i2], %o5
	add %fp, -1972, %i2
	or %i2, 2, %i2
	lduh [%i2], %g2
	add %fp, -1980, %o4
	or %o4, 2, %o4
	lduh [%o4], %o4
	lduh [%fp+-1140], %l0
	lduh [%fp+-1148], %g3
	lduh [%fp+-1972], %i5
	lduh [%fp+-1980], %i2
	st %i0, [%fp+-1108]
	st %i1, [%fp+-1116]
	add %i3, %l4, %i3
	st %i3, [%fp+-2644]
	ld [%fp+-2624], %i0
	add %i4, %i0, %i0
	st %i0, [%fp+-2652]
	xor %i0, %l5, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2640]
	xor %i3, %l1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i3
	st %i3, [%fp+-2632]
	ldd [%fp+-2464], %o2
	ld [%fp+-2616], %i0
	add %i0, %o2, %i0
	ldd [%fp+-2456], %o0
	ld [%fp+-2628], %i1
	add %i1, %o0, %i1
	add %i1, %i3, %i3
	st %i3, [%fp+-2624]
	add %i0, %i4, %i0
	st %i0, [%fp+-2628]
	ld [%fp+-2620], %i1
	xor %i0, %i1, %i1
	xor %i3, %l2, %i0
	st %i0, [%fp+-1940]
	st %i1, [%fp+-1948]
	add %fp, -1108, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2712]
	add %fp, -1116, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2740]
	add %fp, -1940, %i1
	or %i1, 2, %i1
	lduh [%i1], %i3
	add %fp, -1948, %i1
	or %i1, 2, %i1
	lduh [%i1], %i4
	add %fp, -2000, %i1
	or %i1, 2, %i1
	lduh [%fp+-1108], %l1
	lduh [%fp+-1116], %l2
	lduh [%fp+-1940], %l4
	lduh [%fp+-1948], %l5
	ld [%fp+-2788], %l3
	sth %l3, [%i1]
	add %fp, -1992, %i1
	or %i1, 2, %i1
	ld [%fp+-2784], %l3
	sth %l3, [%i1]
	ld [%fp+-2776], %i1
	sth %i1, [%fp+-2000]
	ld [%fp+-2700], %i1
	sth %i1, [%fp+-1992]
	add %fp, -1168, %i1
	or %i1, 2, %i1
	ld [%fp+-2000], %l3
	st %l3, [%fp+-2680]
	ld [%fp+-1992], %l3
	st %l3, [%fp+-2672]
	ld [%fp+-2780], %l3
	sth %l3, [%i1]
	add %fp, -1160, %i1
	or %i1, 2, %i1
	ld [%fp+-2764], %l3
	sth %l3, [%i1]
	ld [%fp+-2664], %i1
	sth %i1, [%fp+-1168]
	ld [%fp+-2660], %i1
	sth %i1, [%fp+-1160]
	add %fp, -2032, %i1
	or %i1, 2, %i1
	ld [%fp+-1168], %l3
	st %l3, [%fp+-2764]
	ld [%fp+-1160], %i0
	st %i0, [%fp+-2776]
	sth %l7, [%i1]
	add %fp, -2024, %i1
	or %i1, 2, %i1
	sth %l6, [%i1]
	sth %o7, [%fp+-2032]
	ld [%fp+-2688], %i0
	sth %i0, [%fp+-2024]
	add %fp, -1200, %i1
	or %i1, 2, %i1
	ld [%fp+-2032], %l6
	st %l6, [%fp+-2688]
	ld [%fp+-2024], %o7
	ld [%fp+-2808], %i0
	sth %i0, [%i1]
	add %fp, -1192, %i1
	or %i1, 2, %i1
	ld [%fp+-2796], %l6
	sth %l6, [%i1]
	ld [%fp+-2772], %i1
	sth %i1, [%fp+-1200]
	ld [%fp+-2768], %i1
	sth %i1, [%fp+-1192]
	add %fp, -1984, %i1
	or %i1, 2, %l6
	ld [%fp+-1200], %i1
	ld [%fp+-1192], %l7
	sth %i2, [%l6]
	add %fp, -1976, %i2
	or %i2, 2, %i2
	sth %i5, [%i2]
	sth %o4, [%fp+-1984]
	sth %g2, [%fp+-1976]
	add %fp, -1152, %i2
	or %i2, 2, %i2
	ld [%fp+-1984], %i5
	st %i5, [%fp+-2620]
	ld [%fp+-1976], %i5
	st %i5, [%fp+-2616]
	sth %g3, [%i2]
	add %fp, -1144, %i2
	or %i2, 2, %i2
	sth %l0, [%i2]
	sth %o5, [%fp+-1152]
	sth %g4, [%fp+-1144]
	add %fp, -1952, %i2
	or %i2, 2, %i2
	ld [%fp+-1152], %i5
	st %i5, [%fp+-2664]
	ld [%fp+-1144], %i5
	st %i5, [%fp+-2660]
	sth %l5, [%i2]
	add %fp, -1944, %i2
	or %i2, 2, %i2
	sth %l4, [%i2]
	sth %i4, [%fp+-1952]
	sth %i3, [%fp+-1944]
	add %fp, -1120, %i2
	or %i2, 2, %i2
	ld [%fp+-1952], %o5
	ld [%fp+-1944], %i3
	st %i3, [%fp+-2700]
	sth %l2, [%i2]
	add %fp, -1112, %i2
	or %i2, 2, %i2
	sth %l1, [%i2]
	ldd [%fp+-2312], %i2
	ld [%fp+-2704], %i4
	add %i4, %i2, %i2
	ldd [%fp+-2248], %i4
	ld [%fp+-2612], %i3
	add %i3, %i4, %i5
	ldd [%fp+-2408], %g2
	ld [%fp+-2728], %i3
	add %i3, %g2, %i3
	st %i3, [%fp+-2704]
	ldd [%fp+-2400], %g2
	ld [%fp+-2724], %i3
	add %i3, %g2, %i3
	st %i3, [%fp+-2312]
	ldd [%fp+-2280], %g2
	ld [%fp+-2684], %i3
	add %i3, %g3, %i3
	st %i3, [%fp+-2684]
	ld [%fp+-2732], %i3
	ldd [%fp+-2336], %g2
	add %i3, %g3, %i3
	st %i3, [%fp+-2408]
	ld [%fp+-2752], %i3
	add %i3, %o3, %i3
	st %i3, [%fp+-2464]
	ld [%fp+-2748], %i3
	add %i3, %o1, %i3
	st %i3, [%fp+-2456]
	ld [%fp+-2740], %i0
	sth %i0, [%fp+-1120]
	ld [%fp+-2712], %i0
	sth %i0, [%fp+-1112]
	ld [%fp+-2756], %i0
	add %i0, %l3, %i3
	st %i3, [%fp+-2400]
	ld [%fp+-2676], %i0
	xor %i3, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l0
	st %l0, [%fp+-2728]
	ld [%fp+-2776], %o3
	ld [%fp+-2760], %i0
	add %i0, %o3, %i3
	st %i3, [%fp+-2612]
	ld [%fp+-2656], %i0
	xor %i3, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %l1
	st %l1, [%fp+-2724]
	ld [%fp+-2608], %i0
	add %i0, %i1, %i4
	ld [%fp+-2692], %i0
	xor %i4, %i0, %i0
	srl %i0, 12, %i3
	sll %i0, 20, %i0
	or %i0, %i3, %i0
	ld [%fp+-2648], %i3
	add %i3, %l7, %i3
	ld [%fp+-2696], %g2
	xor %i3, %g2, %g2
	ld [%fp+-1120], %l2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %g4
	ld [%fp+-2720], %g2
	add %g2, %l2, %g2
	st %g2, [%fp+-2656]
	ld [%fp+-2744], %g3
	xor %g2, %g3, %g2
	ld [%fp+-1112], %l4
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %l5
	st %l5, [%fp+-2676]
	ld [%fp+-2716], %g2
	add %g2, %l4, %g2
	st %g2, [%fp+-2648]
	ld [%fp+-2736], %g3
	xor %g2, %g3, %g2
	srl %g2, 12, %g3
	sll %g2, 20, %g2
	or %g2, %g3, %o0
	st %o0, [%fp+-2736]
	add %i2, %i0, %i2
	st %i2, [%fp+-2748]
	xor %i2, %i1, %i1
	srl %i1, 8, %i2
	sll %i1, 24, %i1
	or %i1, %i2, %o1
	st %o1, [%fp+-2692]
	add %i5, %g4, %i1
	st %i1, [%fp+-2696]
	xor %i1, %l7, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l7
	st %l7, [%fp+-2712]
	ldd [%fp+-2264], %g2
	ld [%fp+-2708], %i1
	add %i1, %g2, %i2
	add %i2, %l5, %i2
	add %i2, %g3, %i1
	st %i1, [%fp+-2708]
	xor %i2, %l2, %i2
	ldd [%fp+-2256], %g2
	ld [%fp+-2636], %i1
	add %i1, %g2, %i5
	add %i5, %o0, %i5
	add %i5, %g3, %i1
	st %i1, [%fp+-2716]
	xor %i5, %l4, %i5
	srl %i2, 8, %g2
	sll %i2, 24, %i2
	or %i2, %g2, %l2
	st %l2, [%fp+-2740]
	srl %i5, 8, %i2
	sll %i5, 24, %i5
	or %i5, %i2, %l4
	st %l4, [%fp+-2744]
	add %o1, %i4, %i1
	st %i1, [%fp+-2264]
	xor %i1, %i0, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i1
	st %i1, [%fp+-2248]
	add %l7, %i3, %i0
	st %i0, [%fp+-2280]
	xor %i0, %g4, %i0
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %g4
	st %g4, [%fp+-2256]
	ldd [%fp+-2448], %i4
	ld [%fp+-2512], %i0
	add %i0, %i5, %i0
	add %i0, %l0, %l5
	add %l5, %i4, %i0
	ldd [%fp+-2440], %g2
	ld [%fp+-2504], %i2
	add %i2, %g3, %i2
	add %i2, %l1, %l3
	add %l3, %g2, %i2
	add %i2, %g4, %i2
	st %i2, [%fp+-2636]
	add %i0, %i1, %i0
	st %i0, [%fp+-2608]
	xor %i0, %l2, %l1
	xor %i2, %l4, %l0
	st %l1, [%fp+-1212]
	st %l0, [%fp+-1204]
	ld [%fp+-2680], %l6
	ld [%fp+-2652], %i0
	add %i0, %l6, %i1
	st %i1, [%fp+-2720]
	ld [%fp+-2568], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %l7
	st %l7, [%fp+-2568]
	ld [%fp+-2672], %l4
	ld [%fp+-2644], %i0
	add %i0, %l4, %i1
	st %i1, [%fp+-2732]
	ld [%fp+-2552], %i0
	xor %i1, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o0
	st %o0, [%fp+-2552]
	ld [%fp+-2544], %i0
	ld [%fp+-2688], %i1
	add %i0, %i1, %i5
	ld [%fp+-2596], %i0
	xor %i5, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %g2
	ld [%fp+-2536], %i0
	add %i0, %o7, %o2
	ld [%fp+-2592], %i0
	xor %o2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o4
	ld [%fp+-2604], %i0
	add %i0, %o5, %i2
	st %i2, [%fp+-2440]
	ld [%fp+-2640], %i0
	xor %i2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %o1
	st %o1, [%fp+-2448]
	ld [%fp+-2600], %i0
	ld [%fp+-2700], %l2
	add %i0, %l2, %i2
	st %i2, [%fp+-2652]
	ld [%fp+-2632], %i0
	xor %i2, %i0, %i0
	srl %i0, 12, %i2
	sll %i0, 20, %i0
	or %i0, %i2, %i3
	st %i3, [%fp+-2752]
	ld [%fp+-2704], %i0
	add %i0, %g2, %l1
	xor %l1, %i1, %i2
	srl %i2, 8, %g4
	sll %i2, 24, %i2
	or %i2, %g4, %i4
	st %i4, [%fp+-2512]
	ld [%fp+-2312], %i0
	add %i0, %o4, %g3
	xor %g3, %o7, %g4
	srl %g4, 8, %l0
	sll %g4, 24, %g4
	or %g4, %l0, %l0
	st %l0, [%fp+-2504]
	ldd [%fp+-2304], %i0
	ld [%fp+-2628], %i2
	add %i2, %i0, %g4
	add %g4, %o1, %g4
	add %g4, %i1, %i0
	st %i0, [%fp+-2536]
	xor %g4, %o5, %g4
	ldd [%fp+-2288], %i0
	ld [%fp+-2624], %i2
	add %i2, %i0, %o5
	add %o5, %i3, %o5
	add %o5, %i1, %i0
	st %i0, [%fp+-2544]
	xor %o5, %l2, %o5
	srl %g4, 8, %o7
	sll %g4, 24, %g4
	or %g4, %o7, %i3
	st %i3, [%fp+-2700]
	srl %o5, 8, %o7
	sll %o5, 24, %o5
	or %o5, %o7, %o7
	add %i4, %i5, %i0
	st %i0, [%fp+-2624]
	xor %i0, %g2, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %i2
	st %i2, [%fp+-2312]
	add %l0, %o2, %i0
	st %i0, [%fp+-2628]
	xor %i0, %o4, %i5
	srl %i5, 7, %g2
	sll %i5, 25, %i5
	or %i5, %g2, %g4
	st %g4, [%fp+-2336]
	ldd [%fp+-2432], %i0
	ld [%fp+-2496], %i5
	add %i5, %i1, %i5
	add %i5, %l7, %l0
	add %l0, %i0, %i5
	ldd [%fp+-2424], %i0
	ld [%fp+-2488], %g2
	add %g2, %i1, %g2
	add %g2, %o0, %o4
	add %o4, %i0, %g2
	add %g2, %g4, %g2
	st %g2, [%fp+-2496]
	add %i5, %i2, %i0
	st %i0, [%fp+-2488]
	xor %i0, %i3, %i1
	xor %g2, %o7, %i0
	st %i1, [%fp+-2044]
	st %i0, [%fp+-2036]
	ld [%fp+-2528], %i0
	ld [%fp+-2664], %g4
	add %i0, %g4, %i2
	ld [%fp+-2588], %i0
	xor %i2, %i0, %i1
	srl %i1, 12, %i5
	sll %i1, 20, %i1
	or %i1, %i5, %i1
	ld [%fp+-2520], %i0
	ld [%fp+-2660], %o1
	add %i0, %o1, %o5
	ld [%fp+-2584], %i0
	xor %o5, %i0, %i5
	srl %i5, 12, %g2
	sll %i5, 20, %i5
	or %i5, %g2, %i0
	ld [%fp+-2764], %i3
	xor %l5, %i3, %i3
	xor %l3, %o3, %i4
	srl %i3, 8, %i5
	sll %i3, 24, %i3
	or %i3, %i5, %l7
	srl %i4, 8, %i3
	sll %i4, 24, %i4
	or %i4, %i3, %l5
	ld [%fp+-2684], %i3
	add %i3, %i1, %i3
	ldd [%fp+-2376], %l2
	ld [%fp+-2748], %i4
	add %i4, %l2, %i5
	add %i3, %l3, %o3
	xor %i3, %g4, %i3
	ld [%fp+-2408], %i4
	add %i4, %i0, %g4
	ldd [%fp+-2368], %l2
	ld [%fp+-2696], %i4
	add %i4, %l2, %i4
	add %g4, %l3, %o0
	xor %g4, %o1, %g4
	srl %i3, 8, %l3
	sll %i3, 24, %i3
	or %i3, %l3, %o1
	srl %g4, 8, %i3
	sll %g4, 24, %g4
	or %g4, %i3, %l3
	add %o1, %i2, %i2
	st %i2, [%fp+-2288]
	xor %i2, %i1, %i1
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i2
	st %i2, [%fp+-2408]
	add %l3, %o5, %i1
	st %i1, [%fp+-2304]
	xor %i1, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-2424]
	add %i4, %i0, %i3
	st %i3, [%fp+-2528]
	add %i5, %i2, %i1
	st %i1, [%fp+-2520]
	add %fp, -1212, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2592]
	add %fp, -1204, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2596]
	add %fp, -2044, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2584]
	add %fp, -2036, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2588]
	xor %i1, %l7, %i1
	xor %i3, %l5, %i0
	lduh [%fp+-1212], %i2
	st %i2, [%fp+-2600]
	lduh [%fp+-1204], %i2
	st %i2, [%fp+-2604]
	lduh [%fp+-2044], %i2
	st %i2, [%fp+-2684]
	lduh [%fp+-2036], %i2
	st %i2, [%fp+-2688]
	st %i1, [%fp+-1244]
	st %i0, [%fp+-1236]
	ld [%fp+-2480], %i0
	ld [%fp+-2620], %o2
	add %i0, %o2, %i4
	ld [%fp+-2580], %i0
	xor %i4, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %i5
	ld [%fp+-2472], %i0
	ld [%fp+-2616], %l2
	add %i0, %l2, %o5
	ld [%fp+-2576], %i0
	xor %o5, %i0, %i0
	srl %i0, 12, %i1
	sll %i0, 20, %i0
	or %i0, %i1, %g2
	xor %l0, %l6, %i1
	xor %o4, %l4, %i2
	srl %i1, 8, %i3
	sll %i1, 24, %i1
	or %i1, %i3, %l0
	srl %i2, 8, %i1
	sll %i2, 24, %i2
	or %i2, %i1, %g4
	ld [%fp+-2464], %i0
	add %i0, %i5, %i2
	ldd [%fp+-2360], %i0
	add %l1, %i0, %l1
	add %i2, %i1, %l4
	xor %i2, %o2, %i2
	ld [%fp+-2456], %i0
	add %i0, %g2, %o2
	ldd [%fp+-2352], %i0
	add %g3, %i0, %g3
	add %o2, %i1, %i3
	xor %o2, %l2, %o2
	srl %i2, 8, %o4
	sll %i2, 24, %i2
	or %i2, %o4, %i2
	srl %o2, 8, %o4
	sll %o2, 24, %o2
	or %o2, %o4, %o4
	add %i2, %i4, %i0
	st %i0, [%fp+-2368]
	xor %i0, %i5, %i4
	srl %i4, 7, %i5
	sll %i4, 25, %i4
	or %i4, %i5, %i1
	st %i1, [%fp+-2616]
	add %o4, %o5, %i0
	st %i0, [%fp+-2376]
	xor %i0, %g2, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i0
	st %i0, [%fp+-2620]
	add %g3, %i0, %g2
	st %g2, [%fp+-2640]
	add %l1, %i1, %i0
	st %i0, [%fp+-2632]
	xor %i0, %l0, %i5
	xor %g2, %g4, %i4
	st %i5, [%fp+-2076]
	st %i4, [%fp+-2068]
	ld [%fp+-2648], %i0
	ld [%fp+-2744], %i1
	add %i1, %i0, %i5
	st %i5, [%fp+-2464]
	ld [%fp+-2656], %i0
	ld [%fp+-2740], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2456]
	ld [%fp+-2676], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i1
	st %i1, [%fp+-2352]
	ld [%fp+-2736], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %i4
	sll %i0, 25, %i0
	or %i0, %i4, %i0
	st %i0, [%fp+-2360]
	add %o0, %i0, %i4
	st %i4, [%fp+-2644]
	add %o3, %i1, %o0
	ld [%fp+-2692], %i0
	xor %o0, %i0, %i1
	ld [%fp+-2712], %i5
	xor %i4, %i5, %i0
	add %fp, -1244, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	st %i4, [%fp+-2576]
	add %fp, -1236, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	st %i4, [%fp+-2580]
	add %fp, -2076, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	st %i4, [%fp+-2680]
	add %fp, -2068, %i4
	or %i4, 2, %i4
	lduh [%i4], %i4
	st %i4, [%fp+-2692]
	lduh [%fp+-1244], %i4
	st %i4, [%fp+-2672]
	lduh [%fp+-1236], %i4
	st %i4, [%fp+-2676]
	lduh [%fp+-2076], %o5
	lduh [%fp+-2068], %o2
	st %i1, [%fp+-1228]
	st %i0, [%fp+-1220]
	ld [%fp+-2652], %i0
	add %o7, %i0, %i5
	st %i5, [%fp+-2652]
	ld [%fp+-2440], %i0
	ld [%fp+-2700], %i1
	add %i1, %i0, %i0
	st %i0, [%fp+-2648]
	ld [%fp+-2448], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2440]
	ld [%fp+-2752], %i0
	xor %i5, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-2448]
	add %i3, %i0, %i3
	st %i3, [%fp+-2660]
	add %l4, %i4, %i0
	st %i0, [%fp+-2656]
	ld [%fp+-2512], %i1
	xor %i0, %i1, %i1
	ld [%fp+-2504], %i4
	xor %i3, %i4, %i0
	st %i1, [%fp+-2060]
	st %i0, [%fp+-2052]
	ld [%fp+-2612], %i0
	add %l5, %i0, %i3
	st %i3, [%fp+-2432]
	ld [%fp+-2400], %i0
	add %l7, %i0, %i0
	st %i0, [%fp+-2400]
	ld [%fp+-2728], %i1
	xor %i0, %i1, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i4
	st %i4, [%fp+-2504]
	ld [%fp+-2724], %i0
	xor %i3, %i0, %i0
	srl %i0, 7, %i1
	sll %i0, 25, %i0
	or %i0, %i1, %i0
	st %i0, [%fp+-2512]
	ld [%fp+-2716], %i1
	add %i1, %i0, %i1
	st %i1, [%fp+-2664]
	ld [%fp+-2708], %i0
	add %i0, %i4, %i0
	st %i0, [%fp+-2612]
	xor %i0, %o1, %l5
	xor %i1, %l3, %l4
	add %fp, -1228, %i1
	or %i1, 2, %i1
	lduh [%i1], %l6
	add %fp, -1220, %i1
	or %i1, 2, %i1
	lduh [%i1], %l3
	add %fp, -2060, %i1
	or %i1, 2, %i1
	lduh [%i1], %l7
	add %fp, -2052, %i1
	or %i1, 2, %i1
	lduh [%i1], %o1
	lduh [%fp+-1228], %l1
	lduh [%fp+-1220], %l2
	lduh [%fp+-2060], %o3
	lduh [%fp+-2052], %i5
	st %l5, [%fp+-1180]
	st %l4, [%fp+-1172]
	ld [%fp+-2732], %i0
	add %g4, %i0, %i3
	st %i3, [%fp+-2480]
	ld [%fp+-2720], %i0
	add %l0, %i0, %i0
	st %i0, [%fp+-2472]
	ld [%fp+-2568], %i1
	xor %i0, %i1, %i1
	srl %i1, 7, %g2
	sll %i1, 25, %i1
	or %i1, %g2, %o7
	ld [%fp+-2552], %i0
	xor %i3, %i0, %g2
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g3
	ld [%fp+-2544], %i0
	add %i0, %g3, %g4
	ld [%fp+-2536], %i0
	add %i0, %o7, %l4
	xor %l4, %i2, %i1
	xor %g4, %o4, %i0
	st %i1, [%fp+-2012]
	st %i0, [%fp+-2004]
	add %fp, -1180, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2544]
	add %fp, -1172, %i0
	or %i0, 2, %i0
	lduh [%i0], %i0
	st %i0, [%fp+-2552]
	add %fp, -2012, %i0
	or %i0, 2, %i0
	lduh [%i0], %i4
	add %fp, -2004, %i1
	or %i1, 2, %i1
	lduh [%i1], %i3
	add %fp, -2040, %i2
	or %i2, 2, %i2
	lduh [%fp+-1180], %g2
	lduh [%fp+-1172], %l5
	lduh [%fp+-2012], %i1
	lduh [%fp+-2004], %i0
	ld [%fp+-2688], %l0
	sth %l0, [%i2]
	add %fp, -2048, %i2
	or %i2, 2, %i2
	ld [%fp+-2684], %l0
	sth %l0, [%i2]
	ld [%fp+-2588], %i2
	sth %i2, [%fp+-2040]
	ld [%fp+-2584], %i2
	sth %i2, [%fp+-2048]
	add %fp, -1208, %i2
	or %i2, 2, %i2
	ld [%fp+-2040], %l0
	st %l0, [%fp+-2588]
	ld [%fp+-2048], %l0
	st %l0, [%fp+-2584]
	ld [%fp+-2604], %l0
	sth %l0, [%i2]
	add %fp, -1216, %i2
	or %i2, 2, %i2
	ld [%fp+-2600], %l0
	sth %l0, [%i2]
	ld [%fp+-2596], %i2
	sth %i2, [%fp+-1208]
	ld [%fp+-2592], %i2
	sth %i2, [%fp+-1216]
	add %fp, -2072, %i2
	or %i2, 2, %i2
	ld [%fp+-1208], %l0
	st %l0, [%fp+-2568]
	ld [%fp+-1216], %l0
	st %l0, [%fp+-2536]
	sth %o2, [%i2]
	add %fp, -2080, %i2
	or %i2, 2, %i2
	sth %o5, [%i2]
	ld [%fp+-2692], %i2
	sth %i2, [%fp+-2072]
	ld [%fp+-2680], %i2
	sth %i2, [%fp+-2080]
	add %fp, -1240, %i2
	or %i2, 2, %o2
	ld [%fp+-2072], %i2
	ld [%fp+-2080], %o4
	ld [%fp+-2676], %l0
	sth %l0, [%o2]
	add %fp, -1248, %o2
	or %o2, 2, %o2
	ld [%fp+-2672], %l0
	sth %l0, [%o2]
	ld [%fp+-2580], %l0
	sth %l0, [%fp+-1240]
	ld [%fp+-2576], %l0
	sth %l0, [%fp+-1248]
	add %fp, -2056, %o2
	or %o2, 2, %o2
	ld [%fp+-1240], %l0
	st %l0, [%fp+-2604]
	ld [%fp+-1248], %l0
	st %l0, [%fp+-2600]
	sth %i5, [%o2]
	add %fp, -2064, %l0
	or %l0, 2, %l0
	sth %o3, [%l0]
	sth %o1, [%fp+-2056]
	sth %l7, [%fp+-2064]
	add %fp, -1224, %l0
	or %l0, 2, %l0
	ld [%fp+-2056], %i5
	st %i5, [%fp+-2596]
	ld [%fp+-2064], %i5
	st %i5, [%fp+-2592]
	sth %l2, [%l0]
	add %fp, -1232, %l0
	or %l0, 2, %l0
	sth %l1, [%l0]
	sth %l3, [%fp+-1224]
	sth %l6, [%fp+-1232]
	add %fp, -2008, %i5
	or %i5, 2, %i5
	ld [%fp+-1224], %l0
	st %l0, [%fp+-2580]
	ld [%fp+-1232], %l0
	st %l0, [%fp+-2576]
	sth %i0, [%i5]
	add %fp, -2016, %i0
	or %i0, 2, %i0
	sth %i1, [%i0]
	sth %i3, [%fp+-2008]
	sth %i4, [%fp+-2016]
	add %fp, -1176, %i0
	or %i0, 2, %i0
	ld [%fp+-2008], %l2
	ld [%fp+-2016], %i3
	sth %l5, [%i0]
	add %fp, -1184, %i0
	or %i0, 2, %i0
	sth %g2, [%i0]
	ldd [%fp+-2296], %i0
	ld [%fp+-2636], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2296]
	ldd [%fp+-2240], %i0
	ld [%fp+-2608], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2240]
	ldd [%fp+-2384], %i0
	ld [%fp+-2496], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2608]
	ldd [%fp+-2392], %i0
	ld [%fp+-2488], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2392]
	ldd [%fp+-2216], %i0
	ld [%fp+-2644], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2384]
	ldd [%fp+-2224], %i0
	add %o0, %i0, %i0
	st %i0, [%fp+-2216]
	ldd [%fp+-2344], %i0
	ld [%fp+-2660], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2344]
	ldd [%fp+-2232], %i0
	ld [%fp+-2656], %i4
	add %i4, %i0, %i0
	st %i0, [%fp+-2224]
	ldd [%fp+-2272], %i0
	ld [%fp+-2528], %i4
	add %i4, %i0, %g2
	ld [%fp+-2664], %i4
	add %i4, %i1, %i0
	st %i0, [%fp+-2272]
	ldd [%fp+-2328], %i0
	ld [%fp+-2520], %i4
	add %i4, %i0, %l3
	ld [%fp+-2612], %i4
	add %i4, %i1, %i0
	st %i0, [%fp+-2232]
	ldd [%fp+-2416], %l0
	ld [%fp+-2640], %i0
	add %i0, %l0, %i0
	add %g4, %l1, %i5
	ldd [%fp+-2320], %l6
	ld [%fp+-2632], %i1
	add %i1, %l6, %l1
	add %l4, %l7, %o2
	ld [%fp+-2652], %i1
	add %i1, %i2, %g4
	ld [%fp+-2620], %i1
	xor %g4, %i1, %i1
	srl %i1, 12, %l0
	sll %i1, 20, %i1
	or %i1, %l0, %l7
	ld [%fp+-2648], %i1
	add %i1, %o4, %o5
	ld [%fp+-2616], %i1
	xor %o5, %i1, %i1
	srl %i1, 12, %l0
	sll %i1, 20, %i1
	or %i1, %l0, %i4
	ld [%fp+-2628], %i1
	add %i1, %l2, %o0
	xor %o0, %g3, %i1
	srl %i1, 12, %g3
	sll %i1, 20, %i1
	or %i1, %g3, %l4
	ld [%fp+-2624], %i1
	add %i1, %i3, %o1
	xor %o1, %o7, %i1
	srl %i1, 12, %g3
	sll %i1, 20, %i1
	or %i1, %g3, %g3
	add %i0, %l7, %i1
	xor %i1, %i2, %i0
	srl %i0, 8, %i2
	sll %i0, 24, %i0
	or %i0, %i2, %l0
	add %l1, %i4, %i0
	xor %i0, %o4, %i2
	srl %i2, 8, %l1
	sll %i2, 24, %i2
	or %i2, %l1, %l6
	add %i5, %l4, %l1
	xor %l1, %l2, %i2
	srl %i2, 8, %i5
	sll %i2, 24, %i2
	or %i2, %i5, %l2
	add %o2, %g3, %i5
	xor %i5, %i3, %i2
	srl %i2, 8, %i3
	sll %i2, 24, %i2
	or %i2, %i3, %i3
	add %i3, %o1, %l5
	add %l2, %o0, %o0
	xor %l5, %i0, %o3
	xor %o0, %i1, %o2
	std %o2, [%fp+-2520]
	xor %o0, %l4, %i0
	xor %l5, %g3, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	add %l6, %o5, %i2
	xor %l6, %i1, %l5
	xor %l0, %i0, %l4
	std %l4, [%fp+-2496]
	add %l0, %g4, %i0
	xor %i2, %i5, %l5
	xor %i0, %l1, %l4
	std %l4, [%fp+-2528]
	xor %i0, %l7, %i0
	xor %i2, %i4, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	xor %i1, %i3, %i3
	xor %i0, %l2, %i2
	std %i2, [%fp+-2488]
	ld [%fp+-2552], %i0
	sth %i0, [%fp+-1176]
	ld [%fp+-2544], %i0
	sth %i0, [%fp+-1184]
	ld [%fp+-2464], %i0
	ld [%fp+-2604], %l5
	add %i0, %l5, %i0
	ld [%fp+-2424], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	ld [%fp+-2456], %i2
	ld [%fp+-2600], %l6
	add %i2, %l6, %i2
	ld [%fp+-2408], %i3
	xor %i2, %i3, %i3
	ld [%fp+-1176], %i5
	srl %i3, 12, %g3
	sll %i3, 20, %i3
	or %i3, %g3, %i3
	ld [%fp+-2280], %i4
	add %i4, %i5, %g3
	ld [%fp+-2512], %i4
	xor %g3, %i4, %g4
	ld [%fp+-1184], %l0
	srl %g4, 12, %l1
	sll %g4, 20, %g4
	or %g4, %l1, %g4
	ld [%fp+-2264], %i4
	add %i4, %l0, %l1
	ld [%fp+-2504], %i4
	xor %l1, %i4, %l2
	srl %l2, 12, %l4
	sll %l2, 20, %l2
	or %l2, %l4, %l2
	add %g2, %i1, %i4
	xor %i4, %l5, %l4
	srl %l4, 8, %l5
	sll %l4, 24, %l4
	or %l4, %l5, %l4
	add %l3, %i3, %g2
	xor %g2, %l6, %l5
	srl %l5, 8, %l6
	sll %l5, 24, %l5
	or %l5, %l6, %l5
	ld [%fp+-2272], %l3
	add %l3, %g4, %l6
	xor %l6, %i5, %i5
	srl %i5, 8, %l7
	sll %i5, 24, %i5
	or %i5, %l7, %i5
	ld [%fp+-2232], %l3
	add %l3, %l2, %l3
	xor %l3, %l0, %l0
	srl %l0, 8, %l7
	sll %l0, 24, %l0
	or %l0, %l7, %l0
	add %l0, %l1, %l1
	add %i5, %g3, %g3
	xor %l1, %g2, %o1
	xor %g3, %i4, %o0
	std %o0, [%fp+-2544]
	xor %g3, %g4, %i4
	xor %l1, %l2, %g2
	srl %i4, 7, %g3
	sll %i4, 25, %i4
	or %i4, %g3, %i4
	srl %g2, 7, %g3
	sll %g2, 25, %g2
	or %g2, %g3, %g2
	add %l5, %i2, %i2
	xor %l5, %g2, %g3
	xor %l4, %i4, %g2
	std %g2, [%fp+-2512]
	add %l4, %i0, %i0
	xor %i2, %l3, %g3
	xor %i0, %l6, %g2
	std %g2, [%fp+-2552]
	xor %i0, %i1, %i0
	xor %i2, %i3, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	xor %i1, %l0, %i3
	xor %i0, %i5, %i2
	std %i2, [%fp+-2504]
	ld [%fp+-2376], %i0
	ld [%fp+-2588], %l0
	add %i0, %l0, %i0
	ld [%fp+-2336], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	ld [%fp+-2368], %i2
	ld [%fp+-2584], %l2
	add %i2, %l2, %i2
	ld [%fp+-2312], %i3
	xor %i2, %i3, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %i3
	ld [%fp+-2480], %i4
	ld [%fp+-2596], %l5
	add %i4, %l5, %i4
	ld [%fp+-2448], %i5
	xor %i4, %i5, %i5
	srl %i5, 12, %g2
	sll %i5, 20, %i5
	or %i5, %g2, %i5
	ld [%fp+-2472], %g2
	ld [%fp+-2592], %l4
	add %g2, %l4, %g2
	ld [%fp+-2440], %g3
	xor %g2, %g3, %g3
	srl %g3, 12, %g4
	sll %g3, 20, %g3
	or %g3, %g4, %g3
	ld [%fp+-2608], %g4
	add %g4, %i1, %g4
	xor %g4, %l0, %l0
	srl %l0, 8, %l1
	sll %l0, 24, %l0
	or %l0, %l1, %l0
	ld [%fp+-2392], %l1
	add %l1, %i3, %l1
	xor %l1, %l2, %l2
	srl %l2, 8, %l3
	sll %l2, 24, %l2
	or %l2, %l3, %l6
	ld [%fp+-2344], %l2
	add %l2, %i5, %l7
	xor %l7, %l5, %l2
	srl %l2, 8, %l3
	sll %l2, 24, %l2
	or %l2, %l3, %o0
	ld [%fp+-2224], %l2
	add %l2, %g3, %l2
	xor %l2, %l4, %l3
	srl %l3, 8, %o1
	sll %l3, 24, %l3
	or %l3, %o1, %o1
	add %l6, %i2, %i2
	add %l0, %i0, %i0
	xor %i2, %l2, %l3
	xor %i0, %l7, %l2
	xor %i0, %i1, %i0
	xor %i2, %i3, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	add %o1, %g2, %i2
	xor %o1, %i1, %o3
	xor %o0, %i0, %o2
	std %o2, [%fp+-2472]
	add %o0, %i4, %i0
	xor %i2, %l1, %o1
	xor %i0, %g4, %o0
	xor %i0, %i5, %i0
	xor %i2, %g3, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	xor %i1, %l6, %i3
	xor %i0, %l0, %i2
	std %i2, [%fp+-2480]
	ld [%fp+-2304], %i0
	ld [%fp+-2568], %l5
	add %i0, %l5, %i0
	ld [%fp+-2256], %i1
	xor %i0, %i1, %i1
	srl %i1, 12, %i2
	sll %i1, 20, %i1
	or %i1, %i2, %i1
	ld [%fp+-2288], %i2
	ld [%fp+-2536], %l4
	add %i2, %l4, %i2
	ld [%fp+-2248], %i3
	xor %i2, %i3, %i3
	srl %i3, 12, %i4
	sll %i3, 20, %i3
	or %i3, %i4, %i3
	ld [%fp+-2432], %i4
	ld [%fp+-2580], %o4
	add %i4, %o4, %g2
	ld [%fp+-2360], %i4
	xor %g2, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %g3
	ld [%fp+-2400], %i4
	ld [%fp+-2576], %o5
	add %i4, %o5, %g4
	ld [%fp+-2352], %i4
	xor %g4, %i4, %i4
	srl %i4, 12, %i5
	sll %i4, 20, %i4
	or %i4, %i5, %l0
	ld [%fp+-2296], %i4
	add %i4, %i1, %l1
	xor %l1, %l5, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %o2
	ld [%fp+-2240], %i4
	add %i4, %i3, %l6
	xor %l6, %l4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %o3
	ld [%fp+-2384], %i4
	add %i4, %g3, %l7
	xor %l7, %o4, %i4
	srl %i4, 8, %i5
	sll %i4, 24, %i4
	or %i4, %i5, %o4
	ld [%fp+-2216], %i4
	add %i4, %l0, %i4
	xor %i4, %o5, %i5
	srl %i5, 8, %o5
	sll %i5, 24, %i5
	or %i5, %o5, %o5
	add %o3, %i2, %i2
	add %o2, %i0, %i0
	xor %i2, %i4, %i5
	xor %i0, %l7, %i4
	xor %i0, %i1, %i0
	xor %i2, %i3, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	add %o5, %g4, %i2
	xor %o5, %i1, %l5
	xor %o4, %i0, %l4
	std %l4, [%fp+-2536]
	add %o4, %g2, %i0
	xor %i2, %l6, %l7
	xor %i0, %l1, %l6
	xor %i0, %g3, %i0
	xor %i2, %l0, %i1
	srl %i0, 7, %i2
	sll %i0, 25, %i0
	or %i0, %i2, %i0
	srl %i1, 7, %i2
	sll %i1, 25, %i1
	or %i1, %i2, %i1
	xor %i1, %o3, %l5
	ld [%fp+-2860], %g2
	ld [%fp+-2556], %i1
	cmp %i1, %g2
	xor %i0, %o2, %l4
	mov	%i1, %i0
	bne	.LBB2_21
	ld [%fp+-2864], %o7
	ba .LBB2_26
	nop
.LBB2_19:
	mov	%o0, %l6
	mov	%o1, %l7
	ldd [%fp+-2520], %i0
	std %i0, [%fp+-2544]
	mov	%l2, %i4
	mov	%l3, %i5
	ldd [%fp+-2528], %i0
	std %i0, [%fp+-2552]
	std %o4, [%fp+-2512]
	ldd [%fp+-2472], %i0
	std %i0, [%fp+-2536]
	std %o2, [%fp+-2504]
	ldd [%fp+-2480], %l4
.LBB2_26:
	mov	%l3, %i0
	std %i0, [%fp+-2216]
	ldd [%fp+-2528], %i0
	std %i0, [%fp+-2528]
	mov	%i0, %l3
	std %l2, [%fp+-2176]
	add %fp, -2176, %i2
	or %i2, 4, %i2
	ld [%i2], %i2
	ld [%fp+-2920], %o2
	stb %i2, [%o2+15]
	ld [%fp+-2176], %i3
	mov	%o1, %l0
	ldd [%fp+-2520], %i0
	std %i0, [%fp+-2520]
	mov	%i0, %o1
	stb %i3, [%o2+11]
	std %o0, [%fp+-2208]
	add %fp, -2208, %g2
	or %g2, 4, %g2
	ld [%g2], %g2
	stb %g2, [%o2+7]
	ld [%fp+-2208], %g3
	srl %i2, 8, %g4
	stb %g4, [%o2+14]
	srl %i2, 16, %g4
	stb %g4, [%o2+13]
	srl %i2, 24, %i2
	stb %i2, [%o2+12]
	srl %i3, 8, %i2
	stb %i2, [%o2+10]
	srl %i3, 16, %i2
	stb %i2, [%o2+9]
	srl %i3, 24, %i2
	stb %i2, [%o2+8]
	srl %g2, 8, %i2
	stb %i2, [%o2+6]
	srl %g2, 16, %i2
	stb %i2, [%o2+5]
	srl %g2, 24, %i2
	stb %i2, [%o2+4]
	srl %g3, 8, %i2
	stb %i2, [%o2+2]
	srl %g3, 16, %i2
	stb %i2, [%o2+1]
	stb %g3, [%o2+3]
	srl %g3, 24, %i2
	stb %i2, [%o2]
	ldd [%fp+-2488], %i2
	mov	%i3, %o4
	ldd [%fp+-2480], %g2
	mov	%g2, %i3
	std %i2, [%fp+-2200]
	add %fp, -2200, %i2
	or %i2, 4, %i2
	ld [%i2], %g4
	stb %g4, [%o2+31]
	ld [%fp+-2200], %l2
	ldd [%fp+-2496], %o0
	mov	%o1, %i2
	ldd [%fp+-2472], %i0
	std %i0, [%fp+-2472]
	mov	%i0, %o1
	stb %l2, [%o2+27]
	std %o0, [%fp+-2152]
	add %fp, -2152, %l3
	or %l3, 4, %l3
	ld [%l3], %l3
	ldd [%fp+-2216], %i0
	ldd [%fp+-2528], %o0
	mov	%o1, %i1
	stb %l3, [%o2+23]
	ld [%fp+-2152], %o0
	srl %g4, 8, %o1
	stb %o1, [%o2+30]
	srl %g4, 16, %o1
	stb %o1, [%o2+29]
	srl %g4, 24, %g4
	stb %g4, [%o2+28]
	srl %l2, 8, %g4
	stb %g4, [%o2+26]
	srl %l2, 16, %g4
	stb %g4, [%o2+25]
	srl %l2, 24, %g4
	stb %g4, [%o2+24]
	srl %l3, 8, %g4
	stb %g4, [%o2+22]
	srl %l3, 16, %g4
	stb %g4, [%o2+21]
	srl %l3, 24, %g4
	stb %g4, [%o2+20]
	srl %o0, 8, %g4
	stb %g4, [%o2+18]
	srl %o0, 16, %g4
	stb %g4, [%o2+17]
	stb %o0, [%o2+19]
	srl %o0, 24, %g4
	stb %g4, [%o2+16]
	std %i0, [%fp+-2192]
	add %fp, -2192, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%o2+47]
	ld [%fp+-2192], %i1
	ldd [%fp+-2520], %l2
	mov	%l3, %l1
	stb %i1, [%o2+43]
	std %l0, [%fp+-2160]
	add %fp, -2160, %g4
	or %g4, 4, %g4
	ld [%g4], %g4
	mov	%g3, %o5
	stb %g4, [%o2+39]
	ld [%fp+-2160], %l0
	srl %i0, 8, %l1
	stb %l1, [%o2+46]
	srl %i0, 16, %l1
	stb %l1, [%o2+45]
	srl %i0, 24, %i0
	stb %i0, [%o2+44]
	srl %i1, 8, %i0
	stb %i0, [%o2+42]
	srl %i1, 16, %i0
	stb %i0, [%o2+41]
	srl %i1, 24, %i0
	stb %i0, [%o2+40]
	srl %g4, 8, %i0
	stb %i0, [%o2+38]
	srl %g4, 16, %i0
	stb %i0, [%o2+37]
	srl %g4, 24, %i0
	stb %i0, [%o2+36]
	srl %l0, 8, %i0
	stb %i0, [%o2+34]
	srl %l0, 16, %i0
	stb %i0, [%o2+33]
	stb %l0, [%o2+35]
	srl %l0, 24, %i0
	stb %i0, [%o2+32]
	std %o4, [%fp+-2184]
	add %fp, -2184, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%o2+63]
	ld [%fp+-2184], %g2
	ldd [%fp+-2472], %l0
	mov	%l1, %i3
	stb %g2, [%o2+59]
	std %i2, [%fp+-2168]
	add %fp, -2168, %i1
	or %i1, 4, %i1
	ld [%i1], %i2
	stb %i2, [%o2+55]
	ld [%fp+-2168], %i3
	srl %i0, 8, %i1
	stb %i1, [%o2+62]
	srl %i0, 16, %i1
	stb %i1, [%o2+61]
	srl %i0, 24, %i0
	stb %i0, [%o2+60]
	srl %g2, 8, %i0
	stb %i0, [%o2+58]
	srl %g2, 16, %i0
	stb %i0, [%o2+57]
	mov	%i5, %i0
	ldd [%fp+-2552], %o0
	mov	%o0, %i5
	stb %i3, [%o2+51]
	srl %g2, 24, %g2
	stb %g2, [%o2+56]
	srl %i2, 8, %g2
	stb %g2, [%o2+54]
	srl %i2, 16, %g2
	stb %g2, [%o2+53]
	srl %i2, 24, %i2
	stb %i2, [%o2+52]
	srl %i3, 8, %i2
	stb %i2, [%o2+50]
	srl %i3, 16, %i2
	stb %i2, [%o2+49]
	srl %i3, 24, %i2
	stb %i2, [%o2+48]
	std %i4, [%fp+-2120]
	add %fp, -2120, %i2
	or %i2, 4, %i2
	ld [%i2], %i2
	stb %i2, [%o2+79]
	ld [%fp+-2120], %i3
	mov	%l7, %i4
	ldd [%fp+-2544], %o4
	mov	%o4, %l7
	stb %i3, [%o2+75]
	std %l6, [%fp+-2136]
	add %fp, -2136, %g2
	or %g2, 4, %g2
	ld [%g2], %g2
	stb %g2, [%o2+71]
	ld [%fp+-2136], %g3
	srl %i2, 8, %g4
	stb %g4, [%o2+78]
	srl %i2, 16, %g4
	stb %g4, [%o2+77]
	srl %i2, 24, %i2
	stb %i2, [%o2+76]
	srl %i3, 8, %i2
	stb %i2, [%o2+74]
	srl %i3, 16, %i2
	stb %i2, [%o2+73]
	srl %i3, 24, %i2
	stb %i2, [%o2+72]
	srl %g2, 8, %i2
	stb %i2, [%o2+70]
	srl %g2, 16, %i2
	stb %i2, [%o2+69]
	ldd [%fp+-2504], %l0
	mov	%l1, %i2
	mov	%l4, %l1
	stb %g3, [%o2+67]
	srl %g2, 24, %g2
	stb %g2, [%o2+68]
	srl %g3, 8, %g2
	stb %g2, [%o2+66]
	srl %g3, 16, %g2
	stb %g2, [%o2+65]
	srl %g3, 24, %g2
	stb %g2, [%o2+64]
	std %l0, [%fp+-2088]
	add %fp, -2088, %g2
	or %g2, 4, %g2
	ld [%g2], %g4
	stb %g4, [%o2+95]
	ld [%fp+-2088], %l0
	ldd [%fp+-2512], %l2
	mov	%l3, %g2
	ldd [%fp+-2536], %l6
	mov	%l6, %l3
	stb %l0, [%o2+91]
	std %l2, [%fp+-2104]
	add %fp, -2104, %l1
	or %l1, 4, %l1
	ld [%l1], %l1
	mov	%o1, %i1
	mov	%l4, %o0
	mov	%l5, %o1
	mov	%o2, %l5
	stb %l1, [%o2+87]
	ld [%fp+-2104], %l2
	srl %g4, 8, %l3
	stb %l3, [%o2+94]
	srl %g4, 16, %l3
	stb %l3, [%o2+93]
	srl %g4, 24, %g4
	stb %g4, [%o2+92]
	srl %l0, 8, %g4
	stb %g4, [%o2+90]
	srl %l0, 16, %g4
	stb %g4, [%o2+89]
	srl %l0, 24, %g4
	stb %g4, [%o2+88]
	srl %l1, 8, %g4
	stb %g4, [%o2+86]
	srl %l1, 16, %g4
	stb %g4, [%o2+85]
	srl %l1, 24, %g4
	stb %g4, [%o2+84]
	srl %l2, 8, %g4
	stb %g4, [%o2+82]
	srl %l2, 16, %g4
	stb %g4, [%o2+81]
	stb %l2, [%o2+83]
	srl %l2, 24, %g4
	stb %g4, [%o2+80]
	std %i0, [%fp+-2128]
	add %fp, -2128, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%o2+111]
	ld [%fp+-2128], %i1
	mov	%o5, %i5
	stb %i1, [%o2+107]
	std %i4, [%fp+-2144]
	add %fp, -2144, %i4
	or %i4, 4, %i4
	ld [%i4], %i4
	mov	%o1, %i3
	stb %i4, [%o2+103]
	ld [%fp+-2144], %i5
	srl %i0, 8, %g4
	stb %g4, [%o2+110]
	srl %i0, 16, %g4
	stb %g4, [%o2+109]
	srl %i0, 24, %i0
	stb %i0, [%o2+108]
	srl %i1, 8, %i0
	stb %i0, [%o2+106]
	srl %i1, 16, %i0
	stb %i0, [%o2+105]
	srl %i1, 24, %i0
	stb %i0, [%o2+104]
	srl %i4, 8, %i0
	stb %i0, [%o2+102]
	srl %i4, 16, %i0
	stb %i0, [%o2+101]
	srl %i4, 24, %i0
	stb %i0, [%o2+100]
	srl %i5, 8, %i0
	stb %i0, [%o2+98]
	srl %i5, 16, %i0
	stb %i0, [%o2+97]
	stb %i5, [%o2+99]
	srl %i5, 24, %i0
	stb %i0, [%o2+96]
	std %i2, [%fp+-2096]
	add %fp, -2096, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	stb %i0, [%o2+127]
	ld [%fp+-2096], %i1
	mov	%l7, %g3
	stb %i1, [%o2+123]
	std %g2, [%fp+-2112]
	add %fp, -2112, %i2
	or %i2, 4, %i2
	ld [%i2], %i2
	stb %i2, [%o2+119]
	ld [%fp+-2112], %i3
	srl %i0, 8, %i4
	stb %i4, [%o2+126]
	srl %i0, 16, %i4
	stb %i4, [%o2+125]
	srl %i0, 24, %i0
	stb %i0, [%o2+124]
	srl %i1, 8, %i0
	stb %i0, [%o2+122]
	srl %i1, 16, %i0
	stb %i0, [%o2+121]
	stb %i3, [%o2+115]
	srl %i1, 24, %i0
	stb %i0, [%o2+120]
	srl %i2, 8, %i0
	stb %i0, [%o2+118]
	srl %i2, 16, %i0
	stb %i0, [%o2+117]
	srl %i2, 24, %i0
	stb %i0, [%o2+116]
	srl %i3, 8, %i0
	stb %i0, [%o2+114]
	srl %i3, 16, %i0
	stb %i0, [%o2+113]
	srl %i3, 24, %i0
	ld [%fp+-2936], %i1
	addcc %i1, 4, %l1
	ld [%fp+-2932], %i2
	addxcc %i2, 0, %l2
	ld [%fp+-2940], %g3
	cmp %g3, 0
	bne	.LBB2_28
	stb %i0, [%o2+112]
	mov	%i1, %l1
.LBB2_28:
	cmp %g3, 0
	ld [%fp+-2864], %l0
	ld [%fp+-2924], %i1
	ld [%fp+-2928], %i0
	ldd [%fp+-2952], %l6
	ldd [%fp+-2968], %o2
	bne	.LBB2_30
	ld [%fp+-2980], %l4
	mov	%i2, %l2
.LBB2_30:
	add %i0, 16, %i0
	add %i1, -4, %i1
	cmp %i1, 3
	add %l5, 128, %l5
	mov	%l2, %i4
	bgu	.LBB2_10
	mov	%l1, %i5
	ba .LBB2_2
	nop
.LBB2_1:
	mov	%i4, %l2
	mov	%i5, %l1
.LBB2_2:
	cmp %i1, 0
	be	.LBB2_8
	nop
	ld [%fp+-2988], %i2
	or %i2, %l0, %i2
	st %i2, [%fp+-2216]
	add %fp, -32, %i4
	mov	32, %i2
	mov	64, %l3
	ld [%fp+-2852], %i3
.LBB2_4:
	mov	%g3, %i5
	mov	%i0, %l6
	ld [%i0], %l4
	mov	%i4, %o0
	ld [%fp+-2916], %o1
	mov	%i2, %i0
	call memcpy
	mov	%i2, %o2
	ld [%fp+-2860], %l7
	ld [%fp+-2216], %i2
.LBB2_5:
	cmp %l7, 1
	be	.LBB2_31
	nop
	cmp %l7, 0
	bne	.LBB2_32
	nop
	ba .LBB2_7
	nop
.LBB2_31:
	or %i2, %i3, %i2
.LBB2_32:
	and %i2, 255, %o5
	mov	%i4, %o0
	mov	%l4, %o1
	mov	%l3, %o2
	mov	%l2, %o3
	call _blake3_compress_in_place_sse2
	mov	%l1, %o4
	add %l4, 64, %l4
	add %l7, -1, %l7
	ba .LBB2_5
	mov	%l0, %i2
.LBB2_7:
	mov	%l5, %o0
	mov	%i4, %o1
	mov	%i0, %i2
	call memcpy
	mov	%i0, %o2
	mov	%i5, %g3
	addcc %l1, %i5, %l1
	addxcc %l2, 0, %l2
	mov	%l6, %i0
	add %l6, 4, %i0
	add %i1, -1, %i1
	cmp %i1, 0
	bne	.LBB2_4
	add %l5, 32, %l5
.LBB2_8:
	ret
	restore
.Lfunc_end2:
	.size	_blake3_hash_many_sse2, .Lfunc_end2-_blake3_hash_many_sse2
#endif
