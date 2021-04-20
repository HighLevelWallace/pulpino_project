

#ifndef __SRAM_H__

#define __SRAM_H__

#include "pulpino.h"
#include "event.h"
#include "int.h"
#include "timer.h"
#include "spr-defs.h"


#define REG_SSRAM_CONFIG          0x00//3:2  00
#define REG_CYCLE_COUNTER         0x04//3:2  01
#define REG_ACCESS_COUNTER		  0x08//3:2  10
#define REG_ERROR_COUNTER		  0x0c//3:2  11

#define REG_FLL					 *(volatile int*)(FLL_BASE_ADDR + 0x00)


// pointer to CS-SRAM registers - PointerSRAM
#define __PS__(a) *(volatile int*) (INSTR_RAM_BASE_SRAM + a)

// ssram config register
#define SCFR __PS__(REG_SSRAM_CONFIG)

// ssram cycle counter register
#define SCCR __PS__(REG_CYCLE_COUNTER)

// ssram access counter register
#define SACR __PS__(REG_ACCESS_COUNTER)

// ssram error counter register
#define SECR __PS__(REG_ERROR_COUNTER)

//state:adjust-----------monitor
#define ADJUST                    1
#define MONITOR                   0

//adjust director:up-------------------down
#define UP                		  1
#define DOWN					  0

void configure(void);
void reset_ssram(void);

#endif
