# GCD

The GCD is a mathematical term for the Greatest Common Divisor of two or more numbers. It is the Greatest common divisor that completely divides two or more numbers without leaving any remainder. 

Greatest common divisor of two 32-bit numbers in verilog

The following code is written in Verilog and the simulation is done on Xilinx ISE.

The algorithm for finding the GCD of two integers is very simple.
When we try to do it on the hardware, the whole picture changes. We have to define everything from what a number is to how the clock will synchronize with the operation of the Control and Data path.

The control path will provide the control signals and the data path will contain all the logic for mathematical operation as subtraction.