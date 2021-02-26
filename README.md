USE GNU stow to automatically create symlinks:

Clone this repo to `~/.dotfiles`

```
cd ~/.dotfiles
```

Then use `stow` command inside dotfiles dir:
```
stow tmux
stow bash
stow git
stow -t ~/.config config
```
