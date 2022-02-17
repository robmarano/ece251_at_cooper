#
# Makefile for Assembly Program "While Loop"
#
# The Build Rules for This Program
#
# Variables
# ADD YOUR PROGRAM NAME HERE
APP=while

CC=aarch64-linux-gnu-gcc
CXXFLAGS=#-fpic
OBJDUMP=aarch64-linux-gnu-objdump
STATIC=-static
BUILD_OPTS=-march=armv8-a -mtune=generic -mlittle-endian -mcmodel=tiny -mgeneral-regs-only $(STATIC)
#OBJDUMP_OPTS=-f -s -d --source
OBJDUMP_OPTS=-dr

ASM=$(APP).s
OBJ=$(APP).o
EXE=$(APP).exe

# Rules

# for compilation of assemly files into object files
%.o: %.s 
	$(CC) $(CXXFLAGS) -c -o $@ $<

# for linking object files into an executable program file
# build for static libs embedded: -static
$(EXE): $(APP).o
	$(CC) $(BUILD_OPTS) -o $@ $^

# Compile doen to object code (machine code, unlinked)
$(OBJ): $(APP).s

# This is to trick make to know that "clean" and "run" are targets
.PHONY: run clean oread

# Run the program
# echoing return value from $(EXE), since it's not zero.
# If you just run $(EXE) it will fail with Error 12 in make
# because the return value from the Assembly program seems to be 12
run: $(EXE)
	@echo $(./$(EXE))

clean:
	/bin/rm -f $(OBJ) $(EXE) a.out

oread:
	$(OBJDUMP) $(OBJDUMP_OPTS) $(EXE)
