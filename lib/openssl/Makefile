#
# This makefile is part of the Ubiquity Toolkit.
#

include ${TOPDIR}/rules.mk

PKG_NAME := openssl
PKG_VERSION := 3.3.1
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://github.com/openssl/openssl/releases/download/${PKG}/${PKG}.tar.gz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := -static

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} ./Configure ${TYPE} ${CONFIGURE_FLAGS} --prefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} CFLAGS=${CFLAGS}
	$(MAKE) -C ${TARGET}/${PKG} install
