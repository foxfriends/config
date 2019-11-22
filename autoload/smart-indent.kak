define-command -hidden smart-indent %{
    try %{
        execute-keys -draft Gh <a-k> \A\h+\z <ret> <a-gt>
      execute-keys <esc>gh<a-i><space>li
    } catch %{
        # TODO: this could be smarter and indent to the next tab stop instead of just inserting 4 chars
        execute-keys <space><space><space><space>
    }
}

define-command -hidden smart-unindent %{
    execute-keys -draft <a-lt>
}
