#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := busybox
PKG_VERSION := 1.36.1
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://www.busybox.net/downloads/${PKG}.tar.bz2
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := CROSS_COMPILE="${TARGET}-"

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

DOWNLOAD_CMD = @cd ${TARGET} && wget -q ${PKG_SOURCE_URL} && mkdir ${PKG} && tar xf ${PKG}.* --one-top-level=${PKG} --strip-components 1 && cp ../.config ${PKG}

compile: download
	@echo "I: building ${PKG}"
	$(MAKE) -C ${TARGET}/${PKG} CFLAGS=${CFLAGS} ${CONFIGURE_FLAGS}

archive: compile
	@mkdir -p ${TARGET}/build
	@cp ${TARGET}/${PKG}/busybox ${TARGET}/build/busybox-${SUFFIX}