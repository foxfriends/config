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
        if [ "$TERM" = 'xterm-kitty' ]; then
            printf 'kitty-split-right'
        elif [ -n "$TMUX" ]; then
            printf "tmux-terminal-horizontal '%s' -c '%s'" "$(which kak)" "$kak_client_pid"
        else
            printf "nop"
        fi
    }
}

define-command -docstring 'Split a pane to the left' split-left %{
    evaluate-commands %sh{
        if [ "$TERM" = 'xterm-kitty' ]; then
            printf 'kitty-split-left'
        elif [ -n "$TMUX" ]; then
            printf "tmux-terminal-horizontal '%s' -c '%s'" "$(which kak)" "$kak_client_pid"
        else
            printf "nop"
        fi
    }
}

define-command -docstring 'Split a pane below' split-below %{
    evaluate-commands %sh{
        if [ "$TERM" = 'xterm-kitty' ]; then
            printf 'kitty-split-below'
        elif [ -n "$TMUX" ]; then
            printf "tmux-terminal-vertical '%s' -c '%s'" "$(which kak)" "$kak_client_pid"
        else
            printf "nop"
        fi
    }
}

define-command -docstring 'Split a pane above' split-above %{
    evaluate-commands %sh{
        if [ "$TERM" = 'xterm-kitty' ]; then
            printf 'kitty-split-above'
        elif [ -n "$TMUX" ]; then
            printf "tmux-terminal-vertical '%s' -c '%s'" "$(which kak)" "$kak_client_pid"
        else
            printf "nop"
        fi
    }
}
