#!/bin/sh
apk update && \
apk add \
		autoconf \
		automake \
		g++ \
		gzip \
		make \
		ncurses-dev \
		ncurses-static \
		openssl-dev \
		openssl-libs-static \
		perl \
		perl-doc \
		protobuf-dev \
		wget \
		zlib-dev \
		zlib-static

cd /mosh

./autogen.sh
./configure LDFLAGS='-static' CXXFLAGS='-Os' && \
	make clean && \
	make -j$(nproc) && \
	strip src/frontend/mosh-server
