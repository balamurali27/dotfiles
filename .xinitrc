eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# Here i3 is kept as default
session=${1:-i3}

case $session in
i3|i3wm		) exec i3;;
awesome		) exec awesome;;
kde		) exec startkde;;
*		) exec $1;;
esac
