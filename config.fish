#! /usr/bin/env fish


set -q skin; or set -Ux skin onedark

if command -sq ghcup
  set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
end

if status --is-interactive
  reskin $skin
  command -sq pazi; and source (pazi init fish |psub)
  command -sq rbenv; and source (rbenv init -|psub)
  command -sq pyenv; and source (pyenv init -|psub)
  command -sq kitty; and source (kitty + complete setup fish |psub)
  command -sq diesel; and source (diesel completions fish |psub)
  command -sq deno; and source (deno completions fish |psub)
  command -sq rustup; and source (rustup completions fish |psub)
  command -sq gh; and source (gh completion -s fish |psub)
  if command -sq fnm
    source (fnm completions |psub)
    source (fnm env |psub)
  end

  command -sq aws; and alias localaws="command aws --endpoint-url=http://localhost:4566 --profile localstack"
  command -sq aws aws-mfa-secure; and alias aws="aws-mfa-secure session"

  # replace ls with exa
  if command -sq exa >/dev/null
    alias ls='exa'
    alias ll='exa -alg --git'
    alias lt='exa -T'
    alias llt='exa -lT'
    alias l='exa'
  end

  # enable colors in grep by default
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  command -sq lesspipe; and eval (env SHELL=/bin/sh lesspipe)
end

# Local stuff can be put in ~/.config.fish
test -f "$HOME/.config.fish"; and source "$HOME/.config.fish"
