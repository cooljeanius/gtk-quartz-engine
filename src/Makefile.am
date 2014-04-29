AM_CPPFLAGS = $(GTK_CFLAGS) -xobjective-c -Wall

enginedir = $(libdir)/gtk-2.0/$(GTK_VERSION)/engines
engine_LTLIBRARIES = libquartz.la

libquartz_la_SOURCES = \
        quartz-theme-main.c	\
	quartz-style.c		\
	quartz-style.h		\
	quartz-rc-style.c	\
	quartz-rc-style.h	\
	quartz-draw.c		\
	quartz-draw.h

libquartz_la_LDFLAGS = -module -avoid-version -no-undefined -framework Carbon -framework AppKit
libquartz_la_LIBADD =  $(GTK_LIBS) -lobjc

check_PROGRAMS = testquartzengine

testquartzengine_SOURCES = test.c
testquartzengine_LDADD = $(GTK_LIBS)
