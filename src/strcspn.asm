;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; strcspn
;;;

BITS 64

SECTION .text

GLOBAL strcspn

strcspn:
	xor	rax, rax
	cmp	rdi, 0
	je	.return
	cmp	rsi, 0
	je	.return
	mov	r8, rdi
	mov	r9, rsi
.loop_scan:
	mov	dl, [rdi]
	cmp	dl, 0
	je	.stop
.loop_cmp:
	lodsb
	cmp	al, 0
	je	.next_ch
	cmp	al, dl
	je	.stop
	jmp	.loop_cmp
.next_ch:
	inc	rdi
	mov	rsi, r9
	jmp	.loop_scan
.stop:
	mov	rax, rdi
	sub	rax, r8
.return:
	ret
