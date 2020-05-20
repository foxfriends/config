define-command -docstring "use fzf to find and open a file" fzf %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="$outdir/fzf-fifo"
    mkfifo ${output}
    kitty @ launch --location hsplit --no-response --cwd $PWD bash -c "fzf > ${output}"
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
