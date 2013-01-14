#################################################################################
## .zshrc
#################################################################################

## Environment variable configuration
# LANG
export LANG=ja_JP.UTF-8

# Settings for Antigen
source ~/.zsh/zshrc.antigen

## Default shell configuration
# set prompt
# http://zsh.sourceforge.net/Doc/Release/zsh_12.html#SEC40
autoload colors && colors
PROMPT="%{${fg[green]}%}%#%{${reset_color}%} "
PROMPT2="%{${fg[green]}%}%_>%{${reset_color}%} "
SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 

setopt pushd_ignore_dups
setopt autopushd
DIRSTACKSIZE=10
setopt cdable_vars
setopt correct
setopt list_types 
setopt list_packed 
setopt nolistbeep
setopt transient_rprompt

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

## Command history configuration
HISTFILE=~/.zsh/zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history # share command history data
setopt hist_ignore_dups     # ignore duplication recent command
setopt hist_ignore_all_dups # ignore duplication command history list
setopt hist_expire_dups_first # remove duplicate first on histfile full
setopt hist_reduce_blanks # remove unnecessary blank
setopt hist_verify # disp history before run

typeset -U path # load PATH at once only

## Completion configuration
fpath=(~/.zsh/functions $fpath)
autoload -U compinit && compinit

## Alias configuration

alias j="jobs -l"
alias ls="ls -G -w"
alias la="ls -a"
alias ll="ls -l"
alias ltr="ls -ltr"
alias vim="mvim -v"
alias h="history"
alias pr="powder restart"
alias pl="powder log"
alias po="popd"
alias be="bundle exec"
alias bc="bundle console"
alias bep="bundle exec padrino"
alias bepg="bundle exec padrino gen"
alias bepr="bundle exec padrino rake"
alias ber="bundle exec rake"
alias eq="earthquake"
alias gs="git status"
alias tig="tig --all"
alias df="df -h"
alias rake='noglob rake'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g GR='| growlnotify'
alias -g V='| vim -R -'
alias gvimdiff=/usr/local/bin/mvimdiff
alias openp="find . -type d -name '*.xcodeproj' -maxdepth 1 -print | xargs open"
alias openw="find . -type d -name '*.xcworkspace' -maxdepth 1 -print | xargs open"

## terminal configuration
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## Git
# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' formats '(%b) %c%u'
zstyle ':vcs_info:*' actionformats '(%b|%a) %c%u'
autoload -Uz add-zsh-hook
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|) ${RPROMPT}"

## z.sh
# https://github.com/sjl/z-zsh
source ~/.zsh/plugins/z/z.sh
function precmd () { z --add "$(pwd -P)" }

## zaw
# https://github.com/zsh-users/zaw
source ~/.zsh/plugins/zaw/zaw.zsh
bindkey '^R' zaw-history

# npm
export PATH="$PATH:/usr/local/share/npm/bin"

