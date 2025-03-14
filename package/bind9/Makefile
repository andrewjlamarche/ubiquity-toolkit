#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := bind9
PKG_VERSION := 9.10.8
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://ftp.isc.org/isc/${PKG_NAME}/${PKG_VERSION}/bind-${PKG_VERSION}.tar.gz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --with-openssl=no --with-randomdev=no --with-libxml2=no --with-gost=no BUILD_CC=gcc

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

ifeq (${TARGET}, aarch64-linux-musl)
    CFLAGS := "-Os -static -fPIC"
endif

include ${TOPDIR}/rules.mk

DOWNLOAD_CMD = @cd ${TARGET} && wget -q ${PKG_SOURCE_URL} && mkdir ${PKG} && tar xf bind-9.10.8.* --one-top-level=${PKG} --strip-components 1