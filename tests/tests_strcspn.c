/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strcspn
*/

#include "tests.h"

bool test_strcspn()
{
	return (strcspn("quarante-deux42", "0123456789") == 13);
}

bool test_strcspn_nulls()
{
	char *ptr = NULL;

	if (strcspn(ptr, "42") != 0)
		return (false);
	if (strcspn("42", ptr) != 0)
		return (false);
	return (true);
}
