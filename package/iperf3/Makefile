#
# This makefile is part of the Ubiquity Toolkit.
#

PKG_NAME := iperf3
PKG_VERSION := 3.17.1
PKG := ${PKG_NAME}-${PKG_VERSION}
PKG_SOURCE_URL := https://github.com/esnet/iperf/releases/download/${PKG_VERSION}/iperf-${PKG_VERSION}.tar.gz
PKG_HASH :=

# Configuration
CONFIGURE_FLAGS := --with-openssl=no --enable-static-bin --disable-shared

# Git
GIT_SOURCE_URL :=
GIT_BRANCH :=

include ${TOPDIR}/rules.mk

DOWNLOAD_CMD = @cd ${TARGET} && wget -q ${PKG_SOURCE_URL} && mkdir ${PKG} && tar xf iperf-${PKG_VERSION}.* --one-top-level=${PKG} --strip-components 1
