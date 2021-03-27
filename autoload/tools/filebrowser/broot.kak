# https://github.com/Canop/broot/
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module filebrowser-broot %{
    require-module detection
    check-cmd broot
    alias global browse broot
}
