define-command -docstring "use ranger to find and open a file" ranger %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="${outdir}/ranger-fifo"
    mkfifo ${output}
    kitty @ new-window --new-tab --no-response --cwd $PWD ranger --choosefile="${output}" --selectfile="${kak_buffile}"
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
