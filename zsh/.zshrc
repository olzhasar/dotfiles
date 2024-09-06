export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
unsetopt autocd  # do not cd on directory name

# docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# OHMYZSH
plugins=(git zsh-autosuggestions)
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

# direnv
eval "$(direnv hook zsh)"

# ALIASES
alias python=python3
alias vim=nvim
alias dev="cd $DEV_DIR"
alias dotfiles="cd $HOME/.dotfiles && tmux new-session -A -s dotfiles nvim ."

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
