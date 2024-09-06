export LANG=en_US.UTF-8

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
if [[ -d "$HOME/.local/scripts.local" ]]; then
  export PATH="$HOME/.local/scripts.local:$PATH"
fi

if [[ $(uname) == "Darwin" ]]; then
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

if [[ -f ~/.zshenv.local ]]; then
  source ~/.zshenv.local
fi
