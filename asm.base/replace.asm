section .data
name db 10

section .text
global _start
_start:

mov edx, 10
mov ecx, name
mov ebx, 0x0
mov eax, 0x3
int 0x80

mov [name], dword 'asdf'

mov edx, 10
mov ecx, name
mov ebx, 0x1
mov eax, 0x4
int 0x80

mov ebx, 0x0
mov eax, 0x1
int 0x80
