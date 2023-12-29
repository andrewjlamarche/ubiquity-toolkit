#!/bin/bash
CWD=$(pwd)

for lib in libs/*; do
    cd ${lib} && make ARCH=$1
    cd ${CWD}
done
