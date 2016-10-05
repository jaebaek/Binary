# Binary
~~Sample codes for assembly, linker and attack demos~~
This is a repo for simple demo usage of GNU assembly and NASM
(for entry-level student).

## Rule
* *.asm is NASM source code file
* *.s is GNU Assembly (i.e., GAS) source code file
* *.nasm.o is NASM object file
* *.gas.o is GAS object file
* *.nasm is NASM executable file
* *.gas is GAS executable file

Calling an assembly function in C source
----------------
- See **as_and_c**
- I briefly implemented how to call ASM function in C file,
and how to call C function in ASM file.

In-line assembly in C source
----------------
- See **as_in_c**
- I briefly implemented how to get values of registers into a local variable.
