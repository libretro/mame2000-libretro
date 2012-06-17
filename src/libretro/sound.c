#include "driver.h"
#include "minimal.h"
#include "libretro.h"

int samples_per_frame = 0;
short *samples_buffer;
short *conversion_buffer;
int usestereo = 1;

void hook_audio_done(void);

int osd_start_audio_stream(int stereo)
{
	usestereo = stereo ? 1 : 0;

	/* determine the number of samples per frame */
	samples_per_frame = Machine->sample_rate / Machine->drv->frames_per_second;

	if (Machine->sample_rate == 0) return 0;

	samples_buffer = (short *) calloc(samples_per_frame, 2 + usestereo * 2);
	if (!usestereo) conversion_buffer = (short *) calloc(samples_per_frame, 4);
	
	return samples_per_frame;
}

void osd_stop_audio_stream(void)
{
	samples_per_frame = 0;
}

int osd_update_audio_stream(INT16 *buffer)
{
	memcpy(samples_buffer, buffer, samples_per_frame * (usestereo ? 4 : 2));
   hook_audio_done();

	return samples_per_frame;
}

/* attenuation in dB */
void osd_set_mastervolume(int _attenuation)
{
	(void)_attenuation;
}

int osd_get_mastervolume(void)
{
	return 100;
}

void osd_sound_enable(int enable_it)
{
	(void)enable_it;
}

void osd_opl_control(int chip,int reg)
{
	(void)chip;
	(void)reg;
}

void osd_opl_write(int chip,int data)
{
	(void)chip;
	(void)data;
}
