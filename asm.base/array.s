.data
str:
.string "The number is %d\n"
arr:
.rept 100
.long 0
.endr
n:
.long 3

.text
.global main
main:
cmp $3, n
je equal
push $17
push $str
call printf

equal:
push n
push $str
call printf

mov $1, %eax
mov $0, %ebx
int $0x80
