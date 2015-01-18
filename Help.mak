# File to include from your Makefile.
# To update these files, run

.PHONY: help
## Prints this help message.
help: makehelp.pl
	@perl makehelp.pl $(MAKEFILE_LIST)

ifeq "updateMakehelp" "$(filter updateMakehelp,$(MAKECMDGOALS))"
.PHONY: makehelp.pl Help.mak
endif
# If -N does not work, that's because github doesn't send Last-Modified header.
makehelp.pl Help.mak:
	wget -N -q --no-check-certificate https://github.com/christianhujer/makehelp/raw/master/$@

.PHONY: updateMakehelp
## Updates makehelp.pl
updateMakehelp: makehelp.pl Help.mak
