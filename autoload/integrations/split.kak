define-command -hidden kitty-split-below %{
    nop %sh{
        kitty @ launch --no-response --location hsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -hidden kitty-split-above %{
    nop %sh{
        kitty @ launch --no-response --location hsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -hidden kitty-split-left %{
    nop %sh{
        kitty @ launch --no-response --location vsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -hidden kitty-split-right %{
    nop %sh{
        kitty @ launch --no-response --location vsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -docstring 'Split a pane to the right' split-right %{
    evaluate-commands %sh{
        case "$TERM" in
            'xterm-kitty')
                printf 'kitty-split-right'
                ;;
            *)
                printf 'nop'
                ;;
        esac
    }
}

define-command -docstring 'Split a pane to the left' split-left %{
    evaluate-commands %sh{
        case "$TERM" in
            'xterm-kitty')
                printf 'kitty-split-left'
                ;;
            *)
                printf 'nop'
                ;;
        esac
    }
}

define-command -docstring 'Split a pane below' split-below %{
    evaluate-commands %sh{
        case "$TERM" in
            'xterm-kitty')
                printf 'kitty-split-below'
                ;;
            *)
                printf 'nop'
                ;;
        esac
    }
}

define-command -docstring 'Split a pane above' split-above %{
    evaluate-commands %sh{
        case "$TERM" in
            'xterm-kitty')
                printf 'kitty-split-above'
                ;;
            *)
                printf 'nop'
                ;;
        esac
    }
}
