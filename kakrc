# plugins
source "%val{config}/plugins.kak"

# visuals
colorscheme %sh{echo ${skin:-"onedark"}}
add-highlighter global/ number-lines -separator ' │ ' -hlcursor
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces -lf '¬' -spc '·' -nbsp '␣' -tab '⇥'

# tabulation
set global tabstop 4
set global indentwidth 4
map global insert <s-tab> '<esc><i'

# swap leader to <space>
map global normal , <space>
map global normal <space> ,

# get hover info
map global insert <c-k> '<a-;>: lsp-hover<ret>'
map global normal <c-k> ': lsp-hover<ret>'

# insert mode word delete
map global insert <a-backspace> '<a-;>b<a-;><a-d>'
map global insert <a-del> '<a-;>w<a-;><a-d>'

# word movement with arrow keys in insert mode
map global normal <a-right> 'w'
map global normal <a-left> 'b'
map global insert <a-right> '<a-;>w'
map global insert <a-left> '<a-;>b'

# user mode commands
map global user r ': toggle-ranger<ret>' -docstring 'select files in ranger'
map global user z ': w<ret>' -docstring 'save'
map global user Z ': wq<ret>' -docstring 'save and quit'
map global user , ': edit ~/.config/kak/kakrc<ret>' -docstring 'open configuration file'
map global user '\' ': ranger<ret>' -docstring 'use ranger to open a file'
map global user w '%s +$<ret>d<space>' -docstring 'trim whitespace from end of lines'
map global user k ': enter-user-mode lsp<ret>' -docstring 'lsp'
map global user f ': format<ret>' -docstring 'format'
map global user g ': enter-user-mode git<ret>' -docstring 'git'

# alias for old habits
alias global wqa write-all-quit
alias global W write
alias global Wq write-quit
alias global WQ write-quit
alias global Wqa write-all-quit
alias global WQa write-all-quit
alias global WQA write-all-quit

declare-user-mode git
map global git a ': git add<ret>' -docstring 'add current file'
map global git A ': git add --all<ret>' -docstring 'add all files'
map global git c ': git commit<ret>' -docstring 'commit'
map global git s ': git status<ret>' -docstring 'status'
map global git j ': git next-hunk<ret>' -docstring 'goto next hunk'
map global git k ': git prev-hunk<ret>' -docstring 'goto previous hunk'

hook global BufWritePost .* "git show-diff"
hook global BufCreate .* "git show-diff"
