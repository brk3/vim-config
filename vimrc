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
Plugin 'tpope/vim-repeat.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomasr/molokai'
Plugin 'PProvost/vim-ps1'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'brk3/groovyindent'

" vim-scripts repos
Plugin 'JavaImp.vim--Lee'
Plugin 'taglist.vim'
Plugin 'bad-whitespace'

" Display incomplete commands
set showcmd

" Hybrid linenumbers
set relativenumber
set number

" Tabs/Indents
set expandtab
set tabstop=2
set shiftwidth=2

autocmd FileType java setlocal shiftwidth=4 tabstop=4

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

" \l to list available snippets
nnoremap <leader>l :call UltiSnips_ListSnippets()<CR>

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

" Only set molokai if on proper terminal or gvim
if has("unix") || has("gui_running")
  colorscheme molokai
endif

set noshowmode
set t_Co=256

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

" make backspace work like most other apps
set backspace=2

set colorcolumn=100
