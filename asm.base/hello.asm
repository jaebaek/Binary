section .text
global _start
_start:

; print hello
mov edx, len
mov ecx, msg
mov ebx, 1      ; stdout
mov eax, 4      ; sys_write
int 0x80

; exit
mov ebx, 0
mov eax, 1
int 0x80

section .data
msg db "hello",0xa
len equ $-msg
