#!fish

if command -v pazi >/dev/null
  status --is-interactive; and pazi init fish | source
end

kitty + complete setup fish | source

alias icat="kitty +kitten icat"
alias tree="git log --graph --oneline"

# enable colors in grep by default
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# replace ls with exa
alias ls='exa'
alias ll='exa -alg --git'
alias lt='exa -T'
alias llt='exa -lT'
alias l='exa'

# Some typos I often make
alias clearls="clear; ls"
alias sgit="git"

set -x -U GOPATH $HOME/code/go

# Local stuff can be put in ~/.config,fish
if test -f "$HOME/.config.fish" 
  . "$HOME/.config.fish"
end

if test -x /usr/bin/lesspipe
  eval (env SHELL=/bin/sh lesspipe)
end

set -q skin; or set -Ux skin onedark
reskin $skin
