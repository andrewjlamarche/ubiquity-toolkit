#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := nmap
PKG_VERSION := 7.95
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://nmap.org/dist/$(PKG).tgz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --without-ndiff --without-zenmap

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

# Nmap doesn't like our MAKEFLAGS, only pull jobservers
JOBS := $(filter -j%,$(MAKEFLAGS))
JOBFLAGS := $(if $(JOBS),$(JOBS),)

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} ./configure ${CONFIGURE_FLAGS} --host=${TARGET}
	MAKEFLAGS=${JOBFLAGS} $(MAKE) -C ${TARGET}/${PKG} static
	@mkdir -p ${CURDIR}/${TARGET}/build
	@cp ${TARGET}/${PKG}/nmap ${CURDIR}/${TARGET}/build
	@cp ${TARGET}/${PKG}/ncat/ncat ${CURDIR}/${TARGET}/build
	@cp ${TARGET}/${PKG}/nping/nping ${CURDIR}/${TARGET}/build
