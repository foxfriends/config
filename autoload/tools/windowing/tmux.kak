provide-module windowing-tmux %{
    require-module tmux
    alias global terminal       tmux-new
    alias global focus          tmux-focus
    alias global terminal-left  tmux-new-horizontal
    alias global terminal-right tmux-new-horizontal
    alias global terminal-above tmux-new-vertical
    alias global terminal-below tmux-new-vertical
}
