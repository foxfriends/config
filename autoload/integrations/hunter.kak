define-command -docstring "use hunter to find and open a file" hunter %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/hunter-fifo"
    mkfifo ${output}
    if [ "$TERM" = 'xterm-kitty' ]; then
        kitty @ new-window --new-tab --no-response --cwd $PWD bash -cl "ranger --choosefile=\"${output}\" --selectfile=\"${kak_buffile}\""
    elif [ -n "$TMUX" ]; then
        tmux new-window bash -cl "ranger --choosefile=\"${output}\" --selectfile=\"${kak_buffile}\""
    fi
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
