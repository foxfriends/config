provide-module tool-jira %{
    check-cmd jira

    define-command jira -docstring 'passthrough to jira cli' -params .. %{
        info %sh{ jira $@ }
    }
}

try %{ require-module tool-jira } catch {
    echo -debug "jira not loaded"
}
