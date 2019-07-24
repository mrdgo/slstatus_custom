/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <time.h>

#include "../util.h"

const char *
datetime(void)
{
    time_t timer;
    struct tm* tm_info;

    time(&timer);
    tm_info = localtime(&timer);

    strftime(buf, 25, " %d.%m.%Y %H:%M", tm_info);
    return buf;
}

/*
const char *
datetime(const char *fmt)
{
	time_t t;

	t = time(NULL);
	if (!strftime(buf, sizeof(buf), fmt, localtime(&t))) {
		warn("strftime: Result string exceeds buffer size");
		return NULL;
	}

	return buf;
}
*/

