# Task_Scheduler
Toggling 4 LEDs with different time intervals using a scheduler: 
  * The scheduler schudeles 4 tasks + one idle task in a round-roubin fashion where CPU time gets assigned to each task in an equal portion in a circular order.
  * Systick timer is used to generate exception for every 1ms to run the scheduler code. for context switching/retrieving arm pendSV exception was used. 
  * No Task Priority was implemented.


# Usage 
For this assignments Nucleo-F446RE board was used, but you can use code and adjust it to your board.

