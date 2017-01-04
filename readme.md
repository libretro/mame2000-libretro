You compile the libretro core like this:

make

If you are compiling it for an ARM system, add "ARM=1" to the end of the
command, like this:

make ARM=1

There are two additional ASM optimised CPU cores that can be used for
ARM. Cyclone for 68k emulation and DRZ80 for z80. They can bring a
speedup and may be of use for older cpus, but reduce compatibility.
To enable them pass USE_CYCLONE=1 and/or USE_DRZ80=1 to make.

eg.

make ARM=1 USE_CYCLONE=1 USE_DRZ80=1
 
