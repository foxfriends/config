hook global BufWritePost .* "git show-diff"
hook global BufCreate .* "git show-diff"
