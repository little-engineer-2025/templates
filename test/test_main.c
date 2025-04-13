#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

#define main __real_main
#include "../src/main.cc"
#undef main


static void test_main(void **state)
{
	const char* argv[] = {"./main"};
	int ret;

	/* Run main function */
	ret = __real_main(1, argv);

	/* Assert results */
	assert_int_equal(0, ret);
}

int __wrap_printf(const char *format, ...)
{
	int param1;

	/* extract result from vargs ('printf("Hello World")') */
	va_list args;
	va_start(args, format);
	va_end(args)

	/* ensure the parameter match expected in expect_*() calls */
	check_expected_ptr(format);

	/* get mocked return value from will_return() call */
	return mock();
}

int main()
{
	const struct CMUnitTest tests[] = {
		cmocka_unit_test(test_main),
	};

	return cmocka_run_group_tests(tests, NULL, NULL);
}
