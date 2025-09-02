#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := masscan
PKG_VERSION := master
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL :=
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := 

# Git
GIT_SOURCE_URL := https://github.com/robertdavidgraham/masscan
GIT_BRANCH := ${PKG_VERSION}

include ${TOPDIR}/rules.mk

LDFLAGS := "-L ${TOPDIR}/lib/libpcap/${TARGET}/build/lib"
CFLAGS := "-Os -DSTATICPCAP -static -I ${TOPDIR}/lib/libpcap/${TARGET}/build/include"

ifeq (${TARGET}, mips64el-linux-musl)
	CFLAGS += "-fPIC"
else ifeq (${TARGET}, mipsel-linux-musl)
	CFLAGS += "-fPIC"
endif

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && patch -p1 < ../../patches/pcap-stub.patch
	$(MAKE) -C ${TARGET}/${PKG} CC=${CC} CXX=${CXX} CFLAGS=${CFLAGS} LDFLAGS=${LDFLAGS}
	@mkdir ${TARGET}/build
	@cp ${TARGET}/${PKG}/bin/* ${TARGET}/build
