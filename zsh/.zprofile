if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
fi

if [[ -f ~/.zprofile.local ]]; then
  source ~/.zprofile.local
fi
