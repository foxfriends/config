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

if test "$TERM" = "linux"
  echo -en "\e]P0282C34" #black
  echo -en "\e]P83E4452" #darkgrey
  echo -en "\e]P1E06C75" #darkred
  echo -en "\e]P9BE5046" #red
  echo -en "\e]P298C378" #darkgreen
  echo -en "\e]PA98C379" #green
  echo -en "\e]P3E5C07B" #brown
  echo -en "\e]PBD19A66" #yellow
  echo -en "\e]P461AFEF" #darkblue
  echo -en "\e]PC61AFEF" #blue
  echo -en "\e]P5C678DD" #darkmagenta
  echo -en "\e]PDC678DD" #magenta
  echo -en "\e]P656B6C2" #darkcyan
  echo -en "\e]PE56B6C2" #cyan
  echo -en "\e]P7ABB2BF" #lightgrey
  echo -en "\e]PF5C6370" #white
  clear #for background artifacting
end

set -q skin; or set -Ux skin onedark
reskin $skin
