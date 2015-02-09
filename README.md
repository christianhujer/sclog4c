# sclog4c

Simple configurable logging for C.

## Compiler Support

### Supported
- GCC
    Tested versions: 4.5.2, 4.9.1
    Any version 4.5.2 or newer should work.
    Older versions probably work, too, as long as they implement `__VA_ARGS__` and `##__VA_ARGS__`.
    To build with `gcc`, simply use `make` on systems where GCC is default, otherwise use `make CC=gcc`.
- clang
    Tested versions: 3.5.0
    Any version 3.5.0 or newer should work.
    Older versions probably work, too, as long as they implement `__VA_ARGS__` and `##_VA_ARGS__`.
    To build with `clang`, simply use `make CC=clang`.
- armcc
    Tested version: 5.10
- Visual Studio
    Not tested
    Any version Visual Studio 2005 or newer should work.

### Support Incomplete
compilation works, but logging doesn't work:
- Keil C251
    Tested version: V5.55.0.0
    Gives warning message if `logm()` is used with format arguments.

## Support Planned
- Intel
- Keil C166
- Keil C51
- UCC
- NetBeans
- Open64
- Solaris Studio
- PC-Lint (if somebody sponsors it)

## Features

### Implemented Features
- API similar to `java.util.logging` - easy to learn, easy to use.
- Tiny
- Runtime loglevel configuration
- Formattable log message
- Tries to print the log message in a single `fprintf()` call.
  This is important for multitasking and multithreading to prevent distorted output.
  This only works if the compiler supports a form of `##__VA_ARGS__`, i.e. doesn't fall over if an empty `__VA_ARGS__` is used after comma.
- Compile-time loglevel configuration via macro `SCLOG4C_LEVEL` for code size reduction.
  You can specify `SCLOG4C_LEVEL` on a per-module basis, like `xzy.o: CPPFLAGS+=-DSCLOG4C_LEVEL=DEBUG` in your `Makefile`.
  Note: In order for this feature to work nicely, it's expected that the compiler removes dead code.
  You can check if your compiler does so by telling your compiler to keep temp files (for `gcc` and `clang` this is `CFLAGS+=-save-temps`) and look at the assembly file (usually `.s`).

### Planned Features
- Per-module-logging
- Tiny logging for embedded devices with severely resource constraint environments (i.e. 8051).
- API Improvements

### Features Not Planned
- XML configuration file, XML logging.
  This is a simple logging framework.
  If you're looking for something powerful, like a "Log4J" for C, use log4c or zlog.

## Usage

To use sclog4c, `#include <sclog4c/sclog4c.h>` at the start of your source file.
Invoke the `logm()` macro to perform logging.
Use the `sclog4c_level` variable to control the log level at runtime (defaults to `ALL`).
Use the `SCLOG4C_LEVEL` macro to control the log level at compile time (defaults to `WARNING`).

Example:

~~~~
#include <sclog4c/sclog4c.h>

int main(int argc, char *argv[])
{
    sclog4c_level = ALL;
    logm(DEBUG, "Program name: %s", argv[0]);
    return 0;
}
~~~~

## Other logging frameworks for C
- log4c http://log4c.sourceforge.net/
- syslog facility (mostly for daemons) http://tools.ietf.org/html/rfc5424 / http://man7.org/linux/man-pages/man3/syslog.3.html
- zlog https://github.com/HardySimpson/zlog
