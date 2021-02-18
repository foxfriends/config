# plugins
source "%val{config}/plugins.kak"

evaluate-commands %sh{
    if command -v rg >/dev/null; then
        echo "set-option global grepcmd 'rg --vimgrep'"
    else
        echo "nop"
    fi
}

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
map global user w '%s +$<ret><a-d><space>' -docstring 'trim whitespace from end of lines'
map global user l ': enter-user-mode lsp<ret>' -docstring 'lsp'
map global user k ': enter-user-mode split<ret>' -docstring 'split'
map global user f ': format<ret>' -docstring 'format'
map global user g ': enter-user-mode git<ret>' -docstring 'git'
map global user b ': build<ret>' -docstring 'build'
map global user p ': broot<ret>' -docstring 'broot'
map global user t ': enter-user-mode todo<ret>' -docstring 'todo'
map global user '\' ': joshuto<ret>' -docstring 'joshuto'
map global user '|' ': ranger<ret>' -docstring 'ranger'

map global buffers z ': notes<ret>'            -docstring 'notes'
map global buffers t ': todos<ret>'            -docstring 'notes'

# alias for old habits
alias global wqa write-all-quit
alias global W write
alias global Wq write-quit
alias global WQ write-quit
alias global Wqa write-all-quit
alias global WQa write-all-quit
alias global WQA write-all-quit

define-command -docstring 'set buffer filetype <type>' -params 1 sf %{
    set buffer filetype %arg{1}
}

declare-user-mode split
map global split h ': split-left<ret>' -docstring 'split left'
map global split l ': split-right<ret>' -docstring 'split right'
map global split k ': split-above<ret>' -docstring 'split above'
map global split j ': split-below<ret>' -docstring 'split below'

declare-user-mode git
map global git a ': git add<ret>' -docstring 'add current file'
map global git A ': git add --all<ret>' -docstring 'add all files'
map global git c ': git commit<ret>' -docstring 'commit'
map global git s ': git status<ret>' -docstring 'status'
map global git j ': git next-hunk<ret>' -docstring 'goto next hunk'
map global git k ': git prev-hunk<ret>' -docstring 'goto previous hunk'
map global git h ': merge-take-ours<ret>' -docstring 'take first merge conflict option'
map global git l ': merge-take-theirs<ret>' -docstring 'take second merge conflict option'
map global git m ': merge-next-conflict<ret>' -docstring 'next merge conflict'
map global git i ': gh issue list -a foxfriends<ret>' -docstring 'list issues'

hook global BufWritePost .* "git show-diff"
hook global BufCreate .* "git show-diff"

def find -params 1 -shell-script-candidates %{ find -type f } %{ edit %arg{1} }

hook global BufCreate .*[.]ya?ml %{
    set buffer tabstop 2
    set buffer indentwidth 2
}


declare-option str copycmd
evaluate-commands %sh{
    if command -v rg >/dev/null; then
        echo "set-option global grepcmd 'rg --vimgrep'"
    else
        echo "nop"
    fi
}

evaluate-commands %sh{
    case $(uname) in
    Darwin)
        echo "set global copycmd 'pbcopy'"
        ;;
    Linux)
        echo "set global copycmd 'xclip -sel c'"
        ;;
    *)
        echo "nop"
        ;;
    esac
}

map global user y ': nop %sh{printf "%s" "${kak_selection}" | ${kak_opt_copycmd}}<ret>' -docstring 'copy to system clipboard'
