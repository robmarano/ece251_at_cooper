@echo off
REM ===========================================================================
REM == COMPILE.BAT
REM ===========================================================================

set MODULE=mips_computer
set SOURCE=%MODULE%.sv
set TESTBENCH=%MODULE%_tb.sv

iverilog -g2012 -o %MODULE%.exe %TESTBENCH% %SOURCE%
