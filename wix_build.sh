#!/bin/sh
GOPATH=`pwd`/.go
export GOPATH
ARCH=amd64 OS=linux VERSION=1.2.3 ./build/build.sh
