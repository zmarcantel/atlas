ASM 	= nasm
CC		= clang
LD		= ld

EXT4_MOUNT = mount

all: doric disk

doric:
	$(ASM) doric/doric.asm -o doric.sys
	# $(ASM) atlas/atlas.asm -o atlas.sys

disk: doric
	dd if=/dev/zero of=atlas.img bs=1048576 count=500
	$(EXT4_MOUNT) atlas.img

run: all