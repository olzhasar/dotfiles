# zmodload zsh/zprof

unsetopt autocd  # do not cd on directory name

# OHMYZSH
zstyle ':omz:update' mode disabled

export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source "$ZSH/oh-my-zsh.sh"

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# uv
# too freaking slow
# if command -v uv >/dev/null 2>&1; then
#   eval "$(uv generate-shell-completion zsh)"
# fi

if command -v fzf >/dev/null 2>&1; then
  if fzf --zsh >/dev/null 2>&1; then
    source <(fzf --zsh)
  fi
fi

# bun completions
[ -s "/Users/olzhas/.bun/_bun" ] && source "/Users/olzhas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

# ALIASES
alias python=python3
alias clip='xclip -selection clipboard'
alias vim=nvim
alias dev="cd $DEV_DIR"
alias dotfiles="cd $HOME/.dotfiles && tmux new-session -A -s dotfiles nvim ."

# zprof
