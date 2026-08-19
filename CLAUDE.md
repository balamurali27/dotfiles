# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles, stored with the "bare repo + `$HOME` work tree" pattern (see README.md).
There is no source tree, no build, no tests, and no lint step — every tracked file is a
live config that takes effect where it sits in `$HOME`.

- Git dir: `$HOME/.myconf` (this directory — `core.bare = false`, `core.worktree = $HOME`)
- Work tree: `$HOME`
- Remote: `git@github.com:balamurali27/dotfiles.git`
- `status.showUntrackedFiles = no`, so `git status` only reports the ~53 tracked files
  instead of the whole home directory. Do not turn this off.

## Working with the repo

Plain `git` from inside `$HOME` will not find this repo. Every command needs the git dir and
work tree, and must run with `$HOME` as cwd (running from inside `.myconf` makes commands like
`ls-files` return nothing):

```sh
cd ~ && git --git-dir=$HOME/.myconf --work-tree=$HOME <subcommand>
```

The user's `.zshrc` wraps this as `config` (and `configv` for a fugitive-aware nvim).
Adding a new dotfile is an explicit `config add <path>` — nothing is picked up automatically.

Commit subjects follow `type(scope): Capitalized summary`, where scope is the tool being
configured: `feat(nvim): Add python intellisense conf`, `fix(kde): Remove obsolete ssh-add script`.

## Layout

Paths are relative to `$HOME`, so a file's location *is* its install target.

- `.config/nvim/` — the main body of config. `init.vim` holds settings and the vim-plug
  block (plugins are the source of truth for what's installed); `after/plugin/*.vim` holds
  per-plugin mappings, one file per concern (`fzf_mappings.vim`, `coc-config.vim`, …);
  `after/ftplugin/`, `after/syntax/` are filetype overrides; `lua/*_config.lua` files are
  loaded by explicit `lua require('…')` lines near the end of `init.vim` — a new lua module
  does nothing until that line is added.
- `.vimrc` — a separate, older plain-vim config. It is not kept in sync with the neovim
  config; changing one does not imply changing the other.
- `.config/rootconfigs/` — files that belong outside `$HOME` (`etc/X11/…`, `etc/systemd/…`,
  `usr/lib/udev/…`), mirrored under this directory so they can be tracked. Editing them here
  has no effect until they are copied to the real root paths.
- Window managers / desktop: `.config/{i3,sway,awesome,dunst,swaylock,alacritty,termite}`,
  `.xinitrc`, `.Xresources` (+ `.Xresources.d/custom-themes/`). Several of these are
  alternatives to each other, not a single active stack.
- Shell: `.zshrc`, `.zprofile`, `.p10k.zsh` (oh-my-zsh + powerlevel10k), `.tmux.conf`.
- `.config/homesetup.sh` — one-shot Ubuntu 16.04-era bootstrap script. README marks the
  wget entry point deprecated; treat it as historical unless asked to revive it.

## Verifying changes

There is nothing to run. Check syntax by reloading the tool itself, e.g.
`nvim --headless "+source $HOME/.config/nvim/init.vim" +qa`, `zsh -n ~/.zshrc`,
`tmux source-file ~/.tmux.conf`, `i3 -C -c ~/.config/i3/config`, `sway -C`.
