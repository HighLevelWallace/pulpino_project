// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include "spr-defs.h"
#include "string_lib.h"
#include "utils.h"

// use weak attribute here, so we can overwrite this function to provide custom exception handlers, e.g. for tests
__attribute__((interrupt)) __attribute__((weak))
void default_exception_handler_c(void)
{
  for(;;);
}

// use weak attribute here, so we can overwrite this function to provide custom exception handlers, e.g. for tests
__attribute__((interrupt)) __attribute__((weak))
void illegal_insn_handler_c(void)
{
  for(;;);
}
// use weak attribute here, so we can overwrite this function to provide custom exception handlers, e.g. for tests
__attribute__((interrupt)) __attribute__((weak))
void ecall_insn_handler_c(void)
{
  for(;;);
}
