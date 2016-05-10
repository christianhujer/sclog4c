# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

CPPFLAGS:=-I../include -MMD -DSCLOG4C_LEVEL=CONFIG
.PHONY: all
all: test test2
	! grep unexpected ./test # Checks that compile-time elimination works (more a check of your compiler than sclog4c).
	! ./test 2>&1 >/dev/null | grep unexpected
	! grep unexpected ./test2 # Checks that compile-time elimination works (more a check of your compiler than sclog4c).
	! ./test2 2>&1 >/dev/null | grep unexpected

test: ../src/libsclog4c.a test.o
test2: ../src/libsclog4c.a test2.o

include $(wildcard *.d)

.PHONY: clean
clean:
	$(RM) test *.[adios]
