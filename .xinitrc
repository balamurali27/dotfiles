[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# default awesome
session=${1:-awesome}

case $session in
i3		) exec i3;;
awesome		) exec awesome;;
*		) exec $1;;
esac
