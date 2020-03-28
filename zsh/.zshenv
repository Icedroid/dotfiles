export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh

export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$EBOOK_PATH:$HOME/go/bin:/usr/local/lib/ruby/gems/2.7.0/bin:/usr/local/opt/python/libexec/bin:/usr/local/sbin:/Users/wiwen/Library/Python/3.7/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# source $HOME/.bash_profile

export EBOOK_PATH=/Applications/calibre.app/Contents/MacOS
export ANSIBLE_CONFIG=$HOME/.ansible/ansible.cfg
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export EDITOR=vim

# export GOROOT="$HOME/sdk/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
#export GOPROXY="http://192.168.0.103:9000,https://goproxy.cn,direct"
export GOPROXY="https://goproxy.cn,direct"
#export GO111MODULE=on
#export GO111MODULE=off
