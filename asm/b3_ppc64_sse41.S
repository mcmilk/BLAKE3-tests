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
 * Copyright (c) 2019-2022 Samuel Neves
 * Copyright (c) 2022 Tino Reichardt <milky-zfs@mcmilk.de>
 *
 * This is converted assembly: SSE4.1 -> POWER7 PPC64
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if (defined(__PPC64__) && defined(__BIG_ENDIAN__))

.text
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.byte	0
	.byte	1
	.byte	2
	.byte	16
	.byte	4
	.byte	5
	.byte	6
	.byte	17
	.byte	8
	.byte	9
	.byte	10
	.byte	18
	.byte	12
	.byte	13
	.byte	14
	.byte	19
.LCPI0_1:
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	14
	.byte	15
	.byte	12
	.byte	13
.LCPI0_2:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI0_3:
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	5
	.byte	6
	.byte	7
	.byte	4
	.byte	9
	.byte	10
	.byte	11
	.byte	8
	.byte	13
	.byte	14
	.byte	15
	.byte	12
.LCPI0_4:
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	8
	.byte	9
	.byte	10
	.byte	11
.LCPI0_5:
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	28
	.byte	29
	.byte	30
	.byte	31
.LCPI0_6:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	4
	.byte	5
	.byte	6
	.byte	7
.LCPI0_7:
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.text
	.globl	_blake3_compress_in_place_sse41
	.p2align	2
	.type	_blake3_compress_in_place_sse41,@function
	.section	.opd,"aw",@progbits
_blake3_compress_in_place_sse41:
	.p2align	3
	.quad	.Lfunc_begin0
	.quad	.TOC.@tocbase
	.quad	0
	.text
.Lfunc_begin0:
	.cfi_startproc
	li 8, 16
	li 9, 31
	lvsl 1, 0, 4
	lvsl 11, 0, 3
	lvx 2, 3, 8
	lvx 3, 0, 3
	xxlxor 44, 44, 44
	lvx 4, 3, 9
	stb 7, -48(1)
	addi 9, 1, -48
	stb 5, -64(1)
	addi 5, 1, -64
	addi 7, 1, -32
	vperm 3, 3, 2, 11
	lxvw4x 32, 0, 5
	rldicl 5, 6, 32, 32
	lxvw4x 37, 0, 9
	addi 9, 1, -16
	stw 6, -32(1)
	stw 5, -16(1)
	vperm 11, 2, 4, 11
	li 5, 32
	lxvw4x 38, 0, 7
	lxvw4x 39, 0, 9
	lvx 8, 4, 8
	lvx 9, 0, 4
	vmrghb 5, 0, 5
	lvx 10, 4, 5
	addis 5, 2, .LCPI0_0@toc@ha
	vperm 9, 9, 8, 1
	addi 5, 5, .LCPI0_0@toc@l
	vperm 8, 8, 10, 1
	vmrghw 2, 6, 7
	vadduwm 3, 11, 3
	vspltisw 6, 10
	vmrglw 0, 9, 8
	vmrghw 8, 9, 8
	lxvw4x 41, 0, 5
	addis 5, 2, .LCPI0_1@toc@ha
	addi 5, 5, .LCPI0_1@toc@l
	vperm 4, 12, 5, 9
	vmrghw 7, 8, 0
	xxmrghd	36, 34, 36
	lxvw4x 34, 0, 5
	addis 5, 2, .LCPI0_2@toc@ha
	addi 5, 5, .LCPI0_2@toc@l
	lxvw4x 41, 0, 5
	li 5, 48
	vadduwm 5, 3, 7
	vcmpgtsb 3, 12, 2
	xxlxor 36, 37, 36
	vperm 4, 4, 4, 2
	xxlandc 45, 36, 35
	vadduwm 4, 6, 6
	vadduwm 6, 13, 9
	vmrglw 9, 8, 0
	xxlxor 32, 38, 43
	vrlw 8, 0, 4
	lvx 0, 4, 5
	li 5, 63
	lvx 11, 4, 5
	addis 4, 2, .LCPI0_3@toc@ha
	addi 4, 4, .LCPI0_3@toc@l
	vperm 10, 10, 0, 1
	vadduwm 14, 5, 9
	lxvw4x 37, 0, 4
	addis 4, 2, .LCPI0_4@toc@ha
	vperm 1, 0, 11, 1
	addi 4, 4, .LCPI0_4@toc@l
	vadduwm 14, 14, 8
	vcmpgtsb 0, 12, 5
	xxlxor 43, 45, 46
	vspltisw 12, -16
	vperm 11, 11, 11, 5
	vmrghw 13, 10, 1
	vmrglw 10, 1, 10
	vspltisw 1, 9
	xxlandc 47, 43, 32
	vsubuwm 1, 1, 12
	xxsldwi 44, 46, 46, 3
	vadduwm 6, 6, 15
	xxswapd	0, 47
	vmrghw 11, 10, 13
	xxlxor 40, 38, 40
	xxsldwi 38, 38, 38, 1
	vmrglw 13, 10, 13
	vrlw 8, 8, 1
	vadduwm 12, 12, 11
	vadduwm 12, 12, 8
	xxlxor 46, 44, 0
	vperm 14, 14, 14, 2
	xxlandc 46, 46, 35
	vadduwm 6, 6, 14
	xxlxor 40, 38, 40
	vrlw 10, 8, 4
	vadduwm 8, 12, 13
	vadduwm 15, 8, 10
	xxlxor 40, 46, 47
	vperm 12, 8, 8, 5
	lxvw4x 40, 0, 4
	addis 4, 2, .LCPI0_5@toc@ha
	addi 4, 4, .LCPI0_5@toc@l
	xxlandc 46, 44, 32
	vperm 12, 7, 9, 8
	vadduwm 6, 6, 14
	xxswapd	0, 46
	xxlxor 42, 38, 42
	vrlw 16, 10, 1
	xxsldwi 42, 47, 47, 1
	xxsldwi 47, 38, 38, 3
	lxvw4x 38, 0, 4
	addis 4, 2, .LCPI0_6@toc@ha
	addi 4, 4, .LCPI0_6@toc@l
	vadduwm 10, 10, 12
	vadduwm 14, 10, 16
	xxlxor 42, 46, 0
	xxsldwi 0, 45, 43, 3
	vperm 10, 10, 10, 2
	xxsldwi 49, 43, 0, 1
	xxlandc 50, 42, 35
	vperm 10, 7, 17, 6
	vadduwm 15, 15, 18
	xxlxor 39, 47, 48
	vrlw 16, 7, 4
	vadduwm 7, 14, 10
	vadduwm 14, 7, 16
	xxlxor 39, 50, 46
	xxmrghd	50, 45, 41
	xxsldwi 46, 46, 46, 3
	vmrglw 9, 9, 13
	vperm 17, 7, 7, 5
	lxvw4x 39, 0, 4
	addis 4, 2, .LCPI0_7@toc@ha
	addi 4, 4, .LCPI0_7@toc@l
	vperm 18, 18, 11, 7
	xxlandc 49, 49, 32
	vadduwm 15, 15, 17
	xxswapd	0, 49
	vadduwm 14, 14, 18
	xxlxor 48, 47, 48
	xxsldwi 47, 47, 47, 1
	vmrghw 17, 11, 9
	vrlw 16, 16, 1
	vadduwm 14, 14, 16
	xxlxor 45, 46, 0
	xxsldwi 0, 49, 41, 1
	vperm 13, 13, 13, 2
	xxsldwi 43, 0, 43, 1
	vadduwm 14, 14, 11
	xxlandc 45, 45, 35
	vadduwm 15, 15, 13
	xxlxor 41, 47, 48
	vperm 16, 12, 10, 8
	vrlw 9, 9, 4
	vadduwm 14, 14, 9
	xxlxor 45, 45, 46
	vperm 13, 13, 13, 5
	xxlandc 45, 45, 32
	vadduwm 15, 15, 13
	xxswapd	0, 45
	xxlxor 41, 47, 41
	vrlw 17, 9, 1
	xxsldwi 41, 46, 46, 1
	xxsldwi 46, 47, 47, 3
	vadduwm 9, 9, 16
	vadduwm 13, 9, 17
	xxlxor 41, 45, 0
	xxsldwi 0, 43, 50, 3
	vperm 9, 9, 9, 2
	xxsldwi 47, 50, 0, 1
	xxlandc 51, 41, 35
	vperm 9, 12, 15, 6
	vadduwm 14, 14, 19
	xxlxor 44, 46, 49
	xxmrghd	49, 43, 42
	vmrglw 10, 10, 11
	vrlw 12, 12, 4
	vadduwm 13, 13, 9
	vperm 17, 17, 18, 7
	vadduwm 13, 13, 12
	xxlxor 47, 51, 45
	xxsldwi 45, 45, 45, 3
	vperm 15, 15, 15, 5
	vadduwm 13, 13, 17
	xxlandc 47, 47, 32
	vadduwm 14, 14, 15
	xxswapd	0, 47
	vmrghw 15, 18, 10
	xxlxor 44, 46, 44
	xxsldwi 46, 46, 46, 1
	vrlw 12, 12, 1
	vadduwm 13, 13, 12
	xxlxor 43, 45, 0
	xxsldwi 0, 47, 42, 1
	vperm 15, 16, 9, 8
	vperm 11, 11, 11, 2
	xxlandc 43, 43, 35
	vadduwm 14, 14, 11
	xxlxor 42, 46, 44
	xxsldwi 44, 0, 50, 1
	vrlw 10, 10, 4
	vadduwm 13, 13, 12
	vadduwm 13, 13, 10
	xxlxor 43, 43, 45
	vperm 11, 11, 11, 5
	xxlandc 43, 43, 32
	vadduwm 14, 14, 11
	xxswapd	0, 43
	xxlxor 42, 46, 42
	vrlw 18, 10, 1
	xxsldwi 42, 45, 45, 1
	xxsldwi 45, 46, 46, 3
	vadduwm 10, 10, 15
	vadduwm 11, 10, 18
	xxlxor 42, 43, 0
	xxsldwi 0, 44, 49, 3
	vperm 10, 10, 10, 2
	xxsldwi 46, 49, 0, 1
	xxlandc 51, 42, 35
	vperm 10, 16, 14, 6
	vadduwm 13, 13, 19
	xxlxor 46, 45, 50
	xxmrghd	50, 44, 41
	vmrglw 9, 9, 12
	vrlw 14, 14, 4
	vadduwm 11, 11, 10
	vperm 18, 18, 17, 7
	vadduwm 11, 11, 14
	xxlxor 48, 51, 43
	xxsldwi 43, 43, 43, 3
	vperm 16, 16, 16, 5
	vadduwm 11, 11, 18
	xxlandc 48, 48, 32
	vadduwm 13, 13, 16
	xxswapd	0, 48
	vmrghw 16, 17, 9
	xxlxor 46, 45, 46
	xxsldwi 45, 45, 45, 1
	vrlw 14, 14, 1
	vadduwm 11, 11, 14
	xxlxor 44, 43, 0
	xxsldwi 0, 48, 41, 1
	vperm 16, 15, 10, 8
	vperm 12, 12, 12, 2
	xxlandc 44, 44, 35
	vadduwm 13, 13, 12
	xxlxor 41, 45, 46
	xxsldwi 46, 0, 49, 1
	vrlw 9, 9, 4
	vadduwm 11, 11, 14
	vadduwm 11, 11, 9
	xxlxor 44, 44, 43
	vperm 12, 12, 12, 5
	xxlandc 44, 44, 32
	vadduwm 13, 13, 12
	xxswapd	0, 44
	xxlxor 41, 45, 41
	xxsldwi 44, 45, 45, 3
	vrlw 17, 9, 1
	xxsldwi 41, 43, 43, 1
	vadduwm 9, 9, 16
	vadduwm 11, 9, 17
	xxlxor 41, 43, 0
	xxsldwi 0, 46, 50, 3
	vperm 9, 9, 9, 2
	xxsldwi 45, 50, 0, 1
	xxlandc 51, 41, 35
	vperm 9, 15, 13, 6
	vadduwm 12, 12, 19
	xxlxor 45, 44, 49
	xxmrghd	49, 46, 42
	vmrglw 10, 10, 14
	vrlw 13, 13, 4
	vadduwm 11, 11, 9
	vperm 17, 17, 18, 7
	vadduwm 11, 11, 13
	xxlxor 47, 51, 43
	xxsldwi 43, 43, 43, 3
	vperm 15, 15, 15, 5
	vadduwm 11, 11, 17
	xxlandc 47, 47, 32
	vadduwm 12, 12, 15
	xxswapd	0, 47
	vmrghw 15, 18, 10
	xxlxor 45, 44, 45
	xxsldwi 44, 44, 44, 1
	vrlw 13, 13, 1
	vadduwm 11, 11, 13
	xxlxor 46, 43, 0
	xxsldwi 0, 47, 42, 1
	vperm 14, 14, 14, 2
	xxlandc 46, 46, 35
	vadduwm 12, 12, 14
	xxlxor 42, 44, 45
	xxsldwi 45, 0, 50, 1
	vrlw 10, 10, 4
	vadduwm 11, 11, 13
	vadduwm 15, 11, 10
	xxlxor 43, 46, 47
	vperm 11, 11, 11, 5
	xxlandc 46, 43, 32
	vperm 11, 16, 9, 8
	vadduwm 12, 12, 14
	xxswapd	0, 46
	xxlxor 40, 44, 42
	xxsldwi 44, 44, 44, 3
	vrlw 10, 8, 1
	xxsldwi 40, 47, 47, 1
	vadduwm 8, 8, 11
	vadduwm 14, 8, 10
	xxlxor 40, 46, 0
	xxsldwi 0, 45, 49, 3
	vperm 8, 8, 8, 2
	xxsldwi 47, 49, 0, 1
	xxlandc 50, 40, 35
	vperm 8, 16, 15, 6
	vadduwm 12, 12, 18
	xxmrghd	48, 45, 41
	vmrglw 9, 9, 13
	xxlxor 42, 44, 42
	vrlw 15, 10, 4
	vadduwm 10, 14, 8
	vadduwm 14, 10, 15
	xxlxor 42, 50, 46
	xxsldwi 46, 46, 46, 3
	vperm 10, 10, 10, 5
	xxlandc 50, 42, 32
	vperm 10, 16, 17, 7
	vadduwm 12, 12, 18
	xxswapd	0, 50
	vmrghw 16, 17, 9
	xxlxor 47, 44, 47
	xxsldwi 44, 44, 44, 1
	vrlw 15, 15, 1
	vadduwm 14, 14, 10
	vadduwm 14, 14, 15
	xxlxor 45, 46, 0
	xxsldwi 0, 48, 41, 1
	lxvw4x 48, 0, 4
	vperm 13, 13, 13, 2
	vperm 16, 11, 8, 16
	xxlandc 45, 45, 35
	vadduwm 12, 12, 13
	xxlxor 41, 44, 47
	xxsldwi 47, 0, 49, 1
	vrlw 9, 9, 4
	vadduwm 14, 14, 15
	vadduwm 14, 14, 9
	xxlxor 45, 45, 46
	vadduwm 14, 14, 16
	vperm 13, 13, 13, 5
	xxsldwi 46, 46, 46, 1
	xxlandc 45, 45, 32
	vadduwm 12, 12, 13
	xxswapd	0, 45
	xxlxor 41, 44, 41
	xxsldwi 44, 44, 44, 3
	vrlw 9, 9, 1
	vadduwm 13, 9, 14
	xxlxor 46, 45, 0
	xxsldwi 0, 47, 42, 3
	vperm 14, 14, 14, 2
	xxsldwi 48, 42, 0, 1
	vperm 6, 11, 16, 6
	xxlandc 46, 46, 35
	vadduwm 12, 12, 14
	xxlxor 41, 44, 41
	vadduwm 6, 13, 6
	xxmrghd	45, 47, 40
	vrlw 9, 9, 4
	vmrglw 8, 8, 15
	vperm 7, 13, 10, 7
	vadduwm 6, 6, 9
	xxlxor 43, 46, 38
	xxsldwi 38, 38, 38, 3
	vperm 11, 11, 11, 5
	vadduwm 6, 6, 7
	xxlandc 43, 43, 32
	vadduwm 12, 12, 11
	xxswapd	0, 43
	xxlxor 41, 44, 41
	xxsldwi 43, 44, 44, 1
	vrlw 9, 9, 1
	vadduwm 6, 6, 9
	xxlxor 39, 38, 0
	vperm 2, 7, 7, 2
	vmrghw 7, 10, 8
	xxlandc 34, 34, 35
	xxsldwi 0, 39, 40, 1
	vadduwm 3, 11, 2
	xxlxor 41, 35, 41
	xxsldwi 39, 0, 42, 1
	vrlw 4, 9, 4
	vadduwm 6, 6, 7
	vadduwm 6, 6, 4
	xxlxor 34, 34, 38
	xxsldwi 0, 38, 38, 1
	vperm 2, 2, 2, 5
	xxlandc 34, 34, 32
	vadduwm 3, 3, 2
	xxswapd	2, 34
	xxlxor 36, 35, 36
	xxsldwi 1, 35, 35, 3
	vrlw 4, 4, 1
	xxlxor 0, 1, 0
	stxvw4x 0, 0, 3
	xxlxor 1, 36, 2
	stxvw4x 1, 3, 8
	blr
	.long	0
	.quad	0
.Lfunc_end0:
	.size	_blake3_compress_in_place_sse41, .Lfunc_end0-.Lfunc_begin0
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.byte	0
	.byte	1
	.byte	2
	.byte	16
	.byte	4
	.byte	5
	.byte	6
	.byte	17
	.byte	8
	.byte	9
	.byte	10
	.byte	18
	.byte	12
	.byte	13
	.byte	14
	.byte	19
.LCPI1_1:
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	14
	.byte	15
	.byte	12
	.byte	13
.LCPI1_2:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI1_3:
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	5
	.byte	6
	.byte	7
	.byte	4
	.byte	9
	.byte	10
	.byte	11
	.byte	8
	.byte	13
	.byte	14
	.byte	15
	.byte	12
.LCPI1_4:
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	8
	.byte	9
	.byte	10
	.byte	11
.LCPI1_5:
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	28
	.byte	29
	.byte	30
	.byte	31
.LCPI1_6:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	4
	.byte	5
	.byte	6
	.byte	7
.LCPI1_7:
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.text
	.globl	_blake3_compress_xof_sse41
	.p2align	2
	.type	_blake3_compress_xof_sse41,@function
	.section	.opd,"aw",@progbits
_blake3_compress_xof_sse41:
	.p2align	3
	.quad	.Lfunc_begin1
	.quad	.TOC.@tocbase
	.quad	0
	.text
.Lfunc_begin1:
	.cfi_startproc
	li 9, -16
	li 10, 31
	addi 11, 1, -64
	lvsl 1, 0, 4
	stxvd2x 63, 1, 9
	li 9, 16
	xxlxor 44, 44, 44
	lvx 3, 3, 9
	lvx 4, 0, 3
	lvx 5, 3, 10
	stb 7, -64(1)
	addi 7, 1, -48
	stb 5, -80(1)
	addi 5, 1, -80
	lxvw4x 32, 0, 5
	rldicl 5, 6, 32, 32
	lxvw4x 34, 0, 11
	addi 11, 1, -32
	stw 6, -48(1)
	stw 5, -32(1)
	addis 6, 2, .LCPI1_0@toc@ha
	li 5, 32
	lxvw4x 38, 0, 7
	lxvw4x 39, 0, 11
	addi 6, 6, .LCPI1_0@toc@l
	li 7, 63
	lvx 8, 4, 9
	lvx 9, 0, 4
	vmrghb 0, 0, 2
	lvx 11, 4, 5
	lvsl 2, 0, 3
	vperm 9, 9, 8, 1
	vperm 8, 8, 11, 1
	vperm 4, 4, 3, 2
	vperm 13, 3, 5, 2
	vmrghw 3, 6, 7
	vspltisw 6, 10
	vmrglw 10, 9, 8
	vmrghw 9, 9, 8
	lxvw4x 40, 0, 6
	addis 6, 2, .LCPI1_1@toc@ha
	vadduwm 4, 13, 4
	addi 6, 6, .LCPI1_1@toc@l
	vperm 5, 12, 0, 8
	vmrghw 8, 9, 10
	vmrglw 10, 9, 10
	xxmrghd	37, 35, 37
	lxvw4x 35, 0, 6
	addis 6, 2, .LCPI1_2@toc@ha
	addi 6, 6, .LCPI1_2@toc@l
	lxvw4x 39, 0, 6
	li 6, 48
	vadduwm 0, 4, 8
	vcmpgtsb 4, 12, 3
	xxlxor 37, 32, 37
	vadduwm 15, 0, 10
	vperm 5, 5, 5, 3
	xxlandc 46, 37, 36
	vadduwm 5, 6, 6
	vadduwm 7, 14, 7
	xxlxor 38, 39, 45
	vrlw 9, 6, 5
	lvx 6, 4, 6
	lvx 13, 4, 7
	addis 4, 2, .LCPI1_3@toc@ha
	addi 4, 4, .LCPI1_3@toc@l
	vperm 11, 11, 6, 1
	lxvw4x 32, 0, 4
	addis 4, 2, .LCPI1_4@toc@ha
	vperm 6, 6, 13, 1
	addi 4, 4, .LCPI1_4@toc@l
	vcmpgtsb 1, 12, 0
	vadduwm 13, 15, 9
	xxlxor 46, 46, 45
	xxsldwi 45, 45, 45, 3
	vmrghw 15, 11, 6
	vperm 12, 14, 14, 0
	vmrglw 11, 6, 11
	vspltisw 14, -16
	vspltisw 6, 9
	xxlandc 48, 44, 33
	vsubuwm 6, 6, 14
	vadduwm 7, 7, 16
	xxswapd	0, 48
	vmrghw 12, 11, 15
	xxlxor 41, 39, 41
	xxsldwi 39, 39, 39, 1
	vmrglw 15, 11, 15
	vrlw 9, 9, 6
	vadduwm 13, 13, 12
	vadduwm 13, 13, 9
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 3
	xxlandc 46, 46, 36
	vadduwm 7, 7, 14
	xxlxor 41, 39, 41
	vrlw 11, 9, 5
	vadduwm 9, 13, 15
	vadduwm 16, 9, 11
	xxlxor 41, 46, 48
	vperm 13, 9, 9, 0
	lxvw4x 41, 0, 4
	addis 4, 2, .LCPI1_5@toc@ha
	addi 4, 4, .LCPI1_5@toc@l
	xxlandc 46, 45, 33
	vperm 13, 8, 10, 9
	vadduwm 7, 7, 14
	xxswapd	0, 46
	xxlxor 43, 39, 43
	vrlw 17, 11, 6
	xxsldwi 43, 48, 48, 1
	xxsldwi 48, 39, 39, 3
	lxvw4x 39, 0, 4
	addis 4, 2, .LCPI1_6@toc@ha
	addi 4, 4, .LCPI1_6@toc@l
	vadduwm 11, 11, 13
	vadduwm 14, 11, 17
	xxlxor 43, 46, 0
	xxsldwi 0, 47, 44, 3
	vperm 11, 11, 11, 3
	xxsldwi 50, 44, 0, 1
	xxlandc 51, 43, 36
	vperm 11, 8, 18, 7
	vadduwm 16, 16, 19
	xxlxor 40, 48, 49
	vrlw 17, 8, 5
	vadduwm 8, 14, 11
	vadduwm 14, 8, 17
	xxlxor 40, 51, 46
	xxmrghd	51, 47, 42
	xxsldwi 46, 46, 46, 3
	vmrglw 10, 10, 15
	vperm 18, 8, 8, 0
	lxvw4x 40, 0, 4
	addis 4, 2, .LCPI1_7@toc@ha
	addi 4, 4, .LCPI1_7@toc@l
	vperm 19, 19, 12, 8
	xxlandc 50, 50, 33
	vadduwm 16, 16, 18
	xxswapd	0, 50
	vadduwm 14, 14, 19
	xxlxor 49, 48, 49
	xxsldwi 48, 48, 48, 1
	vmrghw 18, 12, 10
	vrlw 17, 17, 6
	vadduwm 14, 14, 17
	xxlxor 47, 46, 0
	xxsldwi 0, 50, 42, 1
	vperm 15, 15, 15, 3
	xxsldwi 44, 0, 44, 1
	vadduwm 14, 14, 12
	xxlandc 47, 47, 36
	vadduwm 16, 16, 15
	xxlxor 42, 48, 49
	vperm 17, 13, 11, 9
	vrlw 10, 10, 5
	vadduwm 14, 14, 10
	xxlxor 47, 47, 46
	vperm 15, 15, 15, 0
	xxlandc 47, 47, 33
	vadduwm 16, 16, 15
	xxswapd	0, 47
	xxlxor 42, 48, 42
	xxsldwi 47, 48, 48, 3
	vrlw 18, 10, 6
	xxsldwi 42, 46, 46, 1
	vadduwm 10, 10, 17
	vadduwm 14, 10, 18
	xxlxor 42, 46, 0
	xxsldwi 0, 44, 51, 3
	vperm 10, 10, 10, 3
	xxsldwi 48, 51, 0, 1
	xxlandc 63, 42, 36
	vperm 10, 13, 16, 7
	vadduwm 15, 15, 31
	xxlxor 45, 47, 50
	xxmrghd	50, 44, 43
	vmrglw 11, 11, 12
	vrlw 13, 13, 5
	vadduwm 14, 14, 10
	vperm 18, 18, 19, 8
	vadduwm 14, 14, 13
	xxlxor 48, 63, 46
	xxsldwi 46, 46, 46, 3
	vperm 16, 16, 16, 0
	vadduwm 14, 14, 18
	xxlandc 48, 48, 33
	vadduwm 15, 15, 16
	xxswapd	0, 48
	vmrghw 16, 19, 11
	xxlxor 45, 47, 45
	xxsldwi 47, 47, 47, 1
	vrlw 13, 13, 6
	vadduwm 14, 14, 13
	xxlxor 44, 46, 0
	xxsldwi 0, 48, 43, 1
	vperm 16, 17, 10, 9
	vperm 12, 12, 12, 3
	xxlandc 44, 44, 36
	vadduwm 15, 15, 12
	xxlxor 43, 47, 45
	xxsldwi 45, 0, 51, 1
	vrlw 11, 11, 5
	vadduwm 14, 14, 13
	vadduwm 14, 14, 11
	xxlxor 44, 44, 46
	vperm 12, 12, 12, 0
	xxlandc 44, 44, 33
	vadduwm 15, 15, 12
	xxswapd	0, 44
	xxlxor 43, 47, 43
	vrlw 19, 11, 6
	xxsldwi 43, 46, 46, 1
	xxsldwi 46, 47, 47, 3
	vadduwm 11, 11, 16
	vadduwm 12, 11, 19
	xxlxor 43, 44, 0
	xxsldwi 0, 45, 50, 3
	vperm 11, 11, 11, 3
	xxsldwi 47, 50, 0, 1
	xxlandc 63, 43, 36
	vperm 11, 17, 15, 7
	vadduwm 14, 14, 31
	xxlxor 47, 46, 51
	xxmrghd	51, 45, 42
	vmrglw 10, 10, 13
	vrlw 15, 15, 5
	vadduwm 12, 12, 11
	vperm 19, 19, 18, 8
	vadduwm 12, 12, 15
	xxlxor 49, 63, 44
	xxsldwi 44, 44, 44, 3
	vperm 17, 17, 17, 0
	vadduwm 12, 12, 19
	xxlandc 49, 49, 33
	vadduwm 14, 14, 17
	xxswapd	0, 49
	vmrghw 17, 18, 10
	xxlxor 47, 46, 47
	xxsldwi 46, 46, 46, 1
	vrlw 15, 15, 6
	vadduwm 12, 12, 15
	xxlxor 45, 44, 0
	xxsldwi 0, 49, 42, 1
	vperm 17, 16, 11, 9
	vperm 13, 13, 13, 3
	xxlandc 45, 45, 36
	vadduwm 14, 14, 13
	xxlxor 42, 46, 47
	xxsldwi 47, 0, 50, 1
	vrlw 10, 10, 5
	vadduwm 12, 12, 15
	vadduwm 12, 12, 10
	xxlxor 45, 45, 44
	vperm 13, 13, 13, 0
	xxlandc 45, 45, 33
	vadduwm 14, 14, 13
	xxswapd	0, 45
	xxlxor 42, 46, 42
	xxsldwi 45, 46, 46, 3
	vrlw 18, 10, 6
	xxsldwi 42, 44, 44, 1
	vadduwm 10, 10, 17
	vadduwm 12, 10, 18
	xxlxor 42, 44, 0
	xxsldwi 0, 47, 51, 3
	vperm 10, 10, 10, 3
	xxsldwi 46, 51, 0, 1
	xxlandc 63, 42, 36
	vperm 10, 16, 14, 7
	vadduwm 13, 13, 31
	xxlxor 46, 45, 50
	xxmrghd	50, 47, 43
	vmrglw 11, 11, 15
	vrlw 14, 14, 5
	vadduwm 12, 12, 10
	vperm 18, 18, 19, 8
	vadduwm 12, 12, 14
	xxlxor 48, 63, 44
	xxsldwi 44, 44, 44, 3
	vperm 16, 16, 16, 0
	vadduwm 12, 12, 18
	xxlandc 48, 48, 33
	vadduwm 13, 13, 16
	xxswapd	0, 48
	vmrghw 16, 19, 11
	xxlxor 46, 45, 46
	xxsldwi 45, 45, 45, 1
	vrlw 14, 14, 6
	vadduwm 12, 12, 14
	xxlxor 47, 44, 0
	xxsldwi 0, 48, 43, 1
	vperm 15, 15, 15, 3
	xxlandc 47, 47, 36
	vadduwm 13, 13, 15
	xxlxor 43, 45, 46
	xxsldwi 46, 0, 51, 1
	vrlw 11, 11, 5
	vadduwm 12, 12, 14
	vadduwm 16, 12, 11
	xxlxor 44, 47, 48
	vperm 12, 12, 12, 0
	xxlandc 47, 44, 33
	vperm 12, 17, 10, 9
	vadduwm 13, 13, 15
	xxswapd	0, 47
	xxlxor 41, 45, 43
	xxsldwi 45, 45, 45, 3
	vrlw 11, 9, 6
	xxsldwi 41, 48, 48, 1
	vadduwm 9, 9, 12
	vadduwm 15, 9, 11
	xxlxor 41, 47, 0
	xxsldwi 0, 46, 50, 3
	vperm 9, 9, 9, 3
	xxsldwi 48, 50, 0, 1
	xxlandc 51, 41, 36
	vperm 9, 17, 16, 7
	vadduwm 13, 13, 19
	xxmrghd	49, 46, 42
	vmrglw 10, 10, 14
	xxlxor 43, 45, 43
	vrlw 16, 11, 5
	vadduwm 11, 15, 9
	vadduwm 15, 11, 16
	xxlxor 43, 51, 47
	xxsldwi 47, 47, 47, 3
	vperm 11, 11, 11, 0
	xxlandc 51, 43, 33
	vperm 11, 17, 18, 8
	vadduwm 13, 13, 19
	xxswapd	0, 51
	vmrghw 17, 18, 10
	xxlxor 48, 45, 48
	xxsldwi 45, 45, 45, 1
	vrlw 16, 16, 6
	vadduwm 15, 15, 11
	vadduwm 15, 15, 16
	xxlxor 46, 47, 0
	xxsldwi 0, 49, 42, 1
	lxvw4x 49, 0, 4
	vperm 14, 14, 14, 3
	vperm 17, 12, 9, 17
	xxlandc 46, 46, 36
	vadduwm 13, 13, 14
	xxlxor 42, 45, 48
	xxsldwi 48, 0, 50, 1
	vrlw 10, 10, 5
	vadduwm 15, 15, 16
	vadduwm 15, 15, 10
	xxlxor 46, 46, 47
	vadduwm 15, 15, 17
	vperm 14, 14, 14, 0
	xxsldwi 47, 47, 47, 1
	xxlandc 46, 46, 33
	vadduwm 13, 13, 14
	xxswapd	0, 46
	xxlxor 42, 45, 42
	xxsldwi 45, 45, 45, 3
	vrlw 10, 10, 6
	vadduwm 14, 10, 15
	xxlxor 47, 46, 0
	xxsldwi 0, 48, 43, 3
	vperm 15, 15, 15, 3
	xxsldwi 49, 43, 0, 1
	vperm 7, 12, 17, 7
	xxlandc 47, 47, 36
	vadduwm 13, 13, 15
	xxlxor 42, 45, 42
	vadduwm 7, 14, 7
	xxmrghd	46, 48, 41
	vrlw 10, 10, 5
	vmrglw 9, 9, 16
	vperm 8, 14, 11, 8
	vadduwm 7, 7, 10
	xxlxor 44, 47, 39
	xxsldwi 39, 39, 39, 3
	vperm 12, 12, 12, 0
	vadduwm 7, 7, 8
	xxlandc 44, 44, 33
	vadduwm 13, 13, 12
	xxswapd	0, 44
	xxlxor 42, 45, 42
	xxsldwi 44, 45, 45, 1
	vrlw 10, 10, 6
	vadduwm 7, 7, 10
	xxlxor 40, 39, 0
	vperm 3, 8, 8, 3
	vmrghw 8, 11, 9
	xxlandc 35, 35, 36
	xxsldwi 0, 40, 41, 1
	vadduwm 4, 12, 3
	xxlxor 42, 36, 42
	xxsldwi 40, 0, 43, 1
	vrlw 5, 10, 5
	vadduwm 7, 7, 8
	vadduwm 7, 7, 5
	xxlxor 35, 35, 39
	xxsldwi 0, 39, 39, 1
	vperm 3, 3, 3, 0
	xxlandc 35, 35, 33
	vadduwm 4, 4, 3
	xxswapd	2, 35
	xxlxor 37, 36, 37
	xxsldwi 1, 36, 36, 3
	vrlw 5, 5, 6
	xxlxor 0, 1, 0
	stxvw4x 0, 0, 8
	xxlxor 3, 37, 2
	stxvw4x 3, 8, 9
	lvx 3, 3, 9
	lvx 4, 0, 3
	vperm 3, 4, 3, 2
	xxlxor 0, 1, 35
	stxvw4x 0, 8, 5
	lvx 3, 3, 10
	lvx 4, 3, 9
	li 3, -16
	lxvd2x 63, 1, 3
	vperm 2, 4, 3, 2
	xxlxor 0, 2, 34
	stxvw4x 0, 8, 6
	blr
	.long	0
	.quad	0
.Lfunc_end1:
	.size	_blake3_compress_xof_sse41, .Lfunc_end1-.Lfunc_begin1
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.long	0
	.long	1
	.long	2
	.long	3
.LCPI2_1:
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	14
	.byte	15
	.byte	12
	.byte	13
.LCPI2_2:
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	5
	.byte	6
	.byte	7
	.byte	4
	.byte	9
	.byte	10
	.byte	11
	.byte	8
	.byte	13
	.byte	14
	.byte	15
	.byte	12
.LCPI2_3:
	.long	1779033703
	.long	1779033703
	.long	1779033703
	.long	1779033703
.LCPI2_4:
	.long	3144134277
	.long	3144134277
	.long	3144134277
	.long	3144134277
.LCPI2_5:
	.long	1013904242
	.long	1013904242
	.long	1013904242
	.long	1013904242
.LCPI2_6:
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.text
	.globl	_blake3_hash_many_sse41
	.p2align	2
	.type	_blake3_hash_many_sse41,@function
	.section	.opd,"aw",@progbits
_blake3_hash_many_sse41:
	.p2align	3
	.quad	.Lfunc_begin2
	.quad	.TOC.@tocbase
	.quad	0
	.text
.Lfunc_begin2:
	.cfi_startproc
	mflr 0
	std 0, 16(1)
	stdu 1, -864(1)
	.cfi_def_cfa_offset 864
	.cfi_offset lr, 16
	.cfi_offset r14, -208
	.cfi_offset r15, -200
	.cfi_offset r16, -192
	.cfi_offset r17, -184
	.cfi_offset r18, -176
	.cfi_offset r19, -168
	.cfi_offset r20, -160
	.cfi_offset r21, -152
	.cfi_offset r22, -144
	.cfi_offset r23, -136
	.cfi_offset r24, -128
	.cfi_offset r25, -120
	.cfi_offset r26, -112
	.cfi_offset r27, -104
	.cfi_offset r28, -96
	.cfi_offset r29, -88
	.cfi_offset r30, -80
	.cfi_offset r31, -72
	.cfi_offset f24, -64
	.cfi_offset f25, -56
	.cfi_offset f26, -48
	.cfi_offset f27, -40
	.cfi_offset f28, -32
	.cfi_offset f29, -24
	.cfi_offset f30, -16
	.cfi_offset f31, -8
	.cfi_offset v20, -400
	.cfi_offset v21, -384
	.cfi_offset v22, -368
	.cfi_offset v23, -352
	.cfi_offset v24, -336
	.cfi_offset v25, -320
	.cfi_offset v26, -304
	.cfi_offset v27, -288
	.cfi_offset v28, -272
	.cfi_offset v29, -256
	.cfi_offset v30, -240
	.cfi_offset v31, -224
	li 11, 464
	std 22, 720(1)
	lwz 22, 980(1)
	stxvd2x 52, 1, 11
	li 11, 480
	std 23, 728(1)
	stxvd2x 53, 1, 11
	li 11, 496
	std 30, 784(1)
	stxvd2x 54, 1, 11
	li 11, 512
	mr	30, 9
	mr	9, 3
	stxvd2x 55, 1, 11
	li 11, 528
	ld 23, 984(1)
	andi. 3, 8, 1
	stxvd2x 56, 1, 11
	li 11, 544
	std 21, 712(1)
	stxvd2x 57, 1, 11
	li 11, 560
	std 26, 752(1)
	stxvd2x 58, 1, 11
	li 11, 576
	std 27, 760(1)
	stxvd2x 59, 1, 11
	li 11, 592
	std 28, 768(1)
	stxvd2x 60, 1, 11
	li 11, 608
	std 29, 776(1)
	stxvd2x 61, 1, 11
	li 11, 624
	mr	29, 7
	mr	28, 6
	stxvd2x 62, 1, 11
	li 11, 640
	mr	27, 5
	mr	26, 4
	cmpldi 1, 4, 4
	neg 3, 8
	or 21, 10, 30
	stfd 24, 800(1)
	std 14, 656(1)
	std 15, 664(1)
	std 16, 672(1)
	std 17, 680(1)
	std 18, 688(1)
	std 19, 696(1)
	std 20, 704(1)
	std 24, 736(1)
	std 25, 744(1)
	std 31, 792(1)
	stfd 25, 808(1)
	stfd 26, 816(1)
	stfd 27, 824(1)
	stfd 28, 832(1)
	stfd 29, 840(1)
	stfd 30, 848(1)
	stfd 31, 856(1)
	stxvd2x 63, 1, 11
	stw 3, 416(1)
	blt	1, .LBB2_9
	addi 3, 1, 416
	addis 4, 2, .LCPI2_1@toc@ha
	addis 5, 2, .LCPI2_2@toc@ha
	vspltisb 4, -1
	xxlxor 37, 37, 37
	addis 6, 2, .LCPI2_5@toc@ha
	addis 7, 2, .LCPI2_6@toc@ha
	cmpdi 1, 27, 0
	lxvw4x 0, 0, 3
	addi 3, 4, .LCPI2_1@toc@l
	addi 4, 5, .LCPI2_2@toc@l
	addis 5, 2, .LCPI2_4@toc@ha
	li 24, 16
	li 19, 32
	li 18, 48
	addi 25, 6, .LCPI2_5@toc@l
	lxvw4x 34, 0, 3
	addis 3, 2, .LCPI2_0@toc@ha
	lxvw4x 35, 0, 4
	li 4, 0
	li 31, 0
	addi 14, 5, .LCPI2_4@toc@l
	addi 5, 7, .LCPI2_6@toc@l
	addi 3, 3, .LCPI2_0@toc@l
	vslw 0, 4, 4
	li 17, 63
	li 16, 4
	mr	20, 9
	lxvw4x 1, 0, 3
	addi 3, 1, 400
	xxspltw 0, 0, 0
	std 28, 152(1)
	std 3, 224(1)
	addi 3, 1, 272
	vcmpgtsb 4, 5, 2
	std 3, 216(1)
	addi 3, 1, 288
	vcmpgtsb 5, 5, 3
	std 3, 208(1)
	addi 3, 1, 304
	xxland 0, 0, 1
	std 3, 200(1)
	addi 3, 1, 320
	xxlor 8, 34, 34
	std 3, 192(1)
	addi 3, 1, 336
	xxlor 9, 35, 35
	std 3, 184(1)
	addi 3, 1, 352
	xxlor 10, 32, 32
	std 3, 176(1)
	addi 3, 1, 368
	xxlor 11, 0, 0
	std 3, 168(1)
	addi 3, 1, 384
	xxlor 12, 0, 32
	std 3, 160(1)
	addi 3, 1, 256
	xxlnor 13, 36, 36
	std 3, 128(1)
	xxlnor 31, 37, 37
	addis 3, 2, .LCPI2_3@toc@ha
	std 21, 144(1)
	addi 15, 3, .LCPI2_3@toc@l
	std 9, 136(1)
.LBB2_2:
	lwz 3, 0(28)
	ld 6, 224(1)
	stw 3, 400(1)
	lwz 3, 4(28)
	lxvw4x 0, 0, 6
	ld 6, 216(1)
	stw 3, 272(1)
	lwz 3, 8(28)
	lxvw4x 1, 0, 6
	xxspltw 34, 0, 0
	ld 6, 208(1)
	stw 3, 288(1)
	lwz 3, 12(28)
	lxvw4x 2, 0, 6
	xxspltw 43, 1, 0
	ld 6, 200(1)
	stw 3, 304(1)
	lwz 3, 16(28)
	lxvw4x 3, 0, 6
	xxspltw 38, 2, 0
	ld 6, 192(1)
	stw 3, 320(1)
	lwz 3, 20(28)
	lxvw4x 4, 0, 6
	xxspltw 33, 3, 0
	ld 6, 184(1)
	stw 3, 336(1)
	lwz 3, 24(28)
	lxvw4x 0, 0, 6
	xxspltw 44, 4, 0
	ld 6, 176(1)
	stw 3, 352(1)
	lwz 3, 28(28)
	lxvw4x 1, 0, 6
	xxspltw 47, 0, 0
	stw 3, 368(1)
	ld 3, 168(1)
	xxspltw 45, 1, 0
	lxvw4x 2, 0, 3
	ld 3, 160(1)
	stw 29, 384(1)
	lxvw4x 0, 0, 3
	rldicl 3, 29, 32, 32
	xxspltw 48, 2, 0
	stw 3, 256(1)
	bc 12, 6, .LBB2_8
	xxspltw 36, 0, 0
	xxlor 35, 11, 11
	ld 3, 128(1)
	sldi 7, 4, 5
	xxlor 0, 10, 10
	ld 6, 8(20)
	add 9, 7, 9
	ld 7, 16(20)
	lxvw4x 0, 0, 3
	ld 3, 0(20)
	addi 0, 9, -8
	li 10, 0
	vadduwm 3, 4, 3
	ld 8, 24(20)
	mr	11, 21
	std 4, 232(1)
	xxlor 2, 35, 35
	xxspltw 37, 0, 0
	xxlxor 36, 35, 10
	xxlor 35, 12, 12
	vcmpgtsw 4, 3, 4
	vsubuwm 3, 5, 4
	xxlor 3, 35, 35
.LBB2_4:
	sldi 12, 10, 6
	addi 10, 10, 1
	add 9, 3, 12
	add 21, 6, 12
	add 4, 7, 12
	add 28, 8, 12
	lvx 4, 3, 12
	lvsl 14, 6, 12
	cmpld 5, 10, 27
	lvsl 19, 7, 12
	lvx 0, 9, 24
	lvx 5, 6, 12
	lvx 18, 21, 24
	lvx 29, 7, 12
	lvx 27, 4, 24
	lvx 28, 8, 12
	lvx 26, 28, 24
	vperm 31, 5, 18, 14
	lvx 25, 9, 19
	lvx 24, 21, 19
	vperm 5, 29, 27, 19
	lvx 22, 4, 19
	lvsl 8, 3, 12
	lvsl 30, 8, 12
	lvx 20, 28, 19
	vperm 29, 18, 24, 14
	lvx 7, 9, 18
	lvx 18, 21, 18
	vperm 23, 27, 22, 19
	lvx 9, 4, 18
	lvx 27, 28, 18
	vperm 4, 4, 0, 8
	lvx 10, 9, 17
	vperm 28, 28, 26, 30
	mr	9, 0
	vperm 0, 0, 25, 8
	vperm 21, 26, 20, 30
	vperm 26, 25, 7, 8
	vperm 8, 7, 10, 8
	lvx 7, 21, 17
	lvx 10, 4, 17
	vperm 25, 24, 18, 14
	vperm 18, 18, 7, 14
	lvx 7, 28, 17
	vperm 24, 22, 9, 19
	vperm 20, 20, 27, 30
	vperm 19, 9, 10, 19
	vperm 22, 27, 7, 30
	isel 4, 22, 31, 22
	or 11, 4, 11
	mtctr 16
.LBB2_5:
	ldu 4, 8(9)
	add 4, 4, 12
	addi 4, 4, 256
	dcbt 0, 4
	bdnz .LBB2_5
	vmrghw 7, 8, 18
	clrlwi	4, 11, 24
	mr	11, 30
	vmrghw 14, 4, 31
	stw 4, 240(1)
	addi 4, 1, 240
	vmrghw 3, 5, 28
	lxvw4x 0, 0, 4
	vmrglw 4, 4, 31
	vmrghw 31, 0, 29
	vmrglw 27, 0, 29
	xxlor 24, 39, 39
	vspltisw 7, 4
	vmrglw 0, 23, 21
	vmrglw 5, 5, 28
	vslw 17, 7, 7
	xxmrghd	39, 46, 35
	vmrghw 28, 23, 21
	vmrghw 23, 26, 25
	vmrglw 25, 26, 25
	vmrglw 26, 8, 18
	vadduwm 8, 12, 2
	vspltisw 9, 10
	vmrghw 21, 24, 20
	vmrglw 20, 24, 20
	vmrghw 24, 19, 22
	vmrglw 22, 19, 22
	vadduwm 11, 15, 11
	vspltisw 18, -16
	vmr	19, 15
	vadduwm 15, 1, 16
	xxmrghd	33, 36, 37
	xxlor 29, 48, 48
	vspltisw 16, 9
	vadduwm 8, 8, 7
	xxspltw 0, 0, 0
	xxlor 6, 44, 44
	xxmrghd	34, 63, 60
	vadduwm 12, 6, 13
	xxmrghd	38, 59, 32
	vadduwm 10, 9, 9
	vsubuwm 29, 16, 18
	xxmrgld	50, 59, 32
	xxlxor 48, 40, 2
	xxlor 41, 8, 8
	vadduwm 15, 15, 6
	vperm 16, 16, 16, 9
	vadduwm 11, 11, 1
	xxlor 5, 33, 33
	xxmrgld	33, 46, 35
	xxlxor 46, 47, 0
	xxmrgld	35, 36, 37
	vadduwm 12, 12, 2
	xxlor 4, 34, 34
	xxlxor 34, 43, 3
	vperm 14, 14, 14, 9
	vperm 2, 2, 2, 9
	xxlxor 37, 44, 49
	xxland 49, 48, 13
	lxvw4x 48, 0, 15
	xxlor 1, 2, 2
	vperm 5, 5, 5, 9
	xxlor 1, 3, 3
	vadduwm 4, 17, 16
	lxvw4x 48, 0, 5
	xxlor 1, 45, 45
	lxvw4x 45, 0, 14
	xxland 46, 46, 13
	xxland 34, 34, 13
	vadduwm 16, 14, 16
	vadduwm 11, 11, 3
	xxlor 7, 35, 35
	lxvw4x 35, 0, 25
	vadduwm 13, 2, 13
	vadduwm 8, 8, 1
	xxlor 25, 33, 33
	xxland 37, 37, 13
	xxlxor 33, 36, 6
	xxlxor 59, 48, 29
	xxlor 28, 38, 38
	xxlxor 38, 45, 51
	xxmrgld	51, 58, 54
	vadduwm 3, 5, 3
	vrlw 1, 1, 10
	vrlw 27, 27, 10
	vrlw 6, 6, 10
	xxlor 30, 39, 39
	xxmrgld	39, 63, 60
	xxlxor 63, 35, 1
	vadduwm 15, 15, 18
	vrlw 31, 31, 10
	vadduwm 8, 8, 1
	vadduwm 15, 15, 27
	vadduwm 11, 11, 6
	vadduwm 12, 12, 7
	xxlxor 49, 40, 49
	xxlxor 46, 47, 46
	xxlor 62, 9, 9
	xxlxor 34, 43, 34
	vadduwm 12, 12, 31
	vperm 17, 17, 17, 30
	vperm 14, 14, 14, 30
	vperm 0, 2, 2, 30
	xxlxor 37, 44, 37
	xxlor 26, 39, 39
	xxmrghd	39, 55, 53
	vperm 2, 5, 5, 30
	xxland 49, 49, 31
	xxmrghd	37, 57, 52
	xxland 46, 46, 31
	xxmrgld	55, 55, 53
	xxland 32, 32, 31
	xxmrgld	57, 57, 52
	vadduwm 8, 8, 7
	xxlor 27, 39, 39
	vadduwm 7, 4, 17
	vadduwm 16, 16, 14
	vadduwm 13, 13, 0
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 59, 48, 59
	xxlxor 38, 45, 38
	vadduwm 11, 11, 5
	xxlor 6, 37, 37
	vadduwm 5, 3, 2
	vrlw 4, 27, 29
	vrlw 1, 1, 29
	vrlw 3, 6, 29
	xxmrghd	38, 24, 56
	xxlxor 63, 37, 63
	xxmrghd	59, 58, 54
	xxlor 29, 24, 24
	vrlw 31, 31, 29
	vadduwm 12, 12, 6
	vadduwm 15, 15, 27
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 49, 43, 49
	vperm 14, 14, 14, 9
	vperm 17, 17, 17, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 13
	xxland 53, 49, 13
	xxmrgld	49, 29, 56
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	vadduwm 5, 5, 14
	vadduwm 16, 16, 21
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 12, 12, 17
	vadduwm 15, 15, 19
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 23
	vadduwm 11, 11, 25
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 46, 40, 46
	xxlxor 56, 43, 53
	vperm 14, 14, 14, 30
	vperm 24, 24, 24, 30
	xxland 32, 32, 31
	xxland 34, 34, 31
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 31
	xxland 56, 56, 31
	xxlxor 33, 45, 33
	xxlxor 36, 39, 36
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 1, 1, 29
	vrlw 4, 4, 29
	vmr	20, 23
	xxlor 54, 5, 5
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 55, 4, 4
	vadduwm 8, 8, 22
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 15, 15, 23
	xxlor 24, 38, 38
	xxlor 38, 7, 7
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 6
	vadduwm 12, 12, 18
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 9
	vperm 14, 14, 14, 9
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxland 56, 56, 13
	xxland 46, 46, 13
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 13
	xxland 34, 34, 13
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	xxlor 29, 49, 49
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 1, 1, 10
	vrlw 4, 4, 10
	xxlor 5, 50, 50
	xxlor 49, 28, 28
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	xxlor 50, 29, 29
	vadduwm 8, 8, 17
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 15, 15, 18
	xxlor 53, 6, 6
	xxlor 58, 30, 30
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 21
	vadduwm 12, 12, 26
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 30
	vperm 14, 14, 14, 30
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxland 56, 56, 31
	xxland 46, 46, 31
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 31
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 4, 4, 29
	vrlw 1, 1, 29
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	xxlor 60, 25, 25
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 12, 12, 20
	vadduwm 15, 15, 19
	vadduwm 8, 8, 28
	xxlor 60, 24, 24
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 11, 11, 28
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 9
	vperm 24, 24, 24, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 13
	xxland 56, 56, 13
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlor 28, 52, 52
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 52, 27, 27
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 12, 12, 27
	vadduwm 15, 15, 20
	xxlor 7, 25, 25
	xxlor 25, 51, 51
	xxlor 51, 26, 26
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 25
	vadduwm 11, 11, 19
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 30
	vperm 24, 24, 24, 30
	xxland 32, 32, 31
	xxland 34, 34, 31
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 31
	xxland 56, 56, 31
	xxlxor 33, 45, 33
	xxlxor 36, 39, 36
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 1, 1, 29
	vrlw 4, 4, 29
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 51, 5, 5
	vadduwm 8, 8, 6
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 15, 15, 19
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 21
	vadduwm 12, 12, 18
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 9
	vperm 14, 14, 14, 9
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxland 56, 56, 13
	xxland 46, 46, 13
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 13
	xxland 34, 34, 13
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 1, 1, 10
	vrlw 4, 4, 10
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vadduwm 8, 8, 23
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 15, 15, 27
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 28
	vadduwm 12, 12, 22
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 30
	vperm 14, 14, 14, 30
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxland 56, 56, 31
	xxland 46, 46, 31
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 31
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 4, 4, 29
	vrlw 1, 1, 29
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 12, 12, 25
	vadduwm 15, 15, 20
	xxlor 6, 38, 38
	vmr	6, 28
	xxlor 60, 28, 28
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 17
	vadduwm 11, 11, 28
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 9
	vperm 24, 24, 24, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 13
	xxland 56, 56, 13
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlor 30, 26, 26
	xxlor 26, 55, 55
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 55, 25, 25
	xxlor 50, 7, 7
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 12, 12, 23
	vadduwm 15, 15, 18
	xxlor 4, 29, 29
	xxlor 29, 49, 49
	xxlor 49, 30, 30
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 17
	vadduwm 11, 11, 26
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 30
	vperm 24, 24, 24, 30
	xxland 32, 32, 31
	xxland 34, 34, 31
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 31
	xxland 56, 56, 31
	xxlxor 33, 45, 33
	xxlxor 36, 39, 36
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 1, 1, 29
	vrlw 4, 4, 29
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 52, 4, 4
	vadduwm 8, 8, 21
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 15, 15, 20
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 6
	vadduwm 12, 12, 27
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 9
	vperm 14, 14, 14, 9
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxland 56, 56, 13
	xxland 46, 46, 13
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 13
	xxland 34, 34, 13
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 1, 1, 10
	vrlw 4, 4, 10
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vadduwm 8, 8, 19
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 15, 15, 23
	xxlor 7, 53, 53
	vmr	21, 6
	xxlor 38, 6, 6
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 28
	vadduwm 12, 12, 6
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 30
	vperm 14, 14, 14, 30
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxland 56, 56, 31
	xxland 46, 46, 31
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 31
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 4, 4, 29
	vrlw 1, 1, 29
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 12, 12, 17
	vadduwm 15, 15, 18
	xxlor 38, 26, 26
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 6
	vadduwm 11, 11, 25
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 9
	vperm 24, 24, 24, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 13
	xxland 56, 56, 13
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	xxlor 28, 27, 27
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlor 25, 6, 6
	xxlor 6, 26, 26
	xxlor 26, 50, 50
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 50, 28, 28
	xxlor 38, 29, 29
	xxlor 5, 54, 54
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 12, 12, 18
	vadduwm 15, 15, 6
	vmr	22, 27
	vmr	27, 25
	xxlor 57, 5, 5
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 26
	vadduwm 11, 11, 25
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 30
	vperm 24, 24, 24, 30
	xxland 32, 32, 31
	xxland 34, 34, 31
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 31
	xxland 56, 56, 31
	xxlxor 33, 45, 33
	xxlxor 36, 39, 36
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 1, 1, 29
	vrlw 4, 4, 29
	xxlor 27, 51, 51
	vmr	19, 23
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	vadduwm 8, 8, 21
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 15, 15, 22
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 28
	vadduwm 12, 12, 19
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 9
	vperm 14, 14, 14, 9
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxland 56, 56, 13
	xxland 46, 46, 13
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 13
	xxland 34, 34, 13
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 1, 1, 10
	vrlw 4, 4, 10
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vadduwm 8, 8, 20
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 15, 15, 18
	xxlor 5, 53, 53
	vmr	21, 22
	xxlor 54, 7, 7
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 27
	vadduwm 12, 12, 22
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 30
	vperm 14, 14, 14, 30
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxland 56, 56, 31
	xxland 46, 46, 31
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	vmr	23, 26
	xxland 32, 32, 31
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 4, 4, 29
	vrlw 1, 1, 29
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	xxlor 4, 30, 30
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 12, 12, 23
	vadduwm 15, 15, 6
	vmr	26, 28
	xxlor 49, 27, 27
	xxlor 60, 4, 4
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 17
	vadduwm 11, 11, 28
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 9
	vperm 24, 24, 24, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 13
	xxland 56, 56, 13
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlor 30, 51, 51
	vmr	19, 27
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 49, 26, 26
	xxlor 59, 6, 6
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 12, 12, 17
	vadduwm 15, 15, 27
	xxlor 38, 25, 25
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 25
	vadduwm 11, 11, 6
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 30
	vperm 24, 24, 24, 30
	xxland 32, 32, 31
	xxland 34, 34, 31
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 31
	xxland 56, 56, 31
	xxlxor 33, 45, 33
	xxlxor 36, 39, 36
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 1, 1, 29
	vrlw 4, 4, 29
	vadduwm 8, 8, 26
	xxlor 6, 58, 58
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 58, 30, 30
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 15, 15, 26
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 19
	vadduwm 12, 12, 18
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 9
	vperm 14, 14, 14, 9
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxland 56, 56, 13
	xxland 46, 46, 13
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 13
	xxland 34, 34, 13
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 1, 1, 10
	vrlw 4, 4, 10
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vadduwm 8, 8, 21
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 15, 15, 17
	xxlor 7, 55, 55
	vmr	23, 25
	xxlor 57, 5, 5
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 11, 11, 28
	vadduwm 12, 12, 25
	xxlxor 56, 40, 56
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 24, 24, 24, 30
	vperm 14, 14, 14, 30
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxland 56, 56, 31
	xxland 46, 46, 31
	vadduwm 7, 7, 24
	vadduwm 16, 16, 14
	xxland 32, 32, 31
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 4, 4, 29
	vrlw 1, 1, 29
	xxlxor 35, 45, 35
	xxlxor 63, 37, 63
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 12, 12, 23
	vadduwm 15, 15, 27
	xxlor 49, 7, 7
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 20
	vadduwm 11, 11, 17
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 9
	vperm 24, 24, 24, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	xxland 46, 46, 13
	xxland 56, 56, 13
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	xxlor 4, 29, 29
	vadduwm 5, 5, 14
	vadduwm 16, 16, 24
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlor 30, 53, 53
	xxlor 5, 59, 59
	vadduwm 8, 8, 6
	vmr	27, 6
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	xxlor 38, 4, 4
	xxlor 53, 27, 27
	vrlw 3, 3, 10
	vrlw 31, 31, 10
	vadduwm 12, 12, 6
	vadduwm 15, 15, 21
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 11, 11, 22
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 31
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 46, 40, 46
	xxlxor 56, 43, 56
	vperm 14, 14, 14, 30
	vperm 24, 24, 24, 30
	xxland 32, 32, 31
	xxland 34, 34, 31
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	vadduwm 11, 11, 28
	xxland 46, 46, 31
	xxland 60, 56, 31
	xxlxor 33, 45, 33
	xxlxor 36, 39, 36
	xxlor 50, 26, 26
	vadduwm 5, 5, 14
	vadduwm 16, 16, 28
	vrlw 1, 1, 29
	vrlw 4, 4, 29
	xxlxor 35, 37, 35
	xxlxor 63, 48, 63
	vadduwm 12, 12, 18
	xxlor 50, 28, 28
	vadduwm 8, 8, 19
	vrlw 3, 3, 29
	vrlw 31, 31, 29
	vadduwm 15, 15, 18
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	xxlxor 50, 40, 60
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 31
	vperm 18, 18, 18, 9
	vperm 14, 14, 14, 9
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxland 50, 50, 13
	xxland 46, 46, 13
	vadduwm 7, 7, 18
	vadduwm 16, 16, 14
	xxland 32, 32, 13
	xxland 34, 34, 13
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 1, 1, 10
	vrlw 4, 4, 10
	xxlxor 35, 45, 35
	xxlxor 51, 37, 63
	vadduwm 8, 8, 26
	vrlw 3, 3, 10
	vrlw 19, 19, 10
	vadduwm 15, 15, 6
	vadduwm 11, 11, 17
	xxlor 49, 6, 6
	vadduwm 8, 8, 1
	vadduwm 15, 15, 4
	vadduwm 12, 12, 17
	xxlxor 50, 40, 50
	xxlxor 46, 47, 46
	vadduwm 11, 11, 3
	vadduwm 12, 12, 19
	vperm 18, 18, 18, 30
	vperm 14, 14, 14, 30
	xxlxor 32, 43, 32
	xxlxor 34, 44, 34
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxland 50, 50, 31
	xxland 46, 46, 31
	vadduwm 7, 7, 18
	vadduwm 16, 16, 14
	xxland 32, 32, 31
	xxland 34, 34, 31
	xxlxor 33, 39, 33
	xxlxor 36, 48, 36
	vadduwm 13, 13, 0
	vadduwm 5, 5, 2
	vrlw 4, 4, 29
	vrlw 1, 1, 29
	xxlxor 35, 45, 35
	xxlxor 51, 37, 51
	vrlw 3, 3, 29
	vrlw 19, 19, 29
	vadduwm 12, 12, 27
	vadduwm 15, 15, 21
	xxlor 38, 30, 30
	vadduwm 12, 12, 4
	vadduwm 15, 15, 1
	vadduwm 8, 8, 6
	vadduwm 11, 11, 23
	xxlxor 32, 44, 32
	xxlxor 34, 47, 34
	vadduwm 8, 8, 3
	vadduwm 11, 11, 19
	vperm 0, 0, 0, 9
	vperm 2, 2, 2, 9
	xxlxor 46, 40, 46
	xxlxor 50, 43, 50
	vperm 14, 14, 14, 9
	vperm 18, 18, 18, 9
	xxland 32, 32, 13
	xxland 34, 34, 13
	vadduwm 7, 7, 0
	vadduwm 13, 13, 2
	vadduwm 6, 11, 25
	xxland 43, 46, 13
	xxland 46, 50, 13
	xxlxor 36, 39, 36
	xxlxor 33, 45, 33
	vadduwm 5, 5, 11
	vadduwm 16, 16, 14
	vrlw 4, 4, 10
	vrlw 1, 1, 10
	xxlxor 35, 37, 35
	xxlxor 50, 48, 51
	xxlor 41, 5, 5
	vrlw 3, 3, 10
	vrlw 18, 18, 10
	vadduwm 10, 12, 9
	vadduwm 12, 15, 20
	vadduwm 10, 10, 4
	vadduwm 12, 12, 1
	vadduwm 8, 8, 22
	xxlxor 32, 42, 32
	xxlxor 34, 44, 34
	vadduwm 8, 8, 3
	vadduwm 6, 6, 18
	vperm 0, 0, 0, 30
	vperm 2, 2, 2, 30
	xxlxor 43, 40, 43
	xxlxor 46, 38, 46
	vperm 15, 11, 11, 30
	vperm 14, 14, 14, 30
	xxland 32, 32, 31
	xxland 49, 34, 31
	vadduwm 2, 7, 0
	vadduwm 7, 13, 17
	xxlxor 36, 34, 36
	xxlxor 33, 39, 33
	xxlxor 43, 39, 38
	xxland 38, 47, 31
	xxland 39, 46, 31
	xxlxor 34, 34, 40
	vadduwm 5, 5, 6
	vadduwm 8, 16, 7
	xxlxor 35, 37, 35
	xxlxor 45, 40, 50
	vrlw 1, 1, 29
	vrlw 3, 3, 29
	vrlw 13, 13, 29
	vrlw 4, 4, 29
	xxlor 0, 13, 13
	xxlor 1, 31, 31
	xxlxor 1, 37, 42
	xxlxor 0, 40, 44
	xxlxor 44, 33, 39
	xxlor 33, 0, 0
	xxlxor 47, 35, 32
	xxlxor 45, 45, 49
	xxlxor 48, 36, 38
	xxlor 38, 1, 1
	xxlor 29, 28, 28
	bne	5, .LBB2_4
	ld 28, 152(1)
	ld 21, 144(1)
	ld 9, 136(1)
	ld 4, 232(1)
.LBB2_8:
	vmrghw 4, 6, 1
	addi 3, 29, 4
	addi 26, 26, -4
	li 6, 64
	vmrglw 5, 6, 1
	cmpldi 5, 26, 3
	addi 20, 20, 32
	addi 4, 4, 1
	vmrglw 6, 12, 15
	vmrglw 7, 13, 16
	vmrghw 3, 2, 11
	vmrglw 2, 2, 11
	vmrghw 0, 12, 15
	vmrghw 1, 13, 16
	iselgt	29, 3, 29
	li 3, 80
	xxmrghd	6, 38, 39
	xxmrghd	0, 35, 36
	xxmrgld	3, 34, 37
	xxmrgld	1, 35, 36
	stxvd2x 6, 23, 3
	li 3, 96
	xxmrghd	2, 34, 37
	stxvd2x 0, 0, 23
	xxmrghd	4, 32, 33
	stxvd2x 3, 23, 3
	li 3, 112
	xxmrgld	5, 32, 33
	stxvd2x 1, 23, 19
	xxmrgld	7, 38, 39
	stxvd2x 2, 23, 6
	stxvd2x 4, 23, 24
	stxvd2x 5, 23, 18
	stxvd2x 7, 23, 3
	addi 23, 23, 128
	bgt	5, .LBB2_2
	b .LBB2_10
.LBB2_9:
	mr	20, 9
.LBB2_10:
	cmpldi 1, 26, 0
	beq	1, .LBB2_18
	li 3, 0
	li 4, 1
	li 18, 16
	addi 25, 1, 432
	iselgt	19, 4, 3
.LBB2_12:
	lxvd2x 0, 28, 18
	lxvd2x 1, 0, 28
	mr	17, 27
	mr	3, 21
	ld 24, 0(20)
	stxvd2x 0, 25, 18
	stxvd2x 1, 0, 25
.LBB2_13:
	cmpldi	17, 1
	beq	0, .LBB2_15
	cmpldi	17, 0
	bne	0, .LBB2_16
	b .LBB2_17
.LBB2_15:
	or 3, 3, 22
.LBB2_16:
	clrldi	7, 3, 56
	mr	3, 25
	mr	4, 24
	li 5, 64
	mr	6, 29
	bl _blake3_compress_in_place_sse41
	addi 24, 24, 64
	addi 17, 17, -1
	mr	3, 30
	b .LBB2_13
.LBB2_17:
	lxvd2x 0, 25, 18
	addi 26, 26, -1
	add 29, 29, 19
	addi 20, 20, 8
	cmpldi	26, 0
	stxvd2x 0, 23, 18
	lxvd2x 0, 0, 25
	stxvd2x 0, 0, 23
	addi 23, 23, 32
	bne	0, .LBB2_12
.LBB2_18:
	li 3, 640
	lfd 31, 856(1)
	lfd 30, 848(1)
	lxvd2x 63, 1, 3
	li 3, 624
	lfd 29, 840(1)
	lxvd2x 62, 1, 3
	li 3, 608
	lfd 28, 832(1)
	lxvd2x 61, 1, 3
	li 3, 592
	lfd 27, 824(1)
	lxvd2x 60, 1, 3
	li 3, 576
	lfd 26, 816(1)
	lxvd2x 59, 1, 3
	li 3, 560
	lfd 25, 808(1)
	lxvd2x 58, 1, 3
	li 3, 544
	lfd 24, 800(1)
	lxvd2x 57, 1, 3
	li 3, 528
	ld 31, 792(1)
	lxvd2x 56, 1, 3
	li 3, 512
	ld 30, 784(1)
	lxvd2x 55, 1, 3
	li 3, 496
	ld 29, 776(1)
	lxvd2x 54, 1, 3
	li 3, 480
	ld 28, 768(1)
	lxvd2x 53, 1, 3
	li 3, 464
	ld 27, 760(1)
	lxvd2x 52, 1, 3
	ld 26, 752(1)
	ld 25, 744(1)
	ld 24, 736(1)
	ld 23, 728(1)
	ld 22, 720(1)
	ld 21, 712(1)
	ld 20, 704(1)
	ld 19, 696(1)
	ld 18, 688(1)
	ld 17, 680(1)
	ld 16, 672(1)
	ld 15, 664(1)
	ld 14, 656(1)
	addi 1, 1, 864
	ld 0, 16(1)
	mtlr 0
	blr
	.long	0
	.quad	0
.Lfunc_end2:
	.size	_blake3_hash_many_sse41, .Lfunc_end2-.Lfunc_begin2
	.cfi_endproc

#endif
