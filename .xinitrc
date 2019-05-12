dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#commands that may change from distro to distro
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1&
/usr/lib/kdeconnectd&
#  TODO: find out why below script doesn't work with arguments to startx <02-05-19, Balamurali M> # 
# default awesome 
session=${1:-awesome}

case $session in
i3		) exec i3;;
awesome		) exec awesome;;
*		) exec $1;;
esac
