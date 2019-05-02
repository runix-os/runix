#
# Makefile for runix
# Callum Ward 2019
#

CROSSBIN=~/opt/cross/bin

all: tgt/myos.bin

tgt/myos.bin: tgt/kernel.o tgt/boot.o
	$(CROSSBIN)/i686-elf-gcc -T etc/link.ld -o tgt/myos.bin -ffreestanding -O2 -nostdlib tgt/boot.o tgt/kernel.o -lgcc

tgt/boot.o: src/boot.s
	$(CROSSBIN)/i686-elf-as -o tgt/boot.o src/boot.s

tgt/kernel.o: src/kernel.c
	$(CROSSBIN)/i686-elf-gcc -c src/kernel.c -o tgt/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

clean:
	rm tgt/*

