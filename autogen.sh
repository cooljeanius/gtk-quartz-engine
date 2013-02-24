#!/bin/sh
# Run this to generate all the initial makefiles, etc.

PROJECT=quartz-engine

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.
DIE=0

THEDIR=`pwd`
cd $srcdir

echo "checking for autoconf..."
(autoconf --version) < /dev/null > /dev/null 2>&1 || {
	echo
	echo "You must have autoconf installed to compile GTK+."
	echo "Download the appropriate package for your distribution,"
	echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
	DIE=1
}

echo "checking for automake..."
if automake-1.13 --version < /dev/null > /dev/null 2>&1 ; then
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
elif automake-1.8 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.8
    ACLOCAL=aclocal-1.8
elif automake-1.7 --version < /dev/null > /dev/null 2>&1 ; then
    AUTOMAKE=automake-1.7
    ACLOCAL=aclocal-1.7
else
        echo
        echo "You must have automake >=1.7.x installed to compile $PROJECT."
        echo "Install the appropriate package for your distribution,"
        echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
        DIE=1
fi

echo "checking for glibtool..."
(glibtool --version) < /dev/null > /dev/null 2>&1 || {
	echo
	echo "You must have libtool installed to compile $PROJECT."
	echo "Get http://ftp.gnu.org/gnu/libtool/libtool-1.5.22.tar.gz"
	echo "(or a newer version if it is available)"
	DIE=1
}
if test "$DIE" -eq 1; then
	exit 1
fi

echo "running glibtoolize..."
glibtoolize --force --copy

echo "running aclocal..."
$ACLOCAL $ACLOCAL_FLAGS
echo "running autoheader..."
autoheader
echo "running automake..."
$AUTOMAKE --add-missing < /dev/null > /dev/null 2>&1
echo "running autoconf..."
autoconf
cd $THEDIR

