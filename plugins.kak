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

plug "andreyorst/smarttab.kak" defer smarttab %{
    # when `backspace' is pressed, 4 spaces are deleted at once
    set-option global softtabstop 4
} config %{
    hook global WinSetOption filetype=(.*) expandtab
    hook global WinSetOption filetype=(makefile|gas) noexpandtab
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
} noload config %{
    eval %sh{kak-lsp --config "${kak_config}/kak-lsp.toml" --kakoune -s $kak_session}

    hook global WinSetOption filetype=(rust|haskell|literate-haskell) %{
        lsp-enable-window
    }
    set-option global lsp_diagnostic_line_warning_sign "⚠"
}

plug 'https://gitlab.com/Screwtapello/kakoune-cargo'
