/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strncmp
*/

#include "tests.h"

bool test_strncmp()
{
	if (strncmp("R2", "R2D2", 2) != 0)
		return (false);
	if (strncmp("R2", "C3PO", 2) == 0)
		return (false);
	return (true);
}

bool test_strncmp_nulls()
{
	char *ptr = NULL;

	if (strncmp(ptr, "42", 1) != 0)
		return (false);
	if (strncmp("42", ptr, 1) != 0)
		return (false);
	return (true);
}
