section .data
msg1 db "Give me a number:", 0xa
len1 equ $-msg1

msg2 db "Your number is:", 0xa
len2 equ $-msg2

section .bss
num resb 5

section .text
global _start
_start:

; "Give me a number: "
mov edx, len1
mov ecx, msg1
mov ebx, 0x1
mov eax, 0x4
int 0x80

; Get a 4 byte number
mov edx, 5
mov ecx, num
mov ebx, 0x0
mov eax, 0x3
int 0x80

; "Your number is: "
mov edx, len2
mov ecx, msg2
mov ebx, 0x1
mov eax, 0x4
int 0x80

; Print the number
mov edx, 5
mov ecx, num
mov ebx, 0x1
mov eax, 0x4
int 0x80

; exit
mov ebx, 0x0
mov eax, 0x1
int 0x80
