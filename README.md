USE GNU stow to automatically create symlinks:

Clone this repo to `~/.dotfiles`

```
cd ~/.dotfiles
```

Then use `stow` command inside dotfiles dir:

```
stow zsh
stow git
stow tmux
stow -t ~/.config config
```
