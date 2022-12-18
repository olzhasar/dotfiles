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

# EXPORTS
export DEV_DIR="$HOME/Development/"

export LANG=en_US.UTF-8
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

# ALIASES

alias python=python3
alias vim=nvim
alias dev="cd $DEV_DIR"
alias dotfiles="cd $HOME/.dotfiles && tmux new-session -A -s dotfiles nvim ."
alias blog="cd $DEV_DIR/olzhasar.github.io && tmux new-session -A -s blog nvim ."

# COMMANDS

eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
