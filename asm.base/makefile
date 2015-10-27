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

GAS:=as
NASM:=nasm
LD:=ld

NASM_SRC:=$(wildcard *.asm)
GAS_SRC:=$(wildcard *.s)

NASM_OBJ:=$(patsubst %.asm, %.nasm.o, $(NASM_SRC))
GAS_OBJ:=$(patsubst %.s, %.gas.o, $(GAS_SRC))
OBJ:=$(NASM_OBJ) $(GAS_OBJ)

NASM_BIN:=$(patsubst %.asm, %.nasm, $(NASM_SRC))
GAS_BIN:=$(patsubst %.s, %.gas, $(GAS_SRC))
BIN:=$(NASM_BIN) $(GAS_BIN)

# targets listed after .PHONY are non-file targets
.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
	$(LD) -m elf_i386 -s -o $@ $<

# for NASM
$(NASM_OBJ): $(NASM_SRC)
	$(NASM) -f elf -o $@ $<

# for GAS
$(GAS_OBJ): $(GAS_SRC)
	$(AS) --32 -o $@ $<

clean:
	-rm $(OBJ) $(BIN)
