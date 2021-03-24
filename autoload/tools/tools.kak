#                                     Tools
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Tools are external programs that are run and used without leaving the kakoune
# experience.
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
