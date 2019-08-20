#!/bin/sh
# XXX Installs my setup on a typical ubuntu system 16.04 or higher

echo Enter sudo passwd : 
read pass
echo $pass | sudo -S echo Got sudo
#sleep cuz dpkg lock
echo Adding neovim repo...
echo
sudo add-apt-repository -y ppa:neovim-ppa/stable
echo Updating apt...
echo
echo $pass | sudo -S apt update -y
echo Installing packages...
echo
echo $pass | sudo -S apt install -y wget git curl tmux neovim util-linux \
dconf-tools dconf-gsettings-backend dconf-cli dconf-service uuid-runtime \
python-dev python-pip python3-dev python3-pip libudev-dev
echo Getting caps2esc..
echo
wget -O $HOME/Downloads/caps2esc-latest.tar.gz https://github.com/oblitum/caps2esc/archive/v1.0.4.tar.gz

# compile in different terminal
gnome-terminal -- sh -c "cd $HOME/Downloads/ && tar -xzvf caps2esc-latest.tar.gz && cd caps2esc-1.0.4 && gcc caps2esc.c -o caps2esc -I/usr/include/libevdev-1.0 -levdev -ludev && sh"

#install ohmyz.sh
gnome-terminal -- sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install fonts
# TODO iosevka and source code pro, test in a vm

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
gnome-terminal -- ~/.fzf/install --no-bash --no-zsh

# clone dotfiles
git clone --separate-git-dir=$HOME/.myconf https://github.com/balamurali27/dotfiles $HOME/myconf-tmp
# neovim config
cp -r $HOME/myconf-tmp/.config/nvim $HOME/.config
cp $HOME/myconf-tmp/.zshrc $HOME

#configure neovim
sed -i '0,5{s/^"//}' $HOME/.config/nvim/init.vim
#fzf plug point
sed -i 's/\/usr\/bin\//~\/./' $HOME/.config/nvim/init.vim
gnome-terminal -- nvim

#install gnome terminal nord theme
git clone https://github.com/arcticicestudio/nord-gnome-terminal
./nord-gnome-terminal/nord.sh

