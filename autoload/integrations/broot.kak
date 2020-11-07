define-command -docstring "use broot to find and open a file" broot %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/broot-fifo"
    mkfifo ${output}
    filedir=$(dirname "${kak_buffile}")
    kitty @ new-window --new-tab --no-response --cwd $PWD bash -cl "${kak_config}/scripts/broot --conf \"${kak_config}/../broot/conf-kak.toml\" \"${filedir}\" > ${output}"
    cat ${output}
    rm -r ${outdir}
  }
}
