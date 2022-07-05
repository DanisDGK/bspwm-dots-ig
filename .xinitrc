#!/bin/sh

userresources="$XDG_CONFIG_HOME/X11/Xresources"

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xsetroot -cursor_name left_ptr &
xset r rate 210 40 &
setxkbmap -model pc104 -layout us,canary,lv -variant ,,tilde -option compose:menu,grp:shift_toggle,caps:ctrl_modifier &

parcellite &
udiskie --no-notify --tray &

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname compiz

exec bspwm
