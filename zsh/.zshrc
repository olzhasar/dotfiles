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
export DEV_DIR="$HOME/dev/"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# ALIASES

alias python=python3
alias vim=nvim
alias dev="cd $DEV_DIR"
alias dotfiles="cd $HOME/.dotfiles && tmux new-session -A -s dotfiles nvim ."
alias blog="cd $DEV_DIR/personal/olzhasar.github.io && tmux new-session -A -s blog nvim ."
alias resume="cd $DEV_DIR/personal/cv && tmux new-session -A -s cv nvim ."

# COMMANDS
tmux-dev() {
  local session_name

  if [[ -n $1 ]]; then
    local project_dir
    project_dir=$(find "$DEV_DIR" -type d -name "$1" -maxdepth 3 -print -quit)

    if [ -n "$project_dir" ]; then
      cd "$project_dir"
      session_name=$1
    else
      echo "Project directory '$1' not found in $DEV_DIR"
      return 1
    fi
  fi

  if [ -n "$session_name" ]; then
    tmux new-session -s "$session_name" -d "nvim ."
  else
    tmux new-session -d "nvim ."
  fi
  tmux split-window -v -p 20
  tmux split-window -h
  tmux select-pane -t 1
  tmux attach-session -d
}

eval "$(direnv hook zsh)"
