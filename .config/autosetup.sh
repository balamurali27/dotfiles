#!/bin/sh
#install ohmyz.sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install hyperzsh ohmyzsh theme
mkdir -p $ZSH_CUSTOM/themes
wget -O $ZSH_CUSTOM/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="hyperzsh"/g' ~/.zshrc
