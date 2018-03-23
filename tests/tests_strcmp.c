/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strcmp
*/

#include "tests.h"

bool test_strcmp()
{
	if (strcmp("Hello world", "Hello world") != 0)
		return (false);
	if (strcmp("Hello world!", "Hello world") != '!')
		return (false);
	return (true);
}

bool test_strcmp_nulls()
{
	char *ptr = NULL;

	if (strcmp(ptr, "42") != 0)
		return (false);
	if (strcmp("42", ptr) != 0)
		return (false);
	return (true);
}
