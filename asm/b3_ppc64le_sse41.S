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
 * This is converted assembly: SSE4.1 -> POWER7 PPC64le
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
.LCPI0_4:
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
.LCPI0_5:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI0_6:
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
.LCPI0_7:
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
.LCPI0_8:
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	26
	.byte	25
	.byte	24
	.byte	27
	.byte	22
	.byte	21
	.byte	20
	.byte	23
	.byte	18
	.byte	17
	.byte	16
	.byte	19
.LCPI0_9:
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
.LCPI0_10:
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
.LCPI0_11:
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI0_12:
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	31
	.byte	31
	.byte	31
.LCPI0_13:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI0_14:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	27
	.byte	26
	.byte	25
	.byte	24
.LCPI0_15:
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
.LCPI0_16:
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
	.text
	.globl	_blake3_compress_in_place_sse41
	.p2align	2
	.type	_blake3_compress_in_place_sse41,@function
_blake3_compress_in_place_sse41:
.Lfunc_begin0:
.Lfunc_gep0:
	addis 2, 12, .TOC.-.Lfunc_gep0@ha
	addi 2, 2, .TOC.-.Lfunc_gep0@l
.Lfunc_lep0:
	.localentry	_blake3_compress_in_place_sse41, .Lfunc_lep0-.Lfunc_gep0
	li 8, -64
	rldicl 9, 6, 32, 32
	lxvd2x 0, 0, 3
	xxlxor 40, 40, 40
	stxvd2x 60, 1, 8
	li 8, -48
	stxvd2x 61, 1, 8
	li 8, -32
	stxvd2x 62, 1, 8
	li 8, -16
	stxvd2x 63, 1, 8
	li 8, 16
	lxvd2x 1, 3, 8
	stw 6, -96(1)
	addi 6, 1, -96
	vspltisw 14, -16
	stw 9, -80(1)
	addi 9, 1, -80
	vspltisw 15, 9
	lvx 2, 0, 6
	lvx 3, 0, 9
	addis 6, 2, .LCPI0_0@toc@ha
	addi 9, 1, -112
	addi 6, 6, .LCPI0_0@toc@l
	stw 5, -112(1)
	addis 5, 2, .LCPI0_2@toc@ha
	vmrglw 2, 3, 2
	lvx 3, 0, 6
	lvx 4, 0, 9
	addis 6, 2, .LCPI0_1@toc@ha
	addi 5, 5, .LCPI0_2@toc@l
	stw 7, -128(1)
	addi 6, 6, .LCPI0_1@toc@l
	lvx 1, 0, 5
	addi 5, 1, -128
	lxvd2x 2, 0, 4
	lxvd2x 3, 4, 8
	lvx 6, 0, 5
	addis 5, 2, .LCPI0_3@toc@ha
	addi 5, 5, .LCPI0_3@toc@l
	xxswapd	37, 2
	vperm 3, 4, 2, 3
	lvx 4, 0, 6
	addis 6, 2, .LCPI0_4@toc@ha
	xxswapd	32, 3
	addi 6, 6, .LCPI0_4@toc@l
	vperm 9, 0, 5, 1
	vperm 3, 6, 3, 4
	xxswapd	36, 0
	xxswapd	38, 1
	vadduwm 4, 9, 4
	xxpermdi 34, 35, 34, 1
	vadduwm 7, 4, 6
	lvx 3, 0, 6
	lvx 4, 0, 5
	addis 5, 2, .LCPI0_5@toc@ha
	addis 6, 2, .LCPI0_6@toc@ha
	addi 5, 5, .LCPI0_5@toc@l
	addi 6, 6, .LCPI0_6@toc@l
	lvx 11, 0, 5
	lvx 12, 0, 6
	addis 6, 2, .LCPI0_8@toc@ha
	addis 5, 2, .LCPI0_7@toc@ha
	xxlxor 42, 39, 34
	addi 6, 6, .LCPI0_8@toc@l
	addi 5, 5, .LCPI0_7@toc@l
	vcmpgtsb 2, 8, 4
	vperm 4, 10, 10, 3
	vspltisw 10, 10
	xxlandc 45, 36, 34
	vadduwm 4, 10, 10
	vadduwm 10, 13, 11
	vperm 11, 0, 5, 12
	lvx 0, 0, 5
	li 5, 32
	xxlxor 37, 42, 38
	lxvd2x 0, 4, 5
	addis 5, 2, .LCPI0_11@toc@ha
	vcmpgtsb 0, 8, 0
	addi 5, 5, .LCPI0_11@toc@l
	vrlw 6, 5, 4
	vadduwm 5, 7, 11
	vadduwm 7, 6, 5
	lvx 5, 0, 6
	li 6, 48
	lxvd2x 1, 4, 6
	addis 4, 2, .LCPI0_9@toc@ha
	xxlxor 44, 39, 45
	addi 4, 4, .LCPI0_9@toc@l
	vperm 8, 12, 12, 5
	xxswapd	44, 0
	xxswapd	45, 1
	vperm 16, 13, 12, 1
	xxlandc 40, 40, 32
	vsubuwm 1, 15, 14
	lvx 14, 0, 4
	addis 4, 2, .LCPI0_10@toc@ha
	vadduwm 10, 8, 10
	xxswapd	40, 40
	addi 4, 4, .LCPI0_10@toc@l
	xxlxor 38, 42, 38
	xxsldwi 42, 42, 42, 3
	vadduwm 7, 7, 16
	xxsldwi 48, 48, 48, 1
	vrlw 6, 6, 1
	xxsldwi 39, 39, 39, 1
	vperm 13, 12, 13, 14
	vadduwm 7, 6, 7
	xxlxor 40, 39, 40
	vperm 8, 8, 8, 3
	xxlandc 40, 40, 34
	vadduwm 10, 8, 10
	xxlxor 38, 42, 38
	vrlw 12, 6, 4
	vadduwm 6, 7, 13
	vadduwm 7, 12, 6
	xxlxor 38, 39, 40
	vperm 8, 6, 6, 5
	lvx 6, 0, 4
	addis 4, 2, .LCPI0_12@toc@ha
	addi 4, 4, .LCPI0_12@toc@l
	vperm 14, 11, 9, 6
	xxlandc 40, 40, 32
	vadduwm 10, 8, 10
	xxswapd	40, 40
	vadduwm 7, 7, 14
	xxsldwi 46, 46, 46, 3
	xxlxor 44, 42, 44
	xxsldwi 42, 42, 42, 1
	xxsldwi 39, 39, 39, 3
	vrlw 15, 12, 1
	vadduwm 17, 15, 7
	lvx 7, 0, 4
	addis 4, 2, .LCPI0_13@toc@ha
	addi 4, 4, .LCPI0_13@toc@l
	xxlxor 44, 49, 40
	lvx 8, 0, 5
	vperm 18, 9, 9, 7
	lvx 9, 0, 4
	addis 4, 2, .LCPI0_14@toc@ha
	vperm 12, 12, 12, 3
	addi 4, 4, .LCPI0_14@toc@l
	vperm 19, 13, 16, 8
	xxlandc 63, 44, 34
	vperm 12, 19, 18, 9
	vadduwm 30, 31, 10
	xxmrgld	51, 43, 45
	vmrghw 13, 13, 11
	xxlxor 42, 62, 47
	vrlw 15, 10, 4
	vadduwm 10, 17, 12
	vadduwm 17, 15, 10
	xxlxor 42, 49, 63
	xxsldwi 49, 49, 49, 1
	vperm 18, 10, 10, 5
	lvx 10, 0, 4
	addis 4, 2, .LCPI0_15@toc@ha
	addi 4, 4, .LCPI0_15@toc@l
	lvx 11, 0, 4
	addis 4, 2, .LCPI0_16@toc@ha
	vperm 19, 16, 19, 10
	addi 4, 4, .LCPI0_16@toc@l
	xxlandc 50, 50, 32
	vadduwm 31, 18, 30
	xxswapd	50, 50
	vadduwm 17, 17, 19
	xxlxor 47, 63, 47
	xxsldwi 63, 63, 63, 3
	vperm 30, 13, 16, 11
	vrlw 15, 15, 1
	vmrglw 13, 16, 13
	vadduwm 17, 15, 17
	xxlxor 50, 49, 50
	vperm 18, 18, 18, 3
	xxlandc 50, 50, 34
	vadduwm 16, 18, 31
	xxmrgld	63, 45, 62
	xxmrgld	62, 44, 62
	xxlxor 47, 48, 47
	vadduwm 13, 17, 31
	vrlw 15, 15, 4
	vperm 30, 19, 30, 10
	vadduwm 13, 15, 13
	xxlxor 49, 45, 50
	vperm 18, 12, 14, 6
	vperm 17, 17, 17, 5
	vperm 14, 14, 14, 7
	vmrghw 12, 31, 12
	vadduwm 13, 13, 18
	xxlandc 49, 49, 32
	xxsldwi 45, 45, 45, 3
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 47, 48, 47
	xxsldwi 48, 48, 48, 1
	vrlw 15, 15, 1
	vadduwm 29, 15, 13
	xxlxor 45, 61, 49
	vperm 17, 31, 19, 8
	vperm 13, 13, 13, 3
	vperm 31, 12, 19, 11
	vmrglw 12, 19, 12
	xxlandc 60, 45, 34
	vperm 13, 17, 14, 9
	vadduwm 16, 28, 16
	xxmrgld	51, 44, 63
	xxlxor 46, 48, 47
	vrlw 14, 14, 4
	vadduwm 15, 29, 13
	xxmrgld	63, 45, 63
	vperm 31, 30, 31, 10
	vadduwm 15, 14, 15
	xxlxor 49, 47, 60
	xxsldwi 47, 47, 47, 1
	vperm 17, 17, 17, 5
	vadduwm 15, 15, 30
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 3
	vrlw 14, 14, 1
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vadduwm 12, 15, 19
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 12, 14, 12
	xxlxor 47, 44, 49
	xxsldwi 49, 50, 50, 3
	vperm 15, 15, 15, 5
	vperm 18, 13, 17, 6
	vmrghw 13, 19, 13
	xxlandc 47, 47, 32
	vadduwm 12, 12, 18
	vadduwm 16, 15, 16
	xxswapd	47, 47
	xxsldwi 44, 44, 44, 3
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 1
	vrlw 14, 14, 1
	vadduwm 29, 14, 12
	xxlxor 44, 61, 47
	vperm 15, 17, 17, 7
	vperm 12, 12, 12, 3
	vperm 17, 19, 30, 8
	vperm 19, 13, 30, 11
	vmrglw 13, 30, 13
	xxlandc 60, 44, 34
	vperm 12, 17, 15, 9
	vadduwm 16, 28, 16
	xxmrgld	62, 45, 51
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 15, 29, 12
	xxmrgld	51, 44, 51
	vperm 19, 31, 19, 10
	vadduwm 15, 14, 15
	xxlxor 49, 47, 60
	xxsldwi 47, 47, 47, 1
	vperm 17, 17, 17, 5
	vadduwm 15, 15, 31
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 3
	vrlw 14, 14, 1
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vadduwm 13, 15, 30
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 13, 14, 13
	xxlxor 47, 45, 49
	xxsldwi 49, 50, 50, 3
	vperm 15, 15, 15, 5
	vperm 18, 12, 17, 6
	xxlandc 47, 47, 32
	vadduwm 13, 13, 18
	xxsldwi 50, 50, 50, 3
	vadduwm 16, 15, 16
	xxswapd	47, 47
	xxsldwi 45, 45, 45, 3
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 1
	vrlw 14, 14, 1
	vadduwm 29, 14, 13
	xxlxor 45, 61, 47
	vperm 15, 17, 17, 7
	vperm 13, 13, 13, 3
	vperm 17, 30, 31, 8
	vmrghw 30, 30, 12
	xxlandc 60, 45, 34
	vperm 13, 17, 15, 9
	vadduwm 16, 28, 16
	vperm 12, 30, 31, 11
	xxlxor 46, 48, 46
	vmrglw 31, 31, 30
	vrlw 14, 14, 4
	vadduwm 15, 29, 13
	vperm 30, 13, 18, 6
	vperm 18, 18, 18, 7
	xxmrgld	63, 63, 44
	vadduwm 15, 14, 15
	xxlxor 49, 47, 60
	xxsldwi 47, 47, 47, 1
	vperm 17, 17, 17, 5
	vadduwm 15, 15, 19
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 3
	vrlw 14, 14, 1
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vadduwm 15, 15, 31
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vperm 17, 17, 17, 5
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 1
	vrlw 29, 14, 1
	vadduwm 14, 15, 30
	xxswapd	47, 49
	xxsldwi 46, 46, 46, 3
	vadduwm 17, 29, 14
	xxlxor 46, 49, 47
	lvx 15, 0, 4
	vperm 14, 14, 14, 3
	vperm 15, 31, 19, 15
	xxlandc 60, 46, 34
	vperm 14, 15, 18, 9
	vadduwm 16, 28, 16
	xxlxor 50, 48, 61
	vrlw 18, 18, 4
	vadduwm 17, 17, 14
	vadduwm 17, 18, 17
	xxlxor 61, 49, 60
	xxmrgld	60, 45, 44
	xxsldwi 49, 49, 49, 1
	vmrghw 13, 31, 13
	vperm 29, 29, 29, 5
	vperm 28, 19, 28, 10
	xxlandc 61, 61, 32
	vadduwm 17, 17, 28
	vadduwm 16, 29, 16
	xxswapd	61, 61
	xxlxor 50, 48, 50
	xxsldwi 48, 48, 48, 3
	vrlw 18, 18, 1
	vadduwm 17, 18, 17
	xxlxor 61, 49, 61
	vperm 31, 29, 29, 3
	vperm 29, 13, 19, 11
	vmrglw 13, 19, 13
	xxlandc 63, 63, 34
	vadduwm 16, 31, 16
	xxmrgld	45, 45, 61
	xxlxor 50, 48, 50
	vadduwm 17, 17, 13
	vrlw 18, 18, 4
	vperm 8, 13, 28, 8
	vadduwm 17, 18, 17
	xxlxor 51, 49, 63
	xxsldwi 63, 62, 62, 3
	vperm 19, 19, 19, 5
	vperm 6, 15, 31, 6
	vperm 7, 31, 31, 7
	xxlandc 51, 51, 32
	vadduwm 6, 17, 6
	vadduwm 15, 19, 16
	xxswapd	49, 51
	xxsldwi 38, 38, 38, 3
	vperm 7, 8, 7, 9
	xxlxor 48, 47, 50
	xxsldwi 47, 47, 47, 1
	xxmrgld	41, 46, 61
	vrlw 16, 16, 1
	vperm 9, 28, 9, 10
	vadduwm 6, 16, 6
	xxlxor 49, 38, 49
	vadduwm 6, 6, 7
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 15, 17, 15
	xxlxor 40, 47, 48
	vrlw 8, 8, 4
	vadduwm 6, 8, 6
	xxlxor 39, 38, 49
	xxsldwi 38, 38, 38, 1
	vperm 7, 7, 7, 5
	vadduwm 6, 6, 9
	xxlandc 39, 39, 32
	vadduwm 15, 7, 15
	xxswapd	39, 39
	xxlxor 40, 47, 40
	xxsldwi 41, 47, 47, 3
	vrlw 8, 8, 1
	vadduwm 6, 8, 6
	xxlxor 39, 38, 39
	vperm 3, 7, 7, 3
	vmrghw 7, 13, 14
	xxlandc 34, 35, 34
	vperm 3, 7, 28, 11
	vmrglw 7, 12, 7
	vadduwm 9, 2, 9
	xxlxor 40, 41, 40
	vrlw 4, 8, 4
	xxmrgld	35, 39, 35
	vadduwm 3, 6, 3
	vadduwm 3, 4, 3
	xxlxor 34, 35, 34
	xxsldwi 0, 35, 35, 3
	vperm 2, 2, 2, 5
	xxlandc 34, 34, 32
	vadduwm 5, 2, 9
	xxswapd	34, 34
	xxlxor 36, 37, 36
	xxsldwi 1, 37, 37, 1
	vrlw 4, 4, 1
	xxlxor 0, 1, 0
	xxswapd	0, 0
	xxlxor 1, 36, 34
	stxvd2x 0, 0, 3
	xxswapd	1, 1
	stxvd2x 1, 3, 8
	li 3, -16
	lxvd2x 63, 1, 3
	li 3, -32
	lxvd2x 62, 1, 3
	li 3, -48
	lxvd2x 61, 1, 3
	li 3, -64
	lxvd2x 60, 1, 3
	blr
	.long	0
	.quad	0
.Lfunc_end0:
	.size	_blake3_compress_in_place_sse41, .Lfunc_end0-.Lfunc_begin0

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
.LCPI1_4:
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
.LCPI1_5:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI1_6:
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
.LCPI1_7:
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
.LCPI1_8:
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	26
	.byte	25
	.byte	24
	.byte	27
	.byte	22
	.byte	21
	.byte	20
	.byte	23
	.byte	18
	.byte	17
	.byte	16
	.byte	19
.LCPI1_9:
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
.LCPI1_10:
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
.LCPI1_11:
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI1_12:
	.byte	19
	.byte	18
	.byte	17
	.byte	16
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	31
	.byte	31
	.byte	31
.LCPI1_13:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	11
	.byte	10
	.byte	9
	.byte	8
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	3
	.byte	2
	.byte	1
	.byte	0
.LCPI1_14:
	.byte	31
	.byte	30
	.byte	29
	.byte	28
	.byte	23
	.byte	22
	.byte	21
	.byte	20
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	27
	.byte	26
	.byte	25
	.byte	24
.LCPI1_15:
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
.LCPI1_16:
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
	.text
	.globl	_blake3_compress_xof_sse41
	.p2align	2
	.type	_blake3_compress_xof_sse41,@function
_blake3_compress_xof_sse41:
.Lfunc_begin1:
.Lfunc_gep1:
	addis 2, 12, .TOC.-.Lfunc_gep1@ha
	addi 2, 2, .TOC.-.Lfunc_gep1@l
.Lfunc_lep1:
	.localentry	_blake3_compress_xof_sse41, .Lfunc_lep1-.Lfunc_gep1
	li 9, -64
	rldicl 10, 6, 32, 32
	lxvd2x 0, 0, 3
	xxlxor 40, 40, 40
	stxvd2x 60, 1, 9
	li 9, -48
	stxvd2x 61, 1, 9
	li 9, -32
	stxvd2x 62, 1, 9
	li 9, -16
	stxvd2x 63, 1, 9
	li 9, 16
	lxvd2x 1, 3, 9
	stw 6, -96(1)
	addi 6, 1, -96
	vspltisw 14, -16
	stw 10, -80(1)
	addi 10, 1, -80
	vspltisw 15, 9
	lvx 2, 0, 6
	lvx 3, 0, 10
	addis 6, 2, .LCPI1_0@toc@ha
	addi 10, 1, -112
	addi 6, 6, .LCPI1_0@toc@l
	stw 5, -112(1)
	addis 5, 2, .LCPI1_2@toc@ha
	vmrglw 2, 3, 2
	lvx 3, 0, 6
	lvx 4, 0, 10
	addis 6, 2, .LCPI1_1@toc@ha
	addi 5, 5, .LCPI1_2@toc@l
	stw 7, -128(1)
	addi 6, 6, .LCPI1_1@toc@l
	lvx 1, 0, 5
	addi 5, 1, -128
	addis 7, 2, .LCPI1_11@toc@ha
	lxvd2x 2, 0, 4
	lxvd2x 3, 4, 9
	addi 7, 7, .LCPI1_11@toc@l
	lvx 6, 0, 5
	addis 5, 2, .LCPI1_3@toc@ha
	addi 5, 5, .LCPI1_3@toc@l
	xxswapd	37, 2
	vperm 3, 4, 2, 3
	lvx 4, 0, 6
	addis 6, 2, .LCPI1_4@toc@ha
	xxswapd	32, 3
	addi 6, 6, .LCPI1_4@toc@l
	vperm 9, 0, 5, 1
	vperm 3, 6, 3, 4
	xxswapd	36, 0
	xxswapd	38, 1
	vadduwm 4, 9, 4
	xxpermdi 34, 35, 34, 1
	vadduwm 7, 4, 6
	lvx 3, 0, 6
	lvx 4, 0, 5
	addis 5, 2, .LCPI1_5@toc@ha
	addis 6, 2, .LCPI1_6@toc@ha
	addi 5, 5, .LCPI1_5@toc@l
	addi 6, 6, .LCPI1_6@toc@l
	lvx 11, 0, 5
	lvx 12, 0, 6
	addis 6, 2, .LCPI1_8@toc@ha
	addis 5, 2, .LCPI1_7@toc@ha
	xxlxor 42, 39, 34
	addi 6, 6, .LCPI1_8@toc@l
	addi 5, 5, .LCPI1_7@toc@l
	vcmpgtsb 2, 8, 4
	vperm 4, 10, 10, 3
	vspltisw 10, 10
	xxlandc 45, 36, 34
	vadduwm 4, 10, 10
	vadduwm 10, 13, 11
	vperm 11, 0, 5, 12
	lvx 0, 0, 5
	li 5, 48
	xxlxor 37, 42, 38
	lxvd2x 1, 4, 5
	vcmpgtsb 0, 8, 0
	vrlw 6, 5, 4
	vadduwm 5, 7, 11
	vadduwm 7, 6, 5
	lvx 5, 0, 6
	li 6, 32
	lxvd2x 0, 4, 6
	addis 4, 2, .LCPI1_9@toc@ha
	xxlxor 44, 39, 45
	xxswapd	45, 1
	addi 4, 4, .LCPI1_9@toc@l
	vperm 8, 12, 12, 5
	xxswapd	44, 0
	vperm 16, 13, 12, 1
	vsubuwm 1, 15, 14
	lvx 14, 0, 4
	addis 4, 2, .LCPI1_10@toc@ha
	xxlandc 40, 40, 32
	addi 4, 4, .LCPI1_10@toc@l
	vadduwm 10, 8, 10
	xxswapd	40, 40
	vperm 13, 12, 13, 14
	xxlxor 38, 42, 38
	xxsldwi 42, 42, 42, 3
	vadduwm 7, 7, 16
	xxsldwi 48, 48, 48, 1
	vrlw 6, 6, 1
	xxsldwi 39, 39, 39, 1
	vadduwm 7, 6, 7
	xxlxor 40, 39, 40
	vperm 8, 8, 8, 3
	xxlandc 40, 40, 34
	vadduwm 10, 8, 10
	xxlxor 38, 42, 38
	vrlw 12, 6, 4
	vadduwm 6, 7, 13
	vadduwm 7, 12, 6
	xxlxor 38, 39, 40
	vperm 8, 6, 6, 5
	lvx 6, 0, 4
	addis 4, 2, .LCPI1_12@toc@ha
	addi 4, 4, .LCPI1_12@toc@l
	vperm 14, 11, 9, 6
	xxlandc 40, 40, 32
	vadduwm 10, 8, 10
	xxswapd	40, 40
	vadduwm 7, 7, 14
	xxsldwi 46, 46, 46, 3
	xxlxor 44, 42, 44
	xxsldwi 42, 42, 42, 1
	xxsldwi 39, 39, 39, 3
	vrlw 15, 12, 1
	vadduwm 17, 15, 7
	lvx 7, 0, 4
	addis 4, 2, .LCPI1_13@toc@ha
	addi 4, 4, .LCPI1_13@toc@l
	xxlxor 44, 49, 40
	lvx 8, 0, 7
	vperm 18, 9, 9, 7
	lvx 9, 0, 4
	addis 4, 2, .LCPI1_14@toc@ha
	vperm 12, 12, 12, 3
	addi 4, 4, .LCPI1_14@toc@l
	vperm 19, 13, 16, 8
	xxlandc 63, 44, 34
	vperm 12, 19, 18, 9
	vadduwm 30, 31, 10
	xxmrgld	51, 43, 45
	vmrghw 13, 13, 11
	xxlxor 42, 62, 47
	vrlw 15, 10, 4
	vadduwm 10, 17, 12
	vadduwm 17, 15, 10
	xxlxor 42, 49, 63
	xxsldwi 49, 49, 49, 1
	vperm 18, 10, 10, 5
	lvx 10, 0, 4
	addis 4, 2, .LCPI1_15@toc@ha
	addi 4, 4, .LCPI1_15@toc@l
	lvx 11, 0, 4
	addis 4, 2, .LCPI1_16@toc@ha
	vperm 19, 16, 19, 10
	addi 4, 4, .LCPI1_16@toc@l
	xxlandc 50, 50, 32
	vadduwm 31, 18, 30
	xxswapd	50, 50
	vadduwm 17, 17, 19
	xxlxor 47, 63, 47
	xxsldwi 63, 63, 63, 3
	vperm 30, 13, 16, 11
	vrlw 15, 15, 1
	vmrglw 13, 16, 13
	vadduwm 17, 15, 17
	xxlxor 50, 49, 50
	vperm 18, 18, 18, 3
	xxlandc 50, 50, 34
	vadduwm 16, 18, 31
	xxmrgld	63, 45, 62
	xxmrgld	62, 44, 62
	xxlxor 47, 48, 47
	vadduwm 13, 17, 31
	vrlw 15, 15, 4
	vperm 30, 19, 30, 10
	vadduwm 13, 15, 13
	xxlxor 49, 45, 50
	vperm 18, 12, 14, 6
	vperm 17, 17, 17, 5
	vperm 14, 14, 14, 7
	vmrghw 12, 31, 12
	vadduwm 13, 13, 18
	xxlandc 49, 49, 32
	xxsldwi 45, 45, 45, 3
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 47, 48, 47
	xxsldwi 48, 48, 48, 1
	vrlw 15, 15, 1
	vadduwm 29, 15, 13
	xxlxor 45, 61, 49
	vperm 17, 31, 19, 8
	vperm 13, 13, 13, 3
	vperm 31, 12, 19, 11
	vmrglw 12, 19, 12
	xxlandc 60, 45, 34
	vperm 13, 17, 14, 9
	vadduwm 16, 28, 16
	xxmrgld	51, 44, 63
	xxlxor 46, 48, 47
	vrlw 14, 14, 4
	vadduwm 15, 29, 13
	xxmrgld	63, 45, 63
	vperm 31, 30, 31, 10
	vadduwm 15, 14, 15
	xxlxor 49, 47, 60
	xxsldwi 47, 47, 47, 1
	vperm 17, 17, 17, 5
	vadduwm 15, 15, 30
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 3
	vrlw 14, 14, 1
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vadduwm 12, 15, 19
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 12, 14, 12
	xxlxor 47, 44, 49
	xxsldwi 49, 50, 50, 3
	vperm 15, 15, 15, 5
	vperm 18, 13, 17, 6
	vmrghw 13, 19, 13
	xxlandc 47, 47, 32
	vadduwm 12, 12, 18
	vadduwm 16, 15, 16
	xxswapd	47, 47
	xxsldwi 44, 44, 44, 3
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 1
	vrlw 14, 14, 1
	vadduwm 29, 14, 12
	xxlxor 44, 61, 47
	vperm 15, 17, 17, 7
	vperm 12, 12, 12, 3
	vperm 17, 19, 30, 8
	vperm 19, 13, 30, 11
	vmrglw 13, 30, 13
	xxlandc 60, 44, 34
	vperm 12, 17, 15, 9
	vadduwm 16, 28, 16
	xxmrgld	62, 45, 51
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 15, 29, 12
	xxmrgld	51, 44, 51
	vperm 19, 31, 19, 10
	vadduwm 15, 14, 15
	xxlxor 49, 47, 60
	xxsldwi 47, 47, 47, 1
	vperm 17, 17, 17, 5
	vadduwm 15, 15, 31
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 3
	vrlw 14, 14, 1
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vadduwm 13, 15, 30
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 13, 14, 13
	xxlxor 47, 45, 49
	xxsldwi 49, 50, 50, 3
	vperm 15, 15, 15, 5
	vperm 18, 12, 17, 6
	xxlandc 47, 47, 32
	vadduwm 13, 13, 18
	xxsldwi 50, 50, 50, 3
	vadduwm 16, 15, 16
	xxswapd	47, 47
	xxsldwi 45, 45, 45, 3
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 1
	vrlw 14, 14, 1
	vadduwm 29, 14, 13
	xxlxor 45, 61, 47
	vperm 15, 17, 17, 7
	vperm 13, 13, 13, 3
	vperm 17, 30, 31, 8
	vmrghw 30, 30, 12
	xxlandc 60, 45, 34
	vperm 13, 17, 15, 9
	vadduwm 16, 28, 16
	vperm 12, 30, 31, 11
	xxlxor 46, 48, 46
	vmrglw 31, 31, 30
	vrlw 14, 14, 4
	vadduwm 15, 29, 13
	vperm 30, 13, 18, 6
	vperm 18, 18, 18, 7
	xxmrgld	63, 63, 44
	vadduwm 15, 14, 15
	xxlxor 49, 47, 60
	xxsldwi 47, 47, 47, 1
	vperm 17, 17, 17, 5
	vadduwm 15, 15, 19
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxswapd	49, 49
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 3
	vrlw 14, 14, 1
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vadduwm 15, 15, 31
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	vrlw 14, 14, 4
	vadduwm 15, 14, 15
	xxlxor 49, 47, 49
	vperm 17, 17, 17, 5
	xxlandc 49, 49, 32
	vadduwm 16, 17, 16
	xxlxor 46, 48, 46
	xxsldwi 48, 48, 48, 1
	vrlw 29, 14, 1
	vadduwm 14, 15, 30
	xxswapd	47, 49
	xxsldwi 46, 46, 46, 3
	vadduwm 17, 29, 14
	xxlxor 46, 49, 47
	lvx 15, 0, 4
	vperm 14, 14, 14, 3
	vperm 15, 31, 19, 15
	xxlandc 60, 46, 34
	vperm 14, 15, 18, 9
	vadduwm 16, 28, 16
	xxlxor 50, 48, 61
	vrlw 18, 18, 4
	vadduwm 17, 17, 14
	vadduwm 17, 18, 17
	xxlxor 61, 49, 60
	xxmrgld	60, 45, 44
	xxsldwi 49, 49, 49, 1
	vmrghw 13, 31, 13
	vperm 29, 29, 29, 5
	vperm 28, 19, 28, 10
	xxlandc 61, 61, 32
	vadduwm 17, 17, 28
	vadduwm 16, 29, 16
	xxswapd	61, 61
	xxlxor 50, 48, 50
	xxsldwi 48, 48, 48, 3
	vrlw 18, 18, 1
	vadduwm 17, 18, 17
	xxlxor 61, 49, 61
	vperm 31, 29, 29, 3
	vperm 29, 13, 19, 11
	vmrglw 13, 19, 13
	xxlandc 63, 63, 34
	vadduwm 16, 31, 16
	xxmrgld	45, 45, 61
	xxlxor 50, 48, 50
	vadduwm 17, 17, 13
	vrlw 18, 18, 4
	vperm 8, 13, 28, 8
	vadduwm 17, 18, 17
	xxlxor 51, 49, 63
	xxsldwi 63, 62, 62, 3
	vperm 19, 19, 19, 5
	vperm 6, 15, 31, 6
	vperm 7, 31, 31, 7
	xxlandc 51, 51, 32
	vadduwm 6, 17, 6
	vadduwm 15, 19, 16
	xxswapd	49, 51
	xxsldwi 38, 38, 38, 3
	vperm 7, 8, 7, 9
	xxlxor 48, 47, 50
	xxsldwi 47, 47, 47, 1
	xxmrgld	41, 46, 61
	vrlw 16, 16, 1
	vperm 9, 28, 9, 10
	vadduwm 6, 16, 6
	xxlxor 49, 38, 49
	vadduwm 6, 6, 7
	vperm 17, 17, 17, 3
	xxlandc 49, 49, 34
	vadduwm 15, 17, 15
	xxlxor 40, 47, 48
	vrlw 8, 8, 4
	vadduwm 6, 8, 6
	xxlxor 39, 38, 49
	xxsldwi 38, 38, 38, 1
	vperm 7, 7, 7, 5
	vadduwm 6, 6, 9
	xxlandc 39, 39, 32
	vadduwm 15, 7, 15
	xxswapd	39, 39
	xxlxor 40, 47, 40
	xxsldwi 41, 47, 47, 3
	vrlw 8, 8, 1
	vadduwm 6, 8, 6
	xxlxor 39, 38, 39
	vperm 3, 7, 7, 3
	vmrghw 7, 13, 14
	xxlandc 34, 35, 34
	vperm 3, 7, 28, 11
	vmrglw 7, 12, 7
	vadduwm 9, 2, 9
	xxlxor 40, 41, 40
	vrlw 4, 8, 4
	xxmrgld	35, 39, 35
	vadduwm 3, 6, 3
	vadduwm 3, 4, 3
	xxlxor 34, 35, 34
	xxsldwi 0, 35, 35, 3
	vperm 2, 2, 2, 5
	xxlandc 34, 34, 32
	vadduwm 5, 2, 9
	xxswapd	34, 34
	xxlxor 36, 37, 36
	xxsldwi 1, 37, 37, 1
	vrlw 4, 4, 1
	xxlxor 0, 1, 0
	xxswapd	0, 0
	xxlxor 2, 36, 34
	stxvd2x 0, 0, 8
	xxswapd	2, 2
	stxvd2x 2, 8, 9
	lxvd2x 0, 0, 3
	xxswapd	35, 0
	xxlxor 0, 1, 35
	xxswapd	0, 0
	stxvd2x 0, 8, 6
	lxvd2x 0, 3, 9
	li 3, -16
	xxswapd	35, 0
	xxlxor 0, 34, 35
	xxswapd	0, 0
	stxvd2x 0, 8, 5
	lxvd2x 63, 1, 3
	li 3, -32
	lxvd2x 62, 1, 3
	li 3, -48
	lxvd2x 61, 1, 3
	li 3, -64
	lxvd2x 60, 1, 3
	blr
	.long	0
	.quad	0
.Lfunc_end1:
	.size	_blake3_compress_xof_sse41, .Lfunc_end1-.Lfunc_begin1

	.globl	_blake3_hash_many_sse41
	.p2align	2
	.type	_blake3_hash_many_sse41,@function
_blake3_hash_many_sse41:
.Lfunc_begin2:
.Lfunc_gep2:
	addis 2, 12, .TOC.-.Lfunc_gep2@ha
	addi 2, 2, .TOC.-.Lfunc_gep2@l
.Lfunc_lep2:
	.localentry	_blake3_hash_many_sse41, .Lfunc_lep2-.Lfunc_gep2
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
	bl blake3_hash4_sse41
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
	bl _blake3_compress_in_place_sse41
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
	.size	_blake3_hash_many_sse41, .Lfunc_end2-.Lfunc_begin2

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	4294967296
	.quad	12884901890
.LCPI3_1:
	.quad	-9223372034707292160
	.quad	-9223372034707292160
.LCPI3_2:
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
.LCPI3_3:
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
.LCPI3_4:
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
.LCPI3_5:
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
.LCPI3_6:
	.quad	274877907008
	.quad	274877907008
.LCPI3_7:
	.long	1779033703
	.long	1779033703
	.long	1779033703
	.long	1779033703
.LCPI3_8:
	.long	3144134277
	.long	3144134277
	.long	3144134277
	.long	3144134277
.LCPI3_9:
	.long	1013904242
	.long	1013904242
	.long	1013904242
	.long	1013904242
.LCPI3_10:
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.long	2773480762
.LCPI3_11:
	.byte	30
	.byte	29
	.byte	28
	.byte	31
	.byte	26
	.byte	25
	.byte	24
	.byte	27
	.byte	22
	.byte	21
	.byte	20
	.byte	23
	.byte	18
	.byte	17
	.byte	16
	.byte	19
	.text
	.p2align	2
	.type	blake3_hash4_sse41,@function
blake3_hash4_sse41:
.Lfunc_begin3:
.Lfunc_gep3:
	addis 2, 12, .TOC.-.Lfunc_gep3@ha
	addi 2, 2, .TOC.-.Lfunc_gep3@l
.Lfunc_lep3:
	.localentry	blake3_hash4_sse41, .Lfunc_lep3-.Lfunc_gep3
	stdu 1, -608(1)
	li 11, 240
	std 21, 432(1)
	stfd 21, 520(1)
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
	stfd 22, 528(1)
	addi 12, 1, 224
	stxvd2x 62, 1, 11
	li 11, 416
	stfd 23, 536(1)
	neg 7, 7
	stxvd2x 63, 1, 11
	lwz 11, 0(5)
	cmpldi	4, 0
	stfd 24, 544(1)
	stfd 25, 552(1)
	stw 11, 224(1)
	stfd 26, 560(1)
	lwz 11, 4(5)
	stfd 27, 568(1)
	stfd 28, 576(1)
	stfd 29, 584(1)
	stfd 30, 592(1)
	stfd 31, 600(1)
	lvx 2, 0, 12
	stw 11, 96(1)
	addi 12, 1, 96
	lwz 11, 8(5)
	lvx 3, 0, 12
	addi 12, 1, 112
	xxspltw 63, 34, 3
	stw 11, 112(1)
	xxspltw 61, 35, 3
	lwz 11, 12(5)
	lvx 4, 0, 12
	addi 12, 1, 128
	stw 11, 128(1)
	xxspltw 3, 36, 3
	lwz 11, 16(5)
	lvx 5, 0, 12
	addi 12, 1, 144
	stw 11, 144(1)
	xxspltw 4, 37, 3
	lwz 11, 20(5)
	lvx 0, 0, 12
	addi 12, 1, 160
	stw 11, 160(1)
	xxspltw 57, 32, 3
	lwz 11, 24(5)
	lvx 2, 0, 12
	stw 11, 176(1)
	addi 11, 1, 176
	xxspltw 41, 34, 3
	lwz 5, 28(5)
	lvx 3, 0, 11
	stw 5, 192(1)
	addi 5, 1, 192
	xxspltw 62, 35, 3
	lvx 2, 0, 5
	stw 7, 64(1)
	addi 5, 1, 64
	lvx 3, 0, 5
	stw 6, 208(1)
	addi 7, 1, 208
	xxspltw 43, 34, 3
	ld 5, 640(1)
	lvx 2, 0, 7
	rldicl 6, 6, 32, 32
	stw 6, 80(1)
	beq	0, .LBB3_6
	addis 6, 2, .LCPI3_0@toc@ha
	xxspltw 1, 35, 3
	addis 7, 2, .LCPI3_2@toc@ha
	xxlxor 36, 36, 36
	addis 27, 2, .LCPI3_7@toc@ha
	or 25, 9, 8
	addis 9, 2, .LCPI3_8@toc@ha
	addis 30, 2, .LCPI3_4@toc@ha
	addis 29, 2, .LCPI3_5@toc@ha
	addis 28, 2, .LCPI3_6@toc@ha
	addis 26, 2, .LCPI3_11@toc@ha
	ld 11, 16(3)
	addi 6, 6, .LCPI3_0@toc@l
	xxspltw 34, 34, 3
	addi 27, 27, .LCPI3_7@toc@l
	addi 9, 9, .LCPI3_8@toc@l
	addi 0, 30, .LCPI3_4@toc@l
	addi 30, 29, .LCPI3_5@toc@l
	addis 29, 2, .LCPI3_9@toc@ha
	addi 28, 28, .LCPI3_6@toc@l
	ld 12, 24(3)
	lxvd2x 0, 0, 6
	addis 6, 2, .LCPI3_1@toc@ha
	addi 6, 6, .LCPI3_1@toc@l
	lxvd2x 2, 0, 6
	addi 6, 7, .LCPI3_2@toc@l
	ld 7, 8(3)
	xxswapd	35, 0
	lvx 5, 0, 6
	addis 6, 2, .LCPI3_3@toc@ha
	lxvd2x 0, 0, 28
	addi 28, 26, .LCPI3_11@toc@l
	li 26, 4
	addi 6, 6, .LCPI3_3@toc@l
	lvx 10, 0, 28
	li 28, 32
	xxswapd	32, 2
	vcmpgtsb 5, 4, 5
	xxland 35, 1, 35
	vadduwm 1, 3, 2
	lvx 2, 0, 6
	addi 6, 1, 80
	xxlor 35, 35, 32
	vcmpgtsb 2, 4, 2
	lvx 4, 0, 6
	ld 6, 0(3)
	addi 3, 3, -8
	xxlxor 32, 33, 32
	xxlor 5, 33, 33
	lvx 1, 0, 27
	xxspltw 36, 36, 3
	li 27, 48
	vcmpgtsw 3, 3, 0
	lvx 0, 0, 0
	addi 0, 29, .LCPI3_9@toc@l
	li 29, 0
	xxlor 7, 33, 33
	xxlor 6, 32, 32
	lvx 0, 0, 30
	addis 30, 2, .LCPI3_10@toc@ha
	xxlnor 33, 34, 34
	lvx 2, 0, 9
	addi 30, 30, .LCPI3_10@toc@l
	li 9, 0
	xxlor 29, 32, 32
	xxlor 8, 34, 34
	lvx 2, 0, 0
	addi 0, 1, 48
	xxlnor 28, 37, 37
	xxlor 9, 34, 34
	vsubuwm 2, 4, 3
	xxlor 37, 4, 4
	xxlor 10, 34, 34
	lvx 2, 0, 30
	li 30, 16
	xxlor 32, 3, 3
	xxlor 11, 34, 34
.LBB3_2:
	mr	24, 29
	addi 29, 29, 1
	xxlor 31, 41, 41
	cmpld	29, 4
	xxlor 30, 43, 43
	iseleq	23, 10, 9
	or 25, 23, 25
	xxlor 27, 61, 61
	clrlwi	23, 25, 24
	sldi 25, 24, 6
	xxlor 12, 63, 63
	stw 23, 48(1)
	add 24, 6, 25
	add 23, 7, 25
	lxvd2x 1, 6, 25
	lxvd2x 2, 7, 25
	add 22, 11, 25
	add 21, 12, 25
	lxvd2x 3, 11, 25
	lxvd2x 4, 12, 25
	lvx 27, 0, 0
	xxswapd	34, 1
	lxvd2x 1, 24, 30
	xxswapd	35, 2
	lxvd2x 2, 23, 30
	xxswapd	41, 3
	lxvd2x 3, 22, 30
	xxswapd	38, 4
	lxvd2x 4, 21, 30
	xxswapd	39, 1
	lxvd2x 1, 24, 28
	xxswapd	40, 2
	lxvd2x 2, 23, 28
	xxswapd	47, 3
	lxvd2x 3, 22, 28
	xxswapd	48, 4
	lxvd2x 4, 21, 28
	xxswapd	56, 1
	lxvd2x 1, 24, 27
	mr	24, 3
	xxswapd	55, 2
	lxvd2x 2, 23, 27
	xxswapd	54, 3
	lxvd2x 3, 22, 27
	xxswapd	52, 4
	lxvd2x 4, 21, 27
	mtctr 26
	xxswapd	53, 1
	xxswapd	58, 2
	xxswapd	43, 3
	xxswapd	51, 4
.LBB3_3:
	ldu 23, 8(24)
	add 23, 23, 25
	addi 23, 23, 256
	dcbt 0, 23
	bdnz .LBB3_3
	xxlor 44, 6, 6
	vspltisw 18, 10
	mr	25, 8
	vmrglw 13, 3, 2
	vperm 4, 3, 2, 12
	vmrghw 3, 3, 2
	vperm 14, 6, 9, 12
	vmrglw 2, 6, 9
	vmrghw 29, 6, 9
	vperm 6, 8, 7, 12
	vmrglw 9, 8, 7
	vmrghw 7, 8, 7
	vperm 8, 16, 15, 12
	vmrglw 28, 16, 15
	vmrghw 16, 16, 15
	vperm 15, 23, 24, 12
	xxmrgld	63, 34, 45
	vmrglw 17, 20, 22
	vadduwm 13, 18, 18
	xxspltw 1, 59, 3
	xxmrgld	36, 46, 36
	xxlor 2, 5, 5
	xxmrgld	34, 60, 41
	xxlor 41, 12, 12
	xxlor 13, 63, 63
	xxmrgld	40, 40, 38
	xxlor 23, 47, 47
	vmrglw 15, 23, 24
	vmrghw 23, 23, 24
	vmrghw 24, 19, 11
	vadduwm 18, 31, 9
	xxmrgld	41, 48, 39
	xxlor 63, 27, 27
	xxmrghd	39, 48, 39
	vadduwm 18, 18, 25
	xxlor 21, 47, 47
	vperm 15, 20, 22, 12
	vmrghw 20, 20, 22
	vmrghw 22, 26, 21
	xxlor 12, 41, 41
	xxlxor 59, 50, 5
	xxlor 3, 34, 34
	xxlor 22, 47, 47
	vperm 15, 26, 21, 12
	xxlor 2, 10, 10
	vadduwm 18, 18, 4
	xxlor 2, 62, 62
	xxlor 26, 39, 39
	xxlor 27, 40, 40
	xxlor 24, 47, 47
	vmrglw 15, 26, 21
	vspltisw 26, -16
	vspltisw 21, 9
	xxlor 25, 47, 47
	vperm 15, 19, 11, 12
	vmrglw 12, 19, 11
	xxmrgld	51, 61, 35
	vsubuwm 11, 21, 26
	vadduwm 21, 9, 5
	xxlor 41, 31, 31
	vadduwm 28, 19, 31
	xxswapd	63, 0
	vadduwm 26, 2, 0
	xxmrghd	34, 61, 35
	vadduwm 28, 28, 9
	xxlor 32, 30, 30
	xxlxor 46, 60, 10
	vadduwm 21, 21, 0
	xxlor 37, 29, 29
	vadduwm 26, 26, 30
	vperm 27, 27, 27, 5
	vperm 14, 14, 14, 5
	xxlxor 61, 53, 1
	xxlxor 63, 58, 63
	vperm 29, 29, 29, 5
	vperm 31, 31, 31, 5
	vadduwm 28, 28, 2
	xxlor 1, 34, 34
	xxland 59, 59, 28
	xxland 46, 46, 28
	xxlor 34, 7, 7
	xxlor 35, 8, 8
	xxlor 4, 51, 51
	xxland 61, 61, 28
	vadduwm 2, 27, 2
	vadduwm 3, 14, 3
	xxlor 51, 11, 11
	xxlor 30, 36, 36
	xxland 63, 63, 28
	xxlxor 36, 34, 57
	xxlxor 57, 35, 41
	xxlor 41, 9, 9
	vadduwm 30, 29, 19
	vadduwm 9, 31, 9
	xxlxor 48, 62, 32
	xxmrgld	32, 22, 23
	xxlxor 38, 41, 2
	vrlw 4, 4, 13
	vrlw 25, 25, 13
	vrlw 16, 16, 13
	vrlw 6, 6, 13
	vadduwm 21, 21, 7
	xxmrgld	39, 49, 21
	vadduwm 26, 26, 8
	xxmrghd	40, 52, 55
	vadduwm 18, 4, 18
	vadduwm 28, 25, 28
	vadduwm 21, 16, 21
	vadduwm 26, 6, 26
	xxlxor 59, 50, 59
	xxlxor 51, 60, 46
	xxmrgld	46, 52, 55
	xxlxor 61, 53, 61
	xxlxor 63, 58, 63
	vperm 27, 27, 27, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 31, 31, 31, 10
	vadduwm 18, 18, 7
	xxlor 2, 39, 39
	xxmrgld	39, 44, 25
	xxland 59, 59, 33
	xxland 51, 51, 33
	xxland 61, 61, 33
	xxland 63, 63, 33
	vadduwm 2, 27, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 31, 9
	xxlxor 36, 34, 36
	xxlxor 57, 35, 57
	xxlxor 48, 62, 48
	xxlxor 38, 41, 38
	vrlw 25, 25, 11
	vrlw 12, 16, 11
	vrlw 4, 4, 11
	xxmrgld	48, 56, 54
	vrlw 6, 6, 11
	vadduwm 26, 26, 7
	xxmrghd	56, 56, 54
	vadduwm 28, 28, 14
	vadduwm 21, 21, 16
	vadduwm 18, 25, 18
	vadduwm 26, 12, 26
	vadduwm 21, 4, 21
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 63, 53, 63
	xxlxor 49, 60, 59
	vperm 29, 29, 29, 5
	vperm 19, 19, 19, 5
	vperm 31, 31, 31, 5
	vperm 17, 17, 17, 5
	xxlor 25, 39, 39
	xxmrgld	39, 47, 24
	vadduwm 18, 18, 0
	xxland 61, 61, 28
	xxland 51, 51, 28
	xxland 52, 63, 28
	xxland 49, 49, 28
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 20, 3
	vadduwm 30, 17, 30
	xxlxor 57, 41, 57
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	xxlxor 38, 62, 38
	vrlw 15, 25, 13
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	vrlw 6, 6, 13
	vadduwm 26, 26, 7
	vadduwm 25, 21, 24
	vadduwm 28, 28, 8
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 52
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 10
	vperm 19, 19, 19, 10
	vperm 22, 22, 22, 10
	vperm 17, 17, 17, 10
	xxlor 52, 4, 4
	xxlor 55, 1, 1
	xxland 61, 61, 33
	xxland 51, 51, 33
	xxland 54, 54, 33
	xxland 49, 49, 33
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 36, 35, 36
	xxlxor 44, 34, 44
	xxlxor 38, 62, 38
	vrlw 4, 4, 11
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 6, 6, 11
	xxlor 53, 3, 3
	vadduwm 18, 18, 20
	vadduwm 28, 28, 23
	xxlor 59, 26, 26
	vadduwm 25, 25, 21
	vadduwm 26, 26, 27
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 22, 22, 22, 5
	vmr	31, 7
	xxlor 39, 12, 12
	xxland 49, 49, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 54, 54, 28
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 4, 4, 13
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 6, 6, 13
	vadduwm 18, 18, 7
	vadduwm 28, 28, 14
	xxlor 39, 13, 13
	vadduwm 25, 25, 31
	vadduwm 26, 26, 7
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 22, 22, 22, 10
	xxlor 39, 30, 30
	xxlor 4, 46, 46
	xxland 49, 49, 33
	xxland 51, 51, 33
	xxland 61, 61, 33
	xxland 54, 54, 33
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 4, 4, 11
	vrlw 6, 6, 11
	vadduwm 18, 18, 7
	xxlor 46, 25, 25
	vadduwm 26, 26, 0
	vadduwm 25, 25, 24
	vadduwm 28, 28, 14
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 5
	vperm 19, 19, 19, 5
	vperm 22, 22, 22, 5
	vperm 17, 17, 17, 5
	xxlor 39, 2, 2
	xxlor 23, 12, 12
	xxland 61, 61, 28
	xxland 51, 51, 28
	xxland 54, 54, 28
	xxland 49, 49, 28
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	xxlxor 38, 62, 38
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	vrlw 6, 6, 13
	xxlor 12, 32, 32
	vadduwm 18, 18, 8
	xxlor 32, 27, 27
	vadduwm 26, 26, 16
	vadduwm 25, 25, 7
	vadduwm 28, 28, 0
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 10
	vperm 19, 19, 19, 10
	vperm 22, 22, 22, 10
	vperm 17, 17, 17, 10
	xxlor 3, 56, 56
	vmr	24, 8
	xxland 61, 61, 33
	xxland 51, 51, 33
	xxland 54, 54, 33
	xxland 49, 49, 33
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 36, 35, 36
	xxlxor 44, 34, 44
	xxlxor 38, 62, 38
	vrlw 4, 4, 11
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vadduwm 18, 18, 23
	xxlor 40, 4, 4
	vrlw 6, 6, 11
	vadduwm 26, 26, 31
	vmr	23, 31
	xxlor 63, 26, 26
	vadduwm 28, 28, 8
	vadduwm 25, 25, 31
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 22, 22, 22, 5
	vadduwm 18, 18, 21
	xxlor 27, 53, 53
	xxland 49, 49, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 54, 54, 28
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 4, 4, 13
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	xxlor 53, 25, 25
	vrlw 6, 6, 13
	vadduwm 28, 28, 21
	vadduwm 25, 25, 16
	vadduwm 26, 26, 20
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 22, 22, 22, 10
	xxlor 26, 52, 52
	vmr	20, 16
	xxland 49, 49, 33
	xxland 51, 51, 33
	xxland 61, 61, 33
	xxland 54, 54, 33
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 4, 4, 11
	xxlor 48, 23, 23
	vrlw 6, 6, 11
	vadduwm 18, 18, 16
	xxlor 59, 12, 12
	vadduwm 26, 26, 24
	vadduwm 25, 25, 7
	vadduwm 28, 28, 27
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 5
	vperm 19, 19, 19, 5
	vperm 22, 22, 22, 5
	vperm 17, 17, 17, 5
	xxlor 25, 56, 56
	xxlor 56, 3, 3
	xxland 61, 61, 28
	xxland 51, 51, 28
	xxland 54, 54, 28
	xxland 49, 49, 28
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	xxlxor 38, 62, 38
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	vrlw 6, 6, 13
	xxlor 48, 30, 30
	vmr	7, 0
	vadduwm 18, 18, 0
	xxlor 32, 13, 13
	vadduwm 26, 26, 24
	vadduwm 25, 25, 16
	vadduwm 28, 28, 0
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 10
	vperm 19, 19, 19, 10
	vperm 22, 22, 22, 10
	vperm 17, 17, 17, 10
	vadduwm 18, 18, 8
	vadduwm 28, 28, 21
	xxland 61, 61, 33
	xxland 51, 51, 33
	xxland 54, 54, 33
	xxland 49, 49, 33
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 36, 35, 36
	xxlxor 44, 34, 44
	xxlxor 38, 62, 38
	vrlw 4, 4, 11
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 6, 6, 11
	vadduwm 25, 25, 23
	vadduwm 26, 26, 20
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 22, 22, 22, 5
	vadduwm 18, 18, 31
	vadduwm 28, 28, 27
	xxland 49, 49, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 54, 54, 28
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 4, 4, 13
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 6, 6, 13
	xxlor 32, 1, 1
	vadduwm 25, 25, 24
	vadduwm 26, 26, 0
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 22, 22, 22, 10
	xxlor 32, 27, 27
	xxlor 3, 55, 55
	xxland 49, 49, 33
	xxland 51, 51, 33
	xxland 61, 61, 33
	xxland 54, 54, 33
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 4, 4, 11
	vrlw 6, 6, 11
	vadduwm 18, 18, 0
	xxlor 55, 25, 25
	vadduwm 26, 26, 7
	vadduwm 25, 25, 16
	vadduwm 28, 28, 23
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 5
	vperm 19, 19, 19, 5
	vperm 22, 22, 22, 5
	vperm 17, 17, 17, 5
	xxlor 24, 13, 13
	xxlor 46, 2, 2
	xxland 61, 61, 28
	xxland 51, 51, 28
	xxland 54, 54, 28
	xxland 49, 49, 28
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	xxlxor 38, 62, 38
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	xxlor 2, 40, 40
	xxlor 24, 1, 1
	xxlor 1, 27, 27
	vmr	8, 7
	xxlor 27, 48, 48
	xxlor 48, 13, 13
	vrlw 6, 6, 13
	xxlor 39, 23, 23
	vadduwm 18, 18, 16
	xxlor 32, 26, 26
	vadduwm 26, 26, 14
	vadduwm 25, 25, 7
	vadduwm 28, 28, 0
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 10
	vperm 19, 19, 19, 10
	vperm 22, 22, 22, 10
	vperm 17, 17, 17, 10
	vadduwm 18, 18, 21
	vadduwm 28, 28, 27
	xxland 61, 61, 33
	xxland 51, 51, 33
	xxland 54, 54, 33
	xxland 49, 49, 33
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 36, 35, 36
	xxlxor 44, 34, 44
	xxlxor 38, 62, 38
	vrlw 4, 4, 11
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 6, 6, 11
	vadduwm 25, 25, 20
	vadduwm 26, 26, 24
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 22, 22, 22, 5
	xxlor 30, 63, 63
	xxlor 63, 3, 3
	xxland 49, 49, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 54, 54, 28
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 4, 4, 13
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 6, 6, 13
	xxlor 12, 13, 13
	xxlor 12, 59, 59
	vadduwm 18, 18, 31
	vadduwm 28, 28, 23
	xxlor 59, 2, 2
	vadduwm 25, 25, 14
	vadduwm 26, 26, 27
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 22, 22, 22, 10
	xxlor 13, 56, 56
	xxlor 56, 30, 30
	xxland 49, 49, 33
	xxland 51, 51, 33
	xxland 61, 61, 33
	xxland 54, 54, 33
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 4, 4, 11
	vrlw 6, 6, 11
	vadduwm 18, 18, 24
	vadduwm 26, 26, 16
	vadduwm 25, 25, 7
	vadduwm 28, 28, 8
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 5
	vperm 19, 19, 19, 5
	vperm 22, 22, 22, 5
	vperm 17, 17, 17, 5
	xxlor 4, 23, 23
	xxlor 4, 53, 53
	xxland 61, 61, 28
	xxland 51, 51, 28
	xxland 54, 54, 28
	xxland 49, 49, 28
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	xxlxor 38, 62, 38
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	vrlw 6, 6, 13
	xxlor 56, 27, 27
	xxlor 53, 1, 1
	xxlor 3, 39, 39
	vmr	7, 0
	vadduwm 18, 18, 0
	xxlor 32, 24, 24
	vadduwm 26, 26, 24
	vadduwm 25, 25, 21
	vadduwm 28, 28, 0
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 10
	vperm 19, 19, 19, 10
	vperm 22, 22, 22, 10
	vperm 17, 17, 17, 10
	xxlor 32, 12, 12
	vadduwm 28, 28, 23
	xxland 61, 61, 33
	xxland 51, 51, 33
	xxland 54, 54, 33
	xxland 49, 49, 33
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 36, 35, 36
	xxlxor 44, 34, 44
	xxlxor 38, 62, 38
	vrlw 4, 4, 11
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 6, 6, 11
	xxlor 55, 13, 13
	vadduwm 18, 18, 0
	vadduwm 25, 25, 23
	vadduwm 26, 26, 14
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 22, 22, 22, 5
	vadduwm 18, 18, 20
	vadduwm 28, 28, 8
	xxland 49, 49, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 54, 54, 28
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 4, 4, 13
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 6, 6, 13
	xxlor 32, 4, 4
	vadduwm 25, 25, 24
	vadduwm 26, 26, 0
	vadduwm 18, 4, 18
	vadduwm 28, 15, 28
	vadduwm 25, 12, 25
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 60, 51
	xxlxor 61, 57, 61
	xxlxor 54, 58, 54
	vperm 17, 17, 17, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 22, 22, 22, 10
	vadduwm 18, 18, 31
	vadduwm 26, 26, 7
	xxland 49, 49, 33
	xxland 51, 51, 33
	xxland 61, 61, 33
	xxland 54, 54, 33
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 22, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 4, 4, 11
	vrlw 6, 6, 11
	vadduwm 25, 25, 21
	vadduwm 28, 28, 16
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 5
	vperm 19, 19, 19, 5
	vperm 22, 22, 22, 5
	vperm 17, 17, 17, 5
	xxlor 13, 52, 52
	xxlor 1, 63, 63
	xxland 61, 61, 28
	xxland 51, 51, 28
	xxland 54, 54, 28
	xxland 49, 49, 28
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 22, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	xxlxor 38, 62, 38
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	vmr	20, 7
	xxlor 63, 24, 24
	vrlw 6, 6, 13
	xxlor 32, 3, 3
	xxlor 39, 30, 30
	vadduwm 18, 18, 31
	vadduwm 26, 26, 0
	vadduwm 25, 25, 7
	vadduwm 28, 28, 27
	vadduwm 18, 15, 18
	vadduwm 26, 12, 26
	vadduwm 25, 4, 25
	vadduwm 28, 6, 28
	xxlxor 61, 50, 61
	xxlxor 51, 58, 51
	xxlxor 54, 57, 54
	xxlxor 49, 60, 49
	vperm 29, 29, 29, 10
	vperm 19, 19, 19, 10
	vperm 22, 22, 22, 10
	vperm 17, 17, 17, 10
	vadduwm 8, 28, 8
	xxlor 27, 53, 53
	xxland 61, 61, 33
	xxland 51, 51, 33
	xxland 60, 54, 33
	xxland 49, 49, 33
	vadduwm 9, 29, 9
	vadduwm 2, 19, 2
	vadduwm 3, 28, 3
	vadduwm 30, 17, 30
	xxlxor 47, 41, 47
	xxlxor 36, 35, 36
	xxlxor 44, 34, 44
	xxlxor 38, 62, 38
	vrlw 4, 4, 11
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vmr	21, 27
	xxlor 59, 25, 25
	vrlw 6, 6, 11
	vadduwm 18, 18, 27
	vadduwm 14, 25, 14
	vadduwm 26, 26, 24
	vadduwm 18, 4, 18
	vadduwm 8, 15, 8
	vadduwm 14, 12, 14
	vadduwm 26, 6, 26
	xxlxor 49, 50, 49
	xxlxor 51, 40, 51
	xxlxor 61, 46, 61
	xxlxor 60, 58, 60
	vperm 17, 17, 17, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 28, 28, 28, 5
	vadduwm 18, 18, 23
	vadduwm 8, 8, 16
	xxland 49, 49, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 60, 60, 28
	vadduwm 2, 17, 2
	vadduwm 3, 19, 3
	vadduwm 30, 29, 30
	vadduwm 9, 28, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 4, 4, 13
	vrlw 15, 15, 13
	vrlw 12, 12, 13
	vrlw 6, 6, 13
	xxlor 48, 12, 12
	vadduwm 14, 14, 0
	vadduwm 27, 26, 16
	vadduwm 18, 4, 18
	vadduwm 8, 15, 8
	vadduwm 14, 12, 14
	vadduwm 27, 6, 27
	xxlxor 49, 50, 49
	xxlxor 51, 40, 51
	xxlxor 61, 46, 61
	xxlxor 60, 59, 60
	vperm 17, 17, 17, 10
	vperm 19, 19, 19, 10
	vperm 29, 29, 29, 10
	vperm 28, 28, 28, 10
	xxlor 32, 13, 13
	vadduwm 7, 14, 7
	vadduwm 16, 18, 0
	xxland 49, 49, 33
	xxland 50, 51, 33
	xxland 61, 61, 33
	xxland 51, 60, 33
	vadduwm 2, 17, 2
	vadduwm 3, 18, 3
	vadduwm 30, 29, 30
	vadduwm 9, 19, 9
	xxlxor 36, 34, 36
	xxlxor 47, 35, 47
	xxlxor 44, 62, 44
	xxlxor 38, 41, 38
	vrlw 15, 15, 11
	vrlw 12, 12, 11
	vrlw 4, 4, 11
	vrlw 6, 6, 11
	vadduwm 28, 27, 31
	vadduwm 8, 8, 20
	vadduwm 14, 15, 16
	vadduwm 16, 12, 28
	vadduwm 7, 4, 7
	vadduwm 8, 6, 8
	xxlxor 50, 48, 50
	xxlxor 51, 39, 51
	xxlxor 61, 46, 61
	xxlxor 49, 40, 49
	vperm 18, 18, 18, 5
	vperm 19, 19, 19, 5
	vperm 29, 29, 29, 5
	vperm 17, 17, 17, 5
	xxlor 37, 4, 4
	vadduwm 14, 14, 21
	xxland 50, 50, 28
	xxland 51, 51, 28
	xxland 61, 61, 28
	xxland 49, 49, 28
	vadduwm 2, 18, 2
	vadduwm 3, 19, 3
	vadduwm 9, 29, 9
	vadduwm 30, 17, 30
	xxlxor 44, 34, 44
	xxlxor 36, 35, 36
	vadduwm 8, 8, 5
	xxlxor 47, 41, 47
	xxlxor 38, 62, 38
	vrlw 12, 12, 13
	vrlw 4, 4, 13
	xxlor 37, 27, 27
	vrlw 15, 15, 13
	vrlw 6, 6, 13
	vadduwm 13, 16, 5
	xxlor 37, 1, 1
	vadduwm 13, 12, 13
	vadduwm 7, 7, 5
	xxlxor 48, 45, 50
	vadduwm 7, 4, 7
	vadduwm 14, 15, 14
	xxlxor 50, 39, 51
	vadduwm 8, 6, 8
	vperm 16, 16, 16, 10
	vperm 18, 18, 18, 10
	xxlxor 51, 46, 61
	xxlxor 49, 40, 49
	vperm 19, 19, 19, 10
	vperm 17, 17, 17, 10
	xxland 48, 48, 33
	xxland 50, 50, 33
	vadduwm 2, 16, 2
	vadduwm 3, 18, 3
	xxlxor 44, 34, 44
	xxlxor 63, 34, 46
	xxlxor 34, 35, 36
	xxlxor 61, 35, 40
	xxland 35, 51, 33
	xxland 36, 49, 33
	vadduwm 8, 3, 9
	vadduwm 9, 4, 30
	xxlxor 46, 40, 47
	xxlxor 38, 41, 38
	vrlw 2, 2, 11
	vrlw 14, 14, 11
	vrlw 6, 6, 11
	vrlw 11, 12, 11
	xxlxor 32, 40, 45
	xxlxor 37, 41, 39
	xxlxor 57, 34, 36
	xxlxor 41, 46, 48
	xxlxor 62, 38, 50
	xxlxor 43, 43, 35
	xxlor 31, 28, 28
	xxlor 2, 24, 24
	bne	0, .LBB3_2
	xxlor 4, 37, 37
	b .LBB3_7
.LBB3_6:
	xxlor 32, 3, 3
.LBB3_7:
	addis 3, 2, .LCPI3_4@toc@ha
	vmrglw 3, 29, 31
	li 4, 32
	addi 3, 3, .LCPI3_4@toc@l
	vmr	7, 0
	lvx 2, 0, 3
	xxlor 40, 4, 4
	li 3, 16
	vmrghw 1, 9, 25
	vmrglw 10, 11, 30
	vperm 4, 29, 31, 2
	vmrghw 5, 29, 31
	vmrghw 0, 8, 0
	vmrghw 6, 11, 30
	xxmrgld	0, 36, 35
	vmrglw 3, 8, 7
	vmrglw 4, 9, 25
	vperm 7, 8, 7, 2
	vperm 9, 9, 25, 2
	vperm 2, 11, 30, 2
	xxmrgld	40, 32, 37
	xxmrghd	37, 32, 37
	xxmrgld	32, 38, 33
	xxmrgld	4, 39, 35
	xxmrgld	5, 41, 36
	xxmrgld	6, 34, 42
	xxmrgld	34, 4, 0
	xxswapd	3, 37
	xxmrgld	36, 6, 5
	xxmrghd	35, 4, 0
	xxmrghd	37, 6, 5
	xxmrghd	33, 38, 33
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
	lfd 31, 600(1)
	lxvd2x 62, 1, 3
	li 3, 384
	lfd 30, 592(1)
	lxvd2x 61, 1, 3
	li 3, 368
	lfd 29, 584(1)
	lxvd2x 60, 1, 3
	li 3, 352
	lfd 28, 576(1)
	lxvd2x 59, 1, 3
	li 3, 336
	lfd 27, 568(1)
	lxvd2x 58, 1, 3
	li 3, 320
	lfd 26, 560(1)
	lxvd2x 57, 1, 3
	li 3, 304
	lfd 25, 552(1)
	lxvd2x 56, 1, 3
	li 3, 288
	lfd 24, 544(1)
	lxvd2x 55, 1, 3
	li 3, 272
	lfd 23, 536(1)
	lxvd2x 54, 1, 3
	li 3, 256
	lfd 22, 528(1)
	lxvd2x 53, 1, 3
	li 3, 240
	lfd 21, 520(1)
	lxvd2x 52, 1, 3
	ld 30, 504(1)
	ld 29, 496(1)
	ld 28, 488(1)
	ld 27, 480(1)
	ld 26, 472(1)
	ld 25, 464(1)
	ld 24, 456(1)
	ld 23, 448(1)
	ld 22, 440(1)
	ld 21, 432(1)
	addi 1, 1, 608
	blr
	.long	0
	.quad	0
.Lfunc_end3:
	.size	blake3_hash4_sse41, .Lfunc_end3-.Lfunc_begin3

#endif
