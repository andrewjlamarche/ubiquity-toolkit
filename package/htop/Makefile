#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := htop
PKG_VERSION := 3.3.0
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://github.com/htop-dev/htop/releases/download/${PKG_VERSION}/${PKG}.tar.xz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --enable-static --disable-unicode

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

CFLAGS := "-Os -static -I${TOPDIR}/lib/ncurses/${TARGET}/build/include/"
LDFLAGS := "-L${TOPDIR}/lib/ncurses/${TARGET}/build/lib/"
