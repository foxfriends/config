set tabstop=2
set softtabstop=2
set shiftwidth=2
nnoremap <buffer> g' :vsp package.json<CR>

nnoremap <buffer> } :BreezeNextSibling<CR>
nnoremap <buffer> { :BreezePrevSibling<CR>
nnoremap <buffer> ]] :BreezeFirstChild<CR>
nnoremap <buffer> [[ :BreezeParent<CR>
nnoremap <buffer> ]} :BreezeParent<CR>:BreezeNextSibling<CR>
nnoremap <buffer> [{ :BreezePrevSibling<CR>:BreezeLastChild<CR>
nnoremap <buffer> gt :BreezeJumpF<CR>
nnoremap <buffer> gT :BreezeJumpB<CR>
