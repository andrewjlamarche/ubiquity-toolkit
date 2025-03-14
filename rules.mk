#
# This makefile is part of the Ubiquity Toolkit.
#

TARGET ?= x86_64-linux-musl
CFLAGS ?= "-Os -static"
LDFLAGS ?=
CC := $(TARGET)-gcc
CXX := $(TARGET)-g++
STRIP := $(TARGET)-strip

ifeq ($(TARGET), aarch64-linux-musl)
    TYPE := linux-aarch64
    SUFFIX := arm64
else ifeq ($(TARGET), arm-linux-musleabi)
    TYPE := linux-generic32
    SUFFIX := arm32
else ifeq ($(TARGET), armeb-linux-musleabi)
    TYPE := linux-generic32
    SUFFIX := arm32eb
else ifeq ($(TARGET), mips64-linux-musl)
    TYPE := linux-generic64
    SUFFIX := mips64
else ifeq ($(TARGET), mips-linux-musl)
    TYPE := linux-generic32
    SUFFIX := mips32
else ifeq ($(TARGET), mips64el-linux-musl)
    TYPE := linux-generic64
    SUFFIX := mips64el
else ifeq ($(TARGET), mipsel-linux-musl)
    TYPE := linux-generic32
    SUFFIX := mips32el
else ifeq ($(TARGET), riscv64-linux-musl)
    TYPE := linux-riscv64
    SUFFIX := riscv64
else ifeq ($(TARGET), i386-linux-musl)
    TYPE := linux-x86
    SUFFIX := x86
else ifeq ($(TARGET), x86_64-linux-musl)
    TYPE := linux-x86-64
    SUFFIX := x64
else ifeq ($(TARGET), powerpc-linux-musl)
    TYPE := linux-ppc
    SUFFIX := ppc32
else ifeq ($(TARGET), powerpc64-linux-musl)
    TYPE := linux-ppc64
    SUFFIX := ppc64
else ifeq ($(TARGET), powerpc64le-linux-musl)
    TYPE := linux-ppc64le
    SUFFIX := ppc64le
else
    $(error E: a valid arch must be specified)
endif

ifeq (${PKG_SOURCE_URL},)
  DOWNLOAD_CMD = @cd ${TARGET} && git clone ${GIT_SOURCE_URL} -b ${GIT_BRANCH} ${PKG}
else
  DOWNLOAD_CMD = @cd ${TARGET} && wget -q ${PKG_SOURCE_URL} && mkdir ${PKG} && tar xf ${PKG}.* --one-top-level=${PKG} --strip-components 1
endif

STRIP_CMD := ${TARGET}-strip

.PHONY: all
all: download compile archive

download:
	@mkdir -p ${TARGET}
	@echo "I: downloading ${PKG}"
	$(DOWNLOAD_CMD)

compile: download
	@echo "I: building ${PKG}"
	@cd ${TARGET}/${PKG} && CC=${CC} CXX=${CXX} CFLAGS=${CFLAGS} LDFLAGS=${LDFLAGS} ./configure ${CONFIGURE_FLAGS} --host=${TARGET} --prefix=${CURDIR}/${TARGET}/build --exec-prefix=${CURDIR}/${TARGET}/build
	$(MAKE) -C ${TARGET}/${PKG} install

archive: compile
	@echo "I: archiving ${PKG}"
	@find ${TARGET}/build -depth -maxdepth 1 -type f -executable -exec $(STRIP_CMD) {} \;
