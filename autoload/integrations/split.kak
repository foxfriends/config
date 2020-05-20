define-command -docstring "split the window vertically" split-below %{
    nop %sh{
        kitty @ launch --no-response --location hsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -docstring "split the window vertically" split-above %{
    nop %sh{
        kitty @ launch --no-response --location hsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -docstring "split the window horizontally" split-left %{
    nop %sh{
        kitty @ launch --no-response --location vsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}

define-command -docstring "split the window horizontally" split-right %{
    nop %sh{
        kitty @ launch --no-response --location vsplit --cwd "$PWD" $(which kak) -c "$kak_client_pid"
    }
}
