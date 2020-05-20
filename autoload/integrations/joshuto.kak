define-command -docstring "use joshuto to find and open a file" joshuto %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/joshuto-fifo"
    mkfifo ${output}
    kitty @ new-window --new-tab --no-response --cwd $PWD joshuto --path="$(dirname "${kak_buffile}")" --choosefile="${output}"
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
