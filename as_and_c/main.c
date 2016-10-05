/*
 * Author: Jaebaek Seo <jaebaek@kaist.ac.kr>
 *
 * 1. main() calls function_in_asm() in GNU assembly file named "gas.s"
 *      - The argument (i.e., 0x123456789) will be %rax register in assembly level
 *      - Please check it by
 *              $ objdump -d main.o
 * 2. function_in_asm() sets %rdi, %esi, %dx and calls please_print_number()
 *      - In Intel x86 64bit ABI, %rdi is the first argument
 *      - %rsi and %rdx are the second and third arguments, respectively
 *      - The return value is stored in %rax
 */

#include <stdio.h>

unsigned long please_print_number(unsigned long a, int b, char c) {
    printf("a = %lx, b = %x, c = %x\n", a, b, c);
    return a + b + c;
}

unsigned long function_in_asm(unsigned long);

int main(int argc, const char *argv[])
{
    unsigned long result = function_in_asm(0x123456789);
    printf("result (%lx) must be 0x123456789\n", result);
    return 0;
}
