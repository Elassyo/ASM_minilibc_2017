/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests
*/

#include <stdio.h>

#include "tests.h"

static test_t const tests[] = {
	{ NULL, NULL }
};

int main(int argc, char const **argv)
{
	size_t passed = 0;
	size_t len;

	for (len = 0; tests[len].name != NULL; len++);
	for (size_t i = 0; i < len; i++) {
		printf("[%d/%d] %s ...\r", i + 1, len, tests[i].name);
		bool res = tests[i].func();
		printf("[%d/%d] %s: %s\e[0m\n", i + 1, len, tests[i].name,
			res ? "\e[32mPASSED" : "\e[31mFAILED");
		if (res)
			passed++;
	}
	printf("%d test(s) passed, %d test(s) failed (%d%%)\n",
		passed, len - passed, 100 * passed / len);
	return (0);
}
