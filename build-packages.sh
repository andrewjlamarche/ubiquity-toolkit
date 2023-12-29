#!/bin/bash
CWD=$(pwd)

for package in packages/*; do
    cd ${package} && make ARCH=$1
    cd ${CWD}
done
