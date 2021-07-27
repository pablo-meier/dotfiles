set -o vi

alias c="clear"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"

alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -lh'

export GOODVIM="nvim -p"
alias vim=$GOODVIM

alias cat='bat'

export PROMPT="%F{red}pablo%f%F{cyan}:%f%F{yellow}%c/%f $ "

export VISUAL=$GOODVIM
export EDITOR=$GOODVIM

export PATH="$PATH:/Users/pablo/scripts/"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/"
export PATH="$PATH:/Library/TeX/texbin/"
export PATH="/usr/local/opt/libpq/bin:$PATH"
. /Users/pablo/scripts/erlang_22.0/activate

# export ANDROID_HOME="/Users/pmeier/Library/Android/sdk"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opam configuration
test -r /Users/pablo/.opam/opam-init/init.zsh && . /Users/pablo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

. $(brew --prefix asdf)/asdf.sh

. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.cargo/bin:$PATH"

# Created by `userpath` on 2020-05-29 02:55:03
export PATH="$PATH:/Users/pablo/.local/bin"
export GH_TOKEN="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"
