DEBUG=0
WANT_LIBCO = 1
DISABLE_ERROR_LOGGING = 1
#set later according to platform
IS_X86 = 0
TARGET_NAME = mame2000

CORE_DIR = .
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
   SHARED := -shared -Wl,--version-script=link.T -Wl,-no-undefined
ifneq ($(ARM), 1)
   IS_X86 = 1
endif

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
   PLATFORM_DEFINES += -DGEKKO -DHW_RVL -mrvl -mcpu=750 -meabi -mhard-float
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

# GCW0
else ifeq ($(platform), gcw0)
   TARGET := $(TARGET_NAME)_libretro.so
   CC = /opt/gcw0-toolchain/usr/bin/mipsel-linux-gcc
   CXX = /opt/gcw0-toolchain/usr/bin/mipsel-linux-g++
   AR = /opt/gcw0-toolchain/usr/bin/mipsel-linux-ar
   fpic := -fPIC
   SHARED := -shared -Wl,--version-script=src/libretro/link.T -Wl,-no-undefined
   
   DISABLE_ERROR_LOGGING := 1
   CFLAGS += -march=mips32 -mtune=mips32r2 -mhard-float

# Windows
else
   TARGET := $(TARGET_NAME)_libretro.dll
   CC = gcc
   SHARED := -shared -static-libgcc -static-libstdc++ -s -Wl,--version-script=link.T
   CFLAGS += -D__WIN32__ -D__WIN32_LIBRETRO__ -Wno-missing-field-initializers
   IS_X86 = 1
endif

ifeq ($(IS_X86), 1)
X86_DEFINES = -Dasm="__asm__ __volatile__"
CFLAGS +=  $(X86_DEFINES)
endif

ifeq ($(ARM), 1)
   CFLAGS += -fsigned-char
endif

ifeq ($(DEBUG), 1)
	CFLAGS += -O0 -g
else
CFLAGS += -O3
endif

# compiler, linker and utilities
RM = rm -f
LIBS = -lm
OBJ = obj

ifeq ($(HAVE_RZLIB),)
ZLIB_INCLUDE := -Isrc/zlib
endif

INCFLAGS :=

# include the various .mak files
include Makefile.common

DEFS += -ffast-math $(fpic) $(PLATFORM_DEFINES) $(ZLIB_INCLUDE) $(GCC_DEFINES) $(INCFLAGS)
# combine the various definitions to one
CDEFS +=  $(ENDIANNESS_DEFINES)$(DEFS) $(COREDEFS) $(CPUDEFS) $(SOUNDDEFS)

OBJECTS := $(SOURCES_C:.c=.o) $(SOURCES_ASM:.s=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
ifeq ($(STATIC_LINKING), 1)
	$(AR) rcs $@ $(OBJECTS)
else
	@echo Linking $@...
	$(CC) $(SHARED) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@
endif

%.o: %.c
	$(CC) $(CDEFS) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(CC) $(CDEFS) $(CFLAGS) -c $< -o $@

%.o: %.S
	$(CC) $(CDEFS) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: clean
