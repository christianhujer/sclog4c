/* Copyright (C) 2014 Christian Hujer.
 * All rights reserved.
 * Licensed under LGPLv3.
 * See file LICENSE in the root directory of this project.
 */

#include "sclog4c/sclog4c.h"

int main(void)
{
    const char *functionName = __func__;

    sclog4c_level = SL4C_INFO;

    logm(SL4C_ERROR, "buh (expected)!");
    logm(SL4C_DEBUG, "debug (unexpected)!");
    logm(SL4C_INFO, "This is %s in function %s (expected).", "foo", functionName);
    return 0;
}
