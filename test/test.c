/* Copyright (C) 2014 Christian Hujer.
 * All rights reserved.
 * Licensed under LGPLv3.
 * See file LICENSE in the root directory of this project.
 */

#include "sclog4c.h"

int main(void)
{
    const char *functionName = __func__;
    logm(ERROR, "buh!");
    logm(INFO, "%s %s", "foo", functionName);
    return 0;
}
