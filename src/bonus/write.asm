;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; Write system call
;;;

BITS 64

SECTION .text

GLOBAL write

write:
	mov	rsi, hello_str
	mov	rdx, 12
	movsxd	rdi, edi
	mov	rax, 1
	syscall
	ret

SECTION .rodata

hello_str: db "Hello world", 0
