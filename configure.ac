#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT([quartz-engine], [0.1])
AC_PREREQ([2.59])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([config])
AC_CONFIG_SRCDIR([README])
AC_CONFIG_HEADERS([config.h])

AC_CANONICAL_HOST
AC_CANONICAL_TARGET
AC_USE_SYSTEM_EXTENSIONS
AM_INIT_AUTOMAKE(1.9 dist-bzip2 no-define)
AM_MAINTAINER_MODE
AM_SANITY_CHECK

# Checks for programs.
AC_PROG_CC
AC_PROG_CC_C_O
AC_PROG_CXX
AC_PROG_OBJC
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_RANLIB
AM_DISABLE_STATIC
AM_PROG_LIBTOOL

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lobjc':
AC_CHECK_LIB([objc], [main])
PKG_PROG_PKG_CONFIG
PKG_CHECK_MODULES([GTK], [gtk+-2.0 >= 2.10.0],[],
                  [AC_MSG_ERROR([GTK+ 2.10 is required to compile quartz-engine])])

GTK_VERSION=`$PKG_CONFIG --variable=gtk_binary_version gtk+-2.0`
AC_SUBST(GTK_VERSION)

# Checks for header files.
AC_CHECK_HEADERS([string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL

AC_OUTPUT([
  Makefile
  src/Makefile
  theme/Makefile
]) 
