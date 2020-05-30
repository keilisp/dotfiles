#!/usr//bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
	$@&
  fi
}
run "barrier"
run "emacs"
run "discord"
run "telegram-desktop"
run "volumeicon"
run "nm-applet"
# barrier &
xset r rate 300 50
devmon &
nm-applet &
blueberry-tray &

# run "opera"
# compton &
# dwall -s firewatch3 &
# nitrogen --restore
# volumeicon &

# run "xinput --set-prop 'SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.8"
# run "setxkbmap -layout 'us, ru'"
# run "setxkbmap -option grp:caps_toggle"
# run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
