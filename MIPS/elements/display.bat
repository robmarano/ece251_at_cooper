@echo off
REM ===========================================================================
REM == DISPLAY.BAT
REM ===========================================================================

set MODULE=mips_computer
set DATA_FILE=%MODULE%_test.vcd

gtkwave %DATA_FILE%