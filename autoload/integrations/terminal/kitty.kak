# https://sw.kovidgoyal.net/kitty/index.html
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module term-kitty %{
    check-cmd kitty

    define-command kitty -params .. -shell-completion -docstring 'kitty' %{
        nop %sh{
            kitty $@ > /dev/null 2>&1
        }
    }

    set-option global termcmd kitty
}
