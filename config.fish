#! /usr/bin/env fish

if command -v tmux >/dev/null && test -z "$TMUX"
    tmux attach -t default || tmux new -s default
end

set -q skin; or set -Ux skin onedark
reskin $skin

fundle plugin 'edc/bass'
fundle init

if command -v pazi >/dev/null
  status --is-interactive; and pazi init fish | source
end

if command -v kitty >/dev/null
  kitty + complete setup fish | source
  alias icat="kitty +kitten icat"
end

if command -v diesel >/dev/null
  diesel completions fish | source
end

if command -v deno >/dev/null
  deno completions fish | source
end

if command -v rustup >/dev/null
  rustup completions fish | source
end

if command -v gh > /dev/null
  gh completion -s fish | source
end

if test -f ~/.nvm/nvm.sh
  bass source ~/.nvm/nvm.sh
end

if command -v aws aws-mfa-secure > /dev/null
  alias aws="aws-mfa-secure session"
end

# enable colors in grep by default
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# replace ls with exa
if command -v exa >/dev/null
  alias ls='exa'
  alias ll='exa -alg --git'
  alias lt='exa -T'
  alias llt='exa -lT'
  alias l='exa'
end

# Local stuff can be put in ~/.config.fish
if test -f "$HOME/.config.fish" 
  . "$HOME/.config.fish"
end

if test -x /usr/bin/lesspipe
  eval (env SHELL=/bin/sh lesspipe)
end
