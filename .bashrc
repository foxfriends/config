# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Various settings

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
if [ $(uname) != 'Darwin' ]; then
  shopt -s globstar
fi

# append to the history file, don't overwrite it
shopt -s histappend

# History

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Prompt

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  # detect a chroot so it can be shown
  debian_chroot=$(cat /etc/debian_chroot)
fi
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Various programs

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# run the custom scripts in the config directory

for file in $(ls "$HOME/.config/bash/"); do
  . "$HOME/.config/bash/$file"
done

