# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

CPPFLAGS:=-I../include -MMD
.PHONY: all
all: test
	./test

test: ../src/sclog4c.a test.o

include $(wildcard *.d)

.PHONY: clean
clean:
	$(RM) test *.[od]
