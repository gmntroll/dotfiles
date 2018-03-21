HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

autoload -Uz compinit promptinit
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
alias search='sudo pacman -Ss' 
