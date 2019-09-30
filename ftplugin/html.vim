set tabstop=2
set softtabstop=2
set shiftwidth=2
nnoremap g' :vsp package.json<CR>

nmap } :BreezeNextSibling<CR>
nmap { :BreezePrevSibling<CR>
nmap ]] :BreezeFirstChild<CR>
nmap ]} :BreezeParent<CR>:BreezeNextSibling<CR>
nmap [{ :BreezePrevSibling<CR>:BreezeLastChild<CR>
nnoremap gt :BreezeJumpF<CR>
nnoremap gT :BreezeJumpB<CR>
