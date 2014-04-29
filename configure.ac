#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT([quartz-engine],[0.1],[aruiz@gnome.org])
AC_PREREQ([2.69])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([config])
AC_CONFIG_SRCDIR([README])
AC_CONFIG_HEADERS([config.h])

AC_CANONICAL_TARGET dnl# also checks the respective "_HOST"
AC_USE_SYSTEM_EXTENSIONS
AM_INIT_AUTOMAKE([1.9 dist-bzip2 no-define gnits])
AM_MAINTAINER_MODE
AM_SANITY_CHECK

# Checks for programs.
AM_PROG_AR
AC_PROG_CPP
AC_PROG_CXX
AC_PROG_OBJC
AC_PROG_OBJCPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_DEFUN([AC_REQUIRE_RANLIB],[
  AC_REQUIRE([AC_PROG_RANLIB])
])
if test "x${RANLIB}" = "x"; then
  test -z "${RANLIB}"
  AC_REQUIRE_RANLIB
else
  test ! -z "${RANLIB}" && export RANLIB
  AC_SUBST([RANLIB])
fi
AC_DISABLE_STATIC([])
LT_INIT([disable-static dlopen])

# Checks for libraries.
LT_LIB_M
AC_CHECK_LIB([objc],[sel_getName],[],[
  AC_CHECK_LIB([objc],[main])
])
PKG_CHECK_MODULES([GTK],[gtk+-2.0 >= 2.10.0],[],
                  [AC_MSG_ERROR([Need GTK+ 2.10 to compile quartz-engine])
])
PKG_CHECK_MODULES([GTKQUARTZ],[gdk-quartz-2.0 >= 2.10.0],[],
                  [AC_MSG_WARN([GTK+ built without quartz support])
])

GTK_VERSION=`${PKG_CONFIG} --variable=gtk_binary_version gtk+-2.0`
AC_SUBST([GTK_VERSION])

# Checks for header files.
AC_HEADER_STDBOOL dnl# also "_CHECK"s it
AC_CHECK_HEADERS([stdio.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_BIGENDIAN
AC_C_PROTOTYPES

# Checks for library functions.
AC_CHECK_FUNC([gdk_quartz_drawable_get_context],[],[
  AC_SEARCH_LIBS([gdk_quartz_drawable_get_context],
                 [gtk gdk gdk-quartz gdk-quartz-2.0 gdk-x11 gdk-x11-2.0 gtk-quartz gtk-quartz-2.0 gtk-x11 gtk-x11-2.0])
])
AC_CHECK_FUNC([gdk_quartz_drawable_release_context],[],[
  AC_SEARCH_LIBS([gdk_quartz_drawable_release_context],
                 [gtk gdk gdk-quartz gdk-quartz-2.0 gdk-x11 gdk-x11-2.0 gtk-quartz gtk-quartz-2.0 gtk-x11 gtk-x11-2.0])
])

# Output:
AC_CONFIG_FILES([
  Makefile
  src/Makefile
  theme/Makefile
])
AC_OUTPUT 
