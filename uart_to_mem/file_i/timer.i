# 1 "./file_c/timer.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/timer.c"
# 11 "./file_c/timer.c"
# 1 "./file_c/timer.h" 1
# 29 "./file_c/timer.h"
# 1 "./file_c/pulpino.h" 1
# 30 "./file_c/timer.h" 2
# 61 "./file_c/timer.h"
void reset_timer(void);

void start_timer(void);

void stop_timer(void);

int get_time(void);
# 12 "./file_c/timer.c" 2

void reset_timer(void) {
  *(volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x3000 ) + 0x00) = 0;
}

void start_timer(void) {
  *(volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x3000 ) + 0x04) = 0x1;
}

void stop_timer(void) {
  *(volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x3000 ) + 0x04) = 0x0;
}

int get_time(void) {
  return *(volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x3000 ) + 0x00);
}
