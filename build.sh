#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPT_DIR"

alpine_rootfs_url="https://dl-cdn.alpinelinux.org/alpine/v3.13/releases/x86_64/alpine-minirootfs-3.13.5-x86_64.tar.gz"
alpine_rootfs_tgz="$(basename "$alpine_rootfs_url")"
if [[ ! -f "$alpine_rootfs_tgz" ]]; then
	wget "$alpine_rootfs_url"
fi

if [[ ! -d rootfs ]]; then
	mkdir -p rootfs
	tar xzvf "$alpine_rootfs_tgz"
fi

if [[ ! -d mosh ]]; then
	git clone https://github.com/mobile-shell/mosh
fi

sudo systemd-nspawn -D rootfs --as-pid2 \
	--bind "$(pwd)/mosh:/mosh" \
	--bind "$(pwd)/internal.sh:/internal.sh" \
	/internal.sh

mkdir -p build
cp mosh/src/frontend/mosh-{client,server} build/
