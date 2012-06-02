# define NEOMAME
NEOMAME = 1

# tiny compile
COREDEFS = -DNEOMAME

# override executable name
EMULATOR_EXE = neomame.exe

# CPUs
CPUS+=Z80@
CPUS+=M68000@

# SOUNDs
SOUNDS+=AY8910@
SOUNDS+=YM2610@

$(OBJ)/drivers/neogeo.o: src/machine/neogeo.c src/machine/pd4990a.c src/vidhrdw/neogeo.c src/drivers/neogeo.c

DRVOBJS = $(OBJ)/drivers/neogeo.o

# MAME specific core objs
COREOBJS += $(OBJ)/driver.o

