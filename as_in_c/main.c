/*
 * Author: Jaebaek Seo <jaebaek@kaist.ac.kr>
 *
 * It prints out %rsp, %rbp, %rip
 * Note that there is no x86 instruction directly moves %rip
 * to memory or a register, so I used LEA instruction for it
 */

#include <stdio.h>

int main(int argc, const char *argv[])
{
    unsigned long rsp = 0, rbp = 0;
    register unsigned long rip = 0;
    __asm__ __volatile__(
            "mov %%rsp, %0\n"
            "mov %%rbp, %1\n"
            "lea (%%rip), %2\n" // MOV instruction is not work in reading %rip
                                // Use LEA instruction instead
            :"=m" (rsp), "=m" (rbp), "=r" (rip):);
    printf("rsp = %lx, rip = %lx, rbp = %lx\n", rsp, rip, rbp);
    return 0;
}
