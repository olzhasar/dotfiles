.PHONY: all stow brew

all: stow brew

brew:
	command -v brew >/dev/null 2>&1 || { echo >&2 "Error: Homebrew is not installed."; exit 1; }
	brew bundle

stow:
	command -v stow >/dev/null 2>&1 || { echo >&2 "Error: stow is not installed."; exit 1; }
	stow zsh
	stow git
	stow tmux
	stow -t ~/.config config
