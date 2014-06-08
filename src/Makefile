# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

CPPFLAGS:=-I../include
CFLAGS:=-MMD --std=gnu99
ARFLAGS:=-crs

.PHONY: all
.PRECIOUS: %.o
all: sclog4c.a(sclog4c.o)

.PHONY: clean
clean:
	$(RM) *.[aod]

include $(wildcard *.d)
