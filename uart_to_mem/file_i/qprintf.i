# 1 "./file_c/qprintf.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/qprintf.c"
# 11 "./file_c/qprintf.c"
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
# 12 "./file_c/qprintf.c" 2

# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdint.h" 1 3 4
# 9 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdint.h" 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 1 3 4
# 12 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 1 3 4







# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/features.h" 1 3 4
# 28 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/features.h" 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/_newlib_version.h" 1 3 4
# 29 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/features.h" 2 3 4
# 9 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 2 3 4
# 41 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4

# 41 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 2 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_intsup.h" 1 3 4
# 35 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 2 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_stdint.h" 1 3 4
# 20 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdint.h" 2 3 4
# 14 "./file_c/qprintf.c" 2
# 1 "./file_c/uart.h" 1
# 66 "./file_c/uart.h"

# 66 "./file_c/uart.h"
void uart_set_cfg(int parity, uint16_t clk_counter);

void uart_send(const char* str, unsigned int len);
void uart_sendchar(const char c);

char uart_getchar();

void uart_wait_tx_done(void);
# 15 "./file_c/qprintf.c" 2
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdarg.h" 1 3 4
# 40 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdarg.h" 3 4

# 40 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 16 "./file_c/qprintf.c" 2
# 41 "./file_c/qprintf.c"

# 41 "./file_c/qprintf.c"
static unsigned divu10(unsigned n) {
  unsigned q, r;

  q = (n >> 1) + (n >> 2);
  q = q + (q >> 4);
  q = q + (q >> 8);
  q = q + (q >> 16);
  q = q >> 3;
  r = n - q * 10;

  return q + ((r + 6) >> 4);
}

char remu10_table[16] = {
  0, 1, 2, 2, 3, 3, 4, 5,
  5, 6, 7, 7, 8, 8, 9, 0
};

static unsigned remu10(unsigned n) {
  n = (0x19999999 * n + (n >> 1) + (n >> 3)) >> 28;
  return remu10_table[n];
}

int putchar(int s)
{
  uart_sendchar(s);
  return s;
}

static void qprintchar(char **str, int c)
{
  if (str)
  {
    **str = c;
    ++(*str);
  }
  else
    putchar((char)c);
}

static int qprints(char **out, const char *string, int width, int pad)
{
  register int pc = 0, padchar = ' ';

  if (width > 0) {
    register int len = 0;
    register const char *ptr;
    for (ptr = string; *ptr; ++ptr) ++len;
    if (len >= width) width = 0;
    else width -= len;
    if (pad & 2) padchar = '0';
  }
  if (!(pad & 1)) {
    for ( ; width > 0; --width) {
      qprintchar (out, padchar);
      ++pc;
    }
  }
  for ( ; *string ; ++string) {
    qprintchar (out, *string);
    ++pc;
  }
  for ( ; width > 0; --width) {
    qprintchar (out, padchar);
    ++pc;
  }

  return pc;
}

static int qprinti(char **out, int i, int b, int sg, int width, int pad, char letbase)
{
  char print_buf[32];
  register char *s;
  register int neg = 0, pc = 0;
  unsigned int t,u = i;

  if (i == 0)
  {
    print_buf[0] = '0';
    print_buf[1] = '\0';
    return qprints (out, print_buf, width, pad);
  }

  if (sg && b == 10 && i < 0)
  {
    neg = 1;
    u = -i;
  }

  s = print_buf + 32 -1;
  *s = '\0';


  if(b == 16) {

    while (u) {
      int t = u & 0xF;

      if (t >= 10)
        t += letbase - '0' - 10;

      *--s = t + '0';
      u >>= 4;
    }
  } else {

    while (u) {
      *--s = remu10(u) + '0';
      u = divu10(u);
    }
  }

  if (neg) {
    if( width && (pad & 2) )
    {
      qprintchar (out, '-');
      ++pc;
      --width;
    }
    else
    {
      *--s = '-';
    }
  }
  return pc + qprints (out, s, width, pad);
}

static int qprint(char **out, const char *format, va_list va)
{
  register int width, pad;
  register int pc = 0;
  char scr[2];

  for (; *format != 0; ++format)
  {
    if (*format == '%')
    {
      ++format;
      width = pad = 0;
      if (*format == '\0') break;
      if (*format == '%') goto out;
      if (*format == '-')
      {
        ++format;
        pad = 1;
      }
      while (*format == '0')
      {
        ++format;
        pad |= 2;
      }
      for ( ; *format >= '0' && *format <= '9'; ++format) {
        width *= 10;
        width += *format - '0';
      }
      if( *format == 's' ) {
        register char *s = 
# 198 "./file_c/qprintf.c" 3 4
                          __builtin_va_arg(
# 198 "./file_c/qprintf.c"
                          va
# 198 "./file_c/qprintf.c" 3 4
                          ,
# 198 "./file_c/qprintf.c"
                          char*
# 198 "./file_c/qprintf.c" 3 4
                          )
# 198 "./file_c/qprintf.c"
                                           ;
        pc += qprints (out, s?s:"(null)", width, pad);
        continue;
      }
      if( *format == 'd' ) {
        pc += qprinti (out, 
# 203 "./file_c/qprintf.c" 3 4
                           __builtin_va_arg(
# 203 "./file_c/qprintf.c"
                           va
# 203 "./file_c/qprintf.c" 3 4
                           ,
# 203 "./file_c/qprintf.c"
                           int
# 203 "./file_c/qprintf.c" 3 4
                           )
# 203 "./file_c/qprintf.c"
                                          , 10, 1, width, pad, 'a');
        continue;
      }
      if( *format == 'u' ) {
        pc += qprinti (out, 
# 207 "./file_c/qprintf.c" 3 4
                           __builtin_va_arg(
# 207 "./file_c/qprintf.c"
                           va
# 207 "./file_c/qprintf.c" 3 4
                           ,
# 207 "./file_c/qprintf.c"
                           unsigned int
# 207 "./file_c/qprintf.c" 3 4
                           )
# 207 "./file_c/qprintf.c"
                                                   , 10, 0, width, pad, 'a');
        continue;
      }
      if( *format == 'x' ) {
        pc += qprinti (out, 
# 211 "./file_c/qprintf.c" 3 4
                           __builtin_va_arg(
# 211 "./file_c/qprintf.c"
                           va
# 211 "./file_c/qprintf.c" 3 4
                           ,
# 211 "./file_c/qprintf.c"
                           uint32_t
# 211 "./file_c/qprintf.c" 3 4
                           )
# 211 "./file_c/qprintf.c"
                                               , 16, 0, width, pad, 'a');
        continue;
      }
      if( *format == 'X' ) {
        pc += qprinti (out, 
# 215 "./file_c/qprintf.c" 3 4
                           __builtin_va_arg(
# 215 "./file_c/qprintf.c"
                           va
# 215 "./file_c/qprintf.c" 3 4
                           ,
# 215 "./file_c/qprintf.c"
                           uint32_t
# 215 "./file_c/qprintf.c" 3 4
                           )
# 215 "./file_c/qprintf.c"
                                               , 16, 0, width, pad, 'A');
        continue;
      }
      if( *format == 'c' ) {
        scr[0] = 
# 219 "./file_c/qprintf.c" 3 4
                __builtin_va_arg(
# 219 "./file_c/qprintf.c"
                va
# 219 "./file_c/qprintf.c" 3 4
                ,
# 219 "./file_c/qprintf.c"
                int
# 219 "./file_c/qprintf.c" 3 4
                )
# 219 "./file_c/qprintf.c"
                               ;
        scr[1] = '\0';
        pc += qprints (out, scr, width, pad);
        continue;
      }
    }
    else
    {
out:
      qprintchar (out, *format);
      ++pc;
    }
  }
  if (out) **out = '\0';

  return pc;
}

int printf(const char *format, ...)
{
  int pc;
  va_list va;

  
# 242 "./file_c/qprintf.c" 3 4
 __builtin_va_start(
# 242 "./file_c/qprintf.c"
 va
# 242 "./file_c/qprintf.c" 3 4
 ,
# 242 "./file_c/qprintf.c"
 format
# 242 "./file_c/qprintf.c" 3 4
 )
# 242 "./file_c/qprintf.c"
                     ;

  pc = qprint(0, format, va);

  
# 246 "./file_c/qprintf.c" 3 4
 __builtin_va_end(
# 246 "./file_c/qprintf.c"
 va
# 246 "./file_c/qprintf.c" 3 4
 )
# 246 "./file_c/qprintf.c"
           ;

  return pc;

}

int puts(const char *s)
{
  int i=0;

  while(s[i] != '\0')
    putchar(s[i++]);

  putchar('\n');

  return i;
}

int strcmp (const char *s1, const char *s2)
{
  unsigned long *a1;
  unsigned long *a2;


  if (!(((long)s1 & (sizeof (long) - 1)) | ((long)s2 & (sizeof (long) - 1))))
  {

    a1 = (unsigned long*)s1;
    a2 = (unsigned long*)s2;
    while (*a1 == *a2)
      {


          if ((((*a1) - 0x01010101) & ~(*a1) & 0x80808080))
          return 0;
        a1++;
        a2++;
      }

    s1 = (char*)a1;
    s2 = (char*)a2;
  }

  while (*s1 != '\0' && *s1 == *s2)
  {
    s1++;
    s2++;
  }
  return (*(unsigned char *) s1) - (*(unsigned char *) s2);
}

void * memset (void *dest, int val, size_t length)
{
  unsigned char *ptr = dest;
  while (length > 0) {
    *ptr++ = val;
    length --;
  }
  return dest;
}

char* strcpy (char *s1, const char *s2)
{
  char *s1p = (char *)s1;
  char *s2p = (char *)s2;

  while (*s2p != '\0')
  {
    (*s1p) = (*s2p);

    ++s1p;
    ++s2p;
  }

  return s1;
}

size_t strlen (const char *str)
{
  char *s = (char *)str;
  size_t len = 0;

  if (s == 
# 328 "./file_c/qprintf.c" 3 4
          ((void *)0)
# 328 "./file_c/qprintf.c"
              )
    return 0;

  while (*s++ != '\0')
    ++len;
  return len;
}
