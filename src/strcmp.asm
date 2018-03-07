;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; strcmp
;;;

BITS 64

SECTION .text

GLOBAL strcmp

strcmp:
	mov	eax, edx
	cmp	rdi, 0
	je	.return
	cmp	rsi, 0
	je	.return
.loop:
	lodsb
	xchg	rsi, rdi
	mov	dl, al
	lodsb
	xchg	rsi, rdi
	cmp	al, 0
	je	.return
	cmp	dl, 0
	je	.return
	cmp	al, dl
	je	.loop
.return:
	and	eax, 0xff
	and	edx, 0xff
	sub	eax, edx
	ret
