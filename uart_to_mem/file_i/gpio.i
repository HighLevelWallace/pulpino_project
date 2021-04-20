# 1 "./file_c/gpio.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/gpio.c"
# 11 "./file_c/gpio.c"
# 1 "./file_c/gpio.h" 1
# 22 "./file_c/gpio.h"
# 1 "./file_c/pulpino.h" 1
# 23 "./file_c/gpio.h" 2
# 75 "./file_c/gpio.h"
void set_pin_function(int pinnumber, int function);
int get_pin_function(int pinnumber);

void set_gpio_pin_direction(int pinnumber, int direction);
int get_gpio_pin_direction(int pinnumber);

void set_gpio_pin_value(int pinnumber, int value);
int get_gpio_pin_value(int pinnumber);

void set_gpio_pin_irq_type(int pinnumber, int type);
void set_gpio_pin_irq_en(int pinnumber, int enable);
int get_gpio_irq_status();
# 12 "./file_c/gpio.c" 2

void set_pin_function(int pinnumber, int function) {
  volatile int old_function;
  int addr;


  old_function = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x7000 ) + 0x00 ));
  old_function = old_function & (~(1 << pinnumber));
  old_function = old_function | (function << pinnumber);
  *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x7000 ) + 0x00 )) = old_function;
}

int get_pin_function(int pinnumber) {
  volatile int old_function;
  old_function = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x7000 ) + 0x00 ));
  old_function = (old_function >> pinnumber & 0x01);
  return old_function;
}

void set_gpio_pin_direction(int pinnumber, int direction) {
  volatile int old_dir;
  old_dir = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x00 ));
  if (direction == 0)
    old_dir &= ~(1 << pinnumber);
  else
    old_dir |= 1 << pinnumber;
  *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x00 )) = old_dir;
}

int get_gpio_pin_direction(int pinnumber) {
  volatile int old_dir;
  old_dir = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x00 ));
  old_dir = (old_dir >> (pinnumber*2) & 0x01);
  return old_dir;

}

void set_gpio_pin_value(int pinnumber, int value) {
  volatile int v;
  v = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x08 ));
  if (value == 0)
    v &= ~(1 << pinnumber);
  else
    v |= 1 << pinnumber;
  *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x08 )) = v;
}

int get_gpio_pin_value(int pinnumber) {
  volatile int v;
  v = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x04 ));
  v = (v >> pinnumber) & 0x01;
  return v;
}

void set_gpio_pin_irq_en(int pinnumber, int enable) {
  int v;
  v = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x0C ));
  if (enable == 0)
    v &= ~(1 << pinnumber);
  else
    v |= 1 << pinnumber;
  *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x0C )) = v;
}

void set_gpio_pin_irq_type(int pinnumber, int type) {
  int type0;
  int type1;

  type0 = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x10 ));
  type1 = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x14 ));

  if ((type & 0x1) == 0)
    type0 &= ~(1 << pinnumber);
  else
    type0 |= 1 << pinnumber;

  if ((type & 0x2) == 0)
    type1 &= ~(1 << pinnumber);
  else
    type1 |= 1 << pinnumber;

  *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x10 )) = type0;
  *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x14 )) = type1;
}

int get_gpio_irq_status() {
  return *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x1000 ) + 0x18 ));
}
