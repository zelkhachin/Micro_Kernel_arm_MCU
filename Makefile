CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS=-c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0
LDFLAGS=-c -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=nano.specs -T stm32_ls.ld -Wl,-Map=final.map

all:main.o led.o stm32_startup.o syscalls.o final.elf
main.o:main.c 
	$(CC) $(CFLAGS) -o $@ $^ 
led.o:led.c
	$(CC) $(CFLAGS) -o $@ $^
stm32_startup.o:stm32_startup.c 
	$(CC) $(CFLAGS) -o $@ $^

syscalls.o:syscalls.c 
	$(CC) $(CFLAGS) -o $@ $^

final.elf : main.o led.o stm32_startup.o syscalls.o
	$(CC) $(LDFLAGS) -o $@ $^
clean: 
	rm -rf *.o 
load: 
	openocd -f board/st_nucleo_f4².cfg
