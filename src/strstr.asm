;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; strstr
;;;

BITS 64

SECTION .text

GLOBAL strstr

strstr:
	cmp	rdi, 0
	je	.not_found
	cmp	rsi, 0
	je	.not_found
	mov	r8, rdi
	mov	r9, rsi
.loop:
	lodsb
	xchg	rdi, rsi
	mov	dl, al
	lodsb
	xchg	rdi, rsi
	cmp	dl, 0
	je	.found
	cmp	al, 0
	je	.not_found
	cmp	al, dl
	je	.loop
	inc	r8
	mov	rdi, r8
	mov	rsi, r9
	jmp	.loop
.not_found:
	xor	r8, r8
.found:
	mov	rax, r8
	ret
