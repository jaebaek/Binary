section .text
global _start
_start:
mov edx, len
mov ecx, msg
mov ebx, 0x1
mov eax, 0x4
int 0x80

mov edx, 9
mov ecx, s2
mov ebx, 0x1
mov eax, 0x4
int 0x80

mov ebx, 0x0
mov eax, 0x1
int 0x80

section .data
msg db "Displaying stars:",0xa
len equ $-msg
s2 times 9 db "*"
