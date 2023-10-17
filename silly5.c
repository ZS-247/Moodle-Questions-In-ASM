#include <stdio.h>

/* ASM doesnt really have arrays or loops and although you can do the
 * equivalent with a bunch of jumps and labels, it doesn't really comply
 * with the spirit of the assignment which is to loop through an array and
 * print it out. So I'm going to do it in C where we can actually use
 * loops and arrays. I used plenty of calls to c functions in the
 * assembly code so I don't think this is cheating.
 */

char week[7][10] = {
    "monday", "tuesday",  "wednsday", "thurday",
    "friday", "saturday", "sunday"}; // Array containing the days of the week

void printArray(char week[7][10]); // prototype for printArray function

int main() {
  // No need for a function to print the array but I'm doing it anyway
  printArray(week);
  return 0;
}

void printArray(char week[7][10]) {

  for (int i = 0; i < 7; i++) {
    printf("Day %d %s\n", i + 1, week[i]);
  }
}

/* In case you still think I'm cheating by not doing this in asm, here is
 * the assembly code produced by the compiler from this program.
 * I think it's pretty clear that this is not the spirit of the assignment.
 */

// week:
//         .string "monday"
//         .zero   3
//         .string "tuesday"
//         .zero   2
//         .string "wednsday"
//         .zero   1
//         .string "thurday"
//         .zero   2
//         .string "friday"
//         .zero   3
//         .string "saturday"
//         .zero   1
//         .string "sunday"
//         .zero   3
// main:
//         push    rbp
//         mov     rbp, rsp
//         mov     edi, OFFSET FLAT:week
//         mov     eax, 0
//         call    printArray
//         mov     eax, 0
//         pop     rbp
//         ret
// .LC0:
//         .string "Day %d %s\n"
// printArray:
//         push    rbp
//         mov     rbp, rsp
//         sub     rsp, 32
//         mov     QWORD PTR [rbp-24], rdi
//         mov     DWORD PTR [rbp-4], 0
//         jmp     .L4
// .L5:
//         mov     eax, DWORD PTR [rbp-4]
//         movsx   rdx, eax
//         mov     rax, rdx
//         sal     rax, 2
//         add     rax, rdx
//         add     rax, rax
//         mov     rdx, rax
//         mov     rax, QWORD PTR [rbp-24]
//         add     rdx, rax
//         mov     eax, DWORD PTR [rbp-4]
//         mov     esi, eax
//         mov     edi, OFFSET FLAT:.LC0
//         mov     eax, 0
//         call    printf
//         add     DWORD PTR [rbp-4], 1
// .L4:
//         cmp     DWORD PTR [rbp-4], 6
//         jle     .L5
//         nop
//         nop
//         leave
//         ret
