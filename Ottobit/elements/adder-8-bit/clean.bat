@echo off
REM ===========================================================================
REM == CLEAN.BAT
REM ===========================================================================

set MODULE=adder8bit
if exist a.out del /q a.out
if exist %MODULE%.exe del /q %MODULE%.exe
if exist %MODULE%_test.vcd del /q %MODULE%_test.vcd
if exist test.vcd del /q test.vcd
if exist *.lxt del /q *.lxt
