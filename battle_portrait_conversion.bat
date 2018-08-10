magick convert -extent 80x80+0+0 old.png old.png
magick convert -crop 80x80+0+0 old.png old.png
magick convert old.png ( +clone -crop 16x8+64+0 +repage ) -geometry +0+64 -composite SBPORTRAITTEMP1.png
magick convert SBPORTRAITTEMP1.png ( +clone -crop 16x8+64+8 +repage ) -geometry +16+64 -composite SBPORTRAITTEMP2.png
magick convert SBPORTRAITTEMP2.png ( +clone -crop 16x8+64+16 +repage ) -geometry +32+64 -composite SBPORTRAITTEMP3.png
magick convert SBPORTRAITTEMP3.png ( +clone -crop 16x8+64+24 +repage ) -geometry +48+64 -composite SBPORTRAITTEMP4.png
magick convert SBPORTRAITTEMP4.png ( +clone -crop 16x8+64+32 +repage ) -geometry +0+72 -composite SBPORTRAITTEMP5.png
magick convert SBPORTRAITTEMP5.png ( +clone -crop 16x8+64+40 +repage ) -geometry +16+72 -composite SBPORTRAITTEMP6.png
magick convert SBPORTRAITTEMP6.png ( +clone -crop 16x8+64+48 +repage ) -geometry +32+72 -composite SBPORTRAITTEMP7.png
magick convert SBPORTRAITTEMP7.png ( +clone -crop 16x8+64+56 +repage ) -geometry +48+72 -composite SBPORTRAITTEMP8.png
magick convert -crop 64x80+0+0 SBPORTRAITTEMP8.png new.png
