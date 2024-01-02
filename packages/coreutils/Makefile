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
	@cp $(ARCH)/$(PKG)/[ $(ARCH)/bin/[-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/b2sum $(ARCH)/bin/b2sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/base32 $(ARCH)/bin/base32-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/base64 $(ARCH)/bin/base64-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/basename $(ARCH)/bin/basename-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/basenc $(ARCH)/bin/basenc-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/cat $(ARCH)/bin/cat-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/chcon $(ARCH)/bin/chcon-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/chgrp $(ARCH)/bin/chgrp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/chmod $(ARCH)/bin/chmod-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/chown $(ARCH)/bin/chown-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/chroot $(ARCH)/bin/chroot-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/cksum $(ARCH)/bin/cksum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/comm $(ARCH)/bin/comm-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/cp $(ARCH)/bin/cp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/csplit $(ARCH)/bin/csplit-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/cut $(ARCH)/bin/cut-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/date $(ARCH)/bin/date-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/dcgen $(ARCH)/bin/dcgen-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/dd $(ARCH)/bin/dd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/df $(ARCH)/bin/df-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/dir $(ARCH)/bin/dir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/dircolors $(ARCH)/bin/dircolors-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/dirname $(ARCH)/bin/dirname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/du $(ARCH)/bin/du-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/echo $(ARCH)/bin/echo-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/env $(ARCH)/bin/env-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/expand $(ARCH)/bin/expand-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/expr $(ARCH)/bin/expr-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/factor $(ARCH)/bin/factor-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/false $(ARCH)/bin/false-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/fmt $(ARCH)/bin/fmt-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/fold $(ARCH)/bin/fold-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/getlimits $(ARCH)/bin/getlimits-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ginstall $(ARCH)/bin/ginstall-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/groups $(ARCH)/bin/groups-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/head $(ARCH)/bin/head-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/hostid $(ARCH)/bin/hostid-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/id $(ARCH)/bin/id-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/join $(ARCH)/bin/join-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/kill $(ARCH)/bin/kill-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/libstdbuf.so $(ARCH)/bin/libstdbuf.so-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/link $(ARCH)/bin/link-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ln $(ARCH)/bin/ln-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/logname $(ARCH)/bin/logname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ls $(ARCH)/bin/ls-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/make-prime-list $(ARCH)/bin/make-prime-list-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/md5sum $(ARCH)/bin/md5sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/mkdir $(ARCH)/bin/mkdir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/mkfifo $(ARCH)/bin/mkfifo-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/mknod $(ARCH)/bin/mknod-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/mktemp $(ARCH)/bin/mktemp-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/mv $(ARCH)/bin/mv-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/nice $(ARCH)/bin/nice-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/nl $(ARCH)/bin/nl-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/nohup $(ARCH)/bin/nohup-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/nproc $(ARCH)/bin/nproc-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/numfmt $(ARCH)/bin/numfmt-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/od $(ARCH)/bin/od-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/paste $(ARCH)/bin/paste-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/pathchk $(ARCH)/bin/pathchk-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/pinky $(ARCH)/bin/pinky-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/pr $(ARCH)/bin/pr-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/printenv $(ARCH)/bin/printenv-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/printf $(ARCH)/bin/printf-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/ptx $(ARCH)/bin/ptx-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/pwd $(ARCH)/bin/pwd-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/readlink $(ARCH)/bin/readlink-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/realpath $(ARCH)/bin/realpath-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/rm $(ARCH)/bin/rm-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/rmdir $(ARCH)/bin/rmdir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/runcon $(ARCH)/bin/runcon-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/seq $(ARCH)/bin/seq-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sha1sum $(ARCH)/bin/sha1sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sha224sum $(ARCH)/bin/sha224sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sha256sum $(ARCH)/bin/sha256sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sha384sum $(ARCH)/bin/sha384sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sha512sum $(ARCH)/bin/sha512sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/shred $(ARCH)/bin/shred-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/shuf $(ARCH)/bin/shuf-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sleep $(ARCH)/bin/sleep-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sort $(ARCH)/bin/sort-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/split $(ARCH)/bin/split-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/stat $(ARCH)/bin/stat-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/stdbuf $(ARCH)/bin/stdbuf-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/stty $(ARCH)/bin/stty-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sum $(ARCH)/bin/sum-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/sync $(ARCH)/bin/sync-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/tac $(ARCH)/bin/tac-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/tail $(ARCH)/bin/tail-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/tee $(ARCH)/bin/tee-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/test $(ARCH)/bin/test-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/timeout $(ARCH)/bin/timeout-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/touch $(ARCH)/bin/touch-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/tr $(ARCH)/bin/tr-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/true $(ARCH)/bin/true-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/truncate $(ARCH)/bin/truncate-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/tsort $(ARCH)/bin/tsort-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/tty $(ARCH)/bin/tty-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/uname $(ARCH)/bin/uname-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/unexpand $(ARCH)/bin/unexpand-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/uniq $(ARCH)/bin/uniq-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/unlink $(ARCH)/bin/unlink-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/uptime $(ARCH)/bin/uptime-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/users $(ARCH)/bin/users-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/vdir $(ARCH)/bin/vdir-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/wc $(ARCH)/bin/wc-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/who $(ARCH)/bin/who-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/whoami $(ARCH)/bin/whoami-$(SUFFIX)
	@cp $(ARCH)/$(PKG)/yes $(ARCH)/bin/yes-$(SUFFIX)
	@$(STRIP) $(ARCH)/bin/*

clean:
	@echo "I: cleaning up"
	@rm -rf *linux*
