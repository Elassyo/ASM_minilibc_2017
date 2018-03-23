/*
** EPITECH PROJECT, 2018
** ASM_minilibc_2017
** File description:
** Tests
*/

#include <setjmp.h>
#include <signal.h>
#include <stdio.h>

#include "tests.h"

static test_t const tests[] = {
	TEST(test_memcpy_simple_1),
	TEST(test_memcpy_simple_2),
	TEST(test_memcpy_zero_size),
	TEST(test_memcpy_nulls),
	TEST(test_memmove_simple),
	TEST(test_memmove_overlap_1),
	TEST(test_memmove_overlap_2),
	TEST(test_memmove_nulls),
	{ NULL, NULL }
};

static jmp_buf segv_checkpoint_jmp;

static void sighandler(int sig)
{
	sigset_t set;

	if (sig == SIGSEGV) {
		sigemptyset(&set);
		sigaddset(&set, SIGSEGV);
		sigprocmask(SIG_UNBLOCK, &set, NULL);
		longjmp(segv_checkpoint_jmp, 1);
	}
}

int main()
{
	size_t passed = 0;
	size_t len;
	bool res;
	char *msg;

	signal(SIGSEGV, &sighandler);
	for (len = 0; tests[len].name != NULL; len++);
	for (size_t i = 0; i < len; i++) {
		printf("[%lu/%lu] %s ...\r", i + 1, len, tests[i].name);
		if (!setjmp(segv_checkpoint_jmp)) {
			res = tests[i].func();
			msg = res ? "\e[32mPASSED\e[0m" : "\e[31mFAILED\e[0m";
			passed += res ? 1 : 0;
		} else {
			msg = "\e[37;41mSIGSEGV\e[0m";
		}
		printf("[%lu/%lu] %s: %s\n", i + 1, len, tests[i].name, msg);
	}
	printf("\n=> %lu/%lu tests passed\n", passed, len);
	return (0);
}
