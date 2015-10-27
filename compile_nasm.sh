#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage:" $0 "<file>"
    exit 1
fi

nasm -f elf $1".asm"
ld -m elf_i386 -s -o $1 $1".o"
