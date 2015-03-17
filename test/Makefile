# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

CPPFLAGS:=-I../include -MMD -DSCLOG4C_LEVEL=CONFIG
.PHONY: all
all: test
	! grep unexpected ./test # Checks that compile-time elimination works (more a check of your compiler than sclog4c).
	! ./test 2>&1 >/dev/null | grep unexpected

test: ../src/libsclog4c.a test.o

include $(wildcard *.d)

.PHONY: clean
clean:
	$(RM) test *.[adios]
