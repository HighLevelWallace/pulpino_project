# 1 "./file_c/exceptions.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/exceptions.c"
# 11 "./file_c/exceptions.c"
# 1 "./file_c/spr-defs.h" 1
# 12 "./file_c/exceptions.c" 2
# 1 "./file_c/string_lib.h" 1
# 14 "./file_c/string_lib.h"
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 1 3 4
# 143 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4

# 143 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef int wchar_t;
# 415 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 426 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
} max_align_t;
# 15 "./file_c/string_lib.h" 2

# 1 "./file_c/pulpino.h" 1
# 17 "./file_c/string_lib.h" 2







# 23 "./file_c/string_lib.h"
size_t strlen (const char *str);
int strcmp (const char *s1, const char *s2);
char* strcpy (char *s1, const char *s2);
int puts(const char *s);
int printf(const char *format, ...);
void * memset (void *dest, int val, size_t len);
int putchar(int s);
# 13 "./file_c/exceptions.c" 2
# 1 "./file_c/utils.h" 1
# 25 "./file_c/utils.h"
# 1 "./file_c/event.h" 1
# 26 "./file_c/utils.h" 2


static inline int get_core_id()
{
  return 0;
}


static inline int get_core_num()
{
  return 0;
}
# 68 "./file_c/utils.h"
static inline void sleep(void) {
  *(volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x4000 ) + 0x20) = 0x01;
  asm volatile ("nop;nop;wfi");
}
# 95 "./file_c/utils.h"
void exit(int i);


void eoc(int i);


void sleep_busy(volatile int);
# 14 "./file_c/exceptions.c" 2


__attribute__((interrupt)) __attribute__((weak))
void default_exception_handler_c(void)
{
  for(;;);
}


__attribute__((interrupt)) __attribute__((weak))
void illegal_insn_handler_c(void)
{
  for(;;);
}

__attribute__((interrupt)) __attribute__((weak))
void ecall_insn_handler_c(void)
{
  for(;;);
}
