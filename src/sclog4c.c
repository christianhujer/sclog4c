/* Copyright (C) 2014 Christian Hujer.
 * All rights reserved.
 * Licensed under LGPLv3.
 * See file LICENSE in the root directory of this project.
 */

#include "sclog4c.h"

int sclog4c_level = WARNING;

static const struct sclog4c_messages {
    int level;
    const char *message;
} sclog4c_messages[] = {
    { FATAL,    "fatal" },
    { SEVERE,   "severe" },
    { ERROR,    "error" },
    { WARNING,  "warning" },
    { INFO,     "info" },
    { CONFIG,   "config" },
    { DEBUG,    "debug" },
    { FINE,     "fine" },
    { FINER,    "finer" },
    { FINEST,   "finest" },
};

const char *describe(int level)
{
    for (int i = 0; i < sizeof(sclog4c_messages) / sizeof(sclog4c_messages[0]); i++)
        if (level >= sclog4c_messages[i].level)
            return sclog4c_messages[i].message;
    return "all";
}
