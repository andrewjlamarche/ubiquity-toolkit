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
Each package can be built individually by running `make ARCH=<arch>` inside the respective directory, or by using the included build scripts by running `./build-*.sh <arch>`.

It is recommended to first build the musl toolchain, then the libraries and finally the package. E.g.:
```
./build-toolchians.sh
./build-libs aarch64-linux-musl
./build-packages aarch64-linux-musl
```

This will build all the required toolchains (may take several hours depending on the system), then all the libraries for aarch64 and then all aarch64 packages.

This has been tested on Ubuntu 22.04.

# Dependencies
This is probably missing some...

`build-essential make autotools`
