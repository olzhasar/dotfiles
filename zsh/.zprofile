export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
if [[ -d "$HOME/.local/scripts.local" ]]; then
  export PATH="$HOME/.local/scripts.local:$PATH"
fi

export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
fi

if [[ -f ~/.zprofile.local ]]; then
  source ~/.zprofile.local
fi
