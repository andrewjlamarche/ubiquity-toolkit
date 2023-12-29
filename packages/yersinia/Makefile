PKG_NAME:=yersinia
PKG_VERSION:=0.8.2
PKG:=$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG).tar.gz
PKG_SOURCE_URL:=https://github.com/soxrok2212/yersinia
PKG_SOURCE_BRANCH:=crosscompile
PKG_HASH:=

FULL_PATH := $(shell dirname $(shell dirname $(shell pwd)))

ARCH ?= x86_64-linux-musl
CFLAGS := -Os -static
CC := $(ARCH)-gcc
CXX := $(ARCH)-g++
STRIP := $(ARCH)-strip
CONFIGURE_FLAGS := --with-pcap-includes=$(FULL_PATH)/libs/libpcap/$(ARCH)/libpcap-1.10.4 --with-libnet-includes=$(FULL_PATH)/libs/libnet/$(ARCH)/libnet-1.3/include --with-ncurses=$(FULL_PATH)/libs/ncurses/$(ARCH)/ncurses-6.4 --disable-admin --disable-gtk
MAKEFLAGS := -j $(shell nproc)

TARGET ?= linux-x86_64
SUFFIX ?= -x64

.PHONY: all
all: compile archive

ifeq ($(ARCH), aarch64-linux-musl)
    TARGET := linux-aarch64
    SUFFIX := arm64
else ifeq ($(ARCH), arm-linux-musleabi)
    TARGET := linux-generic32
    SUFFIX := arm32
else ifeq ($(ARCH), mips64-linux-musl)
    TARGET := linux-generic64
    SUFFIX := mips64
else ifeq ($(ARCH), mips-linux-musl)
    TARGET := linux-generic32
    SUFFIX := mips32
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
	$(error yersinia not supported yet)
	@mkdir $(ARCH)
	@echo "I: downloading $(PKG_SOURCE)"
	@cd $(ARCH) && git clone $(PKG_SOURCE_URL) -b $(PKG_SOURCE_BRANCH) $(PKG)

compile: download
	@echo "I: building $(PKG_NAME)"
	@cd $(ARCH)/$(PKG) && ./autogen.sh
	@cd $(ARCH)/$(PKG) && CFLAGS="$(CFLAGS)" CC="$(CC)" CXX="$(CXX)" ./configure --host=$(ARCH) $(CONFIGURE_FLAGS)
	@cd $(ARCH)/$(PKG) && make $(MAKEFLAGS)

archive: compile
	@echo "I: archiving"
	@mkdir $(ARCH)/bin
	@cp $(ARCH)/$(PKG)/yersinia $(ARCH)/bin/yersinia-$(SUFFIX)
	@$(STRIP) $(ARCH)/bin/*

clean:
	@echo "I: cleaning up"
	@rm -rf *linux*


