sclog4c
=======

Simple configurable logging for C.

Supported Compilers:
- GCC
    Tested version: 4.5.2.
    Any version 4.5.2 or newer should work.
    Older versions probably work, too, as long as they implement __VA_ARGS__ and ##__VA_ARGS__.
- armcc
    Tested version: 5.10
- Visual Studio
    Not tested
    Any version Visual Studio 2005 or newer should work.

Unsupported Compilers (compilation works, but logging doesn't work):
- Keil C251
    Tested version: V5.55.0.0
    Gives warning message if logm() is used with format arguments.

Planned Compilers:
- Clang
- Intel
- Keil C166
- Keil C51
- UCC
- NetBeans
- Open64
- Solaris Studio

Planned Features:
- Runtime logging decision vs. Compile time logging decision
- Per-module-logging
- Tiny logging for embedded devices with severely resource constraint environments (i.e. 8051).
- More convenient API.  Note that this will come a bit later to ensure that other features do not require changes to existing API.

Features not planned:
- XML configuration file, XML logging.
  This is a simple logging framework.
  If you're looking for something powerful, like a "Log4J" for C, use log4c or zlog.


Other logging frameworks:
- log4c http://log4c.sourceforge.net/
- zlog https://github.com/HardySimpson/zlog
