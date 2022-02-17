#
# Makefile for Assembly Program "While Loop"
#
# The Build Rules for This Program
#
# Variables
# ADD YOUR PROGRAM NAME HERE
APP=while

AS=aarch64-linux-gnu-as
CC=aarch64-linux-gnu-gcc
LD=aarch64-linux-gnu-ld
ASFLAGS=--gstabs -g
ASLIST=-al
CXXFLAGS=-g #-fpic
OBJDUMP=aarch64-linux-gnu-objdump
STATIC=#-static
LINK_OPTS=-maarch64linux -lc -Bdynamic -EL
BUILD_OPTS=-fpic -mabi=lp64 -mcpu=native -march=armv8-a -mtune=generic $(STATIC)
#BUILD_OPTS=-march=armv8-a -mtune=generic -mlittle-endian -mcmodel=tiny -mgeneral-regs-only $(STATIC)
#OBJDUMP_OPTS=-f -s -d --source
OBJDUMP_OPTS=-dr

ASM=$(APP).s
OBJ=$(APP).o
EXE=$(APP).exe

# Rules

# for compilation of assemly files into object files
%.o: %.s 
	$(AS) $(ASFLAGS) -o $@ $<

# for linking object files into an executable program file
# build for static libs embedded: -static
$(EXE): $(APP).o
	$(LD) -o $@ $(LINK_OPTS) $^

# Compile doen to object code (machine code, unlinked)
$(OBJ): $(APP).s

# This is to trick make to know that "clean" and "run" are targets
.PHONY: run clean oread asmlist

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

asmlist:
	$(AS) $(ASFLAGS) $(ASLIST) -o $(OBJ) $(ASM) 
