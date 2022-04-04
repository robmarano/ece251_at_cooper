@echo off
REM ===========================================================================
REM == SIMULATE.BAT
REM ===========================================================================

set MODULE=adder8bit
set TESTBENCH=%MODULE%_tb.v
set SOUTPUT=-lxt2

vvp %MODULE%.exe %TESTBENCH% %SOUTPUT%
