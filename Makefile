# Copyright (C) 2014 Christian Hujer.
# All rights reserved.
# Licensed under LGPLv3.
# See file LICENSE in the root directory of this project.

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
