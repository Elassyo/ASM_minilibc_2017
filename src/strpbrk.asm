;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; strpbrk
;;;

BITS 64

SECTION .text

GLOBAL strpbrk

strpbrk:
	cmp	rdi, 0
	je	.not_found
	cmp	rsi, 0
	je	.not_found
	mov	r8, rsi
.loop_scan:
	mov	dl, [rdi]
	cmp	dl, 0
	je	.not_found
.loop_cmp:
	lodsb
	cmp	al, 0
	je	.next_ch
	cmp	al, dl
	je	.found
	jmp	.loop_cmp
.next_ch:
	inc	rdi
	mov	rsi, r8
	jmp	.loop_scan
.not_found:
	xor	rdi, rdi
.found:
	mov	rax, rdi
	ret
