declare-option str buildcmd
define-command -docstring "build" build %{
    echo "%sh{ $kak_opt_buildcmd }"
}
