#
# This makefile is part of the Ubiquity Toolkit.
#

TOPDIR:=${CURDIR}
export TOPDIR

.PHONY: all toolchain lib package clean
all: toolchain lib package

# build toolchains
toolchain:
	$(MAKE) -C toolchain

# build libraries
lib:
	$(MAKE) -C lib

# build packages
package:
	$(MAKE) -C package

clean:
	$(MAKE) -C toolchain clean
	$(MAKE) -C lib clean
	$(MAKE) -C package clean