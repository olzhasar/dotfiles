export LANG=en_US.UTF-8

if [[ $(uname) == "Darwin" ]]; then
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"

export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin

export PATH="$HOME/.cargo/bin:$PATH"
