/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests rindex
*/

#include "tests.h"

bool test_rindex()
{
	char buf[] = "This is a sample string";

	return (rindex(buf, 's') == buf + 17);
}

bool test_rindex_null()
{
	char *ptr = NULL;

	return (rindex(ptr, 'A') == NULL);

}
