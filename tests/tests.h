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

bool test_memcpy_simple_1();
bool test_memcpy_simple_2();
bool test_memcpy_zero_size();
bool test_memcpy_nulls();

bool test_memmove_simple();
bool test_memmove_overlap_1();
bool test_memmove_overlap_2();
bool test_memmove_nulls();

#endif /* !defined (TESTS_H_) */
