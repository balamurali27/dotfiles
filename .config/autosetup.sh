#!/bin/sh
#install ohmyz.sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install hyperzsh ohmyzsh theme
git clone --recurse-submodules https://github.com/eendroroy/alien-minimal.git ~/.oh-my-zsh/themes/alien-minimal
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="alien-minimal/alien-minimal"/g' ~/.zshrc
#download Xresources-themes to .Xresources.d/
mkdir -p ~/.Xresources.
git clone https://github.com/logico-dev/Xresources-themes ~/.Xresources.d
unzip ~/.Xresources.d/Xresources-themes-master.zip -d  ~/.Xresources.d
