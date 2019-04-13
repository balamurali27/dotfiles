dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# default awesome
session=${1:-awesome}

case $session in
i3		) exec i3;;
awesome		) exec awesome;;
*		) exec $1;;
esac
