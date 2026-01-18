#!/bin/zsh

./scripts/stow.sh

stow amethyst
stow skhd

crontab $HOME/.dotfiles/darwin/cron/crontab_macos
