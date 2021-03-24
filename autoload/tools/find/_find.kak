# Tool: find
# ‾‾‾‾‾‾‾‾‾‾
# find searches for files

declare-option -docstring "modules which implement a find provider" \
    str-list find_providers 'tool-find-fd' 'tool-find-find'
declare-option -docstring "command to perform find" str findcmd

define-command find -params 1 -shell-script-candidates %{ $kak_opt_findcmd } %{ edit %arg{1} }

hook -group find global KakBegin .* %{
    echo -debug "beginning find detection"

    evaluate-commands %sh{
        set -- ${kak_opt_find_providers}
        if [ $# -gt 0 ]; then
            echo "try %{"
            while [ $# -gt 0 ]; do
                echo "  require-module ${1}"
                echo "  echo -debug ${1} loaded"
                echo "} catch %{ "
                shift
            done
            echo "  echo -debug no find provider found"
            echo "}"
        fi
    }
}
