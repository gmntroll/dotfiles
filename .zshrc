HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
compinit
promptinit
zstyle ':completion:*' menu select
PROMPT='%F{blue}  %j %f%F{yellow}  %~ %f%F{red} %f '
RPROMPT=''
alias grep='grep --color=auto'
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -Al'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias search='pacman -Ss' 
alias remove='sudo pacman -Rsc'
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
