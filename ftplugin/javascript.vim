nnoremap g' :vsp package.json<CR>

"nnoremap <silent> H :FlowType<CR>
"nnoremap <silent> gd :FlowJumpToDef<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
inoremap <C-Space> <C-x><C-o>

let g:javascript_plugin_flow = 1

set tabstop=2
set softtabstop=2
set shiftwidth=2
