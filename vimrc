set nocompatible

" Vundle
filetype off
if has("unix")
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
else
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
endif
Plugin 'gmarik/vundle'
filetype plugin indent on

" Plugins
" github repos
Plugin 'kien/ctrlp.vim.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'PProvost/vim-ps1'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'lepture/vim-jinja'
Plugin 'hashivim/vim-terraform'

" vim-scripts repos
Plugin 'JavaImp.vim--Lee'
Plugin 'bad-whitespace'
Plugin 'groovyindent-unix'

" Display incomplete commands
set showcmd

" Hybrid linenumbers
set relativenumber
set number

" Tabs/Indents
set expandtab
set tabstop=4
set shiftwidth=4

" Line width
set textwidth=100
au FileType gitcommit set tw=72
highlight longLine ctermfg=DarkRed
au BufWinEnter * let w:m2=matchadd('longLine', '\%>100v.\+', -1)

au BufNewFile,BufRead *.ps1 setf ps1
au BufNewFile,BufRead Vagrantfile setf ruby

" Dark terminal background
set background=dark

" Works fine when you save often
set noswapfile

" Search
set nohlsearch
set ignorecase
set smartcase

" Max number of tabs
set tabpagemax=50

" Other
set wrap
set linebreak
set vb t_vb=
set modeline
set dictionary=/usr/share/dict/words "CTRL-X_CTRL-K
set spelllang=en_gb

" Stash backup files in one place
set backup
silent execute '!mkdir ~/.backup 2>/dev/null'
set backupdir=~/.backup/
au BufWritePre * let &bex = '@' . substitute(getcwd(), '/', '%', 'g')

" Syntax highlighting
syntax on
let java_highlight_all=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let loaded_matchparen = 1
highlight LineNr ctermfg=darkgray
highlight javaComment ctermfg=DarkGreen

" Status line
set laststatus=2
set ruler

" JavaImp plugin
let g:JavaImpPaths=
            \ $ANDROID_HOME . "/sources/android-17," .
            \ $JAVA_HOME . "/src"
let g:JavaImpDataDir = $HOME . "/.JavaImp"
let g:JavaImpDocViewer = "google-chrome"

" F2 to toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

:nnoremap <F4> :ToggleBadWhitespace<CR>
:nnoremap <F5> :EraseBadWhitespace<CR>
:nnoremap <F6> :JavaImpSilent<CR>

" F7 to call clean redundant Java imports and sort them
function JavaImpClean()
    %!$HOME/bin/clean_imports.sh %
    :JavaImpSort
endfunction
:command JavaImpClean exec JavaImpClean()
:nnoremap <F7> :JavaImpClean<CR>

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

" vim-go plugin config
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-terraform config
let g:terraform_align=1
let g:terraform_fmt_on_save=1
autocmd BufNewFile,BufRead *tf   set filetype=terraform
