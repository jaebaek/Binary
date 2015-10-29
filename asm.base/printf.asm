; compile it using:
; $ nasm -f elf -l printf.lst -o printf.nasm.o printf.asm
; $ gcc -m32 -o printf printf.nasm.o

section .text
global main
extern printf
main:

push num
push msg
call printf

mov ebx, 0x0
mov eax, 0x1
int 0x80

section .data
msg db "The number is %d", 0xa
len equ $-msg

num equ 7492
