try %{
    check-cmd jira

    define-command jira -docstring 'passthrough to jira cli' -params .. %{
        info %sh{ jira $@ }
    }
} catch %{}
