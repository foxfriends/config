# plugins
source "%val{config}/plugins.kak"

# custom highlighting files
source "%val{config}/highlighting/rust.kak"

# visuals
colorscheme onedark
add-highlighter global/ number-lines -separator ' │ ' -hlcursor
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces -lf '¬' -spc '·' -nbsp '␣' -tab '⇥'

# tabulation
set global tabstop 4
set global indentwidth 4

# swap leader to <space>
map global normal , <space>
map global normal <space> ,

# indent/unindent while in insert mode
map global insert <s-tab> '<a-;><lt>'
map global insert <tab> '<a-;><gt>'

# user mode commands
map global user r ': toggle-ranger<ret>' -docstring 'select files in ranger'
map global user z ': w<ret>' -docstring 'save'
map global user Z ': wq<ret>' -docstring 'save and quit'
map global user , ': edit ~/.config/kak/kakrc<ret>' -docstring 'open configuration file'
map global user '\' ': ranger<ret>' -docstring 'use ranger to open a file'

# alias for old habits
alias global wqa write-all-quit
