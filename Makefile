DEBUG=0
WANT_LIBCO = 1
DISABLE_ERROR_LOGGING = 1
#set later according to platform
IS_X86 = 0
TARGET_NAME = mame2000

GCC_DEFINES := -Wno-sign-compare -Wunused -Wpointer-arith -Waggregate-return -Wshadow -Werror=implicit-function-declaration

ifeq ($(platform),)
platform = unix
ifeq ($(shell uname -a),)
   platform = win
else ifneq ($(findstring MINGW,$(shell uname -a)),)
   platform = win
else ifneq ($(findstring Darwin,$(shell uname -a)),)
   platform = osx
else ifneq ($(findstring win,$(shell uname -a)),)
   platform = win
endif
endif

# system platform
system_platform = unix
ifeq ($(shell uname -a),)
	EXE_EXT = .exe
	system_platform = win
else ifneq ($(findstring Darwin,$(shell uname -a)),)
	system_platform = osx
ifeq ($(shell uname -p),powerpc)
	arch = ppc
else
	arch = intel
endif
else ifneq ($(findstring MINGW,$(shell uname -a)),)
	system_platform = win
endif

# UNIX
ifeq ($(platform), unix)
   TARGET := $(TARGET_NAME)_libretro.so
   fpic := -fPIC
   SHARED := -shared -Wl,--version-script=src/libretro/link.T -Wl,-no-undefined
   IS_X86 = 1

# OS X
else ifeq ($(platform), osx)
   TARGET := $(TARGET_NAME)_libretro.dylib
   fpic := -fPIC
ifeq ($(arch),ppc)
		CFLAGS += -D__ppc__ -DMSB_FIRST
endif
   SHARED := -dynamiclib
   IS_X86 = 1

# iOS
else ifneq (,$(findstring ios,$(platform)))
	TARGET := $(TARGET_NAME)_libretro_ios.dylib
	fpic := -fPIC
	SHARED := -dynamiclib

ifeq ($(IOSSDK),)
   IOSSDK := $(shell xcodebuild -version -sdk iphoneos Path)
endif

   CC = cc -arch armv7 -isysroot $(IOSSDK)
	LD = armv7-apple-darwin11-ld
	CFLAGS += -DIOS
   ARM = 1

# PS3
else ifeq ($(platform), ps3)
   TARGET := $(TARGET_NAME)_libretro.a
   CC = $(CELL_SDK)/host-win32/ppu/bin/ppu-lv2-gcc.exe
   AR = $(CELL_SDK)/host-win32/ppu/bin/ppu-lv2-ar.exe
   ENDIANNESS_DEFINES := -DMSB_FIRST
   PLATFORM_DEFINES := -D__CELLOS_LV2__ -D__ppc__
   HAVE_RZLIB := 1
   STATIC_LINKING := 1

# PS3 (SNC)
else ifeq ($(platform), sncps3)
   TARGET := $(TARGET_NAME)_libretro.a
   CC = $(CELL_SDK)/host-win32/sn/bin/ps3ppusnc.exe
   AR = $(CELL_SDK)/host-win32/sn/bin/ps3snarl.exe
   ENDIANNESS_DEFINES := -DMSB_FIRST
   CFLAGS += -DWORDS_BIGENDIAN=1
   GCC_DEFINES :=
   PLATFORM_DEFINES := -D__CELLOS_LV2__ -D__ppc__
   HAVE_RZLIB := 1
   STATIC_LINKING := 1

# Lightweight PS3 Homebrew SDK
else ifeq ($(platform), psl1ght)
   TARGET := $(TARGET_NAME)_libretro.a
   CC = $(PS3DEV)/ppu/bin/ppu-gcc$(EXE_EXT)
   AR = $(PS3DEV)/ppu/bin/ppu-ar$(EXE_EXT)
   ENDIANNESS_DEFINES := -DMSB_FIRST
   CFLAGS += -DWORDS_BIGENDIAN=1
   GCC_DEFINES :=
   PLATFORM_DEFINES := -D__CELLOS_LV2__ -D__ppc__
   HAVE_RZLIB := 1
   STATIC_LINKING := 1

# Xbox 360 (libxenon)
else ifeq ($(platform), xenon)
   TARGET := $(TARGET_NAME)_libretro.a
   CC = xenon-gcc$(EXE_EXT)
   AR = xenon-ar$(EXE_EXT)
   ENDIANNESS_DEFINES := -DMSB_FIRST
   CFLAGS += -D__LIBXENON__ -m32 -D__ppc__
   PLATFORM_DEFINES := -D__LIBXENON__ -D__ppc_
   STATIC_LINKING := 1

# Nintendo Game Cube
else ifeq ($(platform), ngc)
   TARGET := $(TARGET_NAME)_libretro.a
   CC = $(DEVKITPPC)/bin/powerpc-eabi-gcc$(EXE_EXT)
   AR = $(DEVKITPPC)/bin/powerpc-eabi-ar$(EXE_EXT)
   ENDIANNESS_DEFINES := -DMSB_FIRST
   PLATFORM_DEFINES += -DGEKKO -DHW_DOL -mrvl -mcpu=750 -meabi -mhard-float
   HAVE_RZLIB := 1
   STATIC_LINKING := 1

# Nintendo Wii
else ifeq ($(platform), wii)
   TARGET := $(TARGET_NAME)_libretro.a
   CC = $(DEVKITPPC)/bin/powerpc-eabi-gcc$(EXE_EXT)
   AR = $(DEVKITPPC)/bin/powerpc-eabi-ar$(EXE_EXT)
   ENDIANNESS_DEFINES := -DMSB_FIRST
   PLATFORM_DEFINES += -DGEKKO _DHW_RVL -mrvl -mcpu=750 -meabi -mhard-float
   HAVE_RZLIB := 1
   STATIC_LINKING := 1

# CTR(3DS)
else ifeq ($(platform), ctr)
   TARGET := $(TARGET_NAME)_libretro_ctr.a
   CC = $(DEVKITARM)/bin/arm-none-eabi-gcc$(EXE_EXT)
   CXX = $(DEVKITARM)/bin/arm-none-eabi-g++$(EXE_EXT)
   AR = $(DEVKITARM)/bin/arm-none-eabi-ar$(EXE_EXT)
   CFLAGS += -DARM11 -D_3DS
   CFLAGS += -march=armv6k -mtune=mpcore -mfloat-abi=hard
   CFLAGS += -Wall -mword-relocations
   CFLAGS += -fomit-frame-pointer -ffast-math
   CXXFLAGS = $(CFLAGS) -fno-rtti -fno-exceptions -std=gnu++11
   HAVE_RZLIB := 1
   DISABLE_ERROR_LOGGING := 1
   ARM = 1
   STATIC_LINKING := 1

# Windows
else
   TARGET := $(TARGET_NAME)_libretro.dll
   CC = gcc
   SHARED := -shared -static-libgcc -static-libstdc++ -s -Wl,--version-script=src/libretro/link.T
   CFLAGS += -D__WIN32__ -D__WIN32_LIBRETRO__ -Wno-missing-field-initializers
   IS_X86 = 1
endif

ifeq ($(IS_X86), 1)
X86_DEFINES = -Dasm="__asm__ __volatile__"
CFLAGS +=  $(X86_DEFINES)
endif

ifeq ($(DEBUG), 1)
	CFLAGS += -O0 -g
else
CFLAGS += -O3
endif


# set this the operating system you're building for
MAMEOS = libretro

# CPU core include paths
VPATH=src $(wildcard src/cpu/*)

# compiler, linker and utilities
MD = @mkdir
RM = rm -f

EMULATOR = $(TARGET)

DEFS = -DGP2X -DALIGN_INTS -DALIGN_SHORTS -DINLINE="static __inline" $(X86_DEFINES) -DMAME_UNDERCLOCK -DMAME_FASTSOUND -DENABLE_AUTOFIRE -DBIGCASE -D__LIBRETRO__ $(ENDIANNESS_DEFINES)

LIBS = -lm -lpthread

OBJ = obj

ifeq ($(HAVE_RZLIB),)
ZLIB_INCLUDE := -Isrc/zlib
endif


CFLAGS += -ffast-math $(fpic) $(PLATFORM_DEFINES) -Isrc -Isrc/$(MAMEOS) $(ZLIB_INCLUDE) $(GCC_DEFINES)

OBJDIRS = $(OBJ) $(OBJ)/cpu $(OBJ)/sound $(OBJ)/$(MAMEOS) \
	$(OBJ)/drivers $(OBJ)/machine $(OBJ)/vidhrdw $(OBJ)/sndhrdw $(OBJ)/zlib

all:	maketree $(EMULATOR)

# include the various .mak files
include src/core.mak
include src/mame.mak
include src/rules.mak
include src/sound.mak
include src/$(MAMEOS)/$(MAMEOS).mak

# combine the various definitions to one
CDEFS = $(DEFS) $(COREDEFS) $(CPUDEFS) $(SOUNDDEFS)

ifeq ($(HAVE_RZLIB),1)
OBJS := $(COREOBJS) $(OSOBJS) $(DRVOBJS)
else
OBJS := $(ZLIBOBJS) $(COREOBJS) $(OSOBJS) $(DRVOBJS)
endif

$(EMULATOR): $(OBJS)
ifeq ($(STATIC_LINKING), 1)
	$(AR) rcs $@ $(OBJS)
else
	@echo Linking $@...
	$(CC) $(SHARED) $(LDFLAGS) $(LIBS) $(OBJS) -o $@
endif

$(OBJ)/%.o: src/%.c
	@echo Compiling $<...
	$(CC) $(CDEFS) $(CFLAGS) -c $< -o $@

$(OBJ)/%.o: src/%.s
	@echo Compiling $<...
	$(CC) $(CDEFS) $(CFLAGS) -c $< -o $@

$(OBJ)/%.o: src/%.S
	@echo Compiling $<...
	$(CC) $(CDEFS) $(CFLAGS) -c $< -o $@

$(sort $(OBJDIRS)):
	$(MD) $@

maketree: $(sort $(OBJDIRS))

clean:
	$(RM) -r $(OBJ)
	$(RM) $(EMULATOR)
