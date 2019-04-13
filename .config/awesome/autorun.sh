#!/bin/sh
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#commands that may change from distro to distro
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run /usr/lib/kdeconnectd
#startup things
run urxvtd -q -o
run feh --recursive --randomize --bg-scale /home/balu/.config/variety/Downloaded
run betterlockscreen -u /home/balu/.config/variety/Downloaded/wallhaven*
run kdeconnect-indicator
run variety
run safeeyes
run fluxgui
run ssh-agent -s -D
run udiskie --tray
run nm-applet
#touchpad
run xinput set-prop 13 305 1 #tap to click
run xinput set-prop 13 287 1 #natural scrolling
run xinput set-prop 13 313 1 #disable while typing
