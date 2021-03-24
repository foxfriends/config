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
map global insert <c-a> '<a-;>: lsp-hover<ret>'
map global normal <c-a> ': lsp-hover<ret>'

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
map global user w ': trim-eol<ret>' -docstring 'trim-eol'
map global user l ': enter-user-mode lsp<ret>' -docstring 'lsp'
map global user k ': enter-user-mode windowing<ret>' -docstring 'windowing'
map global user f ': format<ret>' -docstring 'format'
map global user g ': enter-user-mode git<ret>' -docstring 'git'
map global user p ': broot<ret>' -docstring 'broot'
map global user '\' ': joshuto<ret>' -docstring 'joshuto'
map global user '|' ': ranger<ret>' -docstring 'ranger'

# alias for old habits
alias global wqa write-all-quit
alias global W write
alias global Wq write-quit
alias global WQ write-quit
alias global Wqa write-all-quit
alias global WQa write-all-quit
alias global WQA write-all-quit
