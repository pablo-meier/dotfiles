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

# Install bat, the cat replacement if needed
alias cat='bat'

export PROMPT="%F{red}pablo%f%F{cyan}:%f%F{yellow}%c/%f $ "

export VISUAL=$GOODVIM
export EDITOR=$GOODVIM

export PATH="$PATH:/Users/pablo/scripts/"
# If you use Postgres.app…
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/"
export PATH="$PATH:/Library/TeX/texbin/"
# Probably should use asdf instead
. /Users/pablo/scripts/erlang_22.0/activate
test -r /Users/pablo/.opam/opam-init/init.zsh && . /Users/pablo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
. $(brew --prefix asdf)/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.cargo/bin:$PATH"
