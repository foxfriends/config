define-command -docstring "use broot to find and open a file" broot -params .. %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/broot-fifo"
    mkfifo ${output}
    if [ "$TERM" = 'xterm-kitty' ]; then 
        kitty @ new-window --new-tab --no-response --cwd $PWD bash -cl "${kak_config}/scripts/broot --conf \"${kak_config}/../broot/conf-kak.toml\" $@ > ${output}"
    elif [ -n "$TMUX" ]; then
        tmux new-window bash -cl "${kak_config}/scripts/broot --conf \"${kak_config}/../broot/conf-kak.toml\" $@ > ${output}" 
    fi
    cat ${output}
    rm -r ${outdir}
  }
}
