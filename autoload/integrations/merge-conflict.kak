define-command merge-next-conflict -docstring 'Navigate to next merge conflict' %{
    try %{ execute-keys /<lt><lt><lt><lt><lt><lt><lt><ret> }
}

define-command merge-take-ours -docstring 'Takes the first set of changes' %{
    try %{
        execute-keys x<a-k>^<lt><lt><lt><lt><lt><lt><lt><ret>d
        execute-keys /========<ret>?<gt><gt><gt><gt><gt><gt><gt><gt><ret><a-x>d
    }
}

define-command merge-take-theirs -docstring 'Takes the second set of changes' %{
    try %{
        execute-keys x<a-k>^<lt><lt><lt><lt><lt><lt><lt><ret>?========<ret><a-x>d
        execute-keys /<gt><gt><gt><gt><gt><gt><gt><gt><ret>xd
    }
}
