# https://man7.org/linux/man-pages/man1/grep.1.html
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module tool-grep-grep %{
    check-cmd grep
    set-option global grepcmd 'grep -RHn'
}
