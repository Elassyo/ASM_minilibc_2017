/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests memmove
*/

#include "tests.h"

bool test_memmove_simple()
{
	int a = 0x21212121;
	int b = 0x42424242;
	memmove(&a, &b, sizeof(a));
	return (a == b);
}

bool test_memmove_overlap_1()
{
	char buf[] = "Hello ugly world!";
	char ref[] = "Hello world!";

	memmove(buf + 6, buf + 11, 7);
	for (size_t i = 0; i < sizeof(ref); i++) {
		if (buf[i] != ref[i])
			return (false);
	}
	return (true);
}

bool test_memmove_overlap_2()
{
	char buf[] = "memmove can be very useful......";
	char ref[] = "memmove can be very very useful.";

	memmove(buf + 20, buf + 15, 11);
	puts(buf);
	for (size_t i = 0; i < sizeof(ref); i++) {
		if (buf[i] != ref[i])
			return (false);
	}
	return (true);
}

bool test_memmove_nulls()
{
	void *ptr = NULL;
	char arr[] = "Hello";

	memmove(ptr, arr, sizeof(arr));
	memmove(arr, ptr, sizeof(arr));
	return (true);
}
