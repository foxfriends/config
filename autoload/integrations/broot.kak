define-command -docstring "use broot to find and open a file" broot %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/broot-fifo"
    mkfifo ${output}
    filedir=$(dirname "${kak_buffile}")
    kitty @ new-window --new-tab --no-response --cwd $PWD bash -cl "broot \"${filedir}\" > ${output}"
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
