	.data
outMsg:
	.string "%d\n"
inMsg:
	.string "%d"
ptrMsg:
	.string "%p\n"
arr:
	.rept 100
	.long 0
	.endr
n:
	.long 3

	.text
	.global main
main:
	push $n
	push $inMsg
	call scanf
	
	mov $0, %edi
input_loop:
	cmp n, %edi
	jge input_loop_end
	mov %edi, %eax
	sall $2, %eax
	add $arr, %eax
	push %eax
	push $inMsg
	call scanf
	inc %edi
	jmp input_loop
input_loop_end:

	mov $0, %edi
sort:
	cmp n, %edi
	jge sort_end
	mov %edi, %eax
	mov %edi, %esi
	inc %esi
sort_inner:
	cmp n, %esi
	jge sort_inner_end
	mov $arr, %ecx
	mov (%ecx, %esi, 4), %ebx
	mov (%ecx, %eax, 4), %edx

	cmp %edx, %ebx
	jg update
	mov %esi, %eax
update:
	inc %esi
	jmp sort_inner
sort_inner_end:

	mov $arr, %ecx
	mov (%ecx, %edi, 4), %ebx
	mov (%ecx, %eax, 4), %edx
	mov %edx, (%ecx, %edi, 4)
	mov %ebx, (%ecx, %eax, 4)
	inc %edi
	jmp sort
sort_end:	

	mov $0, %edi
out_loop:
	cmp n, %edi
	jge out_loop_end
	mov $arr, %ecx
	mov (%ecx, %edi, 4), %eax
	push %eax
	push $outMsg
	call printf
	inc %edi
	jmp out_loop
out_loop_end:
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
