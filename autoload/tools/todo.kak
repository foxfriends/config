define-command todo -docstring 'Add a todo to the list' -params 1 %{
    nop %sh{ echo "$kak_buffile $kak_cursor_line $1" >> "$kak_config/todo" }
}

define-command todone -docstring 'Remove a todo from the list' %{
    evaluate-commands -itersel %<
        nop %sh{
            sed -i "/^$(echo "$kak_buffile" | sed -E 's#([/.])#\\\1#g') $kak_cursor_line/d" "$kak_config/todo"
        }
    >
}

define-command -hidden todo-from-src -docstring 'Add a todo to the list' %{
    evaluate-commands -draft -itersel %<
        try %{
            execute-keys xsTODO:\s+\K<ret>Gl
            todo %val{selection}
        }
    >
}

define-command todos -docstring 'Open todo list' %{
  evaluate-commands %sh{
    printf "edit $kak_config/todo"
  }
}

declare-user-mode todo
map global todo t ': todo-from-src<ret>' -docstring 'todo'
map global todo d ': todone<ret>' -docstring 'done'
