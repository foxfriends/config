""
" Help:
" ----------- | Navigation
" C-\         | Show/hide tree view
" g,          | - Open init.vim (this file)
" g'          | - Open manfest file (language dependent)
" gd          | - Go to declaration
" gl          | - Jump to line
" gL          | - Jump to line (any pane)
" C-s         | - Jump to search (1 character)
" \w          | - Jump to word (down)
" <enter>     | - Jump to word
" <F9>        | - Open an embedded terminal
" C-p         | - Fuzzy finder open file
" ----------- | Intellisense
" H           | - Hover
" <C-Space>   | - Autocomplete
" <F2>        | - Refactor (Rename)
" ----------- | Git
" gs          | - git status
" ga          | - git add -A
" gc          | - git commit
" gp          | - git push
" +           | - git add %
" -           | - git reset %
" ----------- | Windows
" C-k         | Split pane
"    left     | - to the left
"    right    | - to the right
" ----------- | Formatting
" tw          | Trim whitespace
" ta          | Easy align
"   ip=       | - align in paragraph on =
" cs          | Change surroundings
"   '"        | - from ' to "
"   []        | - from [ ([] with spaces) to ] ([] with no spaces)
" ys          | Add surroundings
"   iw'       | - ' around word 
" ds          | Remove surroundings
"   '         | - ' from
" ----------- | Sessions
" ss          | - Save session
" sa          | - Save session as
" sl          | - Load session
" so          | - Open default session
""

"Install the plugin thing if it isn't installed yet
"note that it only auto-installs the first time. Later modifications must be
"run manually with :PlugInstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Install the plugins
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'                                                          " color scheme
Plug 'sheerun/vim-polyglot'                                                          " language packs
Plug 'scrooloose/nerdtree'                                                           " tree view
Plug 'scrooloose/nerdcommenter'                                                      " ctrl-slash for comment
Plug 'vim-airline/vim-airline'                                                       " bottom bar
Plug 'vim-airline/vim-airline-themes'                                                " bottom bar colors
Plug 'ctrlpvim/ctrlp.vim'                                                            " ctrl-p fuzzy finder
Plug 'junegunn/fzf'                                                                  " idk more fuzzy finder or something
Plug 'junegunn/vim-easy-align'                                                       " auto align stuff
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " language server support
Plug 'jparise/vim-graphql'                                                           " graphql syntax highlighting
Plug 'airblade/vim-gitgutter'                                                        " git addition/deletions in the left bar
Plug 'easymotion/vim-easymotion'                                                     " jumping around
Plug 'vim-scripts/sessionman.vim'                                                    " sessions
Plug 'lrvick/Conque-Shell'                                                           " terminal inside vim
Plug 'tpope/vim-fugitive'                                                            " control git from inside vim
Plug 'tpope/vim-surround'                                                            " surround things in quotes, etc
Plug 'kshenoy/vim-signature'                                                         " handles and displays the marks
Plug 'terryma/vim-multiple-cursors'                                                  " multiple cursor support
call plug#end()

" fix the bugs?
set nocompatible
" auto indents
filetype plugin indent on
set backspace=2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" auto line wrap. don't like this feature too much tbh
"set textwidth=100
" allow mouse controls...
set mouse=a
" show line numbers
set number
" show invisibles
set list
set listchars=tab:»\ ,eol:¬,space:·
" something something idk
set cursorline

" fix the colours from being wrong
if has('unix') && !has('macunix')
  set termguicolors
endif
" pick color scheme
syntax on
colorscheme onedark

"Splitting, atom style (ctrl-k [direction])
" insert mode
imap <C-k><left> <C-o>:abo vsp %<CR>
imap <C-k><h <C-o>:abo vsp %<CR>
imap <C-k><right> <C-o>:bel vsp %<CR>
imap <C-k>l <C-o>:bel vsp %<CR>
imap <C-k><up> <C-o>:abo sp %<CR>
imap <C-k>k <C-o>:abo sp %<CR>
imap <C-k><down> <C-o>:bel sp %<CR>
imap <C-k>j <C-o>:bel sp %<CR>
" normal mode
nmap <C-k><left> :abo vsp %<CR>
nmap <C-k><h :abo vsp %<CR>
nmap <C-k><right> :bel vsp %<CR>
nmap <C-k>l :bel vsp %<CR>
nmap <C-k><up> :abo sp %<CR>
nmap <C-k>k :abo sp %<CR>
nmap <C-k><down> :bel sp %<CR>
nmap <C-k>j :bel sp %<CR>

"Open this file (g ,)
nmap g, :vsp ~/.config/nvim/init.vim<CR>

"Trim whitespace from end of lines
nnoremap tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Git
" `git status` (g s)
nmap gs :Gstatus<CR>
" `git commit` (g c)
nmap gc :Gcommit<CR>
" `git push` (g p)
nmap gp :Gpush<CR>
" `git add -A` (g a)
nmap ga :silent !git add -A<CR>
" `git add` this file (+)
nmap + :silent !git add %<CR>
" `git reset` this file (-)
nmap - :silent !git reset %<CR><C-l>
" Set the base for gutter markings
let g:gitgutter_diff_base = 'HEAD'

"Easy motion
let g:EasyMotion_smartcase = 1
"Jump to a letter, only in lower lines (\ [chars]). Kind of buggy
nmap <Leader> <Plug>(easymotion-prefix)
"Jump somewhere (Enter)
nmap <Enter> <Plug>(easymotion-bd-w)
"Go to line (g l)
nmap gl <Plug>(easymotion-bd-jk)
"Go to line in any window (g L)
nmap g<S-l> <Plug>(easymotion-overwin-line)
"Go to char in any window (Ctrl-s)
nmap <C-s> <Plug>(easymotion-overwin-f)
imap <C-s> <C-o><Plug>(easymotion-overwin-f)

" EasyAlign
xmap ta <Plug>(EasyAlign)
nmap ta <Plug>(EasyAlign)

"Session management.
"Kind of difficult to get right always, but sometimes it is quick and handy
let v:this_session = 'default'
let sessionman_save_on_exit = 1
"Save current open windows (s s)
nmap ss :SessionSave<CR>
"Save current session with name (s a)
nmap sa :SessionSaveAs<CR>
"Open some recent session, good for resuming after closing (s o)
nmap so :SessionOpen default<CR>
"Open a specific named session (s l)
nmap sl :SessionList<CR>

"Language server integration
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['flow', 'lsp'],
    \ 'javascript.jsx': ['flow', 'lsp'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'lhaskell': ['hie', '--lsp'],
    \ 'ruby': ['language_server-ruby'],
    \ }
let g:LanguageClient_autoStart = 1

" Get information about current symbol (H)
nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
" Go to definition (g d)
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" Refactor rename (F2)
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" Suggestions (Ctrl-Space)
inoremap <C-Space> <C-x><C-o>

"Tree view (Ctrl-\)
map <C-\> :NERDTreeToggle<CR>

"Commenting
"Toggle comment line/selection (Ctrl-/)
nmap <C-_> <leader>ci
vmap <C-_> <leader>ci
imap <C-_> <C-o><leader>ci

"Airline
"Make sure you install a powerline version of a font. I suggest Hack or Fira Code
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"Pick a nice colour
let g:airline_theme = 'bubblegum'

"CtrlP Fuzzy finder
"Some directories and stuff to skip. Makes it faster if you skip a lot
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn|build)|node_modules|Pods|elm-stuff|target)$',
    \ 'file': '\v\.(exe|so|dll|DS_store|swp)$',
    \ }

"Conque-Shell
"Open a terminal inside of vim (F9)
nmap <F9> :ConqueTermVSplit bash<CR>
