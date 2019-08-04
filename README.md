# dotfiles
Repo to keep my dotfiles in sync.
Repo made based on [this](https://news.ycombinator.com/item?id=11070797) comment.

## Repo created using
```
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```
and adding files with
```
config add <filepath>
```
## Quick setup with wget
```
 sh -c "$(wget -O - https://raw.githubusercontent.com/balamurali27/dotfiles/master/.config/homesetup.sh)"
 ```
## To use the dotfiles quickly
Clone the repo with
```
git clone --separate-git-dir=$HOME/.myconf https://github.com/balamurali27/dotfiles $HOME/myconf-tmp
```
copy the necessary dotfiles to home directory, then
```
rm -rf ~/myconf-tmp/
echo "alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'" >> ~/.zshrc
config config status.showUntrackedFiles no
```
Then use the alias ```config``` to work with the repo

