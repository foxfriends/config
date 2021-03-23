define-command -hidden is-grep %{
     evaluate-commands %sh{
         command -v grep >/dev/null || echo 'fail command grep not found'
     }
}

provide-module tool-grep-grep %{
    is-grep
    set-option global grepcmd 'grep -RHn'
}
