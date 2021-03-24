# https://github.com/sharkdp/fd
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module tool-find-fd %{
    check-cmd fd
    set-option global findcmd 'fd -t f'
}
