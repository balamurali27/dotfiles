export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
PATH="$PATH:$HOME/.cargo/bin"
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview;k:kdeconnect'
# for url-view with tmux
export BROWSER='/usr/bin/firefox'
export PYTHONBREAKPOINT=ipdb.set_trace
export FORGIT_COPY_CMD='wl-copy'
export DIRENV_LOG_FORMAT=''
