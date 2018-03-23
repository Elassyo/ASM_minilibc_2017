/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests memset
*/

#include "tests.h"

bool test_memset()
{
	int a = 0x21212121;

	memset(&a, 0x42, sizeof(a));
	return (a == 0x42424242);
}

bool test_memset_null()
{
	void *ptr = NULL;

	memset(ptr, 0, 1);
	return (true);
}
