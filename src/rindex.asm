;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; rindex
;;;

BITS 64

SECTION .text

GLOBAL rindex

rindex:
	mov	dl, sil
	mov	rsi, rdi
	xor	rcx, rcx
	cmp	rdi, 0
	je	.return
.loop:
	lodsb
	cmp	al, dl
	jne	.next
	mov	rcx, rsi
	dec	rcx
.next:
	cmp	al, 0
	jne	.loop
.return:
	mov	rax, rcx
	ret
