#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := mtr
PKG_VERSION := 0.95
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL :=
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS :=

# Git
GIT_SOURCE_URL := https://github.com/traviscross/mtr/
GIT_BRANCH := v${PKG_VERSION}

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && ./bootstrap.sh
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} CFLAGS=${CFLAGS} LDFLAGS=${LDFLAGS} ./configure ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build --bindir=${CURDIR}/${TARGET}/build --sbindir=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} install-exec
