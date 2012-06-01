#include "driver.h"
#include "osinline.h"

static int use_profiler;


#define MEMORY 6

struct profile_data
{
	UINT64 count[MEMORY][PROFILER_TOTAL];
	unsigned int cpu_context_switches[MEMORY];
};

static struct profile_data profile;
static int memory;


static int FILO_type[10];
static unsigned int FILO_start[10];
static int FILO_length;

void profiler_start(void) { }

void profiler_stop(void) { }

void profiler_mark(int type) { }

void profiler_show(struct osd_bitmap *bitmap) { }
