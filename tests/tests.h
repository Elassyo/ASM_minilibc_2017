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

bool test_memcpy();
bool test_memcpy_nulls();

bool test_memmove_overlap_1();
bool test_memmove_overlap_2();
bool test_memmove_nulls();

bool test_memset();
bool test_memset_null();

bool test_rindex();
bool test_rindex_null();

bool test_strcasecmp();
bool test_strcasecmp_nulls();

bool test_strchr();
bool test_strchr_null();

bool test_strcmp();
bool test_strcmp_nulls();

bool test_strcspn();
bool test_strcspn_nulls();

bool test_strlen();
bool test_strlen_null();

bool test_strncmp();
bool test_strncmp_nulls();

bool test_strpbrk();
bool test_strpbrk_nulls();

bool test_strstr();
bool test_strstr_nulls();

#endif /* !defined (TESTS_H_) */
