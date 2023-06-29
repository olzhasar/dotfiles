.PHONY: help
help:
	@echo brew_dump - dump all brew packages to the Brewfile
	@echo brew_install - install all brew packages
	@echo stow - stow all files
	@echo cron - set up crontab

.PHONY: brew_dump
brew_dump:
	command -v brew >/dev/null 2>&1 || { echo >&2 "Error: Homebrew is not installed."; exit 1; }
	rm -f Brewfile
	brew bundle dump

.PHONY: brew_install
brew_install:
	command -v brew >/dev/null 2>&1 || { echo >&2 "Error: Homebrew is not installed."; exit 1; }
	brew bundle

.PHONY: stow
stow:
	command -v stow >/dev/null 2>&1 || { echo >&2 "Error: stow is not installed."; exit 1; }
	stow zsh
	stow git
	stow tmux
	stow vale
	stow yabai
	stow skhd
	stow -t ~/.config config
	stow -t ~/.local/scripts scripts

.PHONY: cron
cron:
	crontab ~/.dotfiles/cron/crontab
