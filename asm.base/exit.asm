section .text
global _start
_start:
mov eax, 1
mov ebx, 13
int 0x80
