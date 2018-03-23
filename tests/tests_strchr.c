/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strchr
*/

#include "tests.h"

bool test_strchr()
{
	char buf[] = "This is a sample string";

	return (strchr(buf, 's') == buf + 3);
}

bool test_strchr_null()
{
	char *ptr = NULL;

	return (strchr(ptr, 'A') == NULL);
}
