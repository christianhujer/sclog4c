/* Copyright (C) 2014 Christian Hujer.
 * All rights reserved.
 * Licensed under LGPLv3.
 * See file LICENSE in the root directory of this project.
 */

#include "sclog4c.h"

int sclog4c_level = WARNING;

const char *describe(int level)
{
    if (level >= FATAL  ) return "fatal";
    if (level >= SEVERE ) return "severe";
    if (level >= ERROR  ) return "error";
    if (level >= WARNING) return "warning";
    if (level >= INFO   ) return "info";
    if (level >= CONFIG ) return "config";
    if (level >= DEBUG  ) return "debug";
    if (level >= FINE   ) return "fine";
    if (level >= FINER  ) return "finer";
    if (level >= FINEST ) return "finest";
    return "all";
}
