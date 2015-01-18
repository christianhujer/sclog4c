# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

INCDIR:=/usr/local/include/
LIBDIR:=/usr/local/lib/

STEPS:=all clean
DELEGATES:=src test

define template
$(1): $$(addsuffix +$(1),$(DELEGATES))
ALL+=$$(addsuffix +$(1),$(DELEGATES))
endef

$(foreach step,$(STEPS),$(eval $(call template,$(step))))

.PHONY: $(ALL)
$(ALL):
	$(MAKE) -C $(subst +, ,$@)

.PHONY: install
install: \
    $(LIBDIR)sclog4c.a \
    $(INCDIR)sclog4c.h \

$(LIBDIR) $(INCDIR):
	mkdir -p $@

src/sclog4c.a:
	$(MAKE) -C $(dir $@)

$(LIBDIR)sclog4c.a: src/sclog4c.a | $(LIBDIR)
	cp $^ $@

$(INCDIR)sclog4c.h: include/sclog4c.h | $(INCDIR)
	cp $^ $@
