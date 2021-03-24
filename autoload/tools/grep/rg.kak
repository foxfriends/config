# https://github.com/BurntSushi/ripgrep
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module tool-grep-rg %{
    require-module detection
    check-cmd rg

    set-option global grepcmd 'rg --vimgrep'
}
