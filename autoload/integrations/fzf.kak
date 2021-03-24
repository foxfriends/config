define-command fzf -docstring "use fzf to find and open a file" %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="$outdir/fzf-fifo"
    mkfifo ${output}
    cmd="fzf --preview \"syncat {} -en\" > ${output}"
    if command -v fd > /dev/null; then
      cmd="fd -t f -L -E .git -E node_modules -E target -E dist -E build -E .cache -E vendor | ${cmd}"
    fi
    if [ "$TERM" = 'xterm-kitty' ]; then
        kitty @ new-window --new-tab --no-response --cwd "$PWD" bash -cl "${cmd}"
    elif [ -n "$TMUX" ]; then
        tmux new-window bash -cl "${cmd}"
    fi
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
