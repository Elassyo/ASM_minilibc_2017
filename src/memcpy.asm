;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; memcpy
;;;

BITS 64

SECTION .text

GLOBAL memcpy

memcpy:
	mov	rax, rdi
	cmp	rdi, 0
	je	.return
	cmp	rsi, 0
	je	.return
	mov	rcx, rdx
	rep movsb
.return:
	ret
