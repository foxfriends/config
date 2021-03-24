#                                     Tools
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Tools are external programs run for their output. This output is often placed
# into a buffer for further actions to be taken on it, or shown in an info
# message.
#
# Supported tools:
# *   copy
# *   find
# *   grep
# *   format
# *   lint
# *   git
# *   jira
# *   gh
# *   man

declare-option -docstring "name of the client to perform tools actions in" \
    str workclient

define-command check-cmd -params 1 %{
    evaluate-commands %sh{
        command -v "$1" > /dev/null || echo "fail $1: command not found"
    }
}
