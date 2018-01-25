source ~/.git-completion.bash
source ~/.git-prompt.sh

# color coding prompt
# export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u > [\[$(tput setaf 1)\]\W\[$(tput setaf 2)\]] ☃  \[$(tput sgr0)\]"

export PATH=/usr/local/bin:$PATH

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u > [\[$(tput setaf 1)\]\W\[$(tput setaf 2)\]]"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'"\[$(tput setaf 2)\] ☃ \[$(tput sgr0)\] "

# list of alias
alias ..='cd ..'
alias ll='ls -al'
alias gg='git status'
alias gs='git status -s'
alias gd='git diff'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias go='git checkout'
alias rd='bundle exec rspec --format documentation'
alias r='bundle exec rspec'

export NVM_DIR="$HOME/.nvm"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
