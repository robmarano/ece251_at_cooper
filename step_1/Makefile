#
# Makefile for Assembly Program Step 1
#
# The Build Rules for This Program
#
# Variables
# ADD YOUR PROGRAM NAME HERE
APP=step_1

CC=gcc
AS=as
LD=ld
OBJDUMP=/usr/bin/aarch64-linux-gnu-objdump #linked to objdump

ASM=$(APP).s
OBJ=$(APP).o
EXE=$(APP).exe

DEBUG=#-g -O0 -fno-builtin
BUILD_OPTS= $(DEBUG) -mimplicit-it=always -march=armv8-a -mtune=generic -mlittle-endian -mcmodel=tiny -mgeneral-regs-only
LIBS=-dynamic-linker #-lc /lib/ld-linux-aarch64.so.1
ENTRY=#--entry main #--init=main
DEBUG_LINK=#--print-map --unresolved-symbols=report-all
LINK_OPTS=$(LIBS) $(ENTRY) $(DEBUG_LINK)

# Rules
# for compilation of c files into assembly files
%.s: %.c 
	$(CC) $(BUILD_OPTS) -S -o $@ $<

# for compilation of assemly files into object files
%.o: %.s 
	$(AS) -o $@ $<

# for linking object files into an executable program file
$(EXE): $(APP).o
	$(CC) -o $@ $(LINK_OPTS) $^ $(ENTRY)

# Compile doen to object code (machine code, unlinked)
$(OBJ): $(APP).s

# Assemble the C file
$(ASM): $(APP).c

# This is to trick make to know that "clean" and "run" are targets
.PHONY: run clean oread

# Run the program
# echoing return value from $(EXE), since it's not zero.
# If you just run $(EXE) it will fail with Error 12 in make
# because the return value from the Assembly program seems to be 12
run: $(EXE)
	@echo $(./$(EXE))

clean:
	/bin/rm -f $(OBJ) $(ASM) $(EXE) a.out

oread:
	$(OBJDUMP) -f -s -d --source $(EXE)
