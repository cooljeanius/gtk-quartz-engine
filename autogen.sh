#!/bin/sh
# Run this to generate all the initial makefiles, etc.
# Or just run autoreconf instead.

PROJECT=quartz-engine

srcdir=`dirname $0`
test -z "${srcdir}" && srcdir=.
DIE=0

THEDIR=`pwd`
cd ${srcdir}

echo "checking for autoconf..."
(autoconf --version) < /dev/null > /dev/null 2>&1 || {
	echo ""
	echo "You must have autoconf installed to compile GTK+."
	echo "Download the appropriate package for your distribution,"
	echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
	DIE=1
}

echo "checking for automake..."
if automake-1.14 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.14
    ACLOCAL=aclocal-1.14
elif automake-1.13 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.13
    ACLOCAL=aclocal-1.13
elif automake-1.12 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.12
    ACLOCAL=aclocal-1.12
elif automake-1.11 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.11
    ACLOCAL=aclocal-1.11
elif automake-1.10 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.10
    ACLOCAL=aclocal-1.10
elif automake-1.9 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.9
    ACLOCAL=aclocal-1.9
else
        echo ""
        echo "You must have automake >=1.9.x installed to compile ${PROJECT}."
        echo "Install the appropriate package for your distribution,"
        echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
        DIE=1
fi

echo "checking for glibtool..."
(glibtool --version) < /dev/null > /dev/null 2>&1 || {
	echo ""
	echo "You must have libtool installed to compile ${PROJECT}."
	echo "Get http://ftp.gnu.org/gnu/libtool/libtool-1.5.22.tar.gz"
	echo "(or a newer version if it is available)"
	DIE=1
}
if test "${DIE}" -eq 1; then
	exit 1
fi

echo "running glibtoolize..."
glibtoolize --force --copy --automake

if test -z "${ACLOCAL_FLAGS}"; then
	ACLOCAL_FLAGS="--force --warnings=all"
fi
ACLOCAL_AMFLAGS=`test -e Makefile.am && (grep "ACLOCAL_AMFLAGS" < Makefile.am | cut -d\= -f2)`
echo "running aclocal ${ACLOCAL_FLAGS} ${ACLOCAL_AMFLAGS}..."
${ACLOCAL} ${ACLOCAL_FLAGS} ${ACLOCAL_AMFLAGS}
echo "running autoheader..."
autoheader --force --warnings=all
echo "running automake..."
${AUTOMAKE} --add-missing --copy --force-missing --warnings=all < /dev/null > /dev/null 2>&1
echo "running autoconf..."
autoconf --force --warnings=all
cd ${THEDIR}
echo "ready to configure in `pwd`"

exit 0
