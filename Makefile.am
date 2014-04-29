ACLOCAL_AMFLAGS = -I m4 --install

SUBDIRS = src theme

EXTRA_DIST = \
	autogen.sh	\
	COPYING

DISTCLEANFILES = *~ .DS_Store autoscan.log

MAINTAINERCLEANFILES = configure.scan

configure.scan:
	autoscan || touch configure.scan

distclean-local:
	rm -f @PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar.gz
	rm -f @PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar.bz2
	rm -rf autom4te.cache || rmdir autom4te.cache
	(test -w @PACKAGE_TARNAME@-@PACKAGE_VERSION@ && (rm -rf @PACKAGE_TARNAME@-@PACKAGE_VERSION@ || rmdir @PACKAGE_TARNAME@-@PACKAGE_VERSION@)) || stat @PACKAGE_TARNAME@-*.* || true
