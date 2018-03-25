;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; strcasecmp
;;;

BITS 64

SECTION .text

GLOBAL strcasecmp

strcasecmp:
	mov	eax, edx
	cmp	rdi, 0
	je	.return
	cmp	rsi, 0
	je	.return
.loop:
	lodsb
	xchg	rsi, rdi
	call	__toupper
	mov	dl, al
	lodsb
	call	__toupper
	xchg	rsi, rdi
	cmp	al, 0
	je	.return
	cmp	dl, 0
	je	.return
	cmp	al, dl
	je	.loop
.return:
	sub	al, dl
	movsx	eax, al
	ret

__toupper:
	cmp	al, 'a'
	jb	.return
	cmp	al, 'z'
	ja	.return
	sub	al, 32
.return:
	ret
