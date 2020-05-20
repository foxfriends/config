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
map global insert <a-backspace> '<esc>b<a-d>i'
map global insert <a-del> '<esc>w<a-d>i'

# word movement with arrow keys in insert mode
map global normal <a-right> 'w'
map global normal <a-left> 'b'
map global insert <a-right> '<a-;>w'
map global insert <a-left> '<a-;>b'

# user mode commands
map global user z ': w<ret>' -docstring 'save'
map global user , ': edit ~/.config/kak/kakrc<ret>' -docstring 'open configuration file'
map global user w '%s +$<ret>d<space>' -docstring 'trim whitespace from end of lines'
map global user l ': enter-user-mode lsp<ret>' -docstring 'lsp'
map global user k ': enter-user-mode split<ret>' -docstring 'split'
map global user f ': format<ret>' -docstring 'format'
map global user g ': enter-user-mode git<ret>' -docstring 'git'
map global user b ': build<ret>' -docstring 'build'
map global user p ': fzf<ret>' -docstring 'fzf'
map global user '\' ': joshuto<ret>' -docstring 'joshuto'

# alias for old habits
alias global wqa write-all-quit
alias global W write
alias global Wq write-quit
alias global WQ write-quit
alias global Wqa write-all-quit
alias global WQa write-all-quit
alias global WQA write-all-quit

declare-user-mode split
map global split h ': split-left<ret>' -docstring 'split left'
map global split l ': split-left<ret>' -docstring 'split right'
map global split k ': split-left<ret>' -docstring 'split above'
map global split k ': split-left<ret>' -docstring 'split below'

declare-user-mode git
map global git a ': git add<ret>' -docstring 'add current file'
map global git A ': git add --all<ret>' -docstring 'add all files'
map global git c ': git commit<ret>' -docstring 'commit'
map global git s ': git status<ret>' -docstring 'status'
map global git j ': git next-hunk<ret>' -docstring 'goto next hunk'
map global git k ': git prev-hunk<ret>' -docstring 'goto previous hunk'

hook global BufWritePost .* "git show-diff"
hook global BufCreate .* "git show-diff"

def find -params 1 -shell-script-candidates %{ find -type f } %{ edit %arg{1} }
