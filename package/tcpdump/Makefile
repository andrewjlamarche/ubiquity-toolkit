#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := tcpdump
PKG_VERSION := 4.99.5
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://www.tcpdump.org/release/${PKG}.tar.gz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --with-crypto=${TOPDIR}/lib/openssl/${TARGET}/build --bindir=${CURDIR}/${TARGET}/build

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

CFLAGS := "-Os -static -DHAVE_FCNTL_H -I ${TOPDIR}/lib/libpcap/${TARGET}/build/include"
LDFLAGS := "-L ${TOPDIR}/lib/libpcap/${TARGET}/build/lib"
