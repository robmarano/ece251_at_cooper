#
# Makefile for Assembly Program "While Loop"
#
# The Build Rules for This Program
#
# Variables
# ADD YOUR PROGRAM NAME HERE
APP=stack_grows_direction

CC=aarch64-linux-gnu-gcc
OBJDUMP=aarch64-linux-gnu-objdump
STATIC=#-static
LINK_OPTS=-maarch64linux -lc -Bdynamic -EL -shared
BUILD_OPTS=-fpic -mabi=lp64 -mcpu=native -march=armv8-a -mtune=generic $(STATIC)
#BUILD_OPTS=-march=armv8-a -mtune=generic -mlittle-endian -mcmodel=tiny -mgeneral-regs-only $(STATIC)
#OBJDUMP_OPTS=-f -s -d --source
OBJDUMP_OPTS=-dr

OBJ=$(APP).o
EXE=$(APP).exe

# Rules

# for linking object files into an executable program file
# build for static libs embedded: -static
$(EXE): $(APP).c
	$(CC) -o $@ $(BUILD_OPTS) $^

# This is to trick make to know that "clean" and "run" are targets
.PHONY: run clean oread asmlist

# Run the program
# echoing return value from $(EXE), since it's not zero.
# If you just run $(EXE) it will fail with Error 12 in make
# because the return value from the Assembly program seems to be 12
.SILENT:
run: $(EXE) $(OBJ) $(ASM)
	./$(EXE) \
	e=$$?; \
	exit $$e

clean:
	/bin/rm -f $(OBJ) $(EXE) a.out

oread: $(EXE)
	$(OBJDUMP) $(OBJDUMP_OPTS) $(EXE)
