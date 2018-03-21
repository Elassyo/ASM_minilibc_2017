;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; rand function
;;;

%define MT19937_DEF_SEED	5489			; Default seed

%define MT19937_W		32			; Word size (change registers accordingly)
%define MT19937_N		624			; State size
%define MT19937_M		397			; Shift size
%define MT19937_R		31			; Mask bits
%define MT19937_MASK_H		(1 << MT19937_R)	; High mask
%define MT19937_MASK_L		~(1 << MT19937_R)	; Low mask
%define MT19937_A		0x9908b0df		; XOR mask
%define MT19937_U		11			; Twist 1 shift
%define MT19937_D		0xffffffff		; Twist 1 mask
%define MT19937_S		7			; Twist 2 shift
%define MT19937_B		0x9d2c5680		; Twist 2 mask
%define MT19937_T		15			; Twist 3 shift
%define MT19937_C		0xefc60000		; Twist 3 mask
%define MT19937_L		18			; Final shift
%define MT19937_F		1812433253		; Seed multiplier



BITS 64

SECTION .text

GLOBAL rand
GLOBAL srand

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

rand:
	lea	r8, [rel mt]
	movsx	rax, word [rel mt_i]
	cmp	rax, MT19937_N
	jb	.return
	je	.reseed
.init:
	mov	edi, MT19937_DEF_SEED
	call	srand
.reseed:
	xor	rcx, rcx
.loop_reseed:
	mov	eax, [r8+rcx*4]
	and	eax, MT19937_MASK_H
	mov	rdx, rcx
	inc	rdx
	cmp	rdx, MT19937_N
	jb	.overflow_1
	xor	rdx, rdx
.overflow_1:
	mov	edx, [r8+rdx*4]
	and	edx, MT19937_MASK_L
	add	eax, edx
	mov	edx, eax
	shr	eax, 1
	test	edx, 1
	jz	.xor_mask
	xor	eax, MT19937_A
.xor_mask:
	mov	rdx, rcx
	add	rdx, MT19937_M
	cmp	rdx, MT19937_N
	jb	.overflow_2
	sub	rdx, MT19937_N
.overflow_2:
	mov	edx, [r8+rdx*4]
	xor	eax, edx
	mov	[r8+rcx*4], eax
	inc	rcx
	cmp	rcx, MT19937_N
	jne	.loop_reseed
	xor	rax, rax
.return:
	mov	ecx, [r8+rax*4]
	inc	rax
	mov	[rel mt_i], ax
.twist_1:
	mov	eax, ecx
	shr	eax, MT19937_U
	and	eax, MT19937_D
	xor	eax, ecx
.twist_2:
	mov	ecx, eax
	shl	ecx, MT19937_S
	and	ecx, MT19937_B
	xor	eax, ecx
.twist_3:
	mov	ecx, eax
	shl	ecx, MT19937_T
	and	ecx, MT19937_C
	xor	eax, ecx
.end:
	mov	ecx, eax
	shr	ecx, MT19937_L
	xor	eax, ecx
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

srand:
	mov	eax, edi
	xor	rcx, rcx
	lea	r8, [rel mt]
	mov	[r8], eax
	mov	r9d, MT19937_F
.loop_seed:
	inc	rcx
	mov	edx, eax
	shr	edx, MT19937_W-2
	xor	eax, edx
	mul	r9d
	add	eax, ecx
	mov	[r8+rcx*4], eax
	cmp	rcx, MT19937_N-1
	jne	.loop_seed
.end:
	mov	dword [rel mt_i], MT19937_N
	ret



SECTION .data

mt:
	TIMES	MT19937_N	dd	0
mt_i:	dw	MT19937_N+1
