#!/bin/zsh

# stow common dotfiles
stow zsh
stow git
stow tmux
stow -t ~/.config config
stow -t ~/.local/scripts scripts
