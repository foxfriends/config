# https://swaywm.org/
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

define-command -hidden is-sway %{
    # ensure that we're running in sway
    evaluate-commands %sh{
        [ -n "$SWAYSOCK" ] || echo 'fail sway not detected'
    }
}

provide-module windowing-sway-init %{
    is-sway

    define-command -params 1.. swaymsg -docstring "swaymsg" %{
        nop %sh{ swaymsg "$@" }
    }

    define-command sway-new -params 1.. -shell-completion -docstring "Create a new window" %{
        swaymsg exec "%arg{@}"
    }

    define-command sway-new-vertical -params 1.. -shell-completion -docstring "Create a new window below" %{
        swaymsg split v, exec "%arg{@}"
    }

    define-command sway-new-horizontal -params 1.. -shell-completion -docstring "Create a new window on the right" %{
        swaymsg split h, exec "%arg{@}"
    }

    define-command sway-terminal-horizontal -params 1.. -shell-completion -docstring "Create a new terminal on the right" %{
        sway-new-horizontal %opt{termcmd} "%arg{@}"
    }

    define-command sway-terminal-vertical -params 1.. -shell-completion -docstring "Create a new terminal below" %{
        sway-new-vertical %opt{termcmd} "%arg{@}"
    }

    define-command sway-terminal -params 1.. -shell-completion -docstring "Create a new terminal in the current container" %{
        sway-new %opt{termcmd} %arg{@}
    }

    declare-user-mode sway
    map global sway n :sway-new<ret> -docstring "new window in the current container"
    map global sway h :sway-new-horizontal<ret> -docstring '← new window on the left'
    map global sway l :sway-new-horizontal<ret> -docstring '→ new window on the right'
    map global sway k :sway-new-vertical<ret> -docstring '↑ new window above'
    map global sway j :sway-new-vertical<ret> -docstring '↓ new window below'
}

provide-module windowing-sway-bind %{
    is-sway

    alias global terminal       sway-terminal
    alias global terminal-left  sway-terminal-horizontal
    alias global terminal-right sway-terminal-horizontal
    alias global terminal-above sway-terminal-vertical
    alias global terminal-below sway-terminal-vertical
}
