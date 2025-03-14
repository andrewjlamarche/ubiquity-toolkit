#
# This makefile is part of the Ubiquity Toolkit.
#

include ${TOPDIR}/rules.mk

PKG_NAME := ncurses
PKG_VERSION := 6.4
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://ftp.gnu.org/gnu/ncurses/${PKG}.tar.gz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS :=

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} ./configure ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} CFLAGS=${CFLAGS}
	@cd ${TARGET}/${PKG}/ncurses && chmod +x tinfo/MKfallback.sh && ./tinfo/MKfallback.sh /usr/share/terminfo ../misc/terminfo.src `which tic` `which infocmp` linux vt100 xterm xterm-256color > fallback.c
	$(MAKE) -C ${TARGET}/${PKG} install
