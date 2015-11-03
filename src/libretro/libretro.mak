ifneq ($(ARM),)
	DEFS += -DIS_ARM=1
	CPUDEFS += -DHAS_CYCLONE=1 -DHAS_DRZ80=1
	OBJDIRS += $(OBJ)/cpu/m68000_cyclone $(OBJ)/cpu/z80_drz80
	CPUOBJS += $(OBJ)/cpu/m68000_cyclone/cyclone.o \
				  $(OBJ)/cpu/m68000_cyclone/c68000.o \
				  $(OBJ)/cpu/z80_drz80/drz80.o \
				  $(OBJ)/cpu/z80_drz80/drz80_z80.o
endif

#OBJDIRS += $(OBJ)/cpu/nec_armnec
#CPUDEFS += -DHAS_ARMNEC
#CPUOBJS += $(OBJ)/cpu/nec_armnec/armV30.o $(OBJ)/cpu/nec_armnec/armV33.o $(OBJ)/cpu/nec_armnec/armnecintrf.o

OSOBJS = $(OBJ)/libretro/libretro.o \
			$(OBJ)/libretro/video.o \
			$(OBJ)/libretro/blit.o \
			$(OBJ)/libretro/sound.o \
			$(OBJ)/libretro/input.o \
			$(OBJ)/libretro/fileio.o \
			$(OBJ)/libretro/config.o \
			$(OBJ)/libretro/shared.o

ifeq ($(WANT_LIBCO), 1)
	DEFS += -DWANT_LIBCO -Isrc/libretro/libretro-common/include
	OBJDIRS += $(OBJ)/libretro
	OBJDIRS += $(OBJ)/libretro/libretro-common
   OBJDIRS += $(OBJ)/libretro/libretro-common/libco
	OSOBJS += $(OBJ)/libretro/libretro-common/libco/libco.o
endif

