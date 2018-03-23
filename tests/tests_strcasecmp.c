/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strcasecmp
*/

#include "tests.h"

bool test_strcasecmp()
{
	if (strcasecmp("Hello world", "HeLLo wORlD") != 0)
		return (false);
	if (strcasecmp("Hello world!", "HeLLo wORlD") != '!')
		return (false);
	return (true);
}

bool test_strcasecmp_nulls()
{
	char *ptr = NULL;

	if (strcasecmp(ptr, "42") != 0)
		return (false);
	if (strcasecmp("42", ptr) != 0)
		return (false);
	return (true);
}
