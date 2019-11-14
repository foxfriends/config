colorscheme onedark
add-highlighter global/ number-lines

source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/fzf.kak" defer fzf %{
    set-option global fzf_terminal_command "terminal-tab kak -c %val{session} -e '%arg{@}'"
    set-option global fzf_file_command "fd --hidden -E .git -E target -E node_modules"
    set-option global fzf_highlight_command "syncat -en {}"
} config %{
    map global normal <c-p> ': fzf-mode<ret>'
}
plug 'delapouite/kakoune-buffers' %{
    map global normal ^ q
    map global normal <a-^> Q
    map global normal q b
    map global normal Q B
    map global normal <a-q> <a-b>
    map global normal <a-Q> <a-B>
    map global normal b ': enter-buffers-mode<ret>' -docstring 'buffers'
    map global normal B ': enter-user-mode -lock buffers<ret>' -docstring 'buffers (lock)'
}
plug "andreyorst/powerline.kak" defer powerline %{
    powerline-theme tomorrow-night
} config %{
    powerline-start
}

map global normal , <space>
map global normal <space> ,

map global user r ': toggle-ranger<ret>' -docstring 'select files in ranger'
map global user z ': w<ret>' -docstring 'save'
map global user Z ': wq<ret>' -docstring 'save and quit'

alias global wqa write-all-quit
