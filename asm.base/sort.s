	.section .data
arr:
	.rept 100
	.long 0
	.endr
arr_end:
	.set size, arr_end - arr
	
numInput:
	.ascii "%d"

	.macro _input n
	push \n
	push $numInput
	call scanf
	.endm
	
numOutput:
	.ascii "%d\n"

	.macro _output n
	push \n
	push $numOutput
	call printf
	.endm

	.macro _exit n
	mov \n, %ebx
	mov $0x1, %eax
	int $0x80
	.endm

	.section .text
	.global main
main:
	_input arr
	_output arr
	_exit $0x0
