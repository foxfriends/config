define-command -docstring "use fzf to find and open a file" fzf %{
  evaluate-commands %sh{
    outdir=$(mktemp -d -t kak-temp-XXXXXXXX)
    output="$outdir/fzf-fifo"
    mkfifo ${output}
    cmd="fzf --preview \"syncat {} -en\" > ${output}"
    if command -v fd > /dev/null; then
      cmd="fd -t f -L -E .git -E node_modules -E target -E dist -E build -E .cache | ${cmd}"
    fi
    kitty @ new-window --new-tab --no-response --cwd $PWD bash -cl "${cmd}"
    result=$(cat ${output})
    if test -f "${result}"; then
      echo "edit! -existing %{${result}}"
    fi
    rm -r ${outdir}
  }
}
