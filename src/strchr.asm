;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; strchr
;;;

BITS 64

SECTION .text

GLOBAL strchr

strchr:
	xor	rax, rax
	cmp	rdi, 0
	je	.return
	mov	dl, sil
	mov	rsi, rdi
.loop:
	lodsb
	cmp	al, dl
	je	.found
	cmp	al, 0
	jne	.loop
	xor	rax, rax
	jmp	.return
.found:
	mov	rax, rsi
	dec	rax
.return:
	ret
