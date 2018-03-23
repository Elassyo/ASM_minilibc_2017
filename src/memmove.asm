;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; memmove
;;;

BITS 64

SECTION .text

GLOBAL memmove

memmove:
	mov	rax, rdi
	cmp	rdi, 0
	je	.return
	cmp	rsi, 0
	je	.return
	mov	rcx, rdx
	cmp	rsi, rdi
	ja	.do_copy
	mov	rdx, rsi
	add	rdx, rcx
	cmp	rdi, rdx
	jae	.do_copy
	add	rsi, rcx
	add	rdi, rcx
	dec	rsi
	dec	rdi
	std
.do_copy:
	rep movsb
	cld
.return:
	ret
