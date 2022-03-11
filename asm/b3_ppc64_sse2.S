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
 * This is converted assembly: SSE2 -> POWER7 PPC64
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if (defined(__PPC64__) && defined(__BIG_ENDIAN__))

.text
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
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
.LCPI0_1:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI0_2:
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
.LCPI0_3:
	.short	1
	.short	2
	.short	4
	.short	8
	.short	16
	.short	32
	.short	64
	.short	128
.LCPI0_4:
	.short	0
	.short	0
	.short	4
	.short	8
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI0_5:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI0_6:
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
	.globl	_blake3_compress_in_place_sse2
	.p2align	2
	.type	_blake3_compress_in_place_sse2,@function
	.section	.opd,"aw",@progbits
_blake3_compress_in_place_sse2:
	.p2align	3
	.quad	.Lfunc_begin0
	.quad	.TOC.@tocbase
	.quad	0
	.text
.Lfunc_begin0:
	.cfi_startproc
	li 8, 16
	li 9, 31
	lvsl 6, 0, 4
	lvx 2, 3, 8
	lvx 3, 0, 3
	lvx 4, 3, 9
	li 9, 0
	stb 7, -48(1)
	stb 9, -80(1)
	addi 7, 1, -48
	addi 9, 1, -80
	stb 5, -64(1)
	addi 5, 1, -64
	lxvw4x 37, 0, 7
	lxvw4x 32, 0, 9
	addi 7, 1, -32
	addi 9, 1, -16
	lxvw4x 33, 0, 5
	rldicl 5, 6, 32, 32
	stw 6, -32(1)
	stw 5, -16(1)
	li 5, 32
	li 6, 63
	lxvw4x 39, 0, 7
	lxvw4x 40, 0, 9
	vmrghb 5, 0, 5
	lvx 9, 4, 8
	lvx 10, 0, 4
	vmrghb 1, 0, 1
	lvx 11, 4, 5
	vspltb 0, 0, 0
	addis 5, 2, .LCPI0_0@toc@ha
	vperm 10, 10, 9, 6
	addi 5, 5, .LCPI0_0@toc@l
	vperm 9, 9, 11, 6
	vmrghh 5, 0, 5
	vmrghh 0, 0, 1
	lvsl 1, 0, 3
	vperm 3, 3, 2, 1
	vmrglw 12, 10, 9
	vmrghw 9, 10, 9
	vperm 4, 2, 4, 1
	vmrghw 2, 7, 8
	vmrghw 5, 0, 5
	vmrghw 1, 9, 12
	vadduwm 3, 4, 3
	xxmrghd	37, 34, 37
	lxvw4x 34, 0, 5
	addis 5, 2, .LCPI0_1@toc@ha
	addi 5, 5, .LCPI0_1@toc@l
	lxvw4x 39, 0, 5
	li 5, 48
	vadduwm 0, 3, 1
	xxsldwi 49, 33, 33, 1
	xxlxor 35, 32, 37
	vperm 5, 3, 3, 2
	vspltisw 3, 10
	vadduwm 3, 3, 3
	vadduwm 8, 5, 7
	vmrglw 7, 9, 12
	lvx 9, 4, 5
	addis 5, 2, .LCPI0_4@toc@ha
	xxlxor 36, 40, 36
	addi 5, 5, .LCPI0_4@toc@l
	vperm 11, 11, 9, 6
	lxvw4x 48, 0, 5
	vrlw 10, 4, 3
	lvx 4, 4, 6
	addis 4, 2, .LCPI0_2@toc@ha
	addi 4, 4, .LCPI0_2@toc@l
	vperm 6, 9, 4, 6
	vadduwm 0, 0, 7
	vspltisw 4, 12
	vspltisw 9, -16
	vadduwm 0, 0, 10
	vadduwm 4, 4, 4
	xxlxor 37, 32, 37
	xxsldwi 32, 32, 32, 3
	vmrghw 12, 11, 6
	vrlw 13, 5, 4
	vmrglw 6, 6, 11
	vspltisw 5, 9
	vsubuwm 5, 5, 9
	vadduwm 9, 13, 8
	xxswapd	0, 45
	vmrghw 8, 6, 12
	xxlxor 42, 41, 42
	xxsldwi 41, 41, 41, 1
	vmrglw 14, 6, 12
	vrlw 10, 10, 5
	vadduwm 0, 0, 8
	vadduwm 0, 0, 10
	xxlxor 43, 32, 0
	vadduwm 0, 0, 14
	vperm 11, 11, 11, 2
	vadduwm 9, 9, 11
	xxlxor 38, 41, 42
	vrlw 6, 6, 3
	vadduwm 10, 0, 6
	xxlxor 32, 42, 43
	xxsldwi 42, 42, 42, 1
	vrlw 11, 0, 4
	lxvw4x 32, 0, 4
	addis 4, 2, .LCPI0_3@toc@ha
	addi 4, 4, .LCPI0_3@toc@l
	lxvw4x 47, 0, 4
	addis 4, 2, .LCPI0_5@toc@ha
	addi 4, 4, .LCPI0_5@toc@l
	lxvw4x 50, 0, 4
	addis 4, 2, .LCPI0_6@toc@ha
	addi 4, 4, .LCPI0_6@toc@l
	vadduwm 12, 11, 9
	xxswapd	0, 43
	vperm 9, 1, 7, 0
	xxlxor 38, 44, 38
	xxspltw 43, 40, 2
	xxsldwi 44, 44, 44, 3
	vcmpequh 1, 16, 15
	vrlw 6, 6, 5
	vmrglw 11, 11, 14
	vmrglw 16, 17, 17
	vadduwm 10, 10, 9
	vadduwm 10, 10, 6
	vmrglw 11, 11, 11
	xxlxor 45, 42, 0
	vperm 13, 13, 13, 2
	vadduwm 17, 12, 13
	xxsel 44, 48, 43, 33
	xxmrghd	43, 46, 39
	vmrglw 7, 7, 14
	xxlxor 38, 49, 38
	vadduwm 10, 10, 12
	vrlw 19, 6, 3
	vcmpequh 6, 18, 15
	vmrghw 14, 8, 7
	vadduwm 10, 10, 19
	xxsel 0, 43, 40, 38
	xxlxor 45, 42, 45
	xxsldwi 42, 42, 42, 3
	vrlw 11, 13, 4
	xxsldwi 1, 0, 0, 1
	xxsldwi 0, 0, 1, 2
	vadduwm 15, 11, 17
	xxsldwi 45, 1, 0, 3
	xxlxor 48, 47, 51
	xxswapd	0, 43
	xxsldwi 47, 47, 47, 1
	vrlw 16, 16, 5
	vadduwm 10, 10, 13
	vadduwm 10, 10, 16
	xxlxor 43, 42, 0
	xxsldwi 0, 46, 39, 1
	vperm 11, 11, 11, 2
	xxsldwi 46, 0, 40, 1
	vadduwm 8, 10, 14
	vadduwm 15, 15, 11
	xxlxor 39, 47, 48
	vrlw 7, 7, 3
	vadduwm 8, 8, 7
	xxlxor 42, 40, 43
	xxsldwi 40, 40, 40, 1
	vperm 11, 9, 12, 0
	vrlw 10, 10, 4
	vadduwm 8, 8, 11
	vadduwm 15, 10, 15
	xxswapd	0, 42
	xxspltw 42, 45, 2
	xxlxor 39, 47, 39
	vrlw 7, 7, 5
	vmrglw 10, 10, 14
	vadduwm 16, 8, 7
	vmrglw 10, 10, 10
	xxlxor 40, 48, 0
	vperm 17, 8, 8, 2
	xxsldwi 40, 41, 41, 1
	xxsldwi 41, 47, 47, 3
	xxmrghd	47, 46, 44
	vmrglw 12, 12, 14
	vmrglw 8, 8, 8
	vadduwm 9, 9, 17
	xxsel 0, 47, 45, 38
	xxlxor 39, 41, 39
	xxsldwi 1, 0, 0, 1
	vrlw 7, 7, 3
	xxsel 40, 40, 42, 33
	xxsldwi 0, 0, 1, 2
	vadduwm 10, 16, 8
	vadduwm 16, 10, 7
	xxlxor 42, 48, 49
	xxsldwi 48, 48, 48, 3
	vrlw 15, 10, 4
	xxsldwi 42, 1, 0, 3
	vadduwm 16, 16, 10
	vadduwm 9, 15, 9
	xxswapd	0, 47
	xxlxor 39, 41, 39
	xxsldwi 41, 41, 41, 1
	vrlw 7, 7, 5
	vadduwm 14, 16, 7
	vmrghw 16, 13, 12
	xxlxor 47, 46, 0
	vperm 15, 15, 15, 2
	xxsldwi 0, 48, 44, 1
	vadduwm 9, 9, 15
	xxsldwi 45, 0, 45, 1
	xxlxor 39, 41, 39
	vrlw 12, 7, 3
	vadduwm 7, 14, 13
	vadduwm 14, 7, 12
	xxlxor 39, 46, 47
	vrlw 15, 7, 4
	lxvw4x 39, 0, 4
	vperm 16, 11, 8, 7
	xxsldwi 43, 43, 43, 1
	vadduwm 9, 15, 9
	xxswapd	0, 47
	xxspltw 47, 42, 2
	vmrglw 11, 11, 11
	xxlxor 44, 41, 44
	xxsldwi 41, 41, 41, 3
	vadduwm 14, 14, 16
	vrlw 12, 12, 5
	xxsldwi 46, 46, 46, 1
	vmrglw 15, 15, 13
	vadduwm 14, 14, 12
	vmrglw 15, 15, 15
	xxlxor 49, 46, 0
	vperm 17, 17, 17, 2
	vadduwm 18, 9, 17
	xxlxor 41, 50, 44
	vrlw 12, 9, 3
	xxsel 41, 43, 47, 33
	vadduwm 11, 14, 9
	xxmrghd	46, 45, 40
	vmrglw 8, 8, 13
	vadduwm 15, 11, 12
	xxsel 0, 46, 42, 38
	xxlxor 43, 47, 49
	xxsldwi 47, 47, 47, 3
	vrlw 14, 11, 4
	xxsldwi 1, 0, 0, 1
	xxsldwi 0, 0, 1, 2
	vadduwm 17, 14, 18
	xxsldwi 43, 1, 0, 3
	xxlxor 44, 49, 44
	xxswapd	0, 46
	xxsldwi 49, 49, 49, 1
	vrlw 12, 12, 5
	vadduwm 15, 15, 11
	vadduwm 13, 15, 12
	vmrghw 15, 10, 8
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 2
	xxsldwi 0, 47, 40, 1
	vadduwm 17, 17, 14
	xxlxor 40, 49, 44
	xxsldwi 44, 0, 42, 1
	vrlw 8, 8, 3
	vadduwm 10, 13, 12
	vadduwm 10, 10, 8
	xxlxor 45, 42, 46
	xxsldwi 46, 48, 48, 1
	vrlw 13, 13, 4
	vperm 15, 14, 9, 7
	xxsldwi 46, 46, 46, 1
	vmrglw 14, 14, 14
	vadduwm 16, 13, 17
	xxswapd	0, 45
	vadduwm 10, 10, 15
	xxspltw 45, 43, 2
	xxlxor 40, 48, 40
	xxsldwi 48, 48, 48, 3
	xxsldwi 42, 42, 42, 1
	vrlw 8, 8, 5
	vmrglw 13, 13, 12
	vadduwm 10, 10, 8
	vmrglw 13, 13, 13
	xxlxor 49, 42, 0
	vperm 17, 17, 17, 2
	vadduwm 16, 16, 17
	xxlxor 40, 48, 40
	vrlw 18, 8, 3
	xxsel 40, 46, 45, 33
	xxmrghd	45, 44, 41
	vmrglw 9, 9, 12
	vadduwm 10, 10, 8
	xxsel 0, 45, 43, 38
	vadduwm 14, 10, 18
	xxlxor 42, 46, 49
	xxsldwi 1, 0, 0, 1
	xxsldwi 46, 46, 46, 3
	vrlw 13, 10, 4
	xxsldwi 0, 0, 1, 2
	xxsldwi 42, 1, 0, 3
	vadduwm 16, 13, 16
	xxswapd	0, 45
	vadduwm 14, 14, 10
	xxlxor 49, 48, 50
	xxsldwi 48, 48, 48, 1
	vrlw 17, 17, 5
	vadduwm 12, 14, 17
	vmrghw 14, 11, 9
	xxlxor 45, 44, 0
	vperm 13, 13, 13, 2
	xxsldwi 0, 46, 41, 1
	xxsldwi 46, 47, 47, 1
	vadduwm 16, 16, 13
	xxsldwi 43, 0, 43, 1
	vperm 15, 14, 8, 7
	xxlxor 41, 48, 49
	xxsldwi 46, 46, 46, 1
	vadduwm 12, 12, 11
	vrlw 9, 9, 3
	vmrglw 14, 14, 14
	vadduwm 12, 12, 9
	xxlxor 45, 44, 45
	vadduwm 12, 12, 15
	vrlw 13, 13, 4
	xxsldwi 44, 44, 44, 1
	vadduwm 7, 13, 16
	xxswapd	0, 45
	xxspltw 45, 42, 2
	xxlxor 41, 39, 41
	xxsldwi 39, 39, 39, 3
	vrlw 9, 9, 5
	vmrglw 13, 13, 11
	vadduwm 12, 12, 9
	vmrglw 13, 13, 13
	xxlxor 48, 44, 0
	vperm 16, 16, 16, 2
	vadduwm 17, 7, 16
	xxlxor 39, 49, 41
	vrlw 9, 7, 3
	xxsel 39, 46, 45, 33
	xxmrghd	45, 43, 40
	vmrglw 8, 8, 11
	vadduwm 12, 12, 7
	xxsel 0, 45, 42, 38
	vadduwm 12, 12, 9
	xxlxor 46, 44, 48
	xxsldwi 1, 0, 0, 1
	xxsldwi 44, 44, 44, 3
	vrlw 13, 14, 4
	xxsldwi 0, 0, 1, 2
	vadduwm 14, 13, 17
	xxlxor 48, 46, 41
	xxsldwi 41, 1, 0, 3
	xxswapd	0, 45
	vmrghw 13, 10, 8
	vrlw 16, 16, 5
	vadduwm 12, 12, 9
	xxsldwi 46, 46, 46, 1
	vadduwm 11, 12, 16
	xxlxor 44, 43, 0
	xxsldwi 0, 45, 40, 1
	xxsldwi 45, 47, 47, 1
	vperm 12, 12, 12, 2
	xxsldwi 42, 0, 42, 1
	vperm 0, 13, 7, 0
	xxsldwi 45, 45, 45, 1
	vadduwm 11, 11, 10
	vadduwm 14, 14, 12
	vmrglw 13, 13, 13
	xxlxor 40, 46, 48
	vrlw 8, 8, 3
	vadduwm 11, 11, 8
	xxlxor 44, 43, 44
	xxsldwi 43, 43, 43, 1
	vrlw 12, 12, 4
	vadduwm 0, 11, 0
	xxspltw 43, 41, 2
	vmrglw 11, 11, 10
	vadduwm 14, 12, 14
	xxswapd	0, 44
	xxlxor 40, 46, 40
	xxsldwi 46, 46, 46, 3
	vrlw 8, 8, 5
	vmrglw 11, 11, 11
	vadduwm 0, 0, 8
	xxsel 33, 45, 43, 33
	xxlxor 44, 32, 0
	vperm 12, 12, 12, 2
	vadduwm 0, 1, 0
	xxmrghd	33, 42, 39
	xxsel 0, 33, 41, 38
	vadduwm 14, 14, 12
	xxsldwi 1, 0, 0, 1
	xxlxor 40, 46, 40
	vrlw 8, 8, 3
	xxsldwi 0, 0, 1, 2
	vadduwm 0, 0, 8
	xxlxor 43, 32, 44
	xxsldwi 32, 32, 32, 3
	vrlw 1, 11, 4
	xxsldwi 43, 1, 0, 3
	vadduwm 0, 0, 11
	vadduwm 6, 1, 14
	xxswapd	0, 33
	vmrglw 1, 7, 10
	xxlxor 40, 38, 40
	xxsldwi 38, 38, 38, 1
	vrlw 8, 8, 5
	vadduwm 0, 0, 8
	xxlxor 39, 32, 0
	vperm 2, 7, 7, 2
	vmrghw 7, 9, 1
	vadduwm 6, 6, 2
	xxsldwi 0, 39, 33, 1
	xxlxor 40, 38, 40
	vrlw 3, 8, 3
	xxsldwi 33, 0, 41, 1
	vadduwm 0, 0, 1
	vadduwm 0, 0, 3
	xxlxor 34, 32, 34
	xxsldwi 0, 32, 32, 1
	vrlw 2, 2, 4
	vadduwm 4, 2, 6
	xxswapd	2, 34
	xxlxor 35, 36, 35
	xxsldwi 1, 36, 36, 3
	vrlw 3, 3, 5
	xxlxor 0, 1, 0
	stxvw4x 0, 0, 3
	xxlxor 1, 35, 2
	stxvw4x 1, 3, 8
	blr
	.long	0
	.quad	0
.Lfunc_end0:
	.size	_blake3_compress_in_place_sse2, .Lfunc_end0-.Lfunc_begin0
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
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
.LCPI1_1:
	.long	1779033703
	.long	3144134277
	.long	1013904242
	.long	2773480762
.LCPI1_2:
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
.LCPI1_3:
	.short	1
	.short	2
	.short	4
	.short	8
	.short	16
	.short	32
	.short	64
	.short	128
.LCPI1_4:
	.short	0
	.short	0
	.short	4
	.short	8
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI1_5:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64
	.short	128
.LCPI1_6:
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
	.globl	_blake3_compress_xof_sse2
	.p2align	2
	.type	_blake3_compress_xof_sse2,@function
	.section	.opd,"aw",@progbits
_blake3_compress_xof_sse2:
	.p2align	3
	.quad	.Lfunc_begin1
	.quad	.TOC.@tocbase
	.quad	0
	.text
.Lfunc_begin1:
	.cfi_startproc
	li 9, 16
	li 10, 31
	li 11, 0
	lvsl 7, 0, 4
	lvx 3, 3, 9
	lvx 4, 0, 3
	lvx 5, 3, 10
	stb 7, -48(1)
	addi 7, 1, -48
	stb 11, -80(1)
	addi 11, 1, -80
	stb 5, -64(1)
	addi 5, 1, -64
	lxvw4x 34, 0, 7
	lxvw4x 32, 0, 11
	addi 7, 1, -32
	addi 11, 1, -16
	lxvw4x 33, 0, 5
	rldicl 5, 6, 32, 32
	stw 6, -32(1)
	addis 6, 2, .LCPI1_0@toc@ha
	stw 5, -16(1)
	li 5, 32
	addi 6, 6, .LCPI1_0@toc@l
	lxvw4x 38, 0, 7
	lxvw4x 40, 0, 11
	vmrghb 2, 0, 2
	li 7, 63
	lvx 9, 4, 9
	lvx 10, 0, 4
	vmrghb 1, 0, 1
	lvx 11, 4, 5
	vspltb 0, 0, 0
	vperm 10, 10, 9, 7
	vperm 9, 9, 11, 7
	vmrghh 12, 0, 2
	lvsl 2, 0, 3
	vmrghh 0, 0, 1
	vperm 4, 4, 3, 2
	vperm 5, 3, 5, 2
	vmrglw 1, 10, 9
	vmrghw 9, 10, 9
	vmrghw 3, 6, 8
	vmrghw 0, 0, 12
	vadduwm 4, 5, 4
	vmrghw 6, 9, 1
	xxmrghd	32, 35, 32
	lxvw4x 35, 0, 6
	addis 6, 2, .LCPI1_1@toc@ha
	addi 6, 6, .LCPI1_1@toc@l
	lxvw4x 40, 0, 6
	li 6, 48
	vadduwm 10, 4, 6
	xxlxor 36, 42, 32
	vperm 0, 4, 4, 3
	vspltisw 4, 10
	vadduwm 4, 4, 4
	vadduwm 12, 0, 8
	vmrglw 8, 9, 1
	lvx 1, 4, 6
	xxlxor 37, 44, 37
	vperm 9, 11, 1, 7
	vrlw 13, 5, 4
	lvx 5, 4, 7
	addis 4, 2, .LCPI1_2@toc@ha
	addis 7, 2, .LCPI1_4@toc@ha
	addi 4, 4, .LCPI1_2@toc@l
	addi 7, 7, .LCPI1_4@toc@l
	vperm 1, 1, 5, 7
	lxvw4x 49, 0, 7
	vadduwm 7, 10, 8
	vspltisw 5, 12
	vspltisw 10, -16
	vadduwm 7, 7, 13
	vadduwm 5, 5, 5
	xxlxor 32, 39, 32
	xxsldwi 39, 39, 39, 3
	vmrghw 11, 9, 1
	vrlw 14, 0, 5
	vmrglw 1, 1, 9
	vspltisw 0, 9
	vsubuwm 0, 0, 10
	vadduwm 10, 14, 12
	xxswapd	0, 46
	vmrghw 9, 1, 11
	xxlxor 44, 42, 45
	xxsldwi 42, 42, 42, 1
	vmrglw 11, 1, 11
	vrlw 12, 12, 0
	vadduwm 7, 7, 9
	vadduwm 7, 7, 12
	xxlxor 45, 39, 0
	vperm 13, 13, 13, 3
	vadduwm 10, 10, 13
	xxlxor 33, 42, 44
	vrlw 12, 1, 4
	vadduwm 1, 7, 11
	vadduwm 7, 1, 12
	xxlxor 33, 39, 45
	xxsldwi 39, 39, 39, 1
	vrlw 13, 1, 5
	lxvw4x 33, 0, 4
	addis 4, 2, .LCPI1_3@toc@ha
	addi 4, 4, .LCPI1_3@toc@l
	lxvw4x 48, 0, 4
	addis 4, 2, .LCPI1_5@toc@ha
	addi 4, 4, .LCPI1_5@toc@l
	vadduwm 14, 13, 10
	xxswapd	0, 45
	vperm 10, 6, 8, 1
	xxlxor 44, 46, 44
	xxspltw 45, 41, 2
	xxsldwi 46, 46, 46, 3
	vrlw 12, 12, 0
	vmrglw 13, 13, 11
	vadduwm 7, 7, 10
	vadduwm 15, 7, 12
	vmrglw 13, 13, 13
	xxlxor 39, 47, 0
	vperm 18, 7, 7, 3
	xxsldwi 39, 38, 38, 1
	vcmpequh 6, 17, 16
	lxvw4x 49, 0, 4
	addis 4, 2, .LCPI1_6@toc@ha
	addi 4, 4, .LCPI1_6@toc@l
	vmrglw 7, 7, 7
	vadduwm 14, 14, 18
	xxlxor 44, 46, 44
	vrlw 12, 12, 4
	xxsel 45, 39, 45, 38
	vcmpequh 7, 17, 16
	xxmrghd	48, 43, 40
	vmrglw 8, 8, 11
	vadduwm 15, 15, 13
	vadduwm 15, 15, 12
	xxsel 0, 48, 41, 39
	xxlxor 49, 47, 50
	xxsldwi 47, 47, 47, 3
	vrlw 16, 17, 5
	xxsldwi 1, 0, 0, 1
	xxsldwi 0, 0, 1, 2
	vadduwm 17, 16, 14
	xxsldwi 46, 1, 0, 3
	xxlxor 44, 49, 44
	xxswapd	0, 48
	vmrghw 16, 9, 8
	vrlw 12, 12, 0
	vadduwm 15, 15, 14
	xxsldwi 49, 49, 49, 1
	vadduwm 11, 15, 12
	xxlxor 47, 43, 0
	xxsldwi 0, 48, 40, 1
	vperm 15, 15, 15, 3
	xxsldwi 48, 0, 41, 1
	vadduwm 9, 11, 16
	vadduwm 17, 17, 15
	xxlxor 40, 49, 44
	vperm 12, 10, 13, 1
	vrlw 8, 8, 4
	vadduwm 9, 9, 8
	xxlxor 43, 41, 47
	xxsldwi 41, 41, 41, 1
	vrlw 11, 11, 5
	vadduwm 9, 9, 12
	vadduwm 15, 11, 17
	xxswapd	0, 43
	xxspltw 43, 46, 2
	xxlxor 40, 47, 40
	vrlw 8, 8, 0
	vmrglw 11, 11, 16
	vadduwm 17, 9, 8
	vmrglw 11, 11, 11
	xxlxor 41, 49, 0
	vperm 18, 9, 9, 3
	xxsldwi 41, 42, 42, 1
	xxsldwi 42, 47, 47, 3
	xxmrghd	47, 48, 45
	vmrglw 13, 13, 16
	vmrglw 9, 9, 9
	vadduwm 10, 10, 18
	xxsel 0, 47, 46, 39
	xxlxor 40, 42, 40
	xxsldwi 1, 0, 0, 1
	vrlw 8, 8, 4
	xxsel 41, 41, 43, 38
	xxsldwi 0, 0, 1, 2
	vadduwm 11, 17, 9
	vadduwm 17, 11, 8
	xxlxor 43, 49, 50
	xxsldwi 49, 49, 49, 3
	vrlw 15, 11, 5
	xxsldwi 43, 1, 0, 3
	vadduwm 17, 17, 11
	vadduwm 10, 15, 10
	xxswapd	0, 47
	xxlxor 40, 42, 40
	xxsldwi 42, 42, 42, 1
	vrlw 8, 8, 0
	vadduwm 15, 17, 8
	vmrghw 17, 14, 13
	xxlxor 48, 47, 0
	vperm 16, 16, 16, 3
	xxsldwi 0, 49, 45, 1
	vadduwm 10, 10, 16
	xxsldwi 46, 0, 46, 1
	xxlxor 40, 42, 40
	vrlw 13, 8, 4
	vadduwm 8, 15, 14
	vadduwm 15, 8, 13
	xxlxor 40, 47, 48
	vrlw 16, 8, 5
	lxvw4x 40, 0, 4
	vperm 17, 12, 9, 8
	xxsldwi 44, 44, 44, 1
	vadduwm 10, 16, 10
	xxswapd	0, 48
	xxspltw 48, 43, 2
	vmrglw 12, 12, 12
	xxlxor 45, 42, 45
	xxsldwi 42, 42, 42, 3
	vadduwm 15, 15, 17
	vrlw 13, 13, 0
	xxsldwi 47, 47, 47, 1
	vmrglw 16, 16, 14
	vadduwm 15, 15, 13
	vmrglw 16, 16, 16
	xxlxor 50, 47, 0
	vperm 18, 18, 18, 3
	vadduwm 19, 10, 18
	xxlxor 42, 51, 45
	vrlw 13, 10, 4
	xxsel 42, 44, 48, 38
	vadduwm 12, 15, 10
	xxmrghd	47, 46, 41
	vmrglw 9, 9, 14
	vadduwm 16, 12, 13
	xxsel 0, 47, 43, 39
	xxlxor 44, 48, 50
	xxsldwi 48, 48, 48, 3
	vrlw 15, 12, 5
	xxsldwi 1, 0, 0, 1
	xxsldwi 0, 0, 1, 2
	vadduwm 18, 15, 19
	xxsldwi 44, 1, 0, 3
	xxlxor 45, 50, 45
	xxswapd	0, 47
	xxsldwi 50, 50, 50, 1
	vrlw 13, 13, 0
	vadduwm 16, 16, 12
	vadduwm 14, 16, 13
	vmrghw 16, 11, 9
	xxlxor 47, 46, 0
	vperm 15, 15, 15, 3
	xxsldwi 0, 48, 41, 1
	vadduwm 18, 18, 15
	xxlxor 41, 50, 45
	xxsldwi 45, 0, 43, 1
	vrlw 9, 9, 4
	vadduwm 11, 14, 13
	vadduwm 11, 11, 9
	xxlxor 46, 43, 47
	xxsldwi 47, 49, 49, 1
	vrlw 14, 14, 5
	vperm 16, 15, 10, 8
	xxsldwi 47, 47, 47, 1
	vmrglw 15, 15, 15
	vadduwm 17, 14, 18
	xxswapd	0, 46
	vadduwm 11, 11, 16
	xxspltw 46, 44, 2
	xxlxor 41, 49, 41
	xxsldwi 49, 49, 49, 3
	xxsldwi 43, 43, 43, 1
	vrlw 9, 9, 0
	vmrglw 14, 14, 13
	vadduwm 11, 11, 9
	vmrglw 14, 14, 14
	xxlxor 50, 43, 0
	vperm 18, 18, 18, 3
	vadduwm 17, 17, 18
	xxlxor 41, 49, 41
	vrlw 19, 9, 4
	xxsel 41, 47, 46, 38
	xxmrghd	46, 45, 42
	vmrglw 10, 10, 13
	vadduwm 11, 11, 9
	xxsel 0, 46, 44, 39
	vadduwm 15, 11, 19
	xxlxor 43, 47, 50
	xxsldwi 1, 0, 0, 1
	xxsldwi 47, 47, 47, 3
	vrlw 14, 11, 5
	xxsldwi 0, 0, 1, 2
	xxsldwi 43, 1, 0, 3
	vadduwm 17, 14, 17
	xxswapd	0, 46
	vadduwm 15, 15, 11
	xxlxor 50, 49, 51
	xxsldwi 49, 49, 49, 1
	vrlw 18, 18, 0
	vadduwm 13, 15, 18
	vmrghw 15, 12, 10
	xxlxor 46, 45, 0
	vperm 14, 14, 14, 3
	xxsldwi 0, 47, 42, 1
	xxsldwi 47, 48, 48, 1
	vadduwm 17, 17, 14
	xxsldwi 44, 0, 44, 1
	vperm 16, 15, 9, 8
	xxlxor 42, 49, 50
	xxsldwi 47, 47, 47, 1
	vadduwm 13, 13, 12
	vrlw 10, 10, 4
	vmrglw 15, 15, 15
	vadduwm 13, 13, 10
	xxlxor 46, 45, 46
	vadduwm 13, 13, 16
	vrlw 14, 14, 5
	xxsldwi 45, 45, 45, 1
	vadduwm 8, 14, 17
	xxswapd	0, 46
	xxspltw 46, 43, 2
	xxlxor 42, 40, 42
	xxsldwi 40, 40, 40, 3
	vrlw 10, 10, 0
	vmrglw 14, 14, 12
	vadduwm 13, 13, 10
	vmrglw 14, 14, 14
	xxlxor 49, 45, 0
	vperm 17, 17, 17, 3
	vadduwm 18, 8, 17
	xxlxor 40, 50, 42
	vrlw 10, 8, 4
	xxsel 40, 47, 46, 38
	xxmrghd	46, 44, 41
	vmrglw 9, 9, 12
	vadduwm 13, 13, 8
	xxsel 0, 46, 43, 39
	vadduwm 13, 13, 10
	xxlxor 47, 45, 49
	xxsldwi 1, 0, 0, 1
	xxsldwi 45, 45, 45, 3
	vrlw 14, 15, 5
	xxsldwi 0, 0, 1, 2
	vadduwm 15, 14, 18
	xxlxor 49, 47, 42
	xxsldwi 42, 1, 0, 3
	xxswapd	0, 46
	vmrghw 14, 11, 9
	vrlw 17, 17, 0
	vadduwm 13, 13, 10
	xxsldwi 47, 47, 47, 1
	vadduwm 12, 13, 17
	xxlxor 45, 44, 0
	xxsldwi 0, 46, 41, 1
	xxsldwi 46, 48, 48, 1
	vperm 13, 13, 13, 3
	xxsldwi 43, 0, 43, 1
	vperm 1, 14, 8, 1
	xxsldwi 46, 46, 46, 1
	vadduwm 12, 12, 11
	vadduwm 15, 15, 13
	vmrglw 14, 14, 14
	xxlxor 41, 47, 49
	vrlw 9, 9, 4
	vadduwm 12, 12, 9
	xxlxor 45, 44, 45
	xxsldwi 44, 44, 44, 1
	vrlw 13, 13, 5
	vadduwm 1, 12, 1
	xxspltw 44, 42, 2
	vmrglw 12, 12, 11
	vadduwm 15, 13, 15
	xxswapd	0, 45
	xxlxor 41, 47, 41
	xxsldwi 47, 47, 47, 3
	vrlw 9, 9, 0
	vmrglw 12, 12, 12
	vadduwm 1, 1, 9
	xxsel 38, 46, 44, 38
	xxlxor 45, 33, 0
	vperm 13, 13, 13, 3
	vadduwm 1, 6, 1
	xxmrghd	38, 43, 40
	xxsel 0, 38, 42, 39
	vadduwm 15, 15, 13
	xxsldwi 1, 0, 0, 1
	xxlxor 41, 47, 41
	vrlw 9, 9, 4
	xxsldwi 0, 0, 1, 2
	vadduwm 1, 1, 9
	xxlxor 44, 33, 45
	xxsldwi 33, 33, 33, 3
	vrlw 6, 12, 5
	xxsldwi 44, 1, 0, 3
	vadduwm 1, 1, 12
	vadduwm 7, 6, 15
	xxswapd	0, 38
	vmrglw 6, 8, 11
	xxlxor 41, 39, 41
	xxsldwi 39, 39, 39, 1
	vrlw 9, 9, 0
	vadduwm 1, 1, 9
	xxlxor 40, 33, 0
	vperm 3, 8, 8, 3
	vmrghw 8, 10, 6
	vadduwm 7, 7, 3
	xxsldwi 0, 40, 38, 1
	xxlxor 41, 39, 41
	vrlw 4, 9, 4
	xxsldwi 38, 0, 42, 1
	vadduwm 1, 1, 6
	vadduwm 1, 1, 4
	xxlxor 35, 33, 35
	xxsldwi 0, 33, 33, 1
	vrlw 3, 3, 5
	vadduwm 5, 3, 7
	xxswapd	2, 35
	xxlxor 36, 37, 36
	xxsldwi 1, 37, 37, 3
	vrlw 4, 4, 0
	xxlxor 0, 1, 0
	stxvw4x 0, 0, 8
	xxlxor 3, 36, 2
	stxvw4x 3, 8, 9
	lvx 3, 3, 9
	lvx 4, 0, 3
	vperm 3, 4, 3, 2
	xxlxor 0, 1, 35
	stxvw4x 0, 8, 5
	lvx 3, 3, 10
	lvx 4, 3, 9
	vperm 2, 4, 3, 2
	xxlxor 0, 2, 34
	stxvw4x 0, 8, 6
	blr
	.long	0
	.quad	0
.Lfunc_end1:
	.size	_blake3_compress_xof_sse2, .Lfunc_end1-.Lfunc_begin1
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
	.long	1779033703
	.long	1779033703
	.long	1779033703
	.long	1779033703
.LCPI2_3:
	.long	3144134277
	.long	3144134277
	.long	3144134277
	.long	3144134277
.LCPI2_4:
	.long	1013904242
	.long	1013904242
	.long	1013904242
	.long	1013904242
.LCPI2_5:
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.long	2773480762
	.text
	.globl	_blake3_hash_many_sse2
	.p2align	2
	.type	_blake3_hash_many_sse2,@function
	.section	.opd,"aw",@progbits
_blake3_hash_many_sse2:
	.p2align	3
	.quad	.Lfunc_begin2
	.quad	.TOC.@tocbase
	.quad	0
	.text
.Lfunc_begin2:
	.cfi_startproc
	mflr 0
	std 0, 16(1)
	stdu 1, -832(1)
	.cfi_def_cfa_offset 832
	.cfi_offset lr, 16
	.cfi_offset r14, -168
	.cfi_offset r15, -160
	.cfi_offset r16, -152
	.cfi_offset r17, -144
	.cfi_offset r18, -136
	.cfi_offset r19, -128
	.cfi_offset r20, -120
	.cfi_offset r21, -112
	.cfi_offset r22, -104
	.cfi_offset r23, -96
	.cfi_offset r24, -88
	.cfi_offset r25, -80
	.cfi_offset r26, -72
	.cfi_offset r27, -64
	.cfi_offset r28, -56
	.cfi_offset r29, -48
	.cfi_offset r30, -40
	.cfi_offset r31, -32
	.cfi_offset f29, -24
	.cfi_offset f30, -16
	.cfi_offset f31, -8
	.cfi_offset v20, -368
	.cfi_offset v21, -352
	.cfi_offset v22, -336
	.cfi_offset v23, -320
	.cfi_offset v24, -304
	.cfi_offset v25, -288
	.cfi_offset v26, -272
	.cfi_offset v27, -256
	.cfi_offset v28, -240
	.cfi_offset v29, -224
	.cfi_offset v30, -208
	.cfi_offset v31, -192
	li 11, 464
	std 22, 728(1)
	lwz 22, 948(1)
	stxvd2x 52, 1, 11
	li 11, 480
	std 23, 736(1)
	stxvd2x 53, 1, 11
	li 11, 496
	std 26, 760(1)
	stxvd2x 54, 1, 11
	li 11, 512
	mr	26, 4
	ld 23, 952(1)
	stxvd2x 55, 1, 11
	li 11, 528
	cmpldi 1, 4, 4
	stfd 29, 808(1)
	stxvd2x 56, 1, 11
	li 11, 544
	andi. 4, 8, 1
	stfd 30, 816(1)
	stxvd2x 57, 1, 11
	li 11, 560
	std 27, 768(1)
	stxvd2x 58, 1, 11
	li 11, 576
	std 28, 776(1)
	stxvd2x 59, 1, 11
	li 11, 592
	std 29, 784(1)
	stxvd2x 60, 1, 11
	li 11, 608
	std 30, 792(1)
	stxvd2x 61, 1, 11
	li 11, 624
	std 31, 800(1)
	stxvd2x 62, 1, 11
	li 11, 640
	mr	30, 9
	mr	29, 7
	mr	28, 6
	mr	27, 5
	neg 4, 8
	or 31, 10, 9
	std 14, 664(1)
	std 15, 672(1)
	std 16, 680(1)
	std 17, 688(1)
	std 18, 696(1)
	std 19, 704(1)
	std 20, 712(1)
	std 21, 720(1)
	std 24, 744(1)
	std 25, 752(1)
	stfd 31, 824(1)
	stxvd2x 63, 1, 11
	stw 4, 416(1)
	blt	1, .LBB2_9
	addi 4, 1, 416
	vspltisb 2, -1
	addis 5, 2, .LCPI2_2@toc@ha
	addis 6, 2, .LCPI2_3@toc@ha
	addis 7, 2, .LCPI2_4@toc@ha
	addis 8, 2, .LCPI2_5@toc@ha
	cmpdi 1, 27, 0
	li 9, 0
	lxvw4x 0, 0, 4
	addis 4, 2, .LCPI2_0@toc@ha
	li 24, 16
	li 19, 32
	li 18, 48
	addi 14, 5, .LCPI2_2@toc@l
	addi 25, 6, .LCPI2_3@toc@l
	addi 5, 7, .LCPI2_4@toc@l
	addi 16, 8, .LCPI2_5@toc@l
	addi 4, 4, .LCPI2_0@toc@l
	li 17, 63
	mr	20, 3
	lxvw4x 1, 0, 4
	addi 4, 1, 400
	vslw 2, 2, 2
	std 28, 152(1)
	std 4, 224(1)
	addi 4, 1, 272
	xxspltw 0, 0, 0
	std 4, 216(1)
	addi 4, 1, 288
	std 4, 208(1)
	addi 4, 1, 304
	std 4, 200(1)
	addi 4, 1, 320
	xxland 0, 0, 1
	std 4, 192(1)
	addi 4, 1, 336
	std 4, 184(1)
	addi 4, 1, 352
	xxlor 8, 34, 34
	std 4, 176(1)
	addi 4, 1, 368
	xxlor 9, 0, 0
	std 4, 168(1)
	addi 4, 1, 384
	xxlor 10, 0, 34
	std 4, 160(1)
	addi 4, 1, 256
	std 4, 128(1)
	addis 4, 2, .LCPI2_1@toc@ha
	std 31, 144(1)
	addi 15, 4, .LCPI2_1@toc@l
	std 3, 136(1)
.LBB2_2:
	lwz 6, 0(28)
	ld 4, 224(1)
	stw 6, 400(1)
	lwz 6, 4(28)
	lxvw4x 0, 0, 4
	ld 4, 216(1)
	stw 6, 272(1)
	lwz 6, 8(28)
	lxvw4x 1, 0, 4
	xxspltw 40, 0, 0
	ld 4, 208(1)
	stw 6, 288(1)
	lwz 6, 12(28)
	lxvw4x 2, 0, 4
	xxspltw 39, 1, 0
	ld 4, 200(1)
	stw 6, 304(1)
	lwz 6, 16(28)
	lxvw4x 3, 0, 4
	xxspltw 38, 2, 0
	ld 4, 192(1)
	stw 6, 320(1)
	lwz 6, 20(28)
	lxvw4x 4, 0, 4
	xxspltw 33, 3, 0
	ld 4, 184(1)
	stw 6, 336(1)
	lwz 6, 24(28)
	lxvw4x 0, 0, 4
	xxspltw 45, 4, 0
	ld 4, 176(1)
	stw 6, 352(1)
	lwz 6, 28(28)
	lxvw4x 1, 0, 4
	xxspltw 48, 0, 0
	ld 4, 168(1)
	stw 6, 368(1)
	rldicl 6, 29, 32, 32
	lxvw4x 2, 0, 4
	ld 4, 160(1)
	xxspltw 46, 1, 0
	stw 29, 384(1)
	lxvw4x 0, 0, 4
	stw 6, 256(1)
	xxspltw 43, 2, 0
	bc 12, 6, .LBB2_8
	xxspltw 36, 0, 0
	xxlor 34, 9, 9
	ld 4, 128(1)
	sldi 8, 9, 5
	xxlor 0, 8, 8
	ld 6, 0(20)
	ld 7, 8(20)
	add 10, 8, 3
	lxvw4x 0, 0, 4
	std 9, 232(1)
	addi 21, 10, -8
	vadduwm 2, 4, 2
	ld 8, 16(20)
	ld 9, 24(20)
	li 11, 0
	mr	12, 31
	li 3, 0
	xxlor 1, 34, 34
	xxspltw 32, 0, 0
	xxlxor 36, 34, 8
	xxlor 34, 10, 10
	vcmpgtsw 4, 2, 4
	vsubuwm 2, 0, 4
	xxlor 3, 34, 34
.LBB2_4:
	sldi 0, 11, 6
	addi 11, 11, 1
	add 10, 6, 0
	add 4, 7, 0
	add 28, 8, 0
	add 31, 9, 0
	lvsl 9, 6, 0
	lvx 4, 6, 0
	cmpld 5, 11, 27
	lvsl 17, 9, 0
	lvx 19, 10, 24
	lvx 12, 7, 0
	lvx 30, 4, 24
	lvx 18, 8, 0
	lvx 28, 28, 24
	vperm 4, 4, 19, 9
	lvx 31, 9, 0
	lvx 27, 31, 24
	lvx 26, 10, 19
	lvsl 15, 8, 0
	lvx 24, 4, 19
	vperm 29, 31, 27, 17
	lvx 22, 28, 19
	vperm 31, 19, 26, 9
	lvx 19, 31, 19
	lvx 21, 10, 18
	lvx 20, 4, 18
	lvx 2, 28, 18
	vperm 18, 18, 28, 15
	lvx 3, 31, 18
	lvx 0, 10, 17
	vperm 25, 28, 22, 15
	mr	10, 21
	lvsl 10, 7, 0
	vperm 28, 26, 21, 9
	vperm 9, 21, 0, 9
	lvx 0, 4, 17
	vperm 12, 12, 30, 10
	vperm 30, 30, 24, 10
	vperm 23, 27, 19, 17
	vperm 27, 24, 20, 10
	vperm 26, 22, 2, 15
	lvx 22, 28, 17
	vperm 10, 20, 0, 10
	lvx 0, 31, 17
	vperm 24, 19, 3, 17
	vperm 15, 2, 22, 15
	vperm 17, 3, 0, 17
	isel 4, 22, 3, 22
	or 12, 4, 12
	li 4, 4
	mtctr 4
.LBB2_5:
	ldu 4, 8(10)
	add 4, 4, 0
	addi 4, 4, 256
	dcbt 0, 4
	bdnz .LBB2_5
	vmrghw 2, 9, 10
	clrlwi	4, 12, 24
	mr	12, 30
	vmrghw 19, 4, 12
	stw 4, 240(1)
	addi 4, 1, 240
	vmrglw 12, 4, 12
	lxvw4x 0, 0, 4
	vmrghw 4, 18, 29
	vmrglw 20, 18, 29
	vmrghw 18, 31, 30
	xxlor 30, 34, 34
	vspltisw 0, 10
	vmrglw 2, 9, 10
	vmrglw 29, 31, 30
	vmrghw 31, 25, 23
	vmrglw 21, 25, 23
	vadduwm 3, 13, 8
	vspltisw 8, 12
	vmrghw 25, 28, 27
	xxlor 29, 34, 34
	vspltisw 2, 4
	vmrglw 28, 28, 27
	vadduwm 9, 16, 7
	xxmrghd	59, 51, 36
	vslw 2, 2, 2
	vadduwm 5, 6, 14
	xxspltw 0, 0, 0
	vadduwm 7, 0, 0
	xxmrghd	32, 44, 52
	vadduwm 6, 8, 8
	xxmrghd	40, 50, 63
	xxlor 6, 45, 45
	xxmrghd	45, 61, 53
	vadduwm 10, 1, 11
	vspltisw 1, 9
	xxlor 12, 43, 43
	xxmrgld	63, 50, 63
	vadduwm 3, 3, 27
	xxmrgld	62, 61, 53
	vadduwm 11, 9, 0
	lxvw4x 41, 0, 15
	xxlor 5, 32, 32
	vadduwm 0, 5, 8
	xxmrgld	37, 44, 52
	vadduwm 10, 10, 13
	xxlor 11, 45, 45
	xxlxor 34, 32, 34
	xxlor 7, 48, 48
	xxmrgld	48, 51, 36
	xxlxor 36, 35, 1
	xxlxor 45, 43, 3
	xxlxor 52, 42, 0
	vmrghw 23, 26, 24
	vmrglw 22, 26, 24
	vmrghw 26, 15, 17
	vmrglw 24, 15, 17
	vspltisw 15, -16
	xxlor 4, 40, 40
	vperm 8, 4, 4, 9
	vperm 13, 13, 13, 9
	vperm 4, 2, 2, 9
	lxvw4x 34, 0, 16
	vperm 20, 20, 20, 9
	vsubuwm 1, 1, 15
	xxmrgld	53, 60, 54
	xxlor 0, 46, 46
	lxvw4x 46, 0, 14
	vadduwm 15, 3, 16
	lxvw4x 35, 0, 5
	xxlor 31, 48, 48
	lxvw4x 48, 0, 25
	vadduwm 19, 8, 14
	vadduwm 17, 4, 3
	vadduwm 16, 13, 16
	vadduwm 14, 20, 2
	xxlxor 35, 48, 7
	xxlxor 50, 49, 0
	xxlxor 61, 46, 12
	xxlor 2, 1, 1
	xxlxor 34, 51, 6
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 29, 29, 7
	xxlor 2, 3, 3
	vadduwm 12, 11, 5
	xxlor 2, 37, 37
	vrlw 5, 2, 7
	vadduwm 0, 0, 31
	vadduwm 10, 10, 30
	vadduwm 12, 12, 3
	vadduwm 0, 0, 18
	vadduwm 10, 10, 29
	vadduwm 15, 15, 5
	xxlxor 45, 44, 45
	xxlxor 36, 32, 36
	xxlxor 52, 42, 52
	xxlxor 34, 47, 40
	vrlw 11, 13, 6
	vrlw 4, 4, 6
	vrlw 20, 20, 6
	vrlw 8, 2, 6
	xxlor 13, 63, 63
	xxmrghd	45, 57, 55
	xxmrghd	34, 60, 54
	xxlor 60, 11, 11
	vadduwm 31, 11, 16
	vadduwm 17, 4, 17
	vadduwm 16, 20, 14
	vadduwm 19, 8, 19
	xxlxor 35, 63, 35
	xxlxor 50, 49, 50
	xxlxor 61, 48, 61
	vadduwm 15, 15, 13
	xxlor 7, 45, 45
	vadduwm 13, 12, 2
	xxlxor 44, 51, 37
	xxmrghd	37, 30, 58
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 14, 29, 1
	vrlw 12, 12, 1
	xxlor 0, 34, 34
	xxmrghd	34, 29, 56
	vadduwm 0, 0, 5
	vadduwm 15, 15, 3
	vadduwm 10, 10, 2
	vadduwm 13, 13, 18
	vadduwm 0, 0, 14
	vmr	29, 5
	vadduwm 10, 10, 12
	xxlxor 52, 47, 52
	xxlxor 37, 45, 40
	xxlxor 40, 32, 43
	xxlor 6, 34, 34
	xxmrgld	34, 57, 55
	xxlxor 36, 42, 36
	vperm 23, 20, 20, 9
	vperm 8, 8, 8, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	vadduwm 15, 15, 2
	xxlor 12, 34, 34
	vadduwm 20, 17, 23
	vadduwm 17, 19, 8
	vadduwm 25, 16, 5
	xxmrgld	48, 30, 58
	vadduwm 22, 31, 4
	xxlxor 43, 49, 46
	xxmrgld	46, 29, 56
	xxlxor 35, 52, 35
	xxlxor 50, 57, 50
	xxlxor 34, 54, 44
	vrlw 11, 11, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	vadduwm 0, 0, 16
	vadduwm 13, 13, 21
	vadduwm 10, 10, 14
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 55
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vrlw 8, 8, 6
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 4, 4, 6
	vmr	31, 14
	xxlor 56, 4, 4
	vadduwm 17, 8, 17
	vadduwm 12, 26, 20
	vadduwm 14, 5, 25
	vadduwm 25, 4, 22
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 1
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	xxlor 55, 5, 5
	xxlor 51, 2, 2
	vadduwm 10, 10, 24
	vadduwm 15, 15, 23
	vadduwm 13, 13, 19
	vadduwm 0, 0, 30
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 37, 47
	xxlxor 40, 40, 45
	xxlxor 36, 32, 36
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 8, 8, 8, 9
	vperm 4, 4, 4, 9
	xxlor 54, 0, 0
	vadduwm 10, 10, 16
	vadduwm 14, 14, 26
	vadduwm 17, 17, 5
	vadduwm 25, 25, 8
	vadduwm 12, 12, 4
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 7
	vrlw 2, 2, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vadduwm 15, 15, 28
	vadduwm 13, 13, 22
	vadduwm 0, 0, 27
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 47, 37
	xxlxor 40, 45, 40
	xxlxor 36, 32, 36
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 8, 8, 6
	vrlw 4, 4, 6
	xxlor 2, 59, 59
	xxlor 59, 12, 12
	vadduwm 14, 26, 14
	vadduwm 17, 5, 17
	vadduwm 25, 8, 25
	vadduwm 12, 4, 12
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 2, 2, 1
	vmr	20, 16
	xxlor 48, 31, 31
	vadduwm 0, 0, 27
	vadduwm 15, 15, 16
	vadduwm 13, 13, 29
	vadduwm 10, 10, 31
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vperm 8, 8, 8, 9
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	xxlor 48, 13, 13
	xxlor 11, 31, 31
	vadduwm 17, 17, 8
	vadduwm 12, 12, 26
	vadduwm 14, 14, 5
	vadduwm 25, 25, 4
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 7
	vadduwm 13, 13, 16
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	xxlor 48, 6, 6
	xxlor 31, 63, 63
	vadduwm 0, 0, 16
	xxlor 63, 7, 7
	vadduwm 15, 15, 21
	vadduwm 10, 10, 31
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vrlw 8, 8, 6
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 4, 4, 6
	vadduwm 10, 10, 30
	vadduwm 15, 15, 19
	vadduwm 17, 8, 17
	vadduwm 12, 26, 12
	vadduwm 14, 5, 14
	vadduwm 25, 4, 25
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 1
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vadduwm 13, 13, 22
	vadduwm 0, 0, 20
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 37, 47
	xxlxor 40, 40, 45
	xxlxor 36, 32, 36
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 8, 8, 8, 9
	vperm 4, 4, 4, 9
	vadduwm 10, 10, 16
	vadduwm 15, 15, 24
	vadduwm 14, 14, 26
	vadduwm 17, 17, 5
	vadduwm 25, 25, 8
	vadduwm 12, 12, 4
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 7
	vrlw 2, 2, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vadduwm 13, 13, 29
	vadduwm 0, 0, 23
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 47, 37
	xxlxor 40, 45, 40
	xxlxor 36, 32, 36
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 8, 8, 6
	vrlw 4, 4, 6
	vadduwm 0, 0, 21
	vadduwm 15, 15, 28
	vadduwm 14, 26, 14
	vadduwm 17, 5, 17
	vadduwm 25, 8, 25
	vadduwm 12, 4, 12
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 2, 2, 1
	vadduwm 13, 13, 27
	vadduwm 10, 10, 31
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vperm 8, 8, 8, 9
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	xxlor 12, 5, 5
	xxlor 5, 60, 60
	vadduwm 17, 17, 8
	vadduwm 12, 12, 26
	vadduwm 14, 14, 5
	vadduwm 25, 25, 4
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	xxlor 60, 31, 31
	vmr	24, 29
	vmr	29, 16
	xxlor 63, 13, 13
	xxlor 55, 2, 2
	vadduwm 0, 0, 28
	xxlor 48, 11, 11
	vadduwm 15, 15, 31
	vadduwm 13, 13, 23
	vadduwm 10, 10, 16
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vrlw 8, 8, 6
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 4, 4, 6
	xxlor 0, 52, 52
	vadduwm 15, 15, 22
	vadduwm 17, 8, 17
	vadduwm 12, 26, 12
	vadduwm 14, 5, 14
	vadduwm 25, 4, 25
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 1
	xxlor 2, 54, 54
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vadduwm 0, 0, 29
	vmr	22, 29
	xxlor 61, 0, 0
	vadduwm 13, 13, 24
	vadduwm 10, 10, 29
	vadduwm 15, 15, 2
	vadduwm 10, 10, 11
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 37, 47
	xxlxor 40, 40, 45
	xxlxor 36, 32, 36
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 8, 8, 8, 9
	vperm 4, 4, 4, 9
	vadduwm 10, 10, 28
	vadduwm 15, 15, 30
	vadduwm 14, 14, 26
	vadduwm 17, 17, 5
	vadduwm 25, 25, 8
	vadduwm 12, 12, 4
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 7
	vrlw 2, 2, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vadduwm 13, 13, 27
	vadduwm 0, 0, 19
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 47, 37
	xxlxor 40, 45, 40
	xxlxor 36, 32, 36
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 8, 8, 6
	vrlw 4, 4, 6
	xxlor 52, 4, 4
	vadduwm 0, 0, 31
	vadduwm 14, 26, 14
	vadduwm 17, 5, 17
	vadduwm 25, 8, 25
	vadduwm 12, 4, 12
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 2, 2, 1
	vadduwm 15, 15, 20
	vadduwm 13, 13, 21
	vadduwm 10, 10, 16
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vperm 8, 8, 8, 9
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	xxlor 4, 7, 7
	xxlor 7, 62, 62
	vadduwm 17, 17, 8
	vadduwm 12, 12, 26
	vadduwm 14, 14, 5
	vadduwm 25, 25, 4
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	xxlor 60, 4, 4
	vmr	30, 31
	xxlor 11, 48, 48
	vmr	31, 23
	vadduwm 15, 15, 23
	xxlor 55, 12, 12
	vadduwm 0, 0, 28
	xxlor 48, 5, 5
	vadduwm 13, 13, 23
	vadduwm 10, 10, 16
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vrlw 8, 8, 6
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 4, 4, 6
	xxlor 6, 51, 51
	xxlor 13, 51, 51
	vadduwm 17, 8, 17
	vadduwm 12, 26, 12
	vadduwm 14, 5, 14
	vadduwm 25, 4, 25
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 1
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	xxlor 51, 31, 31
	vadduwm 10, 10, 22
	vadduwm 15, 15, 24
	vadduwm 13, 13, 27
	vadduwm 0, 0, 19
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 37, 47
	xxlxor 40, 40, 45
	xxlxor 36, 32, 36
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 8, 8, 8, 9
	vperm 4, 4, 4, 9
	xxlor 51, 2, 2
	vadduwm 10, 10, 28
	vadduwm 14, 14, 26
	vadduwm 17, 17, 5
	vadduwm 25, 25, 8
	vadduwm 12, 12, 4
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 7
	vrlw 2, 2, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vadduwm 15, 15, 29
	vadduwm 13, 13, 21
	vadduwm 0, 0, 19
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 47, 37
	xxlxor 40, 45, 40
	xxlxor 36, 32, 36
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 8, 8, 6
	vrlw 4, 4, 6
	xxlor 12, 61, 61
	xxlor 61, 7, 7
	vadduwm 14, 26, 14
	vadduwm 17, 5, 17
	vadduwm 25, 8, 25
	vadduwm 12, 4, 12
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 2, 2, 1
	vadduwm 0, 0, 31
	vadduwm 15, 15, 29
	vadduwm 13, 13, 30
	vadduwm 10, 10, 16
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vperm 8, 8, 8, 9
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	xxlor 0, 56, 56
	vmr	24, 27
	vadduwm 17, 17, 8
	vadduwm 12, 12, 26
	vadduwm 14, 14, 5
	vadduwm 25, 25, 4
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	xxlor 59, 11, 11
	xxlor 61, 13, 13
	vadduwm 0, 0, 27
	vadduwm 15, 15, 23
	vadduwm 13, 13, 29
	vadduwm 10, 10, 20
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vrlw 8, 8, 6
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 4, 4, 6
	vadduwm 0, 0, 28
	xxlor 11, 60, 60
	vadduwm 17, 8, 17
	vadduwm 12, 26, 12
	vadduwm 14, 5, 14
	vadduwm 25, 4, 25
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 1
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	xxlor 60, 31, 31
	vadduwm 15, 15, 24
	vadduwm 10, 10, 28
	vadduwm 13, 13, 21
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 37, 47
	xxlxor 40, 40, 45
	xxlxor 36, 32, 36
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 8, 8, 8, 9
	vperm 4, 4, 4, 9
	xxlor 4, 31, 31
	vadduwm 15, 15, 22
	vadduwm 14, 14, 26
	vadduwm 17, 17, 5
	vadduwm 25, 25, 8
	vadduwm 12, 12, 4
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 7
	vrlw 2, 2, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	xxlor 4, 54, 54
	xxlor 54, 0, 0
	vadduwm 10, 10, 27
	vadduwm 13, 13, 30
	vadduwm 0, 0, 22
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 58, 42, 58
	xxlxor 37, 47, 37
	xxlxor 40, 45, 40
	xxlxor 36, 32, 36
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 8, 8, 6
	vrlw 4, 4, 6
	xxlor 5, 63, 63
	xxlor 63, 12, 12
	vadduwm 14, 26, 14
	vadduwm 17, 5, 17
	vadduwm 25, 8, 25
	vadduwm 12, 4, 12
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 57, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 2, 2, 1
	vadduwm 15, 15, 31
	xxlor 63, 5, 5
	vadduwm 0, 0, 23
	vadduwm 13, 13, 31
	vadduwm 10, 10, 20
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vperm 8, 8, 8, 9
	vperm 26, 26, 26, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	vadduwm 15, 15, 29
	vadduwm 0, 0, 16
	vadduwm 17, 17, 8
	vadduwm 12, 12, 26
	vadduwm 14, 14, 5
	vadduwm 25, 25, 4
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 57, 34
	vrlw 11, 11, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	xxlor 61, 7, 7
	vadduwm 13, 13, 19
	vadduwm 10, 10, 29
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 58, 47, 58
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vrlw 8, 8, 6
	vrlw 26, 26, 6
	vrlw 5, 5, 6
	vrlw 4, 4, 6
	vadduwm 13, 13, 30
	xxlor 51, 11, 11
	vadduwm 17, 8, 17
	vadduwm 12, 26, 12
	vadduwm 14, 5, 14
	vadduwm 30, 4, 25
	xxlxor 43, 49, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 62, 34
	vrlw 11, 11, 1
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vadduwm 10, 10, 19
	vadduwm 15, 15, 21
	vadduwm 0, 0, 27
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 51, 42, 58
	xxlxor 37, 37, 47
	xxlxor 40, 40, 45
	xxlxor 36, 32, 36
	vperm 19, 19, 19, 9
	vperm 5, 5, 5, 9
	vperm 8, 8, 8, 9
	vperm 4, 4, 4, 9
	xxlor 6, 56, 56
	vadduwm 13, 13, 31
	vadduwm 14, 14, 19
	vadduwm 17, 17, 5
	vadduwm 30, 30, 8
	vadduwm 12, 12, 4
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 62, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 7
	vrlw 2, 2, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	xxlor 63, 6, 6
	vadduwm 10, 10, 16
	vadduwm 15, 15, 28
	vadduwm 0, 0, 31
	vadduwm 10, 10, 11
	vadduwm 15, 15, 2
	vadduwm 13, 13, 3
	vadduwm 0, 0, 18
	xxlxor 51, 42, 51
	xxlxor 37, 47, 37
	xxlxor 40, 45, 40
	xxlxor 36, 32, 36
	vrlw 19, 19, 6
	vrlw 5, 5, 6
	vrlw 8, 8, 6
	vrlw 4, 4, 6
	xxlor 56, 13, 13
	xxlor 48, 4, 4
	vadduwm 14, 19, 14
	vadduwm 17, 5, 17
	vadduwm 31, 8, 30
	vadduwm 12, 4, 12
	xxlxor 43, 46, 43
	xxlxor 34, 49, 34
	xxlxor 35, 63, 35
	xxlxor 50, 44, 50
	vrlw 11, 11, 1
	vrlw 3, 3, 1
	vrlw 18, 18, 1
	vrlw 2, 2, 1
	vadduwm 0, 0, 24
	vadduwm 15, 15, 16
	vadduwm 13, 13, 23
	vadduwm 10, 10, 29
	vadduwm 0, 0, 11
	vadduwm 15, 15, 3
	vadduwm 13, 13, 18
	vadduwm 10, 10, 2
	xxlxor 40, 32, 40
	xxlxor 51, 47, 51
	xxlxor 37, 45, 37
	xxlxor 36, 42, 36
	vperm 8, 8, 8, 9
	vperm 19, 19, 19, 9
	vperm 5, 5, 5, 9
	vperm 4, 4, 4, 9
	xxlor 0, 52, 52
	xxlor 52, 2, 2
	vadduwm 13, 13, 22
	vadduwm 9, 15, 20
	vadduwm 15, 17, 8
	vadduwm 12, 12, 19
	vadduwm 14, 14, 5
	vadduwm 17, 31, 4
	xxlxor 43, 47, 43
	xxlxor 35, 44, 35
	xxlxor 50, 46, 50
	xxlxor 34, 49, 34
	vrlw 11, 11, 7
	vrlw 3, 3, 7
	vrlw 18, 18, 7
	vrlw 2, 2, 7
	xxlor 39, 0, 0
	vadduwm 0, 0, 7
	xxlor 39, 12, 12
	vadduwm 0, 0, 11
	vadduwm 7, 10, 7
	vadduwm 9, 9, 3
	vadduwm 10, 13, 18
	vadduwm 13, 7, 2
	xxlxor 39, 32, 40
	xxlxor 36, 45, 36
	vrlw 16, 7, 6
	xxlxor 39, 41, 51
	xxlxor 37, 42, 37
	vrlw 4, 4, 6
	vrlw 19, 7, 6
	vrlw 5, 5, 6
	vadduwm 6, 16, 15
	xxlxor 43, 38, 43
	vadduwm 7, 4, 17
	xxlxor 40, 38, 41
	vadduwm 6, 19, 12
	vadduwm 9, 5, 14
	xxlxor 34, 39, 34
	xxlxor 39, 42, 39
	xxlxor 35, 38, 35
	xxlxor 42, 41, 50
	vrlw 2, 2, 1
	vrlw 3, 3, 1
	vrlw 10, 10, 1
	vrlw 11, 11, 1
	xxlxor 38, 32, 38
	xxlxor 33, 41, 45
	xxlxor 45, 37, 34
	xxlxor 48, 48, 35
	xxlxor 46, 42, 36
	xxlxor 43, 43, 51
	bne	5, .LBB2_4
	ld 28, 152(1)
	ld 31, 144(1)
	ld 3, 136(1)
	ld 9, 232(1)
.LBB2_8:
	vmrghw 2, 8, 7
	addi 4, 29, 4
	addi 26, 26, -4
	li 6, 64
	vmrghw 3, 6, 1
	cmpldi 5, 26, 3
	addi 20, 20, 32
	addi 9, 9, 1
	vmrglw 4, 8, 7
	vmrglw 5, 6, 1
	vmrglw 6, 13, 16
	vmrglw 7, 14, 11
	vmrghw 0, 13, 16
	vmrghw 1, 14, 11
	xxmrghd	0, 34, 35
	iselgt	29, 4, 29
	li 4, 80
	xxmrgld	3, 36, 37
	xxmrgld	1, 34, 35
	xxmrghd	6, 38, 39
	stxvd2x 0, 0, 23
	xxmrghd	2, 36, 37
	xxmrghd	4, 32, 33
	stxvd2x 1, 23, 19
	xxmrgld	5, 32, 33
	stxvd2x 6, 23, 4
	li 4, 96
	xxmrgld	7, 38, 39
	stxvd2x 3, 23, 4
	li 4, 112
	stxvd2x 4, 23, 24
	stxvd2x 2, 23, 6
	stxvd2x 5, 23, 18
	stxvd2x 7, 23, 4
	addi 23, 23, 128
	bgt	5, .LBB2_2
	b .LBB2_10
.LBB2_9:
	mr	20, 3
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
	mr	3, 31
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
	bl _blake3_compress_in_place_sse2
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
	lfd 31, 824(1)
	lfd 30, 816(1)
	lxvd2x 63, 1, 3
	li 3, 624
	lfd 29, 808(1)
	lxvd2x 62, 1, 3
	li 3, 608
	ld 31, 800(1)
	lxvd2x 61, 1, 3
	li 3, 592
	ld 30, 792(1)
	lxvd2x 60, 1, 3
	li 3, 576
	ld 29, 784(1)
	lxvd2x 59, 1, 3
	li 3, 560
	ld 28, 776(1)
	lxvd2x 58, 1, 3
	li 3, 544
	ld 27, 768(1)
	lxvd2x 57, 1, 3
	li 3, 528
	ld 26, 760(1)
	lxvd2x 56, 1, 3
	li 3, 512
	ld 25, 752(1)
	lxvd2x 55, 1, 3
	li 3, 496
	ld 24, 744(1)
	lxvd2x 54, 1, 3
	li 3, 480
	ld 23, 736(1)
	lxvd2x 53, 1, 3
	li 3, 464
	ld 22, 728(1)
	lxvd2x 52, 1, 3
	ld 21, 720(1)
	ld 20, 712(1)
	ld 19, 704(1)
	ld 18, 696(1)
	ld 17, 688(1)
	ld 16, 680(1)
	ld 15, 672(1)
	ld 14, 664(1)
	addi 1, 1, 832
	ld 0, 16(1)
	mtlr 0
	blr
	.long	0
	.quad	0
.Lfunc_end2:
	.size	_blake3_hash_many_sse2, .Lfunc_end2-.Lfunc_begin2
	.cfi_endproc

#endif
