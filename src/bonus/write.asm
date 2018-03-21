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
	movsxd	rdi, edi
	mov	rax, 1
	syscall
	ret
