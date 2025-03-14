#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := libnet
PKG_VERSION := 1.3
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL :=
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS :=

# Git
GIT_SOURCE_URL := https://github.com/libnet/libnet
GIT_BRANCH := v${PKG_VERSION}

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && ./autogen.sh && CC=${CC} CXX=${CXX} ./configure ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} CFLAGS=${CFLAGS} install
	@chmod +x ${TARGET}/build/bin/libnet-config
