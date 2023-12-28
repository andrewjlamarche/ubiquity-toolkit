PKG_NAME:=tcpdump
PKG_VERSION:=4.99.4
PKG:=$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG).tar.gz
PKG_SOURCE_URL:=https://www.tcpdump.org/release/${PKG_SOURCE}
PKG_HASH:=

ARCH ?= x86_64-linux-musl
CFLAGS := -Os -static
#LDFLAGS := -L../../../../libs/libpcap/$(ARCH)/libpcap-1.10.4 -I../../../../libs/libpcap/$(ARCH)/libpcap-1.10.4
CC := $(ARCH)-gcc
CXX := $(ARCH)-g++
STRIP := $(ARCH)-strip
CONFIGURE_FLAGS := --with-cap-ng=../../../../libs/libpcap/$(ARCH)/libpcap-1.10.4 --disable-local-libpcap
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
	@mkdir $(ARCH)
	@echo "I: downloading $(PKG_SOURCE)"
	@cd $(ARCH) && wget -q $(PKG_SOURCE_URL)
	@cd $(ARCH) && tar xzf $(PKG_SOURCE)

compile: download
	@echo "I: building $(PKG_NAME)"
	@cd $(ARCH)/$(PKG) && LDFLAGS="$(LDFLAGS)" CFLAGS="$(CFLAGS)" CC="$(CC)" CXX="$(CXX)" ./configure --host=$(ARCH) $(CONFIGURE_FLAGS)
	@cd $(ARCH)/$(PKG) && make $(MAKEFLAGS)

archive: compile
	@echo "I: archiving"
	@mkdir $(ARCH)/bin
	@cp $(ARCH)/$(PKG)/socat $(ARCH)/bin/socat-$(SUFFIX)
	@$(STRIP) $(ARCH)/bin/*

clean:
	@echo "I: cleaning up"
	@rm -rf *linux*

