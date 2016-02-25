#ifdef WANT_LIBCO
#include <libco.h>
#else
#include <pthread.h>
#endif
#include <stdarg.h>
#include <sys/time.h>
#include "libretro.h"
#include "mame.h"
#include "cpuintrf.h"
#include "osdepend.h"
#include "driver.h"
#include "allegro.h"

char *IMAMEBASEPATH = NULL;
char *IMAMESAMPLEPATH = NULL;

unsigned retro_hook_quit;
volatile static unsigned audio_done;
volatile static unsigned video_done;
volatile static unsigned mame_sleep;
#ifdef WANT_LIBCO
static cothread_t core_thread;
static cothread_t main_thread;
#else
static pthread_t run_thread = 0;
static pthread_cond_t libretro_cond;
static pthread_mutex_t libretro_mutex;
#endif

int game_index = -1;
unsigned short *gp2x_screen15;
int thread_done = 0;
extern int gfx_xoffset;
extern int gfx_yoffset;
extern int gfx_width;
extern int gfx_height;
extern int usestereo;
extern int samples_per_frame;
extern short *samples_buffer;
extern short *conversion_buffer;
extern int joy_pressed[40];
extern int key[KEY_MAX];

void decompose_rom_sample_path(char *rompath, char *samplepath);
void init_joy_list(void);

#if defined(_3DS)
void* linearMemAlign(size_t size, size_t alignment);
void linearFree(void* mem);
#endif

void CLIB_DECL logerror(const char *text,...)
{
#ifdef DISABLE_ERROR_LOGGING
   va_list arg;
   va_start(arg,text);
   vprintf(text,arg);
   va_end(arg);
#endif
}

int global_showinfo = 1;
int emulated_width;
int emulated_height;
int safe_render_path = 1;
unsigned short gp2x_palette[512];
int gp2x_pal_50hz=0;
int global_fps = 1;
int rotate_controls = 0;
int num_of_joys = 2;
int soundcard;
int attenuation = 0;

void gp2x_printf(char* fmt, ...)
{
   va_list marker;
	
   va_start(marker, fmt);
   vprintf(fmt, marker);
   va_end(marker);
}

void gp2x_set_video_mode(int bpp,int width,int height)
{
   (void)bpp;
   (void)width;
   (void)height;
}

void gp2x_video_setpalette(void)
{
}

unsigned long gp2x_joystick_read(int n)
{
   (void)n;
}

int osd_init(void)
{
   return 0;
}

void osd_exit(void)
{
}

int screen_reinit(void)
{
   return 1;
}

static retro_video_refresh_t video_cb;
static retro_audio_sample_t audio_cb;
static retro_audio_sample_batch_t audio_batch_cb;
static retro_environment_t environ_cb;
static retro_input_poll_t input_poll_cb;
static retro_input_state_t input_state_cb;

unsigned skip_disclaimer = 0;

static void update_variables(void)
{
    struct retro_variable var;
    
    var.value = NULL;
    var.key = "mame2000-skip_disclaimer";
    
    if (environ_cb(RETRO_ENVIRONMENT_GET_VARIABLE, &var) || var.value)
    {
        if(strcmp(var.value, "enabled") == 0)
            skip_disclaimer = 1;
        else
            skip_disclaimer = 0;
    }
    else
        skip_disclaimer = 0;
    
    var.value = NULL;
    var.key = "mame2000-show_gameinfo";
    
    if (environ_cb(RETRO_ENVIRONMENT_GET_VARIABLE, &var) || var.value)
    {
        if(strcmp(var.value, "enabled") == 0)
            global_showinfo = 1;
        else
            global_showinfo = 0;
    }
    else
        global_showinfo = 0;
}

void retro_set_environment(retro_environment_t cb)
{
   static const struct retro_variable vars[] = {
      { "mame2000-skip_disclaimer", "Skip Disclaimer; enabled|disabled" },
      { "mame2000-show_gameinfo", "Show Game Information; disabled|enabled" },
      { NULL, NULL },
   };
   environ_cb = cb;
    
   cb(RETRO_ENVIRONMENT_SET_VARIABLES, (void*)vars);
}

void retro_set_audio_sample(retro_audio_sample_t cb)
{
   audio_cb = cb;
}

void retro_set_audio_sample_batch(retro_audio_sample_batch_t cb)
{
   audio_batch_cb = cb;
}

void retro_set_input_poll(retro_input_poll_t cb)
{
   input_poll_cb = cb;
}

void retro_set_input_state(retro_input_state_t cb)
{
   input_state_cb = cb;
}

void retro_set_video_refresh(retro_video_refresh_t cb)
{
   video_cb = cb;
}

void retro_reset(void)
{
   machine_reset();
}

static void update_input(void)
{
#define JS(port, button) input_state_cb(port, RETRO_DEVICE_JOYPAD, 0, RETRO_DEVICE_ID_JOYPAD_##button)
	int i, c = 0;
	input_poll_cb();
	
	for (i = 0; i < 4; i++)
	{
		key[KEY_1 + i]   = JS(i, START);
		key[KEY_5 + i]   = JS(i, SELECT);
		joy_pressed[c++] = JS(i, LEFT);
		joy_pressed[c++] = JS(i, RIGHT);
		joy_pressed[c++] = JS(i, UP);
		joy_pressed[c++] = JS(i, DOWN);
		joy_pressed[c++] = JS(i, B);
		joy_pressed[c++] = JS(i, A);
		joy_pressed[c++] = JS(i, Y);
		joy_pressed[c++] = JS(i, X);
		joy_pressed[c++] = JS(i, L);
		joy_pressed[c++] = JS(i, R);
	}
#undef JS
#undef _B
}
#ifdef WANT_LIBCO
void hook_audio_done(void)
{
}

void hook_video_done(void)
{
   co_switch(main_thread);
}

void run_thread_proc(void)
{
   run_game(game_index);
   hook_audio_done();
   hook_video_done();
}
#else
static void hook_check(void)
{
   if (video_done && audio_done)
   {
      pthread_cond_signal(&libretro_cond);
      if (mame_sleep && !retro_hook_quit)
         pthread_cond_wait(&libretro_cond, &libretro_mutex);
      mame_sleep = 1;
   }
}

void hook_audio_done(void)
{
   pthread_mutex_lock(&libretro_mutex);
   audio_done = 1;
   hook_check();
   pthread_mutex_unlock(&libretro_mutex);
}

void hook_video_done(void)
{
   pthread_mutex_lock(&libretro_mutex);
   if (video_done) // Audio doesn't seem to be running atm, so fake it ...
      audio_done = 1;
   video_done = 1;
   hook_check();
   pthread_mutex_unlock(&libretro_mutex);
}

void *run_thread_proc(void *v)
{
   (void)v;

   run_game(game_index);
   thread_done = 1;
   hook_audio_done();
   hook_video_done();

   return NULL;
}

static void lock_mame(void)
{
   pthread_mutex_lock(&libretro_mutex);
   while (!audio_done || !video_done)
      pthread_cond_wait(&libretro_cond, &libretro_mutex);
   pthread_mutex_unlock(&libretro_mutex);
}

static void unlock_mame(void)
{
   pthread_mutex_lock(&libretro_mutex);
   mame_sleep = 0;
   pthread_cond_signal(&libretro_cond);
   pthread_mutex_unlock(&libretro_mutex);
}
#endif
void retro_init(void)
{
   IMAMEBASEPATH = (char *) malloc(1024);
   IMAMESAMPLEPATH = (char *) malloc(1024);
#ifdef _3DS
   gp2x_screen15 = (unsigned short *) linearMemAlign(640 * 480 * 2, 0x80);
#else
   gp2x_screen15 = (unsigned short *) malloc(640 * 480 * 2);
#endif
#ifndef WANT_LIBCO
   pthread_cond_init(&libretro_cond, NULL);
   pthread_mutex_init(&libretro_mutex, NULL);
#endif
   init_joy_list();
   update_variables();
}

void retro_deinit(void)
{
   free(IMAMEBASEPATH);
   free(IMAMESAMPLEPATH);
#ifdef _3DS
   linearFree(gp2x_screen15);
#else
   free(gp2x_screen15);
#endif
#ifndef WANT_LIBCO
   pthread_cond_destroy(&libretro_cond);
   pthread_mutex_destroy(&libretro_mutex);
#endif
}

unsigned retro_api_version(void)
{
   return RETRO_API_VERSION;
}

void retro_set_controller_port_device(unsigned port, unsigned device)
{
   (void)port;
   (void)device;
}

void retro_get_system_info(struct retro_system_info *info)
{
   info->library_name     = "MAME 2000";
   info->library_version  = build_version;
   info->need_fullpath    = true;
   info->valid_extensions = "zip|ZIP";
   info->block_extract    = true;
}

void retro_get_system_av_info(struct retro_system_av_info *info)
{
#ifndef WANT_LIBCO
   lock_mame();
#endif
   struct retro_game_geometry g = {
      Machine->drv->screen_width,
      Machine->drv->screen_height,
      Machine->drv->screen_width,
      Machine->drv->screen_height,
      ((float) Machine->drv->screen_width / Machine->drv->screen_height) * ((Machine->drv->video_attributes & VIDEO_PIXEL_ASPECT_RATIO_MASK) == VIDEO_PIXEL_ASPECT_RATIO_1_2 ? 0.5f : 1.0f)
   };
   struct retro_system_timing t = {
      Machine->drv->frames_per_second,
      32000.0
   };
   info->timing = t;
   info->geometry = g;
}

void retro_run(void)
{
   int i, j;
#ifdef WANT_LIBCO
   co_switch(core_thread);
#else
   if (run_thread == 0)
   {
   }

   lock_mame();

   if (thread_done)
      environ_cb(RETRO_ENVIRONMENT_SHUTDOWN, NULL);
#endif

   bool updated = false;
    
   update_input();

   if (environ_cb(RETRO_ENVIRONMENT_GET_VARIABLE_UPDATE, &updated) && updated)
      update_variables();

   video_cb(gp2x_screen15, gfx_width, gfx_height, gfx_width * 2);
   if (samples_per_frame)
   {
      if (usestereo)
         audio_batch_cb(samples_buffer, samples_per_frame);
      else
      {
         for (i = 0, j = 0; i < samples_per_frame; i++)
         {
            conversion_buffer[j++] = samples_buffer[i];
            conversion_buffer[j++] = samples_buffer[i];
         }
         audio_batch_cb(conversion_buffer, samples_per_frame);
      }
   }

   audio_done = 0;
   video_done = 0;

#ifndef WANT_LIBCO
   unlock_mame();
#endif
}

bool retro_load_game(const struct retro_game_info *info)
{
   enum retro_pixel_format fmt = RETRO_PIXEL_FORMAT_RGB565;
   if (!environ_cb(RETRO_ENVIRONMENT_SET_PIXEL_FORMAT, &fmt))
   {
      fprintf(stderr, "[libretro]: RGB565 is not supported.\n");
      return false;
   }

   int i;
   memcpy(IMAMEBASEPATH, info->path, strlen(info->path) + 1);
   if (strrchr(IMAMEBASEPATH, '/')) *(strrchr(IMAMEBASEPATH, '/')) = 0;
   else { IMAMEBASEPATH[0] = '.'; IMAMEBASEPATH[1] = 0; }
   char baseName[1024];
   const char *romName = info->path;
   if (strrchr(info->path, '/')) romName = strrchr(info->path, '/') + 1;
   memcpy(baseName, romName, strlen(romName) + 1);
   if (strrchr(baseName, '.')) *(strrchr(baseName, '.')) = 0;

   strcpy(IMAMESAMPLEPATH, IMAMEBASEPATH);
   strcat(IMAMESAMPLEPATH, "/samples");

   /* do we have a driver for this? */
   for (i = 0; drivers[i] && (game_index == -1); i++)
   {
	   if (strcasecmp(baseName,drivers[i]->name) == 0)
	   {
		   game_index = i;
		   break;
	   }
   }

   if (game_index == -1)
   {
	   printf("Game \"%s\" not supported\n", baseName);
	   return false;
   }

   /* parse generic (os-independent) options */
   //parse_cmdline (argc, argv, game_index);

   Machine->sample_rate = 32000;
   options.samplerate = 32000;

   /* This is needed so emulated YM3526/YM3812 chips are used instead on physical ones. */
   options.use_emulated_ym3812 = 1;

   /* enable samples - should be stored in "sample" subdirectory from roms */
   options.use_samples = 1;

   /* skip disclaimer - skips 'nag screen' */
   options.skip_disclaimer = skip_disclaimer;

   /* Replace M68000 by CYCLONE */
#if (HAS_CYCLONE)
   int use_cyclone = 1;
   if (use_cyclone)
   {
	   for (i=0;i<MAX_CPU;i++)
	   {
		   int *type=(int*)&(drivers[game_index]->drv->cpu[i].cpu_type);
#ifdef NEOMAME
		   if (((*type)&0xff)==CPU_M68000)
#else
			   if (((*type)&0xff)==CPU_M68000 || ((*type)&0xff)==CPU_M68010 )
#endif
			   {
				   *type=((*type)&(~0xff))|CPU_CYCLONE;
			   }
	   }
   }
#endif

#if (HAS_DRZ80)
   int use_drz80 = 1;
   /* Replace Z80 by DRZ80 */
   if (use_drz80)
   {
	   for (i=0;i<MAX_CPU;i++)
	   {
		   int *type=(int*)&(drivers[game_index]->drv->cpu[i].cpu_type);
		   if (((*type)&0xff)==CPU_Z80)
		   {
			   *type=((*type)&(~0xff))|CPU_DRZ80;
		   }
	   }
   }
#endif

   // Remove the mouse usage for certain games
   if ( (strcasecmp(drivers[game_index]->name,"hbarrel")==0) || (strcasecmp(drivers[game_index]->name,"hbarrelw")==0) ||
		   (strcasecmp(drivers[game_index]->name,"midres")==0) || (strcasecmp(drivers[game_index]->name,"midresu")==0) ||
		   (strcasecmp(drivers[game_index]->name,"midresj")==0) || (strcasecmp(drivers[game_index]->name,"tnk3")==0) ||
		   (strcasecmp(drivers[game_index]->name,"tnk3j")==0) || (strcasecmp(drivers[game_index]->name,"ikari")==0) ||
		   (strcasecmp(drivers[game_index]->name,"ikarijp")==0) || (strcasecmp(drivers[game_index]->name,"ikarijpb")==0) ||
		   (strcasecmp(drivers[game_index]->name,"victroad")==0) || (strcasecmp(drivers[game_index]->name,"dogosoke")==0) ||
		   (strcasecmp(drivers[game_index]->name,"gwar")==0) || (strcasecmp(drivers[game_index]->name,"gwarj")==0) ||
		   (strcasecmp(drivers[game_index]->name,"gwara")==0) || (strcasecmp(drivers[game_index]->name,"gwarb")==0) ||
		   (strcasecmp(drivers[game_index]->name,"bermudat")==0) || (strcasecmp(drivers[game_index]->name,"bermudaj")==0) ||
		   (strcasecmp(drivers[game_index]->name,"bermudaa")==0) || (strcasecmp(drivers[game_index]->name,"mplanets")==0) ||
		   (strcasecmp(drivers[game_index]->name,"forgottn")==0) || (strcasecmp(drivers[game_index]->name,"lostwrld")==0) ||
		   (strcasecmp(drivers[game_index]->name,"gondo")==0) || (strcasecmp(drivers[game_index]->name,"makyosen")==0) ||
		   (strcasecmp(drivers[game_index]->name,"topgunr")==0) || (strcasecmp(drivers[game_index]->name,"topgunbl")==0) ||
		   (strcasecmp(drivers[game_index]->name,"tron")==0) || (strcasecmp(drivers[game_index]->name,"tron2")==0) ||
		   (strcasecmp(drivers[game_index]->name,"kroozr")==0) ||(strcasecmp(drivers[game_index]->name,"crater")==0) ||
		   (strcasecmp(drivers[game_index]->name,"dotron")==0) || (strcasecmp(drivers[game_index]->name,"dotrone")==0) ||
		   (strcasecmp(drivers[game_index]->name,"zwackery")==0) || (strcasecmp(drivers[game_index]->name,"ikari3")==0) ||
		   (strcasecmp(drivers[game_index]->name,"searchar")==0) || (strcasecmp(drivers[game_index]->name,"sercharu")==0) ||
		   (strcasecmp(drivers[game_index]->name,"timesold")==0) || (strcasecmp(drivers[game_index]->name,"timesol1")==0) ||
		   (strcasecmp(drivers[game_index]->name,"btlfield")==0) || (strcasecmp(drivers[game_index]->name,"aztarac")==0))
   {
	   extern int use_mouse;
	   use_mouse=0;
   }

   decompose_rom_sample_path(IMAMEBASEPATH, IMAMESAMPLEPATH);

   mame_sleep = 1;

#ifdef WANT_LIBCO
   main_thread = co_active();
   core_thread = co_create(0x10000, run_thread_proc);
   co_switch(core_thread);
#else
   pthread_create(&run_thread, NULL, run_thread_proc, NULL);
#endif

   return true;
}

void retro_unload_game(void)
{
#ifdef WANT_LIBCO
   co_delete(core_thread);
#else
   pthread_mutex_lock(&libretro_mutex);
   // make sure we escape the copyright warning and game warning loops
   key[KEY_ESC] = 1;
   retro_hook_quit = 1;
   mame_sleep = 0;
   pthread_cond_signal(&libretro_cond);
   pthread_mutex_unlock(&libretro_mutex);

   if (run_thread)
      pthread_join(run_thread, NULL);

   run_thread = 0;
   retro_hook_quit = 0;
#endif
}

unsigned retro_get_region(void)
{
   return RETRO_REGION_NTSC;
}

bool retro_load_game_special(unsigned type, const struct retro_game_info *info, size_t num)
{
   (void)type;
   (void)info;
   (void)num;
   return false;
}

size_t retro_serialize_size(void)
{
   return 0;
}

bool retro_serialize(void *data_, size_t size)
{
   (void)data_;
   (void)size;
   return false;
}

bool retro_unserialize(const void *data_, size_t size)
{
   (void)data_;
   (void)size;
   return false;
}

void *retro_get_memory_data(unsigned id)
{
   return NULL;
}

size_t retro_get_memory_size(unsigned id)
{
   return 0;
}

void retro_cheat_reset(void)
{}

void retro_cheat_set(unsigned index, bool enabled, const char *code)
{
   (void)index;
   (void)enabled;
   (void)code;
}