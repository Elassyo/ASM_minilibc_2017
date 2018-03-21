;;;
;;; EPITECH PROJECT, 2018
;;; ASM_minilibc_2017
;;; File description:
;;; Exit system call
;;;

BITS 64

SECTION .text

GLOBAL exit

exit:
	movsxd	rdi, edi
	mov	rax, 60
	syscall
	ret
