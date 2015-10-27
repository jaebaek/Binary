#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage:" $0 "<file>"
    exit 1
fi

as --32 -o $1".o" $1".s"
ld -m elf_i386 -o $1 $1".o"
