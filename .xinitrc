#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xrandr --auto

# monitor settings
xrandr --output DVI-D-0 --off 
xrandr --output HDMI-0 --off 
xrandr --output DP-0 --mode 2560x1440 --pos 0x0 --rotate normal 
xrandr --output DP-1 --off 
xrandr --output DP-2 --primary --mode 2560x1440 --pos 2560x0 --rotate normal 
xrandr--output DP-3 --off 
xrandr --output DP-4 --mode 2560x1440 --pos 5120x0 --rotate normal 
xrandr --output DP-5 --off

# i3wm
exec i3

