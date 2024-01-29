export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64

docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     /usr/local/bin/docker "$@"
  fi
}

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
export DEV_DIR="$HOME/dev/"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# ALIASES
alias python=python3
alias vim=nvim
alias vimg="vim . +Git"
alias dev="cd $DEV_DIR"
alias dotfiles="cd $HOME/.dotfiles && tmux new-session -A -s dotfiles nvim ."
alias t=tmux-dev

eval "$(direnv hook zsh)"
