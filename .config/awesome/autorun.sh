#!/bin/sh
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run urxvtd -q -o
run feh --recursive --randomize --bg-scale /home/balu/.config/variety/Downloaded
run kdeconnect-indicator
run variety
run safeeyes
run fluxgui
run ssh-agent -s -D
run udiskie --tray
