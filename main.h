/**
  ******************************************************************************
  * @file    main.h
  * @author  zelkhachin
  ******************************************************************************
*/
#ifndef MAIN_H_
#define MAIN_H_

#include<stdint.h>
#define MAX_TASKS   5

/*stack memory calculations */
#define SIZE_TASK_STACK          1024U
#define SIZE_SCHED_STACK         1024U

#define SRAM_START               0x20000000U
#define SIZE_SRAM                ( (128) * (1024))
#define SRAM_END                 ((SRAM_START) + (SIZE_SRAM) )

#define T1_STACK_START           SRAM_END
#define T2_STACK_START           ( (SRAM_END) - (1 * SIZE_TASK_STACK) )
#define T3_STACK_START           ( (SRAM_END) - (2 * SIZE_TASK_STACK) )
#define T4_STACK_START           ( (SRAM_END) - (3 * SIZE_TASK_STACK) )
#define IDLE_STACK_START         ( (SRAM_END) - (4 * SIZE_TASK_STACK) )
#define SCHED_STACK_START        ( (SRAM_END) - (5 * SIZE_TASK_STACK) )
/* SysTick Timer count frequency*/
#define TICK_HZ 				1000U

#define HSI_CLOCK         		16000000U
#define SYSTICK_TIM_CLK   		HSI_CLOCK


#define DUMMY_XPSR  			0x01000000U

#define TASK_READY_STATE  		0x00
#define TASK_BLOCKED_STATE  	0XFF

#define INTERRUPT_DISABLE()  	do{__asm volatile ("MOV R0,#0x1"); asm volatile("MSR PRIMASK,R0"); } while(0)

#define INTERRUPT_ENABLE()  	do{__asm volatile ("MOV R0,#0x0"); asm volatile("MSR PRIMASK,R0"); } while(0)

/* This is a task control block carries private information of each task */
typedef struct
{
	uint32_t psp_value;
	uint32_t block_count;
	uint8_t  current_state;
	void (*task_handler)(void);
}TCB_t;

#endif /* MAIN_H_ */
