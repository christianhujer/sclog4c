# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

config:=config.mak

# Lazy expansion of these variables is required to show variable references in help text.

## Installation prefix ($(PREFIX))
PREFIX=/usr/local/

## Installation directory for include files ($(INCDIR)).
INCDIR=$(PREFIX)include/

## Installation directory for archive files ($(LIBDIR)).
LIBDIR=$(PREFIX)lib/

-include $(config)

STEPS:=all clean
DELEGATES:=src test

define template
.PHONY: $(1)
$(1): $$(addsuffix +$(1),$(DELEGATES))
ALL+=$$(addsuffix +$(1),$(DELEGATES))
endef

$(foreach step,$(STEPS),$(eval $(call template,$(step))))

.PHONY: $(ALL)
$(ALL):
	$(MAKE) -C $(subst +, ,$@)

## Builds everything and runs all tests.
all:

## Removes most auto-generated files.
clean:

.PHONY: install
## Installs sclog4c.
# Currently, it would install it into the following locations:
# PREFIX: $(PREFIX)
# LIBDIR: $(LIBDIR)
# INCDIR: $(INCDIR)
install: \
    $(LIBDIR)sclog4c.a \
    $(INCDIR)sclog4c.h \

$(LIBDIR) $(INCDIR):
	install -d $@

src/sclog4c.a:
	$(MAKE) -C $(dir $@)

$(LIBDIR)sclog4c.a: src/sclog4c.a | $(LIBDIR)
	install -t $(LIBDIR) $^

$(INCDIR)sclog4c.h: include/sclog4c.h | $(INCDIR)
	install -t $(INCDIR) $^

.PHONY: distclean
## Removes all files that should not be part of a distribution archive.
distclean: clean
	$(RM) config.mak

.PHONY: configure
help: export config:=$(value config)
## Writes the current configuration to file $(config).
configure:
	$(RM) $(config)
	echo "PREFIX:=$(value PREFIX)" >>$(config)
	echo "INCDIR:=$(value INCDIR)" >>$(config)
	echo "LIBDIR:=$(value LIBDIR)" >>$(config)

control.Description=sclog4c - simple java.util.logging style logging for C.
-include makedist/MakeDist.mak

-include makehelp/Help.mak
