provide-module tool-copy-xclip %{
    require-module detection
    check-cmd xclip

    set global copycmd 'xclip -sel c'
}
