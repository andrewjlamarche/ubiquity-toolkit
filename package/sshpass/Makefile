#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := sshpass
PKG_VERSION := 1.10
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://sourceforge.net/projects/sshpass/files/sshpass/${PKG_VERSION}/${PKG}.tar.gz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --bindir=${CURDIR}/${TARGET}/build ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk
