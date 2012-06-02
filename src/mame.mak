# uncomment the following lines to include a CPU core
CPUS+=Z80@
#CPUS+=Z80GB@
CPUS+=8080@
CPUS+=8085A@
CPUS+=M6502@
CPUS+=M65C02@
#CPUS+=M65SC02@
#CPUS+=M65CE02@
#CPUS+=M6509@
CPUS+=M6510@
#CPUS+=M6510T@
#CPUS+=M7501@
#CPUS+=M8502@
#CPUS+=M4510@
CPUS+=N2A03@
CPUS+=H6280@
CPUS+=I86@
#CPUS+=I88@
CPUS+=I186@
#CPUS+=I188@
#CPUS+=I288@
CPUS+=V20@
CPUS+=V30@
CPUS+=V33@
CPUS+=I8035@
CPUS+=I8039@
CPUS+=I8048@
CPUS+=N7751@
CPUS+=M6800@
CPUS+=M6801@
CPUS+=M6802@
CPUS+=M6803@
CPUS+=M6808@
CPUS+=HD63701@
CPUS+=NSC8105@
CPUS+=M6805@
CPUS+=M68705@
CPUS+=HD63705@
CPUS+=HD6309@
CPUS+=M6809@
CPUS+=KONAMI@
CPUS+=M68000@
CPUS+=M68010@
CPUS+=M68EC020@
CPUS+=M68020@
CPUS+=T11@
CPUS+=S2650@
CPUS+=TMS34010@
#CPUS+=TMS9900@
#CPUS+=TMS9940@
CPUS+=TMS9980@
#CPUS+=TMS9985@
#CPUS+=TMS9989@
#CPUS+=TMS9995@
#CPUS+=TMS99105A@
#CPUS+=TMS99110A@
CPUS+=Z8000@
CPUS+=TMS320C10@
CPUS+=CCPU@
#CPUS+=PDP1@
CPUS+=ADSP2100@
CPUS+=ADSP2105@
CPUS+=MIPS@
#CPUS+=SC61860@
#CPUS+=ARM@

# uncomment the following lines to include a sound core
SOUNDS+=CUSTOM@
SOUNDS+=SAMPLES@
SOUNDS+=DAC@
SOUNDS+=DISCRETE@
SOUNDS+=AY8910@
SOUNDS+=YM2203@
# enable only one of the following two
SOUNDS+=YM2151@
#SOUNDS+=YM2151_ALT@
SOUNDS+=YM2608@
SOUNDS+=YM2610@
SOUNDS+=YM2610B@
SOUNDS+=YM2612@
SOUNDS+=YM3438@
SOUNDS+=YM2413@
SOUNDS+=YM3812@
SOUNDS+=YMZ280B@
SOUNDS+=YM3526@
SOUNDS+=Y8950@
SOUNDS+=SN76477@
SOUNDS+=SN76496@
SOUNDS+=POKEY@
#SOUNDS+=TIA@
SOUNDS+=NES@
SOUNDS+=ASTROCADE@
SOUNDS+=NAMCO@
SOUNDS+=TMS36XX@
SOUNDS+=TMS5220@
SOUNDS+=VLM5030@
SOUNDS+=ADPCM@
SOUNDS+=OKIM6295@
SOUNDS+=MSM5205@
SOUNDS+=UPD7759@
SOUNDS+=HC55516@
SOUNDS+=K005289@
SOUNDS+=K007232@
SOUNDS+=K051649@
SOUNDS+=K053260@
SOUNDS+=K054539@
SOUNDS+=SEGAPCM@
SOUNDS+=RF5C68@
SOUNDS+=CEM3394@
SOUNDS+=C140@
SOUNDS+=QSOUND@
#SOUNDS+=SPEAKER@
#SOUNDS+=WAVE@

$(OBJ)/drivers/pacman.o: src/machine/pacplus.c src/machine/theglob.c src/drivers/pacman.c
$(OBJ)/drivers/jrpacman.o: src/drivers/jrpacman.c src/vidhrdw/jrpacman.c
$(OBJ)/drivers/pengo.o: src/vidhrdw/pengo.c src/drivers/pengo.c
OBJ_PACMAN = $(OBJ)/drivers/pacman.o $(OBJ)/drivers/jrpacman.o $(OBJ)/drivers/pengo.o

$(OBJ)/drivers/cclimber.o: src/vidhrdw/cclimber.c src/sndhrdw/cclimber.c src/drivers/cclimber.c
$(OBJ)/drivers/seicross.o: src/vidhrdw/seicross.c src/drivers/seicross.c
$(OBJ)/drivers/wiping.o: src/vidhrdw/wiping.c src/sndhrdw/wiping.c src/drivers/wiping.c
$(OBJ)/drivers/cop01.o: src/vidhrdw/cop01.c src/drivers/cop01.c
$(OBJ)/drivers/terracre.o: src/vidhrdw/terracre.c src/drivers/terracre.c
$(OBJ)/drivers/galivan.o: src/vidhrdw/galivan.c src/drivers/galivan.c
$(OBJ)/drivers/armedf.o: src/vidhrdw/armedf.c src/drivers/armedf.c
OBJ_NICHIBUT = $(OBJ)/drivers/cclimber.o $(OBJ)/drivers/yamato.o $(OBJ)/drivers/seicross.o $(OBJ)/drivers/wiping.o \
    $(OBJ)/drivers/cop01.o $(OBJ)/drivers/terracre.o $(OBJ)/drivers/galivan.o $(OBJ)/drivers/armedf.o

$(OBJ)/drivers/phoenix.o: src/vidhrdw/phoenix.c src/sndhrdw/phoenix.c src/drivers/phoenix.c
$(OBJ)/drivers/naughtyb.o: src/vidhrdw/naughtyb.c src/drivers/naughtyb.c
OBJ_PHOENIX = $(OBJ)/drivers/safarir.o $(OBJ)/drivers/phoenix.o $(OBJ)/sndhrdw/pleiads.o $(OBJ)/drivers/naughtyb.o

$(OBJ)/drivers/geebee.o: src/machine/geebee.c src/vidhrdw/geebee.c src/sndhrdw/geebee.c src/drivers/geebee.c
$(OBJ)/drivers/warpwarp.o: src/vidhrdw/warpwarp.c src/sndhrdw/warpwarp.c src/drivers/warpwarp.c
$(OBJ)/drivers/tankbatt.o: src/vidhrdw/tankbatt.c src/drivers/tankbatt.c
$(OBJ)/drivers/galaxian.o: src/vidhrdw/galaxian.c src/sndhrdw/galaxian.c src/drivers/galaxian.c
$(OBJ)/drivers/rallyx.o: src/vidhrdw/rallyx.c src/drivers/rallyx.c
$(OBJ)/drivers/bosco.o:	src/machine/bosco.c src/sndhrdw/bosco.c src/vidhrdw/bosco.c src/drivers/bosco.c
$(OBJ)/drivers/galaga.o: src/machine/galaga.c src/vidhrdw/galaga.c src/drivers/galaga.c
$(OBJ)/drivers/digdug.o: src/machine/digdug.c src/vidhrdw/digdug.c src/drivers/digdug.c
$(OBJ)/drivers/xevious.o: src/vidhrdw/xevious.c src/machine/xevious.c src/drivers/xevious.c
$(OBJ)/drivers/superpac.o: src/machine/superpac.c src/vidhrdw/superpac.c src/drivers/superpac.c
$(OBJ)/drivers/phozon.o: src/machine/phozon.c src/vidhrdw/phozon.c src/drivers/phozon.c
$(OBJ)/drivers/mappy.o:	src/machine/mappy.c src/vidhrdw/mappy.c src/drivers/mappy.c
$(OBJ)/drivers/grobda.o: src/machine/grobda.c src/vidhrdw/grobda.c src/drivers/grobda.c
$(OBJ)/drivers/gaplus.o: src/machine/gaplus.c src/vidhrdw/gaplus.c src/drivers/gaplus.c
$(OBJ)/drivers/toypop.o: src/machine/toypop.c src/vidhrdw/toypop.c src/drivers/toypop.c
$(OBJ)/drivers/polepos.o: src/machine/polepos.c src/vidhrdw/polepos.c src/sndhrdw/polepos.c src/drivers/polepos.c
$(OBJ)/drivers/pacland.o: src/vidhrdw/pacland.c src/drivers/pacland.c
$(OBJ)/drivers/skykid.o: src/vidhrdw/skykid.c src/drivers/skykid.c
$(OBJ)/drivers/baraduke.o: src/vidhrdw/baraduke.c src/drivers/baraduke.c
$(OBJ)/drivers/namcos86.o: src/vidhrdw/namcos86.c src/drivers/namcos86.c
$(OBJ)/drivers/namcos1.o: src/machine/namcos1.c src/vidhrdw/namcos1.c src/drivers/namcos1.c
$(OBJ)/drivers/namcos2.o: src/machine/namcos2.c src/vidhrdw/namcos2.c src/drivers/namcos2.c
OBJ_NAMCO = $(OBJ)/drivers/geebee.o $(OBJ)/drivers/warpwarp.o $(OBJ)/drivers/tankbatt.o $(OBJ)/drivers/galaxian.o \
	$(OBJ)/drivers/rallyx.o $(OBJ)/drivers/locomotn.o $(OBJ)/drivers/bosco.o $(OBJ)/drivers/galaga.o $(OBJ)/drivers/digdug.o \
	$(OBJ)/drivers/xevious.o $(OBJ)/drivers/superpac.o $(OBJ)/drivers/phozon.o $(OBJ)/drivers/mappy.o $(OBJ)/drivers/grobda.o \
	$(OBJ)/drivers/gaplus.o $(OBJ)/drivers/toypop.o $(OBJ)/drivers/polepos.o $(OBJ)/drivers/pacland.o $(OBJ)/drivers/skykid.o \
	$(OBJ)/drivers/baraduke.o $(OBJ)/drivers/namcos86.o $(OBJ)/drivers/namcos1.o $(OBJ)/drivers/namcos2.o

$(OBJ)/drivers/cosmic.o: src/vidhrdw/cosmic.c src/drivers/cosmic.c
$(OBJ)/drivers/cheekyms.o: src/vidhrdw/cheekyms.c src/drivers/cheekyms.c
$(OBJ)/drivers/ladybug.o: src/vidhrdw/ladybug.c src/drivers/ladybug.c
$(OBJ)/drivers/mrdo.o: src/vidhrdw/mrdo.c src/drivers/mrdo.c
$(OBJ)/drivers/docastle.o: src/machine/docastle.c src/vidhrdw/docastle.c src/drivers/docastle.c
OBJ_UNIVERS = $(OBJ)/drivers/cosmic.o $(OBJ)/drivers/cheekyms.o $(OBJ)/drivers/ladybug.o $(OBJ)/drivers/mrdo.o $(OBJ)/drivers/docastle.o

$(OBJ)/drivers/dkong.o: src/vidhrdw/dkong.c src/sndhrdw/dkong.c src/drivers/dkong.c
$(OBJ)/drivers/mario.o: src/vidhrdw/mario.c src/sndhrdw/mario.c src/drivers/mario.c
$(OBJ)/drivers/popeye.o: src/vidhrdw/popeye.c src/drivers/popeye.c
$(OBJ)/drivers/punchout.o: src/vidhrdw/punchout.c src/drivers/punchout.c
OBJ_NINTENDO = $(OBJ)/drivers/dkong.o $(OBJ)/drivers/mario.o $(OBJ)/drivers/popeye.o $(OBJ)/drivers/punchout.o

$(OBJ)/drivers/8080bw.o: src/machine/8080bw.c src/machine/74123.c src/vidhrdw/8080bw.c src/sndhrdw/8080bw.c src/drivers/8080bw.c
$(OBJ)/drivers/m79amb.o: src/vidhrdw/m79amb.c src/drivers/m79amb.c
$(OBJ)/drivers/z80bw.o: src/sndhrdw/z80bw.c src/drivers/z80bw.c
OBJ_MIDW8080 = $(OBJ)/drivers/8080bw.o $(OBJ)/drivers/m79amb.o $(OBJ)/drivers/z80bw.o

$(OBJ)/drivers/lazercmd.o: src/drivers/lazercmd.c src/vidhrdw/lazercmd.c
$(OBJ)/drivers/meadows.o: src/drivers/meadows.c src/sndhrdw/meadows.c src/vidhrdw/meadows.c
OBJ_MEADOWS = $(OBJ)/drivers/lazercmd.o $(OBJ)/drivers/meadows.o

$(OBJ)/drivers/astrocde.o: src/machine/astrocde.c src/vidhrdw/astrocde.c src/sndhrdw/astrocde.c src/drivers/astrocde.c
$(OBJ)/drivers/mcr68.o: src/vidhrdw/mcr68.c src/drivers/mcr68.c
$(OBJ)/drivers/balsente.o: src/vidhrdw/balsente.c src/drivers/balsente.c
OBJ_MIDWAY = $(OBJ)/drivers/astrocde.o $(OBJ)/sndhrdw/gorf.o $(OBJ)/machine/mcr.o $(OBJ)/sndhrdw/mcr.o $(OBJ)/vidhrdw/mcr12.o $(OBJ)/vidhrdw/mcr3.o \
	$(OBJ)/drivers/mcr1.o $(OBJ)/drivers/mcr2.o $(OBJ)/drivers/mcr3.o $(OBJ)/drivers/mcr68.o $(OBJ)/drivers/balsente.o

$(OBJ)/drivers/skychut.o: src/vidhrdw/skychut.c src/drivers/skychut.c
$(OBJ)/drivers/mpatrol.o: src/vidhrdw/mpatrol.c src/drivers/mpatrol.c
$(OBJ)/drivers/troangel.o: src/vidhrdw/troangel.c src/drivers/troangel.c
$(OBJ)/drivers/yard.o: src/vidhrdw/yard.c src/drivers/yard.c
$(OBJ)/drivers/travrusa.o: src/vidhrdw/travrusa.c src/drivers/travrusa.c
$(OBJ)/drivers/m62.o: src/vidhrdw/m62.c src/drivers/m62.c
$(OBJ)/drivers/vigilant.o: src/vidhrdw/vigilant.c src/drivers/vigilant.c
$(OBJ)/vidhrdw/m72.o: src/vidhrdw/m72.c src/sndhrdw/m72.c src/drivers/m72.c
$(OBJ)/drivers/shisen.o: src/vidhrdw/shisen.c src/drivers/shisen.c
$(OBJ)/drivers/m92.o: src/vidhrdw/m92.c src/drivers/m92.c
$(OBJ)/drivers/m107.o: src/vidhrdw/m107.c src/drivers/m107.c
OBJ_IREM = $(OBJ)/drivers/skychut.o $(OBJ)/drivers/olibochu.o $(OBJ)/sndhrdw/irem.o $(OBJ)/drivers/mpatrol.o $(OBJ)/drivers/troangel.o \
	$(OBJ)/drivers/yard.o $(OBJ)/drivers/travrusa.o $(OBJ)/drivers/m62.o $(OBJ)/drivers/vigilant.o $(OBJ)/drivers/m72.o $(OBJ)/drivers/shisen.o \
	$(OBJ)/drivers/m92.o $(OBJ)/drivers/m97.o $(OBJ)/drivers/m107.o

$(OBJ)/drivers/gottlieb.o: src/vidhrdw/gottlieb.c src/sndhrdw/gottlieb.c src/drivers/gottlieb.c
OBJ_GOTTLIEB = $(OBJ)/drivers/gottlieb.o

$(OBJ)/drivers/crbaloon.o: src/vidhrdw/crbaloon.c src/drivers/crbaloon.c
$(OBJ)/drivers/qix.o: src/machine/qix.c src/vidhrdw/qix.c src/drivers/qix.c
$(OBJ)/drivers/taitosj.o: src/machine/taitosj.c src/vidhrdw/taitosj.c src/drivers/taitosj.c
$(OBJ)/drivers/bking2.o: src/vidhrdw/bking2.c src/drivers/bking2.c
$(OBJ)/drivers/gsword.o: src/vidhrdw/gsword.c src/machine/tait8741.c src/drivers/gsword.c
$(OBJ)/drivers/retofinv.o: src/vidhrdw/retofinv.c src/drivers/retofinv.c
$(OBJ)/drivers/tsamurai.o: src/vidhrdw/tsamurai.c src/drivers/tsamurai.c
$(OBJ)/drivers/flstory.o: src/machine/flstory.c src/vidhrdw/flstory.c src/drivers/flstory.c
$(OBJ)/drivers/gladiatr.o: src/vidhrdw/gladiatr.c src/drivers/gladiatr.c
$(OBJ)/drivers/lsasquad.o: src/machine/lsasquad.c src/vidhrdw/lsasquad.c src/drivers/lsasquad.c
$(OBJ)/drivers/bublbobl.o: src/machine/bublbobl.c src/vidhrdw/bublbobl.c src/drivers/bublbobl.c
$(OBJ)/drivers/mexico86.o: src/machine/mexico86.c src/vidhrdw/mexico86.c src/drivers/mexico86.c
$(OBJ)/drivers/rastan.o: src/vidhrdw/rastan.c src/sndhrdw/rastan.c src/drivers/rastan.c
$(OBJ)/drivers/rainbow.o: src/machine/rainbow.c src/drivers/rainbow.c
$(OBJ)/drivers/arkanoid.o: src/machine/arkanoid.c src/vidhrdw/arkanoid.c src/drivers/arkanoid.c
$(OBJ)/drivers/superqix.o: src/vidhrdw/superqix.c src/drivers/superqix.c
$(OBJ)/drivers/superman.o: src/vidhrdw/superman.c src/drivers/superman.c
$(OBJ)/drivers/minivadr.o: src/vidhrdw/minivadr.c src/drivers/minivadr.c
$(OBJ)/drivers/tnzs.o: src/machine/tnzs.c src/vidhrdw/tnzs.c src/drivers/tnzs.c
$(OBJ)/drivers/lkage.o: src/machine/lkage.c src/vidhrdw/lkage.c src/drivers/lkage.c
$(OBJ)/drivers/taito_l.o: src/vidhrdw/taito_l.c src/drivers/taito_l.c src/sndhrdw/taitosnd.c
$(OBJ)/drivers/taito_b.o: src/vidhrdw/taito_b.c src/drivers/taito_b.c
$(OBJ)/drivers/taito_f2.o: src/vidhrdw/taito_f2.c src/drivers/taito_f2.c
OBJ_TAITO = $(OBJ)/drivers/crbaloon.o $(OBJ)/drivers/qix.o $(OBJ)/drivers/taitosj.o $(OBJ)/drivers/bking2.o $(OBJ)/drivers/gsword.o \
    $(OBJ)/drivers/retofinv.o $(OBJ)/drivers/tsamurai.o $(OBJ)/drivers/flstory.o $(OBJ)/drivers/gladiatr.o $(OBJ)/drivers/lsasquad.o \
	$(OBJ)/drivers/bublbobl.o $(OBJ)/drivers/mexico86.o $(OBJ)/drivers/rastan.o $(OBJ)/drivers/rainbow.o $(OBJ)/drivers/arkanoid.o \
	$(OBJ)/drivers/superqix.o $(OBJ)/drivers/superman.o $(OBJ)/drivers/minivadr.o $(OBJ)/drivers/tnzs.o $(OBJ)/drivers/lkage.o \
	$(OBJ)/drivers/taito_l.o $(OBJ)/drivers/taito_b.o $(OBJ)/vidhrdw/taitoic.o $(OBJ)/drivers/taito_f2.o $(OBJ)/machine/cchip.o

$(OBJ)/drivers/slapfght.o: src/machine/slapfght.c src/vidhrdw/slapfght.c src/drivers/slapfght.c
$(OBJ)/drivers/twincobr.o: src/machine/twincobr.c src/vidhrdw/twincobr.c src/drivers/twincobr.c
$(OBJ)/drivers/toaplan1.o: src/machine/toaplan1.c src/vidhrdw/toaplan1.c src/drivers/toaplan1.c
$(OBJ)/drivers/snowbros.o: src/vidhrdw/snowbros.c src/drivers/snowbros.c
$(OBJ)/drivers/toaplan2.o: src/vidhrdw/toaplan2.c src/drivers/toaplan2.c
OBJ_TOAPLAN = $(OBJ)/drivers/slapfght.o $(OBJ)/drivers/twincobr.o $(OBJ)/drivers/wardner.o $(OBJ)/drivers/toaplan1.o \
    $(OBJ)/drivers/snowbros.o $(OBJ)/drivers/toaplan2.o

$(OBJ)/drivers/cave.o: src/vidhrdw/cave.c src/drivers/cave.c
OBJ_CAVE = $(OBJ)/drivers/cave.o

$(OBJ)/drivers/kyugo.o: src/vidhrdw/kyugo.c src/drivers/kyugo.c
OBJ_KYUGO = $(OBJ)/drivers/kyugo.o

$(OBJ)/drivers/williams.o: src/machine/williams.c src/vidhrdw/williams.c src/sndhrdw/williams.c src/drivers/williams.c
OBJ_WILLIAMS = $(OBJ)/drivers/williams.o

$(OBJ)/drivers/vulgus.o: src/vidhrdw/vulgus.c src/drivers/vulgus.c
$(OBJ)/drivers/sonson.o: src/vidhrdw/sonson.c src/drivers/sonson.c
$(OBJ)/drivers/higemaru.o: src/vidhrdw/higemaru.c src/drivers/higemaru.c
$(OBJ)/drivers/1942.o: src/vidhrdw/1942.c src/drivers/1942.c
$(OBJ)/drivers/exedexes.o: src/vidhrdw/exedexes.c src/drivers/exedexes.c
$(OBJ)/drivers/commando.o: src/vidhrdw/commando.c src/drivers/commando.c
$(OBJ)/drivers/gng.o: src/vidhrdw/gng.c src/drivers/gng.c
$(OBJ)/drivers/gunsmoke.o: src/vidhrdw/gunsmoke.c src/drivers/gunsmoke.c
$(OBJ)/drivers/srumbler.o: src/vidhrdw/srumbler.c src/drivers/srumbler.c
$(OBJ)/drivers/lwings.o: src/machine/lwings.c src/vidhrdw/lwings.c src/drivers/lwings.c
$(OBJ)/drivers/sidearms.o: src/vidhrdw/sidearms.c src/drivers/sidearms.c
$(OBJ)/drivers/bionicc.o: src/vidhrdw/bionicc.c src/drivers/bionicc.c
$(OBJ)/drivers/1943.o: src/vidhrdw/1943.c src/drivers/1943.c
$(OBJ)/drivers/blktiger.o: src/vidhrdw/blktiger.c src/drivers/blktiger.c
$(OBJ)/drivers/tigeroad.o: src/vidhrdw/tigeroad.c src/drivers/tigeroad.c
$(OBJ)/drivers/lastduel.o: src/vidhrdw/lastduel.c src/drivers/lastduel.c
$(OBJ)/drivers/sf1.o: src/vidhrdw/sf1.c src/drivers/sf1.c
$(OBJ)/drivers/mitchell.o: src/vidhrdw/mitchell.c src/drivers/mitchell.c
$(OBJ)/drivers/cbasebal.o: src/vidhrdw/cbasebal.c src/drivers/cbasebal.c
$(OBJ)/drivers/cps1.o: src/vidhrdw/cps1.c src/drivers/cps1.c
OBJ_CAPCOM = $(OBJ)/drivers/vulgus.o $(OBJ)/drivers/sonson.o $(OBJ)/drivers/higemaru.o $(OBJ)/drivers/1942.o $(OBJ)/drivers/exedexes.o \
	$(OBJ)/drivers/commando.o $(OBJ)/drivers/gng.o $(OBJ)/drivers/gunsmoke.o $(OBJ)/drivers/srumbler.o $(OBJ)/drivers/lwings.o \
	$(OBJ)/drivers/sidearms.o $(OBJ)/drivers/bionicc.o $(OBJ)/drivers/1943.o $(OBJ)/drivers/blktiger.o $(OBJ)/drivers/tigeroad.o \
	$(OBJ)/drivers/lastduel.o $(OBJ)/drivers/sf1.o $(OBJ)/machine/kabuki.o $(OBJ)/drivers/mitchell.o $(OBJ)/drivers/cbasebal.o \
	$(OBJ)/drivers/cps1.o $(OBJ)/drivers/zn.o

$(OBJ)/drivers/capbowl.o: src/machine/capbowl.c src/vidhrdw/capbowl.c src/vidhrdw/tms34061.c src/drivers/capbowl.c
OBJ_CAPBOWL = $(OBJ)/drivers/capbowl.o

$(OBJ)/drivers/blockade.o: src/vidhrdw/blockade.c src/drivers/blockade.c
OBJ_GREMLIN = $(OBJ)/drivers/blockade.o

$(OBJ)/drivers/vicdual.o: src/vidhrdw/vicdual.c src/drivers/vicdual.c
OBJ_VICDUAL = $(OBJ)/sndhrdw/carnival.o $(OBJ)/sndhrdw/depthch.o $(OBJ)/sndhrdw/invinco.o $(OBJ)/sndhrdw/pulsar.o $(OBJ)/drivers/vicdual.o

$(OBJ)/drivers/sega.o: src/vidhrdw/sega.c src/sndhrdw/sega.c src/machine/sega.c src/drivers/sega.c
$(OBJ)/drivers/segar.o: src/vidhrdw/segar.c src/sndhrdw/segar.c src/machine/segar.c src/drivers/segar.c
$(OBJ)/drivers/zaxxon.o: src/vidhrdw/zaxxon.c src/sndhrdw/zaxxon.c src/drivers/zaxxon.c
$(OBJ)/drivers/turbo.o: src/machine/turbo.c src/vidhrdw/turbo.c src/drivers/turbo.c
$(OBJ)/drivers/suprloco.o: src/vidhrdw/suprloco.c src/drivers/suprloco.c
$(OBJ)/drivers/appoooh.o: src/vidhrdw/appoooh.c src/drivers/appoooh.c
$(OBJ)/drivers/bankp.o: src/vidhrdw/bankp.c src/drivers/bankp.c
$(OBJ)/drivers/dotrikun.o: src/vidhrdw/dotrikun.c src/drivers/dotrikun.c
$(OBJ)/drivers/system1.o: src/vidhrdw/system1.c src/drivers/system1.c
$(OBJ)/drivers/system16.o: src/machine/system16.c src/vidhrdw/system16.c src/sndhrdw/system16.c src/drivers/system16.c
OBJ_SEGA = $(OBJ)/machine/segacrpt.o $(OBJ)/drivers/sega.o $(OBJ)/drivers/segar.o $(OBJ)/drivers/zaxxon.o $(OBJ)/drivers/congo.o \
	$(OBJ)/drivers/turbo.o $(OBJ)/drivers/kopunch.o $(OBJ)/drivers/suprloco.o $(OBJ)/drivers/appoooh.o $(OBJ)/drivers/bankp.o \
	$(OBJ)/drivers/dotrikun.o $(OBJ)/drivers/system1.o $(OBJ)/drivers/system16.o

$(OBJ)/drivers/deniam.o: src/vidhrdw/deniam.c src/drivers/deniam.c
OBJ_DENIAM = $(OBJ)/drivers/deniam.o

$(OBJ)/drivers/btime.o: src/machine/btime.c src/vidhrdw/btime.c src/drivers/btime.c
$(OBJ)/drivers/astrof.o: src/vidhrdw/astrof.c src/sndhrdw/astrof.c src/drivers/astrof.c
$(OBJ)/drivers/kchamp.o: src/vidhrdw/kchamp.c src/drivers/kchamp.c
$(OBJ)/drivers/firetrap.o: src/vidhrdw/firetrap.c src/drivers/firetrap.c
$(OBJ)/drivers/brkthru.o: src/vidhrdw/brkthru.c src/drivers/brkthru.c
$(OBJ)/drivers/shootout.o: src/vidhrdw/shootout.c src/drivers/shootout.c
$(OBJ)/drivers/sidepckt.o: src/vidhrdw/sidepckt.c src/drivers/sidepckt.c
$(OBJ)/drivers/exprraid.o: src/vidhrdw/exprraid.c src/drivers/exprraid.c
$(OBJ)/drivers/pcktgal.o: src/vidhrdw/pcktgal.c src/drivers/pcktgal.c
$(OBJ)/drivers/battlera.o: src/vidhrdw/battlera.c src/drivers/battlera.c
$(OBJ)/drivers/actfancr.o: src/vidhrdw/actfancr.c src/drivers/actfancr.c
$(OBJ)/drivers/dec8.o: src/vidhrdw/dec8.c src/drivers/dec8.c
$(OBJ)/drivers/karnov.o: src/vidhrdw/karnov.c src/drivers/karnov.c
$(OBJ)/drivers/dec0.o: src/machine/dec0.c src/vidhrdw/dec0.c src/drivers/dec0.c
$(OBJ)/drivers/stadhero.o: src/vidhrdw/stadhero.c src/drivers/stadhero.c
$(OBJ)/drivers/madmotor.o: src/vidhrdw/madmotor.c src/drivers/madmotor.c
$(OBJ)/drivers/vaportra.o: src/vidhrdw/vaportra.c src/drivers/vaportra.c
$(OBJ)/drivers/cbuster.o: src/vidhrdw/cbuster.c src/drivers/cbuster.c
$(OBJ)/drivers/darkseal.o: src/vidhrdw/darkseal.c src/drivers/darkseal.c
$(OBJ)/drivers/supbtime.o: src/vidhrdw/supbtime.c src/drivers/supbtime.c
$(OBJ)/drivers/cninja.o: src/vidhrdw/cninja.c src/drivers/cninja.c
$(OBJ)/drivers/tumblep.o: src/vidhrdw/tumblep.c src/drivers/tumblep.c
$(OBJ)/drivers/funkyjet.o: src/vidhrdw/funkyjet.c src/drivers/funkyjet.c
OBJ_DATAEAST = $(OBJ)/drivers/btime.o $(OBJ)/drivers/astrof.o $(OBJ)/drivers/kchamp.o $(OBJ)/drivers/firetrap.o $(OBJ)/drivers/brkthru.o \
	$(OBJ)/drivers/shootout.o $(OBJ)/drivers/sidepckt.o $(OBJ)/drivers/exprraid.o $(OBJ)/drivers/pcktgal.o $(OBJ)/drivers/battlera.o \
	$(OBJ)/drivers/actfancr.o $(OBJ)/drivers/dec8.o $(OBJ)/drivers/karnov.o $(OBJ)/drivers/dec0.o $(OBJ)/drivers/stadhero.o \
	$(OBJ)/drivers/madmotor.o $(OBJ)/drivers/vaportra.o $(OBJ)/drivers/cbuster.o $(OBJ)/drivers/darkseal.o $(OBJ)/drivers/supbtime.o \
	$(OBJ)/drivers/cninja.o $(OBJ)/drivers/tumblep.o $(OBJ)/drivers/funkyjet.o

$(OBJ)/drivers/senjyo.o: src/sndhrdw/senjyo.c src/vidhrdw/senjyo.c src/drivers/senjyo.c
$(OBJ)/drivers/bombjack.o: src/vidhrdw/bombjack.c src/drivers/bombjack.c
$(OBJ)/drivers/pbaction.o: src/vidhrdw/pbaction.c src/drivers/pbaction.c
$(OBJ)/drivers/tehkanwc.o: src/vidhrdw/tehkanwc.c src/drivers/tehkanwc.c
$(OBJ)/drivers/solomon.o: src/vidhrdw/solomon.c src/drivers/solomon.c
$(OBJ)/drivers/tecmo.o: src/vidhrdw/tecmo.c src/drivers/tecmo.c
$(OBJ)/drivers/gaiden.o: src/vidhrdw/gaiden.c src/drivers/gaiden.c
$(OBJ)/drivers/wc90.o: src/vidhrdw/wc90.c src/drivers/wc90.c
$(OBJ)/drivers/wc90b.o: src/vidhrdw/wc90b.c src/drivers/wc90b.c
$(OBJ)/drivers/tecmo16.o: src/vidhrdw/tecmo16.c src/drivers/tecmo16.c
OBJ_TEHKAN = $(OBJ)/drivers/senjyo.o $(OBJ)/drivers/bombjack.o $(OBJ)/drivers/pbaction.o $(OBJ)/drivers/tehkanwc.o $(OBJ)/drivers/solomon.o \
	$(OBJ)/drivers/tecmo.o $(OBJ)/drivers/gaiden.o $(OBJ)/drivers/wc90.o $(OBJ)/drivers/wc90b.o $(OBJ)/drivers/tecmo16.o

$(OBJ)/drivers/scramble.o: src/machine/scramble.c src/sndhrdw/scramble.c src/drivers/scramble.c
$(OBJ)/drivers/frogger.o: src/vidhrdw/frogger.c src/sndhrdw/frogger.c src/drivers/frogger.c
$(OBJ)/drivers/amidar.o: src/vidhrdw/amidar.c src/drivers/amidar.c
$(OBJ)/drivers/fastfred.o: src/vidhrdw/fastfred.c src/drivers/fastfred.c
$(OBJ)/drivers/tutankhm.o: src/vidhrdw/tutankhm.c src/drivers/tutankhm.c
$(OBJ)/drivers/pooyan.o: src/vidhrdw/pooyan.c src/drivers/pooyan.c
$(OBJ)/drivers/timeplt.o: src/sndhrdw/timeplt.c src/vidhrdw/timeplt.c src/drivers/timeplt.c
$(OBJ)/drivers/megazone.o: src/vidhrdw/megazone.c src/drivers/megazone.c
$(OBJ)/drivers/pandoras.o: src/vidhrdw/pandoras.c src/drivers/pandoras.c
$(OBJ)/drivers/gyruss.o: src/sndhrdw/gyruss.c src/vidhrdw/gyruss.c src/drivers/gyruss.c
$(OBJ)/drivers/trackfld.o: src/vidhrdw/trackfld.c src/sndhrdw/trackfld.c src/drivers/trackfld.c
$(OBJ)/drivers/rocnrope.o: src/vidhrdw/rocnrope.c src/drivers/rocnrope.c
$(OBJ)/drivers/circusc.o: src/vidhrdw/circusc.c src/drivers/circusc.c
$(OBJ)/drivers/tp84.o: src/vidhrdw/tp84.c src/drivers/tp84.c
$(OBJ)/drivers/hyperspt.o: src/vidhrdw/hyperspt.c src/drivers/hyperspt.c
$(OBJ)/drivers/sbasketb.o: src/vidhrdw/sbasketb.c src/drivers/sbasketb.c
$(OBJ)/drivers/mikie.o: src/vidhrdw/mikie.c src/drivers/mikie.c
$(OBJ)/drivers/yiear.o: src/vidhrdw/yiear.c src/drivers/yiear.c
$(OBJ)/drivers/shaolins.o: src/vidhrdw/shaolins.c src/drivers/shaolins.c
$(OBJ)/drivers/pingpong.o: src/vidhrdw/pingpong.c src/drivers/pingpong.c
$(OBJ)/drivers/gberet.o: src/vidhrdw/gberet.c src/drivers/gberet.c
$(OBJ)/drivers/jailbrek.o: src/vidhrdw/jailbrek.c src/drivers/jailbrek.c
$(OBJ)/drivers/finalizr.o: src/vidhrdw/finalizr.c src/drivers/finalizr.c
$(OBJ)/drivers/ironhors.o: src/vidhrdw/ironhors.c src/drivers/ironhors.c
$(OBJ)/drivers/jackal.o: src/machine/jackal.c src/vidhrdw/jackal.c src/drivers/jackal.c
$(OBJ)/drivers/ddrible.o: src/machine/ddrible.c src/vidhrdw/ddrible.c src/drivers/ddrible.c
$(OBJ)/drivers/contra.o: src/vidhrdw/contra.c src/drivers/contra.c
$(OBJ)/drivers/combatsc.o: src/vidhrdw/combatsc.c src/drivers/combatsc.c
$(OBJ)/drivers/hcastle.o: src/vidhrdw/hcastle.c src/drivers/hcastle.c
$(OBJ)/drivers/nemesis.o: src/vidhrdw/nemesis.c src/drivers/nemesis.c
$(OBJ)/drivers/rockrage.o: src/vidhrdw/rockrage.c src/drivers/rockrage.c
$(OBJ)/drivers/flkatck.o: src/vidhrdw/flkatck.c src/drivers/flkatck.c
$(OBJ)/drivers/fastlane.o: src/vidhrdw/fastlane.c src/drivers/fastlane.c
$(OBJ)/drivers/labyrunr.o: src/vidhrdw/labyrunr.c src/drivers/labyrunr.c
$(OBJ)/drivers/battlnts.o: src/vidhrdw/battlnts.c src/drivers/battlnts.c
$(OBJ)/drivers/bladestl.o: src/vidhrdw/bladestl.c src/drivers/bladestl.c
$(OBJ)/drivers/ajax.o: src/machine/ajax.c src/vidhrdw/ajax.c src/drivers/ajax.c
$(OBJ)/drivers/thunderx.o: src/vidhrdw/thunderx.c src/drivers/thunderx.c
$(OBJ)/drivers/mainevt.o: src/vidhrdw/mainevt.c src/drivers/mainevt.c
$(OBJ)/drivers/88games.o: src/vidhrdw/88games.c src/drivers/88games.c
$(OBJ)/drivers/gbusters.o: src/vidhrdw/gbusters.c src/drivers/gbusters.c
$(OBJ)/drivers/crimfght.o: src/vidhrdw/crimfght.c src/drivers/crimfght.c
$(OBJ)/drivers/spy.o: src/vidhrdw/spy.c src/drivers/spy.c
$(OBJ)/drivers/bottom9.o: src/vidhrdw/bottom9.c src/drivers/bottom9.c
$(OBJ)/drivers/blockhl.o: src/vidhrdw/blockhl.c src/drivers/blockhl.c
$(OBJ)/drivers/aliens.o: src/vidhrdw/aliens.c src/drivers/aliens.c
$(OBJ)/drivers/surpratk.o: src/vidhrdw/surpratk.c src/drivers/surpratk.c
$(OBJ)/drivers/parodius.o: src/vidhrdw/parodius.c src/drivers/parodius.c
$(OBJ)/drivers/rollerg.o: src/vidhrdw/rollerg.c src/drivers/rollerg.c
$(OBJ)/drivers/xexex.o: src/vidhrdw/xexex.c src/drivers/xexex.c
$(OBJ)/drivers/simpsons.o: src/machine/simpsons.c src/vidhrdw/simpsons.c src/drivers/simpsons.c
$(OBJ)/drivers/vendetta.o: src/vidhrdw/vendetta.c src/drivers/vendetta.c
$(OBJ)/drivers/twin16.o: src/vidhrdw/twin16.c src/drivers/twin16.c
$(OBJ)/drivers/gradius3.o: src/vidhrdw/gradius3.c src/drivers/gradius3.c
$(OBJ)/drivers/tmnt.o: src/vidhrdw/tmnt.c src/drivers/tmnt.c
$(OBJ)/drivers/xmen.o: src/vidhrdw/xmen.c src/drivers/xmen.c
$(OBJ)/drivers/wecleman.o: src/vidhrdw/wecleman.c src/drivers/wecleman.c
$(OBJ)/drivers/chqflag.o: src/vidhrdw/chqflag.c src/drivers/chqflag.c
$(OBJ)/drivers/ultraman.o: src/vidhrdw/ultraman.c src/drivers/ultraman.c
OBJ_KONAMI = $(OBJ)/drivers/scramble.o $(OBJ)/drivers/frogger.o $(OBJ)/drivers/scobra.o $(OBJ)/drivers/amidar.o $(OBJ)/drivers/fastfred.o \
	$(OBJ)/drivers/tutankhm.o $(OBJ)/drivers/junofrst.o $(OBJ)/drivers/pooyan.o $(OBJ)/drivers/timeplt.o $(OBJ)/drivers/megazone.o \
	$(OBJ)/drivers/pandoras.o $(OBJ)/drivers/gyruss.o $(OBJ)/machine/konami.o $(OBJ)/drivers/trackfld.o $(OBJ)/drivers/rocnrope.o \
	$(OBJ)/drivers/circusc.o $(OBJ)/drivers/tp84.o $(OBJ)/drivers/hyperspt.o $(OBJ)/drivers/sbasketb.o $(OBJ)/drivers/mikie.o \
	$(OBJ)/drivers/yiear.o $(OBJ)/drivers/shaolins.o $(OBJ)/drivers/pingpong.o $(OBJ)/drivers/gberet.o $(OBJ)/drivers/jailbrek.o \
	$(OBJ)/drivers/finalizr.o $(OBJ)/drivers/ironhors.o $(OBJ)/drivers/jackal.o $(OBJ)/drivers/ddrible.o $(OBJ)/drivers/contra.o \
	$(OBJ)/drivers/combatsc.o $(OBJ)/drivers/hcastle.o $(OBJ)/drivers/nemesis.o $(OBJ)/vidhrdw/konamiic.o $(OBJ)/drivers/rockrage.o \
	$(OBJ)/drivers/flkatck.o $(OBJ)/drivers/fastlane.o $(OBJ)/drivers/labyrunr.o $(OBJ)/drivers/battlnts.o $(OBJ)/drivers/bladestl.o \
	$(OBJ)/drivers/ajax.o $(OBJ)/drivers/thunderx.o $(OBJ)/drivers/mainevt.o $(OBJ)/drivers/88games.o $(OBJ)/drivers/gbusters.o \
	$(OBJ)/drivers/crimfght.o $(OBJ)/drivers/spy.o $(OBJ)/drivers/bottom9.o $(OBJ)/drivers/blockhl.o $(OBJ)/drivers/aliens.o \
	$(OBJ)/drivers/surpratk.o $(OBJ)/drivers/parodius.o $(OBJ)/drivers/rollerg.o $(OBJ)/drivers/xexex.o $(OBJ)/drivers/simpsons.o \
	$(OBJ)/drivers/vendetta.o $(OBJ)/drivers/twin16.o $(OBJ)/drivers/gradius3.o $(OBJ)/drivers/tmnt.o $(OBJ)/drivers/xmen.o \
	$(OBJ)/drivers/wecleman.o $(OBJ)/drivers/chqflag.o $(OBJ)/drivers/ultraman.o

$(OBJ)/drivers/exidy.o: src/sndhrdw/targ.c src/vidhrdw/exidy.c src/sndhrdw/exidy.c src/drivers/exidy.c
$(OBJ)/drivers/circus.o: src/vidhrdw/circus.c src/drivers/circus.c
$(OBJ)/drivers/starfire.o: src/vidhrdw/starfire.c src/drivers/starfire.c
$(OBJ)/drivers/victory.o: src/vidhrdw/victory.c src/drivers/victory.c
$(OBJ)/drivers/exidy440.o: src/sndhrdw/exidy440.c src/vidhrdw/exidy440.c src/drivers/exidy440.c
OBJ_EXIDY = $(OBJ)/drivers/exidy.o $(OBJ)/drivers/circus.o $(OBJ)/drivers/starfire.o $(OBJ)/drivers/victory.o $(OBJ)/drivers/exidy440.o

$(OBJ)/drivers/asteroid.o: src/machine/asteroid.c src/sndhrdw/asteroid.c src/drivers/asteroid.c
$(OBJ)/drivers/bzone.o: src/sndhrdw/bzone.c src/drivers/bzone.c
$(OBJ)/drivers/starwars.o: src/machine/starwars.c src/machine/swmathbx.c src/sndhrdw/starwars.c src/drivers/starwars.c
$(OBJ)/drivers/mhavoc.o: src/machine/mhavoc.c src/drivers/mhavoc.c
$(OBJ)/drivers/quantum.o: src/machine/quantum.c src/drivers/quantum.c
$(OBJ)/drivers/atarifb.o: src/machine/atarifb.c src/vidhrdw/atarifb.c src/drivers/atarifb.c
$(OBJ)/drivers/sprint2.o: src/machine/sprint2.c src/vidhrdw/sprint2.c src/drivers/sprint2.c
$(OBJ)/drivers/sbrkout.o: src/machine/sbrkout.c src/vidhrdw/sbrkout.c src/drivers/sbrkout.c
$(OBJ)/drivers/dominos.o: src/machine/dominos.c src/vidhrdw/dominos.c src/drivers/dominos.c
$(OBJ)/drivers/nitedrvr.o: src/vidhrdw/nitedrvr.c src/machine/nitedrvr.c src/drivers/nitedrvr.c
$(OBJ)/drivers/bsktball.o: src/vidhrdw/bsktball.c src/machine/bsktball.c src/drivers/bsktball.c
$(OBJ)/drivers/copsnrob.o: src/vidhrdw/copsnrob.c src/machine/copsnrob.c src/drivers/copsnrob.c
$(OBJ)/drivers/avalnche.o: src/machine/avalnche.c src/vidhrdw/avalnche.c src/drivers/avalnche.c
$(OBJ)/drivers/subs.o: src/machine/subs.c src/vidhrdw/subs.c src/drivers/subs.c
$(OBJ)/drivers/canyon.o: src/vidhrdw/canyon.c src/drivers/canyon.c
$(OBJ)/drivers/skydiver.o: src/vidhrdw/skydiver.c src/drivers/skydiver.c
$(OBJ)/drivers/warlord.o: src/vidhrdw/warlord.c src/drivers/warlord.c
$(OBJ)/drivers/centiped.o: src/vidhrdw/centiped.c src/drivers/centiped.c
$(OBJ)/drivers/milliped.o: src/vidhrdw/milliped.c src/drivers/milliped.c
$(OBJ)/drivers/qwakprot.o: src/vidhrdw/qwakprot.c src/drivers/qwakprot.c
$(OBJ)/drivers/kangaroo.o: src/vidhrdw/kangaroo.c src/drivers/kangaroo.c
$(OBJ)/drivers/arabian.o: src/vidhrdw/arabian.c src/drivers/arabian.c
$(OBJ)/drivers/missile.o: src/machine/missile.c src/vidhrdw/missile.c src/drivers/missile.c
$(OBJ)/drivers/foodf.o: src/machine/foodf.c src/vidhrdw/foodf.c src/drivers/foodf.c
$(OBJ)/drivers/liberatr.o: src/vidhrdw/liberatr.c src/drivers/liberatr.c
$(OBJ)/drivers/ccastles.o: src/vidhrdw/ccastles.c src/drivers/ccastles.c
$(OBJ)/drivers/cloak.o: src/vidhrdw/cloak.c src/drivers/cloak.c
$(OBJ)/drivers/cloud9.o: src/vidhrdw/cloud9.c src/drivers/cloud9.c
$(OBJ)/drivers/jedi.o: src/machine/jedi.c src/vidhrdw/jedi.c src/sndhrdw/jedi.c src/drivers/jedi.c
$(OBJ)/drivers/atarisy1.o: src/vidhrdw/atarisy1.c src/drivers/atarisy1.c
$(OBJ)/drivers/atarisy2.o: src/vidhrdw/atarisy2.c src/drivers/atarisy2.c
$(OBJ)/drivers/gauntlet.o: src/vidhrdw/gauntlet.c src/drivers/gauntlet.c
$(OBJ)/drivers/atetris.o: src/vidhrdw/atetris.c src/drivers/atetris.c
$(OBJ)/drivers/toobin.o: src/vidhrdw/toobin.c src/drivers/toobin.c
$(OBJ)/drivers/vindictr.o: src/vidhrdw/vindictr.c src/drivers/vindictr.c
$(OBJ)/drivers/klax.o: src/vidhrdw/klax.c src/drivers/klax.c
$(OBJ)/drivers/blstroid.o: src/vidhrdw/blstroid.c src/drivers/blstroid.c
$(OBJ)/drivers/xybots.o: src/vidhrdw/xybots.c src/drivers/xybots.c
$(OBJ)/drivers/eprom.o: src/vidhrdw/eprom.c src/drivers/eprom.c
$(OBJ)/drivers/skullxbo.o: src/vidhrdw/skullxbo.c src/drivers/skullxbo.c
$(OBJ)/drivers/badlands.o: src/vidhrdw/badlands.c src/drivers/badlands.c
$(OBJ)/drivers/cyberbal.o: src/vidhrdw/cyberbal.c src/drivers/cyberbal.c
$(OBJ)/drivers/rampart.o: src/vidhrdw/rampart.c src/drivers/rampart.c
$(OBJ)/drivers/shuuz.o: src/vidhrdw/shuuz.c src/drivers/shuuz.c
$(OBJ)/drivers/hydra.o: src/vidhrdw/hydra.c src/drivers/hydra.c
$(OBJ)/drivers/thunderj.o: src/vidhrdw/thunderj.c src/drivers/thunderj.c
$(OBJ)/drivers/batman.o: src/vidhrdw/batman.c src/drivers/batman.c
$(OBJ)/drivers/relief.o: src/vidhrdw/relief.c src/drivers/relief.c
$(OBJ)/drivers/offtwall.o: src/vidhrdw/offtwall.c src/drivers/offtwall.c
$(OBJ)/drivers/arcadecl.o: src/vidhrdw/arcadecl.c src/drivers/arcadecl.c
$(OBJ)/drivers/firetrk.o: src/drivers/firetrk.c
OBJ_ATARI = $(OBJ)/machine/atari_vg.o $(OBJ)/drivers/asteroid.o $(OBJ)/vidhrdw/llander.o $(OBJ)/sndhrdw/llander.o \
    $(OBJ)/drivers/bwidow.o $(OBJ)/drivers/bzone.o $(OBJ)/sndhrdw/redbaron.o $(OBJ)/drivers/tempest.o \
	$(OBJ)/drivers/starwars.o $(OBJ)/drivers/mhavoc.o $(OBJ)/drivers/quantum.o $(OBJ)/drivers/atarifb.o $(OBJ)/drivers/sprint2.o \
	$(OBJ)/drivers/sbrkout.o $(OBJ)/drivers/dominos.o $(OBJ)/drivers/nitedrvr.o $(OBJ)/drivers/bsktball.o $(OBJ)/drivers/copsnrob.o \
	$(OBJ)/drivers/avalnche.o $(OBJ)/drivers/subs.o $(OBJ)/drivers/canyon.o $(OBJ)/drivers/skydiver.o $(OBJ)/drivers/warlord.o \
	$(OBJ)/drivers/centiped.o $(OBJ)/drivers/milliped.o $(OBJ)/drivers/qwakprot.o $(OBJ)/drivers/kangaroo.o $(OBJ)/drivers/arabian.o \
	$(OBJ)/drivers/missile.o $(OBJ)/drivers/foodf.o $(OBJ)/drivers/liberatr.o $(OBJ)/drivers/ccastles.o $(OBJ)/drivers/cloak.o \
	$(OBJ)/drivers/cloud9.o $(OBJ)/drivers/jedi.o $(OBJ)/machine/atarigen.o $(OBJ)/sndhrdw/atarijsa.o $(OBJ)/machine/slapstic.o \
	$(OBJ)/drivers/atarisy1.o $(OBJ)/drivers/atarisy2.o $(OBJ)/drivers/gauntlet.o $(OBJ)/drivers/atetris.o $(OBJ)/drivers/toobin.o \
	$(OBJ)/drivers/vindictr.o $(OBJ)/drivers/klax.o $(OBJ)/drivers/blstroid.o $(OBJ)/drivers/xybots.o $(OBJ)/drivers/eprom.o \
	$(OBJ)/drivers/skullxbo.o $(OBJ)/drivers/badlands.o $(OBJ)/drivers/cyberbal.o $(OBJ)/drivers/rampart.o $(OBJ)/drivers/shuuz.o \
	$(OBJ)/drivers/hydra.o $(OBJ)/drivers/thunderj.o $(OBJ)/drivers/batman.o $(OBJ)/drivers/relief.o $(OBJ)/drivers/offtwall.o \
	$(OBJ)/drivers/arcadecl.o $(OBJ)/drivers/firetrk.o

$(OBJ)/drivers/rockola.o: src/vidhrdw/rockola.c src/sndhrdw/rockola.c src/drivers/rockola.c
$(OBJ)/drivers/lasso.o: src/vidhrdw/lasso.c src/drivers/lasso.c
$(OBJ)/drivers/munchmo.o: src/vidhrdw/munchmo.c src/drivers/munchmo.c
$(OBJ)/drivers/marvins.o: src/vidhrdw/marvins.c src/drivers/marvins.c
$(OBJ)/drivers/snk.o: src/vidhrdw/snk.c src/drivers/snk.c
$(OBJ)/drivers/snk68.o: src/vidhrdw/snk68.c src/drivers/snk68.c
$(OBJ)/drivers/prehisle.o: src/vidhrdw/prehisle.c src/drivers/prehisle.c
OBJ_SNK = $(OBJ)/drivers/rockola.o $(OBJ)/drivers/lasso.o $(OBJ)/drivers/munchmo.o $(OBJ)/drivers/marvins.o $(OBJ)/drivers/hal21.o \
	$(OBJ)/drivers/snk.o $(OBJ)/drivers/snk68.o $(OBJ)/drivers/prehisle.o

$(OBJ)/drivers/alpha68k.o: src/vidhrdw/alpha68k.c src/drivers/alpha68k.c
$(OBJ)/drivers/champbas.o: src/vidhrdw/champbas.c src/drivers/champbas.c
$(OBJ)/drivers/exctsccr.o: src/machine/exctsccr.c src/vidhrdw/exctsccr.c src/drivers/exctsccr.c
OBJ_ALPHA = $(OBJ)/drivers/alpha68k.o $(OBJ)/drivers/champbas.o $(OBJ)/drivers/exctsccr.o

$(OBJ)/drivers/tagteam.o: src/vidhrdw/tagteam.c src/drivers/tagteam.c
$(OBJ)/drivers/ssozumo.o: src/vidhrdw/ssozumo.c src/drivers/ssozumo.c
$(OBJ)/drivers/mystston.o: src/vidhrdw/mystston.c src/drivers/mystston.c
$(OBJ)/drivers/bogeyman.o: src/vidhrdw/bogeyman.c src/drivers/bogeyman.c
$(OBJ)/drivers/matmania.o: src/machine/maniach.c src/vidhrdw/matmania.c src/drivers/matmania.c
$(OBJ)/drivers/renegade.o: src/vidhrdw/renegade.c src/drivers/renegade.c
$(OBJ)/drivers/xain.o: src/vidhrdw/xain.c src/drivers/xain.c
$(OBJ)/drivers/battlane.o: src/vidhrdw/battlane.c src/drivers/battlane.c
$(OBJ)/drivers/ddragon.o: src/vidhrdw/ddragon.c src/drivers/ddragon.c
$(OBJ)/drivers/ddragon3.o: src/vidhrdw/ddragon3.c src/drivers/ddragon3.c
$(OBJ)/drivers/blockout.o: src/vidhrdw/blockout.c src/drivers/blockout.c
OBJ_TECHNOS = $(OBJ)/drivers/scregg.o $(OBJ)/drivers/tagteam.o $(OBJ)/drivers/ssozumo.o $(OBJ)/drivers/mystston.o \
    $(OBJ)/drivers/bogeyman.o $(OBJ)/drivers/matmania.o $(OBJ)/drivers/renegade.o $(OBJ)/drivers/xain.o $(OBJ)/drivers/battlane.o \
    $(OBJ)/drivers/ddragon.o $(OBJ)/drivers/ddragon3.o $(OBJ)/drivers/blockout.o

$(OBJ)/drivers/suna8.o: src/vidhrdw/suna8.c src/drivers/suna8.c
OBJ_SUNA = $(OBJ)/drivers/suna8.o

$(OBJ)/drivers/berzerk.o: src/machine/berzerk.c src/vidhrdw/berzerk.c src/sndhrdw/berzerk.c src/drivers/berzerk.c
OBJ_BERZERK = $(OBJ)/drivers/berzerk.o

$(OBJ)/drivers/gameplan.o: src/vidhrdw/gameplan.c src/drivers/gameplan.c
OBJ_GAMEPLAN = $(OBJ)/drivers/gameplan.o

$(OBJ)/drivers/route16.o: src/vidhrdw/route16.c src/drivers/route16.c
$(OBJ)/drivers/ttmahjng.o: src/vidhrdw/ttmahjng.c src/drivers/ttmahjng.c
OBJ_STRATVOX = $(OBJ)/drivers/route16.o $(OBJ)/drivers/ttmahjng.o

$(OBJ)/drivers/zaccaria.o: src/vidhrdw/zaccaria.c src/drivers/zaccaria.c
OBJ_ZACCARIA = $(OBJ)/drivers/zaccaria.o

$(OBJ)/drivers/nova2001.o: src/vidhrdw/nova2001.c src/drivers/nova2001.c
$(OBJ)/drivers/pkunwar.o: src/vidhrdw/pkunwar.c src/drivers/pkunwar.c
$(OBJ)/drivers/ninjakd2.o: src/vidhrdw/ninjakd2.c src/drivers/ninjakd2.c
$(OBJ)/drivers/mnight.o: src/vidhrdw/mnight.c src/drivers/mnight.c
OBJ_UPL = $(OBJ)/drivers/nova2001.o $(OBJ)/drivers/pkunwar.o $(OBJ)/drivers/ninjakd2.o $(OBJ)/drivers/mnight.o

$(OBJ)/drivers/exterm.o: src/machine/exterm.c src/vidhrdw/exterm.c src/drivers/exterm.c
$(OBJ)/drivers/wmsyunit.o: src/machine/wmsyunit.c src/vidhrdw/wmsyunit.c src/drivers/wmsyunit.c
$(OBJ)/drivers/wmstunit.o: src/machine/wmstunit.c src/vidhrdw/wmstunit.c src/drivers/wmstunit.c
$(OBJ)/drivers/wmswolfu.o: src/machine/wmswolfu.c src/drivers/wmswolfu.c
OBJ_TMS = $(OBJ)/drivers/exterm.o $(OBJ)/drivers/wmsyunit.o $(OBJ)/drivers/wmstunit.o $(OBJ)/drivers/wmswolfu.o

$(OBJ)/drivers/jack.o: src/vidhrdw/jack.c src/drivers/jack.c
OBJ_CINEMAR = $(OBJ)/drivers/jack.o

$(OBJ)/drivers/cinemat.o: src/sndhrdw/cinemat.c src/drivers/cinemat.c
$(OBJ)/drivers/cchasm.o: src/machine/cchasm.c src/vidhrdw/cchasm.c src/sndhrdw/cchasm.c src/drivers/cchasm.c
OBJ_CINEMAV = $(OBJ)/drivers/cinemat.o $(OBJ)/drivers/cchasm.o

$(OBJ)/drivers/thepit.o: src/vidhrdw/thepit.c src/drivers/thepit.c
OBJ_THEPIT = $(OBJ)/drivers/thepit.o

$(OBJ)/drivers/bagman.o: src/machine/bagman.c src/vidhrdw/bagman.c src/drivers/bagman.c
OBJ_VALADON = $(OBJ)/drivers/bagman.o

$(OBJ)/drivers/wiz.o: src/vidhrdw/wiz.c src/drivers/wiz.c
$(OBJ)/drivers/stfight.o: src/machine/stfight.c src/vidhrdw/stfight.c src/drivers/stfight.c
$(OBJ)/drivers/dynduke.o: src/vidhrdw/dynduke.c src/drivers/dynduke.c
$(OBJ)/drivers/raiden.o: src/vidhrdw/raiden.c src/drivers/raiden.c
$(OBJ)/drivers/dcon.o: src/vidhrdw/dcon.c src/drivers/dcon.c
$(OBJ)/drivers/kncljoe.o: src/vidhrdw/kncljoe.c src/drivers/kncljoe.c
OBJ_SEIBU = $(OBJ)/drivers/wiz.o $(OBJ)/drivers/stfight.o $(OBJ)/sndhrdw/seibu.o $(OBJ)/drivers/dynduke.o \
    $(OBJ)/drivers/raiden.o $(OBJ)/drivers/dcon.o $(OBJ)/drivers/kncljoe.o

$(OBJ)/drivers/cabal.o: src/vidhrdw/cabal.c src/drivers/cabal.c
$(OBJ)/drivers/toki.o: src/vidhrdw/toki.c src/drivers/toki.c
$(OBJ)/drivers/bloodbro.o: src/vidhrdw/bloodbro.c src/drivers/bloodbro.c
OBJ_TAD = $(OBJ)/drivers/cabal.o $(OBJ)/drivers/toki.o $(OBJ)/drivers/bloodbro.o

$(OBJ)/drivers/exerion.o: src/vidhrdw/exerion.c src/drivers/exerion.c
$(OBJ)/drivers/aeroboto.o: src/vidhrdw/aeroboto.c src/drivers/aeroboto.c
$(OBJ)/drivers/citycon.o: src/vidhrdw/citycon.c src/drivers/citycon.c
$(OBJ)/drivers/pinbo.o: src/vidhrdw/pinbo.c src/drivers/pinbo.c
$(OBJ)/drivers/psychic5.o: src/vidhrdw/psychic5.c src/drivers/psychic5.c
$(OBJ)/drivers/ginganin.o: src/vidhrdw/ginganin.c src/drivers/ginganin.c
$(OBJ)/drivers/megasys1.o: src/vidhrdw/megasys1.c src/drivers/megasys1.c
$(OBJ)/drivers/cischeat.o: src/vidhrdw/cischeat.c src/drivers/cischeat.c
$(OBJ)/drivers/skyfox.o: src/vidhrdw/skyfox.c src/drivers/skyfox.c
$(OBJ)/drivers/argus.o: src/vidhrdw/argus.c src/drivers/argus.c
$(OBJ)/drivers/momoko.o: src/vidhrdw/momoko.c src/drivers/momoko.c
OBJ_JALECO = $(OBJ)/drivers/exerion.o $(OBJ)/drivers/aeroboto.o $(OBJ)/drivers/citycon.o $(OBJ)/drivers/pinbo.o $(OBJ)/drivers/psychic5.o \
	$(OBJ)/drivers/ginganin.o $(OBJ)/drivers/megasys1.o $(OBJ)/drivers/cischeat.o $(OBJ)/drivers/skyfox.o $(OBJ)/drivers/argus.o $(OBJ)/drivers/momoko.o

$(OBJ)/drivers/rpunch.o: src/vidhrdw/rpunch.c src/drivers/rpunch.c
$(OBJ)/drivers/tail2nos.o: src/vidhrdw/tail2nos.c src/drivers/tail2nos.c
$(OBJ)/drivers/pipedrm.o: src/vidhrdw/pipedrm.c src/drivers/pipedrm.c
$(OBJ)/drivers/aerofgt.o: src/vidhrdw/aerofgt.c src/drivers/aerofgt.c
OBJ_VSYSTEM = $(OBJ)/drivers/rpunch.o $(OBJ)/drivers/tail2nos.o $(OBJ)/drivers/pipedrm.o $(OBJ)/drivers/aerofgt.o

$(OBJ)/drivers/psikyo.o: src/vidhrdw/psikyo.c src/drivers/psikyo.c
OBJ_PSIKYO = $(OBJ)/drivers/psikyo.o

$(OBJ)/drivers/leland.o: src/vidhrdw/leland.c src/sndhrdw/leland.c src/drivers/leland.c
OBJ_LELAND = $(OBJ)/machine/8254pit.o $(OBJ)/drivers/leland.o $(OBJ)/drivers/ataxx.o

$(OBJ)/drivers/marineb.o: src/vidhrdw/marineb.c src/drivers/marineb.c
$(OBJ)/drivers/funkybee.o: src/vidhrdw/funkybee.c src/drivers/funkybee.c
$(OBJ)/drivers/zodiack.o: src/vidhrdw/zodiack.c src/drivers/zodiack.c
$(OBJ)/drivers/espial.o: src/vidhrdw/espial.c src/drivers/espial.c
$(OBJ)/drivers/vastar.o: src/vidhrdw/vastar.c src/drivers/vastar.c
OBJ_ORCA = $(OBJ)/drivers/marineb.o $(OBJ)/drivers/funkybee.o $(OBJ)/drivers/zodiack.o $(OBJ)/drivers/espial.o $(OBJ)/drivers/vastar.o

$(OBJ)/drivers/gaelco.o: src/vidhrdw/gaelco.c src/drivers/gaelco.c
$(OBJ)/drivers/splash.o: src/vidhrdw/splash.c src/drivers/splash.c
OBJ_GAELCO = $(OBJ)/drivers/gaelco.o $(OBJ)/drivers/splash.o

$(OBJ)/drivers/kaneko16.o: src/vidhrdw/kaneko16.c src/drivers/kaneko16.c
$(OBJ)/drivers/galpanic.o: src/vidhrdw/galpanic.c src/drivers/galpanic.c
$(OBJ)/drivers/airbustr.o: src/vidhrdw/airbustr.c src/drivers/airbustr.c
OBJ_KANEKO = $(OBJ)/drivers/kaneko16.o $(OBJ)/drivers/galpanic.o $(OBJ)/drivers/airbustr.o

$(OBJ)/drivers/neogeo.o: src/machine/neogeo.c src/machine/pd4990a.c src/vidhrdw/neogeo.c src/drivers/neogeo.c
OBJ_NEOGEO = $(OBJ)/drivers/neogeo.o

$(OBJ)/drivers/hanaawas.o: src/vidhrdw/hanaawas.c src/drivers/hanaawas.c
$(OBJ)/drivers/seta.o: src/vidhrdw/seta.c src/sndhrdw/seta.c src/drivers/seta.c
OBJ_SETA = $(OBJ)/drivers/hanaawas.o $(OBJ)/drivers/seta.o

$(OBJ)/drivers/ohmygod.o: src/vidhrdw/ohmygod.c src/drivers/ohmygod.c
$(OBJ)/drivers/powerins.o: src/vidhrdw/powerins.c src/drivers/powerins.c
OBJ_ATLUS = $(OBJ)/drivers/ohmygod.o $(OBJ)/drivers/powerins.o

$(OBJ)/drivers/shangha3.o: src/vidhrdw/shangha3.c src/drivers/shangha3.c
OBJ_SUN = $(OBJ)/drivers/shanghai.o $(OBJ)/drivers/shangha3.o

$(OBJ)/drivers/gundealr.o: src/vidhrdw/gundealr.c src/drivers/gundealr.c
OBJ_DOOYONG = $(OBJ)/drivers/gundealr.o

$(OBJ)/drivers/macross.o: src/vidhrdw/macross.c src/drivers/macross.c
$(OBJ)/drivers/bjtwin.o: src/vidhrdw/bjtwin.c src/drivers/bjtwin.c
OBJ_NMK = $(OBJ)/drivers/macross.o $(OBJ)/drivers/bjtwin.o


$(OBJ)/drivers/spacefb.o: src/vidhrdw/spacefb.c src/drivers/spacefb.c
$(OBJ)/drivers/blueprnt.o: src/vidhrdw/blueprnt.c src/drivers/blueprnt.c
$(OBJ)/drivers/dday.o: src/vidhrdw/dday.c src/drivers/dday.c
$(OBJ)/drivers/leprechn.o: src/vidhrdw/leprechn.c src/drivers/leprechn.c
$(OBJ)/drivers/hexa.o: src/vidhrdw/hexa.c src/drivers/hexa.c
$(OBJ)/drivers/redalert.o: src/vidhrdw/redalert.c src/sndhrdw/redalert.c src/drivers/redalert.c
$(OBJ)/drivers/irobot.o: src/machine/irobot.c src/vidhrdw/irobot.c src/drivers/irobot.c
$(OBJ)/drivers/spiders.o: src/machine/spiders.c src/vidhrdw/crtc6845.c src/vidhrdw/spiders.c src/drivers/spiders.c
$(OBJ)/drivers/stactics.o: src/machine/stactics.c src/vidhrdw/stactics.c src/drivers/stactics.c
$(OBJ)/drivers/sharkatt.o: src/vidhrdw/sharkatt.c src/drivers/sharkatt.c
$(OBJ)/drivers/kingobox.o: src/vidhrdw/kingobox.c src/drivers/kingobox.c
$(OBJ)/drivers/zerozone.o: src/vidhrdw/zerozone.c src/drivers/zerozone.c
$(OBJ)/drivers/speedbal.o: src/vidhrdw/speedbal.c src/drivers/speedbal.c
$(OBJ)/drivers/sauro.o: src/vidhrdw/sauro.c src/drivers/sauro.c
$(OBJ)/drivers/ambush.o: src/vidhrdw/ambush.c src/drivers/ambush.c
$(OBJ)/drivers/starcrus.o: src/vidhrdw/starcrus.c src/drivers/starcrus.c
$(OBJ)/drivers/goindol.o: src/vidhrdw/goindol.c src/drivers/goindol.c
$(OBJ)/drivers/meteor.o: src/vidhrdw/meteor.c src/drivers/meteor.c
$(OBJ)/drivers/aztarac.o: src/vidhrdw/aztarac.c src/sndhrdw/aztarac.c src/drivers/aztarac.c
$(OBJ)/drivers/mole.o: src/vidhrdw/mole.c src/drivers/mole.c
$(OBJ)/drivers/gotya.o: src/vidhrdw/gotya.c src/sndhrdw/gotya.c src/drivers/gotya.c
$(OBJ)/drivers/mrjong.o: src/vidhrdw/mrjong.c src/drivers/mrjong.c
$(OBJ)/drivers/polyplay.o: src/vidhrdw/polyplay.c src/sndhrdw/polyplay.c src/drivers/polyplay.c
$(OBJ)/drivers/mermaid.o: src/vidhrdw/mermaid.c src/drivers/mermaid.c
$(OBJ)/drivers/magix.o: src/vidhrdw/magix.c src/drivers/magix.c
OBJ_OTHER = $(OBJ)/drivers/spacefb.o $(OBJ)/drivers/blueprnt.o $(OBJ)/drivers/omegrace.o $(OBJ)/drivers/dday.o $(OBJ)/drivers/leprechn.o \
	$(OBJ)/drivers/hexa.o $(OBJ)/drivers/redalert.o $(OBJ)/drivers/irobot.o $(OBJ)/drivers/spiders.o $(OBJ)/drivers/stactics.o \
	$(OBJ)/drivers/sharkatt.o $(OBJ)/drivers/kingobox.o $(OBJ)/drivers/zerozone.o $(OBJ)/drivers/speedbal.o $(OBJ)/drivers/sauro.o \
	$(OBJ)/drivers/ambush.o $(OBJ)/drivers/starcrus.o $(OBJ)/drivers/goindol.o $(OBJ)/drivers/dlair.o $(OBJ)/drivers/meteor.o \
	$(OBJ)/drivers/aztarac.o $(OBJ)/drivers/mole.o $(OBJ)/drivers/gotya.o $(OBJ)/drivers/mrjong.o $(OBJ)/drivers/polyplay.o \
	$(OBJ)/drivers/mermaid.o $(OBJ)/drivers/magix.o $(OBJ)/drivers/royalmah.o

DRVOBJS = \
	$(OBJ_PACMAN) $(OBJ_NICHIBUT) $(OBJ_PHOENIX) $(OBJ_NAMCO) $(OBJ_UNIVERS) $(OBJ_NINTENDO) $(OBJ_MIDW8080) $(OBJ_MEADOWS) $(OBJ_MIDWAY) \
	$(OBJ_IREM) $(OBJ_GOTTLIEB) $(OBJ_TAITO) $(OBJ_TOAPLAN) $(OBJ_CAVE) $(OBJ_KYUGO) $(OBJ_WILLIAMS) $(OBJ_GREMLIN) $(OBJ_VICDUAL) \
	$(OBJ_CAPCOM) $(OBJ_CAPBOWL) $(OBJ_LELAND) $(OBJ_SEGA) $(OBJ_DENIAM) $(OBJ_DATAEAST) $(OBJ_TEHKAN) $(OBJ_KONAMI) \
	$(OBJ_EXIDY) $(OBJ_ATARI) $(OBJ_SNK) $(OBJ_ALPHA) $(OBJ_TECHNOS) $(OBJ_BERZERK) $(OBJ_GAMEPLAN) $(OBJ_STRATVOX) $(OBJ_ZACCARIA) \
	$(OBJ_UPL) $(OBJ_TMS) $(OBJ_CINEMAR) $(OBJ_CINEMAV) $(OBJ_THEPIT) $(OBJ_VALADON) $(OBJ_SEIBU) $(OBJ_TAD) $(OBJ_JALECO) \
	$(OBJ_VSYSTEM) $(OBJ_PSIKYO) $(OBJ_ORCA) $(OBJ_GAELCO) $(OBJ_KANEKO) $(OBJ_SUNA) $(OBJ_SETA) $(OBJ_ATLUS) $(OBJ_SUN) \
	$(OBJ_DOOYONG) $(OBJ_NMK) $(OBJ_OTHER) \
    $(OBJ_NEOGEO)

COREOBJS += $(OBJ)/driver.o

# generated text files
TEXTS += gamelist.txt

gamelist.txt: $(EMULATOR)
	@echo Generating $@...
	@$(EMULATOR) -gamelistheader -noclones > gamelist.txt
	@$(EMULATOR) -gamelist -noclones | sort >> gamelist.txt
	@$(EMULATOR) -gamelistfooter >> gamelist.txt


