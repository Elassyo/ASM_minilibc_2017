/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests functions
*/

#if !defined (TESTS_H_)
	#define TESTS_H_

	#include <stdbool.h>
	#include <stdlib.h>
	#include <string.h>
	#include <unistd.h>

typedef struct test {
	char const *name;
	bool (*func)();
} test_t;

	#define TEST(func) { #func, &func }

#endif /* !defined (TESTS_H_) */
