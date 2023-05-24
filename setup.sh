#!/bin/sh

if ! [ -x "$(command -v stow)" ]; then
  echo 'Error: stow is not installed.' >&2
  exit 1
fi

stow zsh
stow git
stow tmux
stow -t ~/.config config

brew bundle
