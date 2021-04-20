# 1 "./file_c/spi.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/spi.c"
# 10 "./file_c/spi.c"
# 1 "./file_c/spi.h" 1
# 22 "./file_c/spi.h"
# 1 "./file_c/pulpino.h" 1
# 23 "./file_c/spi.h" 2
# 77 "./file_c/spi.h"
void spi_setup_slave();

void spi_setup_master(int numcs);

void spi_send_data_noaddr(int cmd, char *data, int datalen, int useQpi);

void spi_setup_cmd_addr(int cmd, int cmdlen, int addr, int addrlen);

void spi_set_datalen(int datalen);

void spi_setup_dummy(int dummy_rd, int dummy_wr);

void spi_start_transaction(int trans_type, int csnum);

void spi_write_fifo(int *data, int datalen);

void spi_read_fifo(int *data, int datalen);

int spi_get_status();
# 11 "./file_c/spi.c" 2
# 1 "./file_c/gpio.h" 1
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
# 12 "./file_c/spi.c" 2

void spi_setup_slave() {
    set_pin_function(4, 0);
    set_pin_function(5, 0);
    set_pin_function(6, 0);
    set_pin_function(7, 0);
    set_pin_function(3, 0);
}

void spi_setup_master(int numcs) {
    set_pin_function(15, 0);
    set_pin_function(14, 0);
    set_pin_function(13, 0);
    set_pin_function(12, 0);
    if (numcs > 0)
        set_pin_function(16, 0);
    if (numcs > 1)
        set_pin_function(11, 0);
    if (numcs > 2)
        set_pin_function(0, 0);
    if (numcs > 3)
        set_pin_function(1, 0);
}

void spi_send_data_noaddr(int cmd, char *data, int datalen, int useQpi);

void spi_setup_cmd_addr(int cmd, int cmdlen, int addr, int addrlen) {
    int cmd_reg;
    cmd_reg = cmd << (32 - cmdlen);
    *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x08 )) = cmd_reg;
    *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x0C )) = addr;
    *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x10 )) = (cmdlen & 0x3F) | ((addrlen << 8) & 0x3F00);
}

void spi_setup_dummy(int dummy_rd, int dummy_wr) {
    *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x14 )) = ((dummy_wr << 16) & 0xFFFF0000) | (dummy_rd & 0xFFFF);
}

void spi_set_datalen(int datalen) {
    volatile int old_len;
    old_len = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x10 ));
    old_len = ((datalen << 16) & 0xFFFF0000) | (old_len & 0xFFFF);
    *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x10 )) = old_len;
}

void spi_start_transaction(int trans_type, int csnum) {
    *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x00 )) = ((1 << (csnum + 8)) & 0xF00) | ((1 << trans_type) & 0xFF);
}

int spi_get_status() {
    volatile int status;
    status = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x00 ));
    return status;
}

void spi_write_fifo(int *data, int datalen) {
    volatile int num_words, i;

    num_words = (datalen >> 5) & 0x7FF;

    if ( (datalen & 0x1F) != 0)
        num_words++;

    for (i = 0; i < num_words; i++) {
        while ((((*(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x00 ))) >> 24) & 0xFF) >= 8);
        *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x18 )) = data[i];
    }
}

void spi_read_fifo(int *data, int datalen) {
    volatile int num_words, i;

    num_words = (datalen >> 5) & 0x7FF;

    if ( (datalen & 0x1F) != 0)
        num_words++;

    for (i = 0; i < num_words; i++) {
        while ((((*(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x00 ))) >> 16) & 0xFF) == 0);
        data[i] = *(volatile int*) (( ( ( 0x10000000 + 0xA100000 ) + 0x2000 ) + 0x20 ));
    }
}
