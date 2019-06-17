#!fish

# attach autojump
if test -f "/usr/local/Cellar/autojump/22.5.3/share/autojump/autojump.fish"
  . /usr/local/Cellar/autojump/22.5.3/share/autojump/autojump.fish
end

if test -f "/usr/share/autojump/autojump.fish"
  . "/usr/share/autojump/autojump.fish"
end

alias icat="kitty +kitten icat"
alias vi="nvim"
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
