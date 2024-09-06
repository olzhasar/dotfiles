#!/bin/zsh

# stow common dotfiles
stow zsh
stow git
stow tmux
stow vale
stow -t ~/.config config
stow -t ~/.local/scripts scripts

if [[ $(uname) == "Darwin" ]]; then
  stow amethyst
  stow skhd

  crontab $HOME/.dotfiles/cron/crontab_macos
fi
