# ubiquity-toolkit
A collection of statically-linked tools targeted to run on almost any linux system.

# Supported Architectures
- aarch64-linux-musl
- arm-linux-musleabi
- armeb-linux-musleabi
- mips-linux-musl
- mipsel-linux-musl
- mips64-linux-musl
- mips64el-linux-musl
- riscv64-linux-musl
- x86_64-linux-musl
- i386-linux-musl
- powerpc-linux-musl
- powerpc64-linux-musl
- powerpc64le-linux-musl

# Building
It is first recommended to build and install the musl toolchain for your target. See [musl-cross-make](https://github.com/richfelker/musl-cross-make).

Build the libraries: `make -j $(nproc) lib TARGET=aarch64-linux-musl`

Build the packages: `make -j $(nproc) package TARGET=aarch64-linux-musl`
