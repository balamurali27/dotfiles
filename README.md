# dotfiles
Repo to keep my dotfiles in sync.
Repo made based on [this](https://news.ycombinator.com/item?id=11070797) comment.

## Repo created using
```sh
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```
and adding files with
```sh
config add <filepath>
```
## Quick setup with wget (Deprecated)
```sh
 sh -c "$(wget -O - https://raw.githubusercontent.com/balamurali27/dotfiles/master/.config/homesetup.sh)"
 ```
## To use the dotfiles quickly
Clone the repo with
```sh
git clone --separate-git-dir=$HOME/.myconf https://github.com/balamurali27/dotfiles $HOME/myconf-tmp
git --git-dir=$HOME/.myconf --work-tree=$HOME config --local core.worktree $HOME #for vim fugitive
```
copy the necessary dotfiles to home directory, then
```sh
rm -rf ~/myconf-tmp/
config config status.showUntrackedFiles no # needs zshrc to be copied and sourced
```
Then use the alias `config` to work with the repo

