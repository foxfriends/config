function reskin --description 'Change the colour schemes of all the things that need to be changed'
    set -Ux skin $argv[1]

    if test "$TERM" = "xterm-kitty"
        kitty @ set-colors -a -c ~/.config/kitty/colors/$skin.conf
    end

    source ~/.config/fish/colors/$skin.fish
    set -gx syncat_active_style $skin
end
