#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/runix.kernel isodir/boot/runix.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "runix" {
	multiboot /boot/runix.kernel
}
EOF
grub-mkrescue -o runix.iso isodir
