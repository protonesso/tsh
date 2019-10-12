# PD Bourne/Korn Shell
# $Id: Makefile,v 1.5 93/05/08 15:59:28 sjg Exp $

SHELL = /bin/sh
MAKE  = make
CC=gcc -pipe -O2
LN=ln -s
#LN=ln
CONFIG= -D_SYSV
#CONFIG= -D_BSD 
#CONFIG= -D_BSD -DHAVE_SYS_STDTYPES
#CONFIG= -D_V7
#CONFIG= -D_ST				# Atari ST
#CONFIG= -D_BSDI -D_POSIX_TERM		# BSD/386
#CONFIG= -D_BSD -D_POSIX_TERM		# 386bsd
MANPAGES = tsh.1
#MANDIR=/usr/catman/u_man/man1
#MANDIR=/usr/man/man1

#INSTALL=bsdinstall
INSTALL=install

DESTDIR=/usr
MANDESTDIR=$(DESTDIR)/man

all:	tsh

tsh:	
	( cd sh ; $(MAKE) 'CC=$(CC)' 'CONFIG=$(CONFIG)' $@ )

libs:
	( cd std ; $(MAKE) 'CC=$(CC)' 'CONFIG=$(CONFIG)' 'LN=$(LN)' libs )

install: sh/tsh inst-man
	( cd sh ; $(INSTALL) -s -m 755 -o root -g root tsh $(DESTDIR)/bin )

sh/tsh:	tsh

inst-man: $(MANPAGES)
	$(INSTALL) -c -m 444 -o root -g man $(MANPAGES) $(MANDESTDIR)/man1

uninstall:
	rm -f $(DESTDIR)/bin/tsh
	for i in $(MANPAGES) ; do \
		rm -f $(MANDESTDIR)/man1/$$i ;\
	done

clean clobber:
	( cd std ; $(MAKE) $@ )
	( cd sh ; $(MAKE) $@ )
	-rm -f *.out

