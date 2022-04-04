@echo off
REM ===========================================================================
REM == DISPLAY.BAT
REM ===========================================================================

set MODULE=fullAdder
set DATA_FILE=%MODULE%_test.vcd

gtkwave %DATA_FILE%