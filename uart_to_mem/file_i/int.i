# 1 "./file_c/int.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/int.c"
# 12 "./file_c/int.c"
# 1 "./file_c/int.h" 1
# 29 "./file_c/int.h"
# 1 "./file_c/spr-defs.h" 1
# 30 "./file_c/int.h" 2
# 1 "./file_c/utils.h" 1
# 25 "./file_c/utils.h"
# 1 "./file_c/event.h" 1
# 29 "./file_c/event.h"
# 1 "./file_c/pulpino.h" 1
# 30 "./file_c/event.h" 2
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
# 31 "./file_c/int.h" 2
# 45 "./file_c/int.h"
static __inline void int_disable(void) {


  int mstatus;
  asm volatile ("csrr %0, mstatus": "=r" (mstatus));
  mstatus &= 0xFFFFFFF7;
  asm volatile ("csrw mstatus, %0" : : "r" (mstatus));
  asm("csrw 0x300, %0" : : "r" (0x0) );



}
# 68 "./file_c/int.h"
static __inline void int_enable(void) {


  int mstatus;
  asm volatile ("csrr %0, mstatus": "=r" (mstatus));
  mstatus |= 0x08;
  asm volatile ("csrw mstatus, %0" : : "r" (mstatus));



}





void ISR_SRAM (void);
void ISR_I2C (void);
void ISR_UART (void);
void ISR_GPIO (void);
void ISR_SPIM0 (void);
void ISR_SPIM1 (void);
void ISR_TA_OVF (void);
void ISR_TA_CMP (void);
void ISR_TB_OVR (void);
void ISR_TB_CMP (void);
# 13 "./file_c/int.c" 2
# 22 "./file_c/int.c"
__attribute__ ((weak))
void ISR_SRAM (void){ for(;;); }


__attribute__ ((weak))
void ISR_I2C (void){ for(;;); }


__attribute__ ((weak))
void ISR_UART (void){ for(;;); }


__attribute__ ((weak))
void ISR_GPIO (void){ for(;;); }


__attribute__ ((weak))
void ISR_SPIM0 (void){ for(;;); }


__attribute__ ((weak))
void ISR_SPIM1 (void){ for(;;); }


__attribute__ ((weak))
void ISR_TA_OVF (void){ for(;;); }


__attribute__ ((weak))
void ISR_TA_CMP (void){ for(;;); }


__attribute__ ((weak))
void ISR_TB_OVF (void){ for(;;); }


__attribute__ ((weak))
void ISR_TB_CMP (void){ for(;;); }
