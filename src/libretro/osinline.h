
#ifndef __OSINLINE__
#define __OSINLINE__

/* What goes herein depends heavily on the OS. */

#define DIRTY_H 256
#define DIRTY_V 1600/16

extern char *dirty_new;
#define osd_mark_vector_dirty(x,y) dirty_new[(y)/16 * DIRTY_H + (x)/16] = 1

#include "minimal.h"

//if (x < -32768)
//  x = -32768;
//else if (x > 32767)
//  x = 32767;
#define clip_short _clip_short
#define _clip_short(x) { int sign = x >> 31; if (sign != (x >> 15)) x = sign ^ ((1 << 15) - 1); }

#define clip_short_ret _clip_short_ret
INLINE int _clip_short_ret(int x) { _clip_short(x); return x; }


#endif /* __OSINLINE__ */
