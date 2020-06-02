#!/usr//bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
	$@&
  fi
}

xset r rate 300 50
run "/home/mediocre/scripts/wallplaylist"
run "zathura $HOME/dox/books/fizyka_formula_zno.pdf"
run "zathura $HOME/dox/books/Komandnaia_stroka_Linux.pdf"
run "rslsync"
run "discord"
run "telegram-desktop"
run "volumeicon"
run "nm-applet"
run "devmon"
run "blueberry-tray"

# run "barrier"
# run "emacs"

# dwall -s firewatch3 &
# nitrogen --restore

# run "xinput --set-prop 'SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.8"
# run "setxkbmap -layout 'us, ru'"
# run "setxkbmap -option grp:caps_toggle"
# run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
