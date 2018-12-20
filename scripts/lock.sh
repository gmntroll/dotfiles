#!/bin/sh
scrot lock.png && ffmpeg -y -i lock.png -filter "gblur=sigma=30:steps=3" lock_blur.png && i3lock -fi lock_blur.png 
