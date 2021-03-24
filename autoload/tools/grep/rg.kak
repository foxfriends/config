# https://github.com/BurntSushi/ripgrep
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module tool-grep-rg %{
    check-cmd rg
    set-option global grepcmd 'rg --vimgrep'
}
