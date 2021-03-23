define-command -hidden is-rg %{
     evaluate-commands %sh{
         command -v rg >/dev/null || echo 'fail command rg not found'
     }
}

provide-module tool-grep-rg %{
    is-rg
    set-option global grepcmd 'rg --vimgrep'
}
