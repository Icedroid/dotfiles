# 作为嵌入式终端时禁用 tmux
# https://www.reddit.com/r/tmux/comments/a2e5mn/tmux_on_dolphin_inbuilt_terminal/
# 上面的方法由于 alacritty 0.4.0 的释出而失效
# if [[ "$TMUX" == "" && $- == *i* ]]; then
#     if [[ ! "$(</proc/$PPID/cmdline)" =~ "/usr/bin/(dolphin|emacs|kate)" ]]; then
#         exec tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"
#     fi
# fi

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# p10k instant prompt
# 可取代 zinit turbo mode
# if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#     source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ==== Zplugin 初始化 ====

typeset -A ZINIT=(
    BIN_DIR $XDG_DATA_HOME/zsh/zinit/bin
    HOME_DIR $XDG_DATA_HOME/zsh/zinit
    COMPINIT_OPTS -C
)

source $XDG_DATA_HOME/zsh/zinit/bin/zinit.zsh

# ===== 函数 ====

fpath+=("$XDG_CONFIG_HOME/zsh/functions")

autoload -Uz rgzh rgsrc rgdata pslist ebindkey expand_alias palette printc
autoload +X zman
autoload -Uz zcalc zmv
autoload -Uz compinit
compinit

# ==== 某些插件需要的环境变量 ====

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='( |man |pikaur -S )*'

forgit_add=gai
forgit_diff=gdi
forgit_log=glgi

export AGV_EDITOR='kwrite -l $line -c $col $file'
export _ZL_DATA=$XDG_DATA_HOME/zsh/zlua

# ==== 加载插件 ====

zinit light-mode for \
    zdharma/zzcomplete zdharma/zui \
    hlissner/zsh-autopair \
    skywind3000/z.lua \
    hchbaw/zce.zsh \
    wfxr/forgit

zinit light-mode for \
    blockf \
    zsh-users/zsh-completions \
    as="program" atclone="rm -f ^(rgg|agv)" \
    lilydjwg/search-and-view \
    atclone="dircolors -b LS_COLORS > c.zsh" atpull='%atclone' pick='c.zsh' \
    trapd00r/LS_COLORS

zinit light Aloxaf/fzf-tab

zinit light jonmosco/kube-ps1

zinit ice svn
zinit snippet OMZ::plugins/extract

zinit for \
    OMZ::lib/clipboard.zsh \
    OMZ::lib/git.zsh \
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    OMZ::plugins/git-extras/git-extras.plugin.zsh \
    OMZ::plugins/systemd/systemd.plugin.zsh \
    OMZ::plugins/sudo/sudo.plugin.zsh \
    OMZ::plugins/git/git.plugin.zsh

zinit svn for \
    OMZ::plugins/extract \
    OMZ::plugins/pip

zinit as="completion" for \
    OMZ::plugins/cargo/_cargo \
    OMZ::plugins/rust/_rust \
    OMZ::plugins/fd/_fd

# ==== 加载自定义插件 ====

for i in $XDG_CONFIG_HOME/zsh/snippets/*.zsh; do
    source $i
done

# source ~/Coding/shell/fzf-tab/fzf-tab.zsh
# source ~/Coding/shell/zvm/zvm.zsh

# zinit ice as="completion"
# zinit snippet $XDG_CONFIG_HOME/zsh/snippets/_bat

# zinit snippet ~/.travis/travis.sh

# ==== 初始化补全 ====

zinit light-mode for \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions

zpcompinit
zpcdreplay

# ==== 加载主题 ====

: ${THEME:=p10k}

case $THEME in
pure)
    PROMPT=$'\n%F{cyan}❯ %f'
    RPROMPT=""
    zstyle ':prompt:pure:prompt:success' color cyan
    zinit ice lucid wait="!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd"
    zinit light Aloxaf/pure
    ;;
p10k)
    source $XDG_CONFIG_HOME/zsh/p10k.zsh
    zinit ice depth=1
    zinit light romkatv/powerlevel10k
    PROMPT='$(kube_ps1)'$PROMPT
    ;;
esac
