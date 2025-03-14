#
# This makefile is part of the Ubiquity Toolkit.
#

include ${TOPDIR}/rules.mk

PKG_NAME := zlib
PKG_VERSION := 1.3.1
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://www.zlib.net/${PKG}.tar.xz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := "--static"

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} ./configure ${CONFIGURE_FLAGS} --prefix=${CURDIR}/${TARGET}/build --eprefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} CFLAGS=${CFLAGS} install
