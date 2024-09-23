
!/bin/sh

##################### AUTOSTART ###############################
xrandr -s 1600x900

#launch polybar
$HOME/.config/polybar/launch.sh &

#notifications lmfao
dunst&

#pywal for polybar rice
#$HOME/.config/polybar/hack/scripts/wal.sh

#picom &
#picom -b --experimental-backends --backend glx&

###wallpaper
#gradient color 
#hsetroot -add "#503DB0" -add "#2A85BA" -gradient 1

#solid color
#hsetroot -solid "#0e1014" &

#image

#feh --bg-fill $HOME/Pictures/pxArt1.png& 2>/dev/null
feh --bg-fill $HOME/.config/bspwm/redcorekali.png& 2>/dev/null
#feh --bg-fill /usr/share/backgrounds/kali-16x9/kali-night-skyA-1920x1080.png

#feh --image-bg "#COLOR" --bg-center "IMAGE"
#feh [bg-flag] [-g --geometry] [WxH+X+Y] [Picture]

#mouse
xinput set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' 1&

#touchpad t470
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Accel Speed' 0.2&
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Scroll Method Enabled' 0 1 0 &
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Horizontal Scroll Enabled' 1 &
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Natural Scrolling Enabled' 0 &
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1 &

##disable while typing

xinput set-prop 'SynPS/2 Synaptics TouchPad' "libinput Disable While Typing Enabled" 1 


#keyboard
sxhkd &

#mute beep
xset -b

#keyboard repeat delay xset r rate delay [rate]
xset r rate 150 25

#conky -c ~/.config/conky/conky.conf

#source the colors
#. "${HOME}/.cache/wal/colors.sh"

#pywal
# wal -R

# these process should be restarted for each bspwm reload by a script

# Restart lxpolkit
if pgrep -x lxpolkit > /dev/null; then
  killall lxpolkit
fi
lxpolkit &

# Restart xfce4-clipman
if pgrep -x xfce4-clipman > /dev/null; then
  killall xfce4-clipman
fi
xfce4-clipman &

# Restart nm-applet
if pgrep -x nm-applet > /dev/null; then
  killall nm-applet
fi
nm-applet &


#picom

# if pgrep -x picom > /dev/null; then killall picom && picom&; else picom&;fi

############################################################

