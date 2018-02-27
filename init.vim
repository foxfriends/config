if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'jparise/vim-graphql'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/sessionman.vim'
Plug 'lrvick/Conque-Shell'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'kshenoy/vim-signature'
call plug#end()

filetype plugin on
set nocompatible
set backspace=2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set textwidth=100
set mouse=a
set number
syntax on
colorscheme onedark

"Splitting, atom style
imap <C-k><left> <C-o>:abo vsp %<CR>
imap <C-k><h <C-o>:abo vsp %<CR>
imap <C-k><right> <C-o>:bel vsp %<CR>
imap <C-k>l <C-o>:bel vsp %<CR>
imap <C-k><up> <C-o>:abo sp %<CR>
imap <C-k>k <C-o>:abo sp %<CR>
imap <C-k><down> <C-o>:bel sp %<CR>
imap <C-k>j <C-o>:bel sp %<CR>

nmap <C-k><left> :abo vsp %<CR>
nmap <C-k><h :abo vsp %<CR>
nmap <C-k><right> :bel vsp %<CR>
nmap <C-k>l :bel vsp %<CR>
nmap <C-k><up> :abo sp %<CR>
nmap <C-k>k :abo sp %<CR>
nmap <C-k><down> :bel sp %<CR>
nmap <C-k>j :bel sp %<CR>

nmap g, :vsp ~/.config/nvim/init.vim<CR>

"Git
nmap gs :Gstatus<CR>
nmap gc :Gcommit<CR>
nmap gp :Gpush<CR>
nmap ga :silent !git add -A<CR>
nmap + :silent !git add %<CR>
nmap - :silent !git reset %<CR><C-l>
let g:gitgutter_diff_base = 'HEAD'

"Easy motion
let g:EasyMotion_smartcase = 1
nmap <Leader> <Plug>(easymotion-prefix)
nmap <Enter> <Plug>(easymotion-bd-w)
nmap gl <Plug>(easymotion-bd-jk)
nmap g<S-l> <Plug>(easymotion-overwin-line)
nmap <C-s> <Plug>(easymotion-overwin-f)
imap <C-s> <C-o><Plug>(easymotion-overwin-f)

"Session management
let v:this_session = 'default'
let sessionman_save_on_exit = 1
nmap ss :SessionSave<CR>
nmap sa :SessionSaveAs<CR>
nmap so :SessionOpen default<CR>
nmap sl :SessionList<CR>

"Language server integration
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'lhaskell': ['hie', '--lsp'],
    \ 'ruby': ['language_server-ruby'],
    \ }
nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
inoremap <C-Space> <C-x><C-o>

"Tree view
map <C-\> :NERDTreeToggle<CR>

"Commenting
nmap <C-_> <leader>ci
vmap <C-_> <leader>ci
imap <C-_> <C-o><leader>ci

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'

"CtrlP
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn|build)|node_modules|Pods|elm-stuff)$',
    \ 'file': '\v\.(exe|so|dll|DS_store|swp)$',
    \ }

"Conque-Shell
nmap <F9> :ConqueTermVSplit bash<CR>

"Rebind escape to capslock while vim is open
au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
