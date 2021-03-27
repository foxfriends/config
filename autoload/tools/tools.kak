# Tools
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Commands implemented by calling out to external tools and interpreting the
# results somehow.
#
# Supported tools:
# *   copy
# *   find
# *   format
# *   fuzzyfinder
# *   gh
# *   git
# *   grep
# *   jira
# *   lint
# *   man
# *   preview
# *   terminal

declare-option -docstring "name of the client to perform tools actions in" \
    str workclient

define-command evaluate-result -params 1.. %{
    terminal-tab "%val{config}/scripts/evaluate-result" "%val{session}" "%val{client}" "'%arg{@}'"
}
