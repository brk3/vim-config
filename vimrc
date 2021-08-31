set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/bad-whitespace'

call plug#end()

" Display incomplete commands
set showcmd

" Dont search as I type
set noincsearch

" Hybrid linenumbers
set relativenumber
set number

" Tabs/Indents
set expandtab
set tabstop=2
set shiftwidth=2

" Line width
set textwidth=100
au FileType gitcommit set tw=72
highlight longLine ctermfg=DarkRed
au BufWinEnter * let w:m2=matchadd('longLine', '\%>100v.\+', -1)

" Dark terminal background
set background=dark

" Search
set nohlsearch
set ignorecase
set smartcase

" Max number of tabs
set tabpagemax=50

" Other
set wrap
set showbreak=…
set linebreak
set vb t_vb=
set modeline
set dictionary=/usr/share/dict/words "CTRL-X_CTRL-K
set spelllang=en_gb
set noswapfile

" Stash backup files in one place
set backup
silent execute '!mkdir ~/.backup 2>/dev/null'
set backupdir=~/.backup/
au BufWritePre * let &bex = '@' . substitute(getcwd(), '/', '%', 'g')

" Status line
set laststatus=2
set ruler

" F2 to toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

:nnoremap <F4> :ToggleBadWhitespace<CR>
:nnoremap <F5> :EraseBadWhitespace<CR>

" S to 'stamp' the current line with yanked text
nnoremap S "_ddP

" CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'gen$\|bin$\|libs$\|\.git$|\target$',
  \ 'file': '\.class$\|\.so$|\.png$',
  \ }

" Gui options
if has("gui_running")
  :set guioptions-=m  "remove menu bar
  :set guioptions-=T  "remove toolbar
  :set guioptions-=r  "remove right-hand scroll bar
  set guifont=Consolas:h14:cANSI
  set lines=40 columns=99
endif

set t_Co=256

" make backspace work like most other apps
set backspace=2

" cursorcolumn
set colorcolumn=100
highlight ColorColumn ctermbg=Gray
