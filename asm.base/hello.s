	.section .data
arr:
	.rept 100
	.long 0
	.endr
arr_end:
	.set size, arr_end - arr
numStr:
	.ascii "%d\n"

	.macro _printn n
	push \n
	push $numStr
	call printf
	.endm

	.macro _exit code
	mov \code, %ebx
	mov $0x1, %eax
	int $0x80
	.endm
	
	.section .text
	.global main
main:
	_printn $size
	_exit $0x0
