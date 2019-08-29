#!/bin/sh
# XXX Installs my setup on a typical ubuntu system (16.04 or higher)

echo Enter sudo passwd : 
read pass
echo $pass | sudo -S echo Got sudo
echo Add neovim and safeeyes repo...
echo
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository ppa:slgobinath/safeeyes
echo Updating apt...
echo
echo $pass | sudo -S apt update -y
echo Installing packages...
echo
echo $pass | sudo -S apt install -y wget git curl tmux neovim util-linux \
dconf-tools dconf-gsettings-backend dconf-cli dconf-service uuid-runtime \
python-dev python-pip python3-dev python3-pip ctags zsh safeeyes \
libudev-dev libevdev-dev libevdev-tools libevdev2

if [ $? -ne 0 ]; then
  echo Apt failed 
  echo Exiting...
  exit
 fi
echo Getting caps2esc..
echo
wget -O $HOME/Downloads/caps2esc-latest.tar.gz https://github.com/oblitum/caps2esc/archive/v1.0.4.tar.gz

# compile in different terminal
gnome-terminal -- sh -c "cd $HOME/Downloads/ && tar -xzvf caps2esc-latest.tar.gz && cd caps2esc-1.0.4 && gcc caps2esc.c -o caps2esc -I/usr/include/libevdev-1.0 -levdev -ludev && sh"

#install fonts
# TODO iosevka and source code pro, test in a vm

#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
gnome-terminal -- ~/.fzf/install --no-bash --no-zsh

# clone dotfiles
git clone --separate-git-dir=$HOME/.myconf https://github.com/balamurali27/dotfiles $HOME/myconf-tmp
# tmux config
cp $HOME/myconf-tmp/.tmux.conf $HOME

# neovim config
cp -r $HOME/myconf-tmp/.config/nvim $HOME/.config
#install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fzf plug point for vim
sed -i 's/\/usr\/bin\//~\/./' $HOME/.config/nvim/init.vim
#To use Ultisnips
pip3 install --user --upgrade pynvim
gnome-terminal -- nvim

#install gnome terminal nord theme
git clone https://github.com/arcticicestudio/nord-gnome-terminal
gnome-terminal -- ./nord-gnome-terminal/src/nord.sh

#install ohmyz.sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "alias v=nvim" >> .zshrc

#git config
git config --global user.email "balamurali05@outlook.com"
git config --global user.name "Balamurali M"

