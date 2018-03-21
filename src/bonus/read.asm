;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; Read system call
;;;

BITS 64

SECTION .text

GLOBAL read

read:
	movsxd	rdi, edi
	xor	rax, rax
	syscall
	ret
