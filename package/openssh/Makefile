#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := openssh
PKG_VERSION := 9.9-p2
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL :=
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --with-libs --with-zlib=${TOPDIR}/lib/zlib/${TARGET}/build/ --without-zlib-version-check --with-ssl-dir=${TOPDIR}/lib/openssl/${TARGET}/build/ --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build --bindir=${CURDIR}/${TARGET}/build --sbindir=${CURDIR}/${TARGET}/build --libexecdir=${CURDIR}/${TARGET}/build --sysconfdir=${CURDIR}/${TARGET}/build --disable-strip

# Git
GIT_SOURCE_URL := https://github.com/openssh/openssh-portable
GIT_BRANCH := V_9_9_P2

include ${TOPDIR}/rules.mk

LDFLAGS := -static

ifeq (${TARGET}, armeb-linux-musleabi)
	CFLAGS += "--with-prngd-socket=/dev/urandom"
endif

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && autoreconf
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} CFLAGS=${CFLAGS} LDFLAGS=${LDFLAGS} ./configure ${CONFIGURE_FLAGS} --host=${TARGET}
	$(MAKE) -C ${TARGET}/${PKG}
	$(MAKE) -C ${TARGET}/${PKG} install