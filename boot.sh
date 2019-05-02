#!/bin/sh
# Quick script that compiles the kernel and boots it via QEMU
make all
MAKE_RC=$?
[ $MAKE_RC -eq 0 ] && qemu-system-i386 -kernel tgt/myos.bin &
