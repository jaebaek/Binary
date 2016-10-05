.data
bit_mask: .long 0xffff

.text
.global function_in_asm
.type function_in_asm, @function
function_in_asm:
    // rdi: 0x123456789
    mov     %rdi, %rsi
    // rsi: 0x123456789 --> 0x6789
    and     bit_mask, %esi
    // rdx: 0x17
    mov     $0x17, %dx
    // argument a, b, c are rdi, rsi, rdx, respectively
    // return value is stored in rax
    call    please_print_number
    sub     $0x17, %rax
    sub     $0x6789, %rax
    ret
