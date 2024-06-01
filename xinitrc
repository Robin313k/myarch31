#!/bin/sh

setxkbmap de
#feh --bg-fill system/wallpaper/archlogow10themed.jpg
feh --bg-fill system/wallpaper/snowymountains.jpg
picom &
playerctld &

#dwm stuff

#statusbar
/home/robin/system/suckless/dwm-statusbar/dwm_bar.sh &

#starting dwm
exec dwm
