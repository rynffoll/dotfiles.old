# -*- mode: shell-script -*-

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_STATESEPARATOR=""
PS1='\[\033[34m\]\w\[\033[1;33m\]$(__git_ps1 " %s")\[\033[00m\]\n$ '

# history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # store history immediately
HISTCONTROL=ignoreboth # ignore dups and spaces
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTIGNORE='ls:bg:fg:history'

# options
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar # use **/*.ext
shopt -s dirspell
shopt -s cdspell
shopt -s direxpand

# completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
bind 'set completion-ignore-case on'
bind 'set colored-completion-prefix on'
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'

# keybindings
set -o emacs
bind 'TAB:menu-complete'
# M-p/M-n
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'

# variables
export EDITOR="ecli"

# alias
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export SDKMAN_DIR="~/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
