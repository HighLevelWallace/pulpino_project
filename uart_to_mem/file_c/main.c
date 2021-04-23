#include "stdlib.h"
#include "gpio.h"
#include "uart.h"
#include "string_lib.h"
#include "pulpino.h"
#include "utils.h"
#include "spi.h"

void hex_to_string(char *, unsigned int);
int str_to_int(const char *);
int is_hex(char c) { return c <= 'H' && c >= 'A' ||
							c <= 'h' && c >= 'a' || c <= '9' && c >= '0'; }

unsigned char one_count(unsigned int x)
{
	unsigned char c = 0;
	int i = 0;
	while (x)
	{
		c += x & 0x1;
		x >>= 1;
	}
	return c;
}

void jump_and_start(volatile int *ptr)
{
#ifdef __riscv__
	asm("jalr x0, %0\n"
		"nop\n"
		"nop\n"
		"nop\n"
		:
		: "r"(ptr));
#else
	asm("l.jr\t%0\n"
		"l.nop\n"
		"l.nop\n"
		"l.nop\n"
		:
		: "r"(ptr));
#endif
}

int main()
{
	//spi_setup_master(1);

	uart_set_cfg(0, 12); //Core clock 24MHz, baud rate 115200 bps
	char memstr[9];
	char strout[9];
	unsigned int *memaddr = 0;
	unsigned int memdata;
	unsigned int new_addr_flag = 0;
	for (int i = 0; i < 8; i++)
	{
		set_gpio_pin_direction(i, 1);
		set_gpio_pin_value(i, 1);
	}

	printf("hello world!\n");
	printf("waiting for uart signals to write to ram...\n");
	uart_wait_tx_done();
	while (1)
	{
		int i = 0;

		while (1)
		{
			if (!is_hex(memstr[i++] = uart_getchar()))
			{
				if (memstr[i - 1] == '@') //It signals a new address for the following data
				{
					new_addr_flag = 1;
					--i;
					continue;
				}
				else
					break;
			}
			if (i >= 20)
				break;
		}
		if (new_addr_flag)
		{
			memaddr = (unsigned int *)str_to_int(memstr);
			new_addr_flag = 0;
			continue;
		}
		memstr[8] = '\0';
		if (memstr[i - 1] == 'q')
			break;
		memdata = str_to_int(memstr);
		*(memaddr++) = memdata;
		uart_sendchar(one_count(memdata));
	}

	uart_send("Done, jumping to Instruction RAM.\n", 34);

	uart_wait_tx_done();

	//-----------------------------------------------------------
	// Set new boot address -> exceptions/interrupts/events rely
	// on that information
	//-----------------------------------------------------------

	BOOTREG = 0x00;

	//-----------------------------------------------------------
	// Done jump to main program
	//-----------------------------------------------------------

	//jump to program start address (instruction base address)
	jump_and_start((volatile int *)(INSTR_RAM_START_ADDR));
	while (1)
		printf("This isn't supposed to be shown. \n");
	// /* divide sys clock by 4 */
	// // *(volatile int*) (SPI_REG_CLKDIV) = 0x4;

	// // if (check_spi_flash()) {
	// // 	uart_send("ERROR: Spansion SPI flash not found\n", 36);
	// // 	while (1);
	// // }

	// uart_send("Release Power down / Device ID\n", 31);

	// for (int i = 0; i < 3000; i++) {
	// // //wait some time to have proper power up of external flash
	// // #ifdef __riscv__
	// //     asm volatile ("nop");
	// // #else
	// //     asm volatile ("l.nop");
	// // #endif
	// }

	// // spi_setup_dummy(24, 0);
	// // spi_setup_cmd_addr(0xAB, 8, 0, 0);
	// // spi_set_datalen(24);
	// // spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	// // spi_read_fifo(id, 24);

	// hex_to_string(numstring, id[0]);
	// uart_send(numstring, 8);
	// uart_send("\n", 1);
	// uart_wait_tx_done();

	// uart_send("JEDEC ID\n", 9);
	// uart_wait_tx_done();

	// // spi_setup_dummy(0, 0);
	// // spi_setup_cmd_addr(0x9F, 8, 0, 0);
	// // spi_set_datalen(64);
	// // spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	// // spi_read_fifo(id, 64);

	// hex_to_string(numstring, id[0]);
	// uart_send(numstring, 10);
	// hex_to_string(numstring, id[1]);
	// uart_send(numstring, 10);
	// hex_to_string(numstring, id[2]);
	// uart_send(numstring, 10);
	// uart_send("  \n", 3);

	// uart_send("Manufacturer/Device ID\n", 23);
	// uart_wait_tx_done();

	// // spi_setup_dummy(0, 16);
	// // spi_setup_cmd_addr(0x90, 8, 0, 8);
	// // spi_set_datalen(64);
	// // spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	// // spi_read_fifo(id, 64);

	// hex_to_string(numstring, id[0]);
	// uart_send(numstring, 8);
	// hex_to_string(numstring, id[1]);
	// uart_send(numstring, 8);
	// uart_send("  \n", 3);

	// // for(int i = 0; ; i++)
	// // {
	// // 	set_gpio_pin_value(i % 8, 0);
	// // 	set_gpio_pin_value((i - 1) % 8, 1);
	// // 	// uart_send("hello world!\n", 12);

	// // 	uart_sendchar(uart_getchar());
	// // 	// uart_mysendstring("hello world!\n");
	// // 	// for(int j = 0; j < 100000; j++){;}
	// }
}

// char * hex_to_string(unsigned int hex)
// {
// 	static char str[11];
// 	str[0] = ' ';
// 	str[1] = ' ';
// 	for(int i = 0; i < 8; ++i)
// 		str[i + 2] = numchar[(hex >> (4 * i)) & 0x0F];
// 	str[10] = '\0';
// 	return str;
// }

void hex_to_string(char *str, unsigned int hex)
{
	const char numchar[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'A', 'B', 'C', 'D', 'E', 'F'};
	for (int i = 0; i < 8; ++i)
		str[i] = numchar[(hex >> (4 * (7 - i))) & (unsigned int)0xF];
	str[8] = '\0';
	return;
}

int str_to_int(const char *str)
{
	int hex = 0;
	for (int i = 0; i < 8; ++i)
	{
		if (str[i] <= '9' && str[i] >= '0')
			hex |= (int)(str[i] - '0') << 4 * (7 - i);
		else if (str[i] <= 'F' && str[i] >= 'A')
			hex |= (int)(str[i] - 'A' + 0xA) << 4 * (7 - i);
		else if (str[i] <= 'f' && str[i] >= 'a')
			hex |= (int)(str[i] - 'a' + 0xA) << 4 * (7 - i);
	}
	return hex;
}