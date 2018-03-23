/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strstr
*/

#include "tests.h"

bool test_strstr()
{
	char const *str = "This is a simple string";

	return (strstr(str, "string") == str + 17);
}

bool test_strstr_nulls()
{
	char *ptr = NULL;

	if (strstr(ptr, "42") != NULL)
		return (false);
	if (strstr("42", ptr) != NULL)
		return (false);
	return (true);
}
