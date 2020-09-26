define-command note -docstring 'Append a note to the notes file' -params 1 %{
    nop %sh{ echo "$1" >> $kak_config/notes }
}

define-command notes -docstring 'Open notes file' %{
  evaluate-commands %sh{
    printf "edit $kak_config/notes"
  }
}
