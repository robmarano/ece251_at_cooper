@echo off
REM ===========================================================================
REM == SIMULATE.BAT
REM ===========================================================================

set MODULE=fullAdder
set TESTBENCH=%MODULE%_tb.v
set SOUTPUT=-lxt2

vvp %MODULE%.exe %TESTBENCH% %SOUTPUT%
