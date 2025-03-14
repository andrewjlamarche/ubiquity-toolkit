#
# This makefile is part of the Ubiquity Toolkit.
#

include ${TOPDIR}/rules.mk

PKG_NAME := mpfr
PKG_VERSION := 4.2.1
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://ftp.gnu.org/gnu/${PKG_NAME}/${PKG}.tar.xz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS :=

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} ./configure ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build --with-gmp=${TOPDIR}/lib/gmp/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} CFLAGS=${CFLAGS} install
