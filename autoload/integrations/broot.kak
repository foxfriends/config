define-command -docstring "use broot to find and open a file" broot -params .. %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/broot-fifo"
    mkfifo ${output}
    kitty @ new-window --new-tab --no-response --cwd $PWD bash -cl "${kak_config}/scripts/broot --conf \"${kak_config}/../broot/conf-kak.toml\" $@ > ${output}"
    cat ${output}
    rm -r ${outdir}
  }
}
