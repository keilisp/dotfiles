#!/usr//bin/env bash

function run() {
	if ! pgrep -f $1; then
		$@ &
	fi
}

xset r rate 300 50
# feh --bg-scale $HOME/pix/kek/1920x1080-px-emacs-Free-Software-GNU-Linux-Richard-Stallman-saint-1360085.jpg
# feh --bg-scale $HOME/pix/wallpapers/Art/Other/Flower-4.jpg
feh --bg-fill $HOME/pix/wallpapers/Anime/yamamoto.jpg
# run "$HOME/scripts/wallplaylist"
# run "discord"
# run "telegram-desktop"
# xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -0.6
run "nm-applet"
run "devmon"
run "blueberry-tray"

# run "volumeicon"
# run "rslsync"
# run "barrier"
# run "emacs"

# dwall -s firewatch3 &
# nitrogen --restore

# run "xinput --set-prop 'SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.8"
# run "setxkbmap -layout 'us, ru'"
# run "setxkbmap -option grp:caps_toggle"
# run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
