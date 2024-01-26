PKG_NAME:=inetutils
PKG_VERSION:=2.4
PKG:=$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG).tar.gz
PKG_SOURCE_URL:=https://ftp.gnu.org/gnu/inetutils/$(PKG_SOURCE)
PKG_HASH:=

ARCH ?= x86_64-linux-musl
CFLAGS := -Os -static
CC := $(ARCH)-gcc
CXX := $(ARCH)-g++
STRIP := $(ARCH)-strip
CONFIGURE_FLAGS := --disable-ifconfig
MAKEFLAGS := -j $(shell nproc)

TARGET ?= linux-x86_64
SUFFIX ?= x64

.PHONY: all
all: compile archive

ifeq ($(ARCH), aarch64-linux-musl)
    TARGET := linux-aarch64
    SUFFIX := arm64
else ifeq ($(ARCH), arm-linux-musleabi)
    TARGET := linux-generic32
    SUFFIX := arm32
else ifeq ($(ARCH), armeb-linux-musleabi)
    TARGET := linux-generic32
    SUFFIX := arm32eb
else ifeq ($(ARCH), mips64-linux-musl)
    TARGET := linux-generic64
    SUFFIX := mips64
else ifeq ($(ARCH), mips-linux-musl)
    TARGET := linux-generic32
    SUFFIX := mips32
else ifeq ($(ARCH), mips64el-linux-musl)
    TARGET := linux-generic64
    SUFFIX := mips64el
else ifeq ($(ARCH), mipsel-linux-musl)
    TARGET := linux-generic32
    SUFFIX := mips32el
else ifeq ($(ARCH), riscv64-linux-musl)
    TARGET := linux-riscv64
    SUFFIX := riscv64
else ifeq ($(ARCH), i386-linux-musl)
    TARGET := linux-x86
    SUFFIX := x86
else ifeq ($(ARCH), x86_64-linux-musl)
    TARGET := linux-x86-64
    SUFFIX := x64
else
    $(error E: a valid arch must be specified)
endif

download:
	@mkdir $(ARCH)
	@echo "I: downloading $(PKG_SOURCE)"
	@cd $(ARCH) && wget -q $(PKG_SOURCE_URL)
	@cd $(ARCH) && tar xzf $(PKG_SOURCE)

compile: download
	@echo "I: building $(PKG_NAME)"
	@cd $(ARCH)/$(PKG) && CFLAGS="$(CFLAGS)" CC="$(CC)" CXX="$(CXX)" ./configure --host=$(ARCH) $(CONFIGURE_FLAGS)
	@cd $(ARCH)/$(PKG) && make $(MAKEFLAGS)

archive: compile
	@echo "I: archiving"
	@mkdir $(ARCH)/bin
	@cp $(ARCH)/$(PKG)/ftp/ftp $(ARCH)/bin/ftp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ftpd/ftpd $(ARCH)/bin/ftpd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ping/ping $(ARCH)/bin/ping-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ping/ping6 $(ARCH)/bin/ping6-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/telnet/telnet $(ARCH)/bin/telnet-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/telnetd/telnetd $(ARCH)/bin/telnetd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/whois/whois $(ARCH)/bin/whois-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/hostname $(ARCH)/bin/hostname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tftp $(ARCH)/bin/tftp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tftpd $(ARCH)/bin/tftpd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/traceroute $(ARCH)/bin/traceroute-$(SUFFIX)
	@$(STRIP) $(ARCH)/bin/*

clean:
	@echo "I: cleaning up"
	@rm -rf *linux*

