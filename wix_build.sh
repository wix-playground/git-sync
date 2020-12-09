#!/bin/sh
unset GOROOT
PATH=/usr/local/go/bin:$PATH
GOPATH=`pwd`/.go
export GOPATH
export PATH
ARCH=amd64 OS=linux VERSION=1.2.3 ./build/build.sh
