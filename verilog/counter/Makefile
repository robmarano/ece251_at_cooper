#
# Makefile for Verilog building
# reference https://wiki.hacdc.org/index.php/Iverilogmakefile
# 
# USE THE FOLLOWING COMMANDS WITH THIS MAKEFILE
#	"make check" - compiles your verilog design - good for checking code
#	"make simulate" - compiles your design+TB & simulates your design
#	"make display" - compiles, simulates and displays waveforms
# 
###############################################################################
#
# CHANGE THESE THREE LINES FOR YOUR DESIGN
#
#TOOL INPUT
COMPONENT = counter
SRC = $(COMPONENT).v
SIM_ARGS=
TESTBENCH = $(COMPONENT)_tb.v
TBOUTPUT = $(COMPONENT)_waves.lxt	#THIS NEEDS TO MATCH THE OUTPUT FILE
			#FROM YOUR TESTBENCH
###############################################################################
# BE CAREFUL WHEN CHANGING ITEMS BELOW THIS LINE
###############################################################################
#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave #works on your host, not docker container since it's a GUI
#TOOL OPTIONS
COFLAGS = #-v
SFLAGS = #-v
SOUTPUT = -lxt		#SIMULATOR OUTPUT TYPE
#TOOL OUTPUT
#COUTPUT = compiler.out			#COMPILER OUTPUT
###############################################################################
#MAKE DIRECTIVES
.PHONY: compile simulate display clean
compile : $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) -o $(COMPONENT).exe $(TESTBENCH) $(SRC)

simulate: $(COMPONENT).exe
	$(SIMULATOR) $(SFLAGS) $(COMPONENT).exe $(TESTBENCH) $(SOUTPUT)

display: $(TBOUTPUT)
	$(VIEWER) $(TBOUTPUT) &

clean:
	/bin/rm -f $(COMPONENT).exe a.out compiler.out