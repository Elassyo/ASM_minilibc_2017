/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests memcpy
*/

#include "tests.h"

bool test_memcpy()
{
	char buf[12] = {};
	char const *ref = "Hello world";

	memcpy(buf, ref, sizeof(buf));
	for (size_t i = 0; i < sizeof(buf); i++) {
		if (buf[i] != ref[i])
			return (false);
	}
	return (true);
}

bool test_memcpy_nulls()
{
	void *ptr = NULL;
	char arr[] = "Hello";

	memcpy(ptr, arr, sizeof(arr));
	memcpy(arr, ptr, sizeof(arr));
	return (true);
}
