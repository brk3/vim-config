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
Bundle 'gmarik/vundle'
filetype plugin indent on

" Bundles
" github repos
Bundle 'kien/ctrlp.vim.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'vim-ruby/vim-ruby'
Bundle 'tomasr/molokai'
Bundle 'PProvost/vim-ps1'

" vim-scripts repos
Bundle 'JavaImp.vim--Lee'
Bundle 'taglist.vim'
Bundle 'bad-whitespace'

" Display incomplete commands
set showcmd

" Relative linenumbers
set relativenumber

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
