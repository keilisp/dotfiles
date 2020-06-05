#!/usr//bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
	$@&
  fi
}

xset r rate 300 50
run "$HOME/scripts/wallplaylist"
run "zathura ~/dox/books/fizyka_formula_zno.pdf"
run "zathura ~/dox/books/Komandnaia_stroka_Linux.pdf"
run "discord"
run "telegram-desktop"
run "volumeicon"
run "nm-applet"
run "devmon"
run "blueberry-tray"

# run "rslsync"
# run "barrier"
# run "emacs"

# dwall -s firewatch3 &
# nitrogen --restore

# run "xinput --set-prop 'SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.8"
# run "setxkbmap -layout 'us, ru'"
# run "setxkbmap -option grp:caps_toggle"
# run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
