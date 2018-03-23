/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests strlen
*/

#include "tests.h"

bool test_strlen()
{
	return (strlen("just testing") == 12);
}

bool test_strlen_null()
{
	char *ptr = NULL;

	return (strlen(ptr) == 0);
}
