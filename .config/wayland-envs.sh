#!/bin/sh
# belongs in /etc/profile.d
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
