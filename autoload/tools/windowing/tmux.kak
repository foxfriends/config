provide-module windowing-tmux %{
    require-module tmux
    alias global terminal       tmux-popup
    alias global terminal-tab   tmux-new
    alias global terminal-left  tmux-new-horizontal
    alias global terminal-right tmux-new-horizontal
    alias global terminal-above tmux-new-vertical
    alias global terminal-below tmux-new-vertical
    alias global focus          tmux-focus
}
