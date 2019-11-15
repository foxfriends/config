source "%val{config}/plugins/plug.kak/rc/plug.kak"
source "%val{config}/highlighting/rust.kak"

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

plug "andreyorst/smarttab.kak" defer smarttab %{
    # set-option global softtabstop 4
} config %{
    # expandtab
}

plug "andreyorst/powerline.kak" defer powerline %{
    powerline-theme tomorrow-night
} config %{
    powerline-start
}

plug 'occivink/kakoune-vertical-selection'

plug 'delapouite/kakoune-text-objects' %{
    text-object-map
}

plug 'delapouite/kakoune-mirror' %{
    map global normal "'" ': enter-user-mode -lock mirror<ret>'
}

plug "ul/kak-lsp" do %{
    cargo install --locked --force --path .
} config %{
    lsp-enable
    set-option global lsp_diagnostic_line_warning_sign "⚠"
}

colorscheme onedark
add-highlighter global/ number-lines

set global tabstop 4
set global indentwidth 4

map global normal , <space>
map global normal <space> ,

map global insert <s-tab> '<a-;><lt>'
map global insert <tab> '<a-;><gt>'

map global user r ': toggle-ranger<ret>' -docstring 'select files in ranger'
map global user z ': w<ret>' -docstring 'save'
map global user Z ': wq<ret>' -docstring 'save and quit'
map global user , ': edit ~/.config/kak/kakrc<ret>' -docstring 'open configuration file'

alias global wqa write-all-quit
