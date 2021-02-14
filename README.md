# Micro-Kernel
## Description  
Developing a micro kernel to toggle 4 LEDs with different time intervals: 
  * The scheduler schudeles 4 tasks + one idle task in a round-roubin fashion where CPU time gets assigned to each task in an equal portion in a circular order.
  * Systick timer is used to generate exception for every 1ms to run the scheduler code. for context switching/retrieving arm pendSV exception was used. 

## Implementation
  * GNU arm toolchain is used for compiling and linking different translation usits.
  * OpenOCD and GDB client is used for debugging and loading the code to target board.

## Usage 
[Nucleo-F446RE](https://www.st.com/en/evaluation-tools/nucleo-f446re.html) board was used, but you can use code and adjust it to your board.
