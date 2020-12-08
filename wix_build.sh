#!/bin/sh
GOPATH=$PWD/.go GOROOT=/usr/local/go/ PATH=/usr/local/go/bin/:$PATH ARCH=amd64 OS=linux VERSION=1.2.3 ./build/build.sh
