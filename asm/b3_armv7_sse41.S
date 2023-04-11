/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Based on BLAKE3 v1.3.1, https://github.com/BLAKE3-team/BLAKE3
 * Copyright (c) 2019-2022 Samuel Neves
 * Copyright (c) 2022-2023 Tino Reichardt <milky-zfs@mcmilk.de>
 *
 * This is converted assembly: SSE4.1 -> ARMv7
 * Used tools: SIMDe https://github.com/simd-everywhere/simde
 */

#if defined(__ARM_ARCH_7__)
	.arch armv7
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.text
	.align	1
	.global	loadu
	.arch armv7
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	loadu, %function
loadu:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, [r0, #8]	@ unaligned
	sub	sp, sp, #20
	ldr	r7, [r0, #12]	@ unaligned
	ldr	r4, [r0]	@ unaligned
	ldr	r5, [r0, #4]	@ unaligned
	strd	r6, r7, [sp, #8]
	mov	r8, r4
	mov	r9, r5
	strd	r4, r5, [sp]
	vldr.64	d1, [sp, #8]	@ int
	vmov	d0, r8, r9	@ int
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	loadu, .-loadu
	.align	1
	.global	storeu
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	storeu, %function
storeu:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	vmov	r2, s3	@ int
	vmov	r1, s2	@ int
	sub	sp, sp, #28
	add	r3, sp, #8
	add	r5, sp, #24
	strd	r1, r2, [sp, #16]
	mov	r2, r0
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	vstr.32	s0, [sp, #8]	@ int
	vstr.32	s1, [sp, #12]	@ int
.L3:
	mov	r4, r3
	adds	r2, r2, #8
	ldmia	r4!, {r0, r1}
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	mov	r3, r4
	cmp	r4, r5
	bne	.L3
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
	.size	storeu, .-storeu
	.align	1
	.global	addv
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	addv, %function
addv:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	vmov	r4, s4	@ int
	vmov	r5, s0	@ int
	vmov	r1, s2	@ int
	vmov	r3, s3	@ int
	vmov	r0, s6	@ int
	vmov	r2, s7	@ int
	vmov	ip, s5	@ int
	vstr.32	s6, [sp]	@ int
	add	r5, r5, r4
	vmov	r4, s1	@ int
	vmov	s0, r5	@ int
	vstr.32	s7, [sp, #4]	@ int
	adds	r1, r0, r1
	adds	r3, r2, r3
	vmov	s2, r1	@ int
	vmov	s3, r3	@ int
	add	r4, r4, ip
	vmov	s1, r4	@ int
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
	.size	addv, .-addv
	.align	1
	.global	xorv
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	xorv, %function
xorv:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	vmov	r4, s4	@ int
	vmov	r5, s0	@ int
	vmov	r1, s2	@ int
	vmov	r3, s3	@ int
	vmov	r0, s6	@ int
	vmov	r2, s7	@ int
	vmov	r6, s5	@ int
	vstr.32	s6, [sp]	@ int
	eors	r5, r5, r4
	vmov	r4, s1	@ int
	vmov	s0, r5	@ int
	vstr.32	s7, [sp, #4]	@ int
	eors	r1, r1, r0
	eors	r3, r3, r2
	vmov	s2, r1	@ int
	vmov	s3, r3	@ int
	eors	r4, r4, r6
	vmov	s1, r4	@ int
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
	.size	xorv, .-xorv
	.align	1
	.global	set1
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	set1, %function
set1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r0
	mov	fp, r0
	sub	sp, sp, #20
	vmov	d1, r10, fp	@ int
	str	r0, [sp]
	str	r0, [sp, #4]
	vldr.64	d0, [sp]	@ int
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	set1, .-set1
	.align	1
	.global	set4
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	set4, %function
set4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	mov	r0, r8
	str	r1, [sp, #4]
	mov	r8, r0
	ldr	r1, [sp, #4]
	mov	lr, r2
	mov	ip, r3
	mov	r4, r8
	mov	r9, r1
	mov	r8, r4
	mov	r5, r9
	mov	r6, lr
	mov	r9, r5
	mov	r7, ip
	vmov	d0, r8, r9	@ int
	vmov	d1, r6, r7	@ int
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	set4, .-set4
	.align	1
	.global	rot16
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	rot16, %function
rot16:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r2, #1
	ldr	r5, .L12
	movw	r6, #770
	sub	sp, sp, #64
	bfi	r6, r2, #24, #8
	movs	r2, #5
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	ldr	r4, .L12+4
	add	r3, sp, #23
	bic	r3, r3, #15
	bfi	r5, r2, #24, #8
	movs	r2, #9
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	bfi	r4, r2, #24, #8
	ldr	r2, .L12+8
	strd	r0, r1, [r3, #24]
	movs	r1, #13
	strd	r6, r5, [r3]
	movs	r0, #0
	bfi	r2, r1, #24, #8
	strd	r4, r2, [r3, #8]
	add	r4, r3, #32
	mov	r6, r3
	mov	r1, r4
	vstr.32	s0, [r3, #16]	@ int
	vstr.32	s1, [r3, #20]	@ int
.L10:
	ldrsb	r2, [r6], #1
	adds	r0, r0, #1
	cmp	r0, #16
	and	r5, r2, #15
	mvn	r2, r2
	add	r5, r5, r3
	ldrb	r5, [r5, #16]	@ zero_extendqisi2
	and	r2, r5, r2, asr #31
	strb	r2, [r4], #1
	bne	.L10
	vldr.32	s0, [r3, #32]	@ int
	vldr.32	s1, [r1, #4]	@ int
	vldr.32	s2, [r1, #8]	@ int
	vldr.32	s3, [r1, #12]	@ int
	add	sp, sp, #64
	@ sp needed
	pop	{r4, r5, r6, pc}
.L13:
	.align	2
.L12:
	.word	263942
	.word	527114
	.word	790286
	.size	rot16, .-rot16
	.align	1
	.global	rot12
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	rot12, %function
rot12:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov	r1, s0	@ int
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	sub	sp, sp, #8
	ror	r0, r1, #12
	vmov	r1, s1	@ int
	ror	r2, r2, #12
	ror	r3, r3, #12
	vmov	s0, r0	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	vmov	s2, r2	@ int
	ror	r1, r1, #12
	vmov	s3, r3	@ int
	vmov	s1, r1	@ int
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	rot12, .-rot12
	.align	1
	.global	rot8
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	rot8, %function
rot8:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r2, #4
	ldr	r5, .L18
	sub	sp, sp, #64
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	ldr	r4, .L18+4
	add	r3, sp, #23
	bfi	r5, r2, #24, #8
	bic	r3, r3, #15
	movs	r2, #8
	ldr	r6, .L18+8
	bfc	r6, #24, #8
	bfi	r4, r2, #24, #8
	ldr	r2, .L18+12
	strd	r0, r1, [r3, #24]
	movs	r1, #12
	strd	r6, r5, [r3]
	movs	r0, #0
	bfi	r2, r1, #24, #8
	strd	r4, r2, [r3, #8]
	add	r4, r3, #32
	mov	r6, r3
	mov	r1, r4
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	vstr.32	s0, [r3, #16]	@ int
	vstr.32	s1, [r3, #20]	@ int
.L16:
	ldrsb	r2, [r6], #1
	adds	r0, r0, #1
	cmp	r0, #16
	and	r5, r2, #15
	mvn	r2, r2
	add	r5, r5, r3
	ldrb	r5, [r5, #16]	@ zero_extendqisi2
	and	r2, r5, r2, asr #31
	strb	r2, [r4], #1
	bne	.L16
	vldr.32	s0, [r3, #32]	@ int
	vldr.32	s1, [r1, #4]	@ int
	vldr.32	s2, [r1, #8]	@ int
	vldr.32	s3, [r1, #12]	@ int
	add	sp, sp, #64
	@ sp needed
	pop	{r4, r5, r6, pc}
.L19:
	.align	2
.L18:
	.word	460293
	.word	723465
	.word	197121
	.word	986637
	.size	rot8, .-rot8
	.align	1
	.global	rot7
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	rot7, %function
rot7:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov	r1, s0	@ int
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	sub	sp, sp, #8
	ror	r0, r1, #7
	vmov	r1, s1	@ int
	ror	r2, r2, #7
	ror	r3, r3, #7
	vmov	s0, r0	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	vmov	s2, r2	@ int
	ror	r1, r1, #7
	vmov	s3, r3	@ int
	vmov	s1, r1	@ int
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	rot7, .-rot7
	.align	1
	.global	g1
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	g1, %function
g1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r1
	mov	r9, r3
	ldr	r3, [r0]
	mov	r10, r2
	ldr	r4, [r8, #4]
	vmov	r2, s2	@ int
	str	r4, [sp]
	vmov	r4, s0	@ int
	ldrd	r7, r6, [r8, #8]
	vmov	ip, s1	@ int
	ldr	r5, [r0, #8]
	vmov	r1, s3	@ int
	add	r3, r3, r4
	ldr	r4, [r8]
	add	r2, r2, r5
	add	r3, r3, r4
	ldr	r4, [r0, #4]
	add	r7, r7, r2
	ldr	r2, [r0, #12]
	add	ip, ip, r4
	ldr	r4, [sp]
	add	r1, r1, r2
	add	r4, r4, ip
	add	r6, r6, r1
	strd	r3, r4, [r0]
	strd	r7, r6, [r0, #8]
	ldrd	r0, r1, [r9, #4]
	ldr	r5, [r9]
	ldr	r2, [r9, #12]
	eors	r0, r0, r4
	eors	r3, r3, r5
	eors	r7, r7, r1
	eors	r2, r2, r6
	vmov	s2, r7	@ int
	vmov	s3, r2	@ int
	vmov	s0, r3	@ int
	vmov	s1, r0	@ int
	strd	r3, r0, [r9]
	strd	r7, r2, [r9, #8]
	strd	r3, r0, [sp]
	strd	r7, r2, [sp, #8]
	bl	rot16(PLT)
	vmov	r6, s0	@ int
	vmov	r5, s1	@ int
	vmov	r4, s2	@ int
	vmov	r0, s3	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	strd	r6, r5, [r9]
	strd	r4, r0, [r9, #8]
	ldrd	r7, r1, [r10]
	ldrd	r2, r3, [r10, #8]
	add	r7, r7, r6
	add	r1, r1, r5
	strd	r7, r1, [r10]
	add	r2, r2, r4
	add	r3, r3, r0
	strd	r2, r3, [r10, #8]
	ldrd	r6, r5, [r8]
	ldrd	r4, r0, [r8, #8]
	eors	r7, r7, r6
	eors	r1, r1, r5
	eors	r2, r2, r4
	eors	r3, r3, r0
	ror	r7, r7, #12
	ror	r1, r1, #12
	ror	r2, r2, #12
	ror	r3, r3, #12
	strd	r7, r1, [r8]
	strd	r2, r3, [r8, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
	.size	g1, .-g1
	.align	1
	.global	g2
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	g2, %function
g2:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r1
	mov	r9, r3
	ldr	r3, [r0]
	mov	r10, r2
	ldr	r4, [r8, #4]
	vmov	r2, s2	@ int
	str	r4, [sp]
	vmov	r4, s0	@ int
	ldrd	r7, r6, [r8, #8]
	vmov	ip, s1	@ int
	ldr	r5, [r0, #8]
	vmov	r1, s3	@ int
	add	r3, r3, r4
	ldr	r4, [r8]
	add	r2, r2, r5
	add	r3, r3, r4
	ldr	r4, [r0, #4]
	add	r7, r7, r2
	ldr	r2, [r0, #12]
	add	ip, ip, r4
	ldr	r4, [sp]
	add	r1, r1, r2
	add	r4, r4, ip
	add	r6, r6, r1
	strd	r3, r4, [r0]
	strd	r7, r6, [r0, #8]
	ldrd	r0, r1, [r9, #4]
	ldr	r5, [r9]
	ldr	r2, [r9, #12]
	eors	r0, r0, r4
	eors	r3, r3, r5
	eors	r7, r7, r1
	eors	r2, r2, r6
	vmov	s2, r7	@ int
	vmov	s3, r2	@ int
	vmov	s0, r3	@ int
	vmov	s1, r0	@ int
	strd	r3, r0, [r9]
	strd	r7, r2, [r9, #8]
	strd	r3, r0, [sp]
	strd	r7, r2, [sp, #8]
	bl	rot8(PLT)
	vmov	r6, s0	@ int
	vmov	r5, s1	@ int
	vmov	r4, s2	@ int
	vmov	r0, s3	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	strd	r6, r5, [r9]
	strd	r4, r0, [r9, #8]
	ldrd	r7, r1, [r10]
	ldrd	r2, r3, [r10, #8]
	add	r7, r7, r6
	add	r1, r1, r5
	strd	r7, r1, [r10]
	add	r2, r2, r4
	add	r3, r3, r0
	strd	r2, r3, [r10, #8]
	ldrd	r6, r5, [r8]
	ldrd	r4, r0, [r8, #8]
	eors	r7, r7, r6
	eors	r1, r1, r5
	eors	r2, r2, r4
	eors	r3, r3, r0
	ror	r7, r7, #7
	ror	r1, r1, #7
	ror	r2, r2, #7
	ror	r3, r3, #7
	strd	r7, r1, [r8]
	strd	r2, r3, [r8, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
	.size	g2, .-g2
	.align	1
	.global	diagonalize
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	diagonalize, %function
diagonalize:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, r2
	ldrd	r8, r9, [r0]
	ldrd	r10, fp, [r0, #8]
	strd	fp, r8, [r0]
	strd	r9, r10, [r0, #8]
	ldrd	r4, r5, [r2]
	ldrd	r6, r7, [r2, #8]
	strd	r6, r7, [r2]
	strd	r4, r5, [r2, #8]
	ldrd	r4, r5, [r1]
	ldrd	r6, r7, [r1, #8]
	strd	r5, r6, [r1]
	strd	r7, r4, [r1, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	diagonalize, .-diagonalize
	.align	1
	.global	undiagonalize
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	undiagonalize, %function
undiagonalize:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, r2
	ldrd	r8, r9, [r0]
	ldrd	r10, fp, [r0, #8]
	strd	r9, r10, [r0]
	strd	fp, r8, [r0, #8]
	ldrd	r4, r5, [r2]
	ldrd	r6, r7, [r2, #8]
	strd	r6, r7, [r2]
	strd	r4, r5, [r2, #8]
	ldrd	r4, r5, [r1]
	ldrd	r6, r7, [r1, #8]
	strd	r7, r4, [r1]
	strd	r5, r6, [r1, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	undiagonalize, .-undiagonalize
	.align	1
	.global	compress_pre
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	compress_pre, %function
compress_pre:
	@ args = 12, pretend = 0, frame = 352
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r8, r2
	ldr	r5, [r1]	@ unaligned
	mov	r6, r3
	ldr	r0, [r1, #4]	@ unaligned
	add	r7, r4, #16
	ldr	r2, [r1, #8]	@ unaligned
	sub	sp, sp, #356
	ldr	r3, [r1, #12]	@ unaligned
	add	fp, sp, #80
	strd	r5, r0, [r4]
	strd	r2, r3, [r4, #8]
	ldrb	r9, [sp, #400]	@ zero_extendqisi2
	ldr	r5, [r1, #16]	@ unaligned
	ldr	r0, [r1, #20]	@ unaligned
	ldr	r2, [r1, #24]	@ unaligned
	ldr	r3, [r1, #28]	@ unaligned
	str	r5, [r4, #16]
	add	r5, r4, #32
	strd	r0, r2, [r7, #4]
	str	r3, [r7, #12]
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldr	r1, .L26+8
	ldr	r0, .L26+12
	bl	set4(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #32]	@ int
	ldrd	r0, r1, [sp, #392]
	vstr.32	s1, [r5, #4]	@ int
	vstr.32	s2, [sp, #4]	@ int
	strd	r2, r3, [r5, #8]
	mov	r2, r6
	mov	r3, r9
	vstr.32	s3, [sp, #8]	@ int
	bl	set4(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	add	r6, r4, #48
	vstr.32	s0, [r4, #48]	@ int
	vstr.32	s1, [r6, #4]	@ int
	strd	r2, r3, [r6, #8]
	ldr	r3, [r8, #4]	@ unaligned
	str	r3, [sp, #60]
	ldr	r3, [r8, #20]	@ unaligned
	str	r3, [sp, #56]
	ldr	r3, [r8, #32]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r8, #36]	@ unaligned
	str	r3, [sp, #48]
	ldr	r3, [r8, #40]	@ unaligned
	str	r3, [sp, #32]
	ldr	r3, [r8, #44]	@ unaligned
	str	r3, [sp, #52]
	ldr	r3, [r8, #48]	@ unaligned
	ldr	r10, [r8, #12]	@ unaligned
	ldr	r9, [r8, #28]	@ unaligned
	vmov	s14, r10
	str	r3, [sp, #16]
	ldr	r3, [r8, #52]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r8, #56]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r8, #60]	@ unaligned
	str	r3, [sp, #44]
	ldr	r3, [r8, #8]	@ unaligned
	str	r3, [sp, #40]
	ldr	r3, [r8, #16]	@ unaligned
	str	r3, [sp, #36]
	ldr	r3, [r8]	@ unaligned
	str	r3, [fp]	@ float
	add	r3, sp, #84
	vldr.32	s15, [sp, #40]
	str	r3, [sp, #4]
	vstr.32	s15, [r3]
	add	r3, sp, #88
	vldr.32	s15, [sp, #36]
	str	r3, [sp, #8]
	vstr.32	s15, [r3]
	add	r3, sp, #92
	str	r3, [sp, #12]
	vmov	s15, r9
	ldr	r2, [sp, #12]
	ldr	r3, [r8, #24]	@ unaligned
	add	r8, sp, #96
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	r8, {r0, r1, r2, r3}
	mov	r3, r6
	vldr.64	d0, [sp, #96]	@ int
	mov	r2, r5
	vldr.64	d1, [r8, #8]	@ int
	mov	r1, r7
	mov	r0, r4
	bl	g1(PLT)
	ldr	r3, [sp, #60]	@ float
	str	r3, [fp]	@ float
	add	ip, sp, #112
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #8]
	str	r10, [r3]	@ float
	ldr	r3, [sp, #56]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #12]
	str	r9, [r3]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	mov	r3, r6
	vldr.64	d1, [ip, #8]	@ int
	mov	r2, r5
	vldr.64	d0, [sp, #112]	@ int
	mov	r1, r7
	mov	r0, r4
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #28]	@ float
	add	ip, sp, #128
	str	r3, [fp]	@ float
	ldr	r3, [sp, #32]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #16]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]	@ float
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	str	r3, [sp, #20]
	mov	r3, r6
	vldr.32	s0, [sp, #20]	@ int
	str	r0, [sp, #32]
	mov	r9, r1
	str	r2, [sp, #28]
	vmov	s1, r0	@ int
	vmov	s2, r1	@ int
	mov	r0, r4
	mov	r1, r7
	vmov	s3, r2	@ int
	mov	r2, r5
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #48]	@ float
	add	ip, sp, #144
	str	r3, [fp]	@ float
	ldr	r3, [sp, #52]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #24]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #44]	@ float
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	str	r3, [sp, #44]
	mov	r3, r6
	vldr.32	s0, [sp, #44]	@ int
	str	r1, [sp, #24]
	mov	r10, r0
	str	r2, [sp, #16]
	vmov	s1, r0	@ int
	vmov	s2, r1	@ int
	mov	r0, r4
	mov	r1, r7
	vmov	s3, r2	@ int
	mov	r2, r5
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	vldr.32	s13, [sp, #36]
	ldr	r3, [sp, #4]
	add	ip, sp, #160
	vstr.32	s13, [fp]
	vldr.32	s13, [sp, #40]
	vstr.32	s13, [r3]
	ldr	r3, [sp, #8]
	vstr.32	s14, [r3]
	ldr	r3, [sp, #12]
	vstr.32	s15, [r3]
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #172]
	str	r3, [sp, #56]
	mov	r3, r6
	vldr.32	s2, [sp, #56]	@ int
	str	r1, [sp, #36]
	vmov	s0, r1	@ int
	str	r2, [sp, #52]
	mov	r1, r7
	str	r0, [sp, #40]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]	@ float
	add	ip, sp, #176
	str	r9, [fp]	@ float
	str	r9, [r2]	@ float
	ldr	r2, [sp, #8]
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	movs	r3, #0
	ldr	r1, [r8, #12]
	mov	ip, r3
	ldr	r2, [r8]
	mov	r0, r3
	mov	r8, r3
	bfi	r3, r1, #0, #16
	asrs	r1, r1, #16
	bfi	ip, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r3, r1, #16, #16
	ldrh	r1, [sp, #180]
	bfi	ip, r2, #16, #16
	ldrh	r2, [sp, #188]
	vmov	s2, ip	@ int
	str	r3, [sp, #60]
	bfi	r8, r1, #0, #16
	ldrh	r1, [sp, #182]
	bfi	r0, r2, #0, #16
	ldrh	r2, [sp, #190]
	vmov	s0, r3	@ int
	mov	r3, r6
	bfi	r8, r1, #16, #16
	mov	r1, r7
	bfi	r0, r2, #16, #16
	vmov	s1, r8	@ int
	mov	r2, r5
	vmov	s14, r0	@ int
	vmov	s3, r0	@ int
	mov	r0, r4
	str	ip, [sp, #16]
	bl	g2(PLT)
	mov	r0, r4
	mov	r2, r6
	mov	r1, r5
	movs	r3, #0
	bl	diagonalize(PLT)
	ldr	r2, [sp, #44]
	ldr	r1, [sp, #112]
	mov	ip, r3
	mov	r9, r3
	mov	lr, r3
	bfi	r3, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r9, r1, #0, #16
	asrs	r1, r1, #16
	bfi	r3, r2, #16, #16
	ldr	r2, [sp, #28]
	bfi	r9, r1, #16, #16
	bfi	ip, r10, #0, #16
	strd	r3, r9, [sp, #44]
	asr	r10, r10, #16
	bfi	lr, r2, #0, #16
	asrs	r2, r2, #16
	bfi	ip, r10, #16, #16
	vldr.32	s1, [sp, #48]	@ int
	bfi	lr, r2, #16, #16
	vmov	s3, ip	@ int
	vmov	s2, lr	@ int
	mov	r2, r5
	mov	r1, r7
	vmov	s0, r3	@ int
	mov	r3, r6
	vmov	s15, lr	@ int
	mov	r9, ip
	bl	g1(PLT)
	ldr	r3, [sp, #32]
	mov	r2, r5
	str	r3, [sp, #64]
	mov	r1, r7
	ldr	r3, [sp, #24]
	mov	r0, r4
	str	r3, [sp, #68]
	ldr	r3, [sp, #120]
	str	r3, [sp, #28]
	ldr	r3, [sp, #20]
	vldr.32	s0, [sp, #64]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #68]	@ int
	vldr.32	s2, [sp, #28]	@ int
	str	r3, [sp, #72]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #56]	@ float
	add	ip, sp, #192
	str	r3, [fp]	@ float
	b	.L27
.L28:
	.align	2
.L26:
	.word	1013904242
	.word	-1521486534
	.word	-1150833019
	.word	1779033703
.L27:
	ldr	r3, [sp, #52]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #8]
	str	r8, [r3]	@ float
	ldr	r3, [sp, #12]
	vstr.32	s14, [r3]
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #204]
	str	r3, [sp, #68]
	mov	r3, r6
	vldr.32	s2, [sp, #68]	@ int
	str	r1, [sp, #52]
	vmov	s0, r1	@ int
	str	r2, [sp, #64]
	mov	r1, r7
	str	r0, [sp, #56]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #20]	@ float
	add	ip, sp, #208
	vstr.32	s15, [fp]
	vstr.32	s15, [r2]
	ldr	r2, [sp, #8]
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, [sp, #40]
	movs	r3, #0
	mov	r8, r3
	mov	r0, r3
	mov	r1, r3
	bfi	r3, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r3, r2, #16, #16
	ldrh	r2, [sp, #212]
	str	r3, [sp, #72]
	vmov	s0, r3	@ int
	mov	r3, r6
	bfi	r8, r2, #0, #16
	ldrh	r2, [sp, #214]
	bfi	r8, r2, #16, #16
	ldr	r2, [sp, #36]
	vmov	s1, r8	@ int
	bfi	r0, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r0, r2, #16, #16
	ldrh	r2, [sp, #220]
	str	r0, [sp, #20]
	vmov	s2, r0	@ int
	mov	r0, r4
	bfi	r1, r2, #0, #16
	ldrh	r2, [sp, #222]
	bfi	r1, r2, #16, #16
	mov	r2, r5
	vmov	s14, r1	@ int
	vmov	s3, r1	@ int
	mov	r1, r7
	bl	g2(PLT)
	mov	r0, r4
	mov	r2, r6
	mov	r1, r5
	bl	diagonalize(PLT)
	ldr	r3, [sp, #32]
	movs	r2, #0
	ldr	r1, [sp, #60]
	mov	ip, r2
	mov	r10, r2
	mov	lr, r2
	bfi	r2, r3, #0, #16
	asrs	r3, r3, #16
	bfi	r10, r1, #0, #16
	asrs	r1, r1, #16
	bfi	lr, r9, #0, #16
	bfi	r2, r3, #16, #16
	ldr	r3, [sp, #24]
	bfi	r10, r1, #16, #16
	asr	r9, r9, #16
	strd	r2, r10, [sp, #32]
	mov	r1, r7
	bfi	ip, r3, #0, #16
	asrs	r3, r3, #16
	bfi	lr, r9, #16, #16
	vldr.32	s1, [sp, #36]	@ int
	vmov	s2, lr	@ int
	bfi	ip, r3, #16, #16
	vmov	s0, r2	@ int
	vmov	s3, ip	@ int
	mov	r3, r6
	mov	r2, r5
	vmov	s15, lr	@ int
	mov	r10, ip
	bl	g1(PLT)
	ldr	r3, [sp, #48]
	str	r3, [sp, #24]
	mov	r2, r5
	ldr	r3, [sp, #28]
	mov	r1, r7
	str	r3, [sp, #40]
	mov	r0, r4
	ldr	r3, [sp, #16]
	str	r3, [sp, #60]
	ldr	r3, [sp, #44]
	vldr.32	s0, [sp, #24]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #40]	@ int
	vldr.32	s2, [sp, #60]	@ int
	str	r3, [sp, #76]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #68]	@ float
	add	ip, sp, #224
	str	r3, [fp]	@ float
	ldr	r3, [sp, #64]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #8]
	str	r8, [r3]	@ float
	ldr	r3, [sp, #12]
	vstr.32	s14, [r3]
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #236]
	str	r3, [sp, #68]
	mov	r3, r6
	vldr.32	s2, [sp, #68]	@ int
	str	r1, [sp, #40]
	vmov	s0, r1	@ int
	str	r2, [sp, #64]
	mov	r1, r7
	str	r0, [sp, #60]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #44]	@ float
	add	ip, sp, #240
	vstr.32	s15, [fp]
	vstr.32	s15, [r2]
	ldr	r2, [sp, #8]
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, [sp, #56]
	movs	r3, #0
	mov	r9, r3
	mov	r0, r3
	mov	r1, r3
	bfi	r3, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r3, r2, #16, #16
	ldrh	r2, [sp, #244]
	str	r3, [sp, #56]
	vmov	s0, r3	@ int
	mov	r3, r6
	bfi	r9, r2, #0, #16
	ldrh	r2, [sp, #246]
	bfi	r9, r2, #16, #16
	ldr	r2, [sp, #52]
	vmov	s1, r9	@ int
	bfi	r0, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r0, r2, #16, #16
	ldrh	r2, [sp, #252]
	str	r0, [sp, #24]
	vmov	s2, r0	@ int
	mov	r0, r4
	bfi	r1, r2, #0, #16
	ldrh	r2, [sp, #254]
	bfi	r1, r2, #16, #16
	mov	r2, r5
	vmov	s14, r1	@ int
	vmov	s3, r1	@ int
	mov	r1, r7
	bl	g2(PLT)
	mov	r0, r4
	mov	r2, r6
	mov	r1, r5
	bl	diagonalize(PLT)
	ldr	r3, [sp, #48]
	movs	r2, #0
	ldr	r1, [sp, #72]
	mov	ip, r2
	mov	r8, r2
	mov	lr, r2
	bfi	r2, r3, #0, #16
	asrs	r3, r3, #16
	bfi	r8, r1, #0, #16
	asrs	r1, r1, #16
	bfi	lr, r10, #0, #16
	bfi	r2, r3, #16, #16
	ldr	r3, [sp, #28]
	asr	r10, r10, #16
	bfi	r8, r1, #16, #16
	str	r8, [sp, #44]
	mov	r1, r7
	bfi	ip, r3, #0, #16
	asrs	r3, r3, #16
	bfi	lr, r10, #16, #16
	vldr.32	s1, [sp, #44]	@ int
	vmov	s2, lr	@ int
	bfi	ip, r3, #16, #16
	str	r2, [sp, #28]
	vmov	s3, ip	@ int
	mov	r3, r6
	vmov	s0, r2	@ int
	mov	r2, r5
	vmov	s15, lr	@ int
	mov	r8, ip
	bl	g1(PLT)
	ldr	r3, [sp, #36]
	mov	r2, r5
	str	r3, [sp, #48]
	mov	r1, r7
	ldr	r3, [sp, #16]
	mov	r0, r4
	str	r3, [sp, #52]
	ldr	r3, [sp, #20]
	str	r3, [sp, #72]
	ldr	r3, [sp, #32]
	vldr.32	s0, [sp, #48]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #52]	@ int
	vldr.32	s2, [sp, #72]	@ int
	str	r3, [sp, #76]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #68]	@ float
	add	ip, sp, #256
	str	r3, [fp]	@ float
	ldr	r3, [sp, #64]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #8]
	str	r9, [r3]	@ float
	ldr	r3, [sp, #12]
	vstr.32	s14, [r3]
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #268]
	str	r3, [sp, #68]
	mov	r3, r6
	vldr.32	s2, [sp, #68]	@ int
	str	r1, [sp, #48]
	vmov	s0, r1	@ int
	str	r2, [sp, #64]
	mov	r1, r7
	str	r0, [sp, #52]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #32]	@ float
	add	ip, sp, #272
	vstr.32	s15, [fp]
	vstr.32	s15, [r2]
	ldr	r2, [sp, #8]
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, [sp, #60]
	movs	r3, #0
	mov	r9, r3
	mov	r0, r3
	mov	r1, r3
	bfi	r3, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r3, r2, #16, #16
	ldrh	r2, [sp, #276]
	str	r3, [sp, #60]
	vmov	s0, r3	@ int
	mov	r3, r6
	bfi	r9, r2, #0, #16
	ldrh	r2, [sp, #278]
	bfi	r9, r2, #16, #16
	ldr	r2, [sp, #40]
	vmov	s1, r9	@ int
	bfi	r0, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r0, r2, #16, #16
	ldrh	r2, [sp, #284]
	str	r0, [sp, #32]
	vmov	s2, r0	@ int
	mov	r0, r4
	bfi	r1, r2, #0, #16
	ldrh	r2, [sp, #286]
	bfi	r1, r2, #16, #16
	mov	r2, r5
	vmov	s14, r1	@ int
	vmov	s3, r1	@ int
	mov	r1, r7
	bl	g2(PLT)
	mov	r0, r4
	mov	r2, r6
	mov	r1, r5
	bl	diagonalize(PLT)
	ldr	r3, [sp, #36]
	movs	r2, #0
	ldr	r1, [sp, #56]
	mov	ip, r2
	mov	r10, r2
	mov	lr, r2
	bfi	r2, r3, #0, #16
	asrs	r3, r3, #16
	bfi	r10, r1, #0, #16
	bfi	lr, r8, #0, #16
	asrs	r1, r1, #16
	bfi	r2, r3, #16, #16
	ldr	r3, [sp, #16]
	asr	r8, r8, #16
	bfi	r10, r1, #16, #16
	str	r2, [sp, #16]
	mov	r1, r7
	bfi	ip, r3, #0, #16
	asrs	r3, r3, #16
	bfi	lr, r8, #16, #16
	vmov	s0, r2	@ int
	vmov	s2, lr	@ int
	bfi	ip, r3, #16, #16
	mov	r2, r5
	vmov	s3, ip	@ int
	mov	r3, r6
	vmov	s1, r10	@ int
	vmov	s15, lr	@ int
	mov	r8, ip
	str	r10, [sp, #36]
	bl	g1(PLT)
	ldr	r3, [sp, #44]
	mov	r2, r5
	str	r3, [sp, #40]
	mov	r1, r7
	ldr	r3, [sp, #20]
	mov	r0, r4
	str	r3, [sp, #56]
	ldr	r3, [sp, #24]
	str	r3, [sp, #72]
	ldr	r3, [sp, #28]
	vldr.32	s0, [sp, #40]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #56]	@ int
	vldr.32	s2, [sp, #72]	@ int
	str	r3, [sp, #76]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #68]	@ float
	add	ip, sp, #288
	str	r3, [fp]	@ float
	ldr	r3, [sp, #64]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #8]
	str	r9, [r3]	@ float
	ldr	r3, [sp, #12]
	vstr.32	s14, [r3]
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #300]
	str	r3, [sp, #68]
	mov	r3, r6
	vldr.32	s2, [sp, #68]	@ int
	str	r1, [sp, #40]
	vmov	s0, r1	@ int
	str	r2, [sp, #64]
	mov	r1, r7
	str	r0, [sp, #56]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #28]	@ float
	add	ip, sp, #304
	vstr.32	s15, [fp]
	vstr.32	s15, [r2]
	ldr	r2, [sp, #8]
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, [sp, #52]
	movs	r3, #0
	mov	r9, r3
	mov	r0, r3
	mov	r1, r3
	bfi	r3, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r3, r2, #16, #16
	ldrh	r2, [sp, #308]
	str	r3, [sp, #28]
	vmov	s0, r3	@ int
	mov	r3, r6
	bfi	r9, r2, #0, #16
	ldrh	r2, [sp, #310]
	bfi	r9, r2, #16, #16
	ldr	r2, [sp, #48]
	vmov	s1, r9	@ int
	bfi	r0, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r0, r2, #16, #16
	ldrh	r2, [sp, #316]
	str	r0, [sp, #48]
	vmov	s2, r0	@ int
	mov	r0, r4
	bfi	r1, r2, #0, #16
	ldrh	r2, [sp, #318]
	bfi	r1, r2, #16, #16
	mov	r2, r5
	vmov	s14, r1	@ int
	vmov	s3, r1	@ int
	mov	r1, r7
	bl	g2(PLT)
	mov	r0, r4
	mov	r2, r6
	mov	r1, r5
	bl	diagonalize(PLT)
	ldr	r3, [sp, #44]
	movs	r2, #0
	ldr	r1, [sp, #60]
	mov	ip, r2
	mov	r10, r2
	mov	lr, r2
	bfi	r2, r3, #0, #16
	asrs	r3, r3, #16
	bfi	r10, r1, #0, #16
	bfi	lr, r8, #0, #16
	asrs	r1, r1, #16
	bfi	r2, r3, #16, #16
	ldr	r3, [sp, #20]
	asr	r8, r8, #16
	bfi	r10, r1, #16, #16
	str	r2, [sp, #20]
	mov	r1, r7
	bfi	ip, r3, #0, #16
	asrs	r3, r3, #16
	bfi	lr, r8, #16, #16
	vmov	s0, r2	@ int
	vmov	s2, lr	@ int
	bfi	ip, r3, #16, #16
	mov	r2, r5
	vmov	s3, ip	@ int
	mov	r3, r6
	vmov	s1, r10	@ int
	vmov	s15, lr	@ int
	mov	r8, ip
	str	r10, [sp, #44]
	bl	g1(PLT)
	ldr	r3, [sp, #36]
	mov	r2, r5
	str	r3, [sp, #52]
	mov	r1, r7
	ldr	r3, [sp, #24]
	mov	r0, r4
	str	r3, [sp, #60]
	ldr	r3, [sp, #32]
	str	r3, [sp, #72]
	ldr	r3, [sp, #16]
	vldr.32	s0, [sp, #52]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #60]	@ int
	vldr.32	s2, [sp, #72]	@ int
	str	r3, [sp, #76]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #68]	@ float
	add	ip, sp, #320
	str	r3, [fp]	@ float
	ldr	r3, [sp, #64]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #8]
	str	r9, [r3]	@ float
	ldr	r3, [sp, #12]
	vstr.32	s14, [r3]
	ldm	fp, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	vmov	s0, r1	@ int
	vmov	s1, r2	@ int
	mov	r1, r7
	mov	r2, r5
	vmov	s2, r3	@ int
	vmov	s3, r0	@ int
	mov	r3, r6
	mov	r0, r4
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]	@ float
	add	ip, sp, #352
	vstr.32	s15, [fp]
	vstr.32	s15, [r2]
	ldr	r2, [sp, #8]
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldm	fp, {r0, r1, r2, r3}
	stmdb	ip, {r0, r1, r2, r3}
	ldr	r2, [sp, #56]
	movs	r3, #0
	mov	ip, r3
	mov	r0, r3
	asr	fp, r2, #16
	mov	r1, r3
	bfi	r3, r2, #0, #16
	ldrh	r2, [sp, #340]
	bfi	r3, fp, #16, #16
	vmov	s0, r3	@ int
	bfi	ip, r2, #0, #16
	ldrh	r2, [sp, #342]
	bfi	ip, r2, #16, #16
	ldr	r2, [sp, #40]
	strd	r3, ip, [sp, #4]
	vmov	s1, ip	@ int
	mov	r3, r6
	bfi	r0, r2, #0, #16
	asrs	r2, r2, #16
	bfi	r0, r2, #16, #16
	ldrh	r2, [sp, #348]
	vmov	s2, r0	@ int
	bfi	r1, r2, #0, #16
	ldrh	r2, [sp, #350]
	bfi	r1, r2, #16, #16
	mov	r2, r5
	strd	r0, r1, [sp, #12]
	vmov	s3, r1	@ int
	mov	r0, r4
	mov	r1, r7
	bl	g2(PLT)
	mov	r0, r4
	mov	r2, r6
	mov	r1, r5
	bl	diagonalize(PLT)
	ldr	r3, [sp, #36]
	movs	r2, #0
	ldr	r1, [sp, #28]
	mov	ip, r2
	mov	r9, r2
	mov	lr, r2
	bfi	r2, r3, #0, #16
	asrs	r3, r3, #16
	bfi	r9, r1, #0, #16
	bfi	lr, r8, #0, #16
	asrs	r1, r1, #16
	bfi	r2, r3, #16, #16
	ldr	r3, [sp, #24]
	asr	r8, r8, #16
	bfi	r9, r1, #16, #16
	vmov	s0, r2	@ int
	mov	r1, r7
	bfi	ip, r3, #0, #16
	asrs	r3, r3, #16
	bfi	lr, r8, #16, #16
	strd	r2, r9, [sp, #4]
	bfi	ip, r3, #16, #16
	vmov	s2, lr	@ int
	vmov	s3, ip	@ int
	mov	r3, r6
	mov	r2, r5
	vmov	s1, r9	@ int
	strd	lr, ip, [sp, #12]
	bl	g1(PLT)
	ldr	r3, [sp, #44]
	mov	r2, r5
	str	r3, [sp, #4]
	mov	r1, r7
	ldr	r3, [sp, #32]
	mov	r0, r4
	str	r3, [sp, #8]
	ldr	r3, [sp, #48]
	str	r3, [sp, #12]
	ldr	r3, [sp, #20]
	str	r3, [sp, #16]
	vmov	s3, r3	@ int
	vldr.32	s0, [sp, #4]	@ int
	mov	r3, r6
	vldr.32	s1, [sp, #8]	@ int
	vldr.32	s2, [sp, #12]	@ int
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #356
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	undiagonalize(PLT)
	.size	compress_pre, .-compress_pre
	.align	1
	.global	_blake3_compress_in_place_sse41
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_blake3_compress_in_place_sse41, %function
_blake3_compress_in_place_sse41:
	@ args = 12, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r3, r2
	mov	r5, r0
	sub	sp, sp, #84
	add	r4, sp, #16
	ldrb	r2, [sp, #112]	@ zero_extendqisi2
	ldrd	r6, [sp, #104]
	str	r2, [sp, #8]
	strd	r6, [sp]
	mov	r2, r1
	mov	r1, r0
	mov	r0, r4
	bl	compress_pre(PLT)
	ldr	r1, [sp, #28]
	ldrd	r7, r6, [sp, #20]
	ldrd	r4, r0, [sp, #52]
	ldr	ip, [sp, #60]
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #48]
	eors	r3, r3, r2
	vmov	s0, r3	@ int
	eor	r3, r7, r4
	vmov	s1, r3	@ int
	eor	r3, r6, r0
	mov	r0, r5
	vmov	s2, r3	@ int
	eor	r3, r1, ip
	vmov	s3, r3	@ int
	bl	storeu(PLT)
	ldr	ip, [sp, #44]
	ldrd	r6, r0, [sp, #36]
	ldrd	r7, r4, [sp, #68]
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #64]
	eors	r3, r3, r2
	vmov	s0, r3	@ int
	eor	r3, r7, r6
	vmov	s1, r3	@ int
	eor	r3, r4, r0
	add	r0, r5, #16
	vmov	s2, r3	@ int
	eor	r3, r1, ip
	vmov	s3, r3	@ int
	bl	storeu(PLT)
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
	.size	_blake3_compress_in_place_sse41, .-_blake3_compress_in_place_sse41
	.align	1
	.global	_blake3_compress_xof_sse41
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_blake3_compress_xof_sse41, %function
_blake3_compress_xof_sse41:
	@ args = 16, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, r2
	mov	r4, r0
	sub	sp, sp, #80
	add	r5, sp, #16
	ldrb	r2, [sp, #120]	@ zero_extendqisi2
	ldrd	r8, [sp, #112]
	str	r2, [sp, #8]
	strd	r8, [sp]
	mov	r2, r1
	mov	r1, r0
	mov	r0, r5
	ldr	r10, [sp, #124]
	bl	compress_pre(PLT)
	ldrd	r0, r1, [sp, #52]
	ldrd	r2, r7, [sp, #20]
	ldr	r6, [sp, #16]
	ldr	r3, [sp, #28]
	eors	r2, r2, r0
	ldr	r5, [sp, #48]
	vmov	s1, r2	@ int
	eor	r2, r7, r1
	vmov	s2, r2	@ int
	ldr	r2, [sp, #60]
	eors	r5, r5, r6
	mov	r0, r10
	vmov	s0, r5	@ int
	eors	r3, r3, r2
	vmov	s3, r3	@ int
	bl	storeu(PLT)
	ldr	r0, [sp, #68]
	ldrd	r1, r2, [sp, #36]
	ldr	r7, [sp, #64]
	eors	r1, r1, r0
	vmov	s1, r1	@ int
	ldr	r1, [sp, #72]
	add	r0, r10, #16
	ldr	r3, [sp, #44]
	eors	r2, r2, r1
	ldr	r6, [sp, #32]
	vmov	s2, r2	@ int
	ldr	r2, [sp, #76]
	eors	r6, r6, r7
	vmov	s0, r6	@ int
	eors	r3, r3, r2
	vmov	s3, r3	@ int
	bl	storeu(PLT)
	ldr	r1, [sp, #60]
	ldrd	r3, r7, [sp, #52]
	ldr	ip, [r4, #4]	@ unaligned
	ldr	r0, [r4, #8]	@ unaligned
	ldr	r2, [r4, #12]	@ unaligned
	eor	r3, r3, ip
	ldr	r8, [r4]	@ unaligned
	vmov	s1, r3	@ int
	ldr	r6, [sp, #48]
	eor	r3, r7, r0
	add	r0, r10, #32
	vmov	s2, r3	@ int
	eor	r6, r6, r8
	eor	r3, r1, r2
	vmov	s0, r6	@ int
	vmov	s3, r3	@ int
	bl	storeu(PLT)
	ldr	r2, [sp, #76]
	ldrd	r7, r0, [sp, #68]
	ldr	lr, [r4, #16]	@ unaligned
	ldr	ip, [r4, #20]	@ unaligned
	ldr	r5, [r4, #24]	@ unaligned
	ldr	r1, [r4, #28]	@ unaligned
	ldr	r3, [sp, #64]
	eor	r3, lr, r3
	vmov	s0, r3	@ int
	eor	r3, ip, r7
	vmov	s1, r3	@ int
	eor	r3, r5, r0
	add	r0, r10, #48
	vmov	s2, r3	@ int
	eor	r3, r1, r2
	vmov	s3, r3	@ int
	bl	storeu(PLT)
	add	sp, sp, #80
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
	.size	_blake3_compress_xof_sse41, .-_blake3_compress_xof_sse41
	.align	1
	.global	round_fn
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	round_fn, %function
round_fn:
	@ args = 0, pretend = 0, frame = 240
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r5, .L32
	sub	sp, sp, #244
.LPIC0:
	add	r5, pc
	str	r2, [sp, #40]
	str	r1, [sp]
	ldr	r1, [sp, #40]
	ldrd	r2, r3, [r0, #4]
	str	r3, [sp, #4]
	lsls	r6, r1, #4
	add	r1, r5, r1, lsl #4
	str	r1, [sp, #36]
	ldr	r1, [sp]
	ldrb	r5, [r5, r6]	@ zero_extendqisi2
	ldr	r0, [r0, #12]
	ldr	r3, [r4]
	lsls	r6, r5, #4
	add	r5, r1, r5, lsl #4
	ldr	r1, [r1, r6]
	ldrd	r7, r6, [r5, #4]
	add	r1, r1, r3
	ldr	r5, [r5, #12]
	adds	r3, r2, r7
	str	r3, [sp, #12]
	add	ip, r5, r0
	ldr	r0, [sp, #36]
	ldr	r3, [sp, #4]
	add	r7, r4, #16
	str	r1, [r4]
	ldrb	r8, [r0, #2]	@ zero_extendqisi2
	add	r3, r3, r6
	ldr	r0, [sp]
	str	r3, [sp, #4]
	ldr	r3, [sp, #12]
	lsl	lr, r8, #4
	str	r3, [r4, #4]
	add	r8, r0, r8, lsl #4
	ldr	r3, [sp, #4]
	strd	r3, ip, [r4, #8]
	ldrd	r6, r5, [r8, #4]
	ldr	lr, [r0, lr]
	ldr	r0, [r8, #12]
	ldr	r3, [r4, #16]
	add	lr, lr, r3
	ldr	r3, [r7, #4]
	add	r3, r3, r6
	str	r3, [sp, #16]
	ldr	r3, [r7, #8]
	add	r6, r4, #32
	add	r5, r5, r3
	ldr	r3, [r7, #12]
	str	lr, [r4, #16]
	add	r3, r3, r0
	str	r3, [sp, #20]
	ldr	r3, [sp, #16]
	strd	r3, r5, [r7, #4]
	ldr	r3, [sp, #20]
	str	r3, [r7, #12]
	ldr	r3, [sp, #36]
	ldrb	r8, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [sp]
	lsl	r9, r8, #4
	add	r8, r3, r8, lsl #4
	ldr	fp, [r3, r9]
	ldr	r3, [r4, #32]
	ldrd	r10, r9, [r8, #4]
	add	fp, fp, r3
	ldr	r3, [r6, #4]
	ldr	r0, [r8, #12]
	add	r10, r10, r3
	ldr	r3, [r6, #8]
	add	r9, r9, r3
	ldr	r3, [r6, #12]
	str	fp, [r4, #32]
	add	r8, r3, r0
	strd	r10, r9, [r6, #4]
	str	r8, [r6, #12]
	add	r3, r4, #48
	str	r3, [sp, #8]
	ldr	r3, [r4, #48]
	str	r3, [sp, #60]
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	str	r3, [sp, #64]
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	str	r3, [sp, #68]
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	str	r3, [sp, #72]
	ldr	r3, [sp, #36]
	ldrb	r0, [r3, #6]	@ zero_extendqisi2
	lsls	r3, r0, #4
	str	r3, [sp, #24]
	ldr	r3, [sp]
	mov	r2, r3
	add	r0, r3, r0, lsl #4
	ldr	r3, [sp, #24]
	ldr	r3, [r2, r3]
	str	r3, [sp, #76]
	ldr	r3, [r0, #4]
	str	r3, [sp, #80]
	ldr	r3, [r0, #8]
	str	r3, [sp, #84]
	ldr	r3, [r0, #12]
	str	r3, [sp, #88]
	add	r3, r4, #64
	str	r3, [sp, #28]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #8]
	mov	r0, r3
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #12]
	str	r3, [sp, #24]
	ldr	r3, [r4, #64]
	add	r1, r1, r3
	mov	r3, r2
	ldr	r2, [sp, #12]
	add	r2, r2, r3
	mov	r3, r0
	ldr	r0, [sp, #4]
	add	r0, r0, r3
	ldr	r3, [sp, #24]
	str	r0, [sp, #4]
	add	ip, ip, r3
	strd	r1, r2, [r4]
	strd	r0, ip, [r4, #8]
	add	r0, r4, #80
	str	r0, [sp, #12]
	ldr	r0, [r0, #4]
	str	r0, [sp, #32]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #8]
	str	r0, [sp, #44]
	ldr	r0, [sp, #12]
	ldr	r3, [r0, #12]
	str	r3, [sp, #48]
	ldr	r3, [r4, #80]
	ldr	r0, [sp, #32]
	add	r3, lr, r3
	str	r3, [sp, #24]
	ldr	r3, [sp, #16]
	add	r3, r3, r0
	str	r3, [sp, #16]
	ldr	r3, [sp, #44]
	ldr	r0, [sp, #48]
	adds	r3, r5, r3
	str	r3, [sp, #44]
	ldr	r3, [sp, #20]
	add	r3, r3, r0
	str	r3, [sp, #20]
	ldr	r3, [sp, #24]
	str	r3, [r4, #16]
	ldr	r3, [sp, #16]
	str	r3, [r7, #4]
	ldr	r3, [sp, #44]
	str	r3, [r7, #8]
	ldr	r3, [sp, #20]
	str	r3, [r7, #12]
	add	r3, r4, #96
	str	r3, [sp, #32]
	ldr	r3, [r3, #4]
	str	r3, [sp, #52]
	ldr	r3, [sp, #32]
	ldrd	r5, r0, [r3, #8]
	ldr	r3, [r4, #96]
	add	r5, r5, r9
	add	r3, fp, r3
	str	r3, [sp, #48]
	ldr	r3, [sp, #52]
	add	fp, r4, #208
	add	r3, r10, r3
	str	r3, [sp, #52]
	add	r3, r8, r0
	str	r3, [sp, #56]
	ldr	r3, [sp, #48]
	add	r0, r4, #112
	str	r3, [r4, #32]
	ldr	r3, [sp, #52]
	strd	r3, r5, [r6, #4]
	ldr	r3, [sp, #56]
	str	r3, [r6, #12]
	ldr	r3, [sp, #60]
	str	r0, [sp, #116]
	mov	lr, r3
	ldr	r3, [sp, #76]
	add	r10, lr, r3
	ldr	r3, [r4, #112]
	add	r3, r10, r3
	str	r3, [sp, #60]
	ldr	r3, [sp, #64]
	mov	lr, r3
	ldr	r3, [sp, #80]
	add	r9, lr, r3
	ldr	r3, [r4, #116]
	add	r9, r9, r3
	ldr	r3, [sp, #68]
	mov	lr, r3
	ldr	r3, [sp, #84]
	add	r8, lr, r3
	ldr	r3, [r4, #120]
	add	r3, r8, r3
	str	r3, [sp, #64]
	ldr	r3, [sp, #72]
	add	r8, r4, #192
	mov	lr, r3
	ldr	r3, [sp, #88]
	add	lr, lr, r3
	ldr	r3, [r4, #124]
	add	lr, lr, r3
	ldr	r3, [sp, #60]
	str	r3, [r4, #48]
	ldr	r3, [sp, #8]
	mov	r0, r3
	str	r9, [r3, #4]
	ldr	r3, [sp, #64]
	str	lr, [r0, #12]
	str	r3, [r0, #8]
	ldr	r0, [sp, #4]
	ldr	r3, [r4, #192]
	eors	r1, r1, r3
	ldr	r3, [r8, #4]
	vmov	s0, r1	@ int
	eors	r2, r2, r3
	ldr	r3, [r8, #8]
	vmov	s1, r2	@ int
	eors	r0, r0, r3
	str	r0, [sp, #68]
	ldr	r0, [r8, #12]
	ldr	r3, [sp, #68]
	str	r1, [r4, #192]
	eor	ip, ip, r0
	str	r2, [r8, #4]
	vmov	s3, ip	@ int
	strd	r3, ip, [r8, #8]
	ldr	r0, [sp, #24]
	mov	r10, r0
	ldr	r0, [r4, #208]
	eor	r0, r10, r0
	mov	r3, r0
	ldr	r0, [sp, #16]
	mov	r10, r0
	ldr	r0, [fp, #4]
	eor	r0, r10, r0
	str	r0, [sp, #4]
	ldr	r0, [sp, #44]
	mov	r10, r0
	ldr	r0, [fp, #8]
	eor	r0, r10, r0
	str	r0, [sp, #16]
	ldr	r0, [sp, #20]
	mov	r10, r0
	ldr	r0, [fp, #12]
	str	r3, [r4, #208]
	eor	r10, r10, r0
	ldr	r0, [sp, #4]
	str	r0, [fp, #4]
	ldr	r0, [sp, #16]
	strd	r0, r10, [fp, #8]
	add	r10, r4, #224
	ldr	r0, [sp, #48]
	mov	r3, r0
	ldr	r0, [r4, #224]
	eors	r0, r0, r3
	str	r0, [sp, #4]
	ldr	r0, [sp, #52]
	mov	r3, r0
	ldr	r0, [r10, #4]
	eors	r0, r0, r3
	str	r0, [sp, #16]
	ldr	r0, [r10, #8]
	eors	r5, r5, r0
	ldr	r0, [sp, #56]
	mov	r3, r0
	ldr	r0, [r10, #12]
	eors	r0, r0, r3
	mov	r3, r0
	ldr	r0, [sp, #4]
	str	r0, [r4, #224]
	ldr	r0, [sp, #16]
	strd	r0, r5, [r10, #4]
	add	r0, r4, #240
	str	r3, [r10, #12]
	str	r0, [sp, #4]
	ldr	r0, [r0, #4]
	str	r0, [sp, #16]
	ldr	r0, [sp, #4]
	ldrd	r5, r0, [r0, #8]
	str	r0, [sp, #20]
	ldr	r0, [sp, #60]
	mov	r3, r0
	ldr	r0, [r4, #240]
	eors	r0, r0, r3
	mov	r3, r0
	ldr	r0, [sp, #16]
	str	r3, [r4, #240]
	eor	r9, r9, r0
	ldr	r0, [sp, #64]
	eors	r5, r5, r0
	ldr	r0, [sp, #20]
	eor	lr, lr, r0
	ldr	r0, [sp, #4]
	strd	r9, r5, [r0, #4]
	str	lr, [r0, #12]
	ldr	r3, [sp, #68]
	vmov	s2, r3	@ int
	strd	r1, r2, [sp, #16]
	str	ip, [sp, #44]
	str	r3, [sp, #24]
	bl	rot16(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #192]	@ int
	vstr.32	s2, [sp, #16]	@ int
	vstr.32	s1, [r8, #4]	@ int
	strd	r2, r3, [r8, #8]
	vstr.32	s3, [sp, #20]	@ int
	vldr.64	d1, [fp, #8]	@ int
	vldr.64	d0, [r4, #208]	@ int
	bl	rot16(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #208]	@ int
	vstr.32	s2, [sp, #16]	@ int
	vstr.32	s1, [fp, #4]	@ int
	strd	r2, r3, [fp, #8]
	vstr.32	s3, [sp, #20]	@ int
	vldr.64	d1, [r10, #8]	@ int
	vldr.64	d0, [r4, #224]	@ int
	bl	rot16(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #224]	@ int
	vstr.32	s2, [sp, #16]	@ int
	vstr.32	s1, [r10, #4]	@ int
	strd	r2, r3, [r10, #8]
	ldr	r3, [sp, #4]
	vldr.64	d0, [r4, #240]	@ int
	vstr.32	s3, [sp, #20]	@ int
	vldr.64	d1, [r3, #8]	@ int
	bl	rot16(PLT)
	ldr	r3, [sp, #4]
	vstr.32	s0, [r4, #240]	@ int
	vstr.32	s1, [r3, #4]	@ int
	vstr.32	s2, [r3, #8]	@ int
	vstr.32	s3, [r3, #12]	@ int
	add	r3, r4, #128
	ldr	r0, [r4, #192]
	str	r0, [sp, #156]
	ldr	r0, [r8, #4]
	str	r0, [sp, #160]
	ldr	r0, [r8, #8]
	str	r0, [sp, #164]
	ldr	r0, [r8, #12]
	ldr	r5, [r4, #128]
	str	r0, [sp, #168]
	ldr	r0, [sp, #156]
	ldrd	r1, r2, [r3, #4]
	add	r0, r0, r5
	str	r0, [sp, #60]
	ldr	r0, [sp, #160]
	str	r3, [sp, #16]
	adds	r1, r0, r1
	str	r1, [sp, #64]
	ldr	r1, [sp, #164]
	ldr	r3, [r3, #12]
	adds	r2, r1, r2
	str	r2, [sp, #68]
	ldr	r2, [sp, #168]
	adds	r3, r2, r3
	str	r3, [sp, #72]
	ldr	r3, [sp, #60]
	str	r3, [r4, #128]
	ldr	r3, [sp, #16]
	mov	r2, r3
	ldr	r3, [sp, #64]
	str	r3, [r2, #4]
	ldr	r3, [sp, #68]
	str	r3, [r2, #8]
	ldr	r3, [sp, #72]
	str	r3, [r2, #12]
	add	r3, r4, #144
	str	r3, [sp, #20]
	ldr	r0, [r4, #208]
	str	r0, [sp, #172]
	ldr	r0, [fp, #4]
	ldr	r2, [sp, #20]
	str	r0, [sp, #176]
	ldr	r0, [fp, #8]
	str	r0, [sp, #180]
	ldr	r0, [fp, #12]
	ldr	r3, [r4, #144]
	str	r0, [sp, #184]
	ldr	r0, [sp, #172]
	ldrd	r5, r1, [r2, #4]
	adds	r3, r0, r3
	str	r3, [sp, #76]
	ldr	r3, [sp, #176]
	ldr	r2, [r2, #12]
	add	r3, r3, r5
	str	r3, [sp, #80]
	ldr	r3, [sp, #180]
	add	r5, r4, #160
	add	r3, r3, r1
	str	r3, [sp, #84]
	ldr	r3, [sp, #184]
	add	r3, r3, r2
	str	r3, [sp, #88]
	ldr	r3, [sp, #76]
	str	r3, [r4, #144]
	ldr	r3, [sp, #20]
	mov	r2, r3
	ldr	r3, [sp, #80]
	str	r3, [r2, #4]
	ldr	r3, [sp, #84]
	str	r3, [r2, #8]
	ldr	r3, [sp, #88]
	str	r3, [r2, #12]
	ldr	r0, [r4, #224]
	str	r0, [sp, #188]
	ldr	r0, [r10, #4]
	str	r0, [sp, #192]
	ldr	r0, [r10, #8]
	str	r0, [sp, #196]
	ldr	r0, [r10, #12]
	str	r0, [sp, #200]
	ldr	r0, [sp, #188]
	ldrd	r1, r2, [r5, #4]
	mov	ip, r0
	ldr	r0, [r4, #160]
	ldr	r3, [r5, #12]
	add	lr, ip, r0
	ldr	r0, [sp, #192]
	str	lr, [r4, #160]
	adds	r1, r0, r1
	str	r1, [sp, #92]
	ldr	r1, [sp, #196]
	add	r9, r1, r2
	ldr	r2, [sp, #200]
	adds	r3, r2, r3
	str	r3, [sp, #96]
	ldr	r3, [sp, #92]
	strd	r3, r9, [r5, #4]
	ldr	r3, [sp, #96]
	str	r3, [r5, #12]
	add	r3, r4, #176
	str	r3, [sp, #24]
	ldr	r0, [sp, #24]
	ldr	r1, [r4, #176]
	ldrd	r2, r3, [r3, #4]
	ldr	r0, [r0, #12]
	str	r0, [sp, #104]
	vmov	r0, s0	@ int
	add	r1, r1, r0
	vmov	r0, s1	@ int
	add	r2, r2, r0
	vmov	r0, s2	@ int
	add	r3, r3, r0
	str	r3, [sp, #100]
	ldr	r0, [sp, #104]
	str	r1, [r4, #176]
	mov	ip, r0
	vmov	r0, s3	@ int
	add	ip, ip, r0
	ldr	r0, [sp, #24]
	strd	r2, r3, [r0, #4]
	str	ip, [r0, #12]
	ldr	r0, [sp, #28]
	ldr	r0, [r0, #4]
	str	r0, [sp, #104]
	ldr	r0, [sp, #28]
	ldr	r0, [r0, #8]
	str	r0, [sp, #108]
	ldr	r0, [sp, #28]
	ldr	r0, [r0, #12]
	str	r0, [sp, #112]
	ldr	r0, [sp, #60]
	mov	r3, r0
	ldr	r0, [r4, #64]
	eors	r0, r0, r3
	str	r0, [sp, #60]
	ldr	r0, [sp, #64]
	mov	r3, r0
	ldr	r0, [sp, #104]
	eors	r0, r0, r3
	str	r0, [sp, #64]
	ldr	r0, [sp, #68]
	mov	r3, r0
	ldr	r0, [sp, #108]
	eors	r0, r0, r3
	str	r0, [sp, #68]
	ldr	r0, [sp, #72]
	mov	r3, r0
	ldr	r0, [sp, #112]
	eors	r0, r0, r3
	str	r0, [sp, #72]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #4]
	str	r0, [sp, #104]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #8]
	str	r0, [sp, #108]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #12]
	str	r0, [sp, #112]
	ldr	r0, [sp, #76]
	mov	r3, r0
	ldr	r0, [r4, #80]
	eors	r0, r0, r3
	str	r0, [sp, #76]
	ldr	r0, [sp, #80]
	mov	r3, r0
	ldr	r0, [sp, #104]
	eors	r0, r0, r3
	str	r0, [sp, #80]
	ldr	r0, [sp, #84]
	mov	r3, r0
	ldr	r0, [sp, #108]
	eors	r0, r0, r3
	str	r0, [sp, #84]
	ldr	r0, [sp, #88]
	mov	r3, r0
	ldr	r0, [sp, #112]
	eors	r0, r0, r3
	str	r0, [sp, #88]
	ldr	r0, [sp, #32]
	ldr	r0, [r0, #4]
	str	r0, [sp, #104]
	ldr	r0, [sp, #32]
	ldr	r0, [r0, #8]
	str	r0, [sp, #108]
	ldr	r0, [sp, #32]
	ldr	r0, [r0, #12]
	str	r0, [sp, #112]
	ldr	r0, [r4, #96]
	eor	lr, lr, r0
	ldr	r0, [sp, #92]
	mov	r3, r0
	ldr	r0, [sp, #104]
	eors	r0, r0, r3
	str	r0, [sp, #104]
	ldr	r0, [sp, #108]
	eor	r9, r9, r0
	ldr	r0, [sp, #96]
	mov	r3, r0
	ldr	r0, [sp, #112]
	eors	r0, r0, r3
	str	r0, [sp, #108]
	ldr	r0, [r4, #112]
	eor	r3, r1, r0
	ldr	r0, [sp, #116]
	str	r3, [sp, #112]
	ldr	r3, [sp, #100]
	ldr	r1, [r0, #4]
	eors	r2, r2, r1
	ldr	r1, [r0, #8]
	eors	r3, r3, r1
	ldr	r1, [r0, #12]
	str	r3, [sp, #116]
	ror	r2, r2, #12
	eor	ip, ip, r1
	ldr	r1, [sp, #60]
	ror	r1, r1, #12
	str	r1, [sp, #60]
	ldr	r1, [sp, #64]
	ror	r1, r1, #12
	str	r1, [sp, #64]
	ldr	r1, [sp, #68]
	ror	r1, r1, #12
	str	r1, [sp, #68]
	ldr	r1, [sp, #72]
	ror	r1, r1, #12
	str	r1, [sp, #72]
	ldr	r1, [sp, #60]
	str	r1, [r4, #64]
	ldr	r1, [sp, #28]
	mov	r3, r1
	ldr	r1, [sp, #64]
	str	r1, [r3, #4]
	ldr	r1, [sp, #68]
	str	r1, [r3, #8]
	ldr	r1, [sp, #72]
	str	r1, [r3, #12]
	ldr	r1, [sp, #76]
	ror	r1, r1, #12
	str	r1, [sp, #76]
	ldr	r1, [sp, #80]
	ror	r1, r1, #12
	str	r1, [sp, #80]
	ldr	r1, [sp, #84]
	ror	r1, r1, #12
	str	r1, [sp, #84]
	ldr	r1, [sp, #88]
	ror	r1, r1, #12
	str	r1, [sp, #88]
	ldr	r1, [sp, #76]
	str	r1, [r4, #80]
	ldr	r1, [sp, #12]
	mov	r3, r1
	ldr	r1, [sp, #80]
	str	r1, [r3, #4]
	ldr	r1, [sp, #84]
	str	r1, [r3, #8]
	ldr	r1, [sp, #88]
	str	r1, [r3, #12]
	ror	r1, lr, #12
	str	r1, [sp, #92]
	ldr	r1, [sp, #104]
	ror	r1, r1, #12
	str	r1, [sp, #96]
	ror	r1, r9, #12
	str	r1, [sp, #100]
	ldr	r1, [sp, #108]
	ror	r1, r1, #12
	str	r1, [sp, #104]
	ldr	r1, [sp, #92]
	str	r1, [r4, #96]
	ldr	r1, [sp, #32]
	mov	r3, r1
	ldr	r1, [sp, #96]
	str	r1, [r3, #4]
	ldr	r1, [sp, #100]
	str	r1, [r3, #8]
	ldr	r1, [sp, #104]
	str	r1, [r3, #12]
	ldr	r3, [sp, #112]
	str	r2, [sp, #112]
	ror	r1, r3, #12
	ldr	r3, [sp, #116]
	str	r1, [r4, #112]
	str	r1, [sp, #108]
	ror	r3, r3, #12
	str	r3, [sp, #116]
	str	r2, [r0, #4]
	ror	r3, ip, #12
	str	r3, [sp, #120]
	ldr	r3, [sp, #116]
	str	r3, [r0, #8]
	ldr	r3, [sp, #120]
	str	r3, [r0, #12]
	ldr	r3, [sp, #36]
	ldr	r1, [sp]
	str	r0, [sp, #236]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	ldr	r0, [r4]
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	ip, [r1, r2]
	ldrd	r1, r2, [r3, #4]
	add	r0, r0, ip
	str	r0, [sp, #124]
	ldr	r0, [r4, #4]
	ldr	r3, [r3, #12]
	add	lr, r0, r1
	ldr	r1, [r4, #8]
	adds	r2, r1, r2
	str	r2, [sp, #128]
	ldr	r2, [r4, #12]
	adds	r3, r2, r3
	str	r3, [sp, #132]
	ldr	r3, [sp, #124]
	strd	r3, lr, [r4]
	ldr	r3, [sp, #128]
	str	r3, [r4, #8]
	ldr	r3, [sp, #132]
	str	r3, [r4, #12]
	ldr	r3, [sp, #36]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	ldr	r3, [sp]
	lsls	r1, r2, #4
	add	r2, r3, r2, lsl #4
	ldr	r3, [r3, r1]
	ldrd	ip, r1, [r2, #4]
	ldr	r2, [r2, #12]
	ldr	r0, [r4, #16]
	add	r3, r3, r0
	ldr	r0, [r7, #4]
	add	r0, r0, ip
	str	r0, [sp, #136]
	ldr	r0, [r7, #8]
	add	r9, r0, r1
	ldr	r1, [r7, #12]
	str	r3, [r4, #16]
	adds	r2, r1, r2
	str	r2, [sp, #140]
	ldr	r2, [sp, #136]
	strd	r2, r9, [r7, #4]
	ldr	r2, [sp, #140]
	str	r2, [r7, #12]
	ldr	r2, [sp, #36]
	ldrb	r1, [r2, #5]	@ zero_extendqisi2
	ldr	r2, [sp]
	lsl	ip, r1, #4
	add	r1, r2, r1, lsl #4
	ldr	r2, [r2, ip]
	ldr	r0, [r1, #4]
	str	r0, [sp, #148]
	ldr	r0, [r4, #32]
	ldrd	ip, r1, [r1, #8]
	add	r0, r0, r2
	ldr	r2, [r6, #4]
	str	r0, [sp, #144]
	ldr	r0, [sp, #148]
	add	r0, r0, r2
	mov	r2, r0
	ldr	r0, [r6, #8]
	add	r0, r0, ip
	str	r0, [sp, #148]
	ldr	r0, [r6, #12]
	adds	r1, r0, r1
	str	r1, [sp, #152]
	ldr	r1, [sp, #144]
	str	r1, [r4, #32]
	str	r2, [r6, #4]
	ldr	r1, [sp, #148]
	str	r1, [r6, #8]
	ldr	r1, [sp, #152]
	str	r1, [r6, #12]
	ldr	r0, [sp]
	ldr	r1, [r4, #48]
	str	r1, [sp, #204]
	ldr	r1, [sp, #8]
	ldr	r1, [r1, #4]
	str	r1, [sp, #208]
	ldr	r1, [sp, #8]
	ldr	r1, [r1, #8]
	str	r1, [sp, #212]
	ldr	r1, [sp, #8]
	ldr	r1, [r1, #12]
	str	r1, [sp, #216]
	ldr	r1, [sp, #36]
	ldrb	ip, [r1, #7]	@ zero_extendqisi2
	lsl	r1, ip, #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r0, r1]
	ldr	r0, [ip, #4]
	str	r0, [sp, #224]
	ldr	r0, [ip, #8]
	str	r0, [sp, #228]
	ldr	r0, [ip, #12]
	str	r1, [sp, #220]
	str	r0, [sp, #232]
	ldr	r1, [sp, #124]
	ldr	r0, [sp, #60]
	add	r0, r0, r1
	ldr	r1, [sp, #64]
	str	r0, [sp, #60]
	add	lr, lr, r1
	ldr	r0, [sp, #128]
	ldr	r1, [sp, #68]
	add	ip, r1, r0
	ldr	r1, [sp, #72]
	ldr	r0, [sp, #132]
	str	ip, [r4, #8]
	add	r1, r1, r0
	str	r1, [sp, #64]
	ldr	r1, [sp, #60]
	strd	r1, lr, [r4]
	ldr	r1, [sp, #64]
	str	r1, [r4, #12]
	ldr	r1, [sp, #76]
	ldr	r0, [sp, #136]
	add	r3, r3, r1
	ldr	r1, [sp, #80]
	str	r3, [r4, #16]
	add	r1, r1, r0
	str	r1, [sp, #72]
	ldr	r1, [sp, #84]
	ldr	r0, [sp, #140]
	add	r9, r9, r1
	ldr	r1, [sp, #88]
	str	r3, [sp, #68]
	add	r1, r1, r0
	str	r1, [sp, #76]
	ldr	r1, [sp, #72]
	strd	r1, r9, [r7, #4]
	ldr	r1, [sp, #76]
	ldr	r0, [sp, #144]
	str	r1, [r7, #12]
	ldr	r1, [sp, #92]
	add	r1, r1, r0
	str	r1, [sp, #80]
	ldr	r1, [sp, #96]
	adds	r2, r1, r2
	ldr	r1, [sp, #148]
	str	r2, [sp, #84]
	ldr	r2, [sp, #100]
	add	r2, r2, r1
	str	r2, [sp, #88]
	ldr	r2, [sp, #104]
	ldr	r1, [sp, #152]
	ldr	r3, [sp, #220]
	add	r2, r2, r1
	str	r2, [sp, #92]
	ldr	r2, [sp, #80]
	str	r2, [r4, #32]
	ldr	r2, [sp, #84]
	str	r2, [r6, #4]
	ldr	r2, [sp, #88]
	str	r2, [r6, #8]
	ldr	r2, [sp, #92]
	str	r2, [r6, #12]
	ldr	r2, [sp, #204]
	ldr	r0, [sp, #224]
	add	r3, r3, r2
	ldr	r2, [sp, #108]
	mov	r1, r3
	ldr	r3, [sp, #228]
	add	r1, r1, r2
	ldr	r2, [sp, #208]
	str	r1, [r4, #48]
	add	r2, r2, r0
	ldr	r0, [sp, #112]
	add	r2, r2, r0
	ldr	r0, [sp, #212]
	add	r0, r0, r3
	mov	r3, r0
	ldr	r0, [sp, #116]
	add	r3, r3, r0
	ldr	r0, [sp, #232]
	str	r3, [sp, #96]
	ldr	r3, [sp, #216]
	add	r3, r3, r0
	ldr	r0, [sp, #120]
	add	r3, r3, r0
	str	r3, [sp, #100]
	ldr	r3, [sp, #8]
	mov	r0, r3
	str	r2, [r3, #4]
	ldr	r3, [sp, #96]
	str	r3, [r0, #8]
	ldr	r3, [sp, #100]
	str	r3, [r0, #12]
	ldr	r3, [sp, #156]
	ldr	r0, [sp, #60]
	eors	r3, r3, r0
	str	r3, [sp, #60]
	ldr	r3, [sp, #160]
	ldr	r0, [sp, #64]
	eor	lr, r3, lr
	ldr	r3, [sp, #164]
	eor	ip, r3, ip
	ldr	r3, [sp, #168]
	eors	r3, r3, r0
	str	r3, [sp, #64]
	ldr	r3, [sp, #60]
	str	r3, [r4, #192]
	ldr	r3, [sp, #64]
	str	r3, [r8, #12]
	ldr	r0, [sp, #68]
	ldr	r3, [sp, #172]
	strd	lr, ip, [r8, #4]
	eors	r0, r0, r3
	str	r0, [sp, #68]
	ldr	r0, [sp, #176]
	mov	r3, r0
	ldr	r0, [sp, #72]
	eors	r0, r0, r3
	str	r0, [sp, #72]
	ldr	r0, [sp, #180]
	eor	r9, r0, r9
	ldr	r0, [sp, #184]
	mov	r3, r0
	ldr	r0, [sp, #76]
	eors	r0, r0, r3
	ldr	r3, [sp, #68]
	str	r3, [r4, #208]
	ldr	r3, [sp, #72]
	strd	r3, r9, [fp, #4]
	str	r0, [fp, #12]
	ldr	r3, [sp, #188]
	ldr	r0, [sp, #80]
	eors	r3, r3, r0
	str	r3, [r4, #224]
	ldr	r3, [sp, #192]
	ldr	r0, [sp, #84]
	str	ip, [sp, #52]
	eors	r3, r3, r0
	ldr	r0, [sp, #88]
	str	r3, [sp, #68]
	ldr	r3, [sp, #196]
	eors	r3, r3, r0
	ldr	r0, [sp, #200]
	mov	r9, r0
	ldr	r0, [sp, #92]
	eor	r9, r9, r0
	ldr	r0, [sp, #68]
	strd	r0, r3, [r10, #4]
	vmov	r3, s0	@ int
	vmov	r0, s2	@ int
	str	r9, [r10, #12]
	vmov	s2, ip	@ int
	eors	r1, r1, r3
	vmov	r3, s1	@ int
	str	r1, [r4, #240]
	vmov	s1, lr	@ int
	ldr	r1, [sp, #4]
	eors	r2, r2, r3
	ldr	r3, [sp, #96]
	str	r2, [r1, #4]
	eor	r9, r3, r0
	vmov	r0, s3	@ int
	ldr	r3, [sp, #100]
	eors	r3, r3, r0
	strd	r9, r3, [r1, #8]
	ldr	r3, [sp, #60]
	strd	r3, lr, [sp, #44]
	ldr	r3, [sp, #64]
	vmov	s3, r3	@ int
	vldr.32	s0, [sp, #44]	@ int
	str	r3, [sp, #56]
	bl	rot8(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #192]	@ int
	vstr.32	s2, [sp, #44]	@ int
	vstr.32	s1, [r8, #4]	@ int
	strd	r2, r3, [r8, #8]
	vstr.32	s3, [sp, #48]	@ int
	vldr.64	d1, [fp, #8]	@ int
	vldr.64	d0, [r4, #208]	@ int
	bl	rot8(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #208]	@ int
	vstr.32	s2, [sp, #44]	@ int
	vstr.32	s1, [fp, #4]	@ int
	strd	r2, r3, [fp, #8]
	vstr.32	s3, [sp, #48]	@ int
	vldr.64	d1, [r10, #8]	@ int
	vldr.64	d0, [r4, #224]	@ int
	bl	rot8(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #224]	@ int
	vstr.32	s2, [sp, #44]	@ int
	vstr.32	s1, [r10, #4]	@ int
	strd	r2, r3, [r10, #8]
	ldr	r3, [sp, #4]
	vldr.64	d0, [r4, #240]	@ int
	vstr.32	s3, [sp, #48]	@ int
	vldr.64	d1, [r3, #8]	@ int
	bl	rot8(PLT)
	ldr	r3, [sp, #4]
	vstr.32	s0, [r4, #240]	@ int
	vstr.32	s0, [sp, #44]	@ int
	vstr.32	s1, [sp, #48]	@ int
	vstr.32	s1, [r3, #4]	@ int
	vstr.32	s2, [r3, #8]	@ int
	vstr.32	s3, [r3, #12]	@ int
	ldr	r0, [r4, #192]
	str	r0, [sp, #148]
	ldr	r0, [r8, #4]
	str	r0, [sp, #152]
	ldr	r0, [r8, #8]
	str	r0, [sp, #156]
	ldr	r0, [r8, #12]
	ldr	r3, [sp, #16]
	str	r0, [sp, #160]
	ldr	r0, [sp, #148]
	ldrd	r2, r1, [r3, #4]
	mov	ip, r0
	ldr	r0, [r4, #128]
	ldr	r3, [r3, #12]
	add	r9, ip, r0
	ldr	r0, [sp, #152]
	str	r9, [r4, #128]
	adds	r2, r0, r2
	str	r2, [sp, #60]
	ldr	r2, [sp, #156]
	vstr.32	s2, [sp, #52]	@ int
	add	r2, r2, r1
	str	r2, [sp, #64]
	ldr	r2, [sp, #160]
	vstr.32	s3, [sp, #56]	@ int
	adds	r3, r2, r3
	str	r3, [sp, #68]
	ldr	r3, [sp, #16]
	mov	r2, r3
	ldr	r3, [sp, #60]
	str	r3, [r2, #4]
	ldr	r3, [sp, #64]
	str	r3, [r2, #8]
	ldr	r3, [sp, #68]
	str	r3, [r2, #12]
	ldr	r3, [sp, #20]
	ldr	r0, [r4, #208]
	str	r0, [sp, #164]
	ldr	r0, [fp, #4]
	str	r0, [sp, #168]
	ldr	r0, [fp, #8]
	ldrd	r1, r2, [r3, #4]
	str	r0, [sp, #172]
	ldr	r3, [r3, #12]
	ldr	r0, [fp, #12]
	str	r3, [sp, #84]
	str	r0, [sp, #176]
	ldr	r3, [r4, #144]
	ldr	r0, [sp, #164]
	add	r0, r0, r3
	ldr	r3, [sp, #168]
	str	r0, [r4, #144]
	add	r3, r3, r1
	str	r3, [sp, #76]
	ldr	r3, [sp, #172]
	str	r0, [sp, #72]
	add	r3, r3, r2
	ldr	r2, [sp, #84]
	str	r3, [sp, #80]
	ldr	r3, [sp, #176]
	add	r3, r3, r2
	str	r3, [sp, #84]
	ldr	r3, [sp, #20]
	mov	r2, r3
	ldr	r3, [sp, #76]
	str	r3, [r2, #4]
	ldr	r3, [sp, #80]
	str	r3, [r2, #8]
	ldr	r3, [sp, #84]
	str	r3, [r2, #12]
	ldr	r0, [r4, #224]
	str	r0, [sp, #180]
	ldr	r0, [r10, #4]
	str	r0, [sp, #184]
	ldr	r0, [r10, #8]
	str	r0, [sp, #188]
	ldr	r0, [r10, #12]
	ldr	r3, [r4, #160]
	str	r0, [sp, #192]
	ldr	r0, [sp, #180]
	ldrd	r1, r2, [r5, #8]
	add	lr, r0, r3
	ldr	r0, [r5, #4]
	ldr	r3, [sp, #184]
	str	lr, [r4, #160]
	add	r3, r3, r0
	str	r3, [sp, #88]
	ldr	r3, [sp, #188]
	add	r3, r3, r1
	str	r3, [sp, #92]
	ldr	r3, [sp, #192]
	add	r3, r3, r2
	str	r3, [sp, #96]
	ldr	r3, [sp, #88]
	str	r3, [r5, #4]
	ldr	r3, [sp, #92]
	str	r3, [r5, #8]
	ldr	r3, [sp, #96]
	str	r3, [r5, #12]
	ldr	r3, [sp, #24]
	ldr	r1, [r4, #176]
	ldrd	r2, r3, [r3, #4]
	ldr	r0, [sp, #24]
	ldr	r0, [r0, #12]
	str	r0, [sp, #100]
	vmov	r0, s0	@ int
	add	r1, r1, r0
	vmov	r0, s1	@ int
	str	r1, [r4, #176]
	add	r2, r2, r0
	vmov	r0, s2	@ int
	add	r3, r3, r0
	ldr	r0, [sp, #100]
	mov	ip, r0
	vmov	r0, s3	@ int
	add	ip, ip, r0
	ldr	r0, [sp, #24]
	strd	r2, r3, [r0, #4]
	str	ip, [r0, #12]
	ldr	r0, [sp, #28]
	ldr	r0, [r0, #4]
	str	r0, [sp, #104]
	ldr	r0, [sp, #28]
	ldr	r0, [r0, #8]
	str	r0, [sp, #108]
	ldr	r0, [sp, #28]
	ldr	r0, [r0, #12]
	str	r0, [sp, #112]
	ldr	r0, [r4, #64]
	eor	r0, r9, r0
	str	r0, [sp, #100]
	ldr	r0, [sp, #60]
	mov	r9, r0
	ldr	r0, [sp, #104]
	eor	r0, r9, r0
	str	r0, [sp, #104]
	ldr	r0, [sp, #64]
	mov	r9, r0
	ldr	r0, [sp, #108]
	eor	r0, r9, r0
	str	r0, [sp, #108]
	ldr	r0, [sp, #68]
	mov	r9, r0
	ldr	r0, [sp, #112]
	eor	r0, r9, r0
	str	r0, [sp, #112]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #4]
	str	r0, [sp, #60]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #8]
	str	r0, [sp, #64]
	ldr	r0, [sp, #12]
	ldr	r0, [r0, #12]
	str	r0, [sp, #68]
	ldr	r0, [sp, #72]
	b	.L33
.L34:
	.align	2
.L32:
	.word	.LANCHOR0-(.LPIC0+4)
.L33:
	mov	r9, r0
	ldr	r0, [r4, #80]
	eor	r0, r9, r0
	str	r0, [sp, #116]
	ldr	r0, [sp, #76]
	mov	r9, r0
	ldr	r0, [sp, #60]
	eor	r0, r9, r0
	str	r0, [sp, #76]
	ldr	r0, [sp, #80]
	mov	r9, r0
	ldr	r0, [sp, #64]
	eor	r0, r9, r0
	str	r0, [sp, #80]
	ldr	r0, [sp, #84]
	mov	r9, r0
	ldr	r0, [sp, #68]
	eor	r0, r9, r0
	str	r0, [sp, #84]
	ldr	r0, [sp, #32]
	ldr	r0, [r0, #4]
	str	r0, [sp, #60]
	ldr	r0, [sp, #32]
	ldr	r0, [r0, #8]
	str	r0, [sp, #64]
	ldr	r0, [sp, #32]
	ldr	r0, [r0, #12]
	str	r0, [sp, #68]
	ldr	r0, [r4, #96]
	eor	lr, lr, r0
	ldr	r0, [sp, #88]
	mov	r9, r0
	ldr	r0, [sp, #60]
	eor	r0, r9, r0
	str	r0, [sp, #120]
	ldr	r0, [sp, #92]
	mov	r9, r0
	ldr	r0, [sp, #64]
	eor	r0, r9, r0
	str	r0, [sp, #124]
	ldr	r0, [sp, #96]
	mov	r9, r0
	ldr	r0, [sp, #68]
	eor	r0, r9, r0
	str	r0, [sp, #128]
	ldr	r0, [r4, #112]
	eors	r1, r1, r0
	ldr	r0, [sp, #236]
	str	r1, [sp, #132]
	ldr	r1, [r0, #4]
	eors	r2, r2, r1
	ldr	r1, [r0, #8]
	eors	r3, r3, r1
	ldr	r1, [r0, #12]
	ror	r2, r2, #7
	eor	ip, ip, r1
	ldr	r1, [sp, #100]
	ror	r3, r3, #7
	ror	r1, r1, #7
	str	r1, [sp, #60]
	ldr	r1, [sp, #104]
	ror	r1, r1, #7
	str	r1, [sp, #64]
	ldr	r1, [sp, #108]
	ror	r1, r1, #7
	str	r1, [sp, #68]
	ldr	r1, [sp, #112]
	ror	r1, r1, #7
	str	r1, [sp, #72]
	ldr	r1, [sp, #60]
	str	r1, [r4, #64]
	ldr	r1, [sp, #28]
	mov	r9, r1
	ldr	r1, [sp, #64]
	str	r1, [r9, #4]
	ldr	r1, [sp, #68]
	str	r1, [r9, #8]
	ldr	r1, [sp, #72]
	str	r1, [r9, #12]
	ldr	r1, [sp, #116]
	ror	r1, r1, #7
	str	r1, [sp, #28]
	ldr	r1, [sp, #76]
	ror	r1, r1, #7
	str	r1, [sp, #76]
	ldr	r1, [sp, #80]
	str	r2, [sp, #104]
	ror	r1, r1, #7
	str	r1, [sp, #80]
	ldr	r1, [sp, #84]
	ror	r1, r1, #7
	str	r1, [sp, #84]
	ldr	r1, [sp, #28]
	str	r1, [r4, #80]
	ldr	r1, [sp, #12]
	mov	r9, r1
	ldr	r1, [sp, #76]
	str	r1, [r9, #4]
	ldr	r1, [sp, #80]
	str	r1, [r9, #8]
	ldr	r1, [sp, #84]
	str	r1, [r9, #12]
	ror	r1, lr, #7
	str	r1, [sp, #88]
	ldr	r1, [sp, #120]
	ror	r1, r1, #7
	str	r1, [sp, #92]
	ldr	r1, [sp, #124]
	ror	r1, r1, #7
	str	r1, [sp, #96]
	ldr	r1, [sp, #128]
	ror	r1, r1, #7
	str	r1, [sp, #100]
	ldr	r1, [sp, #88]
	str	r1, [r4, #96]
	ldr	r1, [sp, #32]
	mov	lr, r1
	ldr	r1, [sp, #92]
	str	r1, [lr, #4]
	ldr	r1, [sp, #96]
	str	r1, [lr, #8]
	ldr	r1, [sp, #100]
	str	r1, [lr, #12]
	ldr	r1, [sp, #132]
	ror	r1, r1, #7
	str	r1, [sp, #32]
	str	r3, [sp, #108]
	ror	r3, ip, #7
	str	r3, [sp, #112]
	ldr	r3, [sp, #108]
	str	r1, [r4, #112]
	str	r3, [r0, #8]
	ldr	r3, [sp, #112]
	str	r3, [r0, #12]
	ldr	r3, [sp, #36]
	ldr	r1, [sp]
	str	r2, [r0, #4]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r0, [r1, r2]
	ldr	ip, [r3, #12]
	ldrd	r1, r2, [r3, #4]
	ldr	r3, [r4]
	add	r9, r3, r0
	ldr	r3, [r4, #4]
	str	r9, [r4]
	add	r3, r3, r1
	str	r3, [sp, #116]
	ldr	r3, [r4, #8]
	add	lr, r3, r2
	ldr	r3, [r4, #12]
	add	r3, r3, ip
	str	r3, [sp, #120]
	ldr	r3, [sp, #116]
	strd	r3, lr, [r4, #4]
	ldr	r3, [sp, #120]
	str	r3, [r4, #12]
	ldr	r3, [sp, #36]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	ldr	r3, [sp]
	lsls	r1, r2, #4
	add	r2, r3, r2, lsl #4
	ldr	r3, [r3, r1]
	ldrd	r0, r1, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	str	r3, [sp, #124]
	add	r2, r2, r0
	str	r2, [sp, #128]
	ldr	r2, [r7, #8]
	add	r2, r2, r1
	str	r2, [sp, #132]
	ldr	r2, [r7, #12]
	str	r3, [r4, #16]
	add	r2, r2, ip
	str	r2, [sp, #136]
	ldr	r2, [sp, #128]
	str	r2, [r7, #4]
	ldr	r2, [sp, #132]
	str	r2, [r7, #8]
	ldr	r2, [sp, #136]
	str	r2, [r7, #12]
	ldr	r2, [sp, #36]
	ldr	r3, [r4, #32]
	ldrb	r0, [r2, #12]	@ zero_extendqisi2
	ldr	r2, [sp]
	lsl	ip, r0, #4
	add	r0, r2, r0, lsl #4
	ldr	r1, [r2, ip]
	ldrd	ip, r2, [r0, #4]
	add	r1, r1, r3
	ldr	r3, [r6, #4]
	ldr	r0, [r0, #12]
	add	r3, r3, ip
	str	r3, [sp, #140]
	ldr	r3, [r6, #8]
	add	r3, r3, r2
	str	r3, [sp, #144]
	ldr	r3, [r6, #12]
	str	r1, [r4, #32]
	adds	r2, r3, r0
	ldr	r3, [sp, #140]
	str	r3, [r6, #4]
	ldr	r3, [sp, #144]
	strd	r3, r2, [r6, #8]
	ldr	r3, [r4, #48]
	str	r3, [sp, #196]
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	str	r3, [sp, #200]
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	str	r3, [sp, #204]
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	str	r3, [sp, #208]
	ldr	r3, [sp, #36]
	ldrb	ip, [r3, #14]	@ zero_extendqisi2
	ldr	r3, [sp]
	lsl	r0, ip, #4
	add	ip, r3, ip, lsl #4
	ldr	r3, [r3, r0]
	str	r3, [sp, #212]
	ldr	r3, [ip, #4]
	str	r3, [sp, #216]
	ldr	r3, [ip, #8]
	str	r3, [sp, #220]
	ldr	r3, [ip, #12]
	str	r3, [sp, #224]
	ldr	r3, [sp, #28]
	ldr	r0, [sp, #116]
	add	r9, r9, r3
	ldr	r3, [sp, #76]
	add	r3, r3, r0
	str	r3, [sp, #28]
	ldr	r3, [sp, #80]
	ldr	r0, [sp, #120]
	add	lr, lr, r3
	ldr	r3, [sp, #84]
	str	r9, [r4]
	add	ip, r3, r0
	ldr	r3, [sp, #28]
	strd	r3, lr, [r4, #4]
	ldr	r0, [sp, #124]
	ldr	r3, [sp, #88]
	str	ip, [r4, #12]
	add	r0, r0, r3
	ldr	r3, [sp, #128]
	str	r0, [sp, #36]
	ldr	r0, [sp, #92]
	add	r0, r0, r3
	ldr	r3, [sp, #96]
	str	r0, [sp, #76]
	ldr	r0, [sp, #132]
	add	r3, r3, r0
	ldr	r0, [sp, #136]
	str	r3, [sp, #80]
	ldr	r3, [sp, #100]
	add	r3, r3, r0
	str	r3, [sp, #84]
	ldr	r3, [sp, #36]
	str	r3, [r4, #16]
	ldr	r3, [sp, #76]
	str	r3, [r7, #4]
	ldr	r3, [sp, #80]
	str	r3, [r7, #8]
	ldr	r3, [sp, #84]
	str	r3, [r7, #12]
	ldr	r3, [sp, #32]
	ldr	r0, [sp, #140]
	add	r1, r1, r3
	ldr	r3, [sp, #104]
	add	r3, r3, r0
	ldr	r0, [sp, #144]
	str	r3, [sp, #32]
	ldr	r3, [sp, #108]
	add	r3, r3, r0
	str	r3, [sp, #88]
	ldr	r3, [sp, #112]
	add	r3, r3, r2
	str	r3, [sp, #92]
	ldr	r3, [sp, #32]
	str	r1, [r4, #32]
	str	r3, [r6, #4]
	ldr	r3, [sp, #88]
	str	r3, [r6, #8]
	ldr	r3, [sp, #92]
	str	r3, [r6, #12]
	ldr	r2, [sp, #212]
	ldr	r3, [sp, #196]
	ldr	r6, [sp, #220]
	add	r2, r2, r3
	ldr	r3, [sp, #60]
	mov	r0, r2
	ldr	r2, [sp, #216]
	add	r0, r0, r3
	ldr	r3, [sp, #200]
	str	r0, [r4, #48]
	adds	r2, r3, r2
	ldr	r3, [sp, #64]
	add	r2, r2, r3
	ldr	r3, [sp, #204]
	adds	r6, r3, r6
	ldr	r3, [sp, #68]
	adds	r3, r6, r3
	ldr	r6, [sp, #224]
	str	r3, [sp, #60]
	ldr	r3, [sp, #208]
	adds	r6, r3, r6
	ldr	r3, [sp, #72]
	adds	r3, r6, r3
	str	r3, [sp, #64]
	ldr	r3, [sp, #8]
	mov	r6, r3
	str	r2, [r3, #4]
	ldr	r3, [sp, #60]
	str	r3, [r6, #8]
	ldr	r3, [sp, #64]
	str	r3, [r6, #12]
	vmov	r3, s0	@ int
	ldr	r6, [sp, #28]
	eor	r9, r3, r9
	vmov	r3, s1	@ int
	str	r9, [r4, #240]
	vmov	s0, r9	@ int
	eors	r3, r3, r6
	str	r3, [sp, #8]
	vmov	r3, s2	@ int
	eor	lr, lr, r3
	vmov	r3, s3	@ int
	vmov	s2, lr	@ int
	eor	ip, ip, r3
	ldr	r3, [sp, #4]
	vmov	s3, ip	@ int
	mov	r6, r3
	ldr	r3, [sp, #8]
	ldr	r7, [sp, #76]
	strd	lr, ip, [r6, #8]
	str	r3, [r6, #4]
	ldr	r3, [sp, #148]
	ldr	r6, [sp, #36]
	eors	r6, r6, r3
	str	r6, [sp, #28]
	ldr	r6, [sp, #152]
	eors	r6, r6, r7
	ldr	r7, [sp, #80]
	str	r6, [sp, #36]
	ldr	r6, [sp, #156]
	eors	r7, r7, r6
	ldr	r6, [sp, #160]
	mov	r3, r6
	ldr	r6, [sp, #84]
	eors	r6, r6, r3
	ldr	r3, [sp, #28]
	str	r3, [r4, #192]
	ldr	r3, [sp, #36]
	strd	r3, r7, [r8, #4]
	ldr	r3, [sp, #164]
	str	r6, [r8, #12]
	eors	r3, r3, r1
	ldr	r6, [sp, #32]
	str	r3, [sp, #28]
	ldr	r3, [sp, #168]
	eor	r7, r3, r6
	ldr	r6, [sp, #88]
	ldr	r3, [sp, #172]
	eors	r3, r3, r6
	ldr	r6, [sp, #176]
	mov	r1, r6
	ldr	r6, [sp, #92]
	eors	r6, r6, r1
	ldr	r1, [sp, #28]
	str	r1, [r4, #208]
	strd	r7, r3, [fp, #4]
	str	r6, [fp, #12]
	ldr	r3, [sp, #180]
	ldr	r1, [sp, #60]
	eors	r0, r0, r3
	ldr	r3, [sp, #184]
	ldr	r6, [sp, #64]
	eors	r2, r2, r3
	ldr	r3, [sp, #188]
	str	r0, [r4, #224]
	eors	r1, r1, r3
	ldr	r3, [sp, #192]
	strd	r2, r1, [r10, #4]
	eors	r3, r3, r6
	str	r3, [r10, #12]
	ldr	r3, [sp, #8]
	vmov	s1, r3	@ int
	str	lr, [sp, #8]
	str	ip, [sp, #36]
	str	r3, [sp, #32]
	str	r9, [sp, #28]
	bl	rot16(PLT)
	ldr	r1, [sp, #4]
	vstr.32	s0, [r4, #240]	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #28]	@ int
	vstr.32	s1, [r1, #4]	@ int
	vstr.32	s2, [r1, #8]	@ int
	vstr.32	s3, [r1, #12]	@ int
	vldr.64	d1, [r8, #8]	@ int
	vldr.64	d0, [r4, #192]	@ int
	bl	rot16(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #192]	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s1, [r8, #4]	@ int
	strd	r2, r3, [r8, #8]
	vstr.32	s3, [sp, #28]	@ int
	vldr.64	d1, [fp, #8]	@ int
	vldr.64	d0, [r4, #208]	@ int
	bl	rot16(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #208]	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s1, [fp, #4]	@ int
	strd	r2, r3, [fp, #8]
	vstr.32	s3, [sp, #28]	@ int
	vldr.64	d0, [r4, #224]	@ int
	vldr.64	d1, [r10, #8]	@ int
	bl	rot16(PLT)
	vstr.32	s0, [r4, #224]	@ int
	vstr.32	s1, [r10, #4]	@ int
	vstr.32	s2, [r10, #8]	@ int
	vstr.32	s3, [r10, #12]	@ int
	ldr	r6, [r4, #240]
	str	r6, [sp, #132]
	ldr	r6, [sp, #4]
	ldr	r2, [r4, #160]
	ldrd	r3, r0, [r5, #4]
	vstr.32	s1, [sp, #32]	@ int
	ldr	r6, [r6, #4]
	str	r6, [sp, #136]
	ldr	r6, [sp, #4]
	ldr	r1, [r5, #12]
	vstr.32	s3, [sp, #44]	@ int
	ldr	r6, [r6, #8]
	str	r6, [sp, #140]
	ldr	r6, [sp, #4]
	vstr.32	s2, [sp, #36]	@ int
	ldr	r6, [r6, #12]
	str	r6, [sp, #144]
	ldr	r6, [sp, #132]
	add	r9, r6, r2
	ldr	r2, [sp, #136]
	str	r9, [r4, #160]
	adds	r3, r2, r3
	str	r3, [sp, #4]
	ldr	r3, [sp, #140]
	add	r0, r0, r3
	ldr	r3, [sp, #144]
	add	r3, r3, r1
	str	r3, [sp, #8]
	ldr	r3, [sp, #4]
	strd	r3, r0, [r5, #4]
	ldr	r3, [sp, #8]
	str	r3, [r5, #12]
	ldr	r3, [sp, #24]
	ldr	r6, [r4, #192]
	str	r6, [sp, #148]
	ldr	r6, [r8, #4]
	str	r6, [sp, #152]
	ldr	r6, [r8, #8]
	str	r6, [sp, #156]
	ldr	r6, [r8, #12]
	ldr	r1, [r4, #176]
	str	r6, [sp, #160]
	ldr	r6, [sp, #148]
	ldrd	r2, r5, [r3, #4]
	adds	r1, r6, r1
	str	r1, [sp, #48]
	ldr	r1, [sp, #152]
	ldr	r3, [r3, #12]
	adds	r2, r1, r2
	str	r2, [sp, #52]
	ldr	r2, [sp, #156]
	add	r5, r5, r2
	ldr	r2, [sp, #160]
	add	ip, r2, r3
	ldr	r3, [sp, #48]
	str	r3, [r4, #176]
	ldr	r3, [sp, #24]
	mov	r2, r3
	ldr	r3, [sp, #52]
	str	r3, [r2, #4]
	ldr	r3, [sp, #16]
	strd	r5, ip, [r2, #8]
	ldrd	r1, r2, [r3, #4]
	ldr	r6, [r4, #128]
	ldr	r3, [r3, #12]
	ldr	r7, [r4, #208]
	str	r7, [sp, #164]
	ldr	r7, [fp, #4]
	str	r7, [sp, #168]
	ldr	r7, [fp, #8]
	str	r7, [sp, #172]
	ldr	r7, [fp, #12]
	str	r7, [sp, #176]
	ldr	r7, [sp, #164]
	add	fp, r7, r6
	ldr	r6, [sp, #168]
	str	fp, [r4, #128]
	vmov	r7, s0	@ int
	add	r10, r6, r1
	ldr	r1, [sp, #172]
	ldr	r6, [sp, #20]
	add	lr, r1, r2
	ldr	r2, [sp, #176]
	adds	r3, r2, r3
	str	r3, [sp, #24]
	ldr	r3, [sp, #16]
	mov	r2, r3
	strd	r10, lr, [r3, #4]
	ldr	r3, [sp, #24]
	str	r3, [r2, #12]
	ldr	r3, [sp, #20]
	ldr	r1, [r4, #144]
	ldr	r2, [sp, #20]
	add	r1, r1, r7
	vmov	r7, s1	@ int
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #8]
	ldr	r6, [r6, #12]
	add	r3, r3, r7
	vmov	r7, s2	@ int
	str	r1, [r4, #144]
	str	r3, [sp, #16]
	add	r2, r2, r7
	vmov	r7, s3	@ int
	add	r8, r6, r7
	ldr	r6, [sp, #20]
	strd	r3, r2, [r6, #4]
	str	r8, [r6, #12]
	ldr	r7, [sp, #12]
	ldr	r6, [r4, #80]
	ldr	r7, [r7, #4]
	eor	r9, r9, r6
	str	r7, [sp, #20]
	ldr	r7, [sp, #12]
	ldr	r6, [sp, #4]
	ldr	r7, [r7, #8]
	mov	r3, r6
	ldr	r6, [sp, #20]
	str	r7, [sp, #56]
	ldr	r7, [sp, #12]
	eors	r6, r6, r3
	str	r6, [sp, #12]
	ldr	r6, [sp, #56]
	ldr	r7, [r7, #12]
	eors	r0, r0, r6
	str	r0, [sp, #56]
	ldr	r0, [sp, #8]
	eors	r0, r0, r7
	str	r0, [sp, #60]
	add	r0, r4, #96
	str	r0, [sp, #4]
	ldr	r3, [r0, #12]
	str	r3, [sp, #8]
	ldr	r3, [sp, #48]
	ldrd	r7, r6, [r0, #4]
	mov	r0, r3
	ldr	r3, [r4, #96]
	eors	r5, r5, r6
	eors	r3, r3, r0
	str	r3, [sp, #64]
	ldr	r3, [sp, #52]
	ror	r0, r9, #12
	eors	r3, r3, r7
	str	r3, [sp, #68]
	ldr	r3, [sp, #8]
	ldr	r7, [r4, #112]
	eor	r3, ip, r3
	str	r3, [sp, #72]
	add	r3, r4, #112
	str	r3, [sp, #8]
	eor	r7, fp, r7
	ldr	r6, [r3, #12]
	ldr	r3, [r3, #4]
	eor	r10, r10, r3
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	eor	lr, lr, r3
	ldr	r3, [sp, #24]
	eor	ip, r3, r6
	ldrd	r3, r6, [r4, #64]
	eors	r1, r1, r3
	ldr	r3, [sp, #16]
	str	r0, [sp, #16]
	ldr	r0, [sp, #12]
	eors	r6, r6, r3
	ldr	r3, [r4, #72]
	ror	r1, r1, #12
	ror	r0, r0, #12
	str	r0, [sp, #20]
	ldr	r0, [sp, #56]
	eors	r2, r2, r3
	ldr	r3, [r4, #76]
	ror	r2, r2, #12
	ror	r0, r0, #12
	str	r0, [sp, #24]
	ldr	r0, [sp, #60]
	eor	r3, r8, r3
	ror	r3, r3, #12
	ror	r0, r0, #12
	str	r0, [sp, #48]
	add	r0, r4, #80
	str	r0, [sp, #12]
	ldr	r0, [sp, #16]
	str	r0, [r4, #80]
	ldr	r0, [sp, #12]
	mov	r8, r0
	ldr	r0, [sp, #20]
	str	r0, [r8, #4]
	ldr	r0, [sp, #24]
	str	r0, [r8, #8]
	ldr	r0, [sp, #48]
	str	r0, [r8, #12]
	ldr	r0, [sp, #64]
	ror	r0, r0, #12
	str	r0, [sp, #52]
	ldr	r0, [sp, #68]
	ror	r0, r0, #12
	str	r0, [sp, #56]
	ror	r0, r5, #12
	str	r0, [sp, #60]
	ldr	r0, [sp, #72]
	ror	r0, r0, #12
	str	r0, [sp, #64]
	ldr	r0, [sp, #52]
	str	r0, [r4, #96]
	ldr	r0, [sp, #4]
	str	r1, [sp, #84]
	ror	r1, r6, #12
	mov	r5, r0
	ldr	r0, [sp, #56]
	str	r3, [sp, #96]
	ldr	r3, [sp, #84]
	str	r0, [r5, #4]
	ldr	r0, [sp, #60]
	str	r0, [r5, #8]
	ldr	r0, [sp, #64]
	str	r0, [r5, #12]
	ror	r0, r7, #12
	ldr	r5, [sp, #8]
	str	r0, [sp, #68]
	ror	r0, r10, #12
	str	r0, [sp, #72]
	ror	r0, lr, #12
	str	r0, [sp, #76]
	ror	r0, ip, #12
	str	r0, [sp, #80]
	ldr	r0, [sp, #68]
	str	r0, [r4, #112]
	ldr	r0, [sp, #72]
	str	r0, [r5, #4]
	ldr	r0, [sp, #76]
	str	r0, [r5, #8]
	ldr	r0, [sp, #80]
	str	r0, [r5, #12]
	str	r3, [r4, #64]
	ldr	r3, [sp, #96]
	str	r1, [sp, #88]
	str	r2, [sp, #92]
	str	r1, [r4, #68]
	str	r2, [r4, #72]
	str	r3, [r4, #76]
	ldr	ip, .L35
	ldrd	r6, r5, [r4]
.LPIC12:
	add	ip, pc
	ldr	r3, [sp, #40]
	ldr	r1, [sp]
	ldr	r0, [r4, #16]
	add	ip, ip, r3, lsl #4
	ldrb	r3, [ip, #9]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r1, [r1, r2]
	ldrd	r7, r2, [r3, #4]
	adds	r1, r6, r1
	str	r1, [sp, #40]
	adds	r1, r5, r7
	str	r1, [sp, #100]
	ldr	r1, [r4, #8]
	ldr	r3, [r3, #12]
	adds	r2, r1, r2
	str	r2, [sp, #104]
	ldr	r2, [r4, #12]
	ldrb	r5, [ip, #11]	@ zero_extendqisi2
	adds	r3, r2, r3
	str	r3, [sp, #108]
	ldr	r3, [sp, #40]
	str	r3, [r4]
	lsls	r6, r5, #4
	ldr	r3, [sp, #100]
	str	r3, [r4, #4]
	ldr	r3, [sp, #104]
	str	r3, [r4, #8]
	ldr	r3, [sp, #108]
	str	r3, [r4, #12]
	ldr	r3, [sp]
	ldr	r7, [r4, #20]
	add	r5, r3, r5, lsl #4
	ldr	r1, [r3, r6]
	add	r8, r0, r1
	ldrd	r3, r6, [r5, #4]
	ldr	r5, [r5, #12]
	adds	r3, r7, r3
	str	r3, [sp, #112]
	ldr	r3, [r4, #24]
	ldrb	r7, [ip, #13]	@ zero_extendqisi2
	add	r3, r3, r6
	str	r3, [sp, #116]
	ldr	r3, [r4, #28]
	ldr	r1, [sp]
	lsl	lr, r7, #4
	add	r3, r3, r5
	str	r3, [sp, #120]
	ldr	r3, [sp, #112]
	str	r3, [r4, #20]
	add	r7, r1, r7, lsl #4
	ldr	r3, [sp, #116]
	str	r3, [r4, #24]
	ldr	r3, [sp, #120]
	str	r8, [r4, #16]
	str	r3, [r4, #28]
	ldr	r0, [r4, #32]
	ldr	r6, [r1, lr]
	ldrd	r5, r1, [r7, #4]
	add	r0, r0, r6
	str	r0, [sp, #124]
	ldr	r0, [r4, #36]
	ldr	r7, [r7, #12]
	add	r10, r0, r5
	ldr	r0, [r4, #40]
	add	r9, r0, r1
	ldr	r1, [r4, #44]
	str	r9, [r4, #40]
	add	r1, r1, r7
	str	r1, [sp, #128]
	ldr	r1, [sp, #124]
	strd	r1, r10, [r4, #32]
	ldr	r1, [sp, #128]
	str	r1, [r4, #44]
	ldr	r1, [r4, #48]
	str	r1, [sp, #180]
	ldr	r1, [r4, #52]
	str	r1, [sp, #184]
	ldr	r1, [r4, #56]
	str	r1, [sp, #188]
	ldr	r1, [r4, #60]
	str	r1, [sp, #192]
	ldrb	r1, [ip, #15]	@ zero_extendqisi2
	ldr	r0, [sp]
	ldr	r7, [sp, #112]
	lsls	r5, r1, #4
	add	r1, r0, r1, lsl #4
	ldr	r0, [r0, r5]
	str	r0, [sp, #196]
	ldr	r0, [r1, #4]
	str	r0, [sp, #200]
	ldr	r0, [r1, #8]
	ldr	r1, [r1, #12]
	str	r0, [sp, #204]
	str	r1, [sp, #208]
	ldr	r0, [sp, #40]
	ldr	r1, [sp, #16]
	adds	r6, r1, r0
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #100]
	adds	r5, r1, r0
	ldr	r0, [sp, #104]
	ldr	r1, [sp, #24]
	strd	r6, r5, [r4]
	add	r1, r1, r0
	ldr	r0, [sp, #108]
	str	r1, [sp]
	ldr	r1, [sp, #48]
	add	r1, r1, r0
	ldr	r0, [sp]
	strd	r0, r1, [r4, #8]
	ldr	r0, [sp, #52]
	str	r1, [sp, #16]
	add	ip, r0, r8
	ldr	r0, [sp, #56]
	adds	r7, r0, r7
	ldr	r0, [sp, #60]
	ldr	r1, [sp, #116]
	ldr	r2, [sp, #68]
	add	r0, r0, r1
	ldr	r1, [sp, #64]
	str	r0, [sp, #20]
	ldr	r0, [sp, #120]
	ldr	r3, [sp, #196]
	add	r1, r1, r0
	str	r1, [sp, #24]
	ldr	r1, [sp, #20]
	str	r1, [r4, #24]
	ldr	r1, [sp, #24]
	str	r1, [r4, #28]
	ldr	r1, [sp, #124]
	strd	ip, r7, [r4, #16]
	add	r2, r2, r1
	str	r2, [sp, #40]
	ldr	r2, [sp, #72]
	ldr	r1, [sp, #128]
	add	r10, r10, r2
	ldr	r2, [sp, #76]
	add	r2, r2, r9
	str	r2, [sp, #48]
	ldr	r2, [sp, #80]
	add	r2, r2, r1
	str	r2, [sp, #52]
	ldr	r2, [sp, #40]
	strd	r2, r10, [r4, #32]
	ldr	r2, [sp, #48]
	str	r2, [r4, #40]
	ldr	r2, [sp, #52]
	str	r2, [r4, #44]
	ldr	r2, [sp, #180]
	add	r3, r3, r2
	ldr	r2, [sp, #84]
	add	r3, r3, r2
	str	r3, [sp, #56]
	ldr	r3, [sp, #200]
	ldr	r2, [sp, #184]
	ldr	r1, [sp, #192]
	add	r3, r3, r2
	ldr	r2, [sp, #88]
	ldr	r0, [sp]
	add	r3, r3, r2
	ldr	r2, [sp, #188]
	str	r3, [sp, #60]
	ldr	r3, [sp, #204]
	adds	r2, r3, r2
	ldr	r3, [sp, #92]
	add	r2, r2, r3
	ldr	r3, [sp, #208]
	add	r3, r3, r1
	ldr	r1, [sp, #96]
	add	r3, r3, r1
	ldr	r1, [sp, #56]
	str	r1, [r4, #48]
	ldr	r1, [sp, #60]
	strd	r1, r2, [r4, #52]
	ldr	r1, [sp, #132]
	str	r3, [r4, #60]
	eors	r6, r6, r1
	ldr	r1, [sp, #136]
	eors	r5, r5, r1
	ldr	r1, [sp, #140]
	strd	r6, r5, [r4, #240]
	eors	r1, r1, r0
	ldr	r0, [sp, #16]
	str	r1, [sp]
	ldr	r1, [sp, #144]
	eors	r0, r0, r1
	mov	r1, r0
	ldr	r0, [sp]
	strd	r0, r1, [r4, #248]
	ldr	r0, [sp, #148]
	eor	r0, r0, ip
	str	r0, [sp, #16]
	ldr	r0, [sp, #152]
	eors	r7, r7, r0
	ldr	r0, [sp, #156]
	mov	lr, r0
	ldr	r0, [sp, #20]
	eor	lr, lr, r0
	ldr	r0, [sp, #160]
	str	lr, [r4, #200]
	mov	ip, r0
	ldr	r0, [sp, #24]
	eor	r0, ip, r0
	mov	ip, r0
	ldr	r0, [sp, #16]
	strd	r0, r7, [r4, #192]
	ldr	r0, [sp, #164]
	str	ip, [r4, #204]
	mov	ip, r0
	ldr	r0, [sp, #40]
	strd	r6, r5, [sp, #16]
	eor	r0, ip, r0
	str	r0, [r4, #208]
	ldr	r0, [sp, #168]
	eor	r10, r0, r10
	ldr	r0, [sp, #172]
	mov	ip, r0
	ldr	r0, [sp, #48]
	eor	lr, ip, r0
	ldr	r0, [sp, #176]
	strd	r10, lr, [r4, #212]
	vmov	lr, s1	@ int
	mov	ip, r0
	ldr	r0, [sp, #52]
	vmov	s1, r5	@ int
	eor	ip, ip, r0
	str	ip, [r4, #220]
	vmov	ip, s0	@ int
	ldr	r0, [sp, #56]
	vmov	s0, r6	@ int
	eor	ip, ip, r0
	ldr	r0, [sp, #60]
	eor	lr, lr, r0
	vmov	r0, s2	@ int
	strd	ip, lr, [r4, #224]
	eors	r2, r2, r0
	vmov	r0, s3	@ int
	vmov	s3, r1	@ int
	eors	r3, r3, r0
	strd	r2, r3, [r4, #232]
	ldr	r3, [sp]
	vmov	s2, r3	@ int
	strd	r3, r1, [sp, #24]
	bl	rot8(PLT)
	vmov	r3, s3	@ int
	vmov	r2, s2	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vldr.64	d1, [r4, #200]	@ int
	vstr.32	s0, [r4, #240]	@ int
	strd	r2, r3, [r4, #248]
	vstr.32	s1, [r4, #244]	@ int
	vldr.64	d0, [r4, #192]	@ int
	bl	rot8(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vldr.64	d1, [r4, #216]	@ int
	vstr.32	s0, [r4, #192]	@ int
	strd	r2, r3, [r4, #200]
	vstr.32	s1, [r4, #196]	@ int
	vldr.64	d0, [r4, #208]	@ int
	bl	rot8(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vldr.64	d1, [r4, #232]	@ int
	vstr.32	s0, [r4, #208]	@ int
	strd	r2, r3, [r4, #216]
	vstr.32	s1, [r4, #212]	@ int
	vldr.64	d0, [r4, #224]	@ int
	bl	rot8(PLT)
	vmov	r3, s2	@ int
	vmov	r1, s3	@ int
	ldr	r0, [r4, #240]
	ldrd	lr, r5, [r4, #244]
	vmov	ip, s0	@ int
	ldr	r9, [r4, #252]
	vmov	r2, s1	@ int
	strd	r3, r1, [r4, #232]
	ldr	r1, [r4, #160]
	ldr	r8, [r4, #204]
	add	r0, r0, r1
	ldr	r1, [r4, #164]
	str	r0, [sp]
	add	r1, lr, r1
	str	r1, [sp, #16]
	ldr	r1, [r4, #168]
	str	r0, [r4, #160]
	adds	r1, r5, r1
	ldr	r0, [r4, #192]
	ldr	r5, [r4, #176]
	ldrd	lr, r6, [r4, #196]
	str	r1, [sp, #20]
	ldr	r1, [r4, #172]
	add	r0, r0, r5
	str	r0, [sp, #28]
	ldr	r0, [r4, #180]
	add	r1, r1, r9
	str	r1, [sp, #24]
	ldr	r1, [sp, #16]
	add	r0, lr, r0
	str	r1, [r4, #164]
	str	r0, [sp, #32]
	ldr	r1, [sp, #20]
	ldr	r0, [r4, #184]
	str	r1, [r4, #168]
	ldr	r1, [sp, #24]
	adds	r0, r6, r0
	strd	ip, r2, [r4, #224]
	str	r1, [r4, #172]
	str	r0, [sp, #36]
	ldr	r0, [r4, #188]
	ldrd	r5, r1, [r4, #212]
	add	r0, r0, r8
	str	r0, [sp, #40]
	ldr	r0, [sp, #28]
	str	r0, [r4, #176]
	ldr	r0, [sp, #32]
	str	r0, [r4, #180]
	ldr	r0, [sp, #36]
	str	r0, [r4, #184]
	ldr	r0, [sp, #40]
	str	r0, [r4, #188]
	ldr	r0, [r4, #208]
	ldr	r7, [r4, #220]
	mov	lr, r0
	ldr	r0, [r4, #128]
	add	lr, lr, r0
	ldr	r0, [r4, #132]
	add	r8, r5, r0
	ldr	r0, [r4, #136]
	strd	lr, r8, [r4, #128]
	add	r9, r1, r0
	ldr	r0, [r4, #148]
	ldr	r1, [r4, #140]
	add	r2, r2, r0
	vmov	r0, s3	@ int
	add	r10, r7, r1
	ldr	r1, [r4, #144]
	ldrd	r7, r6, [r4, #152]
	add	r1, r1, ip
	strd	r9, r10, [r4, #136]
	add	ip, r6, r0
	ldr	r0, [sp, #12]
	strd	r1, r2, [r4, #144]
	add	r3, r3, r7
	strd	r3, ip, [r4, #152]
	ldr	r7, [r4, #80]
	ldrd	r6, r5, [r0, #4]
	ldr	r0, [r0, #12]
	str	r0, [sp, #44]
	ldr	r0, [sp]
	eors	r0, r0, r7
	str	r0, [sp]
	ldr	r0, [sp, #16]
	ldr	r7, [r4, #96]
	eors	r0, r0, r6
	str	r0, [sp, #16]
	ldr	r0, [sp, #20]
	eors	r0, r0, r5
	ldr	r5, [sp, #44]
	str	r0, [sp, #20]
	ldr	r0, [sp, #24]
	eors	r0, r0, r5
	str	r0, [sp, #24]
	ldr	r0, [sp, #4]
	ldrd	r6, r5, [r0, #4]
	ldr	r0, [r0, #12]
	str	r0, [sp, #44]
	ldr	r0, [sp, #28]
	eors	r7, r7, r0
	ldr	r0, [sp, #32]
	eors	r6, r6, r0
	ldr	r0, [sp, #36]
	ror	r7, r7, #7
	eors	r0, r0, r5
	str	r0, [sp, #28]
	ldr	r0, [sp, #40]
	ror	r6, r6, #7
	mov	r5, r0
	ldr	r0, [sp, #44]
	eors	r0, r0, r5
	str	r0, [sp, #32]
	ldr	r0, [r4, #112]
	eor	lr, lr, r0
	ldr	r0, [sp, #8]
	ldr	r0, [r0, #4]
	eor	r8, r8, r0
	ldr	r0, [sp, #8]
	ldr	r0, [r0, #8]
	eor	r9, r9, r0
	ldr	r0, [sp, #8]
	ldr	r0, [r0, #12]
	eor	r10, r10, r0
	ldr	r0, [r4, #64]
	eors	r1, r1, r0
	ldr	r0, [r4, #68]
	eors	r2, r2, r0
	ldr	r0, [r4, #72]
	ror	r1, r1, #7
	eors	r3, r3, r0
	ldr	r0, [r4, #76]
	ror	r2, r2, #7
	eor	ip, ip, r0
	ldr	r0, [sp]
	ror	r3, r3, #7
	ror	r0, r0, #7
	str	r0, [r4, #80]
	ldr	r0, [sp, #16]
	ror	r0, r0, #7
	str	r0, [sp]
	ldr	r0, [sp, #20]
	ror	r0, r0, #7
	str	r0, [sp, #16]
	ldr	r0, [sp, #24]
	ror	r0, r0, #7
	str	r0, [sp, #20]
	ldr	r0, [sp, #12]
	mov	r5, r0
	ldr	r0, [sp]
	str	r0, [r5, #4]
	ldr	r0, [sp, #16]
	str	r0, [r5, #8]
	ldr	r0, [sp, #20]
	str	r0, [r5, #12]
	ldr	r0, [sp, #28]
	str	r7, [r4, #96]
	ror	r7, lr, #7
	ror	lr, r10, #7
	ror	r5, r0, #7
	ldr	r0, [sp, #32]
	ror	r0, r0, #7
	str	r0, [sp]
	ldr	r0, [sp, #4]
	strd	r6, r5, [r0, #4]
	mov	r5, r0
	ldr	r0, [sp]
	ror	r6, r8, #7
	str	r0, [r5, #12]
	ror	r5, r9, #7
	ldr	r0, [sp, #8]
	str	r7, [r4, #112]
	strd	r6, r5, [r0, #4]
	str	lr, [r0, #12]
	ror	r0, ip, #7
	strd	r1, r2, [r4, #64]
	strd	r3, r0, [r4, #72]
	add	sp, sp, #244
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L36:
	.align	2
.L35:
	.word	.LANCHOR0-(.LPIC12+4)
	.size	round_fn, .-round_fn
	.align	1
	.global	transpose_vecs
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	transpose_vecs, %function
transpose_vecs:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, [r0, #52]
	sub	sp, sp, #20
	ldr	r3, [r0, #20]
	ldr	r5, [r0, #16]
	ldrd	fp, lr, [r0, #4]
	str	r4, [sp, #12]
	ldr	r4, [r0, #32]
	str	r3, [sp]
	strd	r5, r4, [r0, #4]
	ldr	r3, [r0, #24]
	ldr	r4, [r0, #48]
	ldr	r9, [r0, #12]
	str	r3, [sp, #4]
	str	r4, [r0, #12]
	ldr	r3, [r0, #28]
	ldr	r4, [sp, #12]
	ldrd	r10, ip, [r0, #36]
	str	r4, [r0, #28]
	ldrd	r7, r6, [r0, #56]
	str	r3, [sp, #8]
	ldr	r4, [sp, #4]
	ldr	r8, [r0, #44]
	str	fp, [r0, #16]
	str	r10, [r0, #24]
	str	lr, [r0, #32]
	str	r4, [r0, #36]
	str	r7, [r0, #44]
	str	r9, [r0, #48]
	ldr	r1, [sp, #8]
	strd	r1, r8, [r0, #52]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	transpose_vecs, .-transpose_vecs
	.align	1
	.global	transpose_msg_vecs
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	transpose_msg_vecs, %function
transpose_msg_vecs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0]
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, ip, r1
	ldr	r4, [ip, r1]	@ unaligned
	ldr	r5, [r3, #4]	@ unaligned
	ldr	r6, [r3, #8]	@ unaligned
	ldr	r7, [r3, #12]	@ unaligned
	strd	r6, r7, [r2, #8]
	strd	r4, r5, [r2]
	ldr	ip, [r0, #4]
	add	r3, ip, r1
	ldr	r4, [ip, r1]	@ unaligned
	ldr	r5, [r3, #4]	@ unaligned
	ldr	r6, [r3, #8]	@ unaligned
	ldr	r7, [r3, #12]	@ unaligned
	strd	r6, r7, [r2, #24]
	strd	r4, r5, [r2, #16]
	ldr	ip, [r0, #8]
	add	r3, ip, r1
	ldr	r4, [ip, r1]	@ unaligned
	ldr	r5, [r3, #4]	@ unaligned
	ldr	r6, [r3, #8]	@ unaligned
	ldr	r7, [r3, #12]	@ unaligned
	strd	r6, r7, [r2, #40]
	strd	r4, r5, [r2, #32]
	ldr	ip, [r0, #12]
	add	r3, ip, r1
	ldr	r4, [ip, r1]	@ unaligned
	ldr	r6, [r3, #8]	@ unaligned
	ldr	r5, [r3, #4]	@ unaligned
	ldr	r7, [r3, #12]	@ unaligned
	add	r3, r1, #16
	strd	r6, r7, [r2, #56]
	add	r6, r2, #64
	strd	r4, r5, [r2, #48]
	ldr	r5, [r0]
	adds	r4, r5, r3
	ldr	r8, [r5, r3]	@ unaligned
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	str	r8, [r2, #64]
	strd	r9, r10, [r6, #4]
	str	fp, [r6, #12]
	ldr	r5, [r0, #4]
	adds	r4, r5, r3
	ldr	r8, [r5, r3]	@ unaligned
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	strd	r10, fp, [r2, #88]
	strd	r8, r9, [r2, #80]
	ldr	r5, [r0, #8]
	adds	r4, r5, r3
	ldr	r8, [r5, r3]	@ unaligned
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	strd	r10, fp, [r2, #104]
	strd	r8, r9, [r2, #96]
	ldr	r5, [r0, #12]
	adds	r4, r5, r3
	ldr	r8, [r5, r3]	@ unaligned
	add	r3, r1, #32
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	strd	r10, fp, [r2, #120]
	strd	r8, r9, [r2, #112]
	ldr	r5, [r0]
	adds	r4, r5, r3
	ldr	r8, [r5, r3]	@ unaligned
	add	r5, r2, #128
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	str	r8, [r2, #128]
	strd	r9, r10, [r5, #4]
	str	fp, [r5, #12]
	ldr	r7, [r0, #4]
	adds	r4, r7, r3
	ldr	r8, [r7, r3]	@ unaligned
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	strd	r10, fp, [r2, #152]
	strd	r8, r9, [r2, #144]
	ldr	r7, [r0, #8]
	adds	r4, r7, r3
	ldr	r8, [r7, r3]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	ldr	r9, [r4, #4]	@ unaligned
	strd	r8, r9, [r2, #160]
	strd	r10, fp, [r2, #168]
	ldr	r7, [r0, #12]
	adds	r4, r7, r3
	ldr	r8, [r7, r3]	@ unaligned
	add	r3, r1, #48
	add	r1, r1, #256
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	strd	r10, fp, [r2, #184]
	strd	r8, r9, [r2, #176]
	ldr	r7, [r0]
	adds	r4, r7, r3
	ldr	r8, [r7, r3]	@ unaligned
	ldr	r9, [r4, #4]	@ unaligned
	ldr	r10, [r4, #8]	@ unaligned
	ldr	fp, [r4, #12]	@ unaligned
	add	r4, r2, #192
	str	r8, [r2, #192]
	strd	r9, r10, [r4, #4]
	str	fp, [r4, #12]
	ldr	ip, [r0, #4]
	add	r7, ip, r3
	ldr	r8, [ip, r3]	@ unaligned
	ldr	r10, [r7, #8]	@ unaligned
	ldr	fp, [r7, #12]	@ unaligned
	ldr	r9, [r7, #4]	@ unaligned
	strd	r8, r9, [r2, #208]
	strd	r10, fp, [r2, #216]
	ldr	ip, [r0, #8]
	add	r7, ip, r3
	ldr	r8, [ip, r3]	@ unaligned
	ldr	r9, [r7, #4]	@ unaligned
	ldr	r10, [r7, #8]	@ unaligned
	ldr	fp, [r7, #12]	@ unaligned
	strd	r10, fp, [r2, #232]
	strd	r8, r9, [r2, #224]
	ldr	ip, [r0, #12]
	add	r7, ip, r3
	ldr	r8, [ip, r3]	@ unaligned
	subs	r3, r0, #4
	adds	r0, r0, #12
	ldr	r9, [r7, #4]	@ unaligned
	ldr	r10, [r7, #8]	@ unaligned
	ldr	fp, [r7, #12]	@ unaligned
	strd	r10, fp, [r2, #248]
	strd	r8, r9, [r2, #240]
.L39:
	ldr	r7, [r3, #4]!
	cmp	r3, r0
	pld	[r7, r1]
	bne	.L39
	mov	r0, r2
	bl	transpose_vecs(PLT)
	mov	r0, r6
	bl	transpose_vecs(PLT)
	mov	r0, r5
	bl	transpose_vecs(PLT)
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	transpose_vecs(PLT)
	.size	transpose_msg_vecs, .-transpose_msg_vecs
	.align	1
	.global	load_counters
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	load_counters, %function
load_counters:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	ip, r2, #0
	push	{r4, r5, r6, r7, lr}
	and	r2, r2, #1
	and	lr, ip, #2
	and	ip, ip, #3
	adds	r6, r0, r2
	add	r5, r0, lr
	add	r4, r0, ip
	ldr	r7, [sp, #20]
	strd	r5, r4, [r3, #8]
	add	r2, r2, #-2147483648
	strd	r0, r6, [r3]
	add	r5, r5, #-2147483648
	add	r6, r6, #-2147483648
	add	lr, lr, #-2147483648
	add	r4, r4, #-2147483648
	add	ip, ip, #-2147483648
	cmp	r6, r2
	ite	lt
	movlt	r2, #-1
	movge	r2, #0
	cmp	r5, lr
	ite	lt
	movlt	r5, #-1
	movge	r5, #0
	cmp	r4, ip
	ite	lt
	movlt	r4, #-1
	movge	r4, #0
	subs	r2, r1, r2
	subs	r5, r1, r5
	subs	r4, r1, r4
	strd	r1, r2, [r7]
	strd	r5, r4, [r7, #8]
	pop	{r4, r5, r6, r7, pc}
	.size	load_counters, .-load_counters
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	blake3_hash4_sse41, %function
blake3_hash4_sse41:
	@ args = 28, pretend = 0, frame = 784
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vmov	s15, r0	@ int
	ldr	r0, [r2]
	sub	sp, sp, #796
	ldrb	r3, [sp, #844]	@ zero_extendqisi2
	str	r3, [sp, #84]
	ldrb	r3, [sp, #852]	@ zero_extendqisi2
	str	r1, [sp, #80]
	str	r3, [sp, #88]
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	add	r3, sp, #136
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #152]	@ int
	strd	r0, r1, [sp, #160]
	ldr	r0, [r2, #4]
	vstr.32	s1, [sp, #156]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #168]	@ int
	strd	r0, r1, [sp, #176]
	ldr	r0, [r2, #8]
	vstr.32	s1, [sp, #172]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #184]	@ int
	strd	r0, r1, [sp, #192]
	ldr	r0, [r2, #12]
	vstr.32	s1, [sp, #188]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #200]	@ int
	strd	r0, r1, [sp, #208]
	ldr	r0, [r2, #16]
	vstr.32	s1, [sp, #204]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #216]	@ int
	strd	r0, r1, [sp, #224]
	ldr	r0, [r2, #20]
	vstr.32	s1, [sp, #220]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #232]	@ int
	strd	r0, r1, [sp, #240]
	ldr	r0, [r2, #24]
	vstr.32	s1, [sp, #236]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s0, [sp, #248]	@ int
	strd	r0, r1, [sp, #256]
	ldr	r0, [r2, #28]
	vstr.32	s1, [sp, #252]	@ int
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	str	r3, [sp]
	add	r3, sp, #120
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	strd	r1, r2, [sp, #272]
	ldrb	r2, [sp, #840]	@ zero_extendqisi2
	ldrd	r0, [sp, #832]
	vstr.32	s0, [sp, #264]	@ int
	vstr.32	s1, [sp, #268]	@ int
	bl	load_counters(PLT)
	ldr	r2, [sp, #84]
	ldrb	r3, [sp, #848]	@ zero_extendqisi2
	orrs	r3, r3, r2
	movs	r2, #0
	str	r2, [sp, #76]
.L43:
	ldrd	r2, r1, [sp, #76]
	cmp	r2, r1
	bne	.L45
	add	r2, sp, #152
	add	r4, sp, #216
	mov	r0, r2
	bl	transpose_vecs(PLT)
	mov	r0, r4
	bl	transpose_vecs(PLT)
	ldr	r0, [sp, #856]
	vldr.64	d0, [sp, #152]	@ int
	vldr.64	d1, [sp, #160]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #216]	@ int
	add	r0, r3, #16
	vldr.64	d1, [sp, #224]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #168]	@ int
	add	r0, r3, #32
	vldr.64	d1, [sp, #176]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #232]	@ int
	add	r0, r3, #48
	vldr.64	d1, [sp, #240]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #184]	@ int
	add	r0, r3, #64
	vldr.64	d1, [sp, #192]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #248]	@ int
	add	r0, r3, #80
	vldr.64	d1, [sp, #256]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #200]	@ int
	add	r0, r3, #96
	vldr.64	d1, [sp, #208]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #856]
	vldr.64	d0, [sp, #264]	@ int
	add	r0, r3, #112
	vldr.64	d1, [sp, #272]	@ int
	bl	storeu(PLT)
	add	sp, sp, #796
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L45:
	ldr	r2, [sp, #76]
	movs	r0, #64
	ldr	r1, [sp, #80]
	add	r5, sp, #280
	adds	r2, r2, #1
	str	r2, [sp, #76]
	cmp	r2, r1
	add	r4, sp, #536
	itt	eq
	ldreq	r2, [sp, #88]
	orreq	r3, r3, r2
	bl	set1(PLT)
	mov	r0, r3
	vstr.32	s0, [sp, #68]	@ int
	vstr.32	s1, [sp, #72]	@ int
	mov	r2, r5
	vstr.32	s2, [sp, #12]	@ int
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s2, [sp, #100]	@ int
	vstr.32	s3, [sp, #104]	@ int
	bl	set1(PLT)
	ldr	r3, [sp, #76]
	vmov	r0, s15	@ int
	vstr.32	s0, [sp, #92]	@ int
	vstr.32	s1, [sp, #96]	@ int
	lsls	r1, r3, #6
	vstr.32	s2, [sp, #12]	@ int
	subs	r1, r1, #64
	vstr.32	s3, [sp, #16]	@ int
	vstr.32	s2, [sp, #108]	@ int
	vstr.32	s3, [sp, #112]	@ int
	bl	transpose_msg_vecs(PLT)
	ldr	r3, [sp, #152]
	add	r2, sp, #552
	str	r3, [sp, #536]
	ldr	r3, [sp, #156]
	str	r3, [sp, #540]
	ldr	r3, [sp, #160]
	str	r3, [sp, #544]
	ldr	r3, [sp, #164]
	str	r3, [sp, #548]
	ldr	r3, [sp, #168]
	str	r3, [sp, #552]
	ldr	r3, [sp, #172]
	str	r3, [r2, #4]
	ldr	r3, [sp, #176]
	str	r3, [r2, #8]
	ldr	r3, [sp, #180]
	str	r3, [r2, #12]
	str	r2, [sp, #20]
	add	r2, sp, #568
	ldr	r3, [sp, #184]
	str	r3, [sp, #568]
	ldr	r3, [sp, #188]
	str	r3, [r2, #4]
	ldr	r3, [sp, #192]
	str	r3, [r2, #8]
	ldr	r3, [sp, #196]
	str	r3, [r2, #12]
	add	r3, sp, #200
	str	r2, [sp, #24]
	add	r2, sp, #584
	str	r3, [sp, #12]
	ldr	r0, .L46
	ldr	r3, [r3]
	str	r3, [sp, #584]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #4]
	str	r2, [sp, #28]
	str	r3, [r2, #4]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #8]
	str	r3, [r2, #8]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [r2, #12]
	add	r2, sp, #600
	ldr	r3, [sp, #216]
	str	r3, [sp, #600]
	ldr	r3, [sp, #220]
	str	r3, [r2, #4]
	ldr	r3, [sp, #224]
	str	r3, [r2, #8]
	ldr	r3, [sp, #228]
	str	r3, [r2, #12]
	add	r3, sp, #232
	str	r2, [sp, #32]
	add	r2, sp, #616
	str	r3, [sp, #16]
	ldr	r3, [r3]
	str	r3, [sp, #616]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #4]
	str	r3, [r2, #4]
	ldr	r3, [sp, #16]
	str	r2, [sp, #36]
	ldr	r3, [r3, #8]
	str	r3, [r2, #8]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #12]
	str	r3, [r2, #12]
	add	r2, sp, #632
	ldr	r3, [sp, #248]
	str	r3, [sp, #632]
	ldr	r3, [sp, #252]
	str	r2, [sp, #40]
	str	r3, [r2, #4]
	ldr	r3, [sp, #256]
	str	r3, [r2, #8]
	ldr	r3, [sp, #260]
	str	r3, [r2, #12]
	add	r2, sp, #648
	ldr	r3, [sp, #264]
	str	r3, [sp, #648]
	ldr	r3, [sp, #268]
	str	r3, [r2, #4]
	ldr	r3, [sp, #272]
	str	r3, [r2, #8]
	ldr	r3, [sp, #276]
	str	r3, [r2, #12]
	add	r3, sp, #664
	str	r2, [sp, #44]
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	ldr	r0, .L46+4
	vstr.32	s2, [sp, #48]	@ int
	vstr.32	s3, [sp, #52]	@ int
	vstr.32	s0, [sp, #664]	@ int
	vstr.32	s1, [sp, #668]	@ int
	strd	r1, r2, [sp, #672]
	str	r3, [sp, #116]
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	add	r3, sp, #680
	vstr.32	s0, [sp, #680]	@ int
	ldr	r0, .L46+8
	vstr.32	s3, [sp, #52]	@ int
	vstr.32	s1, [r3, #4]	@ int
	strd	r1, r2, [r3, #8]
	str	r3, [sp, #48]
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	add	r3, sp, #696
	vstr.32	s0, [sp, #696]	@ int
	ldr	r0, .L46+12
	vstr.32	s3, [sp, #56]	@ int
	vstr.32	s1, [r3, #4]	@ int
	strd	r1, r2, [r3, #8]
	str	r3, [sp, #52]
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	add	r3, sp, #712
	vstr.32	s0, [sp, #712]	@ int
	str	r3, [sp, #56]
	mov	r0, r4
	vstr.32	s1, [r3, #4]	@ int
	strd	r1, r2, [r3, #8]
	add	r3, sp, #728
	ldr	r1, [sp, #120]
	str	r1, [sp, #728]
	ldr	r1, [sp, #124]
	str	r1, [r3, #4]
	ldr	r2, [sp, #132]
	ldr	r1, [sp, #128]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	str	r3, [sp, #60]
	add	r3, sp, #744
	ldr	r1, [sp, #136]
	str	r1, [sp, #744]
	ldr	r1, [sp, #140]
	str	r1, [r3, #4]
	ldr	r2, [sp, #148]
	ldr	r1, [sp, #144]
	str	r1, [r3, #8]
	mov	r1, r5
	str	r3, [sp, #64]
	str	r2, [r3, #12]
	ldr	r3, [sp, #68]
	str	r3, [sp, #760]
	add	r3, sp, #760
	mov	r2, r3
	str	r3, [sp, #68]
	ldr	r3, [sp, #72]
	str	r3, [r2, #4]
	ldr	r3, [sp, #100]
	str	r3, [r2, #8]
	ldr	r3, [sp, #104]
	str	r3, [r2, #12]
	ldr	r3, [sp, #92]
	str	r3, [sp, #776]
	add	r3, sp, #776
	mov	r2, r3
	str	r3, [sp, #72]
	ldr	r3, [sp, #96]
	str	r3, [r2, #4]
	ldr	r3, [sp, #108]
	str	r3, [r2, #8]
	ldr	r3, [sp, #112]
	str	r3, [r2, #12]
	movs	r2, #0
	bl	round_fn(PLT)
	mov	r1, r5
	mov	r0, r4
	movs	r2, #1
	bl	round_fn(PLT)
	mov	r1, r5
	mov	r0, r4
	movs	r2, #2
	bl	round_fn(PLT)
	mov	r1, r5
	mov	r0, r4
	movs	r2, #3
	bl	round_fn(PLT)
	mov	r1, r5
	mov	r0, r4
	movs	r2, #4
	bl	round_fn(PLT)
	mov	r1, r5
	mov	r0, r4
	movs	r2, #5
	bl	round_fn(PLT)
	mov	r1, r5
	mov	r0, r4
	movs	r2, #6
	bl	round_fn(PLT)
	ldr	r3, [sp, #116]
	ldrd	r5, r0, [sp, #536]
	ldrd	r4, r1, [r3, #4]
	ldrd	ip, r2, [sp, #544]
	eors	r0, r0, r4
	ldr	lr, [r3, #12]
	ldr	r3, [sp, #664]
	eor	r1, ip, r1
	eor	r2, r2, lr
	strd	r1, r2, [sp, #160]
	eors	r3, r3, r5
	ldr	r2, [sp, #48]
	strd	r3, r0, [sp, #152]
	ldr	r3, [sp, #20]
	ldrd	ip, r0, [r2, #4]
	ldrd	r4, r5, [r3, #4]
	ldr	r1, [r2, #12]
	ldr	lr, [r3, #12]
	eors	r0, r0, r5
	ldr	r3, [sp, #680]
	eor	r4, r4, ip
	ldr	r2, [sp, #552]
	eors	r2, r2, r3
	eor	r3, lr, r1
	strd	r0, r3, [sp, #176]
	ldr	r3, [sp, #24]
	strd	r2, r4, [sp, #168]
	ldrd	ip, r5, [r3, #4]
	ldr	r4, [r3, #12]
	ldr	r3, [sp, #52]
	ldrd	r0, lr, [r3, #4]
	ldr	r1, [r3, #12]
	ldr	r2, [sp, #696]
	eor	r0, r0, ip
	ldr	r3, [sp, #568]
	eors	r4, r4, r1
	eors	r2, r2, r3
	eor	r3, lr, r5
	strd	r3, r4, [sp, #192]
	ldr	r3, [sp, #28]
	strd	r2, r0, [sp, #184]
	ldr	r2, [sp, #712]
	ldrd	r7, r5, [r3, #4]
	ldr	r4, [r3, #12]
	ldr	r3, [sp, #56]
	ldr	r1, [r3, #12]
	ldrd	r0, ip, [r3, #4]
	eors	r4, r4, r1
	ldr	r1, [sp, #12]
	ldr	r3, [sp, #584]
	eors	r0, r0, r7
	eors	r2, r2, r3
	eor	r3, ip, r5
	strd	r0, r3, [r1, #4]
	ldr	r3, [sp, #32]
	str	r2, [r1]
	str	r4, [r1, #12]
	ldrd	r1, r5, [r3, #4]
	ldr	r4, [r3, #12]
	ldr	r3, [sp, #60]
	ldrd	r0, ip, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r2, [sp, #728]
	eors	r0, r0, r1
	ldr	r3, [sp, #600]
	eors	r4, r4, r7
	ldr	r1, [sp, #616]
	eors	r2, r2, r3
	eor	r3, ip, r5
	strd	r3, r4, [sp, #224]
	ldr	r3, [sp, #36]
	strd	r2, r0, [sp, #216]
	ldr	r2, [sp, #64]
	ldrd	r5, r4, [r3, #4]
	ldr	r6, [r3, #12]
	ldr	r3, [sp, #64]
	ldr	r7, [r2, #12]
	ldr	r2, [sp, #744]
	ldrd	r0, r3, [r3, #4]
	eors	r2, r2, r1
	ldr	r1, [sp, #16]
	eors	r6, r6, r7
	eors	r0, r0, r5
	eors	r3, r3, r4
	strd	r0, r3, [r1, #4]
	ldr	r3, [sp, #40]
	str	r2, [r1]
	str	r6, [r1, #12]
	ldr	r2, [sp, #68]
	ldrd	r5, r4, [r3, #4]
	ldr	r6, [r3, #12]
	ldr	r3, [sp, #68]
	ldr	r7, [r2, #12]
	ldr	r1, [sp, #632]
	ldrd	r0, r3, [r3, #4]
	eors	r6, r6, r7
	ldr	r2, [sp, #760]
	eors	r3, r3, r4
	strd	r3, r6, [sp, #256]
	ldr	r3, [sp, #44]
	eors	r2, r2, r1
	eors	r0, r0, r5
	strd	r2, r0, [sp, #248]
	ldr	r2, [sp, #72]
	ldrd	r5, r4, [r3, #4]
	ldr	r6, [r3, #12]
	ldr	r3, [sp, #72]
	ldr	r7, [r2, #12]
	b	.L47
.L48:
	.align	2
.L46:
	.word	1779033703
	.word	-1150833019
	.word	1013904242
	.word	-1521486534
.L47:
	ldr	r1, [sp, #648]
	ldrd	r0, r3, [r3, #4]
	eors	r6, r6, r7
	ldr	r2, [sp, #776]
	eors	r3, r3, r4
	eors	r0, r0, r5
	eors	r2, r2, r1
	strd	r3, r6, [sp, #272]
	strd	r2, r0, [sp, #264]
	ldr	r3, [sp, #84]
	b	.L43
	.size	blake3_hash4_sse41, .-blake3_hash4_sse41
	.align	1
	.global	hash_one_sse41
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	hash_one_sse41, %function
hash_one_sse41:
	@ args = 24, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r6, r0
	mov	r5, r1
	sub	sp, sp, #48
	add	lr, r2, #32
	add	r4, sp, #16
	mov	ip, r4
	ldrd	r10, [sp, #80]
	ldrb	r7, [sp, #88]	@ zero_extendqisi2
	ldrb	r8, [sp, #96]	@ zero_extendqisi2
.L50:
	mov	r3, ip
	ldr	r0, [r2]	@ unaligned
	ldr	r1, [r2, #4]	@ unaligned
	adds	r2, r2, #8
	cmp	r2, lr
	stmia	r3!, {r0, r1}
	mov	ip, r3
	bne	.L50
	ldrb	r3, [sp, #92]	@ zero_extendqisi2
	orrs	r3, r3, r7
.L51:
	cbnz	r5, .L53
	ldr	r2, [sp, #100]
	add	r5, sp, #48
.L54:
	mov	r3, r4
	adds	r2, r2, #8
	ldmia	r3!, {r0, r1}
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	mov	r4, r3
	cmp	r3, r5
	bne	.L54
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L53:
	cmp	r5, #1
	mov	r1, r6
	it	eq
	orreq	r3, r3, r8
	movs	r2, #64
	str	r3, [sp, #8]
	mov	r0, r4
	strd	r10, [sp]
	adds	r6, r6, #64
	bl	_blake3_compress_in_place_sse41(PLT)
	subs	r5, r5, #1
	mov	r3, r7
	b	.L51
	.size	hash_one_sse41, .-hash_one_sse41
	.align	1
	.global	_blake3_hash_many_sse41
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_blake3_hash_many_sse41, %function
_blake3_hash_many_sse41:
	@ args = 28, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r3
	mov	r6, r0
	sub	sp, sp, #60
	mov	r5, r1
	mov	r8, r2
	mov	fp, r1
	ldrb	r3, [sp, #108]	@ zero_extendqisi2
	str	r3, [sp, #36]
	ldrb	r3, [sp, #112]	@ zero_extendqisi2
	str	r3, [sp, #40]
	ldrb	r3, [sp, #116]	@ zero_extendqisi2
	str	r3, [sp, #44]
	ldrd	r4, r7, [sp, #96]
	ldrb	r10, [sp, #104]	@ zero_extendqisi2
	ldr	r3, [sp, #120]
.L58:
	cmp	fp, #3
	bhi	.L60
	ldr	r3, [sp, #120]
	lsrs	r1, r5, #2
	add	r6, r6, r1, lsl #4
	add	fp, r3, r1, lsl #7
	mvn	r3, #3
	subs	r6, r6, #4
	mla	r5, r3, r1, r5
	add	r5, fp, r5, lsl #5
.L61:
	cmp	fp, r5
	bne	.L63
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L60:
	str	r3, [sp, #24]
	mov	r2, r9
	str	r3, [sp, #52]
	mov	r1, r8
	ldr	r3, [sp, #44]
	str	r3, [sp, #20]
	ldr	r3, [sp, #40]
	str	r3, [sp, #16]
	ldr	r3, [sp, #36]
	strd	r10, r3, [sp, #8]
	strd	r4, r7, [sp]
	str	r0, [sp, #48]
	bl	blake3_hash4_sse41(PLT)
	ldrd	r0, r3, [sp, #48]
	cmp	r10, #0
	beq	.L59
	adds	r4, r4, #4
	adc	r7, r7, #0
.L59:
	adds	r0, r0, #16
	sub	fp, fp, #4
	adds	r3, r3, #128
	b	.L58
.L63:
	ldr	r3, [sp, #44]
	mov	r2, r9
	str	r3, [sp, #16]
	mov	r1, r8
	ldr	r3, [sp, #40]
	str	r3, [sp, #12]
	ldr	r3, [sp, #36]
	str	fp, [sp, #20]
	str	r3, [sp, #8]
	strd	r4, r7, [sp]
	ldr	r0, [r6, #4]!
	bl	hash_one_sse41(PLT)
	cmp	r10, #0
	beq	.L62
	adds	r4, r4, #1
	adc	r7, r7, #0
.L62:
	add	fp, fp, #32
	b	.L61
	.size	_blake3_hash_many_sse41, .-_blake3_hash_many_sse41
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	MSG_SCHEDULE, %object
	.size	MSG_SCHEDULE, 112
MSG_SCHEDULE:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013\014"
	.ascii	"\015\016\017"
	.ascii	"\002\006\003\012\007\000\004\015\001\013\014\005\011"
	.ascii	"\016\017\010"
	.ascii	"\003\004\012\014\015\002\007\016\006\005\011\000\013"
	.ascii	"\017\010\001"
	.ascii	"\012\007\014\011\016\003\015\017\004\000\013\002\005"
	.ascii	"\010\001\006"
	.ascii	"\014\015\011\013\017\012\016\010\007\002\005\003\000"
	.ascii	"\001\006\004"
	.ascii	"\011\016\013\005\010\014\017\001\015\003\000\012\002"
	.ascii	"\006\004\007"
	.ascii	"\013\017\005\000\001\011\010\006\016\012\002\014\003"
	.ascii	"\004\007\015"
	.section	.note.GNU-stack,"",%progbits
#endif
