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
 * This is converted assembly: SSE2 -> POWER7 PPC64le
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if (defined(__PPC64__) && defined(__LITTLE_ENDIAN__))

.text
	.abiversion 2
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	15
	.byte	14
	.byte	13
	.byte	12
	.byte	19
	.byte	18
	.byte	17
	.byte	16
.LCPI0_1:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	15
	.byte	14
	.byte	13
	.byte	12
.LCPI0_2:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	15
	.byte	14
	.byte	13
	.byte	12
	.byte	7
	.byte	6
	.byte	5
	.byte	4
.LCPI0_3:
	.byte	29
	.byte	28
	.byte	31
	.byte	30
	.byte	25
	.byte	24
	.byte	27
	.byte	26
	.byte	21
	.byte	20
	.byte	23
	.byte	22
	.byte	17
	.byte	16
	.byte	19
	.byte	18
.LCPI0_4:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI0_5:
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI0_6:
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	27
	.byte	26
	.byte	25
	.byte	24
.LCPI0_7:
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI0_8:
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI0_9:
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	30
	.byte	29
	.byte	28
.LCPI0_10:
	.short	1
	.short	2
	.short	4
	.short	8
	.short	16
	.short	32
	.short	64
	.short	128
.LCPI0_11:
	.short	0
	.short	0
	.short	4
	.short	8
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI0_12:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI0_13:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	27
	.byte	26
	.byte	25
	.byte	24
.LCPI0_14:
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.text
	.globl	_blake3_compress_in_place_sse2
	.p2align	2
	.type	_blake3_compress_in_place_sse2,@function
_blake3_compress_in_place_sse2:
.Lfunc_begin0:
.Lfunc_gep0:
	addis 2, 12, .TOC.-.Lfunc_gep0@ha
	addi 2, 2, .TOC.-.Lfunc_gep0@l
.Lfunc_lep0:
	.localentry	_blake3_compress_in_place_sse2, .Lfunc_lep0-.Lfunc_gep0
	li 8, -48
	rldicl 9, 6, 32, 32
	lxvd2x 0, 0, 3
	vspltisw 12, -16
	stxvd2x 61, 1, 8
	li 8, -32
	stxvd2x 62, 1, 8
	li 8, -16
	stxvd2x 63, 1, 8
	li 8, 16
	lxvd2x 1, 3, 8
	stw 6, -80(1)
	addi 6, 1, -80
	vspltisw 13, 9
	stw 9, -64(1)
	addi 9, 1, -64
	lvx 2, 0, 6
	lvx 3, 0, 9
	addis 6, 2, .LCPI0_0@toc@ha
	addi 9, 1, -96
	addi 6, 6, .LCPI0_0@toc@l
	stw 5, -96(1)
	addis 5, 2, .LCPI0_2@toc@ha
	vmrglw 2, 3, 2
	lvx 3, 0, 6
	lvx 4, 0, 9
	addis 6, 2, .LCPI0_1@toc@ha
	addi 5, 5, .LCPI0_2@toc@l
	stw 7, -112(1)
	addi 6, 6, .LCPI0_1@toc@l
	lvx 5, 0, 5
	addi 5, 1, -112
	addis 7, 2, .LCPI0_8@toc@ha
	lxvd2x 2, 0, 4
	lxvd2x 3, 4, 8
	lvx 1, 0, 6
	lvx 6, 0, 5
	addis 5, 2, .LCPI0_3@toc@ha
	addis 6, 2, .LCPI0_5@toc@ha
	addi 5, 5, .LCPI0_3@toc@l
	addi 6, 6, .LCPI0_5@toc@l
	xxswapd	32, 3
	lvx 10, 0, 6
	li 6, 48
	vperm 3, 4, 2, 3
	xxswapd	36, 2
	vperm 8, 0, 4, 5
	vperm 10, 0, 4, 10
	vperm 3, 6, 3, 1
	xxswapd	33, 0
	xxswapd	38, 1
	lxvd2x 1, 4, 6
	addis 6, 2, .LCPI0_11@toc@ha
	addi 6, 6, .LCPI0_11@toc@l
	vadduwm 1, 8, 1
	xxswapd	43, 1
	xxpermdi 35, 35, 34, 1
	vadduwm 1, 1, 6
	lvx 2, 0, 5
	addis 5, 2, .LCPI0_4@toc@ha
	addi 5, 5, .LCPI0_4@toc@l
	lvx 9, 0, 5
	li 5, 32
	xxlxor 35, 33, 35
	lxvd2x 0, 4, 5
	addis 4, 2, .LCPI0_6@toc@ha
	addis 5, 2, .LCPI0_10@toc@ha
	vadduwm 1, 1, 10
	addi 4, 4, .LCPI0_6@toc@l
	addi 5, 5, .LCPI0_10@toc@l
	vperm 7, 3, 3, 2
	lvx 17, 0, 5
	vspltisw 3, 10
	vadduwm 3, 3, 3
	vadduwm 9, 7, 9
	xxlxor 36, 41, 38
	vrlw 0, 4, 3
	vspltisw 4, 12
	vadduwm 4, 4, 4
	vadduwm 1, 0, 1
	xxlxor 38, 33, 39
	xxswapd	39, 0
	vrlw 6, 6, 4
	vperm 14, 11, 7, 5
	vsubuwm 5, 13, 12
	lvx 12, 0, 4
	addis 4, 2, .LCPI0_7@toc@ha
	addi 4, 4, .LCPI0_7@toc@l
	vperm 12, 7, 11, 12
	vadduwm 9, 6, 9
	xxswapd	0, 38
	vadduwm 1, 1, 14
	xxsldwi 46, 46, 46, 1
	xxlxor 32, 41, 32
	xxsldwi 41, 41, 41, 3
	xxsldwi 33, 33, 33, 1
	vrlw 0, 0, 5
	vadduwm 1, 0, 1
	xxlxor 38, 33, 0
	vperm 6, 6, 6, 2
	vadduwm 9, 6, 9
	xxlxor 32, 41, 32
	vrlw 7, 0, 3
	vadduwm 0, 1, 12
	vadduwm 1, 7, 0
	xxlxor 32, 33, 38
	vrlw 6, 0, 4
	lvx 0, 0, 4
	addis 4, 2, .LCPI0_9@toc@ha
	addi 4, 4, .LCPI0_9@toc@l
	vperm 13, 10, 8, 0
	vadduwm 9, 6, 9
	xxswapd	0, 38
	xxlxor 39, 41, 39
	xxsldwi 41, 41, 41, 1
	vadduwm 1, 1, 13
	xxsldwi 45, 45, 45, 3
	vrlw 11, 7, 5
	xxsldwi 33, 33, 33, 3
	vadduwm 15, 11, 1
	lvx 1, 0, 4
	addi 4, 7, .LCPI0_8@toc@l
	lvx 7, 0, 4
	addis 4, 2, .LCPI0_12@toc@ha
	xxlxor 38, 47, 0
	addi 4, 4, .LCPI0_12@toc@l
	vperm 8, 8, 8, 1
	vperm 16, 6, 6, 2
	lvx 6, 0, 6
	vperm 18, 12, 14, 7
	vcmpequh 6, 6, 17
	vadduwm 19, 16, 9
	xxlxor 41, 51, 43
	xxsel 43, 40, 50, 38
	vrlw 31, 9, 3
	lvx 9, 0, 4
	addis 4, 2, .LCPI0_13@toc@ha
	vadduwm 8, 15, 11
	addi 4, 4, .LCPI0_13@toc@l
	vadduwm 15, 31, 8
	vcmpequh 8, 9, 17
	xxlxor 41, 47, 48
	xxmrgld	49, 42, 44
	xxsldwi 47, 47, 47, 1
	vmrghw 12, 12, 10
	vrlw 16, 9, 4
	lvx 9, 0, 4
	addis 4, 2, .LCPI0_14@toc@ha
	addi 4, 4, .LCPI0_14@toc@l
	xxsel 49, 49, 46, 40
	vadduwm 18, 16, 19
	xxswapd	0, 48
	vperm 17, 17, 17, 9
	xxlxor 51, 50, 63
	xxsldwi 50, 50, 50, 3
	vrlw 19, 19, 5
	vadduwm 15, 15, 17
	vadduwm 15, 19, 15
	xxlxor 42, 47, 0
	vperm 16, 10, 10, 2
	lvx 10, 0, 4
	vperm 31, 12, 14, 10
	vmrglw 12, 14, 12
	vadduwm 14, 16, 18
	xxlxor 50, 46, 51
	vrlw 18, 18, 3
	xxmrgld	51, 44, 63
	vadduwm 12, 15, 19
	vadduwm 12, 18, 12
	xxlxor 47, 44, 48
	vperm 16, 11, 13, 0
	vrlw 15, 15, 4
	vperm 13, 13, 13, 1
	vadduwm 12, 12, 16
	vadduwm 14, 15, 14
	xxswapd	0, 47
	xxsldwi 44, 44, 44, 3
	xxlxor 50, 46, 50
	vrlw 18, 18, 5
	vadduwm 15, 18, 12
	xxlxor 44, 47, 0
	vperm 30, 12, 12, 2
	xxsldwi 44, 46, 46, 1
	vperm 14, 19, 17, 7
	vadduwm 29, 30, 12
	xxlxor 44, 61, 50
	vrlw 18, 12, 3
	xxsel 44, 45, 46, 38
	vadduwm 13, 15, 12
	xxmrgld	47, 43, 63
	vmrghw 11, 19, 11
	vadduwm 13, 18, 13
	xxsel 47, 47, 49, 40
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vrlw 14, 14, 4
	vperm 15, 15, 15, 9
	vadduwm 31, 14, 29
	xxswapd	0, 46
	vadduwm 13, 13, 15
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 11, 17, 10
	vrlw 18, 18, 5
	vmrglw 11, 17, 11
	vadduwm 13, 18, 13
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 17, 14, 19
	xxmrgld	51, 43, 63
	xxlxor 50, 49, 50
	vadduwm 11, 13, 19
	vrlw 18, 18, 3
	vadduwm 11, 18, 11
	xxlxor 45, 43, 46
	xxsldwi 46, 48, 48, 3
	vrlw 13, 13, 4
	vperm 16, 12, 14, 0
	vperm 14, 14, 14, 1
	vadduwm 17, 13, 17
	xxswapd	0, 45
	vadduwm 11, 11, 16
	xxlxor 50, 49, 50
	xxsldwi 43, 43, 43, 3
	vrlw 18, 18, 5
	vadduwm 13, 18, 11
	xxlxor 43, 45, 0
	vperm 30, 11, 11, 2
	xxsldwi 43, 49, 49, 1
	vperm 17, 19, 15, 7
	vadduwm 29, 30, 11
	xxlxor 43, 61, 50
	vrlw 18, 11, 3
	xxsel 43, 46, 49, 38
	xxmrgld	49, 44, 63
	vmrghw 12, 19, 12
	vadduwm 13, 13, 11
	xxsel 49, 49, 47, 40
	vadduwm 13, 18, 13
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vperm 17, 17, 17, 9
	vrlw 14, 14, 4
	vadduwm 13, 13, 17
	vadduwm 31, 14, 29
	xxswapd	0, 46
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 12, 15, 10
	vrlw 18, 18, 5
	vmrglw 12, 15, 12
	vadduwm 13, 18, 13
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 15, 14, 19
	xxmrgld	51, 44, 63
	xxlxor 50, 47, 50
	vadduwm 12, 13, 19
	vrlw 18, 18, 3
	vadduwm 12, 18, 12
	xxlxor 45, 44, 46
	xxsldwi 46, 48, 48, 3
	vrlw 13, 13, 4
	vperm 16, 11, 14, 0
	vperm 14, 14, 14, 1
	vadduwm 15, 13, 15
	xxswapd	0, 45
	vadduwm 12, 12, 16
	xxlxor 50, 47, 50
	xxsldwi 44, 44, 44, 3
	vrlw 18, 18, 5
	vadduwm 13, 18, 12
	xxlxor 44, 45, 0
	vperm 30, 12, 12, 2
	xxsldwi 44, 47, 47, 1
	vperm 15, 19, 17, 7
	vadduwm 29, 30, 12
	xxlxor 44, 61, 50
	vrlw 18, 12, 3
	xxsel 44, 46, 47, 38
	xxmrgld	47, 43, 63
	vmrghw 11, 19, 11
	vadduwm 13, 13, 12
	xxsel 47, 47, 49, 40
	vadduwm 13, 18, 13
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vperm 15, 15, 15, 9
	vrlw 14, 14, 4
	vadduwm 13, 13, 15
	vadduwm 31, 14, 29
	xxswapd	0, 46
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 11, 17, 10
	vrlw 18, 18, 5
	vmrglw 11, 17, 11
	vadduwm 13, 18, 13
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 17, 14, 19
	xxmrgld	51, 43, 63
	xxlxor 50, 49, 50
	vadduwm 11, 13, 19
	vrlw 18, 18, 3
	vadduwm 11, 18, 11
	xxlxor 45, 43, 46
	xxsldwi 46, 48, 48, 3
	vrlw 13, 13, 4
	vperm 16, 12, 14, 0
	vperm 14, 14, 14, 1
	vadduwm 17, 13, 17
	xxswapd	0, 45
	vadduwm 11, 11, 16
	xxsldwi 48, 48, 48, 3
	xxlxor 50, 49, 50
	xxsldwi 43, 43, 43, 3
	vrlw 18, 18, 5
	vperm 1, 16, 16, 1
	vadduwm 13, 18, 11
	xxlxor 43, 45, 0
	vperm 30, 11, 11, 2
	xxsldwi 43, 49, 49, 1
	vperm 17, 19, 15, 7
	vadduwm 29, 30, 11
	xxlxor 43, 61, 50
	vrlw 18, 11, 3
	xxsel 43, 46, 49, 38
	xxmrgld	49, 44, 63
	vmrghw 12, 19, 12
	vadduwm 13, 13, 11
	xxsel 49, 49, 47, 40
	vperm 0, 11, 16, 0
	vadduwm 13, 18, 13
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vperm 30, 17, 17, 9
	vrlw 14, 14, 4
	vadduwm 13, 13, 30
	vadduwm 31, 14, 29
	xxswapd	0, 46
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 12, 15, 10
	vrlw 18, 18, 5
	vmrglw 12, 15, 12
	vadduwm 13, 18, 13
	xxmrgld	44, 44, 63
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 13, 13, 12
	vperm 7, 12, 30, 7
	vadduwm 15, 14, 19
	xxlxor 50, 47, 50
	xxsel 33, 33, 39, 38
	xxmrgld	38, 43, 63
	vrlw 18, 18, 3
	xxsel 38, 38, 62, 40
	vperm 6, 6, 6, 9
	vadduwm 13, 18, 13
	xxlxor 46, 45, 46
	vadduwm 0, 13, 0
	vrlw 14, 14, 4
	xxsldwi 32, 32, 32, 3
	vadduwm 15, 14, 15
	xxswapd	0, 46
	xxlxor 50, 47, 50
	xxsldwi 46, 47, 47, 1
	vrlw 18, 18, 5
	vadduwm 0, 18, 0
	xxlxor 45, 32, 0
	vadduwm 0, 0, 1
	vperm 13, 13, 13, 2
	vadduwm 14, 13, 14
	xxlxor 47, 46, 50
	vrlw 15, 15, 3
	vadduwm 0, 15, 0
	xxlxor 33, 32, 45
	xxsldwi 32, 32, 32, 1
	vrlw 1, 1, 4
	vadduwm 0, 0, 6
	vmrghw 6, 12, 11
	vadduwm 7, 1, 14
	xxswapd	0, 33
	xxlxor 40, 39, 47
	vrlw 8, 8, 5
	vadduwm 0, 8, 0
	xxlxor 33, 32, 0
	vperm 2, 1, 1, 2
	xxsldwi 33, 39, 39, 3
	vperm 7, 6, 30, 10
	vmrglw 6, 17, 6
	vadduwm 1, 2, 1
	xxlxor 40, 33, 40
	xxmrgld	38, 38, 39
	vrlw 3, 8, 3
	vadduwm 0, 0, 6
	vadduwm 0, 3, 0
	xxlxor 34, 32, 34
	xxsldwi 0, 32, 32, 3
	vrlw 2, 2, 4
	vadduwm 4, 2, 1
	xxswapd	2, 34
	xxlxor 35, 36, 35
	xxsldwi 1, 36, 36, 1
	vrlw 3, 3, 5
	xxlxor 0, 1, 0
	xxswapd	0, 0
	xxlxor 1, 35, 2
	stxvd2x 0, 0, 3
	xxswapd	1, 1
	stxvd2x 1, 3, 8
	li 3, -16
	lxvd2x 63, 1, 3
	li 3, -32
	lxvd2x 62, 1, 3
	li 3, -48
	lxvd2x 61, 1, 3
	blr
	.long	0
	.quad	0
.Lfunc_end0:
	.size	_blake3_compress_in_place_sse2, .Lfunc_end0-.Lfunc_begin0

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	15
	.byte	14
	.byte	13
	.byte	12
	.byte	19
	.byte	18
	.byte	17
	.byte	16
.LCPI1_1:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	15
	.byte	14
	.byte	13
	.byte	12
.LCPI1_2:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	15
	.byte	14
	.byte	13
	.byte	12
	.byte	7
	.byte	6
	.byte	5
	.byte	4
.LCPI1_3:
	.byte	29
	.byte	28
	.byte	31
	.byte	30
	.byte	25
	.byte	24
	.byte	27
	.byte	26
	.byte	21
	.byte	20
	.byte	23
	.byte	22
	.byte	17
	.byte	16
	.byte	19
	.byte	18
.LCPI1_4:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI1_5:
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI1_6:
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	27
	.byte	26
	.byte	25
	.byte	24
.LCPI1_7:
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI1_8:
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI1_9:
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	30
	.byte	29
	.byte	28
.LCPI1_10:
	.short	1
	.short	2
	.short	4
	.short	8
	.short	16
	.short	32
	.short	64
	.short	128
.LCPI1_11:
	.short	0
	.short	0
	.short	4
	.short	8
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI1_12:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI1_13:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	27
	.byte	26
	.byte	25
	.byte	24
.LCPI1_14:
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.text
	.globl	_blake3_compress_xof_sse2
	.p2align	2
	.type	_blake3_compress_xof_sse2,@function
_blake3_compress_xof_sse2:
.Lfunc_begin1:
.Lfunc_gep1:
	addis 2, 12, .TOC.-.Lfunc_gep1@ha
	addi 2, 2, .TOC.-.Lfunc_gep1@l
.Lfunc_lep1:
	.localentry	_blake3_compress_xof_sse2, .Lfunc_lep1-.Lfunc_gep1
	li 9, -48
	rldicl 10, 6, 32, 32
	lxvd2x 0, 0, 3
	vspltisw 12, -16
	stxvd2x 61, 1, 9
	li 9, -32
	stxvd2x 62, 1, 9
	li 9, -16
	stxvd2x 63, 1, 9
	li 9, 16
	lxvd2x 1, 3, 9
	stw 6, -80(1)
	addi 6, 1, -80
	vspltisw 13, 9
	stw 10, -64(1)
	addi 10, 1, -64
	lvx 2, 0, 6
	lvx 3, 0, 10
	addis 6, 2, .LCPI1_0@toc@ha
	addi 10, 1, -96
	addi 6, 6, .LCPI1_0@toc@l
	stw 5, -96(1)
	addis 5, 2, .LCPI1_2@toc@ha
	vmrglw 2, 3, 2
	lvx 3, 0, 6
	lvx 4, 0, 10
	addis 6, 2, .LCPI1_1@toc@ha
	addi 5, 5, .LCPI1_2@toc@l
	addis 10, 2, .LCPI1_11@toc@ha
	stw 7, -112(1)
	addi 6, 6, .LCPI1_1@toc@l
	lvx 5, 0, 5
	addi 5, 1, -112
	addis 7, 2, .LCPI1_10@toc@ha
	addi 10, 10, .LCPI1_11@toc@l
	lxvd2x 2, 0, 4
	lxvd2x 3, 4, 9
	addi 7, 7, .LCPI1_10@toc@l
	lvx 1, 0, 6
	lvx 6, 0, 5
	addis 5, 2, .LCPI1_3@toc@ha
	addis 6, 2, .LCPI1_5@toc@ha
	addi 5, 5, .LCPI1_3@toc@l
	addi 6, 6, .LCPI1_5@toc@l
	lvx 17, 0, 7
	xxswapd	32, 3
	lvx 10, 0, 6
	li 6, 32
	vperm 3, 4, 2, 3
	xxswapd	36, 2
	vperm 8, 0, 4, 5
	vperm 10, 0, 4, 10
	vperm 3, 6, 3, 1
	xxswapd	33, 0
	lxvd2x 0, 4, 6
	xxswapd	38, 1
	vadduwm 1, 8, 1
	xxpermdi 35, 35, 34, 1
	vadduwm 1, 1, 6
	lvx 2, 0, 5
	addis 5, 2, .LCPI1_4@toc@ha
	addi 5, 5, .LCPI1_4@toc@l
	lvx 9, 0, 5
	li 5, 48
	xxlxor 35, 33, 35
	lxvd2x 1, 4, 5
	addis 4, 2, .LCPI1_6@toc@ha
	vadduwm 1, 1, 10
	addi 4, 4, .LCPI1_6@toc@l
	vperm 7, 3, 3, 2
	vspltisw 3, 10
	xxswapd	43, 1
	vadduwm 3, 3, 3
	vadduwm 9, 7, 9
	xxlxor 36, 41, 38
	vrlw 0, 4, 3
	vspltisw 4, 12
	vadduwm 4, 4, 4
	vadduwm 1, 0, 1
	xxlxor 38, 33, 39
	xxswapd	39, 0
	vrlw 6, 6, 4
	vperm 14, 11, 7, 5
	vsubuwm 5, 13, 12
	lvx 12, 0, 4
	addis 4, 2, .LCPI1_7@toc@ha
	addi 4, 4, .LCPI1_7@toc@l
	vperm 12, 7, 11, 12
	vadduwm 9, 6, 9
	xxswapd	0, 38
	vadduwm 1, 1, 14
	xxsldwi 46, 46, 46, 1
	xxlxor 32, 41, 32
	xxsldwi 41, 41, 41, 3
	xxsldwi 33, 33, 33, 1
	vrlw 0, 0, 5
	vadduwm 1, 0, 1
	xxlxor 38, 33, 0
	vperm 6, 6, 6, 2
	vadduwm 9, 6, 9
	xxlxor 32, 41, 32
	vrlw 7, 0, 3
	vadduwm 0, 1, 12
	vadduwm 1, 7, 0
	xxlxor 32, 33, 38
	vrlw 6, 0, 4
	lvx 0, 0, 4
	addis 4, 2, .LCPI1_9@toc@ha
	addi 4, 4, .LCPI1_9@toc@l
	vperm 13, 10, 8, 0
	vadduwm 9, 6, 9
	xxswapd	0, 38
	xxlxor 39, 41, 39
	xxsldwi 41, 41, 41, 1
	vadduwm 1, 1, 13
	xxsldwi 45, 45, 45, 3
	vrlw 11, 7, 5
	xxsldwi 33, 33, 33, 3
	vadduwm 15, 11, 1
	lvx 1, 0, 4
	addis 4, 2, .LCPI1_8@toc@ha
	addi 4, 4, .LCPI1_8@toc@l
	xxlxor 38, 47, 0
	lvx 7, 0, 4
	addis 4, 2, .LCPI1_12@toc@ha
	vperm 8, 8, 8, 1
	addi 4, 4, .LCPI1_12@toc@l
	vperm 16, 6, 6, 2
	lvx 6, 0, 10
	vperm 18, 12, 14, 7
	vcmpequh 6, 6, 17
	vadduwm 19, 16, 9
	xxlxor 41, 51, 43
	xxsel 43, 40, 50, 38
	vrlw 31, 9, 3
	lvx 9, 0, 4
	addis 4, 2, .LCPI1_13@toc@ha
	vadduwm 8, 15, 11
	addi 4, 4, .LCPI1_13@toc@l
	vadduwm 15, 31, 8
	vcmpequh 8, 9, 17
	xxlxor 41, 47, 48
	xxmrgld	49, 42, 44
	xxsldwi 47, 47, 47, 1
	vmrghw 12, 12, 10
	vrlw 16, 9, 4
	lvx 9, 0, 4
	addis 4, 2, .LCPI1_14@toc@ha
	addi 4, 4, .LCPI1_14@toc@l
	xxsel 49, 49, 46, 40
	vadduwm 18, 16, 19
	xxswapd	0, 48
	vperm 17, 17, 17, 9
	xxlxor 51, 50, 63
	xxsldwi 50, 50, 50, 3
	vrlw 19, 19, 5
	vadduwm 15, 15, 17
	vadduwm 15, 19, 15
	xxlxor 42, 47, 0
	vperm 16, 10, 10, 2
	lvx 10, 0, 4
	vperm 31, 12, 14, 10
	vmrglw 12, 14, 12
	vadduwm 14, 16, 18
	xxlxor 50, 46, 51
	vrlw 18, 18, 3
	xxmrgld	51, 44, 63
	vadduwm 12, 15, 19
	vadduwm 12, 18, 12
	xxlxor 47, 44, 48
	vperm 16, 11, 13, 0
	vrlw 15, 15, 4
	vperm 13, 13, 13, 1
	vadduwm 12, 12, 16
	vadduwm 14, 15, 14
	xxswapd	0, 47
	xxsldwi 44, 44, 44, 3
	xxlxor 50, 46, 50
	vrlw 18, 18, 5
	vadduwm 15, 18, 12
	xxlxor 44, 47, 0
	vperm 30, 12, 12, 2
	xxsldwi 44, 46, 46, 1
	vperm 14, 19, 17, 7
	vadduwm 29, 30, 12
	xxlxor 44, 61, 50
	vrlw 18, 12, 3
	xxsel 44, 45, 46, 38
	vadduwm 13, 15, 12
	xxmrgld	47, 43, 63
	vmrghw 11, 19, 11
	vadduwm 13, 18, 13
	xxsel 47, 47, 49, 40
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vrlw 14, 14, 4
	vperm 15, 15, 15, 9
	vadduwm 31, 14, 29
	xxswapd	0, 46
	vadduwm 13, 13, 15
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 11, 17, 10
	vrlw 18, 18, 5
	vmrglw 11, 17, 11
	vadduwm 13, 18, 13
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 17, 14, 19
	xxmrgld	51, 43, 63
	xxlxor 50, 49, 50
	vadduwm 11, 13, 19
	vrlw 18, 18, 3
	vadduwm 11, 18, 11
	xxlxor 45, 43, 46
	xxsldwi 46, 48, 48, 3
	vrlw 13, 13, 4
	vperm 16, 12, 14, 0
	vperm 14, 14, 14, 1
	vadduwm 17, 13, 17
	xxswapd	0, 45
	vadduwm 11, 11, 16
	xxlxor 50, 49, 50
	xxsldwi 43, 43, 43, 3
	vrlw 18, 18, 5
	vadduwm 13, 18, 11
	xxlxor 43, 45, 0
	vperm 30, 11, 11, 2
	xxsldwi 43, 49, 49, 1
	vperm 17, 19, 15, 7
	vadduwm 29, 30, 11
	xxlxor 43, 61, 50
	vrlw 18, 11, 3
	xxsel 43, 46, 49, 38
	xxmrgld	49, 44, 63
	vmrghw 12, 19, 12
	vadduwm 13, 13, 11
	xxsel 49, 49, 47, 40
	vadduwm 13, 18, 13
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vperm 17, 17, 17, 9
	vrlw 14, 14, 4
	vadduwm 13, 13, 17
	vadduwm 31, 14, 29
	xxswapd	0, 46
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 12, 15, 10
	vrlw 18, 18, 5
	vmrglw 12, 15, 12
	vadduwm 13, 18, 13
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 15, 14, 19
	xxmrgld	51, 44, 63
	xxlxor 50, 47, 50
	vadduwm 12, 13, 19
	vrlw 18, 18, 3
	vadduwm 12, 18, 12
	xxlxor 45, 44, 46
	xxsldwi 46, 48, 48, 3
	vrlw 13, 13, 4
	vperm 16, 11, 14, 0
	vperm 14, 14, 14, 1
	vadduwm 15, 13, 15
	xxswapd	0, 45
	vadduwm 12, 12, 16
	xxlxor 50, 47, 50
	xxsldwi 44, 44, 44, 3
	vrlw 18, 18, 5
	vadduwm 13, 18, 12
	xxlxor 44, 45, 0
	vperm 30, 12, 12, 2
	xxsldwi 44, 47, 47, 1
	vperm 15, 19, 17, 7
	vadduwm 29, 30, 12
	xxlxor 44, 61, 50
	vrlw 18, 12, 3
	xxsel 44, 46, 47, 38
	xxmrgld	47, 43, 63
	vmrghw 11, 19, 11
	vadduwm 13, 13, 12
	xxsel 47, 47, 49, 40
	vadduwm 13, 18, 13
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vperm 15, 15, 15, 9
	vrlw 14, 14, 4
	vadduwm 13, 13, 15
	vadduwm 31, 14, 29
	xxswapd	0, 46
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 11, 17, 10
	vrlw 18, 18, 5
	vmrglw 11, 17, 11
	vadduwm 13, 18, 13
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 17, 14, 19
	xxmrgld	51, 43, 63
	xxlxor 50, 49, 50
	vadduwm 11, 13, 19
	vrlw 18, 18, 3
	vadduwm 11, 18, 11
	xxlxor 45, 43, 46
	xxsldwi 46, 48, 48, 3
	vrlw 13, 13, 4
	vperm 16, 12, 14, 0
	vperm 14, 14, 14, 1
	vadduwm 17, 13, 17
	xxswapd	0, 45
	vadduwm 11, 11, 16
	xxsldwi 48, 48, 48, 3
	xxlxor 50, 49, 50
	xxsldwi 43, 43, 43, 3
	vrlw 18, 18, 5
	vperm 1, 16, 16, 1
	vadduwm 13, 18, 11
	xxlxor 43, 45, 0
	vperm 30, 11, 11, 2
	xxsldwi 43, 49, 49, 1
	vperm 17, 19, 15, 7
	vadduwm 29, 30, 11
	xxlxor 43, 61, 50
	vrlw 18, 11, 3
	xxsel 43, 46, 49, 38
	xxmrgld	49, 44, 63
	vmrghw 12, 19, 12
	vadduwm 13, 13, 11
	xxsel 49, 49, 47, 40
	vperm 0, 11, 16, 0
	vadduwm 13, 18, 13
	xxlxor 46, 45, 62
	xxsldwi 45, 45, 45, 1
	vperm 30, 17, 17, 9
	vrlw 14, 14, 4
	vadduwm 13, 13, 30
	vadduwm 31, 14, 29
	xxswapd	0, 46
	xxlxor 50, 63, 50
	xxsldwi 51, 63, 63, 3
	vperm 31, 12, 15, 10
	vrlw 18, 18, 5
	vmrglw 12, 15, 12
	vadduwm 13, 18, 13
	xxmrgld	44, 44, 63
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	vadduwm 13, 13, 12
	vperm 7, 12, 30, 7
	vadduwm 15, 14, 19
	xxlxor 50, 47, 50
	xxsel 33, 33, 39, 38
	xxmrgld	38, 43, 63
	vrlw 18, 18, 3
	xxsel 38, 38, 62, 40
	vperm 6, 6, 6, 9
	vadduwm 13, 18, 13
	xxlxor 46, 45, 46
	vadduwm 0, 13, 0
	vrlw 14, 14, 4
	xxsldwi 32, 32, 32, 3
	vadduwm 15, 14, 15
	xxswapd	0, 46
	xxlxor 50, 47, 50
	xxsldwi 46, 47, 47, 1
	vrlw 18, 18, 5
	vadduwm 0, 18, 0
	xxlxor 45, 32, 0
	vadduwm 0, 0, 1
	vperm 13, 13, 13, 2
	vadduwm 14, 13, 14
	xxlxor 47, 46, 50
	vrlw 15, 15, 3
	vadduwm 0, 15, 0
	xxlxor 33, 32, 45
	xxsldwi 32, 32, 32, 1
	vrlw 1, 1, 4
	vadduwm 0, 0, 6
	vmrghw 6, 12, 11
	vadduwm 7, 1, 14
	xxswapd	0, 33
	xxlxor 40, 39, 47
	vrlw 8, 8, 5
	vadduwm 0, 8, 0
	xxlxor 33, 32, 0
	vperm 2, 1, 1, 2
	xxsldwi 33, 39, 39, 3
	vperm 7, 6, 30, 10
	vmrglw 6, 17, 6
	vadduwm 1, 2, 1
	xxlxor 40, 33, 40
	xxmrgld	38, 38, 39
	vrlw 3, 8, 3
	vadduwm 0, 0, 6
	vadduwm 0, 3, 0
	xxlxor 34, 32, 34
	xxsldwi 0, 32, 32, 3
	vrlw 2, 2, 4
	vadduwm 4, 2, 1
	xxswapd	2, 34
	xxlxor 35, 36, 35
	xxsldwi 1, 36, 36, 1
	vrlw 3, 3, 5
	xxlxor 0, 1, 0
	xxswapd	0, 0
	xxlxor 3, 35, 2
	stxvd2x 0, 0, 8
	xxswapd	3, 3
	stxvd2x 3, 8, 9
	lxvd2x 0, 0, 3
	xxswapd	34, 0
	xxlxor 0, 1, 34
	xxswapd	0, 0
	stxvd2x 0, 8, 6
	lxvd2x 0, 3, 9
	li 3, -16
	xxswapd	34, 0
	xxlxor 0, 2, 34
	xxswapd	0, 0
	stxvd2x 0, 8, 5
	lxvd2x 63, 1, 3
	li 3, -32
	lxvd2x 62, 1, 3
	li 3, -48
	lxvd2x 61, 1, 3
	blr
	.long	0
	.quad	0
.Lfunc_end1:
	.size	_blake3_compress_xof_sse2, .Lfunc_end1-.Lfunc_begin1

	.globl	_blake3_hash_many_sse2
	.p2align	2
	.type	_blake3_hash_many_sse2,@function
_blake3_hash_many_sse2:
.Lfunc_begin2:
.Lfunc_gep2:
	addis 2, 12, .TOC.-.Lfunc_gep2@ha
	addi 2, 2, .TOC.-.Lfunc_gep2@l
.Lfunc_lep2:
	.localentry	_blake3_hash_many_sse2, .Lfunc_lep2-.Lfunc_gep2
	mfocrf 12, 32
	mflr 0
	std 0, 16(1)
	stw 12, 8(1)
	stdu 1, -256(1)
	std 26, 208(1)
	mr	26, 4
	cmpldi 1, 4, 4
	andi. 4, 8, 1
	crmove	8, 1
	std 18, 144(1)
	std 19, 152(1)
	ld 19, 360(1)
	lwz 18, 352(1)
	std 24, 192(1)
	std 25, 200(1)
	std 27, 216(1)
	std 28, 224(1)
	std 29, 232(1)
	std 30, 240(1)
	mr	24, 10
	mr	30, 9
	mr	29, 7
	mr	28, 6
	mr	27, 5
	mr	25, 3
	std 17, 136(1)
	std 20, 160(1)
	std 21, 168(1)
	std 22, 176(1)
	std 23, 184(1)
	blt	1, .LBB2_3
	li 3, 0
	li 4, 1
	clrldi	23, 30, 32
	isel 22, 4, 3, 8
	clrldi	21, 24, 32
	clrldi	20, 18, 32
.LBB2_2:
	mr	3, 25
	mr	4, 27
	mr	5, 28
	mr	6, 29
	mr	7, 22
	mr	8, 23
	mr	9, 21
	mr	10, 20
	std 19, 32(1)
	bl blake3_hash4_sse2
	addi 26, 26, -4
	addi 3, 29, 4
	addi 25, 25, 32
	addi 19, 19, 128
	cmpldi	26, 3
	isel 29, 3, 29, 8
	bgt	0, .LBB2_2
.LBB2_3:
	cmpldi	26, 0
	beq	0, .LBB2_11
	li 3, 0
	li 4, 1
	or 21, 24, 30
	li 20, 16
	isel 22, 4, 3, 8
	addi 24, 1, 104
.LBB2_5:
	lxvd2x 0, 28, 20
	ld 23, 0(25)
	mr	17, 27
	mr	3, 21
	stxvd2x 0, 24, 20
	lxvd2x 0, 0, 28
	stxvd2x 0, 0, 24
.LBB2_6:
	cmpldi	17, 1
	beq	0, .LBB2_8
	cmpldi	17, 0
	bne	0, .LBB2_9
	b .LBB2_10
.LBB2_8:
	or 3, 3, 18
.LBB2_9:
	clrldi	7, 3, 56
	mr	3, 24
	mr	4, 23
	li 5, 64
	mr	6, 29
	bl _blake3_compress_in_place_sse2
	addi 23, 23, 64
	addi 17, 17, -1
	mr	3, 30
	b .LBB2_6
.LBB2_10:
	lxvd2x 0, 24, 20
	addi 26, 26, -1
	add 29, 29, 22
	addi 25, 25, 8
	cmpldi	26, 0
	stxvd2x 0, 19, 20
	lxvd2x 0, 0, 24
	stxvd2x 0, 0, 19
	addi 19, 19, 32
	bne	0, .LBB2_5
.LBB2_11:
	ld 30, 240(1)
	ld 29, 232(1)
	ld 28, 224(1)
	ld 27, 216(1)
	ld 26, 208(1)
	ld 25, 200(1)
	ld 24, 192(1)
	ld 23, 184(1)
	ld 22, 176(1)
	ld 21, 168(1)
	ld 20, 160(1)
	ld 19, 152(1)
	ld 18, 144(1)
	ld 17, 136(1)
	addi 1, 1, 256
	ld 0, 16(1)
	lwz 12, 8(1)
	mtocrf 32, 12
	mtlr 0
	blr
	.long	0
	.quad	0
.Lfunc_end2:
	.size	_blake3_hash_many_sse2, .Lfunc_end2-.Lfunc_begin2

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	4294967296
	.quad	12884901890
.LCPI3_1:
	.quad	-9223372034707292160
	.quad	-9223372034707292160
.LCPI3_2:
	.byte	27
	.byte	26
	.byte	25
	.byte	24
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
.LCPI3_3:
	.byte	29
	.byte	28
	.byte	31
	.byte	30
	.byte	25
	.byte	24
	.byte	27
	.byte	26
	.byte	21
	.byte	20
	.byte	23
	.byte	22
	.byte	17
	.byte	16
	.byte	19
	.byte	18
.LCPI3_4:
	.quad	274877907008
	.quad	274877907008
.LCPI3_5:
	.long	1779033703
	.long	1779033703
	.long	1779033703
	.long	1779033703
.LCPI3_6:
	.long	3144134277
	.long	3144134277
	.long	3144134277
	.long	3144134277
.LCPI3_7:
	.long	1013904242
	.long	1013904242
	.long	1013904242
	.long	1013904242
.LCPI3_8:
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.text
	.p2align	2
	.type	blake3_hash4_sse2,@function
blake3_hash4_sse2:
.Lfunc_begin3:
.Lfunc_gep3:
	addis 2, 12, .TOC.-.Lfunc_gep3@ha
	addi 2, 2, .TOC.-.Lfunc_gep3@l
.Lfunc_lep3:
	.localentry	blake3_hash4_sse2, .Lfunc_lep3-.Lfunc_gep3
	stdu 1, -592(1)
	li 11, 240
	std 21, 432(1)
	stfd 23, 520(1)
	stxvd2x 52, 1, 11
	li 11, 256
	std 22, 440(1)
	stxvd2x 53, 1, 11
	li 11, 272
	std 23, 448(1)
	stxvd2x 54, 1, 11
	li 11, 288
	std 24, 456(1)
	stxvd2x 55, 1, 11
	li 11, 304
	std 25, 464(1)
	stxvd2x 56, 1, 11
	li 11, 320
	std 26, 472(1)
	stxvd2x 57, 1, 11
	li 11, 336
	std 27, 480(1)
	stxvd2x 58, 1, 11
	li 11, 352
	std 28, 488(1)
	stxvd2x 59, 1, 11
	li 11, 368
	std 29, 496(1)
	stxvd2x 60, 1, 11
	li 11, 384
	std 30, 504(1)
	stxvd2x 61, 1, 11
	li 11, 400
	stfd 24, 528(1)
	addi 12, 1, 224
	stxvd2x 62, 1, 11
	li 11, 416
	stfd 25, 536(1)
	neg 7, 7
	stxvd2x 63, 1, 11
	lwz 11, 0(5)
	cmpldi	4, 0
	stfd 26, 544(1)
	stfd 27, 552(1)
	stw 11, 224(1)
	stfd 28, 560(1)
	lwz 11, 4(5)
	stfd 29, 568(1)
	stfd 30, 576(1)
	stfd 31, 584(1)
	lvx 2, 0, 12
	stw 11, 96(1)
	addi 12, 1, 96
	lwz 11, 8(5)
	lvx 3, 0, 12
	addi 12, 1, 112
	xxspltw 59, 34, 3
	stw 11, 112(1)
	xxspltw 48, 35, 3
	lwz 11, 12(5)
	lvx 4, 0, 12
	addi 12, 1, 128
	stw 11, 128(1)
	xxspltw 51, 36, 3
	lwz 11, 16(5)
	lvx 5, 0, 12
	addi 12, 1, 144
	stw 11, 144(1)
	xxspltw 39, 37, 3
	lwz 11, 20(5)
	lvx 0, 0, 12
	addi 12, 1, 160
	stw 11, 160(1)
	xxspltw 52, 32, 3
	lwz 11, 24(5)
	lvx 2, 0, 12
	stw 11, 176(1)
	addi 11, 1, 176
	xxspltw 42, 34, 3
	lwz 5, 28(5)
	lvx 3, 0, 11
	stw 5, 192(1)
	addi 5, 1, 192
	xxspltw 54, 35, 3
	lvx 2, 0, 5
	stw 7, 64(1)
	addi 5, 1, 64
	addi 7, 1, 208
	xxspltw 43, 34, 3
	lvx 2, 0, 5
	stw 6, 208(1)
	rldicl 6, 6, 32, 32
	ld 5, 624(1)
	lvx 3, 0, 7
	stw 6, 80(1)
	beq	0, .LBB3_5
	addis 6, 2, .LCPI3_0@toc@ha
	xxspltw 1, 34, 3
	addis 12, 2, .LCPI3_2@toc@ha
	addis 7, 2, .LCPI3_4@toc@ha
	addis 29, 2, .LCPI3_5@toc@ha
	addis 27, 2, .LCPI3_7@toc@ha
	addis 28, 2, .LCPI3_6@toc@ha
	addis 26, 2, .LCPI3_8@toc@ha
	addis 30, 2, .LCPI3_3@toc@ha
	or 25, 9, 8
	ld 9, 16(3)
	addi 6, 6, .LCPI3_0@toc@l
	xxspltw 35, 35, 3
	addi 0, 12, .LCPI3_2@toc@l
	addi 11, 7, .LCPI3_4@toc@l
	addi 29, 29, .LCPI3_5@toc@l
	addi 27, 27, .LCPI3_7@toc@l
	addi 28, 28, .LCPI3_6@toc@l
	addi 26, 26, .LCPI3_8@toc@l
	addi 30, 30, .LCPI3_3@toc@l
	ld 7, 8(3)
	li 12, 0
	lxvd2x 0, 0, 6
	addis 6, 2, .LCPI3_1@toc@ha
	lvx 18, 0, 30
	li 30, 0
	addi 6, 6, .LCPI3_1@toc@l
	lxvd2x 2, 0, 6
	addi 6, 1, 80
	xxswapd	34, 0
	lxvd2x 0, 0, 11
	ld 11, 24(3)
	xxswapd	36, 2
	xxland 34, 1, 34
	xxswapd	8, 0
	vadduwm 3, 2, 3
	xxlor 34, 34, 36
	xxlor 4, 35, 35
	xxlxor 35, 35, 36
	lvx 4, 0, 0
	addi 0, 1, 48
	vcmpgtsw 2, 2, 3
	lvx 3, 0, 6
	ld 6, 0(3)
	addi 3, 3, -8
	xxlor 5, 36, 36
	lvx 4, 0, 29
	li 29, 16
	xxspltw 35, 35, 3
	xxlor 6, 36, 36
	lvx 4, 0, 28
	li 28, 32
	xxlor 7, 36, 36
	vsubuwm 2, 3, 2
	xxlor 9, 34, 34
	lvx 2, 0, 27
	li 27, 48
	xxlor 10, 34, 34
	lvx 2, 0, 26
	li 26, 4
	xxlor 11, 34, 34
.LBB3_2:
	mr	24, 12
	addi 12, 12, 1
	xxlor 12, 42, 42
	cmpld	12, 4
	xxlor 30, 48, 48
	iseleq	23, 10, 30
	or 25, 23, 25
	xxlor 13, 39, 39
	clrlwi	23, 25, 24
	sldi 25, 24, 6
	xxlor 31, 43, 43
	stw 23, 48(1)
	add 24, 6, 25
	add 23, 7, 25
	lxvd2x 0, 6, 25
	lxvd2x 1, 7, 25
	add 22, 9, 25
	add 21, 11, 25
	lxvd2x 2, 9, 25
	lxvd2x 3, 11, 25
	lvx 28, 0, 0
	xxswapd	34, 0
	lxvd2x 0, 24, 29
	xxswapd	35, 1
	lxvd2x 1, 23, 29
	xxswapd	37, 2
	lxvd2x 2, 22, 29
	xxswapd	32, 3
	lxvd2x 3, 21, 29
	xxswapd	33, 0
	lxvd2x 0, 24, 28
	xxswapd	38, 1
	lxvd2x 1, 23, 28
	xxswapd	45, 2
	lxvd2x 2, 22, 28
	xxswapd	63, 3
	lxvd2x 3, 21, 28
	xxswapd	57, 0
	lxvd2x 0, 24, 27
	mr	24, 3
	xxswapd	56, 1
	lxvd2x 1, 23, 27
	xxswapd	55, 2
	lxvd2x 2, 22, 27
	xxswapd	53, 3
	lxvd2x 3, 21, 27
	mtctr 26
	xxswapd	61, 0
	xxswapd	47, 1
	xxswapd	41, 2
	xxswapd	42, 3
.LBB3_3:
	ldu 23, 8(24)
	add 23, 23, 25
	addi 23, 23, 256
	dcbt 0, 23
	bdnz .LBB3_3
	xxlor 36, 5, 5
	vspltisw 16, 10
	mr	25, 8
	vmrglw 11, 3, 2
	vperm 7, 3, 2, 4
	vmrghw 8, 3, 2
	vperm 3, 0, 5, 4
	vmrglw 12, 0, 5
	vmrghw 14, 0, 5
	vperm 5, 24, 25, 4
	vperm 2, 6, 1, 4
	vmrglw 30, 6, 1
	vmrghw 1, 6, 1
	vmrghw 6, 31, 13
	vperm 26, 31, 13, 4
	xxlor 26, 37, 37
	xxmrgld	35, 35, 39
	vmrglw 5, 24, 25
	xxlor 23, 34, 34
	vmrglw 2, 31, 13
	vspltisw 13, -16
	vmrghw 24, 24, 25
	vspltisw 31, 9
	vmrglw 25, 21, 23
	vmrghw 17, 10, 9
	xxlor 24, 37, 37
	vperm 5, 21, 23, 4
	vmrghw 21, 21, 23
	vmrghw 23, 15, 29
	xxmrgld	34, 34, 62
	xxlor 32, 30, 30
	xxlor 0, 4, 4
	xxlor 0, 9, 9
	xxlor 25, 37, 37
	xxspltw 0, 60, 3
	vperm 5, 15, 29, 4
	xxlor 2, 34, 34
	xxlor 1, 8, 8
	xxlor 27, 37, 37
	vmrglw 5, 15, 29
	vperm 15, 10, 9, 4
	vmrglw 29, 10, 9
	vsubuwm 9, 31, 13
	xxmrgld	63, 44, 43
	xxmrgld	36, 46, 40
	vadduwm 11, 16, 16
	xxlor 44, 10, 10
	vspltisw 10, 12
	xxlor 28, 37, 37
	xxmrgld	37, 38, 33
	vadduwm 16, 31, 27
	xxmrghd	38, 38, 33
	vadduwm 27, 2, 19
	xxlor 34, 13, 13
	vadduwm 30, 4, 0
	vadduwm 19, 5, 2
	xxmrghd	34, 46, 40
	vadduwm 16, 16, 20
	xxmrgld	46, 53, 56
	xxlor 32, 12, 12
	xxmrghd	56, 53, 56
	vadduwm 7, 27, 22
	xxlor 12, 54, 54
	xxlor 54, 31, 31
	vadduwm 30, 30, 0
	vadduwm 19, 19, 22
	xxlxor 40, 48, 4
	xxlxor 59, 62, 9
	vadduwm 30, 30, 2
	xxlor 3, 34, 34
	vperm 8, 8, 8, 18
	xxlxor 60, 39, 8
	xxlxor 34, 51, 0
	vperm 27, 27, 27, 18
	vperm 28, 28, 28, 18
	vperm 2, 2, 2, 18
	vadduwm 16, 16, 3
	xxlor 31, 35, 35
	xxlor 35, 6, 6
	xxlor 29, 36, 36
	vadduwm 3, 8, 3
	xxlor 36, 7, 7
	xxlor 45, 11, 11
	xxlor 13, 37, 37
	vadduwm 4, 27, 4
	xxlxor 37, 35, 52
	vadduwm 12, 28, 12
	vadduwm 20, 2, 13
	xxmrgld	45, 58, 23
	xxlxor 32, 36, 32
	xxlxor 58, 44, 12
	xxlxor 33, 52, 54
	vrlw 5, 5, 11
	vrlw 0, 0, 11
	vrlw 26, 26, 11
	vrlw 1, 1, 11
	vadduwm 7, 7, 13
	vadduwm 19, 19, 6
	vadduwm 16, 5, 16
	vadduwm 30, 0, 30
	vadduwm 7, 26, 7
	vadduwm 19, 1, 19
	vadduwm 10, 10, 10
	xxlor 1, 38, 38
	xxlxor 38, 48, 40
	xxmrgld	40, 57, 24
	xxlxor 59, 62, 59
	xxlxor 60, 39, 60
	xxlxor 57, 51, 34
	vrlw 6, 6, 10
	vrlw 2, 27, 10
	vrlw 27, 28, 10
	vrlw 25, 25, 10
	vadduwm 30, 30, 14
	xxmrgld	60, 25, 26
	xxlor 0, 46, 46
	xxmrgld	46, 61, 28
	vadduwm 3, 6, 3
	vadduwm 4, 2, 4
	vadduwm 12, 27, 12
	vadduwm 20, 25, 20
	xxlxor 37, 35, 37
	xxlxor 58, 44, 58
	xxlxor 33, 52, 33
	xxlxor 32, 36, 32
	vrlw 26, 26, 9
	vrlw 22, 1, 9
	vrlw 5, 5, 9
	xxmrgld	33, 49, 55
	vrlw 0, 0, 9
	vadduwm 7, 7, 14
	vadduwm 16, 16, 8
	vadduwm 19, 19, 1
	vadduwm 30, 26, 30
	vadduwm 7, 22, 7
	vadduwm 19, 5, 19
	xxlor 28, 33, 33
	vadduwm 16, 0, 16
	xxlxor 33, 62, 38
	xxmrgld	38, 47, 27
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 57, 48, 57
	vperm 1, 1, 1, 18
	vperm 2, 2, 2, 18
	vperm 27, 27, 27, 18
	vperm 21, 25, 25, 18
	xxlor 12, 40, 40
	xxmrghd	40, 49, 55
	vadduwm 30, 30, 24
	vadduwm 20, 1, 20
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 21, 12
	xxlxor 58, 52, 58
	xxlxor 54, 35, 54
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	vrlw 17, 26, 11
	vrlw 26, 22, 11
	vrlw 5, 5, 11
	vrlw 0, 0, 11
	vadduwm 7, 7, 6
	vadduwm 19, 19, 8
	vadduwm 16, 16, 28
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 53
	vrlw 1, 1, 10
	vrlw 2, 2, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	xxlor 30, 45, 45
	xxlor 57, 29, 29
	vadduwm 22, 1, 20
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 37, 36, 37
	xxlxor 58, 35, 58
	xxlxor 32, 44, 32
	vrlw 5, 5, 9
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 0, 0, 9
	xxlor 52, 1, 1
	xxlor 45, 2, 2
	vadduwm 16, 16, 25
	xxlor 61, 3, 3
	vadduwm 7, 7, 20
	vadduwm 19, 19, 13
	vadduwm 30, 30, 29
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vperm 1, 1, 1, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vperm 2, 2, 2, 18
	xxlor 47, 13, 13
	vadduwm 7, 7, 31
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 5, 5, 11
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 0, 0, 11
	vadduwm 16, 16, 15
	xxlor 47, 0, 0
	vadduwm 19, 19, 6
	vadduwm 30, 30, 15
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vrlw 1, 1, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vrlw 2, 2, 10
	xxlor 1, 63, 63
	vmr	31, 6
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 5, 5, 9
	vrlw 0, 0, 9
	xxlor 38, 31, 31
	vadduwm 30, 30, 14
	vadduwm 7, 7, 28
	vadduwm 19, 19, 8
	vadduwm 16, 16, 6
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vperm 1, 1, 1, 18
	vperm 2, 2, 2, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	xxlor 2, 40, 40
	xxlor 40, 30, 30
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 58, 35, 58
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 5, 5, 11
	vrlw 0, 0, 11
	xxlor 53, 28, 28
	xxlor 38, 12, 12
	vadduwm 30, 30, 8
	vadduwm 7, 7, 21
	vadduwm 19, 19, 6
	vadduwm 16, 16, 24
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vrlw 1, 1, 10
	vrlw 2, 2, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vadduwm 16, 16, 29
	vadduwm 7, 7, 31
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 37, 36, 37
	xxlxor 58, 35, 58
	xxlxor 32, 44, 32
	vrlw 5, 5, 9
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 0, 0, 9
	vadduwm 19, 19, 20
	vadduwm 30, 30, 15
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vperm 1, 1, 1, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vperm 2, 2, 2, 18
	vadduwm 16, 16, 13
	vadduwm 7, 7, 25
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 5, 5, 11
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 0, 0, 11
	vadduwm 19, 19, 21
	vadduwm 30, 30, 14
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vrlw 1, 1, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vrlw 2, 2, 10
	xxlor 30, 61, 61
	xxlor 61, 0, 0
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 5, 5, 9
	vrlw 0, 0, 9
	xxlor 0, 45, 45
	xxlor 45, 13, 13
	vadduwm 30, 30, 28
	vadduwm 7, 7, 24
	vadduwm 19, 19, 6
	vadduwm 16, 16, 13
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vperm 1, 1, 1, 18
	vperm 2, 2, 2, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vmr	15, 31
	vadduwm 16, 16, 8
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 58, 35, 58
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 5, 5, 11
	vmr	31, 8
	xxlor 38, 1, 1
	vrlw 0, 0, 11
	xxlor 57, 2, 2
	xxlor 40, 31, 31
	vadduwm 30, 30, 6
	vadduwm 7, 7, 25
	vadduwm 19, 19, 8
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vrlw 1, 1, 10
	vrlw 2, 2, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vadduwm 16, 16, 29
	vadduwm 7, 7, 21
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 37, 36, 37
	xxlxor 58, 35, 58
	xxlxor 32, 44, 32
	vrlw 5, 5, 9
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 0, 0, 9
	vadduwm 19, 19, 15
	vadduwm 30, 30, 14
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vperm 1, 1, 1, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vperm 2, 2, 2, 18
	xxlor 3, 13, 13
	xxlor 13, 61, 61
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 5, 5, 11
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vmr	29, 14
	vrlw 0, 0, 11
	xxlor 46, 30, 30
	vadduwm 16, 16, 20
	vadduwm 7, 7, 14
	vadduwm 19, 19, 25
	vadduwm 30, 30, 28
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vrlw 1, 1, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vrlw 2, 2, 10
	vmr	13, 15
	vmr	15, 20
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 5, 5, 9
	vrlw 0, 0, 9
	xxlor 52, 0, 0
	vadduwm 30, 30, 24
	vadduwm 7, 7, 31
	vadduwm 19, 19, 8
	vadduwm 16, 16, 20
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vperm 1, 1, 1, 18
	vperm 2, 2, 2, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	xxlor 28, 29, 29
	xxlor 29, 63, 63
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 58, 35, 58
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 5, 5, 11
	vadduwm 16, 16, 6
	xxlor 0, 38, 38
	xxlor 63, 28, 28
	vrlw 0, 0, 11
	xxlor 38, 12, 12
	xxlor 46, 3, 3
	vadduwm 30, 30, 31
	vadduwm 7, 7, 6
	vadduwm 19, 19, 14
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vrlw 1, 1, 10
	vrlw 2, 2, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vadduwm 16, 16, 29
	vadduwm 7, 7, 25
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 37, 36, 37
	xxlxor 58, 35, 58
	xxlxor 32, 44, 32
	vrlw 5, 5, 9
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 0, 0, 9
	vadduwm 19, 19, 21
	vadduwm 30, 30, 28
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vperm 1, 1, 1, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vperm 2, 2, 2, 18
	xxlor 31, 30, 30
	xxlor 30, 40, 40
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 5, 5, 11
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 0, 0, 11
	xxlor 40, 13, 13
	vadduwm 16, 16, 13
	vadduwm 7, 7, 8
	vadduwm 19, 19, 6
	vadduwm 30, 30, 24
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vrlw 1, 1, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vrlw 2, 2, 10
	xxlor 1, 57, 57
	vmr	25, 13
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 5, 5, 9
	vadduwm 16, 16, 15
	xxlor 2, 47, 47
	xxlor 45, 29, 29
	vrlw 0, 0, 9
	xxlor 47, 0, 0
	vadduwm 30, 30, 13
	vadduwm 7, 7, 15
	vadduwm 19, 19, 14
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vperm 1, 1, 1, 18
	vperm 2, 2, 2, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vmr	8, 6
	xxlor 63, 31, 31
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 58, 35, 58
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 5, 5, 11
	vrlw 0, 0, 11
	xxlor 38, 30, 30
	xxlor 46, 28, 28
	vadduwm 30, 30, 31
	vadduwm 7, 7, 6
	vadduwm 19, 19, 20
	vadduwm 16, 16, 14
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vrlw 1, 1, 10
	vrlw 2, 2, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vadduwm 30, 30, 24
	xxlor 30, 56, 56
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 37, 36, 37
	xxlxor 58, 35, 58
	xxlxor 32, 44, 32
	vrlw 5, 5, 9
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 0, 0, 9
	xxlor 56, 1, 1
	vadduwm 16, 16, 28
	vadduwm 7, 7, 8
	vadduwm 19, 19, 24
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vperm 1, 1, 1, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	vperm 2, 2, 2, 18
	vadduwm 16, 16, 21
	vadduwm 7, 7, 29
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 5, 5, 11
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 0, 0, 11
	vadduwm 19, 19, 6
	vadduwm 30, 30, 13
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 19, 26, 19
	vadduwm 30, 0, 30
	xxlxor 33, 48, 33
	xxlxor 59, 39, 59
	xxlxor 55, 51, 55
	xxlxor 34, 62, 34
	vrlw 1, 1, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vrlw 2, 2, 10
	vadduwm 30, 30, 15
	vadduwm 7, 7, 14
	vadduwm 3, 1, 3
	vadduwm 12, 27, 12
	vadduwm 22, 23, 22
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 58, 54, 58
	xxlxor 32, 36, 32
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vrlw 5, 5, 9
	vrlw 0, 0, 9
	vadduwm 19, 19, 20
	vadduwm 16, 16, 25
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vperm 1, 1, 1, 18
	vperm 2, 2, 2, 18
	vperm 27, 27, 27, 18
	vperm 23, 23, 23, 18
	xxlor 0, 3, 3
	xxlor 31, 40, 40
	vadduwm 22, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 54, 49
	xxlxor 58, 35, 58
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	vrlw 17, 17, 11
	vrlw 26, 26, 11
	vrlw 5, 5, 11
	xxlor 1, 61, 61
	vmr	8, 6
	xxlor 3, 57, 57
	vmr	6, 15
	vmr	29, 14
	xxlor 47, 13, 13
	vrlw 0, 0, 11
	xxlor 46, 0, 0
	xxlor 57, 2, 2
	vadduwm 30, 30, 15
	vadduwm 7, 7, 14
	vadduwm 19, 19, 25
	vadduwm 16, 16, 31
	vadduwm 30, 17, 30
	vadduwm 7, 26, 7
	vadduwm 19, 5, 19
	vadduwm 16, 0, 16
	xxlxor 33, 62, 33
	xxlxor 34, 39, 34
	xxlxor 59, 51, 59
	xxlxor 55, 48, 55
	vrlw 1, 1, 10
	vrlw 2, 2, 10
	vrlw 27, 27, 10
	vrlw 23, 23, 10
	vadduwm 13, 30, 13
	xxlor 12, 60, 60
	vadduwm 30, 1, 22
	vadduwm 3, 2, 3
	vadduwm 4, 27, 4
	vadduwm 12, 23, 12
	xxlxor 49, 62, 49
	xxlxor 37, 36, 37
	xxlxor 58, 35, 58
	xxlxor 32, 44, 32
	vrlw 5, 5, 9
	vrlw 17, 17, 9
	vrlw 26, 26, 9
	vmr	28, 31
	xxlor 63, 30, 30
	vrlw 0, 0, 9
	vadduwm 7, 7, 8
	xxlor 40, 31, 31
	vadduwm 16, 16, 31
	vadduwm 8, 19, 8
	vadduwm 16, 5, 16
	vadduwm 7, 17, 7
	vadduwm 8, 26, 8
	vadduwm 13, 0, 13
	xxlxor 33, 48, 33
	xxlxor 51, 39, 59
	xxlxor 63, 40, 55
	xxlxor 34, 45, 34
	vperm 1, 1, 1, 18
	vperm 19, 19, 19, 18
	vperm 31, 31, 31, 18
	vperm 2, 2, 2, 18
	vadduwm 13, 13, 6
	xxlor 38, 12, 12
	vadduwm 3, 1, 3
	vadduwm 12, 19, 12
	vadduwm 30, 31, 30
	vadduwm 4, 2, 4
	xxlxor 37, 35, 37
	xxlxor 49, 44, 49
	xxlxor 59, 62, 58
	xxlxor 32, 36, 32
	vrlw 5, 5, 11
	vrlw 17, 17, 11
	vrlw 27, 27, 11
	vrlw 0, 0, 11
	vadduwm 16, 16, 24
	vadduwm 6, 7, 6
	vadduwm 7, 8, 14
	vadduwm 8, 5, 16
	vadduwm 6, 17, 6
	vadduwm 7, 27, 7
	vadduwm 13, 0, 13
	xxlxor 33, 40, 33
	xxlxor 48, 38, 51
	xxlxor 51, 39, 63
	xxlxor 34, 45, 34
	vrlw 1, 1, 10
	vrlw 19, 19, 10
	vrlw 2, 2, 10
	vrlw 16, 16, 10
	vadduwm 6, 6, 28
	vadduwm 7, 7, 25
	vadduwm 3, 1, 3
	vadduwm 14, 19, 30
	vadduwm 4, 2, 4
	vadduwm 12, 16, 12
	xxlxor 37, 35, 37
	xxlxor 63, 46, 59
	xxlxor 32, 36, 32
	xxlxor 49, 44, 49
	vrlw 31, 31, 9
	vrlw 5, 5, 9
	vrlw 0, 0, 9
	vrlw 17, 17, 9
	vadduwm 8, 8, 21
	vadduwm 13, 13, 29
	vadduwm 6, 31, 6
	vadduwm 7, 5, 7
	vadduwm 8, 0, 8
	vadduwm 13, 17, 13
	xxlxor 34, 38, 34
	xxlxor 48, 39, 48
	xxlxor 51, 40, 51
	xxlxor 33, 45, 33
	vperm 2, 2, 2, 18
	vperm 16, 16, 16, 18
	vperm 19, 19, 19, 18
	vperm 1, 1, 1, 18
	vadduwm 8, 8, 15
	xxlor 47, 1, 1
	vadduwm 3, 2, 3
	vadduwm 4, 16, 4
	vadduwm 12, 19, 12
	vadduwm 14, 1, 14
	xxlxor 63, 35, 63
	xxlxor 37, 36, 37
	xxlxor 32, 44, 32
	xxlxor 49, 46, 49
	vrlw 31, 31, 11
	vrlw 5, 5, 11
	vrlw 0, 0, 11
	vrlw 17, 17, 11
	xxlor 43, 3, 3
	vadduwm 6, 6, 20
	vadduwm 7, 7, 11
	vadduwm 13, 13, 15
	vadduwm 6, 31, 6
	vadduwm 7, 5, 7
	vadduwm 8, 0, 8
	vadduwm 11, 17, 13
	xxlxor 34, 38, 34
	xxlxor 45, 39, 48
	vrlw 2, 2, 10
	vrlw 13, 13, 10
	xxlxor 47, 40, 51
	xxlxor 33, 43, 33
	vrlw 15, 15, 10
	vrlw 1, 1, 10
	vadduwm 3, 2, 3
	vadduwm 4, 13, 4
	xxlxor 42, 35, 63
	xxlxor 59, 35, 40
	xxlxor 35, 36, 37
	xxlxor 48, 36, 43
	vadduwm 4, 15, 12
	vadduwm 5, 1, 14
	xxlxor 32, 36, 32
	xxlxor 40, 37, 49
	vrlw 3, 3, 9
	vrlw 0, 0, 9
	vrlw 8, 8, 9
	vrlw 9, 10, 9
	xxlxor 51, 36, 38
	xxlxor 39, 37, 39
	xxlxor 52, 35, 33
	xxlxor 42, 32, 34
	xxlxor 54, 40, 45
	xxlxor 43, 41, 47
	bne	0, .LBB3_2
.LBB3_5:
	addis 3, 2, .LCPI3_2@toc@ha
	vmrglw 3, 16, 27
	li 4, 32
	addi 3, 3, .LCPI3_2@toc@l
	vmrghw 0, 7, 19
	lvx 2, 0, 3
	vmrghw 1, 10, 20
	li 3, 16
	vmrghw 5, 16, 27
	vmrghw 6, 11, 22
	vperm 4, 16, 27, 2
	vperm 9, 10, 20, 2
	xxmrgld	40, 32, 37
	xxmrghd	37, 32, 37
	xxmrgld	0, 36, 35
	vmrglw 3, 7, 19
	vmrglw 4, 10, 20
	vperm 7, 7, 19, 2
	vperm 2, 11, 22, 2
	vmrglw 10, 11, 22
	xxswapd	3, 37
	xxmrgld	32, 38, 33
	xxmrgld	5, 41, 36
	xxmrgld	4, 39, 35
	xxmrghd	33, 38, 33
	xxmrgld	6, 34, 42
	xxmrgld	34, 4, 0
	xxmrghd	35, 4, 0
	xxmrgld	36, 6, 5
	xxmrghd	37, 6, 5
	xxswapd	0, 34
	xxswapd	4, 36
	xxswapd	5, 35
	xxswapd	6, 37
	stxvd2x 0, 0, 5
	xxswapd	1, 40
	stxvd2x 4, 5, 3
	li 3, 48
	xxswapd	2, 32
	stxvd2x 5, 5, 4
	li 4, 64
	xxswapd	0, 33
	stxvd2x 6, 5, 3
	li 3, 80
	stxvd2x 1, 5, 4
	li 4, 96
	stxvd2x 2, 5, 3
	li 3, 112
	stxvd2x 3, 5, 4
	stxvd2x 0, 5, 3
	li 3, 416
	lxvd2x 63, 1, 3
	li 3, 400
	lfd 31, 584(1)
	lxvd2x 62, 1, 3
	li 3, 384
	lfd 30, 576(1)
	lxvd2x 61, 1, 3
	li 3, 368
	lfd 29, 568(1)
	lxvd2x 60, 1, 3
	li 3, 352
	lfd 28, 560(1)
	lxvd2x 59, 1, 3
	li 3, 336
	lfd 27, 552(1)
	lxvd2x 58, 1, 3
	li 3, 320
	lfd 26, 544(1)
	lxvd2x 57, 1, 3
	li 3, 304
	lfd 25, 536(1)
	lxvd2x 56, 1, 3
	li 3, 288
	lfd 24, 528(1)
	lxvd2x 55, 1, 3
	li 3, 272
	lfd 23, 520(1)
	lxvd2x 54, 1, 3
	li 3, 256
	ld 30, 504(1)
	lxvd2x 53, 1, 3
	li 3, 240
	ld 29, 496(1)
	lxvd2x 52, 1, 3
	ld 28, 488(1)
	ld 27, 480(1)
	ld 26, 472(1)
	ld 25, 464(1)
	ld 24, 456(1)
	ld 23, 448(1)
	ld 22, 440(1)
	ld 21, 432(1)
	addi 1, 1, 592
	blr
	.long	0
	.quad	0
.Lfunc_end3:
	.size	blake3_hash4_sse2, .Lfunc_end3-.Lfunc_begin3

#endif
