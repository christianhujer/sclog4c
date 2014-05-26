/* Copyright (C) 2014 Christian Hujer.
 * All rights reserved.
 * Licensed under LGPLv3.
 * See file LICENSE in the root directory of this project.
 */

#include "sclog4c.h"

int main(void)
{
    const char *functionName = __func__;

    sclog4c_level = INFO;

    logm(ERROR, "buh!");
    logm(INFO, "This is %s in function %s.", "foo", functionName);
    return 0;
}
