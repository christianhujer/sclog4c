#!/usr/bin/perl
# Prints help for a Makefile.
# Usual invocation (from make):
# help:
# 	perl makehelp.pl $(MAKEFILE_LIST)
#
# To make your make inline help documentation work, start documentation comments before a target or variable with double-hash.
# Example:
# .PHONY: all
# ## Compiles and links all sources.
# # This is the default target.
# all: ...

$version = "1.2";

sub changelog() {
    print <<END;
2012-11-11 1.2
    Implement changelog option.

END
}

sub help() {
    print <<END;
Usage: perl $0 MAKEFILE...
Prints the help text of one or more MAKEFILEs.

To be invoked from the Makefile with a rule like this:
help:
	perl $0 \$(MAKEFILE_LIST)

Supported options:
  -h, --help    Print this help text.
  -v, --version Print version information.

$0 prints the documentation of variables and goals.
A documentation comment is recognized as one or more comment lines right before a goal or variable definition,
of which the first comment line starts with ##.
The documentation comment may contain references to environment variables.
All references to environment variables will be replaced with their values.
This includes the make goal.
Note: To reference variables which are defined in the Makefile, don't forget to export them.

Example:
  .PHONY: all
  ## Performs the complete build of the project.
  # This is the default target.
  all: mybinary

  ## Flags for the C preprocessor.
  CPPFLAGS?=

  .PHONY: help
  ## Prints this help text.
  help:
  	perl $0 \$(MAKEFILE_LIST)

Report bugs to cher\@riedquat.de.
END
}

sub version() {
    print <<END;
makehelp.pl $version
(c) 2011 - 2012 Christian Hujer. All rights reserved.
Licensed under GPLv3.
See http://www.gnu.org/licenses/gpl.html for license information.
END
}

if ($ARGV[0] =~ /^-(c|-?changelog)$/) {
    changelog();
    exit 0;
} elsif ($ARGV[0] =~ /^-(h|-?help)$/) {
    help();
    exit 0;
} elsif ($ARGV[0] =~ /^-(v|-?version)$/) {
    version();
    exit 0;
} elsif ($ARGV[0] =~ /^(-.*)$/) {
    die "$0: Unknown command line option $1. Try $0 --help.";
}

while (<>) {
    if (/^## .*$/ ... /^([^.#\t][^:=]*:([^=]|$)|([^.#\t][^:=?]*(\?=|:=|=))|$)/) {
        s/^##? ?//;
        $h .= $p;
        $p = $_;
    } elsif ($h) {
        $p =~ s/(\?=|:=|=).*/=/;
        $p =~ s/:.*/:/;
        chomp $p;
        $p =~ s/\$\(([^)]*)\)/$ENV{$1}/ge;
        $h =~ s/\$\(([^)]*)\)/$ENV{$1}/ge;
        if ($p =~ /=$/) {
            $p =~ s/=$//;
            if ($h ne $vars{$p}) {
                $vars{$p} .= $h;
            }
        } else {
            $p =~ s/:$//;
            if ($h ne $goals{$p}) {
                $goals{$p} .= $h;
            }
        }
        undef $h;
        undef $p;
    }
}

print <<END;
Usage: make [OPTION|GOAL|VARIABLE]...
Runs make to make the specified GOALs.
If no GOAL is specified, the default goal is made (usually "all").

Popular make OPTIONs:
  -s    Silent mode, disables command echo.
  -k    Keep going, continues after errors.
  -j N  Run N jobs in parallel.
  -n    Don't run the commands, just print them.
  -q    Run no commands; exit status says if up to date.
  -h    Print make help text.
Use option -h to lists the GNUmake part of the help.
END

my $indent = " " x 20;
if (%vars) {
    print <<END;

A VARIABLE is specified as name=value pair.
Supported VARIABLEs:
END

    for (sort keys %vars) {
        $vars{$_} =~ s/^/$indent/gm;
        if (length > 16) {
            print "  $_\n$vars{$_}";
        } else {
            $tmpIndent = " " x (2 + length);
            $vars{$_} =~ s/^$tmpIndent//;
            print "  $_$vars{$_}";
        }
    }
}

print <<END;

Supported GOALs:
END

for (sort keys %goals) {
    $goals{$_} =~ s/^/$indent/gm;
    if (length > 16) {
        print "  $_\n$goals{$_}";
    } else {
        $tmpIndent = " " x (2 + length);
        $goals{$_} =~ s/^$tmpIndent//;
        print "  $_$goals{$_}";
    }
}
