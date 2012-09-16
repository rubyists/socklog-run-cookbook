socklog-run-cookbook
====================
A chef cookbook for socklog-run, an ubuntu and debian package which replaces the system logger with socklog.

Description
===========
socklog, in cooperation with the runit package, is a small and secure replacement for syslogd.
This will install socklog-run, which replaces the syslog daemon on debian-based distributions
More information about socklog can be found at http://smarden.org/socklog

Requirements
============
Requires runit to be installed.

Attributes
==========
Based on Kevin Berry's socklog cookbook

Usage
=====
Add the socklog-run recipe to a run\_list, then check out the symlinks in /var/log/. The "real" logs
will be in /var/log/socklog/\*/, take a look there, too.

