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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/sessionman.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
set showcmd
syntax on
colorscheme onedark

"Splitting, atom style
map <C-k><left> :abo vsp %<CR>
map <C-k><h :abo vsp %<CR>
map <C-k><right> :bel vsp %<CR>
map <C-k>l :bel vsp %<CR>
map <C-k><up> :abo sp %<CR>
map <C-k>k :abo sp %<CR>
map <C-k><down> :bel sp %<CR>
map <C-k>j :bel sp %<CR>

"Git
nmap gits :Gstatus<CR>
nmap gitc :Gcommit<CR>
nmap gitp :Gpush<CR>
nmap + :silent !git add %<CR>
nmap - :silent !git reset %<CR>
let g:gitgutter_diff_base = 'HEAD'

"Easy motion
let g:EasyMotion_smartcase = 1
nmap <Leader> <Plug>(easymotion-prefix)
nmap <Enter> <Plug>(easymotion-bd-w)
nmap gl <Plug>(easymotion-bd-jk)
nmap <C-s> <Plug>(easymotion-overwin-f)

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
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

"Tree view
map <C-\> :NERDTreeToggle<CR>

"Commenting
nmap <C-_> <leader>ci
vmap <C-_> <leader>ci
imap <C-_> <C-o><leader>ci

"Airline
let g:airline#extensions#tabline#enabled = 0

"Rebind escape to capslock while vim is open
au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

