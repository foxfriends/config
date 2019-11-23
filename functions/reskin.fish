function reskin --description 'Change the colour schemes of all the things that need to be changed'
    set -gx skin $argv[1]
    
    kitty @ set-colors ~/.config/kitty/colors/$skin.conf
    source ~/.config/fish/colors/$skin.fish
end
