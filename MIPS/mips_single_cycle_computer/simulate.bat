@echo off
REM ===========================================================================
REM == SIMULATE.BAT
REM ===========================================================================

set MODULE=mips_single_cycle
set TESTBENCH=%MODULE%.sv
set SOUTPUT=-lxt2

vvp %MODULE%.exe %TESTBENCH% %SOUTPUT%
