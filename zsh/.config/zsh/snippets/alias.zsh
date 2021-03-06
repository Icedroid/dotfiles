# global alias
alias -g H='| head ' T='| tail ' L='| less ' R='| rgc '
alias -g N='>/dev/null '

# 文件系统相关
alias rm='rmtrash'   rd='rmdir'   md='mkdir -p'
alias ls='exa -h'  la='ls -la'  lt='ls --tree'  ll='ls -l'  l='ls'
alias df='df -h'   dus='du -sh' del='gio trash'

# gdb
alias gdb-peda='gdb -q -ex init-peda' gdb-pwndbg='gdb -q -ex init-pwndbg'
alias gdb-gef='gdb -q -ex init-gef'   gdb=gdb-pwndbg

# pacman
alias S='sudo pacman -S'    Syu='sudo pacman -Syu'  Ss='pacman -Ss'
alias Si='pacman -Si'       Qi='pacman -Qi'         Qs='pacman -Qs'
alias Ql='pacman -Ql'       Rns='sudo pacman -Rns'  Fx='pacman -Fx'
alias Fy='sudo pacman -Fy'  U='sudo pacman -U'
alias pacman='noglob pacman'

# wrapper 的 wrapper
# 用于处理被 wrap 的命令是 alias 的情况
function _wwrapper() {
    local -a wrapper=(${(z)1}) cmd
    expand_alias cmd ${(z)2}
    if (( ! $+commands[$cmd[1]] )) && [[ ! -f $cmd[1] ]] {
        print -P "%F{red}%B$cmd[1] is not an executable file%b%f" && return
    }
    $wrapper ${(e)cmd} $argv[3,-1]
}

# wrapper
alias p="_wwrapper 'proxychains -q -f ~/.config/proxychains/8877.conf'"
alias p8080="_wwrapper 'proxychains -q -f ~/.config/proxychains/8080.conf'"
alias rlwrap="_wwrapper rlwrap"

# 乱七八糟的
alias h="tldr"
alias ec="emacsclient -n -c -a ''"
alias ecc="emacsclient -nw -c -a ''"
alias checksec="checksec --file"
alias amd="env DRI_PRIME=1"
alias trid="LC_ALL=C trid"
alias yafu='command rlwrap yafu'
alias nc='command rlwrap nc'
alias blogin="bit_login login"
alias blogout="bit_login logout"
alias wtf='wtf -f ~/.local/share/wtf/acronyms'
alias rgc='rg --color=always'
alias less='less -r'
alias history='fc -l 1'
alias locate='noglob locate'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=code   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=code     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s py=code       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=code
alias -s css=code
alias -s php=code
alias -s c=code
alias -s java=code
alias -s txt=code
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

alias vi='mvim -v'
alias vim='mvim -v'

source <(kubectl completion zsh)
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

fzfp() {
    fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always{} || rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'
}