PKG_NAME:=musl-cross-make
PKG_VERSION:=
PKG:=$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG).tar.gz
PKG_SOURCE_URL:=https://github.com/richfelker/musl-cross-make
PKG_HASH:=

MAKEFLAGS := -j $(shell nproc)

.PHONY: all
all: compile

download:
	@echo "I: downloading $(PKG_NAME)"
	@git clone $(PKG_SOURCE_URL)

compile: download
	@echo "I: building $(PKG_NAME)"
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=aarch64-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=arm-linux-musleabi install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=armeb-linux-musleabi install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=mips64-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=mips-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=mips64el-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=mipsel-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=riscv64-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=i386-linux-musl install
	@cd $(PKG_NAME) && make $(MAKEFLAGS) TARGET=x86_64-linux-musl install
	@echo "I: remember to add $(PKG_NAME)/output/bin to your PATH"

clean:
	@echo "I: cleaning up"
	@rm -rf musl-cross-make

