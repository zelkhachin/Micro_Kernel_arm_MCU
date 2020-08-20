/**
  ******************************************************************************
  * @file       stm32_ls.ld
  * @author     zelkhachin
  * @abstract   Linker script for NUCLEO-F446RE Board embedding STM32F446RETx 
  *             Device from STM32F4 series with 512Kbytes ROM, 128Kbytes RAM          
  *             Set heap size, stack size and stack location according           
  * @target     STMicroelectronics STM32
  ******************************************************************************
*/

ENTRY(Reset_Handler)
MEMORY 
{
    FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 512K 
    SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS 
{
    .text : 
    {
        *(.isr_vector)
        *(.text)
        *(.text.*)
        *(.init)
        *(.fini )
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);/* make the text section word aligned */
    }> FLASH 
    _la_data = LOADADDR(.data);
    .data :
    {   
        _sdata = .; /* symbol contains the start of data section = SRAM_START */ 
        *(.data)
        *(.data.*)
        . = ALIGN(4);/* make the data section word aligned */
        _edata = .; /* symbol contains the end of data section */
    }> SRAM AT> FLASH

    .bss : 
    {   
        _sbss = .; /* symbol contains the start of bss section */ 
        __bss_start__ = _sbss;
        *(.bss)
        *(.bss.*)
        *(COMMON)
        . = ALIGN(4); /* make the bss section word aligned */
        _ebss = .; /* symbol contains the end of bss section */ 
        __bss_end__ = _ebss;
        .= ALIGN(4);
        end = . /* this symbol is needded by the syscall.c to point to the start of heap*/
    }> SRAM
}