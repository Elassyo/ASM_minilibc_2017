/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strpbrk
*/

#include "tests.h"

bool test_strpbrk()
{
	char const *str = "This is a sample string";

	return (strpbrk(str, "aeiou") == str + 2);
}

bool test_strpbrk_nulls()
{
	char *ptr = NULL;

	if (strpbrk(ptr, "42") != NULL)
		return (false);
	if (strpbrk("42", ptr) != NULL)
		return (false);
	return (true);
}
