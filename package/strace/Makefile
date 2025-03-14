#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := strace
PKG_VERSION := 6.13
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL :=
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --bindir=${CURDIR}/${TARGET}/build

# Git
GIT_SOURCE_URL := https://github.com/strace/strace
GIT_BRANCH := v6.13

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && ./bootstrap
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} CFLAGS=${CFLAGS} LDFLAGS=${LDFLAGS} ./configure ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} install