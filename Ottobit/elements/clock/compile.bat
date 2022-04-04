@echo off
REM ===========================================================================
REM == COMPILE.BAT
REM ===========================================================================

set MODULE=clock
set SOURCE=%MODULE%.v
set TESTBENCH=%MODULE%_tb.v

iverilog -g2012 -o %MODULE%.exe %TESTBENCH% %SOURCE%
