/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Based on BLAKE3 v1.3.1, https://github.com/BLAKE3-team/BLAKE3
 * Copyright (c) 2019-2022 Samuel Neves
 * Copyright (c) 2022-2023 Tino Reichardt <milky-zfs@mcmilk.de>
 *
 * This is converted assembly: SSE2 -> ARMv7
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	vmov	r4, s0	@ int
	vmov	r0, s1	@ int
	movs	r3, #0
	vmov	r1, s2	@ int
	mov	r7, r3
	mov	r6, r3
	asr	ip, r4, #16
	mov	r5, r3
	vmov	r2, s3	@ int
	bfi	r3, ip, #0, #16
	bfi	r3, r4, #16, #16
	asrs	r4, r0, #16
	vmov	s0, r3	@ int
	bfi	r7, r4, #0, #16
	bfi	r7, r0, #16, #16
	asrs	r0, r1, #16
	vmov	s1, r7	@ int
	bfi	r6, r0, #0, #16
	bfi	r6, r1, #16, #16
	asrs	r1, r2, #16
	vmov	s2, r6	@ int
	bfi	r5, r1, #0, #16
	bfi	r5, r2, #16, #16
	vmov	s3, r5	@ int
	strd	r6, r5, [sp]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov	r1, s0	@ int
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	sub	sp, sp, #8
	ror	r0, r1, #8
	vmov	r1, s1	@ int
	ror	r2, r2, #8
	ror	r3, r3, #8
	vmov	s0, r0	@ int
	vstr.32	s2, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	vmov	s2, r2	@ int
	ror	r1, r1, #8
	vmov	s3, r3	@ int
	vmov	s1, r1	@ int
	add	sp, sp, #8
	@ sp needed
	bx	lr
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	vmov	ip, s0	@ int
	vmov	r8, s2	@ int
	ldrd	r5, r4, [r0, #8]
	str	r4, [sp]
	ldr	r4, [r0]
	vmov	lr, s1	@ int
	ldrd	r6, r7, [r1, #4]
	add	ip, ip, r4
	ldr	r4, [r1]
	vmov	r9, s3	@ int
	add	r5, r5, r8
	vstr.32	s3, [sp, #4]	@ int
	add	ip, ip, r4
	ldr	r4, [r0, #4]
	add	r7, r7, r5
	ldr	r5, [r1, #12]
	add	lr, lr, r4
	ldr	r4, [sp]
	add	r6, r6, lr
	strd	ip, r6, [r0]
	add	r4, r4, r9
	add	r4, r4, r5
	strd	r7, r4, [r0, #8]
	ldr	r5, [r3, #4]
	ldr	r0, [r3]
	eor	lr, r6, r5
	ldr	r5, [r3, #8]
	eor	r0, ip, r0
	eors	r7, r7, r5
	ldr	r5, [r3, #12]
	eor	r9, r4, r5
	movs	r5, #0
	asrs	r4, r0, #16
	mov	ip, r5
	mov	r10, r5
	mov	r6, r5
	bfi	r5, r4, #0, #16
	bfi	r5, r0, #16, #16
	asr	r0, lr, #16
	bfi	ip, r0, #0, #16
	asrs	r0, r7, #16
	bfi	r10, r0, #0, #16
	asr	r0, r9, #16
	bfi	ip, lr, #16, #16
	strd	r5, ip, [r3]
	bfi	r6, r0, #0, #16
	bfi	r10, r7, #16, #16
	bfi	r6, r9, #16, #16
	strd	r10, r6, [r3, #8]
	ldrd	r7, r3, [r2]
	ldrd	r4, r0, [r2, #8]
	add	r5, r5, r7
	add	r3, r3, ip
	strd	r5, r3, [r2]
	add	r4, r4, r10
	add	r0, r0, r6
	strd	r4, r0, [r2, #8]
	ldrd	r7, r6, [r1, #4]
	ldr	r2, [r1, #12]
	str	r2, [sp]
	eors	r3, r3, r7
	ldr	r2, [r1]
	eors	r4, r4, r6
	ror	r3, r3, #12
	eors	r5, r5, r2
	ldr	r2, [sp]
	ror	r4, r4, #12
	eors	r0, r0, r2
	ror	r5, r5, #12
	strd	r5, r3, [r1]
	ror	r0, r0, #12
	strd	r4, r0, [r1, #8]
	add	sp, sp, #8
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	vmov	ip, s1	@ int
	vmov	lr, s2	@ int
	ldrd	r5, r4, [r0, #8]
	str	r4, [sp]
	vmov	r4, s0	@ int
	ldr	r6, [r0]
	vmov	r8, s3	@ int
	add	r5, r5, lr
	ldr	r7, [r1, #12]
	vstr.32	s3, [sp, #4]	@ int
	add	r4, r4, r6
	mov	r6, r4
	ldr	r4, [r1]
	add	r6, r6, r4
	ldr	r4, [r0, #4]
	add	ip, ip, r4
	ldr	r4, [r1, #4]
	add	ip, ip, r4
	ldr	r4, [r1, #8]
	strd	r6, ip, [r0]
	add	r5, r5, r4
	ldr	r4, [sp]
	add	r4, r4, r8
	add	r7, r7, r4
	strd	r5, r7, [r0, #8]
	ldr	r4, [r3]
	ldr	r0, [r3, #12]
	eors	r6, r6, r4
	ldr	r4, [r3, #4]
	eors	r0, r0, r7
	eor	ip, ip, r4
	ldr	r4, [r3, #8]
	ror	r6, r6, #8
	ror	r0, r0, #8
	eors	r5, r5, r4
	ror	r4, ip, #8
	strd	r6, r4, [r3]
	ror	r5, r5, #8
	strd	r5, r0, [r3, #8]
	ldr	r3, [r2, #4]
	str	r3, [sp]
	ldr	r3, [r2]
	ldr	r7, [r2, #12]
	add	r6, r6, r3
	ldr	r3, [sp]
	add	r0, r0, r7
	add	r3, r3, r4
	ldr	r4, [r2, #8]
	strd	r6, r3, [r2]
	add	r5, r5, r4
	strd	r5, r0, [r2, #8]
	ldr	r2, [r1, #12]
	str	r2, [sp]
	ldr	r2, [r1]
	ldrd	r7, r4, [r1, #4]
	eors	r6, r6, r2
	ldr	r2, [sp]
	eors	r3, r3, r7
	eors	r5, r5, r4
	eors	r0, r0, r2
	ror	r6, r6, #7
	ror	r3, r3, #7
	ror	r5, r5, #7
	ror	r0, r0, #7
	strd	r6, r3, [r1]
	strd	r5, r0, [r1, #8]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
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
	.global	blend_epi16
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	blend_epi16, %function
blend_epi16:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vmov	r10, s1	@ int
	ldr	r8, .L18+4
	sub	sp, sp, #44
	ldr	lr, .L18+8
	add	r3, sp, #31
	ldr	ip, .L18+12
	bic	r3, r3, #15
	ldr	r2, .L18
	vmov	fp, s2	@ int
	vstr.32	s0, [sp]	@ int
	vstr.32	s3, [sp, #4]	@ int
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldrd	r9, r4, [r3]
	strh	r0, [r3, #10]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	and	r8, r9, r8
	tst	r9, #1
	and	lr, r4, lr
	ldrd	r0, r1, [r3, #8]
	mov	r3, #0
	and	r4, r4, #4
	mov	r7, r3
	ite	ne
	movne	r9, #-1
	moveq	r9, r3
	lsrs	r8, r8, #16
	ite	eq
	moveq	r8, r7
	movne	r8, #-1
	cmp	r4, #4
	ite	eq
	moveq	r4, #-1
	movne	r4, r7
	mov	r6, r3
	and	ip, r0, ip
	and	r0, r0, #16
	bfi	r7, r4, #0, #16
	lsrs	r4, lr, #16
	ite	eq
	moveq	r4, r6
	movne	r4, #-1
	cmp	r0, #16
	ite	eq
	moveq	r0, #-1
	movne	r0, r6
	mov	r5, r3
	ands	r2, r2, r1
	and	r1, r1, #64
	bfi	r6, r0, #0, #16
	lsrs	r0, ip, #16
	ite	eq
	moveq	r0, r5
	movne	r0, #-1
	cmp	r1, #64
	ite	eq
	moveq	r1, #-1
	movne	r1, r5
	lsrs	r2, r2, #16
	vmov	r2, s0	@ int
	bfi	r5, r1, #0, #16
	ite	ne
	movne	r1, #-1
	moveq	r1, #0
	bfi	r3, r9, #0, #16
	bfi	r7, r4, #16, #16
	bfi	r6, r0, #16, #16
	bfi	r5, r1, #16, #16
	vmov	r1, s4	@ int
	bfi	r3, r8, #16, #16
	vstr.32	s6, [sp, #8]	@ int
	vstr.32	s7, [sp, #12]	@ int
	eors	r1, r1, r2
	vmov	r2, s5	@ int
	ands	r3, r3, r1
	eor	r1, r10, r2
	vmov	r2, s6	@ int
	ands	r7, r7, r1
	eor	r1, r2, fp
	vmov	r2, s3	@ int
	ands	r6, r6, r1
	vmov	r1, s7	@ int
	eors	r1, r1, r2
	ldr	r2, [sp]
	ands	r5, r5, r1
	eors	r3, r3, r2
	vmov	s0, r3	@ int
	eor	r3, r7, r10
	vmov	s1, r3	@ int
	eor	r3, r6, fp
	vmov	s2, r3	@ int
	ldr	r3, [sp, #4]
	eors	r3, r3, r5
	vmov	s3, r3	@ int
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L19:
	.align	2
.L18:
	.word	8388672
	.word	131073
	.word	524292
	.word	2097168
	.size	blend_epi16, .-blend_epi16
	.align	1
	.global	compress_pre
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	compress_pre, %function
compress_pre:
	@ args = 12, pretend = 0, frame = 368
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r8, r2
	ldr	r5, [r1]	@ unaligned
	mov	r6, r3
	ldr	r0, [r1, #4]	@ unaligned
	add	r7, r4, #16
	ldr	r2, [r1, #8]	@ unaligned
	sub	sp, sp, #372
	ldr	r3, [r1, #12]	@ unaligned
	add	r10, sp, #96
	strd	r5, r0, [r4]
	strd	r2, r3, [r4, #8]
	ldrb	r9, [sp, #416]	@ zero_extendqisi2
	ldr	r5, [r1, #16]	@ unaligned
	ldr	r0, [r1, #20]	@ unaligned
	ldr	r2, [r1, #24]	@ unaligned
	ldr	r3, [r1, #28]	@ unaligned
	str	r5, [r4, #16]
	add	r5, r4, #32
	strd	r0, r2, [r7, #4]
	str	r3, [r7, #12]
	ldr	r2, .L21
	ldr	r3, .L21+4
	ldr	r1, .L21+8
	ldr	r0, .L21+12
	bl	set4(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	vstr.32	s0, [r4, #32]	@ int
	ldrd	r0, r1, [sp, #408]
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
	ldr	r3, [r8, #12]	@ unaligned
	str	r3, [sp, #60]
	ldr	r3, [r8, #20]	@ unaligned
	str	r3, [sp, #56]
	ldr	r3, [r8, #32]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r8, #36]	@ unaligned
	str	r3, [sp, #44]
	ldr	r3, [r8, #40]	@ unaligned
	str	r3, [sp, #48]
	ldr	r3, [r8, #44]	@ unaligned
	str	r3, [sp, #52]
	ldr	r3, [r8, #48]	@ unaligned
	ldr	r9, [r8, #28]	@ unaligned
	ldr	fp, [r8, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r8, #52]	@ unaligned
	str	r3, [sp, #36]
	ldr	r3, [r8, #56]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r8, #60]	@ unaligned
	str	r3, [sp, #40]
	ldr	r3, [r8, #8]	@ unaligned
	str	r3, [sp, #32]
	ldr	r3, [r8, #16]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r8]	@ unaligned
	str	r3, [r10]	@ float
	add	r3, sp, #100
	vldr.32	s15, [sp, #32]
	str	r3, [sp, #4]
	vstr.32	s15, [r3]
	add	r3, sp, #104
	vldr.32	s15, [sp, #28]
	str	r3, [sp, #8]
	vstr.32	s15, [r3]
	add	r3, sp, #108
	str	r3, [sp, #12]
	vmov	s15, r9
	ldr	r2, [sp, #12]
	ldr	r3, [r8, #24]	@ unaligned
	add	r8, sp, #112
	str	r3, [r2]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	r8, {r0, r1, r2, r3}
	mov	r3, r6
	vldr.64	d0, [sp, #112]	@ int
	mov	r2, r5
	vldr.64	d1, [r8, #8]	@ int
	mov	r1, r7
	mov	r0, r4
	bl	g1(PLT)
	ldr	r3, [sp, #4]
	vldr.32	s14, [sp, #60]
	add	ip, sp, #128
	ldr	r2, [sp, #8]
	str	fp, [r10]	@ float
	vstr.32	s14, [r3]
	ldr	r3, [sp, #56]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #12]
	str	r9, [r3]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	mov	r3, r6
	vldr.64	d1, [ip, #8]	@ int
	mov	r2, r5
	vldr.64	d0, [sp, #128]	@ int
	mov	r1, r7
	mov	r0, r4
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]	@ float
	add	ip, sp, #144
	str	r3, [r10]	@ float
	ldr	r3, [sp, #48]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #16]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]	@ float
	str	r3, [r2]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	str	r3, [sp, #16]
	mov	r3, r6
	vldr.32	s0, [sp, #16]	@ int
	str	r0, [sp, #20]
	mov	r9, r1
	str	r2, [sp, #24]
	vmov	s1, r0	@ int
	vmov	s2, r1	@ int
	mov	r0, r4
	mov	r1, r7
	vmov	s3, r2	@ int
	mov	r2, r5
	bl	g1(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #44]	@ float
	add	ip, sp, #160
	str	r3, [r10]	@ float
	ldr	r3, [sp, #52]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #36]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #40]	@ float
	str	r3, [r2]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	str	r3, [sp, #48]
	mov	r3, r6
	vldr.32	s0, [sp, #48]	@ int
	str	r0, [sp, #52]
	mov	fp, r2
	str	r1, [sp, #36]
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
	vldr.32	s13, [sp, #28]
	ldr	r3, [sp, #4]
	add	ip, sp, #176
	vstr.32	s13, [r10]
	vldr.32	s13, [sp, #32]
	vstr.32	s13, [r3]
	ldr	r3, [sp, #8]
	vstr.32	s14, [r3]
	ldr	r3, [sp, #12]
	vstr.32	s15, [r3]
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #188]
	str	r3, [sp, #60]
	mov	r3, r6
	vldr.32	s2, [sp, #60]	@ int
	str	r1, [sp, #32]
	vmov	s0, r1	@ int
	str	r2, [sp, #56]
	mov	r1, r7
	str	r0, [sp, #40]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r0, [sp, #4]
	ldr	r3, [sp, #8]
	ldr	r1, [r8, #12]
	ldr	r2, [r8]
	vmov	s0, r1	@ int
	str	r9, [r10]	@ float
	vmov	s2, r2	@ int
	str	r9, [r0]	@ float
	vmov	s1, r1	@ int
	str	fp, [r3]	@ float
	vmov	s3, r2	@ int
	ldr	r3, [sp, #12]
	movs	r0, #204
	str	fp, [r3]	@ float
	vldr.64	d2, [sp, #96]	@ int
	vldr.64	d3, [r10, #8]	@ int
	str	r1, [sp, #28]
	str	r1, [sp, #64]
	str	r2, [sp, #44]
	str	r2, [sp, #68]
	bl	blend_epi16(PLT)
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	vstr.32	s2, [sp, #28]	@ int
	vmov	r8, s3	@ int
	vstr.32	s0, [sp, #64]	@ int
	vmov	s6, r9	@ int
	vstr.32	s1, [sp, #44]	@ int
	vstr.32	s2, [sp, #68]	@ int
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r3, [sp, #16]
	str	r3, [sp, #68]
	movs	r0, #192
	ldr	r3, [sp, #20]
	str	r3, [sp, #72]
	ldr	r3, [sp, #24]
	str	r3, [sp, #80]
	ldr	r3, [sp, #48]
	str	r3, [sp, #24]
	ldr	r3, [sp, #52]
	vmov	s1, r3	@ int
	vldr.32	s3, [sp, #132]	@ int
	vldr.32	s2, [sp, #128]	@ int
	vldr.32	s4, [sp, #68]	@ int
	vldr.32	s0, [sp, #24]	@ int
	vldr.32	s5, [sp, #72]	@ int
	vldr.32	s7, [sp, #80]	@ int
	str	r9, [sp, #76]
	str	r3, [sp, #48]
	bl	blend_epi16(PLT)
	vmov	r3, s1	@ int
	vmov	fp, s2	@ int
	vmov	r9, s3	@ int
	mov	r1, r7
	mov	r2, r5
	mov	r0, r4
	vstr.32	s3, [sp, #48]	@ int
	vstr.32	s1, [sp, #68]	@ int
	vmov.f32	s1, s2	@ int
	vmov.f32	s2, s3	@ int
	vmov	s3, r3	@ int
	mov	r3, r6
	vstr.32	s0, [sp, #24]	@ int
	bl	g1(PLT)
	ldr	r3, [sp, #20]
	str	r3, [sp, #52]
	mov	r2, r5
	ldr	r3, [sp, #36]
	mov	r0, r4
	str	r3, [sp, #72]
	ldr	r3, [sp, #136]
	str	r3, [sp, #48]
	ldr	r3, [sp, #16]
	vldr.32	s0, [sp, #52]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #72]	@ int
	vldr.32	s2, [sp, #48]	@ int
	str	r3, [sp, #76]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #60]	@ float
	add	ip, sp, #208
	str	r3, [r10]	@ float
	ldr	r3, [sp, #56]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	b	.L22
.L23:
	.align	2
.L21:
	.word	1013904242
	.word	-1521486534
	.word	-1150833019
	.word	1779033703
.L22:
	ldr	r3, [sp, #44]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #12]
	str	r8, [r3]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #220]
	str	r1, [sp, #52]
	vmov	s2, r3	@ int
	str	r2, [sp, #56]
	mov	r8, r0
	str	r3, [sp, #60]
	vmov	s0, r1	@ int
	mov	r3, r6
	mov	r1, r7
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #8]
	movs	r0, #204
	ldr	r3, [sp, #16]	@ float
	str	r9, [r10]	@ float
	str	r9, [r1]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldr	r3, [sp, #40]
	str	r3, [sp, #16]
	vldr.32	s0, [sp, #16]	@ int
	str	r3, [sp, #72]
	ldr	r3, [sp, #32]
	vmov.f32	s1, s0	@ int
	vldr.64	d3, [r10, #8]	@ int
	vmov	s2, r3	@ int
	vmov	s3, r3	@ int
	vldr.64	d2, [sp, #96]	@ int
	str	r3, [sp, #40]
	str	r3, [sp, #76]
	bl	blend_epi16(PLT)
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	vstr.32	s2, [sp, #16]	@ int
	vmov	s5, fp	@ int
	vstr.32	s2, [sp, #32]	@ int
	vmov	s6, r9	@ int
	vstr.32	s3, [sp, #76]	@ int
	vstr.32	s0, [sp, #72]	@ int
	vstr.32	s1, [sp, #40]	@ int
	vstr.32	s3, [sp, #80]	@ int
	bl	g2(PLT)
	mov	r1, r5
	mov	r2, r6
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r3, [sp, #24]
	str	r3, [sp, #16]
	movs	r0, #192
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #36]
	str	r3, [sp, #84]
	vmov	s1, r2	@ int
	ldr	r3, [sp, #64]
	str	r3, [sp, #36]
	ldr	r3, [sp, #44]
	vldr.32	s2, [sp, #36]	@ int
	vmov	s3, r3	@ int
	vldr.32	s0, [sp, #20]	@ int
	vldr.32	s4, [sp, #16]	@ int
	vldr.32	s7, [sp, #84]	@ int
	str	r9, [sp, #80]
	str	r2, [sp, #64]
	str	r3, [sp, #68]
	bl	blend_epi16(PLT)
	vmov	r3, s1	@ int
	vmov	r9, s3	@ int
	mov	r1, r7
	mov	r2, r5
	mov	r0, r4
	vstr.32	s2, [sp, #36]	@ int
	vstr.32	s2, [sp, #44]	@ int
	vstr.32	s1, [sp, #20]	@ int
	vmov.f32	s1, s2	@ int
	vmov.f32	s2, s3	@ int
	vmov	s3, r3	@ int
	mov	r3, r6
	vstr.32	s0, [sp, #16]	@ int
	bl	g1(PLT)
	ldr	r3, [sp, #48]
	str	r3, [sp, #44]
	mov	r2, r5
	ldr	r3, [sp, #28]
	mov	r0, r4
	str	r3, [sp, #64]
	vmov	s0, fp	@ int
	ldr	r3, [sp, #24]
	vldr.32	s1, [sp, #44]	@ int
	vmov	s3, r3	@ int
	vldr.32	s2, [sp, #64]	@ int
	str	r3, [sp, #68]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #60]	@ float
	add	ip, sp, #240
	str	r3, [r10]	@ float
	ldr	r3, [sp, #56]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #40]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #76]	@ float
	str	r3, [r2]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #252]
	str	r3, [sp, #64]
	mov	r3, r6
	vldr.32	s2, [sp, #64]	@ int
	str	r1, [sp, #44]
	vmov	s0, r1	@ int
	str	r2, [sp, #60]
	mov	r1, r7
	str	r0, [sp, #56]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #8]
	vmov	s0, r8	@ int
	ldr	r3, [sp, #24]	@ float
	vmov	s1, r8	@ int
	str	r9, [r10]	@ float
	movs	r0, #204
	str	r9, [r1]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldr	r3, [sp, #52]
	vldr.64	d3, [r10, #8]	@ int
	vmov	s2, r3	@ int
	vldr.64	d2, [sp, #96]	@ int
	vmov	s3, r3	@ int
	str	r8, [sp, #24]
	str	r8, [sp, #68]
	strd	r3, r3, [sp, #76]
	bl	blend_epi16(PLT)
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	vstr.32	s2, [sp, #24]	@ int
	vmov	r8, s3	@ int
	vstr.32	s0, [sp, #68]	@ int
	vmov	s6, r9	@ int
	vstr.32	s1, [sp, #52]	@ int
	vstr.32	s2, [sp, #76]	@ int
	bl	g2(PLT)
	mov	r1, r5
	mov	r2, r6
	mov	r0, r4
	vmov	s0, fp	@ int
	bl	diagonalize(PLT)
	ldr	r3, [sp, #16]
	str	r3, [sp, #76]
	movs	r0, #192
	ldr	r3, [sp, #36]
	str	r3, [sp, #80]
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #48]
	str	r3, [sp, #88]
	vmov	s1, r2	@ int
	ldr	r3, [sp, #72]
	str	r3, [sp, #48]
	ldr	r3, [sp, #40]
	vldr.32	s2, [sp, #48]	@ int
	vmov	s3, r3	@ int
	vldr.32	s4, [sp, #76]	@ int
	vldr.32	s5, [sp, #80]	@ int
	vldr.32	s7, [sp, #88]	@ int
	str	r9, [sp, #84]
	str	fp, [sp, #20]
	str	r2, [sp, #72]
	str	r3, [sp, #92]
	bl	blend_epi16(PLT)
	vmov	r3, s1	@ int
	vmov	r9, s3	@ int
	mov	r1, r7
	mov	r2, r5
	mov	r0, r4
	vstr.32	s2, [sp, #40]	@ int
	vstr.32	s2, [sp, #48]	@ int
	vstr.32	s1, [sp, #72]	@ int
	vmov.f32	s1, s2	@ int
	vmov.f32	s2, s3	@ int
	vmov	s3, r3	@ int
	mov	r3, r6
	vstr.32	s0, [sp, #20]	@ int
	bl	g1(PLT)
	ldr	r3, [sp, #36]
	str	r3, [sp, #48]
	mov	r2, r5
	ldr	r3, [sp, #28]
	mov	r0, r4
	str	r3, [sp, #76]
	ldr	r3, [sp, #32]
	str	r3, [sp, #80]
	ldr	r3, [sp, #16]
	vldr.32	s0, [sp, #48]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #76]	@ int
	vldr.32	s2, [sp, #80]	@ int
	str	r3, [sp, #84]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #64]	@ float
	add	ip, sp, #272
	str	r3, [r10]	@ float
	ldr	r3, [sp, #60]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #52]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #12]
	str	r8, [r3]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	mov	r3, r6
	ldr	fp, [sp, #284]
	str	r1, [sp, #48]
	vmov	s2, fp	@ int
	str	r2, [sp, #64]
	str	r0, [sp, #60]
	vmov	s0, r1	@ int
	vmov	s1, r2	@ int
	mov	r1, r7
	mov	r2, r5
	vmov	s3, r0	@ int
	mov	r0, r4
	bl	g1(PLT)
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #8]
	movs	r0, #204
	ldr	r3, [sp, #16]	@ float
	str	r9, [r10]	@ float
	str	r9, [r1]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldr	r3, [sp, #56]
	str	r3, [sp, #16]
	vldr.32	s0, [sp, #16]	@ int
	str	r3, [sp, #76]
	ldr	r3, [sp, #44]
	vmov.f32	s1, s0	@ int
	vldr.64	d3, [r10, #8]	@ int
	vmov	s2, r3	@ int
	vldr.64	d2, [sp, #96]	@ int
	vmov	s3, r3	@ int
	str	r3, [sp, #56]
	str	r3, [sp, #80]
	bl	blend_epi16(PLT)
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	vstr.32	s2, [sp, #16]	@ int
	vmov	r8, s3	@ int
	vstr.32	s2, [sp, #56]	@ int
	vmov	s6, r9	@ int
	vstr.32	s0, [sp, #76]	@ int
	vstr.32	s1, [sp, #44]	@ int
	bl	g2(PLT)
	mov	r1, r5
	mov	r2, r6
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r3, [sp, #20]
	str	r3, [sp, #16]
	movs	r0, #192
	ldr	r3, [sp, #40]
	str	r3, [sp, #80]
	ldr	r3, [sp, #72]
	ldr	r2, [sp, #28]
	str	r3, [sp, #88]
	vmov	s1, r2	@ int
	ldr	r3, [sp, #68]
	str	r3, [sp, #28]
	ldr	r3, [sp, #52]
	vldr.32	s2, [sp, #28]	@ int
	vmov	s3, r3	@ int
	vldr.32	s0, [sp, #36]	@ int
	vldr.32	s4, [sp, #16]	@ int
	vldr.32	s5, [sp, #80]	@ int
	vldr.32	s7, [sp, #88]	@ int
	str	r9, [sp, #84]
	str	r2, [sp, #68]
	str	r3, [sp, #72]
	bl	blend_epi16(PLT)
	vmov	r3, s1	@ int
	vmov	r9, s3	@ int
	mov	r1, r7
	mov	r2, r5
	mov	r0, r4
	vstr.32	s2, [sp, #28]	@ int
	vstr.32	s2, [sp, #36]	@ int
	vstr.32	s1, [sp, #68]	@ int
	vmov.f32	s1, s2	@ int
	vmov.f32	s2, s3	@ int
	vmov	s3, r3	@ int
	mov	r3, r6
	vstr.32	s0, [sp, #16]	@ int
	bl	g1(PLT)
	ldr	r3, [sp, #40]
	str	r3, [sp, #36]
	mov	r2, r5
	ldr	r3, [sp, #32]
	mov	r0, r4
	str	r3, [sp, #52]
	ldr	r3, [sp, #24]
	str	r3, [sp, #72]
	ldr	r3, [sp, #20]
	vldr.32	s0, [sp, #36]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #52]	@ int
	vldr.32	s2, [sp, #72]	@ int
	str	r3, [sp, #80]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #64]	@ float
	add	ip, sp, #304
	str	fp, [r10]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #44]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #12]
	str	r8, [r3]	@ float
	ldm	r10, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #316]
	str	r3, [sp, #72]
	mov	r3, r6
	vldr.32	s2, [sp, #72]	@ int
	str	r1, [sp, #36]
	vmov	s0, r1	@ int
	str	r2, [sp, #64]
	mov	r1, r7
	str	r0, [sp, #52]
	vmov	s1, r2	@ int
	vmov	s3, r0	@ int
	mov	r2, r5
	mov	r0, r4
	bl	g1(PLT)
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #8]
	movs	r0, #204
	ldr	r3, [sp, #20]	@ float
	str	r9, [r10]	@ float
	str	r9, [r1]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldr	r3, [sp, #60]
	str	r3, [sp, #20]
	vldr.32	s0, [sp, #20]	@ int
	str	r3, [sp, #80]
	ldr	r3, [sp, #48]
	vmov.f32	s1, s0	@ int
	vldr.64	d3, [r10, #8]	@ int
	vmov	s2, r3	@ int
	vldr.64	d2, [sp, #96]	@ int
	vmov	s3, r3	@ int
	str	r3, [sp, #60]
	str	r3, [sp, #84]
	bl	blend_epi16(PLT)
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	vstr.32	s2, [sp, #60]	@ int
	vmov	r8, s3	@ int
	vstr.32	s0, [sp, #48]	@ int
	vmov	s6, r9	@ int
	vstr.32	s1, [sp, #20]	@ int
	vstr.32	s2, [sp, #80]	@ int
	bl	g2(PLT)
	mov	r1, r5
	mov	r2, r6
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r3, [sp, #16]
	str	r3, [sp, #80]
	movs	r0, #192
	ldr	r3, [sp, #28]
	str	r3, [sp, #84]
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #32]
	str	r3, [sp, #92]
	vmov	s1, r2	@ int
	ldr	r3, [sp, #76]
	str	r3, [sp, #32]
	ldr	r3, [sp, #44]
	vldr.32	s2, [sp, #32]	@ int
	vmov	s3, r3	@ int
	vldr.32	s0, [sp, #40]	@ int
	vldr.32	s4, [sp, #80]	@ int
	vldr.32	s5, [sp, #84]	@ int
	vldr.32	s7, [sp, #92]	@ int
	str	r9, [sp, #88]
	str	r2, [sp, #68]
	str	r3, [sp, #76]
	bl	blend_epi16(PLT)
	vmov	r3, s1	@ int
	vmov	fp, s3	@ int
	vmov	r9, s2	@ int
	mov	r1, r7
	mov	r2, r5
	mov	r0, r4
	vstr.32	s1, [sp, #40]	@ int
	vmov.f32	s1, s2	@ int
	vmov.f32	s2, s3	@ int
	vmov	s3, r3	@ int
	mov	r3, r6
	vstr.32	s0, [sp, #32]	@ int
	bl	g1(PLT)
	ldr	r3, [sp, #28]
	str	r3, [sp, #44]
	mov	r2, r5
	ldr	r3, [sp, #24]
	mov	r0, r4
	str	r3, [sp, #68]
	ldr	r3, [sp, #56]
	str	r3, [sp, #76]
	ldr	r3, [sp, #16]
	vldr.32	s0, [sp, #44]	@ int
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #68]	@ int
	vldr.32	s2, [sp, #76]	@ int
	str	r3, [sp, #80]
	mov	r3, r6
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	undiagonalize(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #72]	@ float
	add	ip, sp, #336
	str	r3, [r10]	@ float
	ldr	r3, [sp, #64]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #20]	@ float
	str	r3, [r2]	@ float
	ldr	r3, [sp, #12]
	str	r8, [r3]	@ float
	ldm	r10, {r0, r1, r2, r3}
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
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #8]
	movs	r0, #204
	ldr	r3, [sp, #16]	@ float
	str	fp, [r10]	@ float
	str	fp, [r1]	@ float
	str	r3, [r2]	@ float
	ldr	r2, [sp, #12]
	str	r3, [r2]	@ float
	ldr	r3, [sp, #52]
	strd	r3, r3, [sp, #4]
	ldr	r3, [sp, #36]
	vldr.32	s0, [sp, #4]	@ int
	vmov	s2, r3	@ int
	vmov	s3, r3	@ int
	vldr.64	d3, [r10, #8]	@ int
	vldr.64	d2, [sp, #96]	@ int
	vmov.f32	s1, s0	@ int
	strd	r3, r3, [sp, #12]
	bl	blend_epi16(PLT)
	vmov	r2, s2	@ int
	vmov	r3, s3	@ int
	mov	r1, r7
	mov	r0, r4
	vstr.32	s0, [sp, #4]	@ int
	vstr.32	s1, [sp, #8]	@ int
	vmov	s5, r9	@ int
	vmov	s6, fp	@ int
	strd	r2, r3, [sp, #12]
	mov	r3, r6
	mov	r2, r5
	bl	g2(PLT)
	mov	r1, r5
	mov	r2, r6
	mov	r0, r4
	bl	diagonalize(PLT)
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	movs	r0, #192
	ldr	r3, [sp, #40]
	ldr	r2, [sp, #28]
	str	r3, [sp, #12]
	ldr	r3, [sp, #48]
	str	r2, [sp, #16]
	ldr	r2, [sp, #24]
	str	r3, [sp, #24]
	vmov	s1, r2	@ int
	vldr.32	s0, [sp, #16]	@ int
	vldr.32	s2, [sp, #24]	@ int
	ldr	r3, [sp, #20]
	vmov	s3, r3	@ int
	vldr.32	s4, [sp, #4]	@ int
	vldr.32	s7, [sp, #12]	@ int
	str	r2, [sp, #28]
	str	r3, [sp, #36]
	str	fp, [sp, #8]
	bl	blend_epi16(PLT)
	vmov	r2, s2	@ int
	vmov	r1, s0	@ int
	vmov	r3, s1	@ int
	mov	r0, r4
	vstr.32	s1, [sp, #20]	@ int
	vstr.32	s3, [sp, #12]	@ int
	strd	r1, r2, [sp, #4]
	mov	r1, r7
	mov	r2, r5
	vstr.32	s1, [sp, #16]	@ int
	vmov.f32	s1, s2	@ int
	vmov.f32	s2, s3	@ int
	vmov	s3, r3	@ int
	mov	r3, r6
	bl	g1(PLT)
	ldr	r3, [sp, #56]
	str	r3, [sp, #8]
	mov	r2, r5
	ldr	r3, [sp, #60]
	mov	r0, r4
	str	r3, [sp, #12]
	vmov	s0, r9	@ int
	ldr	r3, [sp, #32]
	str	r3, [sp, #16]
	vmov	s3, r3	@ int
	vldr.32	s1, [sp, #8]	@ int
	mov	r3, r6
	vldr.32	s2, [sp, #12]	@ int
	str	r9, [sp, #4]
	bl	g2(PLT)
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #372
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	undiagonalize(PLT)
	.size	compress_pre, .-compress_pre
	.align	1
	.global	_blake3_compress_in_place_sse2
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_blake3_compress_in_place_sse2, %function
_blake3_compress_in_place_sse2:
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
	.size	_blake3_compress_in_place_sse2, .-_blake3_compress_in_place_sse2
	.align	1
	.global	_blake3_compress_xof_sse2
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_blake3_compress_xof_sse2, %function
_blake3_compress_xof_sse2:
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
	.size	_blake3_compress_xof_sse2, .-_blake3_compress_xof_sse2
	.align	1
	.global	round_fn
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	round_fn, %function
round_fn:
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L27
	sub	sp, sp, #540
.LPIC0:
	add	r3, pc
	ldrd	r4, r5, [r0]
	str	r2, [sp, #532]
	str	r1, [sp]
	lsls	r2, r2, #4
	ldr	r1, [sp, #532]
	ldrd	r6, r7, [r0, #8]
	add	r1, r3, r1, lsl #4
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	str	r1, [sp, #272]
	ldr	r1, [sp]
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r8, [r1, r2]
	ldrd	r9, r10, [r3, #4]
	ldr	fp, [r3, #12]
	add	r3, r8, r4
	str	r3, [sp, #160]
	add	r3, r9, r5
	str	r3, [sp, #144]
	add	r3, r10, r6
	str	r3, [sp, #128]
	add	r3, fp, r7
	ldr	r6, [sp, #128]
	strd	r6, r3, [r0, #8]
	ldr	r4, [sp, #160]
	ldr	r5, [sp, #144]
	str	r3, [sp, #32]
	add	r3, r0, #16
	strd	r4, r5, [r0]
	str	r3, [sp, #80]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #272]
	ldr	r4, [r0, #16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldrd	r9, r10, [r3, #4]
	ldr	r8, [r1, r2]
	ldr	fp, [r3, #12]
	add	r3, r8, r4
	str	r3, [sp, #112]
	add	r3, r9, r5
	str	r3, [sp, #64]
	add	r3, r10, r6
	str	r3, [sp, #48]
	mov	r6, r3
	ldr	r3, [sp, #80]
	ldr	r4, [sp, #112]
	add	r2, fp, r7
	ldr	r5, [sp, #64]
	str	r4, [r0, #16]
	strd	r5, r6, [r3, #4]
	str	r2, [r3, #12]
	add	r3, r0, #32
	str	r3, [sp, #96]
	ldr	fp, [r3, #12]
	ldrd	r9, r10, [r3, #4]
	ldr	r3, [sp, #272]
	ldr	r8, [r0, #32]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	lsl	lr, r3, #4
	add	r3, r1, r3, lsl #4
	ldrd	r5, r6, [r3, #4]
	ldr	r4, [r1, lr]
	add	r1, r10, r6
	str	r1, [sp, #224]
	mov	r6, r1
	ldr	r1, [sp, #96]
	ldr	r7, [r3, #12]
	add	lr, r8, r4
	add	r3, r9, r5
	str	lr, [r0, #32]
	add	r8, fp, r7
	strd	r3, r6, [r1, #4]
	str	r8, [r1, #12]
	add	r1, r0, #48
	str	r1, [sp, #240]
	ldr	r1, [r0, #48]
	str	r1, [sp, #16]
	ldr	r1, [sp, #240]
	ldr	r1, [r1, #4]
	str	r1, [sp, #20]
	ldr	r1, [sp, #240]
	ldr	r1, [r1, #8]
	str	r1, [sp, #24]
	ldr	r1, [sp, #240]
	ldr	r1, [r1, #12]
	str	r1, [sp, #28]
	ldr	r1, [sp, #272]
	ldrb	r4, [r1, #6]	@ zero_extendqisi2
	ldr	r1, [sp]
	lsls	r5, r4, #4
	add	r4, r1, r4, lsl #4
	ldr	r9, [r1, r5]
	add	r1, r0, #64
	str	r1, [sp, #276]
	ldr	r1, [r0, #64]
	str	r1, [sp, #176]
	ldr	r1, [sp, #276]
	ldrd	r10, fp, [r4, #4]
	ldr	r1, [r1, #4]
	str	r1, [sp, #180]
	ldr	r1, [sp, #276]
	ldr	ip, [r4, #12]
	ldr	r1, [r1, #8]
	str	r1, [sp, #184]
	ldr	r1, [sp, #276]
	ldr	r1, [r1, #12]
	str	r1, [sp, #188]
	ldr	r1, [sp, #160]
	ldr	r4, [sp, #176]
	add	r1, r1, r4
	ldr	r4, [sp, #180]
	str	r1, [sp, #332]
	ldr	r1, [sp, #144]
	add	r1, r1, r4
	ldr	r4, [sp, #184]
	str	r1, [sp, #336]
	ldr	r1, [sp, #128]
	add	r1, r1, r4
	ldr	r4, [sp, #32]
	str	r1, [sp, #340]
	ldr	r1, [sp, #188]
	ldr	r6, [sp, #340]
	add	r4, r4, r1
	str	r4, [sp, #292]
	mov	r1, r4
	strd	r6, r1, [r0, #8]
	add	r1, r0, #80
	str	r1, [sp, #280]
	ldr	r1, [r0, #80]
	ldrd	r4, r5, [sp, #332]
	str	r1, [sp, #192]
	ldr	r1, [sp, #280]
	strd	r4, r5, [r0]
	ldr	r1, [r1, #4]
	str	r1, [sp, #196]
	ldr	r1, [sp, #280]
	ldr	r1, [r1, #8]
	str	r1, [sp, #200]
	ldr	r1, [sp, #280]
	ldr	r1, [r1, #12]
	str	r1, [sp, #204]
	ldr	r1, [sp, #112]
	ldr	r4, [sp, #192]
	add	r1, r1, r4
	ldr	r4, [sp, #196]
	str	r1, [sp, #344]
	ldr	r1, [sp, #64]
	add	r1, r1, r4
	ldr	r4, [sp, #200]
	str	r1, [sp, #348]
	ldr	r1, [sp, #48]
	add	r1, r1, r4
	str	r1, [sp, #352]
	ldr	r1, [sp, #204]
	ldrd	r4, r5, [sp, #344]
	add	r2, r2, r1
	mov	r7, r2
	str	r2, [sp, #296]
	ldr	r2, [sp, #80]
	ldr	r6, [sp, #352]
	str	r4, [r0, #16]
	strd	r5, r6, [r2, #4]
	str	r7, [r2, #12]
	add	r2, r0, #96
	str	r2, [sp, #284]
	ldr	r2, [r0, #96]
	str	r2, [sp, #208]
	ldr	r2, [sp, #284]
	ldr	r2, [r2, #4]
	str	r2, [sp, #212]
	ldr	r2, [sp, #284]
	ldr	r2, [r2, #8]
	str	r2, [sp, #216]
	ldr	r2, [sp, #284]
	ldr	r2, [r2, #12]
	str	r2, [sp, #220]
	ldr	r2, [sp, #208]
	add	r2, lr, r2
	str	r2, [sp, #356]
	ldr	r2, [sp, #212]
	add	r3, r3, r2
	ldr	r2, [sp, #216]
	str	r3, [sp, #360]
	ldr	r3, [sp, #224]
	ldrd	r4, r5, [sp, #356]
	add	r3, r3, r2
	str	r3, [sp, #364]
	ldr	r3, [sp, #220]
	ldr	r6, [sp, #364]
	add	r3, r8, r3
	str	r3, [sp, #300]
	mov	r7, r3
	ldr	r3, [sp, #96]
	str	r4, [r0, #32]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	add	r3, r0, #112
	str	r3, [sp, #288]
	ldr	r3, [r0, #112]
	str	r3, [sp, #224]
	ldr	r3, [sp, #288]
	ldr	r2, [sp, #224]
	ldr	r3, [r3, #4]
	str	r3, [sp, #228]
	ldr	r3, [sp, #288]
	ldr	r3, [r3, #8]
	str	r3, [sp, #232]
	ldr	r3, [sp, #288]
	ldr	r3, [r3, #12]
	str	r3, [sp, #236]
	ldr	r3, [sp, #16]
	add	r3, r3, r9
	add	r3, r3, r2
	str	r3, [sp, #368]
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #228]
	add	r3, r3, r10
	add	r3, r3, r2
	str	r3, [sp, #372]
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #236]
	add	r8, r3, fp
	ldr	r3, [sp, #232]
	ldrd	r4, r5, [sp, #368]
	add	r3, r8, r3
	str	r3, [sp, #376]
	ldr	r3, [sp, #28]
	ldr	r6, [sp, #376]
	add	r3, r3, ip
	str	r4, [r0, #48]
	add	r3, r3, r2
	str	r3, [sp, #304]
	mov	r7, r3
	ldr	r3, [sp, #240]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #332]
	ldrd	r8, r9, [r0, #192]
	ldrd	r10, fp, [r0, #200]
	eor	r4, r3, r8
	ldr	r3, [sp, #336]
	eor	r5, r3, r9
	ldr	r3, [sp, #340]
	ldrd	r8, r9, [r0, #208]
	eor	r6, r3, r10
	ldr	r3, [sp, #292]
	strd	r4, r5, [sp, #32]
	eor	lr, r3, fp
	str	r6, [sp, #40]
	ldrd	r10, fp, [r0, #216]
	ldr	r3, [sp, #344]
	eor	r4, r3, r8
	ldr	r3, [sp, #348]
	eor	r5, r3, r9
	ldr	r3, [sp, #352]
	ldrd	r8, r9, [r0, #224]
	eor	r6, r3, r10
	ldr	r3, [sp, #296]
	strd	r4, r5, [sp, #48]
	eor	r3, r3, fp
	strd	r6, r3, [sp, #56]
	str	r3, [sp, #112]
	ldr	r3, [sp, #356]
	ldrd	r10, fp, [r0, #232]
	eor	r4, r3, r8
	ldr	r3, [sp, #360]
	ldr	r8, [r0, #240]
	eor	r5, r3, r9
	ldr	r3, [sp, #364]
	strd	r4, r5, [sp, #64]
	eor	r6, r3, r10
	ldr	r3, [sp, #300]
	eor	r3, r3, fp
	strd	r6, r3, [sp, #72]
	str	r3, [sp, #128]
	add	r3, r0, #240
	str	r3, [sp, #256]
	ldr	fp, [r3, #12]
	ldrd	r9, r10, [r3, #4]
	ldr	r3, [sp, #368]
	eor	r4, r3, r8
	ldr	r3, [sp, #372]
	mov	r8, r4
	eor	r5, r3, r9
	ldr	r3, [sp, #376]
	asr	r2, r8, #16
	eor	r6, r3, r10
	ldr	r3, [sp, #304]
	eor	r3, r3, fp
	mov	r7, r3
	ldr	r3, [sp, #32]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #32]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #16]
	ldr	r3, [sp, #36]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #36]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #20]
	ldr	r3, [sp, #40]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #40]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #24]
	mov	r3, lr
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	bfi	r3, lr, #16, #16
	str	r3, [sp, #28]
	ldr	r3, [sp, #16]
	str	r3, [sp, #160]
	ldr	r3, [sp, #20]
	str	r3, [sp, #164]
	ldr	r3, [sp, #24]
	str	r3, [sp, #168]
	ldr	r3, [sp, #160]
	str	r3, [r0, #192]
	ldr	r3, [sp, #164]
	str	r3, [r0, #196]
	ldr	r3, [sp, #168]
	str	r3, [r0, #200]
	ldr	r3, [sp, #28]
	str	r3, [r0, #204]
	ldr	r3, [sp, #48]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #48]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #32]
	ldr	r3, [sp, #52]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #52]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #36]
	ldr	r3, [sp, #56]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #56]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #40]
	ldr	r3, [sp, #60]
	asrs	r4, r3, #16
	movs	r3, #0
	bfi	r3, r4, #0, #16
	ldr	r4, [sp, #112]
	bfi	r3, r4, #16, #16
	str	r3, [sp, #44]
	ldr	r3, [sp, #32]
	str	r3, [sp, #144]
	ldr	r3, [sp, #36]
	str	r3, [sp, #148]
	ldr	r3, [sp, #40]
	str	r3, [sp, #152]
	ldr	r3, [sp, #44]
	str	r3, [sp, #156]
	ldr	r3, [sp, #144]
	str	r3, [r0, #208]
	ldr	r3, [sp, #148]
	str	r3, [r0, #212]
	ldr	r3, [sp, #152]
	str	r3, [r0, #216]
	ldr	r3, [sp, #44]
	str	r3, [r0, #220]
	ldr	r3, [sp, #64]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #64]
	bfi	r3, r1, #16, #16
	str	r3, [sp, #48]
	ldr	r3, [sp, #68]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #68]
	bfi	r3, r1, #16, #16
	str	r3, [sp, #52]
	ldr	r3, [sp, #72]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #72]
	bfi	r3, r1, #16, #16
	str	r3, [sp, #56]
	ldr	r3, [sp, #76]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #128]
	bfi	r3, r1, #16, #16
	str	r3, [sp, #60]
	ldr	r3, [sp, #48]
	str	r3, [sp, #128]
	ldr	r3, [sp, #52]
	str	r3, [sp, #132]
	ldr	r3, [sp, #56]
	str	r3, [sp, #136]
	ldr	r3, [sp, #128]
	str	r3, [r0, #224]
	ldr	r3, [sp, #132]
	str	r3, [r0, #228]
	ldr	r3, [sp, #136]
	str	r3, [r0, #232]
	ldr	r3, [sp, #60]
	str	r3, [r0, #236]
	movs	r3, #0
	bfi	r3, r2, #0, #16
	asrs	r2, r5, #16
	bfi	r3, r8, #16, #16
	str	r3, [sp, #64]
	movs	r3, #0
	bfi	r3, r2, #0, #16
	asrs	r2, r6, #16
	bfi	r3, r5, #16, #16
	str	r3, [sp, #68]
	movs	r3, #0
	bfi	r3, r2, #0, #16
	asrs	r2, r7, #16
	bfi	r3, r6, #16, #16
	str	r3, [sp, #72]
	movs	r3, #0
	bfi	r3, r2, #0, #16
	bfi	r3, r7, #16, #16
	str	r3, [sp, #76]
	ldr	r3, [sp, #64]
	str	r3, [sp, #112]
	ldr	r3, [sp, #68]
	str	r3, [sp, #116]
	ldr	r3, [sp, #72]
	str	r3, [sp, #120]
	ldr	r2, [sp, #256]
	ldr	r3, [sp, #112]
	str	r3, [r0, #240]
	ldr	r3, [sp, #116]
	str	r3, [r2, #4]
	ldr	r3, [sp, #120]
	str	r3, [r2, #8]
	ldr	r3, [sp, #76]
	str	r3, [r2, #12]
	ldr	r2, [sp, #160]
	ldrd	r4, r5, [r0, #128]
	ldrd	r6, r7, [r0, #136]
	add	r2, r2, r4
	str	r2, [sp, #380]
	ldr	r2, [sp, #164]
	add	r2, r2, r5
	str	r2, [sp, #384]
	ldr	r2, [sp, #168]
	ldrd	r4, r5, [sp, #380]
	add	r2, r2, r6
	str	r2, [sp, #388]
	ldr	r2, [sp, #28]
	ldr	r6, [sp, #388]
	strd	r4, r5, [r0, #128]
	add	r2, r2, r7
	ldrd	r4, r5, [r0, #144]
	strd	r6, r2, [r0, #136]
	str	r2, [sp, #308]
	ldrd	r6, r7, [r0, #152]
	ldr	r2, [sp, #144]
	add	r2, r2, r4
	str	r2, [sp, #392]
	ldr	r2, [sp, #148]
	add	r2, r2, r5
	str	r2, [sp, #396]
	ldr	r2, [sp, #152]
	ldrd	r4, r5, [sp, #392]
	add	r2, r2, r6
	str	r2, [sp, #400]
	ldr	r2, [sp, #44]
	ldr	r6, [sp, #400]
	strd	r4, r5, [r0, #144]
	add	r2, r2, r7
	ldrd	r4, r5, [r0, #160]
	strd	r6, r2, [r0, #152]
	str	r2, [sp, #312]
	ldr	r2, [sp, #128]
	ldrd	r6, r7, [r0, #168]
	add	r2, r2, r4
	str	r2, [sp, #404]
	ldr	r2, [sp, #132]
	add	r2, r2, r5
	str	r2, [sp, #408]
	ldr	r2, [sp, #136]
	ldrd	r4, r5, [sp, #404]
	add	r2, r2, r6
	str	r2, [sp, #412]
	ldr	r2, [sp, #60]
	ldr	r6, [sp, #412]
	add	r2, r2, r7
	strd	r4, r5, [r0, #160]
	str	r2, [sp, #316]
	strd	r6, r2, [r0, #168]
	ldrd	r4, r5, [r0, #176]
	ldr	r2, [sp, #112]
	ldrd	r6, r7, [r0, #184]
	add	r2, r2, r4
	str	r2, [sp, #416]
	ldr	r2, [sp, #116]
	ldr	r3, [sp, #380]
	add	r2, r2, r5
	str	r2, [sp, #420]
	ldr	r2, [sp, #120]
	ldr	r1, [sp, #188]
	add	r2, r2, r6
	str	r2, [sp, #424]
	ldr	r2, [sp, #76]
	ldr	r6, [sp, #424]
	add	r2, r2, r7
	strd	r6, r2, [r0, #184]
	str	r2, [sp, #320]
	ldr	r2, [sp, #176]
	ldrd	r4, r5, [sp, #416]
	eors	r3, r3, r2
	ldr	r2, [sp, #180]
	str	r3, [sp, #324]
	ldr	r3, [sp, #384]
	strd	r4, r5, [r0, #176]
	eors	r3, r3, r2
	ldr	r2, [sp, #184]
	str	r3, [sp, #328]
	ldr	r3, [sp, #388]
	eors	r3, r3, r2
	str	r3, [sp, #436]
	ldr	r3, [sp, #308]
	ldrd	r4, r5, [sp, #324]
	eors	r1, r1, r3
	ldr	r2, [sp, #192]
	ldr	r3, [sp, #392]
	mov	r8, r4
	mov	r9, r5
	ldr	r6, [sp, #436]
	eors	r3, r3, r2
	ldr	r2, [sp, #196]
	str	r3, [sp, #440]
	mov	r10, r6
	ldr	r3, [sp, #396]
	lsr	lr, r1, #12
	eor	r1, lr, r1, lsl #20
	eors	r3, r3, r2
	ldr	r2, [sp, #200]
	str	r3, [sp, #444]
	mov	r7, r1
	ldr	r3, [sp, #400]
	ldrd	r4, r5, [sp, #440]
	eors	r3, r3, r2
	ldr	r2, [sp, #204]
	str	r3, [sp, #448]
	ldr	r3, [sp, #312]
	strd	r4, r5, [sp, #256]
	eors	r2, r2, r3
	ldr	r4, [sp, #208]
	ldr	r3, [sp, #404]
	ldr	r6, [sp, #448]
	eors	r3, r3, r4
	ldr	r4, [sp, #212]
	str	r3, [sp, #452]
	ldr	r3, [sp, #408]
	strd	r6, r2, [sp, #264]
	eors	r3, r3, r4
	ldr	r4, [sp, #216]
	str	r3, [sp, #456]
	ldr	r3, [sp, #412]
	eors	r3, r3, r4
	ldr	r4, [sp, #316]
	str	r3, [sp, #460]
	ldr	r3, [sp, #220]
	eors	r3, r3, r4
	ldrd	r4, r5, [sp, #452]
	strd	r4, r5, [sp, #192]
	ldr	r5, [sp, #224]
	ldr	r4, [sp, #416]
	ldr	r6, [sp, #460]
	eors	r4, r4, r5
	ldr	r5, [sp, #228]
	str	r4, [sp, #208]
	ldr	r4, [sp, #420]
	strd	r6, r3, [sp, #200]
	eors	r4, r4, r5
	ldr	r5, [sp, #232]
	str	r4, [sp, #468]
	ldr	r4, [sp, #424]
	eors	r4, r4, r5
	ldr	r5, [sp, #236]
	str	r4, [sp, #472]
	ldr	r4, [sp, #320]
	eor	ip, r4, r5
	ldr	r4, [sp, #208]
	ldrd	r5, r6, [sp, #468]
	strd	r4, r5, [sp, #176]
	lsr	r4, r8, #12
	lsr	r5, r9, #12
	mov	r8, r4
	ldr	r4, [sp, #324]
	str	r6, [sp, #184]
	lsr	r6, r10, #12
	eor	r4, r8, r4, lsl #20
	str	r4, [sp, #428]
	ldr	r4, [sp, #328]
	eor	r4, r5, r4, lsl #20
	str	r4, [sp, #432]
	ldr	r4, [sp, #436]
	eor	r4, r6, r4, lsl #20
	str	r4, [sp, #436]
	str	r1, [sp, #324]
	ldr	r1, [sp, #276]
	ldrd	r4, r5, [sp, #428]
	str	r4, [r0, #64]
	ldr	r6, [sp, #436]
	strd	r5, r6, [r1, #4]
	str	r7, [r1, #12]
	ldr	r1, [sp, #256]
	lsrs	r4, r1, #12
	ldr	r1, [sp, #260]
	lsrs	r5, r1, #12
	ldr	r1, [sp, #264]
	lsrs	r6, r1, #12
	lsrs	r1, r2, #12
	mov	fp, r1
	ldr	r1, [sp, #440]
	eor	r2, fp, r2, lsl #20
	str	r2, [sp, #328]
	mov	r7, r2
	ldr	r2, [sp, #280]
	eor	r1, r4, r1, lsl #20
	str	r1, [sp, #440]
	ldr	r1, [sp, #444]
	eor	r1, r5, r1, lsl #20
	str	r1, [sp, #444]
	ldr	r1, [sp, #448]
	ldrd	r4, r5, [sp, #440]
	str	r4, [r0, #80]
	eor	r1, r6, r1, lsl #20
	str	r7, [r2, #12]
	strd	r5, r1, [r2, #4]
	ldr	r2, [sp, #192]
	str	r1, [sp, #448]
	lsrs	r4, r2, #12
	ldr	r2, [sp, #196]
	lsrs	r5, r2, #12
	ldr	r2, [sp, #200]
	lsrs	r6, r2, #12
	lsrs	r2, r3, #12
	mov	fp, r2
	ldr	r2, [sp, #452]
	eor	r3, fp, r3, lsl #20
	mov	r7, r3
	eor	r2, r4, r2, lsl #20
	str	r2, [sp, #452]
	ldr	r2, [sp, #456]
	eor	r2, r5, r2, lsl #20
	str	r2, [sp, #456]
	ldr	r2, [sp, #460]
	str	r3, [sp, #280]
	ldr	r3, [sp, #284]
	ldrd	r4, r5, [sp, #452]
	str	r4, [r0, #96]
	eor	r2, r6, r2, lsl #20
	str	r7, [r3, #12]
	strd	r5, r2, [r3, #4]
	ldr	r3, [sp, #176]
	ldr	r1, [sp]
	str	r2, [sp, #460]
	lsrs	r4, r3, #12
	ldr	r3, [sp, #180]
	lsrs	r5, r3, #12
	ldr	r3, [sp, #184]
	lsrs	r6, r3, #12
	mov	r3, ip
	lsrs	r3, r3, #12
	mov	fp, r3
	ldr	r3, [sp, #208]
	eor	r3, r4, r3, lsl #20
	str	r3, [sp, #464]
	ldr	r3, [sp, #468]
	eor	r3, r5, r3, lsl #20
	str	r3, [sp, #468]
	ldr	r3, [sp, #472]
	ldrd	r4, r5, [sp, #464]
	str	r4, [r0, #112]
	eor	r3, r6, r3, lsl #20
	str	r3, [sp, #472]
	eor	r3, fp, ip, lsl #20
	str	r3, [sp, #284]
	mov	r7, r3
	ldr	r3, [sp, #288]
	ldr	r6, [sp, #472]
	str	r7, [r3, #12]
	strd	r5, r6, [r3, #4]
	ldr	r3, [sp, #272]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r4, [r1, r2]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #332]
	add	r3, r3, r4
	str	r3, [sp, #208]
	ldr	r3, [sp, #336]
	ldr	r4, [sp, #208]
	add	r3, r3, r5
	str	r3, [sp, #224]
	ldr	r3, [sp, #340]
	ldr	r5, [sp, #224]
	add	r3, r3, r6
	str	r3, [sp, #256]
	ldr	r3, [sp, #292]
	ldr	r6, [sp, #256]
	add	r3, r3, r7
	strd	r6, r3, [r0, #8]
	str	r3, [sp, #192]
	ldr	r3, [sp, #272]
	strd	r4, r5, [r0]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r4, [r1, r2]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #344]
	add	fp, r3, r4
	ldr	r3, [sp, #348]
	str	fp, [r0, #16]
	add	r10, r3, r5
	ldr	r3, [sp, #352]
	add	ip, r3, r6
	ldr	r3, [sp, #296]
	adds	r2, r3, r7
	ldr	r3, [sp, #80]
	strd	r10, ip, [r3, #4]
	str	r2, [r3, #12]
	ldr	r3, [sp, #272]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	lsl	lr, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r4, [r1, lr]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #356]
	ldr	r1, [sp, #96]
	add	r9, r3, r4
	ldr	r3, [sp, #360]
	str	r9, [r0, #32]
	add	r8, r3, r5
	ldr	r3, [sp, #364]
	add	lr, r3, r6
	ldr	r3, [sp, #300]
	strd	r8, lr, [r1, #4]
	add	r3, r3, r7
	str	r3, [r1, #12]
	ldr	r1, [sp, #272]
	ldrb	r4, [r1, #7]	@ zero_extendqisi2
	ldr	r1, [sp]
	lsls	r5, r4, #4
	add	r4, r1, r4, lsl #4
	ldr	r1, [r1, r5]
	str	r1, [sp, #176]
	ldr	r1, [r4, #4]
	str	r1, [sp, #180]
	ldr	r1, [r4, #8]
	str	r1, [sp, #184]
	ldr	r1, [r4, #12]
	str	r1, [sp, #188]
	ldr	r4, [sp, #208]
	ldr	r1, [sp, #428]
	add	r1, r1, r4
	ldr	r4, [sp, #224]
	str	r1, [sp, #340]
	ldr	r1, [sp, #432]
	add	r1, r1, r4
	str	r1, [sp, #344]
	ldr	r4, [sp, #256]
	ldr	r1, [sp, #436]
	add	r1, r1, r4
	ldr	r4, [sp, #192]
	str	r1, [sp, #348]
	ldr	r1, [sp, #324]
	ldr	r6, [sp, #348]
	add	r1, r1, r4
	strd	r6, r1, [r0, #8]
	str	r1, [sp, #288]
	ldr	r1, [sp, #440]
	ldrd	r4, r5, [sp, #340]
	add	r1, r1, fp
	str	r1, [sp, #352]
	ldr	r1, [sp, #444]
	strd	r4, r5, [r0]
	add	r1, r1, r10
	str	r1, [sp, #356]
	ldr	r1, [sp, #448]
	ldrd	r4, r5, [sp, #352]
	add	r1, r1, ip
	str	r1, [sp, #360]
	ldr	r1, [sp, #328]
	ldr	r6, [sp, #360]
	adds	r2, r1, r2
	str	r2, [sp, #292]
	mov	r7, r2
	ldr	r2, [sp, #80]
	str	r4, [r0, #16]
	strd	r5, r6, [r2, #4]
	str	r7, [r2, #12]
	ldr	r2, [sp, #452]
	add	r2, r2, r9
	str	r2, [sp, #364]
	ldr	r2, [sp, #456]
	add	r2, r2, r8
	str	r2, [sp, #476]
	ldr	r2, [sp, #460]
	ldr	r4, [sp, #364]
	add	r2, r2, lr
	str	r2, [sp, #480]
	ldr	r2, [sp, #280]
	ldrd	r5, r6, [sp, #476]
	adds	r3, r2, r3
	mov	r7, r3
	str	r3, [sp, #296]
	ldr	r3, [sp, #96]
	str	r4, [r0, #32]
	ldr	r2, [sp, #176]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #368]
	add	r3, r3, r2
	ldr	r2, [sp, #464]
	add	r3, r3, r2
	ldr	r2, [sp, #180]
	str	r3, [sp, #368]
	ldr	r3, [sp, #372]
	add	r9, r3, r2
	ldr	r3, [sp, #468]
	ldr	r2, [sp, #184]
	add	r3, r9, r3
	str	r3, [sp, #372]
	ldr	r3, [sp, #376]
	ldrd	r4, r5, [sp, #368]
	add	r8, r3, r2
	ldr	r3, [sp, #472]
	ldr	r2, [sp, #304]
	add	r3, r8, r3
	str	r3, [sp, #376]
	ldr	r3, [sp, #188]
	ldr	r6, [sp, #376]
	add	r3, r3, r2
	ldr	r2, [sp, #284]
	str	r4, [r0, #48]
	add	r3, r3, r2
	str	r3, [sp, #300]
	mov	r7, r3
	ldr	r3, [sp, #240]
	ldr	r2, [sp, #160]
	ldr	r1, [sp, #144]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #340]
	eors	r3, r3, r2
	ldr	r2, [sp, #164]
	str	r3, [sp, #176]
	ldr	r3, [sp, #344]
	ldr	r4, [sp, #176]
	eors	r3, r3, r2
	ldr	r2, [sp, #348]
	str	r3, [sp, #192]
	mov	r8, r4
	ldr	r3, [sp, #168]
	ldr	r5, [sp, #192]
	eors	r3, r3, r2
	ldr	r2, [sp, #28]
	str	r3, [sp, #208]
	mov	r9, r5
	ldr	r3, [sp, #288]
	ldr	r6, [sp, #208]
	eors	r2, r2, r3
	ldr	r3, [sp, #352]
	mov	r10, r6
	eors	r3, r3, r1
	ldr	r1, [sp, #148]
	str	r3, [sp, #224]
	lsr	lr, r2, #8
	ldr	r3, [sp, #356]
	eor	r2, lr, r2, lsl #24
	ldr	r4, [sp, #224]
	eors	r3, r3, r1
	ldr	r1, [sp, #360]
	str	r3, [sp, #256]
	ldr	r3, [sp, #152]
	ldr	r5, [sp, #256]
	eors	r3, r3, r1
	ldr	r1, [sp, #292]
	str	r3, [sp, #276]
	ldr	r3, [sp, #44]
	ldr	r6, [sp, #276]
	eors	r3, r3, r1
	strd	r4, r5, [sp, #160]
	ldr	r1, [sp, #364]
	ldr	r4, [sp, #128]
	strd	r6, r3, [sp, #168]
	eors	r1, r1, r4
	ldr	r4, [sp, #132]
	str	r1, [sp, #304]
	ldr	r1, [sp, #476]
	eors	r1, r1, r4
	ldr	r4, [sp, #480]
	str	r1, [sp, #332]
	ldr	r1, [sp, #136]
	ldr	r5, [sp, #332]
	eors	r1, r1, r4
	ldr	r4, [sp, #60]
	str	r1, [sp, #128]
	ldr	r1, [sp, #296]
	ldr	r6, [sp, #128]
	eor	ip, r1, r4
	ldr	r4, [sp, #304]
	strd	r4, r5, [sp, #32]
	ldr	r1, [sp, #368]
	ldr	r4, [sp, #112]
	str	r6, [sp, #40]
	eors	r1, r1, r4
	ldr	r4, [sp, #116]
	str	r1, [sp, #48]
	ldr	r1, [sp, #372]
	eors	r1, r1, r4
	ldr	r4, [sp, #376]
	str	r1, [sp, #336]
	ldr	r1, [sp, #120]
	eors	r1, r1, r4
	str	r1, [sp, #528]
	ldr	r1, [sp, #76]
	ldr	r4, [sp, #300]
	ldr	r5, [sp, #336]
	eors	r1, r1, r4
	ldr	r4, [sp, #48]
	strd	r4, r5, [sp, #16]
	lsr	r4, r8, #8
	mov	r8, r4
	ldr	r4, [sp, #176]
	lsr	r5, r9, #8
	ldr	r6, [sp, #528]
	str	r2, [sp, #64]
	add	r2, r0, #192
	eor	r4, r8, r4, lsl #24
	str	r4, [sp, #484]
	ldr	r4, [sp, #192]
	str	r6, [sp, #24]
	lsr	r6, r10, #8
	ldr	r7, [sp, #64]
	eor	r4, r5, r4, lsl #24
	str	r4, [sp, #488]
	ldr	r4, [sp, #208]
	str	r2, [sp, #144]
	eor	r4, r6, r4, lsl #24
	str	r4, [sp, #492]
	ldr	r6, [sp, #492]
	ldrd	r4, r5, [sp, #484]
	str	r4, [r0, #192]
	strd	r5, r6, [r2, #4]
	str	r7, [r2, #12]
	ldr	r2, [sp, #160]
	lsrs	r4, r2, #8
	ldr	r2, [sp, #164]
	lsrs	r5, r2, #8
	ldr	r2, [sp, #168]
	lsrs	r6, r2, #8
	lsrs	r2, r3, #8
	mov	fp, r2
	ldr	r2, [sp, #224]
	eor	r3, fp, r3, lsl #24
	eor	r2, r4, r2, lsl #24
	str	r2, [sp, #496]
	ldr	r2, [sp, #256]
	eor	r2, r5, r2, lsl #24
	str	r2, [sp, #500]
	ldr	r2, [sp, #276]
	eor	r2, r6, r2, lsl #24
	str	r2, [sp, #504]
	str	r3, [sp, #112]
	add	r3, r0, #208
	ldrd	r4, r5, [sp, #496]
	str	r4, [r0, #208]
	ldr	r7, [sp, #112]
	strd	r5, r2, [r3, #4]
	str	r7, [r3, #12]
	str	r3, [sp, #160]
	ldr	r3, [sp, #32]
	lsrs	r4, r3, #8
	ldr	r3, [sp, #36]
	lsrs	r5, r3, #8
	ldr	r3, [sp, #40]
	lsrs	r6, r3, #8
	mov	r3, ip
	lsrs	r3, r3, #8
	mov	fp, r3
	ldr	r3, [sp, #304]
	eor	r3, r4, r3, lsl #24
	str	r3, [sp, #508]
	ldr	r3, [sp, #332]
	eor	r3, r5, r3, lsl #24
	str	r3, [sp, #512]
	ldr	r3, [sp, #128]
	ldrd	r4, r5, [sp, #508]
	str	r4, [r0, #224]
	eor	r3, r6, r3, lsl #24
	str	r3, [sp, #516]
	eor	r3, fp, ip, lsl #24
	str	r3, [sp, #128]
	add	r3, r0, #224
	ldr	r6, [sp, #516]
	ldr	r7, [sp, #128]
	str	r3, [sp, #176]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #16]
	lsrs	r4, r3, #8
	ldr	r3, [sp, #20]
	lsrs	r5, r3, #8
	ldr	r3, [sp, #24]
	lsrs	r6, r3, #8
	lsrs	r3, r1, #8
	mov	fp, r3
	ldr	r3, [sp, #48]
	eor	r3, r4, r3, lsl #24
	str	r3, [sp, #520]
	ldr	r3, [sp, #336]
	ldr	r2, [sp, #484]
	eor	r3, r5, r3, lsl #24
	str	r3, [sp, #524]
	ldr	r3, [sp, #528]
	ldrd	r4, r5, [sp, #520]
	str	r4, [r0, #240]
	eor	r3, r6, r3, lsl #24
	str	r3, [sp, #528]
	eor	r3, fp, r1, lsl #24
	str	r3, [sp, #304]
	add	r3, r0, #240
	ldr	r6, [sp, #528]
	ldr	r7, [sp, #304]
	str	r3, [sp, #192]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #380]
	add	r3, r3, r2
	ldr	r2, [sp, #488]
	str	r3, [sp, #380]
	ldr	r3, [sp, #384]
	add	r3, r3, r2
	ldr	r2, [sp, #492]
	str	r3, [sp, #384]
	ldr	r3, [sp, #388]
	ldrd	r4, r5, [sp, #380]
	add	r3, r3, r2
	ldr	r2, [sp, #64]
	str	r3, [sp, #388]
	ldr	r3, [sp, #308]
	ldr	r6, [sp, #388]
	add	r3, r3, r2
	str	r3, [sp, #308]
	add	r3, r0, #128
	ldr	r7, [sp, #308]
	str	r3, [sp, #208]
	str	r4, [r0, #128]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r2, [sp, #496]
	ldr	r3, [sp, #392]
	add	r3, r3, r2
	ldr	r2, [sp, #500]
	str	r3, [sp, #392]
	ldr	r3, [sp, #396]
	add	r3, r3, r2
	ldr	r2, [sp, #504]
	str	r3, [sp, #396]
	ldr	r3, [sp, #400]
	ldrd	r4, r5, [sp, #392]
	add	r3, r3, r2
	ldr	r2, [sp, #112]
	str	r3, [sp, #400]
	ldr	r3, [sp, #312]
	ldr	r6, [sp, #400]
	add	r3, r3, r2
	str	r3, [sp, #312]
	add	r3, r0, #144
	ldr	r7, [sp, #312]
	str	r4, [r0, #144]
	ldr	r2, [sp, #508]
	strd	r5, r6, [r3, #4]
	str	r3, [sp, #224]
	str	r7, [r3, #12]
	ldr	r3, [sp, #404]
	add	r3, r3, r2
	ldr	r2, [sp, #512]
	str	r3, [sp, #404]
	ldr	r3, [sp, #408]
	add	r3, r3, r2
	ldr	r2, [sp, #516]
	str	r3, [sp, #408]
	ldr	r3, [sp, #412]
	add	r3, r3, r2
	str	r3, [sp, #412]
	ldr	r3, [sp, #316]
	b	.L28
.L29:
	.align	2
.L27:
	.word	.LANCHOR0-(.LPIC0+4)
.L28:
	ldr	r2, [sp, #128]
	ldrd	r4, r5, [sp, #404]
	add	r3, r3, r2
	str	r3, [sp, #316]
	add	r3, r0, #160
	ldr	r6, [sp, #412]
	ldr	r7, [sp, #316]
	str	r4, [r0, #160]
	ldr	r2, [sp, #520]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	str	r3, [sp, #256]
	ldr	r3, [sp, #416]
	add	r3, r3, r2
	ldr	r2, [sp, #524]
	str	r3, [sp, #416]
	ldr	r3, [sp, #420]
	add	r3, r3, r2
	ldr	r2, [sp, #528]
	str	r3, [sp, #420]
	ldr	r3, [sp, #424]
	ldrd	r4, r5, [sp, #416]
	add	r3, r3, r2
	ldr	r2, [sp, #304]
	str	r3, [sp, #424]
	ldr	r3, [sp, #320]
	ldr	r6, [sp, #424]
	add	r3, r3, r2
	str	r3, [sp, #320]
	add	r3, r0, #176
	ldr	r7, [sp, #320]
	str	r4, [r0, #176]
	str	r3, [sp, #276]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r2, [sp, #380]
	ldr	r3, [sp, #428]
	ldr	r1, [sp, #388]
	eors	r3, r3, r2
	ldr	r2, [sp, #384]
	str	r3, [sp, #332]
	ldr	r3, [sp, #432]
	ldr	r4, [sp, #332]
	eors	r3, r3, r2
	ldr	r2, [sp, #436]
	mov	r8, r4
	ldr	r4, [sp, #392]
	eors	r2, r2, r1
	ldr	r1, [sp, #308]
	str	r2, [sp, #436]
	ldr	r2, [sp, #324]
	ldr	r6, [sp, #436]
	eors	r1, r1, r2
	ldr	r2, [sp, #440]
	mov	r10, r6
	str	r3, [sp, #336]
	eors	r2, r2, r4
	ldr	r4, [sp, #396]
	str	r2, [sp, #440]
	ldr	r2, [sp, #444]
	eors	r2, r2, r4
	ldr	r4, [sp, #400]
	str	r2, [sp, #444]
	ldr	r2, [sp, #448]
	eors	r2, r2, r4
	ldr	r4, [sp, #312]
	str	r2, [sp, #448]
	ldr	r2, [sp, #328]
	ldr	r6, [sp, #448]
	eors	r2, r2, r4
	str	r6, [sp, #56]
	ldrd	r4, r5, [sp, #440]
	strd	r4, r5, [sp, #48]
	ldr	r4, [sp, #452]
	ldr	r5, [sp, #404]
	eors	r4, r4, r5
	ldr	r5, [sp, #408]
	str	r4, [sp, #452]
	ldr	r4, [sp, #456]
	eors	r4, r4, r5
	ldr	r5, [sp, #412]
	str	r4, [sp, #456]
	ldr	r4, [sp, #460]
	eors	r4, r4, r5
	ldr	r5, [sp, #316]
	str	r4, [sp, #460]
	ldr	r4, [sp, #280]
	ldr	r6, [sp, #460]
	eor	lr, r4, r5
	str	r6, [sp, #40]
	ldrd	r4, r5, [sp, #452]
	strd	r4, r5, [sp, #32]
	ldr	r4, [sp, #464]
	ldr	r5, [sp, #416]
	eors	r4, r4, r5
	ldr	r5, [sp, #420]
	str	r4, [sp, #464]
	ldr	r4, [sp, #468]
	eors	r4, r4, r5
	ldr	r5, [sp, #424]
	str	r4, [sp, #468]
	ldr	r4, [sp, #472]
	eors	r4, r4, r5
	ldr	r5, [sp, #320]
	str	r4, [sp, #472]
	ldr	r4, [sp, #284]
	ldr	r6, [sp, #472]
	eor	ip, r4, r5
	ldrd	r4, r5, [sp, #464]
	strd	r4, r5, [sp, #16]
	lsrs	r5, r3, #7
	lsrs	r3, r1, #7
	mov	fp, r3
	ldr	r3, [sp, #332]
	lsr	r4, r8, #7
	str	r6, [sp, #24]
	lsr	r6, r10, #7
	eor	r3, r4, r3, lsl #25
	str	r3, [sp, #428]
	ldr	r3, [sp, #336]
	eor	r3, r5, r3, lsl #25
	str	r3, [sp, #432]
	ldr	r3, [sp, #436]
	ldrd	r4, r5, [sp, #428]
	strd	r4, r5, [r0, #64]
	eor	r3, r6, r3, lsl #25
	str	r3, [sp, #436]
	eor	r3, fp, r1, lsl #25
	str	r3, [sp, #324]
	ldr	r3, [sp, #48]
	ldr	r6, [sp, #436]
	str	r6, [r0, #72]
	lsrs	r4, r3, #7
	ldr	r3, [sp, #52]
	ldr	r7, [sp, #324]
	str	r7, [r0, #76]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #56]
	lsrs	r6, r3, #7
	lsrs	r3, r2, #7
	mov	fp, r3
	ldr	r3, [sp, #440]
	eor	r3, r4, r3, lsl #25
	str	r3, [sp, #440]
	ldr	r3, [sp, #444]
	eor	r3, r5, r3, lsl #25
	str	r3, [sp, #444]
	ldr	r3, [sp, #448]
	ldrd	r4, r5, [sp, #440]
	eor	r3, r6, r3, lsl #25
	str	r3, [sp, #448]
	eor	r3, fp, r2, lsl #25
	str	r3, [sp, #328]
	add	r3, r0, #80
	ldr	r6, [sp, #448]
	ldr	r7, [sp, #328]
	str	r3, [sp, #280]
	str	r4, [r0, #80]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #32]
	lsrs	r4, r3, #7
	ldr	r3, [sp, #36]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #40]
	lsrs	r6, r3, #7
	mov	r3, lr
	lsrs	r3, r3, #7
	mov	fp, r3
	ldr	r3, [sp, #452]
	eor	r3, r4, r3, lsl #25
	str	r3, [sp, #452]
	ldr	r3, [sp, #456]
	eor	r3, r5, r3, lsl #25
	str	r3, [sp, #456]
	ldr	r3, [sp, #460]
	ldrd	r4, r5, [sp, #452]
	str	r4, [r0, #96]
	eor	r3, r6, r3, lsl #25
	str	r3, [sp, #460]
	eor	r3, fp, lr, lsl #25
	str	r3, [sp, #332]
	add	r3, r0, #96
	ldr	r6, [sp, #460]
	ldr	r7, [sp, #332]
	str	r3, [sp, #284]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #16]
	lsrs	r4, r3, #7
	ldr	r3, [sp, #20]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #24]
	lsrs	r6, r3, #7
	mov	r3, ip
	lsrs	r3, r3, #7
	mov	fp, r3
	ldr	r3, [sp, #464]
	eor	r3, r4, r3, lsl #25
	str	r3, [sp, #464]
	ldr	r3, [sp, #468]
	eor	r3, r5, r3, lsl #25
	str	r3, [sp, #468]
	ldr	r3, [sp, #472]
	eor	r3, r6, r3, lsl #25
	str	r3, [sp, #472]
	eor	r3, fp, ip, lsl #25
	str	r3, [sp, #336]
	ldrd	r4, r5, [sp, #464]
	strd	r4, r5, [r0, #112]
	ldr	r3, [sp, #272]
	ldr	r1, [sp]
	ldr	r6, [sp, #472]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	ldr	r7, [sp, #336]
	str	r6, [r0, #120]
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	str	r7, [r0, #124]
	ldr	r4, [r1, r2]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #340]
	add	r3, r3, r4
	str	r3, [sp, #48]
	ldr	r3, [sp, #344]
	ldr	r4, [sp, #48]
	add	r3, r3, r5
	str	r3, [sp, #344]
	ldr	r3, [sp, #348]
	add	r3, r3, r6
	str	r3, [sp, #348]
	ldr	r3, [sp, #288]
	ldrd	r5, r6, [sp, #344]
	add	r3, r3, r7
	strd	r6, r3, [r0, #8]
	str	r3, [sp, #32]
	ldr	r3, [sp, #272]
	strd	r4, r5, [r0]
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r4, [r1, r2]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #352]
	add	fp, r3, r4
	ldr	r3, [sp, #356]
	str	fp, [r0, #16]
	add	r10, r3, r5
	ldr	r3, [sp, #360]
	add	ip, r3, r6
	ldr	r3, [sp, #292]
	adds	r2, r3, r7
	ldr	r3, [sp, #80]
	strd	r10, ip, [r3, #4]
	str	r2, [r3, #12]
	ldr	r3, [sp, #272]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	lsl	lr, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r4, [r1, lr]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #364]
	ldr	r1, [sp, #96]
	add	r9, r3, r4
	ldr	r3, [sp, #476]
	str	r9, [r0, #32]
	add	r8, r3, r5
	ldr	r3, [sp, #480]
	add	lr, r3, r6
	ldr	r3, [sp, #296]
	strd	r8, lr, [r1, #4]
	add	r3, r3, r7
	str	r3, [r1, #12]
	ldr	r1, [sp, #272]
	ldrb	r4, [r1, #14]	@ zero_extendqisi2
	ldr	r1, [sp]
	lsls	r5, r4, #4
	add	r4, r1, r4, lsl #4
	ldr	r1, [r1, r5]
	str	r1, [sp, #16]
	ldr	r1, [r4, #4]
	str	r1, [sp, #20]
	ldr	r1, [r4, #8]
	str	r1, [sp, #24]
	ldr	r1, [r4, #12]
	str	r1, [sp, #28]
	ldr	r4, [sp, #48]
	ldr	r1, [sp, #440]
	add	r1, r1, r4
	ldr	r4, [sp, #344]
	str	r1, [sp, #340]
	ldr	r1, [sp, #444]
	add	r1, r1, r4
	ldr	r4, [sp, #348]
	str	r1, [sp, #344]
	ldr	r1, [sp, #448]
	add	r1, r1, r4
	ldr	r4, [sp, #32]
	str	r1, [sp, #348]
	ldr	r1, [sp, #328]
	ldr	r6, [sp, #348]
	add	r1, r1, r4
	strd	r6, r1, [r0, #8]
	str	r1, [sp, #272]
	ldr	r1, [sp, #452]
	ldrd	r4, r5, [sp, #340]
	add	r1, r1, fp
	str	r1, [sp, #352]
	ldr	r1, [sp, #456]
	strd	r4, r5, [r0]
	add	r1, r1, r10
	str	r1, [sp, #356]
	ldr	r1, [sp, #460]
	add	r1, r1, ip
	str	r1, [sp, #360]
	ldr	r1, [sp, #332]
	ldrd	r4, r5, [sp, #352]
	adds	r2, r1, r2
	mov	r7, r2
	str	r2, [sp, #288]
	ldr	r2, [sp, #80]
	ldr	r6, [sp, #360]
	str	r4, [r0, #16]
	strd	r5, r6, [r2, #4]
	str	r7, [r2, #12]
	ldr	r2, [sp, #464]
	add	r2, r2, r9
	str	r2, [sp, #364]
	ldr	r2, [sp, #468]
	ldr	r4, [sp, #364]
	add	r2, r2, r8
	str	r2, [sp, #476]
	ldr	r2, [sp, #472]
	ldr	r5, [sp, #476]
	add	lr, lr, r2
	ldr	r2, [sp, #336]
	str	r4, [r0, #32]
	adds	r3, r2, r3
	str	r3, [sp, #292]
	mov	r7, r3
	ldr	r3, [sp, #96]
	ldr	r2, [sp, #16]
	strd	r5, lr, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #368]
	add	r3, r3, r2
	ldr	r2, [sp, #428]
	add	r3, r3, r2
	ldr	r2, [sp, #20]
	str	r3, [sp, #368]
	ldr	r3, [sp, #372]
	add	r9, r3, r2
	ldr	r3, [sp, #432]
	add	r3, r9, r3
	str	r3, [sp, #372]
	ldr	r3, [sp, #376]
	ldr	r2, [sp, #24]
	ldrd	r4, r5, [sp, #368]
	add	r8, r3, r2
	ldr	r3, [sp, #436]
	ldr	r2, [sp, #300]
	add	r3, r8, r3
	str	r3, [sp, #376]
	ldr	r3, [sp, #28]
	ldr	r6, [sp, #376]
	add	r3, r3, r2
	ldr	r2, [sp, #324]
	str	r4, [r0, #48]
	add	r3, r3, r2
	str	r3, [sp, #296]
	mov	r7, r3
	ldr	r3, [sp, #240]
	ldr	r2, [sp, #340]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #520]
	eor	r4, r3, r2
	ldr	r3, [sp, #524]
	ldr	r2, [sp, #344]
	mov	r8, r4
	eor	r5, r3, r2
	ldr	r3, [sp, #528]
	ldr	r2, [sp, #348]
	mov	r9, r5
	eor	r6, r3, r2
	ldr	r3, [sp, #304]
	ldr	r2, [sp, #272]
	mov	r10, r6
	eor	r1, r3, r2
	ldr	r3, [sp, #484]
	ldr	r2, [sp, #352]
	eor	r4, r3, r2
	ldr	r3, [sp, #488]
	ldr	r2, [sp, #356]
	eor	r5, r3, r2
	ldr	r3, [sp, #492]
	ldr	r2, [sp, #360]
	eor	r6, r3, r2
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #288]
	strd	r4, r5, [sp, #48]
	eors	r2, r2, r3
	ldr	r3, [sp, #496]
	str	r6, [sp, #56]
	mov	ip, r3
	ldr	r3, [sp, #364]
	eor	r4, ip, r3
	ldr	r3, [sp, #500]
	mov	ip, r3
	ldr	r3, [sp, #476]
	eor	r5, ip, r3
	ldr	r3, [sp, #504]
	strd	r4, r5, [sp, #64]
	eor	r6, r3, lr
	ldr	r3, [sp, #112]
	mov	ip, r3
	ldr	r3, [sp, #292]
	eor	r3, ip, r3
	strd	r6, r3, [sp, #72]
	str	r3, [sp, #96]
	ldr	r3, [sp, #508]
	mov	ip, r3
	ldr	r3, [sp, #368]
	eor	r4, ip, r3
	ldr	r3, [sp, #512]
	str	r4, [sp, #80]
	asr	r4, r8, #16
	mov	ip, r3
	ldr	r3, [sp, #372]
	eor	r5, ip, r3
	ldr	r3, [sp, #516]
	mov	ip, r3
	ldr	r3, [sp, #376]
	eor	r6, ip, r3
	ldr	r3, [sp, #128]
	mov	ip, r3
	ldr	r3, [sp, #296]
	eor	ip, ip, r3
	movs	r3, #0
	mov	r7, ip
	bfi	r3, r4, #0, #16
	asr	r4, r9, #16
	bfi	r3, r8, #16, #16
	str	r3, [sp, #16]
	movs	r3, #0
	bfi	r3, r4, #0, #16
	asr	r4, r10, #16
	bfi	r3, r9, #16, #16
	str	r3, [sp, #20]
	movs	r3, #0
	bfi	r3, r4, #0, #16
	asrs	r4, r1, #16
	bfi	r3, r10, #16, #16
	str	r3, [sp, #24]
	movs	r3, #0
	bfi	r3, r4, #0, #16
	bfi	r3, r1, #16, #16
	str	r3, [sp, #28]
	ldr	r3, [sp, #16]
	str	r3, [sp, #128]
	ldr	r3, [sp, #20]
	str	r3, [sp, #132]
	ldr	r3, [sp, #24]
	str	r3, [sp, #136]
	ldr	r3, [sp, #28]
	str	r3, [sp, #140]
	ldr	r3, [sp, #128]
	str	r3, [r0, #240]
	ldr	r3, [sp, #192]
	mov	r1, r3
	ldr	r3, [sp, #132]
	str	r3, [r1, #4]
	ldr	r3, [sp, #136]
	str	r3, [r1, #8]
	ldr	r3, [sp, #28]
	str	r3, [r1, #12]
	ldr	r3, [sp, #48]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #48]
	bfi	r3, r1, #16, #16
	str	r3, [sp, #32]
	ldr	r3, [sp, #52]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #52]
	bfi	r3, r1, #16, #16
	str	r3, [sp, #36]
	ldr	r3, [sp, #56]
	asrs	r1, r3, #16
	movs	r3, #0
	bfi	r3, r1, #0, #16
	ldr	r1, [sp, #56]
	bfi	r3, r1, #16, #16
	asrs	r1, r2, #16
	str	r3, [sp, #40]
	movs	r3, #0
	bfi	r3, r1, #0, #16
	bfi	r3, r2, #16, #16
	str	r3, [sp, #44]
	ldr	r3, [sp, #32]
	str	r3, [sp, #112]
	ldr	r3, [sp, #36]
	str	r3, [sp, #116]
	ldr	r3, [sp, #40]
	str	r3, [sp, #120]
	ldr	r3, [sp, #44]
	str	r3, [sp, #124]
	ldr	r3, [sp, #112]
	str	r3, [r0, #192]
	ldr	r3, [sp, #144]
	mov	r2, r3
	ldr	r3, [sp, #116]
	str	r3, [r2, #4]
	ldr	r3, [sp, #120]
	str	r3, [r2, #8]
	ldr	r3, [sp, #44]
	str	r3, [r2, #12]
	ldr	r3, [sp, #64]
	asrs	r2, r3, #16
	movs	r3, #0
	bfi	r3, r2, #0, #16
	ldr	r2, [sp, #64]
	bfi	r3, r2, #16, #16
	str	r3, [sp, #48]
	ldr	r3, [sp, #68]
	asrs	r2, r3, #16
	movs	r3, #0
	bfi	r3, r2, #0, #16
	ldr	r2, [sp, #68]
	bfi	r3, r2, #16, #16
	str	r3, [sp, #52]
	ldr	r3, [sp, #72]
	asrs	r2, r3, #16
	movs	r3, #0
	bfi	r3, r2, #0, #16
	ldr	r2, [sp, #72]
	bfi	r3, r2, #16, #16
	str	r3, [sp, #56]
	ldr	r3, [sp, #76]
	asrs	r2, r3, #16
	movs	r3, #0
	bfi	r3, r2, #0, #16
	ldr	r2, [sp, #96]
	bfi	r3, r2, #16, #16
	str	r3, [sp, #60]
	ldr	r3, [sp, #48]
	str	r3, [sp, #96]
	ldr	r3, [sp, #52]
	str	r3, [sp, #100]
	ldr	r3, [sp, #56]
	str	r3, [sp, #104]
	ldr	r3, [sp, #60]
	str	r3, [sp, #108]
	ldr	r3, [sp, #96]
	str	r3, [r0, #208]
	ldr	r3, [sp, #160]
	mov	r2, r3
	ldr	r3, [sp, #100]
	str	r3, [r2, #4]
	ldr	r3, [sp, #104]
	str	r3, [r2, #8]
	ldr	r3, [sp, #60]
	str	r3, [r2, #12]
	movs	r2, #0
	ldr	r3, [sp, #80]
	asrs	r3, r3, #16
	bfi	r2, r3, #0, #16
	mov	r3, r2
	ldr	r2, [sp, #80]
	bfi	r3, r2, #16, #16
	movs	r2, #0
	str	r3, [sp, #64]
	asrs	r3, r5, #16
	bfi	r2, r3, #0, #16
	mov	r3, r2
	movs	r2, #0
	bfi	r3, r5, #16, #16
	str	r3, [sp, #68]
	asrs	r3, r6, #16
	bfi	r2, r3, #0, #16
	mov	r3, r2
	movs	r2, #0
	bfi	r3, r6, #16, #16
	str	r3, [sp, #72]
	asrs	r3, r7, #16
	bfi	r2, r3, #0, #16
	mov	r3, r2
	bfi	r3, ip, #16, #16
	str	r3, [sp, #76]
	ldr	r3, [sp, #64]
	str	r3, [sp, #80]
	ldr	r3, [sp, #68]
	str	r3, [sp, #84]
	ldr	r3, [sp, #72]
	str	r3, [sp, #88]
	ldr	r3, [sp, #76]
	str	r3, [sp, #92]
	ldr	r3, [sp, #80]
	str	r3, [r0, #224]
	ldr	r3, [sp, #176]
	mov	r2, r3
	ldr	r3, [sp, #84]
	str	r3, [r2, #4]
	ldr	r3, [sp, #88]
	str	r3, [r2, #8]
	ldr	r3, [sp, #76]
	str	r3, [r2, #12]
	ldr	r3, [sp, #404]
	ldr	r2, [sp, #128]
	add	r3, r3, r2
	ldr	r2, [sp, #132]
	str	r3, [sp, #404]
	ldr	r3, [sp, #408]
	add	r3, r3, r2
	ldr	r2, [sp, #136]
	str	r3, [sp, #408]
	ldr	r3, [sp, #412]
	ldrd	r4, r5, [sp, #404]
	add	r3, r3, r2
	ldr	r2, [sp, #28]
	str	r3, [sp, #412]
	ldr	r3, [sp, #316]
	ldr	r6, [sp, #412]
	add	r3, r3, r2
	str	r3, [sp, #300]
	mov	r7, r3
	ldr	r3, [sp, #256]
	str	r4, [r0, #160]
	ldr	r2, [sp, #112]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #416]
	add	r3, r3, r2
	ldr	r2, [sp, #116]
	str	r3, [sp, #316]
	ldr	r3, [sp, #420]
	add	r3, r3, r2
	ldr	r2, [sp, #120]
	str	r3, [sp, #416]
	ldr	r3, [sp, #424]
	add	r3, r3, r2
	str	r3, [sp, #420]
	ldr	r3, [sp, #320]
	ldr	r2, [sp, #44]
	ldr	r4, [sp, #316]
	add	r3, r3, r2
	str	r3, [sp, #256]
	mov	r7, r3
	ldr	r3, [sp, #276]
	ldrd	r5, r6, [sp, #416]
	str	r4, [r0, #176]
	ldr	r2, [sp, #96]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #380]
	add	r3, r3, r2
	ldr	r2, [sp, #100]
	str	r3, [sp, #320]
	ldr	r3, [sp, #384]
	ldr	r4, [sp, #320]
	add	r3, r3, r2
	ldr	r2, [sp, #104]
	str	r3, [sp, #380]
	ldr	r3, [sp, #388]
	str	r4, [r0, #128]
	add	r3, r3, r2
	ldr	r2, [sp, #60]
	str	r3, [sp, #384]
	ldr	r3, [sp, #308]
	ldrd	r5, r6, [sp, #380]
	add	r3, r3, r2
	mov	r7, r3
	str	r3, [sp, #276]
	ldr	r3, [sp, #208]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #392]
	ldr	r2, [sp, #80]
	ldr	r1, [sp, #408]
	add	r3, r3, r2
	ldr	r2, [sp, #84]
	str	r3, [sp, #388]
	ldr	r3, [sp, #396]
	add	r3, r3, r2
	ldr	r2, [sp, #88]
	str	r3, [sp, #392]
	ldr	r3, [sp, #400]
	ldrd	r4, r5, [sp, #388]
	add	r3, r3, r2
	ldr	r2, [sp, #76]
	str	r3, [sp, #396]
	ldr	r3, [sp, #312]
	ldr	r6, [sp, #396]
	add	r3, r3, r2
	str	r3, [sp, #304]
	mov	r7, r3
	ldr	r3, [sp, #224]
	str	r4, [r0, #144]
	ldr	r2, [sp, #404]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #440]
	eors	r3, r3, r2
	ldr	r2, [sp, #444]
	str	r3, [sp, #308]
	eors	r2, r2, r1
	ldr	r1, [sp, #412]
	str	r2, [sp, #400]
	ldr	r2, [sp, #448]
	ldr	r5, [sp, #400]
	eors	r2, r2, r1
	ldr	r1, [sp, #300]
	str	r2, [sp, #424]
	mov	r9, r5
	ldr	r2, [sp, #328]
	ldr	r6, [sp, #424]
	eors	r2, r2, r1
	ldr	r1, [sp, #452]
	ldr	r4, [sp, #316]
	mov	r10, r6
	eors	r1, r1, r4
	ldr	r4, [sp, #416]
	str	r1, [sp, #440]
	ldr	r1, [sp, #456]
	eors	r1, r1, r4
	ldr	r4, [sp, #420]
	str	r1, [sp, #444]
	ldr	r1, [sp, #460]
	eors	r1, r1, r4
	ldr	r4, [sp, #256]
	str	r1, [sp, #448]
	ldr	r1, [sp, #332]
	ldr	r6, [sp, #448]
	eors	r1, r1, r4
	strd	r6, r1, [sp, #248]
	ldrd	r4, r5, [sp, #440]
	strd	r4, r5, [sp, #240]
	ldr	r5, [sp, #320]
	ldr	r4, [sp, #464]
	eors	r4, r4, r5
	ldr	r5, [sp, #380]
	str	r4, [sp, #452]
	ldr	r4, [sp, #468]
	eors	r4, r4, r5
	ldr	r5, [sp, #384]
	str	r4, [sp, #456]
	ldr	r4, [sp, #472]
	eors	r4, r4, r5
	ldr	r5, [sp, #276]
	str	r4, [sp, #460]
	ldr	r4, [sp, #336]
	eor	ip, r4, r5
	ldrd	r4, r5, [sp, #452]
	ldr	r6, [sp, #460]
	strd	r4, r5, [sp, #224]
	ldr	r5, [sp, #388]
	ldr	r4, [sp, #428]
	strd	r6, ip, [sp, #232]
	eors	r4, r4, r5
	ldr	r5, [sp, #392]
	str	r4, [sp, #464]
	ldr	r4, [sp, #432]
	eors	r4, r4, r5
	ldr	r5, [sp, #396]
	str	r4, [sp, #468]
	ldr	r4, [sp, #436]
	eors	r4, r4, r5
	ldr	r5, [sp, #304]
	str	r4, [sp, #472]
	ldr	r4, [sp, #324]
	ldr	r6, [sp, #472]
	eors	r4, r4, r5
	str	r4, [sp, #312]
	ldrd	r4, r5, [sp, #464]
	strd	r4, r5, [sp, #208]
	lsrs	r4, r3, #12
	lsrs	r3, r2, #12
	mov	fp, r3
	ldr	r3, [sp, #308]
	lsr	r5, r9, #12
	ldr	r7, [sp, #312]
	str	r6, [sp, #216]
	lsr	r6, r10, #12
	eor	r3, r4, r3, lsl #20
	str	r3, [sp, #324]
	ldr	r3, [sp, #400]
	str	r7, [sp, #220]
	eor	r3, r5, r3, lsl #20
	str	r3, [sp, #328]
	ldr	r3, [sp, #424]
	eor	r3, r6, r3, lsl #20
	str	r3, [sp, #332]
	eor	r3, fp, r2, lsl #20
	str	r3, [sp, #308]
	mov	r7, r3
	ldr	r3, [sp, #280]
	ldrd	r4, r5, [sp, #324]
	str	r4, [r0, #80]
	ldr	r6, [sp, #332]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #240]
	lsrs	r4, r3, #12
	ldr	r3, [sp, #244]
	lsrs	r5, r3, #12
	ldr	r3, [sp, #248]
	lsrs	r6, r3, #12
	lsrs	r3, r1, #12
	mov	fp, r3
	ldr	r3, [sp, #440]
	eor	r3, r4, r3, lsl #20
	str	r3, [sp, #336]
	ldr	r3, [sp, #444]
	ldr	r4, [sp, #336]
	str	r4, [r0, #96]
	eor	r3, r5, r3, lsl #20
	str	r3, [sp, #400]
	ldr	r3, [sp, #448]
	ldr	r5, [sp, #400]
	eor	r3, r6, r3, lsl #20
	str	r3, [sp, #424]
	eor	r3, fp, r1, lsl #20
	str	r3, [sp, #280]
	mov	r7, r3
	ldr	r3, [sp, #284]
	ldr	r6, [sp, #424]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #224]
	lsrs	r4, r3, #12
	ldr	r3, [sp, #228]
	lsrs	r5, r3, #12
	ldr	r3, [sp, #232]
	lsrs	r6, r3, #12
	mov	r3, ip
	lsrs	r3, r3, #12
	mov	fp, r3
	ldr	r3, [sp, #452]
	eor	r3, r4, r3, lsl #20
	str	r3, [sp, #428]
	ldr	r3, [sp, #456]
	eor	r3, r5, r3, lsl #20
	str	r3, [sp, #432]
	ldr	r3, [sp, #460]
	ldrd	r4, r5, [sp, #428]
	str	r4, [r0, #112]
	eor	r3, r6, r3, lsl #20
	str	r3, [sp, #436]
	eor	r3, fp, ip, lsl #20
	str	r3, [sp, #284]
	add	r3, r0, #112
	ldr	r6, [sp, #436]
	ldr	r7, [sp, #284]
	str	r3, [sp, #224]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #208]
	lsrs	r4, r3, #12
	ldr	r3, [sp, #212]
	lsrs	r5, r3, #12
	ldr	r3, [sp, #216]
	lsrs	r6, r3, #12
	ldr	r3, [sp, #220]
	lsrs	r3, r3, #12
	mov	fp, r3
	ldr	r3, [sp, #464]
	eor	r3, r4, r3, lsl #20
	str	r3, [sp, #440]
	ldr	r3, [sp, #468]
	eor	r3, r5, r3, lsl #20
	str	r3, [sp, #444]
	ldr	r3, [sp, #472]
	ldrd	r4, r5, [sp, #440]
	str	r4, [r0, #64]
	eor	r3, r6, r3, lsl #20
	str	r3, [sp, #448]
	ldr	r3, [sp, #312]
	ldr	r6, [sp, #448]
	eor	r3, fp, r3, lsl #20
	str	r3, [sp, #312]
	add	r3, r0, #64
	ldr	r7, [sp, #312]
	str	r3, [sp, #240]
	ldr	fp, .L30
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
.LPIC12:
	add	fp, pc
	ldr	r3, [sp, #532]
	ldr	r1, [sp]
	add	fp, fp, r3, lsl #4
	ldrb	r3, [fp, #9]	@ zero_extendqisi2
	lsls	r2, r3, #4
	add	r3, r1, r3, lsl #4
	ldr	r4, [r1, r2]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #340]
	ldr	r2, [sp]
	add	r3, r3, r4
	str	r3, [sp, #340]
	ldr	r3, [sp, #344]
	add	r3, r3, r5
	str	r3, [sp, #344]
	ldr	r3, [sp, #348]
	ldrd	r4, r5, [sp, #340]
	add	r3, r3, r6
	str	r3, [sp, #348]
	ldr	r3, [sp, #272]
	ldr	r6, [sp, #348]
	strd	r4, r5, [r0]
	add	r3, r3, r7
	ldr	r4, [sp]
	strd	r6, r3, [r0, #8]
	str	r3, [sp, #272]
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	lsls	r1, r3, #4
	add	r3, r4, r3, lsl #4
	ldr	r4, [r2, r1]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #352]
	add	r3, r3, r4
	str	r3, [sp, #352]
	ldr	r3, [sp, #356]
	add	r3, r3, r5
	str	r3, [sp, #356]
	ldr	r3, [sp, #360]
	ldrd	r4, r5, [sp, #352]
	add	r3, r3, r6
	str	r3, [sp, #360]
	ldr	r3, [sp, #288]
	ldr	r6, [sp, #360]
	adds	r1, r3, r7
	ldrb	r3, [fp, #13]	@ zero_extendqisi2
	strd	r6, r1, [r0, #24]
	strd	r4, r5, [r0, #16]
	lsl	ip, r3, #4
	add	r3, r2, r3, lsl #4
	ldr	r4, [r2, ip]
	ldrd	r5, r6, [r3, #4]
	ldr	r7, [r3, #12]
	ldr	r3, [sp, #364]
	add	lr, lr, r6
	add	r9, r3, r4
	ldr	r3, [sp, #476]
	ldrb	r4, [fp, #15]	@ zero_extendqisi2
	add	r8, r3, r5
	ldr	r3, [sp, #292]
	strd	r9, r8, [r0, #32]
	lsls	r5, r4, #4
	add	r3, r3, r7
	add	r4, r2, r4, lsl #4
	strd	lr, r3, [r0, #40]
	ldr	r2, [r2, r5]
	str	r2, [sp, #208]
	ldr	r2, [r4, #4]
	str	r2, [sp, #212]
	ldr	r2, [r4, #8]
	str	r2, [sp, #216]
	ldr	r2, [r4, #12]
	str	r2, [sp, #220]
	ldr	r4, [sp, #340]
	ldr	r2, [sp, #324]
	add	fp, r2, r4
	ldr	r4, [sp, #344]
	ldr	r2, [sp, #328]
	add	r2, r2, r4
	ldr	r4, [sp, #348]
	str	r2, [sp]
	ldr	r2, [sp, #332]
	ldr	r5, [sp]
	add	r2, r2, r4
	ldr	r4, [sp, #272]
	str	r2, [sp, #288]
	ldr	r2, [sp, #308]
	ldr	r6, [sp, #288]
	add	r4, r4, r2
	strd	fp, r5, [r0]
	strd	r6, r4, [r0, #8]
	mov	r2, r4
	ldr	r5, [sp, #352]
	ldr	r4, [sp, #336]
	add	r4, r4, r5
	ldr	r5, [sp, #356]
	str	r4, [sp, #272]
	ldr	r4, [sp, #400]
	add	r4, r4, r5
	ldr	r5, [sp, #360]
	str	r4, [sp, #292]
	ldr	r4, [sp, #424]
	add	r4, r4, r5
	str	r4, [sp, #340]
	ldr	r4, [sp, #280]
	ldr	r5, [sp, #292]
	add	r1, r1, r4
	ldr	r4, [sp, #272]
	ldr	r6, [sp, #340]
	strd	r4, r5, [r0, #16]
	ldr	r4, [sp, #428]
	strd	r6, r1, [r0, #24]
	add	r10, r4, r9
	ldr	r4, [sp, #432]
	add	r4, r4, r8
	str	r4, [sp, #344]
	ldr	r4, [sp, #436]
	add	r4, r4, lr
	str	r4, [sp, #348]
	ldr	r4, [sp, #284]
	ldrd	r5, r6, [sp, #344]
	add	lr, r4, r3
	ldr	r4, [sp, #208]
	ldr	r3, [sp, #368]
	strd	r10, r5, [r0, #32]
	add	r3, r3, r4
	ldr	r4, [sp, #440]
	strd	r6, lr, [r0, #40]
	add	r3, r3, r4
	ldr	r4, [sp, #212]
	str	r3, [sp, #352]
	ldr	r3, [sp, #372]
	add	r9, r3, r4
	ldr	r3, [sp, #444]
	ldr	r4, [sp, #216]
	add	r9, r9, r3
	ldr	r3, [sp, #376]
	add	r8, r3, r4
	ldr	r3, [sp, #448]
	ldr	r4, [sp, #296]
	add	r8, r8, r3
	ldr	r3, [sp, #220]
	add	r3, r3, r4
	ldr	r4, [sp, #312]
	add	r3, r3, r4
	ldr	r4, [sp, #352]
	strd	r8, r3, [r0, #56]
	strd	r4, r9, [r0, #48]
	ldr	r4, [sp, #128]
	ldr	r5, [sp, #132]
	eor	r4, fp, r4
	str	r4, [sp, #208]
	ldr	r4, [sp]
	eors	r4, r4, r5
	ldr	r5, [sp, #288]
	str	r4, [sp, #296]
	ldr	r4, [sp, #136]
	eors	r4, r4, r5
	str	r4, [sp, #128]
	ldr	r4, [sp, #28]
	ldr	r5, [sp, #296]
	eors	r2, r2, r4
	ldr	r4, [sp, #208]
	strd	r4, r5, [sp]
	ldr	r5, [sp, #112]
	ldr	r4, [sp, #272]
	ldr	r6, [sp, #128]
	eors	r4, r4, r5
	ldr	r5, [sp, #116]
	str	r4, [sp, #272]
	ldr	r4, [sp, #292]
	str	r6, [sp, #8]
	eors	r4, r4, r5
	ldr	r5, [sp, #340]
	str	r4, [sp, #288]
	ldr	r4, [sp, #120]
	eors	r4, r4, r5
	str	r4, [sp, #112]
	ldr	r4, [sp, #44]
	ldr	r5, [sp, #288]
	eors	r1, r1, r4
	ldr	r6, [sp, #112]
	ldr	r4, [sp, #272]
	strd	r4, r5, [sp, #16]
	str	r6, [sp, #24]
	ldr	r4, [sp, #96]
	ldr	r5, [sp, #100]
	eor	r4, r10, r4
	str	r4, [sp, #292]
	ldr	r4, [sp, #344]
	eors	r4, r4, r5
	ldr	r5, [sp, #348]
	str	r4, [sp, #340]
	ldr	r4, [sp, #104]
	eors	r4, r4, r5
	str	r4, [sp, #96]
	ldr	r4, [sp, #60]
	ldr	r5, [sp, #340]
	eor	lr, lr, r4
	ldr	r4, [sp, #292]
	strd	r4, r5, [sp, #32]
	ldr	r5, [sp, #80]
	ldr	r4, [sp, #352]
	ldr	r6, [sp, #96]
	eors	r4, r4, r5
	str	r4, [sp, #344]
	ldr	r4, [sp, #84]
	str	r6, [sp, #40]
	eor	r4, r9, r4
	str	r4, [sp, #348]
	ldr	r4, [sp, #88]
	eor	r4, r8, r4
	str	r4, [sp, #80]
	ldr	r4, [sp, #76]
	ldr	r6, [sp, #80]
	eor	ip, r3, r4
	ldr	r3, [sp]
	ldrd	r4, r5, [sp, #344]
	strd	r4, r5, [sp, #48]
	str	r6, [sp, #56]
	lsrs	r4, r3, #8
	ldr	r3, [sp, #4]
	lsrs	r5, r3, #8
	ldr	r3, [sp, #8]
	lsrs	r6, r3, #8
	lsrs	r3, r2, #8
	mov	fp, r3
	ldr	r3, [sp, #208]
	eor	r2, fp, r2, lsl #24
	eor	r3, r4, r3, lsl #24
	str	r3, [sp, #64]
	ldr	r3, [sp, #296]
	ldr	r4, [sp, #64]
	str	r4, [r0, #240]
	eor	r3, r5, r3, lsl #24
	str	r3, [sp, #208]
	ldr	r3, [sp, #128]
	ldr	r5, [sp, #208]
	eor	r3, r6, r3, lsl #24
	str	r3, [sp, #128]
	mov	r6, r3
	ldr	r3, [sp, #192]
	strd	r5, r6, [r3, #4]
	str	r2, [r3, #12]
	ldr	r3, [sp, #16]
	lsr	r8, r3, #8
	ldr	r3, [sp, #20]
	lsr	r9, r3, #8
	ldr	r3, [sp, #24]
	lsr	r10, r3, #8
	lsrs	r3, r1, #8
	mov	r7, r3
	ldr	r3, [sp, #272]
	eor	r3, r8, r3, lsl #24
	str	r3, [sp, #16]
	ldr	r3, [sp, #288]
	ldr	r4, [sp, #16]
	str	r4, [r0, #192]
	eor	r3, r9, r3, lsl #24
	str	r3, [sp, #192]
	ldr	r3, [sp, #112]
	ldr	r5, [sp, #192]
	eor	r3, r10, r3, lsl #24
	str	r3, [sp, #112]
	eor	r3, r7, r1, lsl #24
	str	r3, [sp]
	mov	r7, r3
	ldr	r3, [sp, #144]
	ldr	r6, [sp, #112]
	strd	r5, r6, [r3, #4]
	str	r7, [r3, #12]
	ldr	r3, [sp, #32]
	ldr	r1, [sp, #160]
	lsr	r8, r3, #8
	ldr	r3, [sp, #36]
	lsr	r9, r3, #8
	ldr	r3, [sp, #40]
	lsr	r10, r3, #8
	mov	r3, lr
	lsrs	r3, r3, #8
	mov	r7, r3
	ldr	r3, [sp, #292]
	eor	r3, r8, r3, lsl #24
	str	r3, [sp, #32]
	ldr	r3, [sp, #340]
	ldr	r4, [sp, #32]
	str	r4, [r0, #208]
	eor	r3, r9, r3, lsl #24
	str	r3, [sp, #144]
	ldr	r3, [sp, #96]
	ldr	r5, [sp, #144]
	ldr	r4, [sp, #64]
	eor	r3, r10, r3, lsl #24
	str	r3, [sp, #96]
	ldr	r6, [sp, #96]
	eor	r3, r7, lr, lsl #24
	strd	r5, r6, [r1, #4]
	str	r3, [r1, #12]
	ldr	r1, [sp, #48]
	lsr	r8, r1, #8
	ldr	r1, [sp, #52]
	lsr	r9, r1, #8
	ldr	r1, [sp, #56]
	lsr	r10, r1, #8
	mov	r1, ip
	mov	r6, r10
	lsrs	r1, r1, #8
	mov	r7, r1
	ldr	r1, [sp, #344]
	eor	ip, r7, ip, lsl #24
	eor	r10, r8, r1, lsl #24
	ldr	r1, [sp, #348]
	str	r10, [r0, #224]
	eor	r9, r9, r1, lsl #24
	ldr	r1, [sp, #80]
	eor	r8, r6, r1, lsl #24
	ldr	r1, [sp, #176]
	strd	r9, r8, [r1, #4]
	str	ip, [r1, #12]
	ldr	r1, [sp, #404]
	add	lr, r1, r4
	ldr	r4, [sp, #208]
	ldr	r1, [sp, #408]
	add	r1, r1, r4
	str	r1, [sp, #48]
	ldr	r4, [sp, #128]
	ldr	r1, [sp, #412]
	ldr	r5, [sp, #48]
	add	r1, r1, r4
	str	r1, [sp, #64]
	ldr	r1, [sp, #300]
	ldr	r4, [sp, #16]
	add	r2, r2, r1
	ldr	r1, [sp, #316]
	strd	lr, r5, [r0, #160]
	add	r1, r1, r4
	ldr	r4, [sp, #192]
	str	r1, [sp, #16]
	ldr	r1, [sp, #416]
	ldr	r6, [sp, #64]
	add	r1, r1, r4
	ldr	r4, [sp, #112]
	str	r1, [sp, #80]
	ldr	r1, [sp, #420]
	ldr	r5, [sp, #80]
	add	r1, r1, r4
	ldr	r4, [sp]
	str	r1, [sp, #112]
	ldr	r1, [sp, #256]
	strd	r6, r2, [r0, #168]
	add	r1, r1, r4
	ldr	r4, [sp, #16]
	strd	r4, r5, [r0, #176]
	ldr	r5, [sp, #32]
	ldr	r4, [sp, #320]
	ldr	r6, [sp, #112]
	strd	r6, r1, [r0, #184]
	add	r4, r4, r5
	str	r4, [sp, #32]
	ldr	r4, [sp, #380]
	ldr	r5, [sp, #144]
	add	r4, r4, r5
	ldr	r5, [sp, #96]
	str	r4, [sp, #128]
	ldr	r4, [sp, #384]
	add	r4, r4, r5
	str	r4, [sp, #96]
	ldr	r4, [sp, #276]
	ldr	r5, [sp, #128]
	add	r3, r3, r4
	ldr	r4, [sp, #32]
	strd	r4, r5, [r0, #128]
	ldr	r4, [sp, #388]
	ldr	r6, [sp, #96]
	strd	r6, r3, [r0, #136]
	add	r6, r4, r10
	ldr	r4, [sp, #392]
	ldr	r5, [sp, #324]
	add	r7, r4, r9
	ldr	r4, [sp, #396]
	eor	r5, r5, lr
	str	r5, [sp, #160]
	add	r4, r4, r8
	ldr	r5, [sp, #328]
	str	r4, [sp, #144]
	ldr	r4, [sp, #304]
	ldr	r10, [sp, #144]
	add	r4, r4, ip
	mov	ip, r5
	ldr	r5, [sp, #48]
	strd	r10, r4, [r0, #152]
	eor	r5, ip, r5
	str	r5, [sp, #176]
	ldr	r5, [sp, #332]
	strd	r6, r7, [r0, #144]
	mov	ip, r5
	ldr	r5, [sp, #64]
	eor	r5, ip, r5
	str	r5, [sp, #192]
	ldr	r5, [sp, #308]
	ldr	r8, [sp, #160]
	eors	r2, r2, r5
	ldr	r5, [sp, #336]
	ldr	r9, [sp, #176]
	mov	ip, r5
	ldr	r5, [sp, #16]
	ldr	r10, [sp, #192]
	lsr	lr, r2, #7
	eor	r5, ip, r5
	str	r5, [sp, #208]
	ldr	r5, [sp, #400]
	mov	fp, lr
	strd	r8, r9, [sp]
	add	lr, r0, #80
	mov	ip, r5
	ldr	r5, [sp, #80]
	ldr	r8, [sp, #208]
	eor	r5, ip, r5
	str	r5, [sp, #80]
	ldr	r5, [sp, #424]
	ldr	r9, [sp, #80]
	mov	ip, r5
	ldr	r5, [sp, #112]
	strd	r10, r2, [sp, #8]
	eor	r2, fp, r2, lsl #25
	eor	r5, ip, r5
	str	r5, [sp, #112]
	ldr	r5, [sp, #280]
	ldr	r10, [sp, #112]
	eors	r1, r1, r5
	ldr	r5, [sp, #428]
	strd	r8, r9, [sp, #16]
	mov	ip, r5
	ldr	r5, [sp, #32]
	strd	r10, r1, [sp, #24]
	eor	r5, ip, r5
	str	r5, [sp, #272]
	ldr	r5, [sp, #432]
	mov	ip, r5
	ldr	r5, [sp, #128]
	eor	r5, ip, r5
	str	r5, [sp, #128]
	ldr	r5, [sp, #436]
	ldr	r8, [sp, #272]
	mov	ip, r5
	ldr	r5, [sp, #96]
	ldr	r9, [sp, #128]
	eor	r5, ip, r5
	str	r5, [sp, #96]
	ldr	r5, [sp, #284]
	ldr	r10, [sp, #96]
	eors	r3, r3, r5
	ldr	r5, [sp, #440]
	str	r3, [sp, #64]
	eors	r5, r5, r6
	str	r5, [sp, #256]
	ldr	r5, [sp, #444]
	ldr	r6, [sp, #144]
	eors	r5, r5, r7
	str	r5, [sp, #276]
	ldr	r5, [sp, #448]
	strd	r10, r3, [sp, #40]
	eors	r5, r5, r6
	ldr	r3, [sp]
	str	r5, [sp, #144]
	ldr	r5, [sp, #312]
	ldr	r6, [sp, #144]
	eor	ip, r5, r4
	ldr	r4, [sp, #256]
	ldr	r5, [sp, #276]
	strd	r4, r5, [sp, #48]
	lsrs	r4, r3, #7
	ldr	r3, [sp, #4]
	strd	r6, ip, [sp, #56]
	strd	r8, r9, [sp, #32]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #8]
	lsrs	r6, r3, #7
	ldr	r3, [sp, #160]
	eor	r4, r4, r3, lsl #25
	ldr	r3, [sp, #176]
	eor	r5, r5, r3, lsl #25
	ldr	r3, [sp, #192]
	strd	r4, r5, [r0, #80]
	eor	r6, r6, r3, lsl #25
	ldr	r3, [sp, #16]
	strd	r6, r2, [r0, #88]
	lsrs	r2, r1, #7
	eor	r1, r2, r1, lsl #25
	lsrs	r4, r3, #7
	ldr	r3, [sp, #20]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #24]
	lsrs	r6, r3, #7
	ldr	r3, [sp, #208]
	eor	r4, r4, r3, lsl #25
	ldr	r3, [sp, #80]
	eor	r5, r5, r3, lsl #25
	ldr	r3, [sp, #112]
	strd	r4, r5, [r0, #96]
	eor	r6, r6, r3, lsl #25
	ldr	r3, [sp, #32]
	strd	r6, r1, [r0, #104]
	lsrs	r4, r3, #7
	ldr	r3, [sp, #36]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #40]
	lsrs	r6, r3, #7
	ldr	r3, [sp, #44]
	lsrs	r2, r3, #7
	ldr	r3, [sp, #272]
	eor	r4, r4, r3, lsl #25
	ldr	r3, [sp, #128]
	str	r4, [r0, #112]
	eor	r5, r5, r3, lsl #25
	ldr	r3, [sp, #96]
	eor	r6, r6, r3, lsl #25
	ldr	r3, [sp, #64]
	eor	r3, r2, r3, lsl #25
	ldr	r2, [sp, #224]
	str	r3, [r2, #12]
	ldr	r3, [sp, #48]
	strd	r5, r6, [r2, #4]
	lsrs	r4, r3, #7
	ldr	r3, [sp, #52]
	lsrs	r5, r3, #7
	ldr	r3, [sp, #56]
	lsrs	r6, r3, #7
	mov	r3, ip
	lsrs	r3, r3, #7
	mov	fp, r3
	ldr	r3, [sp, #256]
	eor	r1, fp, ip, lsl #25
	eor	r4, r4, r3, lsl #25
	ldr	r3, [sp, #276]
	str	r4, [r0, #64]
	eor	r5, r5, r3, lsl #25
	ldr	r3, [sp, #144]
	eor	r6, r6, r3, lsl #25
	ldr	r3, [sp, #240]
	strd	r5, r6, [r3, #4]
	str	r1, [r3, #12]
	add	sp, sp, #540
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L31:
	.align	2
.L30:
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
.L34:
	ldr	r7, [r3, #4]!
	cmp	r3, r0
	pld	[r7, r1]
	bne	.L34
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
	.type	blake3_hash4_sse2, %function
blake3_hash4_sse2:
	@ args = 28, pretend = 0, frame = 776
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vmov	s15, r0	@ int
	ldr	r0, [r2]
	sub	sp, sp, #788
	ldrb	r3, [sp, #836]	@ zero_extendqisi2
	str	r3, [sp, #80]
	ldrb	r3, [sp, #844]	@ zero_extendqisi2
	str	r1, [sp, #76]
	str	r3, [sp, #84]
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	add	r3, sp, #128
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #144]	@ int
	strd	r0, r1, [sp, #152]
	ldr	r0, [r2, #4]
	vstr.32	s1, [sp, #148]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #160]	@ int
	strd	r0, r1, [sp, #168]
	ldr	r0, [r2, #8]
	vstr.32	s1, [sp, #164]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #176]	@ int
	strd	r0, r1, [sp, #184]
	ldr	r0, [r2, #12]
	vstr.32	s1, [sp, #180]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #192]	@ int
	strd	r0, r1, [sp, #200]
	ldr	r0, [r2, #16]
	vstr.32	s1, [sp, #196]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #208]	@ int
	strd	r0, r1, [sp, #216]
	ldr	r0, [r2, #20]
	vstr.32	s1, [sp, #212]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #224]	@ int
	strd	r0, r1, [sp, #232]
	ldr	r0, [r2, #24]
	vstr.32	s1, [sp, #228]	@ int
	bl	set1(PLT)
	vmov	r0, s2	@ int
	vmov	r1, s3	@ int
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s0, [sp, #240]	@ int
	strd	r0, r1, [sp, #248]
	ldr	r0, [r2, #28]
	vstr.32	s1, [sp, #244]	@ int
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	str	r3, [sp]
	add	r3, sp, #112
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	strd	r1, r2, [sp, #264]
	ldrb	r2, [sp, #832]	@ zero_extendqisi2
	ldrd	r0, [sp, #824]
	vstr.32	s0, [sp, #256]	@ int
	vstr.32	s1, [sp, #260]	@ int
	bl	load_counters(PLT)
	ldr	r2, [sp, #80]
	ldrb	r3, [sp, #840]	@ zero_extendqisi2
	orrs	r3, r3, r2
	movs	r2, #0
	str	r2, [sp, #72]
.L38:
	ldrd	r2, r1, [sp, #72]
	cmp	r2, r1
	bne	.L40
	add	r2, sp, #144
	add	r4, sp, #208
	mov	r0, r2
	bl	transpose_vecs(PLT)
	mov	r0, r4
	bl	transpose_vecs(PLT)
	ldr	r0, [sp, #848]
	vldr.64	d0, [sp, #144]	@ int
	vldr.64	d1, [sp, #152]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #208]	@ int
	add	r0, r3, #16
	vldr.64	d1, [sp, #216]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #160]	@ int
	add	r0, r3, #32
	vldr.64	d1, [sp, #168]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #224]	@ int
	add	r0, r3, #48
	vldr.64	d1, [sp, #232]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #176]	@ int
	add	r0, r3, #64
	vldr.64	d1, [sp, #184]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #240]	@ int
	add	r0, r3, #80
	vldr.64	d1, [sp, #248]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #192]	@ int
	add	r0, r3, #96
	vldr.64	d1, [sp, #200]	@ int
	bl	storeu(PLT)
	ldr	r3, [sp, #848]
	vldr.64	d0, [sp, #256]	@ int
	add	r0, r3, #112
	vldr.64	d1, [sp, #264]	@ int
	bl	storeu(PLT)
	add	sp, sp, #788
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L40:
	ldr	r2, [sp, #72]
	movs	r0, #64
	ldr	r1, [sp, #76]
	add	fp, sp, #272
	adds	r2, r2, #1
	str	r2, [sp, #72]
	cmp	r2, r1
	itt	eq
	ldreq	r2, [sp, #84]
	orreq	r3, r3, r2
	bl	set1(PLT)
	mov	r0, r3
	vstr.32	s0, [sp, #64]	@ int
	vstr.32	s1, [sp, #68]	@ int
	mov	r2, fp
	vstr.32	s2, [sp, #8]	@ int
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s2, [sp, #96]	@ int
	vstr.32	s3, [sp, #100]	@ int
	bl	set1(PLT)
	ldr	r3, [sp, #72]
	vmov	r0, s15	@ int
	vstr.32	s0, [sp, #88]	@ int
	vstr.32	s1, [sp, #92]	@ int
	lsls	r1, r3, #6
	vstr.32	s2, [sp, #8]	@ int
	subs	r1, r1, #64
	vstr.32	s3, [sp, #12]	@ int
	vstr.32	s2, [sp, #104]	@ int
	vstr.32	s3, [sp, #108]	@ int
	bl	transpose_msg_vecs(PLT)
	ldr	r2, [sp, #144]
	add	r1, sp, #544
	str	r2, [sp, #528]
	add	r3, sp, #528
	ldr	r2, [sp, #148]
	str	r2, [sp, #532]
	ldr	r2, [sp, #152]
	str	r2, [sp, #536]
	ldr	r2, [sp, #156]
	str	r2, [sp, #540]
	ldr	r2, [sp, #160]
	str	r2, [sp, #544]
	ldr	r2, [sp, #164]
	str	r2, [r1, #4]
	ldr	r2, [sp, #168]
	str	r2, [r1, #8]
	ldr	r2, [sp, #172]
	str	r2, [r1, #12]
	str	r1, [sp, #16]
	add	r1, sp, #560
	ldr	r2, [sp, #176]
	str	r2, [sp, #560]
	ldr	r2, [sp, #180]
	str	r2, [r1, #4]
	ldr	r2, [sp, #184]
	str	r2, [r1, #8]
	ldr	r2, [sp, #188]
	str	r2, [r1, #12]
	str	r1, [sp, #20]
	add	r1, sp, #576
	ldr	r2, [sp, #192]
	str	r2, [sp, #576]
	ldr	r2, [sp, #196]
	str	r2, [r1, #4]
	ldr	r2, [sp, #200]
	str	r1, [sp, #24]
	str	r2, [r1, #8]
	ldr	r2, [sp, #204]
	str	r2, [r1, #12]
	add	r2, sp, #208
	str	r2, [sp, #8]
	add	r1, sp, #592
	ldr	r0, .L41
	ldr	r2, [r2]
	str	r2, [sp, #592]
	ldr	r2, [sp, #8]
	ldr	r2, [r2, #4]
	str	r2, [r1, #4]
	ldr	r2, [sp, #8]
	str	r1, [sp, #28]
	ldr	r2, [r2, #8]
	str	r2, [r1, #8]
	ldr	r2, [sp, #8]
	ldr	r2, [r2, #12]
	str	r2, [r1, #12]
	add	r2, sp, #224
	str	r2, [sp, #12]
	add	r1, sp, #608
	ldr	r2, [r2]
	str	r2, [sp, #608]
	ldr	r2, [sp, #12]
	ldr	r2, [r2, #4]
	str	r2, [r1, #4]
	ldr	r2, [sp, #12]
	str	r1, [sp, #32]
	ldr	r2, [r2, #8]
	str	r2, [r1, #8]
	ldr	r2, [sp, #12]
	ldr	r2, [r2, #12]
	str	r2, [r1, #12]
	add	r1, sp, #624
	ldr	r2, [sp, #240]
	str	r2, [sp, #624]
	ldr	r2, [sp, #244]
	str	r1, [sp, #36]
	str	r2, [r1, #4]
	ldr	r2, [sp, #248]
	str	r2, [r1, #8]
	ldr	r2, [sp, #252]
	str	r2, [r1, #12]
	add	r1, sp, #640
	ldr	r2, [sp, #256]
	str	r2, [sp, #640]
	ldr	r2, [sp, #260]
	str	r2, [r1, #4]
	ldr	r2, [sp, #264]
	str	r2, [r1, #8]
	ldr	r2, [sp, #268]
	str	r2, [r1, #12]
	str	r1, [sp, #40]
	bl	set1(PLT)
	add	r0, sp, #656
	vstr.32	s0, [sp, #656]	@ int
	str	r0, [sp, #44]
	vstr.32	s3, [sp, #48]	@ int
	vstr.32	s1, [r0, #4]	@ int
	vstr.32	s2, [r0, #8]	@ int
	vstr.32	s3, [r0, #12]	@ int
	ldr	r0, .L41+4
	bl	set1(PLT)
	add	r0, sp, #672
	vstr.32	s0, [sp, #672]	@ int
	str	r0, [sp, #48]
	vstr.32	s1, [r0, #4]	@ int
	vstr.32	s2, [r0, #8]	@ int
	vstr.32	s3, [r0, #12]	@ int
	ldr	r0, .L41+8
	vstr.32	s3, [sp, #52]	@ int
	bl	set1(PLT)
	vmov	r1, s2	@ int
	vmov	r2, s3	@ int
	ldr	r0, .L41+12
	vstr.32	s2, [sp, #52]	@ int
	vstr.32	s3, [sp, #56]	@ int
	strd	r1, r2, [sp, #696]
	add	r1, sp, #720
	vstr.32	s0, [sp, #688]	@ int
	vstr.32	s1, [sp, #692]	@ int
	bl	set1(PLT)
	add	r0, sp, #704
	str	r1, [sp, #56]
	vstr.32	s0, [sp, #704]	@ int
	str	r0, [sp, #52]
	vstr.32	s1, [r0, #4]	@ int
	vstr.32	s2, [r0, #8]	@ int
	vstr.32	s3, [r0, #12]	@ int
	ldr	r0, [sp, #56]
	ldr	r1, [sp, #112]
	str	r1, [sp, #720]
	ldr	r1, [sp, #116]
	str	r1, [r0, #4]
	ldr	r1, [sp, #120]
	ldr	r2, [sp, #124]
	str	r1, [r0, #8]
	add	r1, sp, #736
	str	r1, [sp, #60]
	str	r2, [r0, #12]
	ldr	r0, [sp, #60]
	ldr	r1, [sp, #128]
	str	r1, [sp, #736]
	ldr	r1, [sp, #132]
	str	r1, [r0, #4]
	ldr	r1, [sp, #136]
	str	r1, [r0, #8]
	ldr	r2, [sp, #140]
	str	r2, [r0, #12]
	mov	r0, r3
	ldr	r2, [sp, #64]
	str	r2, [sp, #752]
	add	r2, sp, #752
	mov	r1, r2
	str	r2, [sp, #64]
	ldr	r2, [sp, #68]
	str	r2, [r1, #4]
	ldr	r2, [sp, #96]
	str	r2, [r1, #8]
	ldr	r2, [sp, #100]
	str	r2, [r1, #12]
	ldr	r2, [sp, #88]
	str	r2, [sp, #768]
	add	r2, sp, #768
	mov	r1, r2
	str	r2, [sp, #68]
	ldr	r2, [sp, #92]
	str	r2, [r1, #4]
	ldr	r2, [sp, #104]
	str	r2, [r1, #8]
	ldr	r2, [sp, #108]
	str	r2, [r1, #12]
	mov	r1, fp
	movs	r2, #0
	bl	round_fn(PLT)
	mov	r1, fp
	movs	r2, #1
	bl	round_fn(PLT)
	mov	r1, fp
	movs	r2, #2
	bl	round_fn(PLT)
	mov	r1, fp
	movs	r2, #3
	bl	round_fn(PLT)
	mov	r1, fp
	movs	r2, #4
	bl	round_fn(PLT)
	mov	r1, fp
	movs	r2, #5
	bl	round_fn(PLT)
	mov	r1, fp
	movs	r2, #6
	bl	round_fn(PLT)
	ldr	r2, [sp, #44]
	ldrd	fp, r3, [r0, #8]
	str	r3, [sp, #88]
	ldr	r3, [sp, #44]
	ldrd	r1, ip, [r0]
	ldr	lr, [r3, #12]
	ldr	r3, [sp, #656]
	ldrd	r0, r2, [r2, #4]
	eors	r1, r1, r3
	ldr	r3, [sp, #88]
	eor	r2, fp, r2
	eor	r0, ip, r0
	eor	r3, r3, lr
	strd	r2, r3, [sp, #152]
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #48]
	strd	r1, r0, [sp, #144]
	ldrd	ip, lr, [r3, #4]
	ldrd	r1, r0, [r2, #4]
	ldr	fp, [r3, #12]
	ldr	r9, [r2, #12]
	eor	r0, lr, r0
	ldr	r3, [sp, #672]
	eor	r1, ip, r1
	ldr	r2, [sp, #544]
	eors	r2, r2, r3
	eor	r3, fp, r9
	strd	r0, r3, [sp, #168]
	ldr	r3, [sp, #20]
	strd	r2, r1, [sp, #160]
	ldrd	lr, r1, [r3, #4]
	ldrd	r0, ip, [sp, #692]
	ldr	r7, [r3, #12]
	ldr	r6, [sp, #700]
	eor	r0, r0, lr
	ldr	r3, [sp, #560]
	ldr	r2, [sp, #688]
	eors	r6, r6, r7
	eors	r2, r2, r3
	eor	r3, ip, r1
	strd	r3, r6, [sp, #184]
	ldr	r3, [sp, #24]
	strd	r2, r0, [sp, #176]
	ldr	r2, [sp, #704]
	ldrd	r7, r6, [r3, #4]
	ldr	r5, [r3, #12]
	ldr	r3, [sp, #52]
	ldrd	r0, ip, [r3, #4]
	ldr	r1, [r3, #12]
	ldr	r3, [sp, #576]
	eors	r0, r0, r7
	eors	r1, r1, r5
	eors	r2, r2, r3
	eor	r3, ip, r6
	strd	r3, r1, [sp, #200]
	ldr	r3, [sp, #28]
	strd	r2, r0, [sp, #192]
	ldrd	r6, r5, [r3, #4]
	ldr	r4, [r3, #12]
	ldr	r3, [sp, #56]
	ldrd	r0, r3, [r3, #4]
	ldr	r2, [sp, #56]
	ldr	r1, [sp, #592]
	eors	r0, r0, r6
	eors	r3, r3, r5
	ldr	r7, [r2, #12]
	ldr	r2, [sp, #720]
	eors	r4, r4, r7
	eors	r2, r2, r1
	ldr	r1, [sp, #8]
	strd	r0, r3, [r1, #4]
	ldr	r3, [sp, #32]
	str	r2, [r1]
	str	r4, [r1, #12]
	ldr	r2, [sp, #60]
	ldrd	r5, r4, [r3, #4]
	ldr	r6, [r3, #12]
	ldr	r3, [sp, #60]
	ldr	r7, [r2, #12]
	ldr	r1, [sp, #608]
	ldr	r2, [sp, #736]
	eors	r6, r6, r7
	ldrd	r0, r3, [r3, #4]
	eors	r2, r2, r1
	ldr	r1, [sp, #12]
	eors	r0, r0, r5
	eors	r3, r3, r4
	strd	r0, r3, [r1, #4]
	ldr	r3, [sp, #36]
	str	r2, [r1]
	str	r6, [r1, #12]
	ldrd	r5, r4, [r3, #4]
	ldr	r6, [r3, #12]
	ldr	r3, [sp, #64]
	ldrd	r0, r3, [r3, #4]
	ldr	r2, [sp, #64]
	ldr	r1, [sp, #624]
	eors	r3, r3, r4
	eors	r0, r0, r5
	ldr	r7, [r2, #12]
	ldr	r2, [sp, #752]
	eors	r6, r6, r7
	strd	r3, r6, [sp, #248]
	ldr	r3, [sp, #40]
	eors	r2, r2, r1
	strd	r2, r0, [sp, #240]
	ldr	r2, [sp, #68]
	ldrd	r5, r4, [r3, #4]
	ldr	r6, [r3, #12]
	ldr	r3, [sp, #68]
	ldr	r7, [r2, #12]
	ldr	r1, [sp, #640]
	ldrd	r0, r3, [r3, #4]
	eors	r6, r6, r7
	ldr	r2, [sp, #768]
	eors	r3, r3, r4
	eors	r0, r0, r5
	eors	r2, r2, r1
	strd	r3, r6, [sp, #264]
	strd	r2, r0, [sp, #256]
	ldr	r3, [sp, #80]
	b	.L38
.L42:
	.align	2
.L41:
	.word	1779033703
	.word	-1150833019
	.word	1013904242
	.word	-1521486534
	.size	blake3_hash4_sse2, .-blake3_hash4_sse2
	.align	1
	.global	hash_one_sse2
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	hash_one_sse2, %function
hash_one_sse2:
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
.L44:
	mov	r3, ip
	ldr	r0, [r2]	@ unaligned
	ldr	r1, [r2, #4]	@ unaligned
	adds	r2, r2, #8
	cmp	r2, lr
	stmia	r3!, {r0, r1}
	mov	ip, r3
	bne	.L44
	ldrb	r3, [sp, #92]	@ zero_extendqisi2
	orrs	r3, r3, r7
.L45:
	cbnz	r5, .L47
	ldr	r2, [sp, #100]
	add	r5, sp, #48
.L48:
	mov	r3, r4
	adds	r2, r2, #8
	ldmia	r3!, {r0, r1}
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	mov	r4, r3
	cmp	r3, r5
	bne	.L48
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L47:
	cmp	r5, #1
	mov	r1, r6
	it	eq
	orreq	r3, r3, r8
	movs	r2, #64
	str	r3, [sp, #8]
	mov	r0, r4
	strd	r10, [sp]
	adds	r6, r6, #64
	bl	_blake3_compress_in_place_sse2(PLT)
	subs	r5, r5, #1
	mov	r3, r7
	b	.L45
	.size	hash_one_sse2, .-hash_one_sse2
	.align	1
	.global	_blake3_hash_many_sse2
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	_blake3_hash_many_sse2, %function
_blake3_hash_many_sse2:
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
.L52:
	cmp	fp, #3
	bhi	.L54
	ldr	r3, [sp, #120]
	lsrs	r1, r5, #2
	add	r6, r6, r1, lsl #4
	add	fp, r3, r1, lsl #7
	mvn	r3, #3
	subs	r6, r6, #4
	mla	r5, r3, r1, r5
	add	r5, fp, r5, lsl #5
.L55:
	cmp	fp, r5
	bne	.L57
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L54:
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
	bl	blake3_hash4_sse2(PLT)
	ldrd	r0, r3, [sp, #48]
	cmp	r10, #0
	beq	.L53
	adds	r4, r4, #4
	adc	r7, r7, #0
.L53:
	adds	r0, r0, #16
	sub	fp, fp, #4
	adds	r3, r3, #128
	b	.L52
.L57:
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
	bl	hash_one_sse2(PLT)
	cmp	r10, #0
	beq	.L56
	adds	r4, r4, #1
	adc	r7, r7, #0
.L56:
	add	fp, fp, #32
	b	.L55
	.size	_blake3_hash_many_sse2, .-_blake3_hash_many_sse2
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
