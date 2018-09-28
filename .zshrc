set -o vi

alias c="clear"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"

alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -lh'

export GOODVIM="/usr/local/bin/vim -p"
alias vim=$GOODVIM

export PROMPT="%F{red}pablo%f%F{cyan}:%f%F{yellow}%c/%f $ "

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export VISUAL=$GOODVIM
export EDITOR=$GOODVIM

# export ANDROID_HOME="/Users/pmeier/Library/Android/sdk"
