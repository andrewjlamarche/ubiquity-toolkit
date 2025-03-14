#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := gdb
PKG_VERSION := 15.1
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://ftp.gnu.org/gnu/${PKG_NAME}/${PKG}.tar.xz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --with-gmp=${TOPDIR}/lib/gmp/${TARGET}/build/ --with-mpfr=${TOPDIR}/lib/mpfr/${TARGET}/build/ --disable-docs --disable-binutils --disable-gas --disable-sim --disable-gprof --disable-inprocess-agent --enable-targets=all

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} ./configure LDFLAGS="-static -static-libstdc++" ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} 
