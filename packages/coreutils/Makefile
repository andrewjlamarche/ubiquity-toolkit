PKG_NAME:=coreutils
PKG_VERSION:=9.4
PKG:=$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG).tar.gz
PKG_SOURCE_URL:=https://ftp.gnu.org/gnu/coreutils/${PKG_SOURCE}
PKG_HASH:=

FULL_PATH := $(shell dirname $(shell dirname $(shell pwd)))

ARCH ?= x86_64-linux-musl
CFLAGS := -Os -static
CC := $(ARCH)-gcc
CXX := $(ARCH)-g++
STRIP := $(ARCH)-strip
CONFIGURE_FLAGS := 
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
	@cd $(ARCH)/$(PKG) && LDFLAGS="$(LDFLAGS)" CFLAGS="$(CFLAGS)" DEFS="$(DEFS)" CC="$(CC)" CXX="$(CXX)" ./configure --host=$(ARCH) $(CONFIGURE_FLAGS)
	@cd $(ARCH)/$(PKG) && make $(MAKEFLAGS)

archive: compile
	@echo "I: archiving"
	@mkdir $(ARCH)/bin
	@cp $(ARCH)/$(PKG)/src/\[ $(ARCH)/bin/\[-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/b2sum $(ARCH)/bin/b2sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/base32 $(ARCH)/bin/base32-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/base64 $(ARCH)/bin/base64-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/basename $(ARCH)/bin/basename-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/basenc $(ARCH)/bin/basenc-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/cat $(ARCH)/bin/cat-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/chcon $(ARCH)/bin/chcon-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/chgrp $(ARCH)/bin/chgrp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/chmod $(ARCH)/bin/chmod-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/chown $(ARCH)/bin/chown-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/chroot $(ARCH)/bin/chroot-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/cksum $(ARCH)/bin/cksum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/comm $(ARCH)/bin/comm-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/cp $(ARCH)/bin/cp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/csplit $(ARCH)/bin/csplit-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/cut $(ARCH)/bin/cut-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/date $(ARCH)/bin/date-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/dd $(ARCH)/bin/dd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/df $(ARCH)/bin/df-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/dir $(ARCH)/bin/dir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/dircolors $(ARCH)/bin/dircolors-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/dirname $(ARCH)/bin/dirname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/du $(ARCH)/bin/du-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/echo $(ARCH)/bin/echo-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/env $(ARCH)/bin/env-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/expand $(ARCH)/bin/expand-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/expr $(ARCH)/bin/expr-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/factor $(ARCH)/bin/factor-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/false $(ARCH)/bin/false-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/fmt $(ARCH)/bin/fmt-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/fold $(ARCH)/bin/fold-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/getlimits $(ARCH)/bin/getlimits-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/ginstall $(ARCH)/bin/ginstall-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/groups $(ARCH)/bin/groups-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/head $(ARCH)/bin/head-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/hostid $(ARCH)/bin/hostid-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/id $(ARCH)/bin/id-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/join $(ARCH)/bin/join-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/kill $(ARCH)/bin/kill-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/libstdbuf.so $(ARCH)/bin/libstdbuf.so-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/link $(ARCH)/bin/link-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/ln $(ARCH)/bin/ln-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/logname $(ARCH)/bin/logname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/ls $(ARCH)/bin/ls-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/make-prime-list $(ARCH)/bin/make-prime-list-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/md5sum $(ARCH)/bin/md5sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/mkdir $(ARCH)/bin/mkdir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/mkfifo $(ARCH)/bin/mkfifo-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/mknod $(ARCH)/bin/mknod-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/mktemp $(ARCH)/bin/mktemp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/mv $(ARCH)/bin/mv-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/nice $(ARCH)/bin/nice-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/nl $(ARCH)/bin/nl-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/nohup $(ARCH)/bin/nohup-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/nproc $(ARCH)/bin/nproc-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/numfmt $(ARCH)/bin/numfmt-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/od $(ARCH)/bin/od-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/paste $(ARCH)/bin/paste-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/pathchk $(ARCH)/bin/pathchk-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/pinky $(ARCH)/bin/pinky-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/pr $(ARCH)/bin/pr-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/printenv $(ARCH)/bin/printenv-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/printf $(ARCH)/bin/printf-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/ptx $(ARCH)/bin/ptx-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/pwd $(ARCH)/bin/pwd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/readlink $(ARCH)/bin/readlink-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/realpath $(ARCH)/bin/realpath-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/rm $(ARCH)/bin/rm-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/rmdir $(ARCH)/bin/rmdir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/runcon $(ARCH)/bin/runcon-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/seq $(ARCH)/bin/seq-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sha1sum $(ARCH)/bin/sha1sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sha224sum $(ARCH)/bin/sha224sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sha256sum $(ARCH)/bin/sha256sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sha384sum $(ARCH)/bin/sha384sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sha512sum $(ARCH)/bin/sha512sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/shred $(ARCH)/bin/shred-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/shuf $(ARCH)/bin/shuf-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sleep $(ARCH)/bin/sleep-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sort $(ARCH)/bin/sort-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/split $(ARCH)/bin/split-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/stat $(ARCH)/bin/stat-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/stdbuf $(ARCH)/bin/stdbuf-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/stty $(ARCH)/bin/stty-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sum $(ARCH)/bin/sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/sync $(ARCH)/bin/sync-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tac $(ARCH)/bin/tac-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tail $(ARCH)/bin/tail-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tee $(ARCH)/bin/tee-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/test $(ARCH)/bin/test-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/timeout $(ARCH)/bin/timeout-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/touch $(ARCH)/bin/touch-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tr $(ARCH)/bin/tr-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/true $(ARCH)/bin/true-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/truncate $(ARCH)/bin/truncate-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tsort $(ARCH)/bin/tsort-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/tty $(ARCH)/bin/tty-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/uname $(ARCH)/bin/uname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/unexpand $(ARCH)/bin/unexpand-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/uniq $(ARCH)/bin/uniq-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/unlink $(ARCH)/bin/unlink-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/uptime $(ARCH)/bin/uptime-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/users $(ARCH)/bin/users-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/vdir $(ARCH)/bin/vdir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/wc $(ARCH)/bin/wc-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/who $(ARCH)/bin/who-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/whoami $(ARCH)/bin/whoami-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/src/yes $(ARCH)/bin/yes-$(SUFFIX)
	@$(STRIP) $(ARCH)/bin/*

clean:
	@echo "I: cleaning up"
	@rm -rf *linux*
