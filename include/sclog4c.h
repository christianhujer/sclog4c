/* Copyright (C) 2014 Christian Hujer.
 * All rights reserved.
 * Licensed under LGPLv3.
 * See file LICENSE in the root directory of this project.
 */

#ifndef SCLOG4C_H
#define SCLOG4C_H

#include <limits.h>
#include <stdio.h>

/** The predefined log levels. */
enum LogLevel {
    ALL = INT_MIN,
    FINEST = 300,
    FINER = 400,
    FINE = 500,
    DEBUG = 600,
    CONFIG = 700,
    INFO = 800,
    WARNING = 900,
    ERROR = 950,
    SEVERE = 1000,
    FATAL = 1100,
    OFF = INT_MAX
};

/** The global log level. */
extern int sclog4c_level;

/** Returns a textual description of the specified @p level.
 * @param level
 *      Level for which to return a textual description.
 * @return String describing @p level.
 */
extern const char *describe(int level);

/** Generates a formatted log message.
 * @param level
 *      Level for which the log message is to be generated.
 * @param fmt
 *      Format string for the log message.
 * @param ...
 *      Format arguments.
 */
#if defined(_doxygen) || defined(__GNUC__) || defined(__CC_ARM)
#define logm(level, fmt, ...) \
    do { \
        if (level >= sclog4c_level) \
            fprintf(stderr, "%s:%d: %s: In function %s: " fmt "\n", __FILE__, __LINE__, describe(level), __func__, ##__VA_ARGS__); \
    } while (0)
#elif defined(__MSC_VER) && (__MSC_VER >= 1400)
#define logm(level, fmt, ...) \
    do { \
        if (level >= sclog4c_level) \
            fprintf(stderr, "%s:%d: %s: In function %s: " fmt "\n", __FILE__, __LINE__, describe(level), __FUNCTION__, __VA_ARGS__); \
    } while (0)
#elif (defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 199901L)
#define logm(level, ...) \
    do { \
        if (level >= sclog4c_level) { \
            fprintf(stderr, "%s:%d: %s: In function %s: ", __FILE__, __LINE__, describe(level), __func__); \
            fprintf(stderr, __VA_ARGS__); \
            fprintf(stderr, "\n"); \
        } \
    } while (0)
#else
#error Requires a preprocessor which supports C99 __VA_ARGS__.
#endif

#endif
