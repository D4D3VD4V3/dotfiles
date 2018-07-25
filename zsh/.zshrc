fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '\e.' insert-last-word

PS1='%F{cyan}%n@%F{cyan}%F{cyan}%m %d
==>%F{default}'
alias l="ls -lah"
setopt AUTO_CD
export EDITOR="vim"
setopt NO_BEEP
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

zstyle ':completion:*' menu select
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo
