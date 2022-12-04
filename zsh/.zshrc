export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# OHMYZSH

plugins=(git httpie zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# EDITOR

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

autoload -Uz compinit && compinit

# ALIASES

alias python=python3
alias vim=nvim
alias dev="cd $HOME/Development/"
alias dotfiles="cd $HOME/.dotfiles && tmux new-session -A -s dotfiles nvim ."

# EXPORTS

export LANG=en_US.UTF-8
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin

# COMMANDS

eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
