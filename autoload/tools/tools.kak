#                                     Tools
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Tools are external programs run for their output, which is opened in a buffer.
# From that output it is usually possible to take further actions, such as
# jumping to a search result.
#
# Supported tools:
# *   grep
# *   fmt
# *   lint
# *   build

declare-option -docstring "name of the client to show tools output in" \
    str tools_tool_client

declare-option -docstring "name of the client to perform tools actions in" \
    str tools_action_client

define-command tools-focus -docstring "focus the tools client" %{
    set-option global tools_action_client %val{client}
    focus %opt{tools_tool_client}
}

define-command tools-blur -docstring "return focus from the tools client back to the previous client" %{
    focus %opt{tools_action_client}
}
