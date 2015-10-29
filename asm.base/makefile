# makefile grammer
#
# <target>: [<dependency> ]*
# 	[ <TAB> <command> <endl> ]+
#
# %suffix .. %replacement
# % here means any string
# e.g. (empty), a, b, ..., aa, ab, ...
#
# $@ in <command> is the target
#
# $< in <command> is the dependencies

gas:=as
nasm:=nasm
ld:=ld

nasm_src:=$(wildcard *.asm)
gas_src:=$(wildcard *.s)

nasm_obj:=$(patsubst %.asm, %.nasm.o, $(nasm_src))
gas_obj:=$(patsubst %.s, %.gas.o, $(gas_src))
obj:=$(nasm_obj) $(gas_obj)

nasm_bin:=$(patsubst %.asm, %.nasm, $(nasm_src))
gas_bin:=$(patsubst %.s, %.gas, $(gas_src))
bin:=$(nasm_bin) $(gas_bin)

# targets listed after .PHONY are non-file targets
.PHONY: all clean

all: $(bin)

%.nasm: %.nasm.o
	$(ld) -m elf_i386 -s -o $@ $<

%.gas: %.gas.o
	$(ld) -m elf_i386 -s -o $@ $<

%.nasm.o: %.asm
	$(nasm) -f elf -o $@ $<

%.gas.o: %.s
	$(as) --32 -o $@ $<

clean:
	-rm $(obj) $(bin)
